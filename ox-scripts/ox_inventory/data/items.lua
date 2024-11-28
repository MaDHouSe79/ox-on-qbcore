return {
    ['testburger'] = {
        label = 'Test Burger',
        weight = 220,
        degrade = 60,
        client = {
            image = 'burger_chicken.png',
            status = {
                hunger = 200000
            },
            anim = 'eating',
            prop = 'burger',
            usetime = 2500,
            export = 'ox_inventory_examples.testburger'
        },
        server = {
            export = 'ox_inventory_examples.testburger',
            test = 'what an amazingly delicious burger, amirite?'
        },
        buttons = {{
            label = 'Lick it',
            action = function(slot)
                print('You licked the burger')
            end
        }, {
            label = 'Squeeze it',
            action = function(slot)
                print('You squeezed the burger :(')
            end
        }, {
            label = 'What do you call a vegan burger?',
            group = 'Hamburger Puns',
            action = function(slot)
                print('A misteak.')
            end
        }, {
            label = 'What do frogs like to eat with their hamburgers?',
            group = 'Hamburger Puns',
            action = function(slot)
                print('French flies.')
            end
        }, {
            label = 'Why were the burger and fries running?',
            group = 'Hamburger Puns',
            action = function(slot)
                print('Because they\'re fast food.')
            end
        }},
        consume = 0.3
    },
    ['bandage'] = {
        label = 'Bandage',
        weight = 115,
        client = {
            anim = {
                dict = 'missheistdockssetup1clipboard@idle_a',
                clip = 'idle_a',
                flag = 49
            },
            prop = {
                model = prop_rolled_sock_02,
                pos = vec3(-0.14, -0.14, -0.08),
                rot = vec3(-50.0, -50.0, 0.0)
            },
            disable = {
                move = true,
                car = true,
                combat = true
            },
            usetime = 2500
        }
    },
    ['black_money'] = {
        label = 'Dirty Money'
    },
    ['money'] = {
        label = 'Money'
    },
    ['crypto'] = {
        label = 'Crypto'
    },
    ['bank_card'] = {
        label = 'Bank Card',
        client = {
            image = 'bank_card.png'
        }
    },
    ['burger'] = {
        label = 'Burger',
        weight = 220,
        client = {
            status = {
                hunger = 200000
            },
            anim = 'eating',
            prop = 'burger',
            usetime = 2500,
            notification = 'You ate a delicious burger'
        }
    },
    ['sprunk'] = {
        label = 'Sprunk',
        weight = 350,
        client = {
            status = {
                thirst = 200000
            },
            anim = {
                dict = 'mp_player_intdrink',
                clip = 'loop_bottle'
            },
            prop = {
                model = prop_ld_can_01,
                pos = vec3(0.01, 0.01, 0.06),
                rot = vec3(5.0, 5.0, -180.5)
            },
            usetime = 2500,
            notification = 'You quenched your thirst with a sprunk'
        }
    },
    ['parachute'] = {
        label = 'Parachute',
        weight = 8000,
        stack = false,
        client = {
            anim = {
                dict = 'clothingshirt',
                clip = 'try_shirt_positive_d'
            },
            usetime = 1500
        }
    },
    ['garbage'] = {
        label = 'Garbage'
    },
    ['paperbag'] = {
        label = 'Paper Bag',
        weight = 1,
        stack = false,
        close = false,
        consume = 0
    },
    ['identification'] = {
        label = 'Identification',
        client = {
            image = 'card_id.png'
        }
    },
    ['panties'] = {
        label = 'Knickers',
        weight = 10,
        consume = 0,
        client = {
            status = {
                thirst = -100000,
                stress = -25000
            },
            anim = {
                dict = 'mp_player_intdrink',
                clip = 'loop_bottle'
            },
            prop = {
                model = prop_cs_panties_02,
                pos = vec3(0.03, 0.0, 0.02),
                rot = vec3(0.0, -13.5, -1.5)
            },
            usetime = 2500
        }
    },
    ['lockpick'] = {
        label = 'Lockpick',
        weight = 160
    },
    ['phone'] = {
        label = 'Phone',
        weight = 190,
        stack = false,
        consume = 0,
        client = {
            add = function(total)
                if total > 0 then
                    pcall(function()
                        return exports.npwd:setPhoneDisabled(false)
                    end)
                end
            end,

            remove = function(total)
                if total < 1 then
                    pcall(function()
                        return exports.npwd:setPhoneDisabled(true)
                    end)
                end
            end
        }
    },
    ['mustard'] = {
        label = 'Mustard',
        weight = 500,
        client = {
            status = {
                hunger = 25000,
                thirst = 25000
            },
            anim = {
                dict = 'mp_player_intdrink',
                clip = 'loop_bottle'
            },
            prop = {
                model = prop_food_mustard,
                pos = vec3(0.01, 0.0, -0.07),
                rot = vec3(1.0, 1.0, -1.5)
            },
            usetime = 2500,
            notification = 'You.. drank mustard'
        }
    },
    ['water'] = {
        label = 'Water',
        weight = 500,
        client = {
            status = {
                thirst = 200000
            },
            anim = {
                dict = 'mp_player_intdrink',
                clip = 'loop_bottle'
            },
            prop = {
                model = prop_ld_flow_bottle,
                pos = vec3(0.03, 0.03, 0.02),
                rot = vec3(0.0, 0.0, -1.5)
            },
            usetime = 2500,
            cancel = true,
            notification = 'You drank some refreshing water'
        }
    },
    ['radio'] = {
        label = 'Radio',
        weight = 1000,
        stack = false,
        allowArmed = true
    },
    ['armour'] = {
        label = 'Bulletproof Vest',
        weight = 3000,
        stack = false,
        client = {
            anim = {
                dict = 'clothingshirt',
                clip = 'try_shirt_positive_d'
            },
            usetime = 3500
        }
    },
    ['clothing'] = {
        label = 'Clothing',
        consume = 0
    },
    ['mastercard'] = {
        label = 'Fleeca Card',
        stack = false,
        weight = 10,
        client = {
            image = 'card_bank.png'
        }
    },
    ['scrapmetal'] = {
        label = 'Scrap Metal',
        weight = 80
    },
    ['weapon_specialcarbine_mk2'] = {
        name = 'weapon_specialcarbine_mk2',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['weapontint_0'] = {
        name = 'weapontint_0',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['trojan_usb'] = {
        name = 'trojan_usb',
        weight = 0,
        stack = false,
        allowArmed = false
    },
    ['rolling_paper'] = {
        name = 'rolling_paper',
        weight = 0,
        stack = false,
        allowArmed = false
    },
    ['weapon_snspistol_mk2'] = {
        name = 'weapon_snspistol_mk2',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['weapontint_mk2_2'] = {
        name = 'weapontint_mk2_2',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['digicamo_attachment'] = {
        name = 'digicamo_attachment',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['bandage'] = {
        name = 'bandage',
        weight = 0,
        stack = false,
        allowArmed = false
    },
    ['weapontint_mk2_12'] = {
        name = 'weapontint_mk2_12',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['weapon_fireextinguisher'] = {
        name = 'weapon_fireextinguisher',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['firework1'] = {
        name = 'firework1',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['weapontint_7'] = {
        name = 'weapontint_7',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['weapon_autoshotgun'] = {
        name = 'weapon_autoshotgun',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['drum_attachment'] = {
        name = 'drum_attachment',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['holoscope_attachment'] = {
        name = 'holoscope_attachment',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['weed_whitewidow_seed'] = {
        name = 'weed_whitewidow_seed',
        weight = 0,
        stack = false,
        allowArmed = false
    },
    ['weapontint_mk2_22'] = {
        name = 'weapontint_mk2_22',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['weapontint_mk2_4'] = {
        name = 'weapontint_mk2_4',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['weapon_combatpistol'] = {
        name = 'weapon_combatpistol',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['weapon_dagger'] = {
        name = 'weapon_dagger',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['firework3'] = {
        name = 'firework3',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['weapon_switchblade'] = {
        name = 'weapon_switchblade',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['weapon_snspistol'] = {
        name = 'weapon_snspistol',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['kurkakola'] = {
        name = 'kurkakola',
        weight = 500,
        stack = false,
        allowArmed = false
    },
    ['heavy_duty_muzzle_brake'] = {
        name = 'heavy_duty_muzzle_brake',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['weapon_proxmine'] = {
        name = 'weapon_proxmine',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['cokebaggy'] = {
        name = 'cokebaggy',
        weight = 0,
        stack = false,
        allowArmed = false
    },
    ['aluminum'] = {
        name = 'aluminum',
        weight = 100,
        stack = false,
        allowArmed = false
    },
    ['weapon_machete'] = {
        name = 'weapon_machete',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['weapon_militaryrifle'] = {
        name = 'weapon_militaryrifle',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['smg_ammo'] = {
        name = 'smg_ammo',
        weight = 500,
        stack = false,
        allowArmed = false
    },
    ['flat_muzzle_brake'] = {
        name = 'flat_muzzle_brake',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['weapon_candycane'] = {
        name = 'weapon_candycane',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['veh_exterior'] = {
        name = 'veh_exterior',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['weapontint_1'] = {
        name = 'weapontint_1',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['weapon_stone_hatchet'] = {
        name = 'weapon_stone_hatchet',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['diamond'] = {
        name = 'diamond',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['weapontint_mk2_1'] = {
        name = 'weapontint_mk2_1',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['weapon_stickybomb'] = {
        name = 'weapon_stickybomb',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['coke_brick'] = {
        name = 'coke_brick',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['tunerlaptop'] = {
        name = 'tunerlaptop',
        weight = 2000,
        stack = false,
        allowArmed = false
    },
    ['weapon_petrolcan'] = {
        name = 'weapon_petrolcan',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['weapon_microsmg'] = {
        name = 'weapon_microsmg',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['ifaks'] = {
        name = 'ifaks',
        weight = 200,
        stack = false,
        allowArmed = false
    },
    ['electronickit'] = {
        name = 'electronickit',
        weight = 100,
        stack = false,
        allowArmed = false
    },
    ['weapon_remotesniper'] = {
        name = 'weapon_remotesniper',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['weapon_smokegrenade'] = {
        name = 'weapon_smokegrenade',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['tactical_muzzle_brake'] = {
        name = 'tactical_muzzle_brake',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['weapontint_mk2_15'] = {
        name = 'weapontint_mk2_15',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['weapon_flaregun'] = {
        name = 'weapon_flaregun',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['weapon_pistolxm3'] = {
        name = 'weapon_pistolxm3',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['weapon_carbinerifle_mk2'] = {
        name = 'weapon_carbinerifle_mk2',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['weapon_minismg'] = {
        name = 'weapon_minismg',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['advancedlockpick'] = {
        name = 'advancedlockpick',
        weight = 500,
        stack = false,
        allowArmed = false
    },
    ['antipatharia_coral'] = {
        name = 'antipatharia_coral',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['weapon_ball'] = {
        name = 'weapon_ball',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['veh_interior'] = {
        name = 'veh_interior',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['tirerepairkit'] = {
        name = 'tirerepairkit',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['weapon_assaultrifle'] = {
        name = 'weapon_assaultrifle',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['weapon_assaultsmg'] = {
        name = 'weapon_assaultsmg',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['fat_end_muzzle_brake'] = {
        name = 'fat_end_muzzle_brake',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['weapontint_mk2_19'] = {
        name = 'weapontint_mk2_19',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['weapontint_mk2_11'] = {
        name = 'weapontint_mk2_11',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['weapontint_mk2_30'] = {
        name = 'weapontint_mk2_30',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['weapontint_mk2_23'] = {
        name = 'weapontint_mk2_23',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['wine'] = {
        name = 'wine',
        weight = 300,
        stack = false,
        allowArmed = false
    },
    ['weapon_heavypistol'] = {
        name = 'weapon_heavypistol',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['woodcamo_attachment'] = {
        name = 'woodcamo_attachment',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['security_card_02'] = {
        name = 'security_card_02',
        weight = 0,
        stack = false,
        allowArmed = false
    },
    ['weapon_bullpuprifle'] = {
        name = 'weapon_bullpuprifle',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['weapon_doubleaction'] = {
        name = 'weapon_doubleaction',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['coke_small_brick'] = {
        name = 'coke_small_brick',
        weight = 350,
        stack = false,
        allowArmed = false
    },
    ['split_end_muzzle_brake'] = {
        name = 'split_end_muzzle_brake',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['weapon_hammer'] = {
        name = 'weapon_hammer',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['vodka'] = {
        name = 'vodka',
        weight = 500,
        stack = false,
        allowArmed = false
    },
    ['weapon_bat'] = {
        name = 'weapon_bat',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['weapontint_mk2_21'] = {
        name = 'weapontint_mk2_21',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['weapon_bottle'] = {
        name = 'weapon_bottle',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['weapon_knuckle'] = {
        name = 'weapon_knuckle',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['filled_evidence_bag'] = {
        name = 'filled_evidence_bag',
        weight = 200,
        stack = false,
        allowArmed = false
    },
    ['weapon_briefcase_02'] = {
        name = 'weapon_briefcase_02',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['weapontint_mk2_5'] = {
        name = 'weapontint_mk2_5',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['aluminumoxide'] = {
        name = 'aluminumoxide',
        weight = 100,
        stack = false,
        allowArmed = false
    },
    ['perseuscamo_attachment'] = {
        name = 'perseuscamo_attachment',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['weapontint_mk2_9'] = {
        name = 'weapontint_mk2_9',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['ironoxide'] = {
        name = 'ironoxide',
        weight = 100,
        stack = false,
        allowArmed = false
    },
    ['weapon_rpg'] = {
        name = 'weapon_rpg',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['sessantacamo_attachment'] = {
        name = 'sessantacamo_attachment',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['brushcamo_attachment'] = {
        name = 'brushcamo_attachment',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['id_card'] = {
        name = 'id_card',
        weight = 0,
        stack = false,
        allowArmed = false
    },
    ['newsbmic'] = {
        name = 'newsbmic',
        weight = 100,
        stack = false,
        allowArmed = false
    },
    ['xtcbaggy'] = {
        name = 'xtcbaggy',
        weight = 0,
        stack = false,
        allowArmed = false
    },
    ['weed_purplehaze_seed'] = {
        name = 'weed_purplehaze_seed',
        weight = 0,
        stack = false,
        allowArmed = false
    },
    ['weapon_combatmg'] = {
        name = 'weapon_combatmg',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['nitrous'] = {
        name = 'nitrous',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['weapon_hatchet'] = {
        name = 'weapon_hatchet',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['whiskey'] = {
        name = 'whiskey',
        weight = 500,
        stack = false,
        allowArmed = false
    },
    ['binoculars'] = {
        name = 'binoculars',
        weight = 600,
        stack = false,
        allowArmed = false
    },
    ['veh_toolbox'] = {
        name = 'veh_toolbox',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['geocamo_attachment'] = {
        name = 'geocamo_attachment',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['weapontint_4'] = {
        name = 'weapontint_4',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['water_bottle'] = {
        name = 'water_bottle',
        weight = 500,
        stack = false,
        allowArmed = false
    },
    ['weapontint_mk2_18'] = {
        name = 'weapontint_mk2_18',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['weapontint_5'] = {
        name = 'weapontint_5',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['rolex'] = {
        name = 'rolex',
        weight = 1500,
        stack = false,
        allowArmed = false
    },
    ['coffee'] = {
        name = 'coffee',
        weight = 200,
        stack = false,
        allowArmed = false
    },
    ['weapon_molotov'] = {
        name = 'weapon_molotov',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['weapon_revolver'] = {
        name = 'weapon_revolver',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['empty_evidence_bag'] = {
        name = 'empty_evidence_bag',
        weight = 0,
        stack = false,
        allowArmed = false
    },
    ['weapon_gusenberg'] = {
        name = 'weapon_gusenberg',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['weapon_pistol'] = {
        name = 'weapon_pistol',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['weapontint_2'] = {
        name = 'weapontint_2',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['driver_license'] = {
        name = 'driver_license',
        weight = 0,
        stack = false,
        allowArmed = false
    },
    ['weapon_bzgas'] = {
        name = 'weapon_bzgas',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['advscope_attachment'] = {
        name = 'advscope_attachment',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['weed_nutrition'] = {
        name = 'weed_nutrition',
        weight = 2000,
        stack = false,
        allowArmed = false
    },
    ['veh_engine'] = {
        name = 'veh_engine',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['weapon_marksmanrifle'] = {
        name = 'weapon_marksmanrifle',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['weapontint_mk2_8'] = {
        name = 'weapontint_mk2_8',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['veh_plates'] = {
        name = 'veh_plates',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['laptop'] = {
        name = 'laptop',
        weight = 4000,
        stack = false,
        allowArmed = false
    },
    ['handcuffs'] = {
        name = 'handcuffs',
        weight = 100,
        stack = false,
        allowArmed = false
    },
    ['weapon_railgun'] = {
        name = 'weapon_railgun',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['weapon_combatshotgun'] = {
        name = 'weapon_combatshotgun',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['diving_fill'] = {
        name = 'diving_fill',
        weight = 3000,
        stack = false,
        allowArmed = false
    },
    ['weapon_grenadelauncher_smoke'] = {
        name = 'weapon_grenadelauncher_smoke',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['weapon_carbinerifle'] = {
        name = 'weapon_carbinerifle',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['weapontint_mk2_10'] = {
        name = 'weapontint_mk2_10',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['veh_neons'] = {
        name = 'veh_neons',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['markedbills'] = {
        name = 'markedbills',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['bank_card'] = {
        name = 'bank_card',
        weight = 0,
        stack = false,
        allowArmed = false
    },
    ['weapon_smg_mk2'] = {
        name = 'weapon_smg_mk2',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['weapon_marksmanpistol'] = {
        name = 'weapon_marksmanpistol',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['weapontint_mk2_28'] = {
        name = 'weapontint_mk2_28',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['weapontint_mk2_16'] = {
        name = 'weapontint_mk2_16',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['security_card_01'] = {
        name = 'security_card_01',
        weight = 0,
        stack = false,
        allowArmed = false
    },
    ['weapon_poolcue'] = {
        name = 'weapon_poolcue',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['dendrogyra_coral'] = {
        name = 'dendrogyra_coral',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['weapon_grenadelauncher'] = {
        name = 'weapon_grenadelauncher',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['thermalscope_attachment'] = {
        name = 'thermalscope_attachment',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['patriotcamo_attachment'] = {
        name = 'patriotcamo_attachment',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['weapon_handcuffs'] = {
        name = 'weapon_handcuffs',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['veh_armor'] = {
        name = 'veh_armor',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['labkey'] = {
        name = 'labkey',
        weight = 500,
        stack = false,
        allowArmed = false
    },
    ['weapon_heavysniper'] = {
        name = 'weapon_heavysniper',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['weapon_snowball'] = {
        name = 'weapon_snowball',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['weapon_heavysniper_mk2'] = {
        name = 'weapon_heavysniper_mk2',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['weapon_assaultrifle_mk2'] = {
        name = 'weapon_assaultrifle_mk2',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['weapon_machinepistol'] = {
        name = 'weapon_machinepistol',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['weapon_navyrevolver'] = {
        name = 'weapon_navyrevolver',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['weapontint_mk2_6'] = {
        name = 'weapontint_mk2_6',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['certificate'] = {
        name = 'certificate',
        weight = 0,
        stack = false,
        allowArmed = false
    },
    ['weapon_pipebomb'] = {
        name = 'weapon_pipebomb',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['weapon_unarmed'] = {
        name = 'weapon_unarmed',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['weapon_garbagebag'] = {
        name = 'weapon_garbagebag',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['weed_amnesia_seed'] = {
        name = 'weed_amnesia_seed',
        weight = 0,
        stack = false,
        allowArmed = false
    },
    ['weapon_rayminigun'] = {
        name = 'weapon_rayminigun',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['weapontint_mk2_24'] = {
        name = 'weapontint_mk2_24',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['weapontint_mk2_31'] = {
        name = 'weapontint_mk2_31',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['weapon_pistol50'] = {
        name = 'weapon_pistol50',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['weapon_bread'] = {
        name = 'weapon_bread',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['weapon_musket'] = {
        name = 'weapon_musket',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['empty_weed_bag'] = {
        name = 'empty_weed_bag',
        weight = 0,
        stack = false,
        allowArmed = false
    },
    ['weapon_bullpupshotgun'] = {
        name = 'weapon_bullpupshotgun',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['weapon_mg'] = {
        name = 'weapon_mg',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['boomcamo_attachment'] = {
        name = 'boomcamo_attachment',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['samsungphone'] = {
        name = 'samsungphone',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['drill'] = {
        name = 'drill',
        weight = 20000,
        stack = false,
        allowArmed = false
    },
    ['weapon_firework'] = {
        name = 'weapon_firework',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['tablet'] = {
        name = 'tablet',
        weight = 2000,
        stack = false,
        allowArmed = false
    },
    ['weapon_minigun'] = {
        name = 'weapon_minigun',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['diving_gear'] = {
        name = 'diving_gear',
        weight = 30000,
        stack = false,
        allowArmed = false
    },
    ['weapon_raypistol'] = {
        name = 'weapon_raypistol',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['newsmic'] = {
        name = 'newsmic',
        weight = 100,
        stack = false,
        allowArmed = false
    },
    ['tosti'] = {
        name = 'tosti',
        weight = 200,
        stack = false,
        allowArmed = false
    },
    ['printerdocument'] = {
        name = 'printerdocument',
        weight = 500,
        stack = false,
        allowArmed = false
    },
    ['lighter'] = {
        name = 'lighter',
        weight = 0,
        stack = false,
        allowArmed = false
    },
    ['meth'] = {
        name = 'meth',
        weight = 100,
        stack = false,
        allowArmed = false
    },
    ['parachute'] = {
        name = 'parachute',
        weight = 30000,
        stack = false,
        allowArmed = false
    },
    ['veh_brakes'] = {
        name = 'veh_brakes',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['stickynote'] = {
        name = 'stickynote',
        weight = 0,
        stack = false,
        allowArmed = false
    },
    ['twerks_candy'] = {
        name = 'twerks_candy',
        weight = 100,
        stack = false,
        allowArmed = false
    },
    ['lawyerpass'] = {
        name = 'lawyerpass',
        weight = 0,
        stack = false,
        allowArmed = false
    },
    ['casinochips'] = {
        name = 'casinochips',
        weight = 0,
        stack = false,
        allowArmed = false
    },
    ['firework4'] = {
        name = 'firework4',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['weapon_specialcarbine'] = {
        name = 'weapon_specialcarbine',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['leopardcamo_attachment'] = {
        name = 'leopardcamo_attachment',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['pinger'] = {
        name = 'pinger',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['goldbar'] = {
        name = 'goldbar',
        weight = 7000,
        stack = false,
        allowArmed = false
    },
    ['weapon_advancedrifle'] = {
        name = 'weapon_advancedrifle',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['police_stormram'] = {
        name = 'police_stormram',
        weight = 18000,
        stack = false,
        allowArmed = false
    },
    ['snikkel_candy'] = {
        name = 'snikkel_candy',
        weight = 100,
        stack = false,
        allowArmed = false
    },
    ['iphone'] = {
        name = 'iphone',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['heavyarmor'] = {
        name = 'heavyarmor',
        weight = 5000,
        stack = false,
        allowArmed = false
    },
    ['squared_muzzle_brake'] = {
        name = 'squared_muzzle_brake',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['armor'] = {
        name = 'armor',
        weight = 5000,
        stack = false,
        allowArmed = false
    },
    ['weapon_knife'] = {
        name = 'weapon_knife',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['tenkgoldchain'] = {
        name = 'tenkgoldchain',
        weight = 2000,
        stack = false,
        allowArmed = false
    },
    ['flashlight_attachment'] = {
        name = 'flashlight_attachment',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['radioscanner'] = {
        name = 'radioscanner',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['diamond_ring'] = {
        name = 'diamond_ring',
        weight = 1500,
        stack = false,
        allowArmed = false
    },
    ['weapontint_mk2_0'] = {
        name = 'weapontint_mk2_0',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['steel'] = {
        name = 'steel',
        weight = 100,
        stack = false,
        allowArmed = false
    },
    ['goldchain'] = {
        name = 'goldchain',
        weight = 1500,
        stack = false,
        allowArmed = false
    },
    ['fitbit'] = {
        name = 'fitbit',
        weight = 500,
        stack = false,
        allowArmed = false
    },
    ['crack_baggy'] = {
        name = 'crack_baggy',
        weight = 0,
        stack = false,
        allowArmed = false
    },
    ['weed_skunk'] = {
        name = 'weed_skunk',
        weight = 200,
        stack = false,
        allowArmed = false
    },
    ['weapon_flashlight'] = {
        name = 'weapon_flashlight',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['nvscope_attachment'] = {
        name = 'nvscope_attachment',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['pistol_ammo'] = {
        name = 'pistol_ammo',
        weight = 200,
        stack = false,
        allowArmed = false
    },
    ['weapon_gadgetpistol'] = {
        name = 'weapon_gadgetpistol',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['walkstick'] = {
        name = 'walkstick',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['painkillers'] = {
        name = 'painkillers',
        weight = 0,
        stack = false,
        allowArmed = false
    },
    ['beer'] = {
        name = 'beer',
        weight = 500,
        stack = false,
        allowArmed = false
    },
    ['weapon_compactlauncher'] = {
        name = 'weapon_compactlauncher',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['weed_skunk_seed'] = {
        name = 'weed_skunk_seed',
        weight = 0,
        stack = false,
        allowArmed = false
    },
    ['firstaid'] = {
        name = 'firstaid',
        weight = 2500,
        stack = false,
        allowArmed = false
    },
    ['veh_tint'] = {
        name = 'veh_tint',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['weapon_golfclub'] = {
        name = 'weapon_golfclub',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['veh_xenons'] = {
        name = 'veh_xenons',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['advancedrepairkit'] = {
        name = 'advancedrepairkit',
        weight = 4000,
        stack = false,
        allowArmed = false
    },
    ['weapon_grenade'] = {
        name = 'weapon_grenade',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['weapon_nightstick'] = {
        name = 'weapon_nightstick',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['veh_turbo'] = {
        name = 'veh_turbo',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['veh_suspension'] = {
        name = 'veh_suspension',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['weapon_crowbar'] = {
        name = 'weapon_crowbar',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['weapon_appistol'] = {
        name = 'weapon_appistol',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['veh_transmission'] = {
        name = 'veh_transmission',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['weapon_heavyshotgun'] = {
        name = 'weapon_heavyshotgun',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['weapon_vintagepistol'] = {
        name = 'weapon_vintagepistol',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['moneybag'] = {
        name = 'moneybag',
        weight = 0,
        stack = false,
        allowArmed = false
    },
    ['weapon_flare'] = {
        name = 'weapon_flare',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['weapon_ceramicpistol'] = {
        name = 'weapon_ceramicpistol',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['bellend_muzzle_brake'] = {
        name = 'bellend_muzzle_brake',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['sandwich'] = {
        name = 'sandwich',
        weight = 200,
        stack = false,
        allowArmed = false
    },
    ['mg_ammo'] = {
        name = 'mg_ammo',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['glass'] = {
        name = 'glass',
        weight = 100,
        stack = false,
        allowArmed = false
    },
    ['weapon_combatmg_mk2'] = {
        name = 'weapon_combatmg_mk2',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['cleaningkit'] = {
        name = 'cleaningkit',
        weight = 250,
        stack = false,
        allowArmed = false
    },
    ['veh_wheels'] = {
        name = 'veh_wheels',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['weapon_revolver_mk2'] = {
        name = 'weapon_revolver_mk2',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['weed_purplehaze'] = {
        name = 'weed_purplehaze',
        weight = 200,
        stack = false,
        allowArmed = false
    },
    ['emp_ammo'] = {
        name = 'emp_ammo',
        weight = 200,
        stack = false,
        allowArmed = false
    },
    ['gatecrack'] = {
        name = 'gatecrack',
        weight = 0,
        stack = false,
        allowArmed = false
    },
    ['lockpick'] = {
        name = 'lockpick',
        weight = 300,
        stack = false,
        allowArmed = false
    },
    ['harness'] = {
        name = 'harness',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['weapon_sniperrifle'] = {
        name = 'weapon_sniperrifle',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['barrel_attachment'] = {
        name = 'barrel_attachment',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['weed_whitewidow'] = {
        name = 'weed_whitewidow',
        weight = 200,
        stack = false,
        allowArmed = false
    },
    ['cryptostick'] = {
        name = 'cryptostick',
        weight = 200,
        stack = false,
        allowArmed = false
    },
    ['iron'] = {
        name = 'iron',
        weight = 100,
        stack = false,
        allowArmed = false
    },
    ['copper'] = {
        name = 'copper',
        weight = 100,
        stack = false,
        allowArmed = false
    },
    ['metalscrap'] = {
        name = 'metalscrap',
        weight = 100,
        stack = false,
        allowArmed = false
    },
    ['oxy'] = {
        name = 'oxy',
        weight = 0,
        stack = false,
        allowArmed = false
    },
    ['weapon_wrench'] = {
        name = 'weapon_wrench',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['weed_ak47_seed'] = {
        name = 'weed_ak47_seed',
        weight = 0,
        stack = false,
        allowArmed = false
    },
    ['weed_ogkush_seed'] = {
        name = 'weed_ogkush_seed',
        weight = 0,
        stack = false,
        allowArmed = false
    },
    ['weapon_briefcase'] = {
        name = 'weapon_briefcase',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['screwdriverset'] = {
        name = 'screwdriverset',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['weed_amnesia'] = {
        name = 'weed_amnesia',
        weight = 200,
        stack = false,
        allowArmed = false
    },
    ['weapon_combatpdw'] = {
        name = 'weapon_combatpdw',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['weed_ogkush'] = {
        name = 'weed_ogkush',
        weight = 200,
        stack = false,
        allowArmed = false
    },
    ['weed_ak47'] = {
        name = 'weed_ak47',
        weight = 200,
        stack = false,
        allowArmed = false
    },
    ['rubber'] = {
        name = 'rubber',
        weight = 100,
        stack = false,
        allowArmed = false
    },
    ['snp_ammo'] = {
        name = 'snp_ammo',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['weapontint_mk2_3'] = {
        name = 'weapontint_mk2_3',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['precision_muzzle_brake'] = {
        name = 'precision_muzzle_brake',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['plastic'] = {
        name = 'plastic',
        weight = 100,
        stack = false,
        allowArmed = false
    },
    ['weapon_dbshotgun'] = {
        name = 'weapon_dbshotgun',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['weed_brick'] = {
        name = 'weed_brick',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['weapon_sawnoffshotgun'] = {
        name = 'weapon_sawnoffshotgun',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['joint'] = {
        name = 'joint',
        weight = 0,
        stack = false,
        allowArmed = false
    },
    ['grapejuice'] = {
        name = 'grapejuice',
        weight = 200,
        stack = false,
        allowArmed = false
    },
    ['weapontint_mk2_17'] = {
        name = 'weapontint_mk2_17',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['jerry_can'] = {
        name = 'jerry_can',
        weight = 20000,
        stack = false,
        allowArmed = false
    },
    ['newscam'] = {
        name = 'newscam',
        weight = 100,
        stack = false,
        allowArmed = false
    },
    ['weapon_railgunxm3'] = {
        name = 'weapon_railgunxm3',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['thermite'] = {
        name = 'thermite',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['weapon_stungun'] = {
        name = 'weapon_stungun',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['luxuryfinish_attachment'] = {
        name = 'luxuryfinish_attachment',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['weapontint_mk2_20'] = {
        name = 'weapontint_mk2_20',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['phone'] = {
        name = 'phone',
        weight = 700,
        stack = false,
        allowArmed = false
    },
    ['weapontint_mk2_32'] = {
        name = 'weapontint_mk2_32',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['rifle_ammo'] = {
        name = 'rifle_ammo',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['weapon_assaultshotgun'] = {
        name = 'weapon_assaultshotgun',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['weapontint_mk2_27'] = {
        name = 'weapontint_mk2_27',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['weapon_pistol_mk2'] = {
        name = 'weapon_pistol_mk2',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['weapontint_mk2_26'] = {
        name = 'weapontint_mk2_26',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['smallscope_attachment'] = {
        name = 'smallscope_attachment',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['weapontint_mk2_7'] = {
        name = 'weapontint_mk2_7',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['weapontint_mk2_25'] = {
        name = 'weapontint_mk2_25',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['grape'] = {
        name = 'grape',
        weight = 100,
        stack = false,
        allowArmed = false
    },
    ['weapontint_mk2_14'] = {
        name = 'weapontint_mk2_14',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['firework2'] = {
        name = 'firework2',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['weapontint_mk2_29'] = {
        name = 'weapontint_mk2_29',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['weapon_bullpuprifle_mk2'] = {
        name = 'weapon_bullpuprifle_mk2',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['weapontint_3'] = {
        name = 'weapontint_3',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['weapon_smg'] = {
        name = 'weapon_smg',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['zebracamo_attachment'] = {
        name = 'zebracamo_attachment',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['comp_attachment'] = {
        name = 'comp_attachment',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['weapontint_mk2_13'] = {
        name = 'weapontint_mk2_13',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['weaponlicense'] = {
        name = 'weaponlicense',
        weight = 0,
        stack = false,
        allowArmed = false
    },
    ['weapon_raycarbine'] = {
        name = 'weapon_raycarbine',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['weapontint_6'] = {
        name = 'weapontint_6',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['grip_attachment'] = {
        name = 'grip_attachment',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['medscope_attachment'] = {
        name = 'medscope_attachment',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['weapon_pumpshotgun_mk2'] = {
        name = 'weapon_pumpshotgun_mk2',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['largescope_attachment'] = {
        name = 'largescope_attachment',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['slanted_muzzle_brake'] = {
        name = 'slanted_muzzle_brake',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['suppressor_attachment'] = {
        name = 'suppressor_attachment',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['clip_attachment'] = {
        name = 'clip_attachment',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['weapon_hazardcan'] = {
        name = 'weapon_hazardcan',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['weapon_hominglauncher'] = {
        name = 'weapon_hominglauncher',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['skullcamo_attachment'] = {
        name = 'skullcamo_attachment',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['weapon_marksmanrifle_mk2'] = {
        name = 'weapon_marksmanrifle_mk2',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['weapon_compactrifle'] = {
        name = 'weapon_compactrifle',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['weapon_pumpshotgun'] = {
        name = 'weapon_pumpshotgun',
        weight = 1000,
        stack = false,
        allowArmed = false
    },
    ['repairkit'] = {
        name = 'repairkit',
        weight = 2500,
        stack = false,
        allowArmed = false
    },
    ['shotgun_ammo'] = {
        name = 'shotgun_ammo',
        weight = 500,
        stack = false,
        allowArmed = false
    },
    ['weapon_battleaxe'] = {
        name = 'weapon_battleaxe',
        weight = 1000,
        stack = false,
        allowArmed = false
    }

}
