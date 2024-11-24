# Install OX_inventory v2.43.3 for qb-core
- You need all the files except `empty.lua`, no support, just read the files.....

# --------------------- Folder example ---------------------
- `ox_inventory/init.lua`
- `ox_inventory/setup/convert.lua`
- `ox_inventory/modules/bridge/qb/client.lua`
- `ox_inventory/modules/bridge/qb/server.lua`


# ---------- ox_inventory ----------
# Items
```lua
['cash'] = {
    label = 'Cash',
},

['black_money'] = {
    label = 'Dirty Money',
},

['crypto'] = {
    label = 'Crypto',
},
```

# Add code
- in `ox_inventory/server.lua`
```lua
AddEventHandler('onResourceStart', function(resource)
    if resource == GetCurrentResourceName() then
        MySQL.Async.fetchAll("SELECT * FROM players", function(rs)
            for k, v in pairs(rs) do
                local list = json.decode(v.money)
                if not list['black_money'] then
                    list['black_money'] = 0
                    MySQL.update.await('UPDATE players SET money = ? WHERE citizenid = ?', {json.encode(list), v.citizenid})
                end
            end
        end)
    end
end)
```


# Add code
- in `ox_inventory/server.lua` around line 183
```lua
elseif invType == 'apartment' then
    right = Inventory(data)
    if not right then
        right = Inventory.Create(data, data:gsub("^%l", string.upper), invType, 15, 0, 100000, false)
    end
    
elseif invType == 'house' then
    right = Inventory(data)
    if not right then
        right = Inventory.Create(data, data:gsub("^%l", string.upper), invType, 15, 0, 100000, false)
    end
```


# ---------- qb-apartments ----------
# Replace code
- in `qb-apartments/server/main.lua` around line 61
```lua
RegisterNetEvent('apartments:server:openStash', function(CurrentApartment)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    exports.ox_inventory:forceOpenInventory(src, 'apartment', CurrentApartment)
end)
```


# ---------- qb-banking ----------
# Add code 
- in `qb-banking/config.lua`
```lua
Config.inventory = "ox_inventory"
```

# Replace code
- in `qb-banking/server.lua` around line 185
```lua
QBCore.Functions.CreateCallback('qb-banking:server:openATM', function(source, cb)
    local src = source
    local Player, citizenid = getPlayerAndCitizenId(src)
    if not Player or not citizenid then return end
    local bankCards = Player.Functions.GetItemsByName('bank_card')
    if not bankCards then return TriggerClientEvent('QBCore:Notify', src, Lang:t('error.card'), 'error') end
    local acceptablePins = {}
    if Config.inventory == 'ox_inventory' then
        for _, bankCard in ipairs(bankCards) do acceptablePins[#acceptablePins + 1] = bankCard.metadata.cardPin end   
    elseif Config.inventory == 'qb-inventory' then
        for _, bankCard in ipairs(bankCards) do acceptablePins[#acceptablePins + 1] = bankCard.info.cardPin end    
    end
    local job = Player.PlayerData.job
    local gang = Player.PlayerData.gang
    local accounts = {}
    accounts[#accounts + 1] = { account_name = 'checking', account_type = 'checking', account_balance = Player.PlayerData.money.bank }
    for accountName, accountInfo in pairs(Accounts) do
        if accountInfo.citizenid == citizenid then
            accounts[#accounts + 1] = accountInfo
        end
        if accountInfo.users and string.find(accountInfo.users, citizenid) then
            accounts[#accounts + 1] = accountInfo
        end
        if (accountName == job.name and job.isboss) or (accountName == gang.name and gang.isboss) then
            accounts[#accounts + 1] = accountInfo
        end
    end
    cb(accounts, Player.PlayerData, acceptablePins)
end)
```

