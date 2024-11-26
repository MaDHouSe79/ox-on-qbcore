if not lib then return end

local Cellphone = {}
Cellphone.Functions = {}

function Cellphone.Functions.Open(entity)
	local success = lib.skillCheck({'easy'}, {'1', '2', '3', '4'})
	if success then
		local netId = NetworkGetEntityIsNetworked(entity) and NetworkGetNetworkIdFromEntity(entity)
		if not netId then
			local coords = GetEntityCoords(entity)
			entity = GetClosestObjectOfType(coords.x, coords.y, coords.z, 0.1, GetEntityModel(entity), true, true, true)
			netId = entity ~= 0 and NetworkGetNetworkIdFromEntity(entity)
		end
		if netId then
			client.openInventory('cellphone', 'cellphone-'..netId)
		end
	end
end

if shared.target then
	Cellphone.Models = {-78626473, 295857659, 1158960338, -2103798695, 1511539537, 1281992692}
	exports.ox_target:addModel(Cellphone.Models, {
        icon = 'fas fa-dumpster',
        label = locale('lockpick'),
        onSelect = function(data) return Cellphone.Functions.Open(data.entity) end,
        distance = 2
	})
end

return Cellphone