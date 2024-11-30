local parkmeter = {}
local robbed = {}
local coolDown = {}
local paid = {}

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

local function SetParkTimer(src, type, pos)
    local coords = GetEntityCoords(GetPlayerPed(src))
    if not parkmeter[src] then
        parkmeter[src] = {}
        if not parkmeter[src][type] then parkmeter[src][type] = {} end
    end
    parkmeter[src][type] = {enable = true, coords = pos}
    SetTimeout(10000, function() parkmeter[src][type].enable = false end)
end

RegisterNetEvent('ox_inventory:payoarkfee', function(pos)
    local src = source
    local Player = server.GetPlayerFromId(src)
    if not Player then return end
    if not robbed[pos] then robbed[pos] = true end
    if exports.ox_inventory:RemoveItem(src, "cash", 5) then
        local coords = GetEntityCoords(GetPlayerPed(src))
        local id = math.random(100000, 999999)
        paid[id] = {coords = pos}
        if #(coords - pos) < 2.5 then robbed[pos] = false end
        TriggerClientEvent('ox_inventory:mods:notify', src, 'Parkmeter', locale('parkmeter_you_paid'), "success")
        SetParkTimer(src, 'park', pos)
        Wait(10 * 60000)
        paid[id] = nil
        TriggerClientEvent('ox_inventory:mods:notify', src, 'Parkmeter', locale('parking_fee_expired'), "error")
    else
        TriggerClientEvent('ox_inventory:mods:notify', src, 'Parkmeter', locale('no_cash'), "error")
    end
end)

RegisterNetEvent('ox_inventory:checkmeter', function(pos)
    local src = source
    local Player = server.GetPlayerFromId(src)
    if Player.PlayerData.job.name == 'police' then
        for k, v in pairs(paid) do
            if #(pos - v.coords) <= 3.0 then
                if parkmeterRobbed[pos] then
                    TriggerClientEvent('ox_inventory:mods:notify', src, 'Parkmeter', locale('parkmeter_is_robbed'), "error")
                elseif not parkmeterRobbed[pos] then
                    TriggerClientEvent('ox_inventory:mods:notify', src, 'Parkmeter', locale('parkmeter_is_paid'), "success")
                else
                    TriggerClientEvent('ox_inventory:mods:notify', src, 'Parkmeter', locale('parkmeter_is_paid'), "success")
                end
            else
                TriggerClientEvent('ox_inventory:mods:notify', src, 'Parkmeter', locale('parkmeter_not_paid'), "error")
            end
        end
    else
        TriggerClientEvent('ox_inventory:mods:notify', src, 'Parkmeter', locale('not_a_cop'), "error")
    end
end)

RegisterNetEvent('ox_inventory:parkmeter-robbery', function(pos)
    local src = source
    local Player = server.GetPlayerFromId(src)
    if Player then
        if not HasCooldown(src, 'parkmeter', pos) then
            if exports.ox_inventory:GetItemCount(src, shared.lockpickItem) >= 1 then
                if robbed[pos] then
                    TriggerClientEvent('ox_inventory:mods:notify', src, 'Parkmeter', locale('parkmeter_is_already_robbed'), "error")
                else
                    robbed[pos] = true
                    exports.ox_inventory:AddItem(src, 'black_money', math.random(1, 15))
                    if math.random() <= 0.2 then exports.ox_inventory:RemoveItem(src, shared.lockpickItem, 1) end
                    CoolDown(src, 'parkmeter', pos)
                end
            else
                TriggerClientEvent('ox_inventory:mods:notify', src, 'Parkmeter', locale('no_item', shared.lockpickItem), "error")
            end
        else
            TriggerClientEvent('ox_inventory:mods:notify', src, 'Parkmeter', locale('cooldown'), "error")
        end
    end
end)