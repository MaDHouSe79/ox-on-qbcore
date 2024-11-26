local QBCore = exports['qb-core']:GetCoreObject()
local OutsideVehicles = {}

local function TableContains(tab, val)
    if type(val) == "table" then
        for _, value in ipairs(tab) do if TableContains(val, value) then return true end end
        return false
    else
        for _, value in ipairs(tab) do if value == val then return true end end
    end
    return false
end

local function GetRandomPublicGarage()
    for garageName, garage in pairs(Garages) do
        if garage.type == 'public' then
            return garageName -- return the first garageName
        end
    end
end

QBCore.Functions.CreateCallback("qb-garages:server:GetOutsideVehicle", function(source, cb, plate)
    local src = source
    local pData = QBCore.Functions.GetPlayer(src)
    if not OutsideVehicles[plate] then cb(nil) return end
    MySQL.Async.fetchAll('SELECT * FROM player_vehicles WHERE citizenid = ? and plate = ?', {pData.PlayerData.citizenid, plate}, function(result)
        if result[1] then cb(result[1]) else cb(nil) end
    end)
end)

QBCore.Functions.CreateCallback("qb-garages:server:GetGarageVehicles", function(source, cb, garage, garageType, category)
    local src = source
    local pData = QBCore.Functions.GetPlayer(src)
    if garageType == "public" then -- Public garages give player cars in the garage only
        MySQL.Async.fetchAll('SELECT * FROM player_vehicles WHERE citizenid = ? AND garage = ? AND state = ?', {pData.PlayerData.citizenid, garage, 1}, function(result)
            if result[1] then cb(result) else cb(nil) end
        end)
    elseif garageType == "depot" then -- Depot give player cars that are not in garage only
        MySQL.Async.fetchAll('SELECT * FROM player_vehicles WHERE citizenid = ? AND (state = ? OR garage = ?)', {pData.PlayerData.citizenid, 0, garage}, function(result)
            local tosend = {}
            if result[1] then
                if type(category) == 'table' then
                    if TableContains(category, {'car'}) then
                        category = 'car'
                    elseif TableContains(category, {'plane', 'helicopter'}) then
                        category = 'air'
                    elseif TableContains(category, 'boat') then
                        category = 'sea'
                    end
                end
                for _, vehicle in pairs(result) do
                    if vehicle.depotprice == 0 then vehicle.depotprice = DepotPrice end
                    if category == "air" and (QBCore.Shared.Vehicles[vehicle.vehicle].category == "helicopters" or QBCore.Shared.Vehicles[vehicle.vehicle].category == "planes") then
                        tosend[#tosend + 1] = vehicle
                    elseif category == "sea" and QBCore.Shared.Vehicles[vehicle.vehicle].category == "boats" then
                        tosend[#tosend + 1] = vehicle
                    elseif category == "car" and QBCore.Shared.Vehicles[vehicle.vehicle].category ~= "helicopters" and
                        QBCore.Shared.Vehicles[vehicle.vehicle].category ~= "planes" and
                        QBCore.Shared.Vehicles[vehicle.vehicle].category ~= "boats" then
                        tosend[#tosend + 1] = vehicle
                    end
                end
                cb(tosend)
            else
                cb(nil)
            end
        end)
    else -- House give all cars in the garage, Job and Gang depend of config
        local shared = ''
        if not TableContains(SharedJobGarages, garage) and garageType ~= "house" then shared = " AND citizenid = '" .. pData.PlayerData.citizenid .. "'" end
        MySQL.Async.fetchAll('SELECT * FROM player_vehicles WHERE garage = ? AND state = ?' .. shared, {garage, 1}, function(result)
            if result[1] then cb(result) else cb(nil) end
        end)
    end
end)

QBCore.Functions.CreateCallback("qb-garages:server:checkOwnership", function(source, cb, plate, type, house, gang)
    local src = source
    local pData = QBCore.Functions.GetPlayer(src)
    if type == "public" then -- Public garages only for player cars
        MySQL.query('SELECT * FROM player_vehicles WHERE plate = ? AND citizenid = ?', {plate, pData.PlayerData.citizenid}, function(result)
            if result[1] then cb(true) else cb(false) end
        end)
    elseif type == "house" then -- House garages only for player cars that have keys of the house
        MySQL.query('SELECT * FROM player_vehicles WHERE plate = ?', {plate}, function(result)
            if result[1] then cb(true) else cb(false) end
        end)
    elseif type == "gang" then -- Gang garages only for gang members cars (for sharing)
        MySQL.query('SELECT * FROM player_vehicles WHERE plate = ?', {plate}, function(result)
            if result[1] then
                -- Check if found owner is part of the gang
                local resultplayer = MySQL.single.await('SELECT * FROM players WHERE citizenid = ?', {result[1].citizenid})
                if resultplayer then
                    local playergang = json.decode(resultplayer.gang)
                    if playergang.name == gang then cb(true) else cb(false) end
                else
                    cb(false)
                end
            else
                cb(false)
            end
        end)
    else -- Job garages only for cars that are owned by someone (for sharing and service) or only by player depending of config
        local shared = ''
        if not SharedGarages then shared = " AND citizenid = '" .. pData.PlayerData.citizenid .. "'" end
        MySQL.query('SELECT * FROM player_vehicles WHERE plate = ?' .. shared, {plate}, function(result)
            if result[1] then cb(true) else cb(false) end
        end)
    end
end)

QBCore.Functions.CreateCallback("qb-garages:server:GetVehicleProperties", function(source, cb, plate)
    local properties = {}
    local result = MySQL.Sync.fetchAll('SELECT mods FROM player_vehicles WHERE plate = ?', {plate})
    if result[1] then properties = json.decode(result[1].mods) end
    cb(properties)
end)

QBCore.Functions.CreateCallback("qb-garage:server:GetOutsideVehicles", function(source, cb)
    local ply = QBCore.Functions.GetPlayer(source)
    local citizenId = ply.PlayerData.citizenid
    if OutsideVehicles[citizenId] and next(OutsideVehicles[citizenId]) then
        cb(OutsideVehicles[citizenId])
    else
        cb({})
    end
end)

QBCore.Functions.CreateCallback("qb-garages:server:checkVehicleOwner", function(source, cb, plate)
    local src = source
    local pData = QBCore.Functions.GetPlayer(src)
    MySQL.Async.fetchAll('SELECT * FROM player_vehicles WHERE plate = ? AND citizenid = ?', {plate, pData.PlayerData.citizenid}, function(result)
        if result[1] then cb(true, result[1].balance) else cb(false) end
    end)
end)

QBCore.Functions.CreateCallback('qb-garages:server:GetPlayerVehicles', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    local Vehicles = {}
    MySQL.Async.fetchAll('SELECT * FROM player_vehicles WHERE citizenid = ?', {Player.PlayerData.citizenid}, function(result)
        if result[1] then
            for k, v in pairs(result) do
                local VehicleData = QBCore.Shared.Vehicles[v.vehicle]
                if not VehicleData then goto continue end

                local VehicleGarage = Lang:t("error.no_garage")
                if v.garage ~= nil then
                    if Garages[v.garage] ~= nil then
                        VehicleGarage = Garages[v.garage].label
                    elseif HouseGarages[v.garage] then
                        VehicleGarage = HouseGarages[v.garage].label
                    end
                end

                if v.state == 0 then
                    v.state = Lang:t("status.out")
                elseif v.state == 1 then
                    v.state = Lang:t("status.garaged")
                elseif v.state == 2 then
                    v.state = Lang:t("status.impound")
                elseif v.state == 3 then -- <--- ADD HERE
                    v.state = Lang:t('status.parked')
                end

                local fullname
                if VehicleData["brand"] ~= nil then
                    fullname = VehicleData["brand"] .. " " .. VehicleData["name"]
                else
                    fullname = VehicleData["name"]
                end
                Vehicles[#Vehicles + 1] = {
                    fullname = fullname,
                    brand = VehicleData["brand"],
                    model = VehicleData["name"],
                    plate = v.plate,
                    garage = VehicleGarage,
                    state = v.state,
                    fuel = v.fuel,
                    engine = v.engine,
                    body = v.body,
                    hastrailer = v.hastrailer,
                    trailerdata = json.decode(v.trailerdata)
                }
                ::continue::
            end
            cb(Vehicles)
        else
            cb(nil)
        end
    end)

end)

QBCore.Commands.Add("restorelostcars", "Restores cars that were parked in a grage that no longer exists in the config or is invalid (name change or removed).",{{name = "destination_garage", help = "(Optional) Garage where the cars are being sent to."}}, false, function(source, args)
    local src = source
    if next(Garages) ~= nil then
        local destinationGarage = args[1] and args[1] or GetRandomPublicGarage()
        if Garages[destinationGarage] == nil then
            TriggerClientEvent('QBCore:Notify', src, 'Invalid garage name provided', 'error', 4500)
            return
        end

        local invalidGarages = {}
        MySQL.Async.fetchAll('SELECT garage FROM player_vehicles', function(result)
            if result[1] then
                for _, v in ipairs(result) do
                    if Garages[v.garage] == nil then
                        if v.garage then
                            invalidGarages[v.garage] = true
                        end
                    end
                end
                for garage, _ in pairs(invalidGarages) do
                    MySQL.Async.execute('UPDATE player_vehicles set garage = ? WHERE garage = ?', {destinationGarage, garage})
                end
                MySQL.Async.execute('UPDATE player_vehicles set garage = ? WHERE garage IS NULL OR garage = \'\'', {destinationGarage})
            end
        end)
    end
end, RestoreCommandPermissionLevel)

AddEventHandler('onResourceStart', function(resource)
    if resource == GetCurrentResourceName() then
        Wait(100)
        if AutoRespawn then
            MySQL.Async.execute('UPDATE player_vehicles SET state = 1 WHERE state = 0', {})
        end
    end
end)

RegisterNetEvent('qb-garages:server:PayDepotPrice', function(data)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local cashBalance = Player.PlayerData.money["cash"]
    local bankBalance = Player.PlayerData.money["bank"]
    local vehicle = data.vehicle
    MySQL.Async.fetchAll('SELECT * FROM player_vehicles WHERE plate = ?', {vehicle.plate}, function(result)
        if result[1] then
            local depotPrice = result[1].depotprice ~= 0 and result[1].depotprice or DepotPrice
            if cashBalance >= depotPrice then
                Player.Functions.RemoveMoney("cash", depotPrice, "paid-depot")
            elseif bankBalance >= depotPrice then
                Player.Functions.RemoveMoney("bank", depotPrice, "paid-depot")
            else
                TriggerClientEvent('QBCore:Notify', src, Lang:t("error.not_enough"), 'error')
            end
        end
    end)
end)

RegisterNetEvent('qb-garages:server:updateVehicle', function(state, fuel, engine, body, plate, garage)
    MySQL.Async.execute('UPDATE player_vehicles SET state = ?, garage = ?, fuel = ?, engine = ?, body = ? WHERE plate = ?', {state, garage, fuel, engine, body, plate})
end)

RegisterNetEvent('qb-garages:server:updateVehicleState', function(state, plate)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    MySQL.update('UPDATE player_vehicles SET state = ?, depotprice = ? WHERE plate = ? AND citizenid = ?', { state, 0, plate, Player.PlayerData.citizenid })
end)

RegisterNetEvent('qb-garages:server:UpdateOutsideVehicles', function(Vehicles)
    local src = source
    local ply = QBCore.Functions.GetPlayer(src)
    local citizenId = ply.PlayerData.citizenid
    OutsideVehicles[citizenId] = Vehicles
end)