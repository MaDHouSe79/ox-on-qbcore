if not lib then return end

local Inventory = {}

Inventory.Dumpsters = {
	1437508529, 218085040, 666561306, -58485588, 
	-206690185, 1511880420, 682791951, 1388415578, 
	-1998455445, 1627301588, -935625561, -675277761, 
	628215202, -375613925, 1813879595, 1388308576, 
	-289082718, 1098827230, 897494494, -1681329307, 
	1138881502, -1895783233, -1734625067, -819563011
}

-- mh-snippet (start)
Inventory.Parkmeters = {-1940238623, -544726684, 2108567945, 1447355784}
Inventory.Cellphones = {-78626473, 295857659, 1158960338, -2103798695, 1511539537, 1281992692}

Inventory.LootNpcModels = {
    "a_f_m_beach_01",
    "a_f_m_bevhills_01",
    "a_f_m_bevhills_02",
    "a_f_m_bodybuild_01",
    "a_f_m_business_02",
    "a_f_m_downtown_01",
    "a_f_m_eastsa_01",
    "a_f_m_eastsa_02",
    "a_f_m_fatbla_01",
    "a_f_m_fatcult_01",
    "a_f_m_ktown_01",
    "a_f_m_ktown_02",
    "a_f_m_prolhost_01",
    "a_f_m_salton_01",
    "a_f_m_skidrow_01",
    "a_f_m_soucent_01",
    "a_f_m_soucent_02",
    "a_f_m_soucentmc_01",
    "a_f_m_tourist_01",
    "a_f_m_tramp_01",
    "a_f_m_trampbeac_01",
    "a_f_o_genstreet_01",
    "a_f_o_indian_01",
    "a_f_o_ktown_01",
    "a_f_o_salton_01",
    "a_f_o_soucent_01",
    "a_f_o_soucent_02",
    "a_f_y_beach_01",
    "a_f_y_bevhills_01",
    "a_f_y_bevhills_02",
    "a_f_y_bevhills_03",
    "a_f_y_bevhills_04",
    "a_f_y_business_01",
    "a_f_y_business_02",
    "a_f_y_business_03",
    "a_f_y_business_04",
    "a_f_y_eastsa_01",
    "a_f_y_eastsa_02",
    "a_f_y_eastsa_03",
    "a_f_y_epsilon_01",
    "a_f_y_fitness_01",
    "a_f_y_fitness_02",
    "a_f_y_genhot_01",
    "a_f_y_golfer_01",
    "a_f_y_hiker_01",
    "a_f_y_hippie_01",
    "a_f_y_hipster_01",
    "a_f_y_hipster_02",
    "a_f_y_hipster_03",
    "a_f_y_hipster_04",
    "a_f_y_indian_01",
    "a_f_y_juggalo_01",
    "a_f_y_runner_01",
    "a_f_y_rurmeth_01",
    "a_f_y_scdressy_01",
    "a_f_y_skater_01",
    "a_f_y_soucent_01",
    "a_f_y_soucent_02",
    "a_f_y_soucent_03",
    "a_f_y_tennis_01",
    "a_f_y_topless_01",
    "a_f_y_tourist_01",
    "a_f_y_tourist_02",
    "a_f_y_vinewood_01",
    "a_f_y_vinewood_02",
    "a_f_y_vinewood_03",
    "a_f_y_vinewood_04",
    "a_f_y_yoga_01",
    "a_m_m_acult_01",
    "a_m_m_afriamer_01",
    "a_m_m_beach_01",
    "a_m_m_beach_02",
    "a_m_m_bevhills_01",
    "a_m_m_bevhills_02",
    "a_m_m_business_01",
    "a_m_m_eastsa_01",
    "a_m_m_eastsa_02",
    "a_m_m_fatlatin_01",
    "a_m_m_genfat_01",
    "a_m_m_genfat_02",
    "a_m_m_golfer_01",
    "a_m_m_hasjew_01",
    "a_m_m_indian_01",
    "a_m_m_ktown_01",
    "a_m_m_malibu_01",
    "a_m_m_mexcntry_01",
    "a_m_m_mexlabor_01",
    "a_m_m_og_boss_01",
    "a_m_m_paparazzi_01",
    "a_m_m_polynesian_01",
    "a_m_m_prolhost_01",
    "a_m_m_rurmeth_01",
    "a_m_m_salton_01",
    "a_m_m_salton_02",
    "a_m_m_salton_03",
    "a_m_m_salton_04",
    "a_m_m_skater_01",
    "a_m_m_skidrow_01",
    "a_m_m_socenlat_01",
    "a_m_m_soucent_01",
    "a_m_m_soucent_02",
    "a_m_m_soucent_03",
    "a_m_m_soucent_04",
    "a_m_m_stlat_02",
    "a_m_m_tennis_01",
    "a_m_m_tourist_01",
    "a_m_m_tramp_01",
    "a_m_m_trampbeac_01",
    "a_m_m_tranvest_01",
    "a_m_m_tranvest_02",
    "a_m_o_acult_01",
    "a_m_o_acult_02",
    "a_m_o_beach_01",
    "a_m_o_genstreet_01",
    "a_m_o_ktown_01",
    "a_m_o_salton_01",
    "a_m_o_soucent_01",
    "a_m_o_soucent_02",
    "a_m_o_soucent_03",
    "a_m_o_tramp_01",
    "a_m_y_acult_01",
    "a_m_y_acult_02",
    "a_m_y_beach_01",
    "a_m_y_beach_02",
    "a_m_y_beach_03",
    "a_m_y_beachvesp_01",
    "a_m_y_beachvesp_02",
    "a_m_y_bevhills_01",
    "a_m_y_bevhills_02",
    "a_m_y_breakdance_01",
    "a_m_y_busicas_01",
    "a_m_y_business_01",
    "a_m_y_business_02",
    "a_m_y_business_03",
    "a_m_y_cyclist_01",
    "a_m_y_dhill_01",
    "a_m_y_downtown_01",
    "a_m_y_eastsa_01",
    "a_m_y_eastsa_02",
    "a_m_y_epsilon_01",
    "a_m_y_epsilon_02",
    "a_m_y_gay_01",
    "a_m_y_gay_02",
    "a_m_y_genstreet_01",
    "a_m_y_genstreet_02",
    "a_m_y_golfer_01",
    "a_m_y_hasjew_01",
    "a_m_y_hiker_01",
    "a_m_y_hippy_01",
    "a_m_y_hipster_01",
    "a_m_y_hipster_02",
    "a_m_y_hipster_03",
    "a_m_y_indian_01",
    "a_m_y_jetski_01",
    "a_m_y_juggalo_01",
    "a_m_y_ktown_01",
    "a_m_y_ktown_02",
    "a_m_y_latino_01",
    "a_m_y_methhead_01",
    "a_m_y_mexthug_01",
    "a_m_y_motox_01",
    "a_m_y_motox_02",
    "a_m_y_musclbeac_01",
    "a_m_y_musclbeac_02",
    "a_m_y_polynesian_01",
    "a_m_y_roadcyc_01",
    "a_m_y_runner_01",
    "a_m_y_runner_02",
    "a_m_y_salton_01",
    "a_m_y_skater_01",
    "a_m_y_skater_02",
    "a_m_y_soucent_01",
    "a_m_y_soucent_02",
    "a_m_y_soucent_03",
    "a_m_y_soucent_04",
    "a_m_y_stbla_01",
    "a_m_y_stbla_02",
    "a_m_y_stlat_01",
    "a_m_y_stwhi_01",
    "a_m_y_stwhi_02",
    "a_m_y_sunbathe_01",
    "a_m_y_surfer_01",
    "a_m_y_vindouche_01",
    "a_m_y_vinewood_01",
    "a_m_y_vinewood_02",
    "a_m_y_vinewood_03",
    "a_m_y_vinewood_04",
    "a_m_y_yoga_01",
    "g_f_importexport_01",
    "g_f_y_ballas_01",
    "g_f_y_families_01",
    "g_f_y_lost_01",
    "g_f_y_vagos_01",
    "g_m_importexport_01",
    "g_m_m_armboss_01",
    "g_m_m_armgoon_01",
    "g_m_m_armlieut_01",
    "g_m_m_chemwork_01",
    "g_m_m_chiboss_01",
    "g_m_m_chicold_01",
    "g_m_m_chigoon_01",
    "g_m_m_chigoon_02",
    "g_m_m_korboss_01",
    "g_m_m_mexboss_01",
    "g_m_m_mexboss_02",
    "g_m_y_armgoon_02",
    "g_m_y_azteca_01",
    "g_m_y_ballaeast_01",
    "g_m_y_ballaorig_01",
    "g_m_y_ballasout_01",
    "g_m_y_famca_01",
    "g_m_y_famdnf_01",
    "g_m_y_famfor_01",
    "g_m_y_korean_01",
    "g_m_y_korean_02",
    "g_m_y_korlieut_01",
    "g_m_y_lost_01",
    "g_m_y_lost_02",
    "g_m_y_lost_03",
    "g_m_y_mexgang_01",
    "g_m_y_mexgoon_01",
    "g_m_y_mexgoon_02",
    "g_m_y_mexgoon_03",
    "g_m_y_pologoon_01",
    "g_m_y_pologoon_02",
    "g_m_y_salvaboss_01",
    "g_m_y_salvagoon_01",
    "g_m_y_salvagoon_02",
    "g_m_y_salvagoon_03",
    "g_m_y_strpunk_01",
    "g_m_y_strpunk_02",
    "mp_f_boatstaff_01",
    "mp_f_cardesign_01",
    "mp_f_chbar_01",
    "mp_f_cocaine_01",
    "mp_f_counterfeit_01",
    "mp_f_deadhooker",
    "mp_f_execpa_01",
    "mp_f_forgery_01",
    "mp_f_freemode_01",
    "mp_f_helistaff_01",
    "mp_f_meth_01",
    "mp_f_misty_01",
    "mp_f_stripperlite",
    "mp_f_weed_01",
    "mp_g_m_pros_01",
    "mp_headtargets",
    "mp_m_boatstaff_01",
    "mp_m_claude_01",
    "mp_m_cocaine_01",
    "mp_m_counterfeit_01",
    "mp_m_exarmy_01",
    "mp_m_execpa_01",
    "mp_m_famdd_01",
    "mp_m_fibsec_01",
    "mp_m_forgery_01",
    "mp_m_freemode_01",
    "mp_m_g_vagfun_01",
    "mp_m_marston_01",
    "mp_m_meth_01",
    "mp_m_niko_01",
    "mp_m_securoguard_01",
    "mp_m_shopkeep_01",
    "mp_m_waremech_01",
    "mp_m_weed_01",
    "mp_s_m_armoured_01",
    "s_f_m_fembarber",
    "s_f_m_maid_01",
    "s_f_m_shop_high",
    "s_f_m_sweatshop_01",
    "s_f_y_airhostess_01",
    "s_f_y_bartender_01",
    "s_f_y_baywatch_01",
    "s_f_y_cop_01",
    "s_f_y_factory_01",
    "s_f_y_hooker_01",
    "s_f_y_hooker_02",
    "s_f_y_hooker_03",
    "s_f_y_migrant_01",
    "s_f_y_movprem_01",
    "s_f_y_ranger_01",
    "s_f_y_scrubs_01",
    "s_f_y_sheriff_01",
    "s_f_y_shop_low",
    "s_f_y_shop_mid",
    "s_f_y_stripper_01",
    "s_f_y_stripper_02",
    "s_f_y_stripperlite",
    "s_f_y_sweatshop_01",
    "s_m_m_ammucountry",
    "s_m_m_armoured_01",
    "s_m_m_armoured_02",
    "s_m_m_autoshop_01",
    "s_m_m_autoshop_02",
    "s_m_m_bouncer_01",
    "s_m_m_chemsec_01",
    "s_m_m_ciasec_01",
    "s_m_m_cntrybar_01",
    "s_m_m_fiboffice_01",
    "s_m_m_fiboffice_02",
    "s_m_m_gaffer_01",
    "s_m_m_gardener_01",
    "s_m_m_gentransport",
    "s_m_m_hairdress_01",
    "s_m_m_janitor",
    "s_m_m_lathandy_01",
    "s_m_m_lifeinvad_01",
    "s_m_m_linecook",
    "s_m_m_lsmetro_01",
    "s_m_m_mariachi_01",
    "s_m_m_marine_01",
    "s_m_m_marine_02",
    "s_m_m_migrant_01",
    "s_m_m_movalien_01",
    "s_m_m_movprem_01",
    "s_m_m_movspace_01",
    "s_m_m_paramedic_01",
    "s_m_m_pilot_01",
    "s_m_m_pilot_02",
    "s_m_m_postal_01",
    "s_m_m_postal_02",
    "s_m_m_prisguard_01",
    "s_m_m_scientist_01",
    "s_m_m_security_01",
    "s_m_m_snowcop_01",
    "s_m_m_strperf_01",
    "s_m_m_strpreach_01",
    "s_m_m_trucker_01",
    "s_m_m_ups_01",
    "s_m_m_ups_02",
    "s_m_y_armymech_01",
    "s_m_y_autopsy_01",
    "s_m_y_barman_01",
    "s_m_y_baywatch_01",
    "s_m_y_blackops_01",
    "s_m_y_blackops_02",
    "s_m_y_chef_01",
    "s_m_y_clown_01",
    "s_m_y_construct_01",
    "s_m_y_construct_02",
    "s_m_y_cop_01",
    "s_m_y_dealer_01",
    "s_m_y_devinsec_01",
    "s_m_y_dockwork_01",
    "s_m_y_doorman_01",
    "s_m_y_dwservice_01",
    "s_m_y_dwservice_02",
    "s_m_y_factory_01",
    "s_m_y_fireman_01",
    "s_m_y_garbage",
    "s_m_y_grip_01",
    "s_m_y_hwaycop_01",
    "s_m_y_marine_01",
    "s_m_y_marine_02",
    "s_m_y_marine_03",
    "s_m_y_mime",
    "s_m_y_pestcont_01",
    "s_m_y_pilot_01",
    "s_m_y_prismuscl_01",
    "s_m_y_prisoner_01",
    "s_m_y_ranger_01",
    "s_m_y_robber_01",
    "s_m_y_sheriff_01",
    "s_m_y_shop_mask",
    "s_m_y_strvend_01",
    "s_m_y_swat_01",
    "s_m_y_uscg_01",
    "s_m_y_valet_01",
    "s_m_y_waiter_01",
    "s_m_y_winclean_01",
    "s_m_y_xmech_01",
    "s_m_y_xmech_02",
    "s_m_y_xmech_02_mp",
    "u_f_m_corpse_01",
    "u_f_m_miranda",
    "u_f_m_promourn_01",
    "u_f_o_moviestar",
    "u_f_o_prolhost_01",
    "u_f_y_bikerchic",
    "u_f_y_comjane",
    "u_f_y_corpse_01",
    "u_f_y_corpse_02",
    "u_f_y_hotposh_01",
    "u_f_y_jewelass_01",
    "u_f_y_mistress",
    "u_f_y_poppymich",
    "u_f_y_princess",
    "u_f_y_spyactress",
    "u_m_m_aldinapoli",
    "u_m_m_bankman",
    "u_m_m_bikehire_01",
    "u_m_m_fibarchitect",
    "u_m_m_glenstank_01",
    "u_m_m_griff_01",
    "u_m_m_jesus_01",
    "u_m_m_jewelsec_01",
    "u_m_m_jewelthief",
    "u_m_m_markfost",
    "u_m_m_partytarget",
    "u_m_m_prolsec_01",
    "u_m_m_promourn_01",
    "u_m_m_rivalpap",
    "u_m_m_spyactor",
    "u_m_m_willyfist",
    "u_m_o_finguru_01",
    "u_m_o_taphillbilly",
    "u_m_o_tramp_01",
    "u_m_y_abner",
    "u_m_y_antonb",
    "u_m_y_babyd",
    "u_m_y_baygor",
    "u_m_y_burgerdrug_01",
    "u_m_y_chip",
    "u_m_y_cyclist_01",
    "u_m_y_fibmugger_01",
    "u_m_y_guido_01",
    "u_m_y_gunvend_01",
    "u_m_y_hippie_01",
    "u_m_y_imporage",
    "u_m_y_justin",
    "u_m_y_mani",
    "u_m_y_militarybum",
    "u_m_y_paparazzi",
    "u_m_y_party_01",
    "u_m_y_pogo_01",
    "u_m_y_prisoner_01",
    "u_m_y_proldriver_01",
    "u_m_y_rsranger_01",
    "u_m_y_sbike",
    "u_m_y_staggrm_01",
    "u_m_y_tattoo_01",
    "u_m_y_zombie_01",
}

