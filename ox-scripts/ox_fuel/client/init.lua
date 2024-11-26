local config = require 'config'

if not config then return end

SetFuelConsumptionState(true)
SetFuelConsumptionRateMultiplier(config.globalFuelConsumptionRate)

AddTextEntry('fuelHelpText', locale('fuel_help'))
AddTextEntry('petrolcanHelpText', locale('petrolcan_help'))
AddTextEntry('fuelLeaveVehicleText', locale('leave_vehicle'))
AddTextEntry('ox_fuel_station', locale('fuel_station_blip'))

local utils = require 'client.utils'
local state = require 'client.state'
local fuel  = require 'client.fuel'

require 'client.stations'

if config.ox_target then return require 'client.target' end

RegisterCommand('startfueling', function()
	if state.isFueling or cache.vehicle or lib.progressActive() then return end
	local petrolCan = config.petrolCan.enabled and GetSelectedPedWeapon(cache.ped) == 'WEAPON_PETROLCAN'
	local playerCoords = GetEntityCoords(cache.ped)
	local nearestPump = state.nearestPump
	if nearestPump then
		local moneyAmount = utils.getMoney()
		if petrolCan and moneyAmount >= config.petrolCan.refillPrice then return fuel.getPetrolCan(nearestPump, true) end
		local vehicleInRange = state.lastVehicle and #(GetEntityCoords(state.lastVehicle) - playerCoords) <= 3
		if not vehicleInRange then
			if not config.petrolCan.enabled then return end
			if moneyAmount >= config.petrolCan.price then return fuel.getPetrolCan(nearestPump) end
			return lib.notify({ type = 'error', description = locale('petrolcan_cannot_afford') })
		elseif moneyAmount >= config.priceTick then
			return fuel.startFueling(state.lastVehicle, true)
		else
			return lib.notify({ type = 'error', description = locale('refuel_cannot_afford') })
		end
		return lib.notify({ type = 'error', description = locale('vehicle_far') })
	elseif petrolCan then
		local vehicle = utils.getVehicleInFront()
		if vehicle and DoesVehicleUseFuel(vehicle) then
			local boneIndex = utils.getVehiclePetrolCapBoneIndex(vehicle)
			local fuelcapPosition = boneIndex and GetWorldPositionOfEntityBone(vehicle, boneIndex)
			if fuelcapPosition and #(playerCoords - fuelcapPosition) < 1.8 then return fuel.startFueling(vehicle, false) end
			return lib.notify({ type = 'error', description = locale('vehicle_far') })
		end
	end
end)

RegisterKeyMapping('startfueling', 'Fuel vehicle', 'keyboard', 'e')
TriggerEvent('chat:removeSuggestion', '/startfueling')