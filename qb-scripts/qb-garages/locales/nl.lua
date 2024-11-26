local Translations = {
    error = {
        no_vehicles = "Er zijn geen voertuigen op deze locatie!",
        not_impound = "Uw voertuig is niet in beslag genomen",
        not_owned = "Dit voertuig kan niet worden geparkeerd",
        not_correct_type = "U kunt dit type voertuig hier niet parkeren",
        not_enough = "Niet genoeg geld",
        no_garage = "Geen",
        too_far_away = "Te ver weg van een parkeerplaats",
        occupied = "Parkeerplaats is al bezet",
        all_occupied = "Alle parkeerplaatsen zijn bezet",
        no_vehicle = "Er is geen voertuig om te parkeren",
        no_house_keys = "Je hebt de sleutels niet voor deze huisgarage"
    },
    success = {
        vehicle_parked = "Voertuig geparkeerd"
    },
    menu = {
        header = {
            house_garage = "Huis Garage",
            house_car = "Huis Garage %{value}",
            public_car = "Openbare garage %{value}",
            public_sea = "Openbaar botenhuis %{value}",
            public_air = "Openbare hangar %{value}",
            job_car = "Werk garage %{value}",
            job_sea = "Werk botenhuis %{value}",
            job_air = "Werk Hangar %{value}",
            gang_car = "Gang Garage %{value}",
            gang_sea = "Gang botenhuis %{value}",
            gang_air = "Gang Hangar %{value}",
            depot_car = "Depot %{value}",
            depot_sea = "Depot %{value}",
            depot_air = "Depot %{value}",
            vehicles = "Beschikbare voertuigen",
            depot = "%{value} [ $%{value2} ]",
            garage = "%{value} [ %{value2} ]"
        },
        leave = {
            car = "⬅ Verlaat garage",
            sea = "⬅ Boothuis verlaten",
            air = "⬅ Verlaat Hangar"
        },
        text = {
            vehicles = "Bekijk geparkeerde voertuigen!",
            depot = "Kenteken: %{value}<br>Fuel: %{value2} | Motor: %{value3} | Chassis: %{value4}",
            garage = "Staat: %{value}<br>Fuel: %{value2} | Motor: %{value3} | Chassis: %{value4}"
        }
    },
    status = {
        out = "Uit",
        garaged = "Geparkeerd",
        impound = "In beslag",
        parked = "Buiten geparkeerd"
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