function Inventory.PayFee(entity)
    TriggerServerEvent('ox_inventory:payoarkfee', GetEntityCoords(entity))
    return
end

function Inventory.LockpickParkmeter(entity)
    local success = lib.skillCheck({'easy'}, {'1', '2', '3', '4'})
    if success then TriggerServerEvent('ox_inventory:parkmeter-robbery', GetEntityCoords(entity)) end
end

function Inventory.LockpickCellphone(entity)
    local success = lib.skillCheck({'easy'}, {'1', '2', '3', '4'})
    if success then TriggerServerEvent('ox_inventory:cellphone-robbery', GetEntityCoords(entity)) end
end

function Inventory.HasLockpick()
    local count = exports.ox_inventory:Search('count', 'lockpick')
    return (count >= 1)
end
-- mh-snippet (start)

function Inventory.OpenDumpster(entity)
	local netId = NetworkGetEntityIsNetworked(entity) and NetworkGetNetworkIdFromEntity(entity)

	if not netId then
		local coords = GetEntityCoords(entity)
		entity = GetClosestObjectOfType(coords.x, coords.y, coords.z, 0.1, GetEntityModel(entity), true, true, true)
		netId = entity ~= 0 and NetworkGetNetworkIdFromEntity(entity)
	end

	if netId then
		client.openInventory('dumpster', 'dumpster'..netId)
	end
