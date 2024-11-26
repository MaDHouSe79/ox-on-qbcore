```lua
elseif invType == 'apartment' then
	---@cast data string
	right = Inventory(data)
	if not right then
		right = Inventory.Create(data, data:gsub("^%l", string.upper), invType, 15, 0, 100000, false)
	end
```

```lua
RegisterNetEvent('apartments:server:openStash', function(CurrentApartment)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    exports.ox_inventory:forceOpenInventory(src, 'apartment', CurrentApartment)
end)
```