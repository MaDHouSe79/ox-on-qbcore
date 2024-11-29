
local Utils = require 'modules.utils.client'

local dumpsterModels = {1437508529, 218085040, 666561306, -58485588, -206690185, 1511880420, 682791951}

local function openDumpster(entity)
	TaskTurnPedToFaceEntity(PlayerPedId(), entity, 5000)
	local netId = NetworkGetEntityIsNetworked(entity) and NetworkGetNetworkIdFromEntity(entity)
	if not netId then
		local coords = GetEntityCoords(entity)
		entity = GetClosestObjectOfType(coords.x, coords.y, coords.z, 0.1, GetEntityModel(entity), true, true, true)
		netId = entity ~= 0 and NetworkGetNetworkIdFromEntity(entity)
	end
	if netId then client.openInventory('dumpster', 'dumpster'..netId) end
end

if shared.target then
	exports.ox_target:addModel(dumpsterModels, {
        icon = 'fas fa-dumpster',
        label = locale('search_dumpster'),
        onSelect = function(data) return openDumpster(data.entity) end,
        distance = 2
	})
end

Utils.Dumpsters = dumpsterModels
Utils.OpenDumpster = openDumpster