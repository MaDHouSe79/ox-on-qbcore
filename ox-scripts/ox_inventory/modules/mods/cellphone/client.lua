if not lib then return end


local Cellphone = {}
Cellphone.Functions = {}
Cellphone.Models = {-78626473, 295857659, 1158960338, -2103798695, 1511539537, 1281992692}

function Cellphone.Functions.Lockpick(entity)
	local success = lib.skillCheck({'easy'}, {'1', '2', '3', '4'})
	if success then
		local netId = NetworkGetEntityIsNetworked(entity) and NetworkGetNetworkIdFromEntity(entity)
		if not netId then
			local coords = GetEntityCoords(entity)
			entity = GetClosestObjectOfType(coords.x, coords.y, coords.z, 0.1, GetEntityModel(entity), true, true, true)
			netId = entity ~= 0 and NetworkGetNetworkIdFromEntity(entity)
		end
		if netId then
			TriggerServerEvent('ox_inventory:cellphonerobbery', GetEntityCoords(entity))
		end
	end
end

function Cellphone.Functions.HasLockpick()
	local count = exports.ox_inventory:Search('count', shared.lockpickItem)
	return (count >= 1)
end


if shared.target then
	exports.ox_target:addModel(Cellphone.Models, {
        icon = 'fas fa-dumpster',
        label = locale('lockpick'),
		canInteract = Cellphone.Functions.HasLockpick,
        onSelect = function(data) return Cellphone.Functions.Lockpick(data.entity) end,
        distance = 2
	})
end

return Cellphone