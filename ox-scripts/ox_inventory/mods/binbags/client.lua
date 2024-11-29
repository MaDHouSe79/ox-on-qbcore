local Utils = require 'modules.utils.client'

local binbagModels = {1388415578, -1998455445, 1627301588, -935625561, -675277761, 628215202, 1948359883, 600967813, -375613925, 1813879595, 1388308576, -289082718, 1098827230, 897494494, -1681329307, 1138881502, -1895783233, -1734625067, -819563011}

local function openBinbag(entity)
	TaskTurnPedToFaceEntity(PlayerPedId(), entity, 5000)
	local netId = NetworkGetEntityIsNetworked(entity) and NetworkGetNetworkIdFromEntity(entity)
	if not netId then
		local coords = GetEntityCoords(entity)
		entity = GetClosestObjectOfType(coords.x, coords.y, coords.z, 0.1, GetEntityModel(entity), true, true, true)
		netId = entity ~= 0 and NetworkGetNetworkIdFromEntity(entity)
	end
	if netId then client.openInventory('binbag', 'binbag'..netId) end
end

if shared.target then
	exports.ox_target:addModel(binbagModels, {
        icon = 'fas-solid fa-trash-can',
        label = locale('search_binbag'),
        onSelect = function(data) return openBinbag(data.entity) end,
        distance = 2
	})
end

Utils.Binbags = binbagModels
Utils.OpenBinbag = openBinbag