end

local Utils = require 'modules.utils.client'
local Vehicles = lib.load('data.vehicles')
local backDoorIds = { 2, 3 }

function Inventory.CanAccessTrunk(entity)
    if cache.vehicle or not NetworkGetEntityIsNetworked(entity) then return end

	local vehicleHash = GetEntityModel(entity)
    local vehicleClass = GetVehicleClass(entity)
    local checkVehicle = Vehicles.Storage[vehicleHash]

    if (checkVehicle == 0 or checkVehicle == 1) or (not Vehicles.trunk[vehicleClass] and not Vehicles.trunk.models[vehicleHash]) then return end

    ---@type number | number[]
    local doorId = checkVehicle and 4 or 5

    if not Vehicles.trunk.boneIndex?[vehicleHash] and not GetIsDoorValid(entity, doorId --[[@as number]]) then
        if vehicleClass ~= 11 and (doorId ~= 5 or GetEntityBoneIndexByName(entity, 'boot') ~= -1 or not GetIsDoorValid(entity, 2)) then
            return
        end

        if vehicleClass ~= 11 then
            doorId = backDoorIds
        end
    end

    local min, max = GetModelDimensions(vehicleHash)
    local offset = (max - min) * (not checkVehicle and vec3(0.5, 0, 0.5) or vec3(0.5, 1, 0.5)) + min
    offset = GetOffsetFromEntityInWorldCoords(entity, offset.x, offset.y, offset.z)

    if #(GetEntityCoords(cache.ped) - offset) < 1.5 then
        return doorId
    end
