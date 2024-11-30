if not lib then return end

local Cellphones = {}
Cellphones.Functions = {}
Cellphones.Models = {-78626473, 295857659, 1158960338, -2103798695, 1511539537, 1281992692}

function Cellphones.Functions.Lockpick(entity)
    TaskTurnPedToFaceEntity(PlayerPedId(), entity, 5000)
    local success = lib.skillCheck({'easy'}, {'1', '2', '3', '4'})
    if success then TriggerServerEvent('ox_inventory:cellphone-robbery', GetEntityCoords(entity)) end
end

if shared.target then
    exports.ox_target:addModel(Cellphones.Models, {
        icon = 'fas fa-phone',
        label = locale('lockpick'),
        onSelect = function(data)
            if not shared.useLockpickCellphone then
                return false
            end
            Cellphones.Functions.Lockpick(data.entity)
        end,
        canInteract = function(entity, distance, coords, name)
            if not shared.useLockpickCellphone then
                return false
            end
            return true
        end,
        distance = 2
    })
end

local Utils = require 'modules.utils.client'
Utils.Cellphones = Cellphones.Models
Utils.LockpickCellphones = Cellphones.Functions.Lockpick

return Cellphones