# Replace code
- in `qb-banking/server.lua` around line 342
```lua
QBCore.Functions.CreateCallback('qb-banking:server:orderCard', function(source, cb, data)
    local src = source
    local Player, citizenid = getPlayerAndCitizenId(src)
    if not Player or not citizenid then return cb({ success = false, message = Lang:t('error.error') }) end
    local cardNumber = math.random(1000000000000000, 9999999999999999)
    local pinNumber = tonumber(data.pin)
    if not pinNumber then return cb({ success = false, message = Lang:t('error.pin') }) end
    local info = {
        citizenid = citizenid,
        name = Player.PlayerData.charinfo.firstname .. ' ' .. Player.PlayerData.charinfo.lastname,
        cardNumber = cardNumber,
        cardPin = pinNumber,
    }
    if Config.inventory == 'ox_inventory' then
        exports.ox_inventory:AddItem(src, 'bank_card', 1, info)
    elseif Config.inventory == 'qb-inventory' then
        exports['qb-inventory']:AddItem(src, 'bank_card', 1, false, info, 'qb-banking:server:orderCard')
    end
    cb({ success = true, message = Lang:t('success.card') })
end)
```


# ---------- qb-housing ----------
# Add code 
- in `qb-houses/config.lua`
```lua
Config.inventory = "ox_inventory"
```

# Replace code
- in `qb-houses/server/main.lua` around line 220
```lua
RegisterNetEvent('qb-houses:server:openStash', function(CurrentHouse)
    local src = source
    local houseData = Config.Houses[CurrentHouse]
    if not houseData then return end
    local houseTier = houseData.tier
    local stashSlots = Config.StashWeights[houseTier].slots
    local stashWeight = Config.StashWeights[houseTier].maxweight
    if stashSlots and stashWeight then
        if Config.Inventory == "ox_inventory" then
            exports.ox_inventory:forceOpenInventory(src, 'house', CurrentHouse)
        elseif Config.Inventory == "qb-inventory" then
            exports['qb-inventory']:OpenInventory(src, CurrentHouse, {
                maxweight = stashWeight,
                slots = stashSlots,
                label = houseData.adress
            })            
        end
    else
        if Config.Inventory == "ox_inventory" then
            exports.ox_inventory:forceOpenInventory(src, 'house', CurrentHouse)
        elseif Config.Inventory == "qb-inventory" then
            exports['qb-inventory']:OpenInventory(src, CurrentHouse)
        end
    end
end)
```


# ---------- qb-hub ----------
# Add Code
- in top of `qb-hud/client.lua` around line 15
```lua
local blackAmount = 0
local cryptoAmount = 0
```

# Replace code 
- in `qb-hud/client.lua` around line 863
```lua
RegisterNetEvent('hud:client:ShowAccounts', function(type, amount)
    if amount == nil then amount = 0 end
    if type == 'cash' then
        SendNUIMessage({
            action = 'show',
            type = 'cash',
            cash = Round(amount)
        })
    elseif type == 'black_money' then
        SendNUIMessage({
            action = 'show',
            type = 'blackmoney',
            blackmoney = Round(amount)
        })
    elseif type == 'crypto' then
        SendNUIMessage({
            action = 'show',
            type = 'crypto',
            crypto = Round(amount)
        })
    else
        SendNUIMessage({
            action = 'show',
            type = 'bank',
            bank = Round(amount)
        })
    end
end)
```

# Replace code 
- in `qb-hud/client.lua` around line 886
```lua
RegisterNetEvent('hud:client:OnMoneyChange', function(type, amount, isMinus)
    cashAmount = PlayerData.money['cash']
    bankAmount = PlayerData.money['bank']
    blackAmount = PlayerData.money['black_money']
    cryptoAmount = PlayerData.money['crypto']
    SendNUIMessage({
        action = 'updatemoney',
        cash = Round(cashAmount),
        bank = Round(bankAmount),
        blackmoney = Round(blackAmount),
        crypto = Round(cryptoAmount),
        amount = Round(amount),
        minus = isMinus,
        type = type
    })
end)
```

