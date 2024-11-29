
local lootedEntities = {}
local resetTimer = 900 -- 900 -- 15 min
local sendAreaClearMessage = true

local LootItems = {
    ['easy']   = {'water', 'tosti', 'money', 'black_money'},
    ['normal'] = {'beer', 'whiskey', 'vodka', 'money', 'black_money', 'bandage', 'iphone', 'samsungphone', 'rolex', 'diamond_ring', 'goldchain', 'acetone', 'lithium'},
    ['rare']   = {'security_card_01', 'security_card_02', 'meth', 'coke_brick', 'money', 'black_money'},
    ['scrap']  = {'plastic', 'metalscrap', 'copper', 'aluminum', 'iron', 'steel', 'rubber', 'glass', 'money', 'black_money'},
}

local function ResetAreas()
    SetTimeout(resetTimer * 1000, function()
        lootedEntities = {}
        if sendAreaClearMessage then
            TriggerClientEvent('ox_inventory:mods:notify', -1, locale('area_search'), locale('areas_reset'), "success")
            TriggerClientEvent('ox_inventory:resetLootareas', -1)
        end
        ResetAreas()
    end)
end

local function LootRandomItems(lootType)
    local items = {}
    for i = 1, math.random(1, 3), 1 do
        local item = LootItems[lootType][math.random(1, #LootItems[lootType])]
        items[#items + 1] = {item, math.random(1, 3)}
    end
    return items
end

local function OpenInventory(src, entity, lootType)
    if lootedEntities[entity] then
        TriggerClientEvent('ox_inventory:mods:notify', src, locale('area_search'), locale('already_been_searched'), "error")
    elseif not lootedEntities[entity] then 
        lootedEntities[entity] = {}
        local items = LootRandomItems(lootType)
        local mystash = exports.ox_inventory:CreateTemporaryStash({label = locale('area_search'), slots = 10, maxWeight = 120000, items = items})
        TriggerClientEvent('ox_inventory:openInventory', src, 'stash', mystash)
        TriggerClientEvent('ox_inventory:deleteped', -1, entity)
    end
end

RegisterNetEvent('ox_inventory:lootarea', function(entity, lootType)
    local src = source
    OpenInventory(src, entity, lootType)
end)