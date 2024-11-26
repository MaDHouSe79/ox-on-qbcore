local config = require 'config'
local state = require 'client.state'
local utils = require 'client.utils'
local fuel = {}


local function exportHandler(exportName, func)
    AddEventHandler(('__cfx_export_%s_%s'):format(string.strsplit('.', exportName, 2)), function(setCB)
        setCB(func or function()
            error(("export '%s' is not supported when using ox_inventory"):format(exportName))
        end)
    end)
end

local function SetFuel(vehicle, fuel)
    if not DoesEntityExist(vehicle) then return end
    if type(fuel) == 'number' and fuel >= 0 and fuel <= 100 then
        Entity(vehicle).state:set('fuel', fuel + 0.0, true)
        SetVehicleFuelLevel(vehicle, fuel + 0.0)
    end
end
exports('SetFuel', SetFuel)

local function GetFuel(vehicle)
    if not DoesEntityExist(vehicle) then return end
    return Entity(vehicle).state.fuel or -1.0
end
exports('GetFuel', GetFuel)

exportHandler('LegacyFuel.SetFuel', function(vehicle, fuel)
    SetFuel(vehicle, fuel)
end)

exportHandler('LegacyFuel.GetFuel', function(vehicle)
    return GetFuel(vehicle)
end)

CreateThread(function()
    -- Fuel consumption
    while true do
        Wait(1000)
		if GetVehiclePedIsIn(PlayerPedId(), false) ~= 0 then
			local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
			if DoesEntityExist(vehicle) and GetPedInVehicleSeat(vehicle, -1) == PlayerPedId() then
				lastVehicle = vehicle
				local currFuel = GetFuel(vehicle)
				if currFuel == -1.0 then
					TriggerServerEvent('ox_fuel:registerVehicle', NetworkGetNetworkIdFromEntity(vehicle))
				elseif IsVehicleEngineOn(vehicle) then
					SetFuel(vehicle, currFuel - config.FuelUsage[Round(GetVehicleCurrentRpm(vehicle), 1)] * (config.FuelClasses[GetVehicleClass(vehicle)] or 1.0) / 10) 
				end
			end
		end
    end
end)

AddEventHandler('onResourceStart', function(resource)
    if resource ~= 'LegacyFuel' then return end
    StopResource(resource)
end)

---@param vehState StateBag
---@param vehicle integer
---@param amount number
---@param replicate? boolean
function fuel.setFuel(vehState, vehicle, amount, replicate)
	if DoesEntityExist(vehicle) then
		amount = math.clamp(amount, 0, 100)
		SetFuel(vehicle, amount)
	end
end

function fuel.getPetrolCan(coords, refuel)
	TaskTurnPedToFaceCoord(cache.ped, coords.x, coords.y, coords.z, config.petrolCan.duration)
	Wait(500)

	if lib.progressCircle({
			duration = config.petrolCan.duration,
			useWhileDead = false,
			canCancel = true,
			disable = {
				move = true,
				car = true,
				combat = true,
			},
			anim = {
				dict = 'timetable@gardener@filling_can',
				clip = 'gar_ig_5_filling_can',
				flags = 49,
			}
		}) then
		if refuel and exports.ox_inventory:GetItemCount('WEAPON_PETROLCAN') then
			return TriggerServerEvent('ox_fuel:fuelCan', true, config.petrolCan.refillPrice)
		end

		TriggerServerEvent('ox_fuel:fuelCan', false, config.petrolCan.price)
	end

	ClearPedTasks(cache.ped)
end

function fuel.startFueling(vehicle, isPump)
	local vehState = Entity(vehicle).state
	local fuelAmount = vehState.fuel or GetVehicleFuelLevel(vehicle)
	local duration = math.ceil((100 - fuelAmount) / config.refillValue) * config.refillTick
	local price, moneyAmount
	local durability = 0

	if 100 - fuelAmount < config.refillValue then
		return lib.notify({ type = 'error', description = locale('tank_full') })
	end

	if isPump then
		price = 0
		moneyAmount = utils.getMoney()

		if config.priceTick > moneyAmount then
			return lib.notify({
				type = 'error',
				description = locale('not_enough_money', config.priceTick)
			})
		end
	elseif not state.petrolCan then
		return lib.notify({ type = 'error', description = locale('petrolcan_not_equipped') })
	elseif state.petrolCan.metadata.ammo <= config.durabilityTick then
		return lib.notify({
			type = 'error',
			description = locale('petrolcan_not_enough_fuel')
		})
	end

	state.isFueling = true

	TaskTurnPedToFaceEntity(cache.ped, vehicle, duration)
	Wait(500)

	CreateThread(function()
		lib.progressCircle({
			duration = duration,
			useWhileDead = false,
			canCancel = true,
			disable = {
				move = true,
				car = true,
				combat = true,
			},
			anim = {
				dict = isPump and 'timetable@gardener@filling_can' or 'weapon@w_sp_jerrycan',
				clip = isPump and 'gar_ig_5_filling_can' or 'fire',
			},
		})

		state.isFueling = false
	end)

	while state.isFueling do
		if isPump then
			price = price + config.priceTick

			if price + config.priceTick >= moneyAmount then
				lib.cancelProgress()
			end
		elseif state.petrolCan then
			durability = durability + config.durabilityTick

			if durability >= state.petrolCan.metadata.ammo then
				lib.cancelProgress()
				durability = state.petrolCan.metadata.ammo
				break
			end
		else
			break
		end

		fuelAmount = fuelAmount + config.refillValue

		if fuelAmount >= 100 then
			state.isFueling = false
			fuelAmount = 100.0
		end

		Wait(config.refillTick)
	end

	ClearPedTasks(cache.ped)

	if isPump then
		TriggerServerEvent('ox_fuel:pay', price, fuelAmount, NetworkGetNetworkIdFromEntity(vehicle))
	else
		TriggerServerEvent('ox_fuel:updateFuelCan', durability, NetworkGetNetworkIdFromEntity(vehicle), fuelAmount)
	end
end

return fuel