# Replace code 
- in `qb-hud/html/app.js` around line 622
```js
// MONEY HUD
const moneyHud = Vue.createApp({
    data() {
        return {
            cash: 0,
            bank: 0,
            blackmoney: 0,
            crypto: 0,
            amount: 0,
            plus: false,
            minus: false,
            showCash: false,
            showBank: false,
            showBlack: false,
            showCrypto: false,
            showUpdate: false,
        };
    },
    destroyed() {
        window.removeEventListener("message", this.listener);
    },
    mounted() {
        this.listener = window.addEventListener("message", (event) => {
            switch (event.data.action) {
                case "showconstant":
                    this.showConstant(event.data);
                    break;
                case "updatemoney":
                    this.update(event.data);
                    break;
                case "show":
                    this.showAccounts(event.data);
                    break;
            }
        });
    },
    methods: {
        // CONFIGURE YOUR CURRENCY HERE
        // https://www.w3schools.com/tags/ref_language_codes.asp LANGUAGE CODES
        // https://www.w3schools.com/tags/ref_country_codes.asp COUNTRY CODES
        formatMoney(value) {
            const formatter = new Intl.NumberFormat("en-US", {
                style: "currency",
                currency: "USD",
                minimumFractionDigits: 0,
            });
            return formatter.format(value);
        },
        showConstant(data) {
            this.showCash = true;
            this.showBank = true;
            this.showBlack = true;
            this.showCrypto = true;
            this.cash = data.cash;
            this.bank = data.bank;
            this.blackmoney = data.blackmoney;
            this.crypto = data.crypto;
        },
        update(data) {
            this.showUpdate = true;
            this.amount = data.amount;
            this.bank = data.bank;
            this.cash = data.cash;
            this.blackmoney = data.blackmoney;
            this.crypto = data.crypto;
            this.minus = data.minus;
            this.plus = data.plus;
            if (data.type === "cash") {
                if (data.minus) {
                    this.showCash = true;
                    this.minus = true;
                    setTimeout(() => (this.showUpdate = false), 1000);
                    setTimeout(() => (this.showCash = false), 2000);
                } else {
                    this.showCash = true;
                    this.plus = true;
                    setTimeout(() => (this.showUpdate = false), 1000);
                    setTimeout(() => (this.showCash = false), 2000);
                }
            }
            if (data.type === "bank") {
                if (data.minus) {
                    this.showBank = true;
                    this.minus = true;
                    setTimeout(() => (this.showUpdate = false), 1000);
                    setTimeout(() => (this.showBank = false), 2000);
                } else {
                    this.showBank = true;
                    this.plus = true;
                    setTimeout(() => (this.showUpdate = false), 1000);
                    setTimeout(() => (this.showBank = false), 2000);
                }
            }
            if (data.type === "black_money") {
                if (data.minus) {
                    this.showBlack = true;
                    this.minus = true;
                    setTimeout(() => (this.showUpdate = false), 1000);
                    setTimeout(() => (this.showBlack = false), 2000);
                } else {
                    this.showBlack = true;
                    this.plus = true;
                    setTimeout(() => (this.showUpdate = false), 1000);
                    setTimeout(() => (this.showBlack = false), 2000);
                }
            }
            if (data.type === "crypto") {
                if (data.minus) {
                    this.showCrypto = true;
                    this.minus = true;
                    setTimeout(() => (this.showUpdate = false), 1000);
                    setTimeout(() => (this.showCrypto = false), 2000);
                } else {
                    this.showCrypto = true;
                    this.plus = true;
                    setTimeout(() => (this.showUpdate = false), 1000);
                    setTimeout(() => (this.showCrypto = false), 2000);
                }
            }
        },
        showAccounts(data) {
            if (data.type === "cash" && !this.showCash) {
                this.showCash = true;
                this.cash = data.cash;
                setTimeout(() => (this.showCash = false), 3500);
            } else if (data.type === "bank" && !this.showBank) {
                this.showBank = true;
                this.bank = data.bank;
                setTimeout(() => (this.showBank = false), 3500);
            }else if (data.type === "black_money" && !this.showBlack) {
                this.showBlack = true;
                this.blackmoney = data.blackmoney;
                setTimeout(() => (this.showBlack = false), 3500);
            }else if (data.type === "crypto" && !this.showCrypto) {
                this.showCrypto = true;
                this.crypto = data.crypto;
                setTimeout(() => (this.showCrypto = false), 3500);
            }
        },
    },
}).mount("#money-container");
```