end

function Inventory.OpenTrunk(entity)
    ---@type number | number[] | nil
    local door = Inventory.CanAccessTrunk(entity)

    if not door then return end

    local coords = GetEntityCoords(entity)

    TaskTurnPedToFaceCoord(cache.ped, coords.x, coords.y, coords.z, 0)

    if not client.openInventory('trunk', { netid = NetworkGetNetworkIdFromEntity(entity), entityid = entity, door = door }) then return end

    if type(door) == 'table' then
        for i = 1, #door do
            SetVehicleDoorOpen(entity, door[i], false, false)
        end
    else
        SetVehicleDoorOpen(entity, door --[[@as number]], false, false)
    end
end

RegisterNetEvent('ox_inventory:mods:notify', function(title, description, type)
    lib.notify({title = title, description = description, type = type})
end)

if shared.target then
	exports.ox_target:addModel(Inventory.Dumpsters, {
        icon = 'fas fa-dumpster',
        label = locale('search_dumpster'),
        onSelect = function(data) return Inventory.OpenDumpster(data.entity) end,
        distance = 2
	})

    exports.ox_target:addGlobalVehicle({
        icon = 'fas fa-truck-ramp-box',
        label = locale('open_label', locale('storage')),
        distance = 1.5,
        canInteract = Inventory.CanAccessTrunk,
        onSelect = function(data)
            return Inventory.OpenTrunk(data.entity)
        end
    })


	-- mh-snippet (start)
	exports.ox_target:addModel(Inventory.LootNpcModels, {
        {
            icon = 'fas fa-skull-crossbones',
            label = "Search Citizen",
            onSelect = function(data)
                if not shared.useNpcLootWhenDead then return false end
                if not IsEntityDead(entity) then return false end
                TriggerServerEvent('ox_inventory:lootnpc', PedToNet(data.entity))
            end,
            canInteract = function(entity, distance, coords, name)
                if not shared.useNpcLootWhenDead then return false end
                if not IsEntityDead(entity) then return false end
                return true
            end,
            distance = 2.5
        }
    })

	exports.ox_target:addModel(Inventory.Parkmeters, {
		{
			type = "client",
			icon = "fas fa-parking",
			label = locale('pay_park_fee'),
			onSelect = function(data) return Inventory.PayFee(data.entity) end,
			distance = 2
		}, {
			type = "client",
			icon = "fas fa-parking",
			label = locale("lockpick"),
            onSelect = function(data)
                if not shared.useLockpickParkmeter then return false end
                if not Inventory.HasLockpick then return false end
                Inventory.LockpickParkmeter(data.entity)
            end,

            canInteract = function(entity, distance, coords, name)
                if not shared.useLockpickParkmeter then return false end
                if not Inventory.HasLockpick then return false end
                return true
            end,

			distance = 2
		}
	})

	exports.ox_target:addModel(Inventory.Cellphones, {
		icon = 'fas fa-phone',
		label = locale('lockpick'),
        onSelect = function(data)
            if not shared.useLockpickCellphone then return false end
            if not Inventory.HasLockpick then return false end
            Inventory.LockpickCellphone(data.entity)
        end,
		canInteract = function(entity, distance, coords, name)
            if not shared.useLockpickCellphone then return false end
            if not Inventory.HasLockpick then return false end
            return true
        end,
		
		distance = 2
	})
	-- mh-snippet (end)

