local LootNpc = {}

local RandomItems = {
    {name = "burger"}, 
    {name = "sprunk"}, 
    {name = "paperbag"},
    {name = "panties"},
    {name = "lockpick"}, 
    {name = "armour"},
}

local function LootNpcRandomItems()
    local items = {}
    for i = 1, math.random(1, 3), 1 do
        local item = RandomItems[math.random(1, #RandomItems)]
        items[#items + 1] = {item.name, math.random(1, 3)}
    end
    return items
end

local function OpenMpcInventory(src, entity)
    local items = LootNpcRandomItems()
    local mystash = exports.ox_inventory:CreateTemporaryStash({label = 'Citizen', slots = 5, maxWeight = 5000, items = items})
    TriggerClientEvent('ox_inventory:openInventory', src, 'stash', mystash)
    TriggerClientEvent('ox_inventory:deleteped', -1, entity)
end

RegisterNetEvent('ox_inventory:lootnpc', function(entity)
    OpenMpcInventory(source, entity)
end)