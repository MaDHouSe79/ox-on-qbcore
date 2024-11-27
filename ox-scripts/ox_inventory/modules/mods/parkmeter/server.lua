if not lib then return end

-- parkmeter
local Parkmeter = {}
Parkmeter.Paid = {}
Parkmeter.Cooldown = 10
Parkmeter.Robbed = {}
Parkmeter.LockpickItem = shared.lockpickItem

RegisterNetEvent('ox_inventory:payoarkfee', function(pos)
    local src = source
    local Player = server.GetPlayerFromId(src)
    if not Player then return end
    if not Parkmeter.Robbed[pos] then Parkmeter.Robbed[pos] = {state = false} end
    if exports.ox_inventory:RemoveItem(src, "cash", 5) then
        local id = math.random(10000, 99999)
        Parkmeter.Paid[id] = {coords = pos}
        Parkmeter.Robbed[pos] = {state = false}
        lib.notify(src, 'Parking', "U heeft parkeergeld betaald!", "success")
        Wait(Parkmeter.Cooldown * 60000)
        Parkmeter.Paid[id] = nil
        lib.notify(src, 'Parking', "Parkeergeld is verlopen!", "error")
    else
        lib.notify(src, 'Parking', "Je hebt niet genoeg contant geld!", "error")
    end
end)

RegisterNetEvent('ox_inventory:steal', function(pos)
    local src = source
    local Player = server.GetPlayerFromId(src)
    if Player then
        if Parkmeter.Robbed[pos] then
            lib.notify(src, 'Parking', "Deze meter is al leeg geroofd!", "error")
        elseif not Parkmeter.Robbed[pos] then
            Parkmeter.Robbed[pos] = {state = true}
            local amount = math.random(1, 15)
            exports.ox_inventory:AddItem(src, 'black_money', amount)
            if math.random() <= 0.2 then
                exports.ox_inventory:RemoveItem(src, Parkmeter.LockpickItem, 1)
            end
        end
    end
end)

lib.callback.register('ox_inventory:check', function(source, pos)
    for k, v in pairs(Parkmeter.Paid) do if #(pos - v.coords) <= 3 then return true end end
    return false
end)


return Parkmeter