else
	local dumpsters = table.create(0, #Inventory.Dumpsters)

	for i = 1, #Inventory.Dumpsters do
		dumpsters[Inventory.Dumpsters[i]] = true
	end

	Inventory.Dumpsters = dumpsters
end

---@param search 'slots' | 1 | 'count' | 2
---@param item table | string
---@param metadata? table | string
function Inventory.Search(search, item, metadata)
	if not PlayerData.loaded then
		if not coroutine.running() then
			error('player inventory has not yet loaded.')
		end

		repeat Wait(100) until PlayerData.loaded
	end

	if item then
		if search == 'slots' then search = 1 elseif search == 'count' then search = 2 end
		if type(item) == 'string' then item = {item} end
		if type(metadata) == 'string' then metadata = {type=metadata} end

		local items = #item
		local returnData = {}
		for i = 1, items do
			local item = string.lower(item[i])
			if item:sub(0, 7) == 'weapon_' then item = string.upper(item) end
			if search == 1 then returnData[item] = {}
			elseif search == 2 then returnData[item] = 0 end
			for _, v in pairs(PlayerData.inventory) do
				if v.name == item then
					if not v.metadata then v.metadata = {} end
					if not metadata or table.contains(v.metadata, metadata) then
						if search == 1 then returnData[item][#returnData[item]+1] = PlayerData.inventory[v.slot]
						elseif search == 2 then
							returnData[item] += v.count
						end
					end
				end
			end
		end
		if next(returnData) then return items == 1 and returnData[item[1]] or returnData end
	end
	return false
end
exports('Search', Inventory.Search)

exports('GetPlayerItems', function()
	return PlayerData.inventory
end)

exports('GetPlayerWeight', function()
	return PlayerData.weight
end)

exports('GetPlayerMaxWeight', function()
	return PlayerData.maxWeight
end)

local Items = require 'modules.items.client'

local function assertMetadata(metadata)
	if metadata and type(metadata) ~= 'table' then
		metadata = metadata and { type = metadata or nil }
	end

	return metadata
end

---@param itemName string
---@param metadata? any
---@param strict? boolean Strictly match metadata properties, otherwise use partial matching.
---@return SlotWithItem?
function Inventory.GetSlotWithItem(itemName, metadata, strict)
	local inventory = PlayerData.inventory
	local item = Items(itemName) --[[@as OxClientItem?]]

	if not inventory or not item then return end

	metadata = assertMetadata(metadata)
	local tablematch = strict and table.matches or table.contains

	for _, slotData in pairs(inventory) do
		if slotData and slotData.name == item.name and (not metadata or tablematch(slotData.metadata, metadata)) then
			return slotData
		end
	end
end

exports('GetSlotWithItem', Inventory.GetSlotWithItem)

---@param itemName string
---@param metadata? any
---@param strict? boolean Strictly match metadata properties, otherwise use partial matching.
---@return number?
function Inventory.GetSlotIdWithItem(itemName, metadata, strict)
	return Inventory.GetSlotWithItem(itemName, metadata, strict)?.slot
end

exports('GetSlotIdWithItem', Inventory.GetSlotIdWithItem)

---@param itemName string
---@param metadata? any
---@param strict? boolean Strictly match metadata properties, otherwise use partial matching.
---@return SlotWithItem[]?
function Inventory.GetSlotsWithItem(itemName, metadata, strict)
	local inventory = PlayerData.inventory
	local item = Items(itemName) --[[@as OxClientItem?]]

	if not inventory or not item then return end


	metadata = assertMetadata(metadata)
	local response = {}
	local n = 0
	local tablematch = strict and table.matches or table.contains

	for _, slotData in pairs(inventory) do
		if slotData and slotData.name == item.name and (not metadata or tablematch(slotData.metadata, metadata)) then
			n += 1
			response[n] = slotData
		end
	end

	return response
end

exports('GetSlotsWithItem', Inventory.GetSlotsWithItem)

---@param itemName string
---@param metadata? any
---@param strict? boolean Strictly match metadata properties, otherwise use partial matching.
---@return number[]?
function Inventory.GetSlotIdsWithItem(itemName, metadata, strict)
	local items = Inventory.GetSlotsWithItem(itemName, metadata, strict)

	if items then
		---@cast items +number[]
		for i = 1, #items do
			items[i] = items[i].slot
		end

		return items
	end
end

---@param itemName string
---@param metadata? any
---@param strict? boolean Strictly match metadata properties, otherwise use partial matching.
---@return number
function Inventory.GetItemCount(itemName, metadata, strict)
	local inventory = PlayerData.inventory
	local item = Items(itemName) --[[@as OxClientItem?]]

	if not inventory or not item then return 0 end

	if not metadata then
		return item.count
	end


	metadata = assertMetadata(metadata)
	local count = 0
	local tablematch = strict and table.matches or table.contains

	for _, slotData in pairs(inventory) do
		if slotData and slotData.name == item.name and (not metadata or tablematch(slotData.metadata, metadata)) then
			count += slotData.count
		end
	end

	return count
end

exports('GetItemCount', Inventory.GetItemCount)


local function openEvidence()
	client.openInventory('policeevidence')
end

local markerColour = { 30, 30, 150 }
local textPrompts = {
    evidence = {
        options = { icon = 'fa-box-archive' },
        message = ('**%s**  \n%s'):format(locale('open_police_evidence'), locale('interact_prompt', GetControlInstructionalButton(0, 38, true):sub(3)))
    },
    stash = {
        options = { icon = 'fa-warehouse' },
        message = ('**%s**  \n%s'):format(locale('open_stash'), locale('interact_prompt', GetControlInstructionalButton(0, 38, true):sub(3)))
    }
}

Inventory.Evidence = setmetatable(lib.load('data.evidence'), {
	__call = function(self)
		for _, evidence in pairs(self) do
			if evidence.point then
				evidence.point:remove()
            elseif evidence.zoneId then
                exports.ox_target:removeZone(evidence.zoneId)
                evidence.zone = nil
            end

			if client.hasGroup(shared.police) then
				if shared.target then
					if evidence.target then
                        evidence.zoneId = Utils.CreateBoxZone(evidence.target, {
                            {
                                icon = evidence.target.icon or 'fas fa-warehouse',
                                label = locale('open_police_evidence'),
                                groups = shared.police,
                                onSelect = openEvidence,
                                iconColor = evidence.target.iconColor,
                            }
                        })
					end
				else
					evidence.target = nil
					evidence.point = lib.points.new({
						coords = evidence.coords,
						distance = 16,
						inv = 'policeevidence',
						marker = markerColour,
                        prompt = textPrompts.evidence,
						nearby = Utils.nearbyMarker
					})
				end
			end
		end
	end
})

Inventory.Stashes = setmetatable(lib.load('data.stashes'), {
	__call = function(self)
		for id, stash in pairs(self) do
			if stash.jobs then stash.groups = stash.jobs end

			if stash.point then
				stash.point:remove()
            elseif stash.zoneId then
                exports.ox_target:removeZone(stash.zoneId)
                stash.zoneId = nil
            end

			if not stash.groups or client.hasGroup(stash.groups) then
				if shared.target then
					if stash.target then
                        stash.zoneId = Utils.CreateBoxZone(stash.target, {
                            {
                                icon = stash.target.icon or 'fas fa-warehouse',
                                label = stash.target.label or locale('open_stash'),
                                groups = stash.groups,
                                onSelect = function()
                                    exports.ox_inventory:openInventory('stash', stash.name)
                                end,
                                iconColor = stash.target.iconColor,
                            },
                        })
					end
				else
					stash.target = nil
					stash.point = lib.points.new({
						coords = stash.coords,
						distance = 16,
						inv = 'stash',
						invId = stash.name,
						marker = markerColour,
                        prompt = textPrompts.stash,
						nearby = Utils.nearbyMarker
					})
				end
			end
		end
	end
})

RegisterNetEvent('ox_inventory:refreshMaxWeight', function(data)
    if data.inventoryId == cache.serverId then
        PlayerData.maxWeight = data.maxWeight
    end

	SendNUIMessage({
		action = 'refreshSlots',
		data = {
			weightData = {
				inventoryId = data.inventoryId,
				maxWeight = data.maxWeight
			}
		}
	})
end)

RegisterNetEvent('ox_inventory:refreshSlotCount', function(data)
	SendNUIMessage({
		action = 'refreshSlots',
		data = {
			slotsData = {
				inventoryId = data.inventoryId,
				slots = data.slots
			}
		}
	})
end)

return Inventory
