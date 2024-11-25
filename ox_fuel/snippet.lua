local function exportHandler(exportName, func)
    AddEventHandler(('__cfx_export_LegacyFuel_%s'):format(exportName), function(cb)
        cb(func)
    end)
end

local function SetFuel(vehicle, fuel)
    if not DoesEntityExist(vehicle) then return end
    if type(fuel) == 'number' and fuel >= 0 and fuel <= 100 then
        Entity(vehicle).state:set('fuel', fuel + 0.0, true)
        SetVehicleFuelLevel(vehicle, fuel + 0.0)
    end
end
exports('SetFuel', SetFuel)

local function GetFuel(vehicle)
    if not DoesEntityExist(vehicle) then return end
    return Entity(vehicle).state.fuel or -1.0
end
exports('GetFuel', GetFuel)

exportHandler('SetFuel', function(vehicle, fuel)
    SetFuel(vehicle, fuel)
end)

exportHandler('GetFuel', function(vehicle)
    return GetFuel(vehicle)
end)

AddEventHandler('onResourceStart', function(resource)
    if resource ~= 'LegacyFuel' then return end
    StopResource(resource)
end)