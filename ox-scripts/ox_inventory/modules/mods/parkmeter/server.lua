if not lib then return end

local Parkmeter = {}
Parkmeter.Paid = {}
Parkmeter.Cooldown = 10
Parkmeter.Robbed = {}

RegisterNetEvent('ox_inventory:payoarkfee', function(pos)
    local src = source
    local Player = server.GetPlayerFromId(src)
    if not Player then return end
    if not Parkmeter.Robbed[pos] then Parkmeter.Robbed[pos] = false end
    if exports.ox_inventory:RemoveItem(src, "cash", 5) then
        local id = math.random(10000, 99999)
        Parkmeter.Paid[id] = {coords = pos}
        Parkmeter.Robbed[pos] = false
        TriggerClientEvent('ox_inventory:mods:notify', src, 'Parking', "U heeft parkeergeld betaald!", "success")
        Wait(Parkmeter.Cooldown * 60000)
        Parkmeter.Paid[id] = nil
        TriggerClientEvent('ox_inventory:mods:notify', src, 'Parking', "Parkeergeld is verlopen!", "error")
    else
        TriggerClientEvent('ox_inventory:mods:notify', src, 'Parking', "Je hebt niet genoeg contant geld!", "error")
    end
end)

RegisterNetEvent('ox_inventory:parkmeterrobbery', function(pos)
    local src = source
    local Player = server.GetPlayerFromId(src)
    if Player then
        if Parkmeter.Robbed[pos] then
            TriggerClientEvent('ox_inventory:mods:notify', src, 'Parking', "Deze meter is al leeg geroofd!", "error")
        elseif not Parkmeter.Robbed[pos] then
            Parkmeter.Robbed[pos] = {state = true}
            local amount = math.random(1, 15)
            exports.ox_inventory:AddItem(src, 'black_money', amount)
            if math.random() <= 0.2 then
                exports.ox_inventory:RemoveItem(src, shared.lockpickItem, 1)
            end
        end
    end
end)

RegisterNetEvent('ox_inventory:checkmeter', function(pos)
    local src = source
    local Player = server.GetPlayerFromId(src)
    if Player.PlayerData.job.name == 'police' then
        for k, v in pairs(Parkmeter.Paid) do 
            if #(pos - v.coords) <= 3.0 then
                if Parkmeter.Robbed[pos] then
                    TriggerClientEvent('ox_inventory:mods:notify', src, 'Parking', "Deze meter is leeg geroofd!", "error")
                else
                    TriggerClientEvent('ox_inventory:mods:notify', src, 'Parking', "Deze meter is betaald!", "error")
                end
            else
                TriggerClientEvent('ox_inventory:mods:notify', src, 'Parking', "Deze meter is niet betaald!", "error")
            end 
        end
    else
        TriggerClientEvent('ox_inventory:mods:notify', src, 'Parking', "Je bent geen agent!", "error")
    end
end)


return Parkmeter