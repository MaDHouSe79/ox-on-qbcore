local Trunk = {}
Trunk.Functions = {}
Trunk.Vehicles = lib.load('data.vehicles')
Trunk.backDoorIds = {2, 3}

function Trunk.Functions.CanAccessTrunk(entity)
    if cache.vehicle or not NetworkGetEntityIsNetworked(entity) then
        return
    end
    local vehicleHash = GetEntityModel(entity)
    local vehicleClass = GetVehicleClass(entity)
    local checkVehicle = Trunk.Vehicles.Storage[vehicleHash]
    if (checkVehicle == 0 or checkVehicle == 1) or
        (not Trunk.Vehicles.trunk[vehicleClass] and not Trunk.Vehicles.trunk.models[vehicleHash]) then
        return
    end
    local doorId = checkVehicle and 4 or 5
    if not Trunk.Vehicles.trunk.boneIndex[vehicleHash] and not GetIsDoorValid(entity, doorId --[[@as number]] ) then
        if vehicleClass ~= 11 and
            (doorId ~= 5 or GetEntityBoneIndexByName(entity, 'boot') ~= -1 or not GetIsDoorValid(entity, 2)) then
            return
        end
        if vehicleClass ~= 11 then
            doorId = Trunk.backDoorIds
        end
    end
    local min, max = GetModelDimensions(vehicleHash)
    local offset = (max - min) * (not checkVehicle and vec3(0.5, 0, 0.5) or vec3(0.5, 1, 0.5)) + min
    offset = GetOffsetFromEntityInWorldCoords(entity, offset.x, offset.y, offset.z)
    if #(GetEntityCoords(cache.ped) - offset) < 1.5 then
        return doorId
    end
end

function Trunk.Functions.OpenTrunk(entity)
    ---@type number | number[] | nil
    local door = Inventory.CanAccessTrunk(entity)
    if not door then
        return
    end
    local coords = GetEntityCoords(entity)
    TaskTurnPedToFaceCoord(cache.ped, coords.x, coords.y, coords.z, 0)
    if not client.openInventory('trunk', {
        netid = NetworkGetNetworkIdFromEntity(entity),
        entityid = entity,
        door = door
    }) then
        return
    end
    if type(door) == 'table' then
        for i = 1, #door do
            SetVehicleDoorOpen(entity, door[i], false, false)
        end
    else
        SetVehicleDoorOpen(entity, door --[[@as number]] , false, false)
    end
end

if shared.target then
    exports.ox_target:addGlobalVehicle({
        icon = 'fas fa-truck-ramp-box',
        label = locale('open_label', locale('storage')),
        distance = 1.5,
        canInteract = Trunk.Functions.CanAccessTrunk,
        onSelect = function(data)
            return Trunk.Functions.OpenTrunk(data.entity)
        end
    })
end

return Trunk
