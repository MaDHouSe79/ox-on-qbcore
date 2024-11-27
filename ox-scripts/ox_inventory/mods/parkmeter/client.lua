if not lib then return end

local Parkmeter = {}
Parkmeter.Functions = {}
Parkmeter.Robbed = {}
Parkmeter.Models = {-1940238623, -544726684, 2108567945, 1447355784}

local Utils = require 'modules.utils.client'

function Parkmeter.Functions.PayFee(entity)
	TriggerServerEvent('ox_inventory:payoarkfee', GetEntityCoords(entity))
	return 
end

function Parkmeter.Functions.Lockpick(entity)
	local success = lib.skillCheck({'easy'}, {'1', '2', '3', '4'})
	if success then
		local netId = NetworkGetEntityIsNetworked(entity) and NetworkGetNetworkIdFromEntity(entity)
		if not netId then
			local coords = GetEntityCoords(entity)
			entity = GetClosestObjectOfType(coords.x, coords.y, coords.z, 0.1, GetEntityModel(entity), true, true, true)
			netId = entity ~= 0 and NetworkGetNetworkIdFromEntity(entity)
		end
		if netId then
			client.openInventory('parkmeter', 'parkmeter-'..netId)
		end
	end
end

function Parkmeter.Functions.HasLockpick()
	local count = exports.ox_inventory:Search('count', shared.lockpickItem)
	return (count >= 1)
end

function Parkmeter.Functions.CheckFee(entity)
    lib.callback('ox_inventory:check', false, function(isPaid)
        if isPaid then
            Utils.Notify({title = 'Parking', description = 'Parkeren is betaald!', type = 'success'})
		else
            Utils.Notify({title = 'Parking', description = 'Parkeren is niet betaald!', type = 'error'})
		end
    end, GetEntityCoords(entity))
end

if shared.target then
	-- parkmeter
	exports.ox_target:addModel(Parkmeter.Models, {
        {
            type = "client",
            icon = "fas fa-parking",
            label = locale('pay_park_fee'),
            onSelect = function(data) return Parkmeter.Functions.PayFee(data.entity) end,
            distance = 2
        },
        {
            type = "client",
            icon = "fas fa-parking",
            label = locale('check_fee'),
            groups = "police",
            onSelect = function(data) return Parkmeter.Functions.CheckFee(data.entity) end,
            distance = 2
        },
        {
            type = "client",
            icon = "fas fa-parking",
            label = locale("lockpick"),
            canInteract = Parkmeter.Functions.HasLockpick,
            onSelect = function(data) return Parkmeter.Functions.Lockpick(data.entity) end,
            distance = 2
        }
    })
end

return Parkmeter