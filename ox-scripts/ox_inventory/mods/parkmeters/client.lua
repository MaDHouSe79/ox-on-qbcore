if not lib then return end

local Parkmeters = {}
Parkmeters.Functions = {}
Parkmeters.Models = {-1940238623, -544726684, 2108567945, 1447355784}

function Parkmeters.Functions.Lockpick(entity)
	TaskTurnPedToFaceEntity(PlayerPedId(), entity, 5000)
	local success = lib.skillCheck({'easy'}, {'1', '2', '3', '4'})
	if success then TriggerServerEvent('ox_inventory:parkmeter-robbery', GetEntityCoords(entity)) end
end

if shared.target then
	exports.ox_target:addModel(Parkmeters.Models, {
		{
			type = "client",
			icon = "fas fa-parking",
			label = locale('pay_park_fee'),
			onSelect = function(data)
				TriggerServerEvent('ox_inventory:payoarkfee', GetEntityCoords(data.entity))
			end,
			canInteract = function(entity, distance, coords, name)
                if not shared.useParkmeterFee then return false end
                return true
            end,
			distance = 2
		}, {
			type = "client",
			icon = "fas fa-parking",
			label = locale("lockpick"),
            onSelect = function(data)
                if not shared.useLockpickParkmeter then return false end
				Parkmeters.Functions.Lockpick(data.entity)
            end,

            canInteract = function(entity, distance, coords, name)
                if not shared.useLockpickParkmeter then return false end
                return true
            end,

			distance = 2
		}
	})
end

local Utils = require 'modules.utils.client'
Utils.Parkmeters = Parkmeters.Models
Utils.LockpickParkmeter = Parkmeters.Functions.Lockpick

return Parkmeters