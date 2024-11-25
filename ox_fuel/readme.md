# Ox-Fuel v1.5.1

# Replace Code
- in `ox_fuel/client/init.lua` around line 49 
```lua
if cache.seat == -1 then 
    --CreateThread(startDrivingVehicle) 
end
```

- Place this code in `ox_fuel/client/fuel.lua`
```lua
local function exportHandler(exportName, func)
    AddEventHandler(('__cfx_export_%s_%s'):format(string.strsplit('.', exportName, 2)), function(setCB)
        setCB(func or function()
            error(("export '%s' is not supported when using ox_inventory"):format(exportName))
        end)
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

exportHandler('LegacyFuel.SetFuel', function(vehicle, fuel)
    SetFuel(vehicle, fuel)
end)

exportHandler('LegacyFuel.GetFuel', function(vehicle)
    return GetFuel(vehicle)
end)

CreateThread(function()
    -- Fuel consumption
    while true do
        Wait(1000)
        if GetVehiclePedIsIn(PlayerPedId(), false) ~= 0 then
            local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
            if DoesEntityExist(vehicle) and GetPedInVehicleSeat(vehicle, -1) == PlayerPedId() then
                local currFuel = GetFuel(vehicle)
                if currFuel == -1.0 then
                    TriggerServerEvent('ox_fuel:registerVehicle', NetworkGetNetworkIdFromEntity(vehicle))
                elseif IsVehicleEngineOn(vehicle) then
                    SetFuel(vehicle, currFuel - config.FuelUsage[Round(GetVehicleCurrentRpm(vehicle), 1)] * (config.FuelClasses[GetVehicleClass(vehicle)] or 1.0) / 10)
                end
            end
        end
    end
end)

AddEventHandler('onResourceStart', function(resource)
    if resource ~= 'LegacyFuel' then return end
    StopResource(resource)
end)
```

# Add Code
- in `ox_fuel/server.lua` around line 38
```lua
RegisterNetEvent('ox_fuel:registerVehicle', function(netid)
    local entity = NetworkGetEntityFromNetworkId(netid)
    if entity ~= 0 then Entity(entity).state.fuel = math.random(40, 60) end
end)
```
