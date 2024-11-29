local robbed = {}
local coolDown = {}

local function CoolDown(src, type, pos)
	local coords = GetEntityCoords(GetPlayerPed(src))
    if not coolDown[src] then
        coolDown[src] = {}
        if not coolDown[src][type] then coolDown[src][type] = {} end
    end
	coolDown[src][type] = {enable = true, coords = pos}
    SetTimeout(10000, function() coolDown[src][type].enable = false end)
end

local function HasCooldown(src, type, pos)
    local coords = GetEntityCoords(GetPlayerPed(src))
    if coolDown[src] and coolDown[src][type] and coolDown[src][type].enable then
        local distance = #(coords - coolDown[src][type].coords)
        if distance < 2.0 then return true end
    end
    return false
end

RegisterNetEvent('ox_inventory:cellphone-robbery', function(pos)
    local src = source
    local Player = server.GetPlayerFromId(src)
    if Player then
        if not HasCooldown(src, 'cellphone', pos) then
            if exports.ox_inventory:GetItemCount(src, shared.lockpickItem) >= 1 then
                if robbed[pos] then
                    TriggerClientEvent('ox_inventory:mods:notify', src, 'Cellphone', locale('cellpgone_already_robbed'), "error")
                elseif not robbed[pos] then
                    robbed[pos] = true
                    exports.ox_inventory:AddItem(src, 'black_money', math.random(1, 15))
                    if math.random() <= 0.2 then exports.ox_inventory:RemoveItem(src, shared.lockpickItem, 1) end
                    CoolDown(src, 'cellphone', pos)
                end
            else
                TriggerClientEvent('ox_inventory:mods:notify', src, 'Parkmeter', locale('no_item', shared.lockpickItem), "error")
            end
        else
            TriggerClientEvent('ox_inventory:mods:notify', src, 'Cellphone Robbery', locale('cooldown'), "error")
        end
    end
end)