if not lib then return end

local lootedEntities = {}
local search_time = 7000 -- 7 secs..

local Models = {
    -- Scrap Items
    ['scrapItems'] = {
        {prop = 'prop_rub_carwreck_2', loot = 'scrap', chance = 90},
        {prop = 'prop_rub_carwreck_3', loot = 'scrap', chance = 90},
        {prop = 'prop_rub_carwreck_5', loot = 'scrap', chance = 90},
        {prop = 'prop_rub_carwreck_7', loot = 'scrap', chance = 90},
        {prop = 'prop_rub_carwreck_8', loot = 'scrap', chance = 90},
        {prop = 'prop_rub_carwreck_9', loot = 'scrap', chance = 90},
        {prop = 'prop_rub_carwreck_10', loot = 'scrap', chance = 90},
        {prop = 'prop_rub_carwreck_11', loot = 'scrap', chance = 90},
        {prop = 'prop_rub_carwreck_12', loot = 'scrap', chance = 90},
        {prop = 'prop_rub_carwreck_13', loot = 'scrap', chance = 90},
        {prop = 'prop_rub_carwreck_14', loot = 'scrap', chance = 90},
        {prop = 'prop_rub_carwreck_15', loot = 'scrap', chance = 90},
        {prop = 'prop_rub_carwreck_16', loot = 'scrap', chance = 90},
    },
    -- Airport Loot boxen
    ['aircargos'] = {
        {prop = 'prop_air_cargo_01b', loot = 'easy', chance = 90},
    },
    ['airtrailers'] = {
        {prop = 'prop_air_trailer_1a', loot = 'normal', chance = 70},
    },
    ['boxpile'] = {
        {prop = 'prop_boxpile_07d', loot = 'normal', chance = 50},
    },
    ['boxwood'] = {
        {prop = 'prop_box_wood07a', loot = 'rare', chance = 25},
    },
}


local function IsAlreadyLooted(entity)
    local isLooted = false
    if lootedEntities[entity] then isLooted = true end
    return isLooted
end

local function SetIsLooted(entity)
    if not lootedEntities[entity] then lootedEntities[entity] = true end
end

RegisterNetEvent('ox_inventory:resetLootareas', function()
    lootedEntities = {}
end)

local function Loot(entity, lootType)
    TaskTurnPedToFaceEntity(PlayerPedId(), entity, 5000)
    local success = lib.progressCircle({duration = search_time, position = 'bottom', useWhileDead = false, canCancel = false, disable = {car = true}, anim = {dict = 'amb@world_human_gardener_plant@male@base', clip = 'base'}})
    if success then
        SetIsLooted(entity)
        TriggerServerEvent('ox_inventory:lootarea', entity, lootType)
    end 
end

if shared.target then
    for _, props in pairs(Models) do
        for _, v in pairs(props) do
            exports.ox_target:addModel(GetHashKey(v.prop), {
                {
                    icon = 'fas fa-search',
                    label = "Search Area",
                    onSelect = function(data)
                        if IsAlreadyLooted(data.entity) then
                            TriggerEvent('ox_inventory:mods:notify', locale('area_search'), locale('already_been_searched'), "error")
                        else
                            Loot(data.entity, v.loot)
                        end
                    end,
                    canInteract = function(entity, distance, coords, name)
                        return true
                    end,
                    distance = 3.5
                }
            })
        end     
    end
end