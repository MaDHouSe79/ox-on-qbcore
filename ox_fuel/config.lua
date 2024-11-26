if not lib.checkDependency('ox_lib', '3.22.0', true) then return end
if not lib.checkDependency('ox_inventory', '2.30.0', true) then return end

return {
	-- Get notified when a new version releases
	versionCheck = true,

	-- Enable support for ox_target
	ox_target = true,

	--Show or hide gas stations blips
	--0 - Hide all
	--1 - Show nearest (5000ms interval check)

	showBlips = 2,

	-- Total duration (ex. 10% missing fuel): 10 / 0.25 * 250 = 10 seconds

	-- Fuel refill value (every 250msec add 0.25%)
	refillValue = 0.50,

	-- Fuel tick time (every 250 msec)
	refillTick = 250,

	-- Fuel cost (Added once every tick)
	priceTick = 5,

	-- Can durability loss per refillTick
	durabilityTick = 1.3,

	-- Enables fuel can
	petrolCan = {
		enabled = true,
		duration = 5000,
		price = 1000,
		refillPrice = 800,
	},

	---Modifies the fuel consumption rate of all vehicles - see ['SET_FUEL_CONSUMPTION_RATE_MULTIPLIER'](https://docs.fivem.net/natives/?_0x845F3E5C).
	globalFuelConsumptionRate = 10.0,

	-- Gas pump models
	pumpModels = {
		'prop_gas_pump_old2',
		'prop_gas_pump_1a',
		'prop_vintage_pump',
		'prop_gas_pump_old3',
		'prop_gas_pump_1c',
		'prop_gas_pump_1b',
		'prop_gas_pump_1d',
	},

	FuelClasses = {
		[0] = 1.0, -- Compacts
		[1] = 1.0, -- Sedans
		[2] = 0.8, -- SUVs
		[3] = 1.2, -- Coupes
		[4] = 1.1, -- Muscle
		[5] = 1.3, -- Sports Classics
		[6] = 1.2, -- Sports
		[7] = 1.2, -- Super
		[8] = 0.8, -- Motorcycles
		[9] = 1.0, -- Off-road
		[10] = 0.8, -- Industrial
		[11] = 0.8, -- Utility
		[12] = 0.8, -- Vans
		[13] = 0.0, -- Cycles
		[14] = 1.0, -- Boats
		[15] = 1.0, -- Helicopters
		[16] = 1.0, -- Planes
		[17] = 1.2, -- Service
		[18] = 1.2, -- Emergency
		[19] = 1.2, -- Military
		[20] = 1.2, -- Commercial
		[21] = 1.0 -- Trains
	},
	
	FuelUsage = {
		[1.0] = 0.4,
		[0.9] = 0.4,
		[0.8] = 0.3,
		[0.7] = 0.3,
		[0.6] = 0.2,
		[0.5] = 0.2,
		[0.4] = 0.1,
		[0.3] = 0.1,
		[0.2] = 0.1,
		[0.1] = 0.1,
		[0.0] = 0.0
	}


}

