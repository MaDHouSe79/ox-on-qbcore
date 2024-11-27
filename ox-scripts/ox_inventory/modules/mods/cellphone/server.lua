if not lib then return end

local Cellphone = {}
Cellphone.Robbed = {}

RegisterNetEvent('ox_inventory:cellphonerobbery', function(pos)
    local src = source
    local Player = server.GetPlayerFromId(src)
    if Player then
        if Cellphone.Robbed[pos] then
            TriggerClientEvent('ox_inventory:mods:notify', src, 'Cellphone', "Deze Telefoon cel is al leeg geroofd!", "error")
        elseif not Cellphone.Robbed[pos] then
            Cellphone.Robbed[pos] = {state = true}
            local amount = math.random(1, 15)
            exports.ox_inventory:AddItem(src, 'black_money', amount)
            if math.random() <= 0.2 then
                exports.ox_inventory:RemoveItem(src, shared.lockpickItem, 1)
            end
        end
    end
end)

return Cellphone