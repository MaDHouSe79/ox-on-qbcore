if not lib then return end

local Dumpster = {}
Dumpster.Functions = {}

function Dumpster.Functions.OpenDumpster(entity)
    local netId = NetworkGetEntityIsNetworked(entity) and NetworkGetNetworkIdFromEntity(entity)
	if not netId then
		local coords = GetEntityCoords(entity)
		entity = GetClosestObjectOfType(coords.x, coords.y, coords.z, 0.1, GetEntityModel(entity), true, true, true)
		netId = entity ~= 0 and NetworkGetNetworkIdFromEntity(entity)
	end
	if netId then
		client.openInventory('dumpster', 'dumpster'..netId)
	end
end

if shared.target then
	local DumpsterModels = {218085040, 666561306, -58485588, -206690185, 1511880420, 682791951}
	exports.ox_target:addModel(DumpsterModels, {
        icon = 'fas fa-dumpster',
        label = locale('search_dumpster'),
        onSelect = function(data) return Dumpster.Functions.OpenDumpster(data.entity) end,
        distance = 2
	})
end

return Dumpster