# Add code 
- in `qb-hud/html/index.html` around line 205
```html
<div id="money-blackmoney">
    <transition name="slide-fade">
        <p v-if="showBlack"><span id="sign">$&nbsp;</span><span id="blackmoney">{{(blackmoney)}}</span></p>
    </transition>
</div>
<div id="money-crypto">
    <transition name="slide-fade">
        <p v-if="showCrypto"><span id="sign">₿&nbsp;</span><span id="crypto">{{(crypto)}}</span></p>
    </transition>
</div>
```


# --------------------- Server.cfg ---------------------
- add in server.cfg
```conf
### Shared
 
# Activate specific event handlers and functions (supported: ox, esx, qbx, nd)
setr inventory:framework "qb"
 
# Number of slots for player inventories
setr inventory:slots 50
 
# Maximum carry capacity for players, in grams (frameworks may override this)
setr inventory:weight 30000
 
# Integrated support for qtarget/ox_target stashes, shops, etc
# Note: qtarget is deprecated, a future update may drop support (ox_target only, or gated features)
setr inventory:target true
 
# Jobs with access to police armoury, evidence lockers, etc
setr inventory:police ["police", "sheriff"]
 
### Client
 
# The URL to load item images from
setr inventory:imagepath "nui://ox_inventory/web/images"
 
# Weapons will reload after reaching 0 ammo
setr inventory:autoreload false
 
# Blur the screen while accessing the inventory
setr inventory:screenblur true
 
# Default hotkeys to access primary and secondary inventories, and hotbar
setr inventory:keys ["F2", "K", "TAB"]
 
# Enable control action when inventory is open
setr inventory:enablekeys [249]
 
# Weapons must be aimed before shooting
setr inventory:aimedfiring true
 
# Show a list of all nearby players when giving items
setr inventory:giveplayerlist false
 
# Toggle weapon draw/holster animations
setr inventory:weaponanims true
 
# Toggle item notifications (add/remove)
setr inventory:itemnotify true
 
# Toggle weapon item notifications (equip/holster)
setr inventory:weaponnotify true
 
# Disable drop markers and spawn a prop instead
setr inventory:dropprops true
 
# Set the default model used for drop props
setr inventory:dropmodel "prop_med_bag_01b"
 
# Disarm the player if an unexpected weapon is in use (i.e. did not use the weapon item)
setr inventory:weaponmismatch true
 
# Ignore weapon mismatch checks for the given weapon type (e.g. ['WEAPON_SHOVEL', 'WEAPON_HANDCUFFS'])
setr inventory:ignoreweapons []
 
# Suppress weapon and ammo pickups
setr inventory:suppresspickups 1
 
### Server
 
# Compare current version to latest release on GitHub
set inventory:versioncheck true
 
# Stashes will be wiped after remaining unchanged for the given time
set inventory:clearstashes "6 MONTH"
 
# Discord webhook url, used for imageurl metadata content moderation (image embeds)
set inventory:webhook ""
 
# Logging via ox_lib (0: Disable, 1: Standard, 2: Include AddItem/RemoveItem, and all shop purchases)
set inventory:loglevel 1
 
# Item prices fluctuate in shops
set inventory:randomprices true
 
# Loot will randomly generate inside unowned vehicles and dumpsters
set inventory:randomloot true
 
# Minimum job grade to remove items from evidence lockers
set inventory:evidencegrade 2
 
# Trim whitespace from vehicle plates when checking owned vehicles
setr inventory:trimplate true
 
# Set the contents of randomly generated inventories
# [item name, minimum, maximum, loot chance]
set inventory:vehicleloot [
    ["cola", 1, 1],
    ["water", 1, 1],
    ["garbage", 1, 2, 50],
    ["panties", 1, 1, 5],
    ["money", 1, 50],
    ["money", 200, 400, 5],
    ["bandage", 1, 1]
]
 
set inventory:dumpsterloot [
    ["mustard", 1, 1],
    ["garbage", 1, 3],
    ["money", 1, 10],
    ["burger", 1, 1]
]

set inventory:accounts ["money", "black_money", "crypto"]
```
