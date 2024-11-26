local Translations = {
    error = {
        no_vehicles = "There are no vehicles at this location!",
        not_impound = "Your vehicle has not been impounded",
        not_owned = "This vehicle cannot be parked",
        not_correct_type = "You cannot park this type of vehicle here",
        not_enough = "Not enough money",
        no_garage = "No Garage",
        too_far_away = "Too far from a parking lot",
        occupied = "Parking space is already occupied",
        all_occupied = "All parking spaces are occupied",
        no_vehicle = "There is no vehicle to park",
        no_house_keys = "You don't have the keys to this house garage"
    },
    success = {
        vehicle_parked = "Vehicle parked"
    },
    menu = {
        header = {
            house_garage = "House Garage",
            house_car = "House Garage %{value}",
            public_car = "Public garage %{value}",
            public_sea = "Public boat %{value}",
            public_air = "Public hangar %{value}",
            job_car = "Job garage %{value}",
            job_sea = "Job boat  %{value}",
            job_air = "Job Hangar %{value}",
            gang_car = "Gang Garage %{value}",
            gang_sea = "Gang boat  %{value}",
            gang_air = "Gang Hangar %{value}",
            depot_car = "Depot %{value}",
            depot_sea = "Depot %{value}",
            depot_air = "Depot %{value}",
            vehicles = "Available vehicles",
            depot = "%{value} [ $%{value2} ]",
            garage = "%{value} [ %{value2} ]"
        },
        leave = {
            car = "⬅ Leave garage",
            sea = "⬅ Leave boathouse",
            air = "⬅ Leave Hangar"
        },
        text = {
            vehicles = "View parked vehicles!",
            depot = "Plate: %{value}<br>Fuel: %{value2} | Engine: %{value3} | Chassis: %{value4}",
            garage = "Street: %{value}<br>Fuel: %{value2} | Engine: %{value3} | Chassis: %{value4}"
        }
    },
    status = {
        out = "Out",
        garaged = "Parked Garage",
        impound = "Impounded",
        parked = "Parked Street"
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
