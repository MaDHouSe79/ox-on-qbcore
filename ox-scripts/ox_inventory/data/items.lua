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
    --------------------------------------------------------------------

    ['diving_fill'] = {
        label = 'Diving Tube',
        weight = 3000,
        client = {
            image = 'diving_tube.png',
        },
    },
    ['weapontint_2'] = {
        label = 'Gold Tint',
        weight = 1000,
        client = {
            image = 'weapontint_gold.png',
        },
    },
    ['weed_brick'] = {
        label = 'Weed Brick',
        weight = 1000,
        client = {
            image = 'weed_brick.png',
        },
    },
    ['weapon_firework'] = {
        label = 'Firework Launcher',
        weight = 1000,
        client = {
            image = 'weapon_firework.png',
        },
    },
    ['weapon_combatpistol'] = {
        label = 'Combat Pistol',
        weight = 1000,
        client = {
            image = 'weapon_combatpistol.png',
        },
    },
    ['rubber'] = {
        label = 'Rubber',
        weight = 100,
        client = {
            image = 'rubber.png',
        },
    },
    ['cokebaggy'] = {
        label = 'Bag of Coke',
        weight = 0,
        client = {
            image = 'cocaine_baggy.png',
        },
    },
    ['veh_brakes'] = {
        label = 'Brakes',
        weight = 1000,
        client = {
            image = 'veh_brakes.png',
        },
    },
    ['weapon_grenadelauncher'] = {
        label = 'Grenade Launcher',
        weight = 1000,
        client = {
            image = 'weapon_grenadelauncher.png',
        },
    },
    ['weapontint_mk2_32'] = {
        label = 'Metallic Red and Yellow Tint',
        weight = 1000,
        client = {
            image = 'weapontint_black.png',
        },
    },
    ['weapontint_3'] = {
        label = 'Pink Tint',
        weight = 1000,
        client = {
            image = 'weapontint_pink.png',
        },
    },
    ['luxuryfinish_attachment'] = {
        label = 'Luxury Finish',
        weight = 1000,
        client = {
            image = 'luxuryfinish_attachment.png',
        },
    },
    ['stickynote'] = {
        label = 'Sticky note',
        weight = 0,
        client = {
            image = 'stickynote.png',
        },
    },
    ['holoscope_attachment'] = {
        label = 'Holo Scope',
        weight = 1000,
        client = {
            image = 'holoscope_attachment.png',
        },
    },
    ['weapon_smokegrenade'] = {
        label = 'Smoke Grenade',
        weight = 1000,
        client = {
            image = 'weapon_c4.png',
        },
    },
    ['grapejuice'] = {
        label = 'Grape Juice',
        weight = 200,
        client = {
            image = 'grapejuice.png',
        },
    },
    ['beer'] = {
        label = 'Beer',
        weight = 500,
        client = {
            image = 'beer.png',
        },
    },
    ['weapon_battleaxe'] = {
        label = 'Battle Axe',
        weight = 1000,
        client = {
            image = 'weapon_battleaxe.png',
        },
    },
    ['leopardcamo_attachment'] = {
        label = 'Leopard Camo',
        weight = 1000,
        client = {
            image = 'leopardcamo_attachment.png',
        },
    },
    ['weapon_golfclub'] = {
        label = 'Golfclub',
        weight = 1000,
        client = {
            image = 'weapon_golfclub.png',
        },
    },
    ['weapontint_0'] = {
        label = 'Default Tint',
        weight = 1000,
        client = {
            image = 'weapontint_black.png',
        },
    },
    ['firework4'] = {
        label = 'Weeping Willow',
        weight = 1000,
        client = {
            image = 'firework4.png',
        },
    },
    ['rolex'] = {
        label = 'Golden Watch',
        weight = 1500,
        client = {
            image = 'rolex.png',
        },
    },
    ['weapon_bullpupshotgun'] = {
        label = 'Bullpup Shotgun',
        weight = 1000,
        client = {
            image = 'weapon_bullpupshotgun.png',
        },
    },
    ['repairkit'] = {
        label = 'Repairkit',
        weight = 2500,
        client = {
            image = 'repairkit.png',
        },
    },
    ['weapon_poolcue'] = {
        label = 'Poolcue',
        weight = 1000,
        client = {
            image = 'weapon_poolcue.png',
        },
    },
    ['moneybag'] = {
        label = 'Money Bag',
        weight = 0,
        client = {
            image = 'moneybag.png',
        },
    },
    ['empty_weed_bag'] = {
        label = 'Empty Weed Bag',
        weight = 0,
        client = {
            image = 'weed_baggy_empty.png',
        },
    },
    ['advancedrepairkit'] = {
        label = 'Advanced Repairkit',
        weight = 4000,
        client = {
            image = 'advancedkit.png',
        },
    },
    ['skullcamo_attachment'] = {
        label = 'Skull Camo',
        weight = 1000,
        client = {
            image = 'skullcamo_attachment.png',
        },
    },
    ['weapon_bzgas'] = {
        label = 'BZ Gas',
        weight = 1000,
        client = {
            image = 'weapon_bzgas.png',
        },
    },
    ['weapon_petrolcan'] = {
        label = 'Petrol Can',
        weight = 1000,
        client = {
            image = 'weapon_petrolcan.png',
        },
    },
    ['weed_purplehaze'] = {
        label = 'Purple Haze 2g',
        weight = 200,
        client = {
            image = 'weed_baggy.png',
        },
    },
    ['nvscope_attachment'] = {
        label = 'Night Vision Scope',
        weight = 1000,
        client = {
            image = 'nvscope_attachment.png',
        },
    },
    ['weapon_combatmg_mk2'] = {
        label = 'Combat MG Mk II',
        weight = 1000,
        client = {
            image = 'weapon_combatmg_mk2.png',
        },
    },
    ['weapon_wrench'] = {
        label = 'Wrench',
        weight = 1000,
        client = {
            image = 'weapon_wrench.png',
        },
    },
    ['kurkakola'] = {
        label = 'Cola',
        weight = 500,
        client = {
            image = 'cola.png',
        },
    },
    ['weapontint_mk2_30'] = {
        label = 'Metallic White & Aqua Tint',
        weight = 1000,
        client = {
            image = 'weapontint_black.png',
        },
    },
    ['weapontint_mk2_18'] = {
        label = 'Bold Green Features Tint',
        weight = 1000,
        client = {
            image = 'weapontint_black.png',
        },
    },
    ['weapon_hominglauncher'] = {
        label = 'Homing Launcher',
        weight = 1000,
        client = {
            image = 'weapon_hominglauncher.png',
        },
    },
    ['weapon_assaultshotgun'] = {
        label = 'Assault Shotgun',
        weight = 1000,
        client = {
            image = 'weapon_assaultshotgun.png',
        },
    },
    ['weapon_compactlauncher'] = {
        label = 'Compact Launcher',
        weight = 1000,
        client = {
            image = 'weapon_compactlauncher.png',
        },
    },
    ['weapon_proxmine'] = {
        label = 'Proxmine Grenade',
        weight = 1000,
        client = {
            image = 'weapon_proximitymine.png',
        },
    },
    ['diving_gear'] = {
        label = 'Diving Gear',
        weight = 30000,
        client = {
            image = 'diving_gear.png',
        },
    },
    ['weapon_gusenberg'] = {
        label = 'Thompson SMG',
        weight = 1000,
        client = {
            image = 'weapon_gusenberg.png',
        },
    },
    ['weed_ak47'] = {
        label = 'AK47 2g',
        weight = 200,
        client = {
            image = 'weed_baggy.png',
        },
    },
    ['weapon_switchblade'] = {
        label = 'Switchblade',
        weight = 1000,
        client = {
            image = 'weapon_switchblade.png',
        },
    },
    ['id_card'] = {
        label = 'ID Card',
        weight = 0,
        client = {
            image = 'id_card.png',
        },
    },
    ['weapon_snowball'] = {
        label = 'Snowball',
        weight = 1000,
        client = {
            image = 'weapon_snowball.png',
        },
    },
    ['weapon_knife'] = {
        label = 'Knife',
        weight = 1000,
        client = {
            image = 'weapon_knife.png',
        },
    },
    ['weapon_snspistol_mk2'] = {
        label = 'SNS Pistol Mk II',
        weight = 1000,
        client = {
            image = 'weapon_snspistol_mk2.png',
        },
    },
    ['weapon_pistol_mk2'] = {
        label = 'Pistol Mk II',
        weight = 1000,
        client = {
            image = 'weapon_pistol_mk2.png',
        },
    },
    ['lawyerpass'] = {
        label = 'Lawyer Pass',
        weight = 0,
        client = {
            image = 'lawyerpass.png',
        },
    },
    ['weapon_doubleaction'] = {
        label = 'Double Action Revolver',
        weight = 1000,
        client = {
            image = 'weapon_doubleaction.png',
        },
    },
    ['weapon_pipebomb'] = {
        label = 'Pipe Bomb',
        weight = 1000,
        client = {
            image = 'weapon_pipebomb.png',
        },
    },
    ['weapon_candycane'] = {
        label = 'Candy Cane',
        weight = 1000,
        client = {
            image = 'weapon_candycane',
        },
    },
    ['weapontint_mk2_31'] = {
        label = 'Metallic Orange & Yellow Tint',
        weight = 1000,
        client = {
            image = 'weapontint_black.png',
        },
    },
    ['pinger'] = {
        label = 'Pinger',
        weight = 1000,
        client = {
            image = 'pinger.png',
        },
    },
    ['weapontint_mk2_23'] = {
        label = 'Metallic Gold Tint',
        weight = 1000,
        client = {
            image = 'weapontint_black.png',
        },
    },
    ['security_card_02'] = {
        label = 'Security Card B',
        weight = 0,
        client = {
            image = 'security_card_02.png',
        },
    },
    ['printerdocument'] = {
        label = 'Document',
        weight = 500,
        client = {
            image = 'printerdocument.png',
        },
    },
    ['trojan_usb'] = {
        label = 'Trojan USB',
        weight = 0,
        client = {
            image = 'usb_device.png',
        },
    },
    ['veh_turbo'] = {
        label = 'Turbo',
        weight = 1000,
        client = {
            image = 'veh_turbo.png',
        },
    },
    ['weapon_flaregun'] = {
        label = 'Flare Gun',
        weight = 1000,
        client = {
            image = 'weapon_flaregun.png',
        },
    },
    ['split_end_muzzle_brake'] = {
        label = 'Split End Muzzle Brake',
        weight = 1000,
        client = {
            image = 'split_end_muzzle_brake.png',
        },
    },
    ['coke_brick'] = {
        label = 'Coke Brick',
        weight = 1000,
        client = {
            image = 'coke_brick.png',
        },
    },
    ['weapon_minismg'] = {
        label = 'Mini SMG',
        weight = 1000,
        client = {
            image = 'weapon_minismg.png',
        },
    },
    ['patriotcamo_attachment'] = {
        label = 'Patriot Camo',
        weight = 1000,
        client = {
            image = 'patriotcamo_attachment.png',
        },
    },
    ['weapon_nightstick'] = {
        label = 'Nightstick',
        weight = 1000,
        client = {
            image = 'weapon_nightstick.png',
        },
    },
    ['weapon_vintagepistol'] = {
        label = 'Vintage Pistol',
        weight = 1000,
        client = {
            image = 'weapon_vintagepistol.png',
        },
    },
    ['weapontint_mk2_10'] = {
        label = 'Blue Contrast Tint',
        weight = 1000,
        client = {
            image = 'weapontint_black.png',
        },
    },
    ['zebracamo_attachment'] = {
        label = 'Zebra Camo',
        weight = 1000,
        client = {
            image = 'zebracamo_attachment.png',
        },
    },
    ['twerks_candy'] = {
        label = 'Twerks',
        weight = 100,
        client = {
            image = 'twerks_candy.png',
        },
    },
    ['weapon_heavypistol'] = {
        label = 'Heavy Pistol',
        weight = 1000,
        client = {
            image = 'weapon_heavypistol.png',
        },
    },
    ['police_stormram'] = {
        label = 'Stormram',
        weight = 18000,
        client = {
            image = 'police_stormram.png',
        },
    },
    ['pistol_ammo'] = {
        label = 'Pistol ammo',
        weight = 200,
        client = {
            image = 'pistol_ammo.png',
        },
    },
    ['weapon_railgunxm3'] = {
        label = 'Railgun XM3',
        weight = 1000,
        client = {
            image = 'weapon_railgunxm3.png',
        },
    },
    ['weapon_raycarbine'] = {
        label = 'Unholy Hellbringer',
        weight = 1000,
        client = {
            image = 'weapon_raycarbine.png',
        },
    },
    ['weapon_advancedrifle'] = {
        label = 'Advanced Rifle',
        weight = 1000,
        client = {
            image = 'weapon_advancedrifle.png',
        },
    },
    ['snikkel_candy'] = {
        label = 'Snikkel',
        weight = 100,
        client = {
            image = 'snikkel_candy.png',
        },
    },
    ['weapon_briefcase'] = {
        label = 'Briefcase',
        weight = 1000,
        client = {
            image = 'weapon_briefcase.png',
        },
    },
    ['weapon_autoshotgun'] = {
        label = 'Auto Shotgun',
        weight = 1000,
        client = {
            image = 'weapon_autoshotgun.png',
        },
    },
    ['weapon_appistol'] = {
        label = 'AP Pistol',
        weight = 1000,
        client = {
            image = 'weapon_appistol.png',
        },
    },
    ['glass'] = {
        label = 'Glass',
        weight = 100,
        client = {
            image = 'glass.png',
        },
    },
    ['weapon_bat'] = {
        label = 'Bat',
        weight = 1000,
        client = {
            image = 'weapon_bat.png',
        },
    },
    ['tosti'] = {
        label = 'Grilled Cheese Sandwich',
        weight = 200,
        client = {
            image = 'tosti.png',
        },
    },
    ['weapon_mg'] = {
        label = 'Machinegun',
        weight = 1000,
        client = {
            image = 'weapon_mg.png',
        },
    },
    ['diamond_ring'] = {
        label = 'Diamond Ring',
        weight = 1500,
        client = {
            image = 'diamond_ring.png',
        },
    },
    ['tenkgoldchain'] = {
        label = '10k Gold Chain',
        weight = 2000,
        client = {
            image = '10kgoldchain.png',
        },
    },
    ['weapon_dagger'] = {
        label = 'Dagger',
        weight = 1000,
        client = {
            image = 'weapon_dagger.png',
        },
    },
    ['painkillers'] = {
        label = 'Painkillers',
        weight = 0,
        client = {
            image = 'painkillers.png',
        },
    },
    ['weapon_hammer'] = {
        label = 'Hammer',
        weight = 1000,
        client = {
            image = 'weapon_hammer.png',
        },
    },
    ['weed_amnesia'] = {
        label = 'Amnesia 2g',
        weight = 200,
        client = {
            image = 'weed_baggy.png',
        },
    },
    ['security_card_01'] = {
        label = 'Security Card A',
        weight = 0,
        client = {
            image = 'security_card_01.png',
        },
    },
    ['weapon_pistol50'] = {
        label = 'Pistol .50',
        weight = 1000,
        client = {
            image = 'weapon_pistol50.png',
        },
    },
    ['weapon_bullpuprifle_mk2'] = {
        label = 'Bullpup Rifle Mk II',
        weight = 1000,
        client = {
            image = 'weapon_bullpuprifle_mk2.png',
        },
    },
    ['weapon_raypistol'] = {
        label = 'Up-n-Atomizer',
        weight = 1000,
        client = {
            image = 'weapon_raypistol.png',
        },
    },
    ['weapon_marksmanrifle'] = {
        label = 'Marksman Rifle',
        weight = 1000,
        client = {
            image = 'weapon_marksmanrifle.png',
        },
    },
    ['weapontint_mk2_28'] = {
        label = 'Metallic Green Tint',
        weight = 1000,
        client = {
            image = 'weapontint_black.png',
        },
    },
    ['weapontint_mk2_25'] = {
        label = 'Metallic Gray & Lilac Tint',
        weight = 1000,
        client = {
            image = 'weapontint_black.png',
        },
    },
    ['armor'] = {
        label = 'Armor',
        weight = 5000,
        client = {
            image = 'armor.png',
        },
    },
    ['squared_muzzle_brake'] = {
        label = 'Squared Muzzle Brake',
        weight = 1000,
        client = {
            image = 'squared_muzzle_brake.png',
        },
    },
    ['weed_nutrition'] = {
        label = 'Plant Fertilizer',
        weight = 2000,
        client = {
            image = 'weed_nutrition.png',
        },
    },
    ['sandwich'] = {
        label = 'Sandwich',
        weight = 200,
        client = {
            image = 'sandwich.png',
        },
    },
    ['weapontint_mk2_5'] = {
        label = 'Classic Green Tint',
        weight = 1000,
        client = {
            image = 'weapontint_black.png',
        },
    },
    ['firstaid'] = {
        label = 'First Aid',
        weight = 2500,
        client = {
            image = 'firstaid.png',
        },
    },
    ['oxy'] = {
        label = 'Prescription Oxy',
        weight = 0,
        client = {
            image = 'oxy.png',
        },
    },
    ['digicamo_attachment'] = {
        label = 'Digital Camo',
        weight = 1000,
        client = {
            image = 'digicamo_attachment.png',
        },
    },
    ['heavyarmor'] = {
        label = 'Heavy Armor',
        weight = 5000,
        client = {
            image = 'armor.png',
        },
    },
    ['smallscope_attachment'] = {
        label = 'Small Scope',
        weight = 1000,
        client = {
            image = 'smallscope_attachment.png',
        },
    },
    ['iron'] = {
        label = 'Iron',
        weight = 100,
        client = {
            image = 'iron.png',
        },
    },
    ['weapon_flare'] = {
        label = 'Flare pistol',
        weight = 1000,
        client = {
            image = 'weapon_flare.png',
        },
    },
    ['weapontint_mk2_7'] = {
        label = 'Classic Earth Tint',
        weight = 1000,
        client = {
            image = 'weapontint_black.png',
        },
    },
    ['weapon_ceramicpistol'] = {
        label = 'Ceramic Pistol',
        weight = 1000,
        client = {
            image = 'weapon_ceramicpistol.png',
        },
    },
    ['medscope_attachment'] = {
        label = 'Medium Scope',
        weight = 1000,
        client = {
            image = 'medscope_attachment.png',
        },
    },
    ['weapon_musket'] = {
        label = 'Musket',
        weight = 1000,
        client = {
            image = 'weapon_musket.png',
        },
    },
    ['weapon_machinepistol'] = {
        label = 'Tec-9',
        weight = 1000,
        client = {
            image = 'weapon_machinepistol.png',
        },
    },
    ['weapontint_mk2_16'] = {
        label = 'Bold Green & Purple Tint',
        weight = 1000,
        client = {
            image = 'weapontint_black.png',
        },
    },
    ['weapon_carbinerifle'] = {
        label = 'Carbine Rifle',
        weight = 1000,
        client = {
            image = 'weapon_carbinerifle.png',
        },
    },
    ['weapon_molotov'] = {
        label = 'Molotov',
        weight = 1000,
        client = {
            image = 'weapon_molotov.png',
        },
    },
    ['weapon_machete'] = {
        label = 'Machete',
        weight = 1000,
        client = {
            image = 'weapon_machete.png',
        },
    },
    ['weapon_stickybomb'] = {
        label = 'C4',
        weight = 1000,
        client = {
            image = 'weapon_stickybomb.png',
        },
    },
    ['weapon_microsmg'] = {
        label = 'Micro SMG',
        weight = 1000,
        client = {
            image = 'weapon_microsmg.png',
        },
    },
    ['thermite'] = {
        label = 'Thermite',
        weight = 1000,
        client = {
            image = 'thermite.png',
        },
    },
    ['xtcbaggy'] = {
        label = 'Bag of XTC',
        weight = 0,
        client = {
            image = 'xtc_baggy.png',
        },
    },
    ['weapon_marksmanpistol'] = {
        label = 'Marksman Pistol',
        weight = 1000,
        client = {
            image = 'weapon_marksmanpistol.png',
        },
    },
    ['weapon_hatchet'] = {
        label = 'Hatchet',
        weight = 1000,
        client = {
            image = 'weapon_hatchet.png',
        },
    },
    ['veh_toolbox'] = {
        label = 'Toolbox',
        weight = 1000,
        client = {
            image = 'veh_toolbox.png',
        },
    },
    ['gatecrack'] = {
        label = 'Gatecrack',
        weight = 0,
        client = {
            image = 'usb_device.png',
        },
    },
    ['slanted_muzzle_brake'] = {
        label = 'Slanted Muzzle Brake',
        weight = 1000,
        client = {
            image = 'slanted_muzzle_brake.png',
        },
    },
    ['harness'] = {
        label = 'Race Harness',
        weight = 1000,
        client = {
            image = 'harness.png',
        },
    },
    ['weapon_crowbar'] = {
        label = 'Crowbar',
        weight = 1000,
        client = {
            image = 'weapon_crowbar.png',
        },
    },
    ['weapon_militaryrifle'] = {
        label = 'Military Rifle',
        weight = 1000,
        client = {
            image = 'weapon_militaryrifle.png',
        },
    },
    ['geocamo_attachment'] = {
        label = 'Geometric Camo',
        weight = 1000,
        client = {
            image = 'geocamo_attachment.png',
        },
    },
    ['weapon_pumpshotgun_mk2'] = {
        label = 'Pumpshotgun Mk II',
        weight = 1000,
        client = {
            image = 'weapon_pumpshotgun_mk2.png',
        },
    },
    ['weaponlicense'] = {
        label = 'Weapon License',
        weight = 0,
        client = {
            image = 'weapon_license.png',
        },
    },
    ['firework3'] = {
        label = 'WipeOut',
        weight = 1000,
        client = {
            image = 'firework3.png',
        },
    },
    ['weapon_snspistol'] = {
        label = 'SNS Pistol',
        weight = 1000,
        client = {
            image = 'weapon_snspistol.png',
        },
    },
    ['weapon_sawnoffshotgun'] = {
        label = 'Sawn-off Shotgun',
        weight = 1000,
        client = {
            image = 'weapon_sawnoffshotgun.png',
        },
    },
    ['sessantacamo_attachment'] = {
        label = 'Sessanta Nove Camo',
        weight = 1000,
        client = {
            image = 'sessantacamo_attachment.png',
        },
    },
    ['weapontint_5'] = {
        label = 'LSPD Tint',
        weight = 1000,
        client = {
            image = 'weapontint_lspd.png',
        },
    },
    ['antipatharia_coral'] = {
        label = 'Antipatharia',
        weight = 1000,
        client = {
            image = 'antipatharia_coral.png',
        },
    },
    ['flashlight_attachment'] = {
        label = 'Flashlight',
        weight = 1000,
        client = {
            image = 'flashlight_attachment.png',
        },
    },
    ['weed_ogkush'] = {
        label = 'OGKush 2g',
        weight = 200,
        client = {
            image = 'weed_baggy.png',
        },
    },
    ['drum_attachment'] = {
        label = 'Drum',
        weight = 1000,
        client = {
            image = 'drum_attachment.png',
        },
    },
    ['filled_evidence_bag'] = {
        label = 'Evidence Bag',
        weight = 200,
        client = {
            image = 'evidence.png',
        },
    },
    ['weapon_carbinerifle_mk2'] = {
        label = 'Carbine Rifle Mk II',
        weight = 1000,
        client = {
            image = 'weapon_carbinerifle_mk2.png',
        },
    },
    ['weapontint_1'] = {
        label = 'Green Tint',
        weight = 1000,
        client = {
            image = 'weapontint_green.png',
        },
    },
    ['weapon_pistolxm3'] = {
        label = 'Pistol XM3',
        weight = 1000,
        client = {
            image = 'weapon_pistolxm3.png',
        },
    },
    ['wine'] = {
        label = 'Wine',
        weight = 300,
        client = {
            image = 'wine.png',
        },
    },
    ['veh_exterior'] = {
        label = 'Exterior',
        weight = 1000,
        client = {
            image = 'veh_exterior.png',
        },
    },
    ['weed_whitewidow'] = {
        label = 'White Widow 2g',
        weight = 200,
        client = {
            image = 'weed_baggy.png',
        },
    },
    ['heavy_duty_muzzle_brake'] = {
        label = 'HD Muzzle Brake',
        weight = 1000,
        client = {
            image = 'heavy_duty_muzzle_brake.png',
        },
    },
    ['weapon_navyrevolver'] = {
        label = 'Navy Revolver',
        weight = 1000,
        client = {
            image = 'weapon_navyrevolver.png',
        },
    },
    ['mg_ammo'] = {
        label = 'MG ammo',
        weight = 1000,
        client = {
            image = 'mg_ammo.png',
        },
    },
    ['weapontint_mk2_14'] = {
        label = 'Bold Purple & Yellow Tint',
        weight = 1000,
        client = {
            image = 'weapontint_black.png',
        },
    },
    ['weapon_combatmg'] = {
        label = 'Combat MG',
        weight = 1000,
        client = {
            image = 'weapon_combatmg.png',
        },
    },
    ['tablet'] = {
        label = 'Tablet',
        weight = 2000,
        client = {
            image = 'tablet.png',
        },
    },
    ['weapon_knuckle'] = {
        label = 'Knuckle',
        weight = 1000,
        client = {
            image = 'weapon_knuckle.png',
        },
    },
    ['newsbmic'] = {
        label = 'Boom Microphone',
        weight = 100,
        client = {
            image = 'newsbmic.png',
        },
    },
    ['weapon_grenade'] = {
        label = 'Grenade',
        weight = 1000,
        client = {
            image = 'weapon_grenade.png',
        },
    },
    ['flat_muzzle_brake'] = {
        label = 'Flat Muzzle Brake',
        weight = 1000,
        client = {
            image = 'flat_muzzle_brake.png',
        },
    },
    ['newsmic'] = {
        label = 'News Microphone',
        weight = 100,
        client = {
            image = 'newsmic.png',
        },
    },
    ['newscam'] = {
        label = 'News Camera',
        weight = 100,
        client = {
            image = 'newscam.png',
        },
    },
    ['labkey'] = {
        label = 'Key',
        weight = 500,
        client = {
            image = 'labkey.png',
        },
    },
    ['certificate'] = {
        label = 'Certificate',
        weight = 0,
        client = {
            image = 'certificate.png',
        },
    },
    ['weed_purplehaze_seed'] = {
        label = 'Purple Haze Seed',
        weight = 0,
        client = {
            image = 'weed_seed.png',
        },
    },
    ['weapon_marksmanrifle_mk2'] = {
        label = 'Marksman Rifle Mk II',
        weight = 1000,
        client = {
            image = 'weapon_marksmanrifle_mk2.png',
        },
    },
    ['advscope_attachment'] = {
        label = 'Advanced Scope',
        weight = 1000,
        client = {
            image = 'advscope_attachment.png',
        },
    },
    ['veh_neons'] = {
        label = 'Neons',
        weight = 1000,
        client = {
            image = 'veh_neons.png',
        },
    },
    ['binoculars'] = {
        label = 'Binoculars',
        weight = 600,
        client = {
            image = 'binoculars.png',
        },
    },
    ['boomcamo_attachment'] = {
        label = 'Boom Camo',
        weight = 1000,
        client = {
            image = 'boomcamo_attachment.png',
        },
    },
    ['electronickit'] = {
        label = 'Electronic Kit',
        weight = 100,
        client = {
            image = 'electronickit.png',
        },
    },
    ['casinochips'] = {
        label = 'Casino Chips',
        weight = 0,
        client = {
            image = 'casinochips.png',
        },
    },
    ['dendrogyra_coral'] = {
        label = 'Dendrogyra',
        weight = 1000,
        client = {
            image = 'dendrogyra_coral.png',
        },
    },
    ['firework2'] = {
        label = 'Poppelers',
        weight = 1000,
        client = {
            image = 'firework2.png',
        },
    },
    ['weapontint_mk2_12'] = {
        label = 'Orange Contrast Tint',
        weight = 1000,
        client = {
            image = 'weapontint_black.png',
        },
    },
    ['joint'] = {
        label = 'Joint',
        weight = 0,
        client = {
            image = 'joint.png',
        },
    },
    ['weapon_briefcase_02'] = {
        label = 'Suitcase',
        weight = 1000,
        client = {
            image = 'weapon_briefcase2.png',
        },
    },
    ['veh_xenons'] = {
        label = 'Xenons',
        weight = 1000,
        client = {
            image = 'veh_xenons.png',
        },
    },
    ['handcuffs'] = {
        label = 'Handcuffs',
        weight = 100,
        client = {
            image = 'handcuffs.png',
        },
    },
    ['ironoxide'] = {
        label = 'Iron Powder',
        weight = 100,
        client = {
            image = 'ironoxide.png',
        },
    },
    ['snp_ammo'] = {
        label = 'Sniper ammo',
        weight = 1000,
        client = {
            image = 'rifle_ammo.png',
        },
    },
    ['goldbar'] = {
        label = 'Gold Bar',
        weight = 7000,
        client = {
            image = 'goldbar.png',
        },
    },
    ['advancedlockpick'] = {
        label = 'Advanced Lockpick',
        weight = 500,
        client = {
            image = 'advancedlockpick.png',
        },
    },
    ['diamond'] = {
        label = 'Diamond',
        weight = 1000,
        client = {
            image = 'diamond.png',
        },
    },
    ['weapontint_mk2_3'] = {
        label = 'Classic White Tint',
        weight = 1000,
        client = {
            image = 'weapontint_black.png',
        },
    },
    ['radioscanner'] = {
        label = 'Radio Scanner',
        weight = 1000,
        client = {
            image = 'radioscanner.png',
        },
    },
    ['fitbit'] = {
        label = 'Fitbit',
        weight = 500,
        client = {
            image = 'fitbit.png',
        },
    },
    ['thermalscope_attachment'] = {
        label = 'Thermal Scope',
        weight = 1000,
        client = {
            image = 'thermalscope_attachment.png',
        },
    },
    ['precision_muzzle_brake'] = {
        label = 'Precision Muzzle Brake',
        weight = 1000,
        client = {
            image = 'precision_muzzle_brake.png',
        },
    },
    ['weapon_bottle'] = {
        label = 'Broken Bottle',
        weight = 1000,
        client = {
            image = 'weapon_bottle.png',
        },
    },
    ['samsungphone'] = {
        label = 'Samsung S10',
        weight = 1000,
        client = {
            image = 'samsungphone.png',
        },
    },
    ['iphone'] = {
        label = 'iPhone',
        weight = 1000,
        client = {
            image = 'iphone.png',
        },
    },
    ['walkstick'] = {
        label = 'Walking Stick',
        weight = 1000,
        client = {
            image = 'walkstick.png',
        },
    },
    ['ifaks'] = {
        label = 'ifaks',
        weight = 200,
        client = {
            image = 'ifaks.png',
        },
    },
    ['weapon_specialcarbine_mk2'] = {
        label = 'Special Carbine Mk II',
        weight = 1000,
        client = {
            image = 'weapon_specialcarbine_mk2.png',
        },
    },
    ['veh_plates'] = {
        label = 'Plates',
        weight = 1000,
        client = {
            image = 'veh_plates.png',
        },
    },
    ['veh_tint'] = {
        label = 'Tints',
        weight = 1000,
        client = {
            image = 'veh_tint.png',
        },
    },
    ['weapontint_mk2_17'] = {
        label = 'Bold Red Features Tint',
        weight = 1000,
        client = {
            image = 'weapontint_black.png',
        },
    },
    ['veh_wheels'] = {
        label = 'Wheels',
        weight = 1000,
        client = {
            image = 'veh_wheels.png',
        },
    },
    ['veh_interior'] = {
        label = 'Interior',
        weight = 1000,
        client = {
            image = 'veh_interior.png',
        },
    },
    ['weapon_handcuffs'] = {
        label = 'Handcuffs',
        weight = 1000,
        client = {
            image = 'weapon_handcuffs.png',
        },
    },
    ['weapontint_mk2_4'] = {
        label = 'Classic Beige Tint',
        weight = 1000,
        client = {
            image = 'weapontint_black.png',
        },
    },
    ['veh_transmission'] = {
        label = 'Transmission',
        weight = 1000,
        client = {
            image = 'veh_transmission.png',
        },
    },
    ['weapon_assaultrifle_mk2'] = {
        label = 'Assault Rifle Mk II',
        weight = 1000,
        client = {
            image = 'weapon_assaultrifle_mk2.png',
        },
    },
    ['veh_suspension'] = {
        label = 'Suspension',
        weight = 1000,
        client = {
            image = 'veh_suspension.png',
        },
    },
    ['weapontint_mk2_21'] = {
        label = 'Bold Red & White Tint',
        weight = 1000,
        client = {
            image = 'weapontint_black.png',
        },
    },
    ['veh_armor'] = {
        label = 'Armor',
        weight = 1000,
        client = {
            image = 'veh_armor.png',
        },
    },
    ['weapontint_mk2_20'] = {
        label = 'Bold Yellow Features Tint',
        weight = 1000,
        client = {
            image = 'weapontint_black.png',
        },
    },
    ['jerry_can'] = {
        label = 'Jerrycan 20L',
        weight = 20000,
        client = {
            image = 'jerry_can.png',
        },
    },
    ['tunerlaptop'] = {
        label = 'Tunerchip',
        weight = 2000,
        client = {
            image = 'tunerchip.png',
        },
    },
    ['cleaningkit'] = {
        label = 'Cleaning Kit',
        weight = 250,
        client = {
            image = 'cleaningkit.png',
        },
    },
    ['nitrous'] = {
        label = 'Nitrous',
        weight = 1000,
        client = {
            image = 'nitrous.png',
        },
    },
    ['weapontint_mk2_29'] = {
        label = 'Metallic Blue Tint',
        weight = 1000,
        client = {
            image = 'weapontint_black.png',
        },
    },
    ['rolling_paper'] = {
        label = 'Rolling Paper',
        weight = 0,
        client = {
            image = 'rolling_paper.png',
        },
    },
    ['goldchain'] = {
        label = 'Golden Chain',
        weight = 1500,
        client = {
            image = 'goldchain.png',
        },
    },
    ['steel'] = {
        label = 'Steel',
        weight = 100,
        client = {
            image = 'steel.png',
        },
    },
    ['aluminumoxide'] = {
        label = 'Aluminium Powder',
        weight = 100,
        client = {
            image = 'aluminumoxide.png',
        },
    },
    ['aluminum'] = {
        label = 'Aluminium',
        weight = 100,
        client = {
            image = 'aluminum.png',
        },
    },
    ['copper'] = {
        label = 'Copper',
        weight = 100,
        client = {
            image = 'copper.png',
        },
    },
    ['weapon_bread'] = {
        label = 'Baquette',
        weight = 1000,
        client = {
            image = 'baquette.png',
        },
    },
    ['metalscrap'] = {
        label = 'Metal Scrap',
        weight = 100,
        client = {
            image = 'metalscrap.png',
        },
    },
    ['plastic'] = {
        label = 'Plastic',
        weight = 100,
        client = {
            image = 'plastic.png',
        },
    },
    ['weapontint_mk2_1'] = {
        label = 'Classic Gray Tint',
        weight = 1000,
        client = {
            image = 'weapontint_black.png',
        },
    },
    ['weed_ak47_seed'] = {
        label = 'AK47 Seed',
        weight = 0,
        client = {
            image = 'weed_seed.png',
        },
    },
    ['weapontint_4'] = {
        label = 'Army Tint',
        weight = 1000,
        client = {
            image = 'weapontint_army.png',
        },
    },
    ['weed_amnesia_seed'] = {
        label = 'Amnesia Seed',
        weight = 0,
        client = {
            image = 'weed_seed.png',
        },
    },
    ['weed_ogkush_seed'] = {
        label = 'OGKush Seed',
        weight = 0,
        client = {
            image = 'weed_seed.png',
        },
    },
    ['weapon_assaultrifle'] = {
        label = 'Assault Rifle',
        weight = 1000,
        client = {
            image = 'weapon_assaultrifle.png',
        },
    },
    ['weapontint_mk2_15'] = {
        label = 'Bold Orange Tint',
        weight = 1000,
        client = {
            image = 'weapontint_black.png',
        },
    },
    ['weapon_hazardcan'] = {
        label = 'Hazardous Jerry Can',
        weight = 1000,
        client = {
            image = 'weapon_hazardcan.png',
        },
    },
    ['weapon_sniperrifle'] = {
        label = 'Sniper Rifle',
        weight = 1000,
        client = {
            image = 'weapon_sniperrifle.png',
        },
    },
    ['weapon_unarmed'] = {
        label = 'Fists',
        weight = 1000,
        client = {
            image = 'placeholder.png',
        },
    },
    ['weed_skunk'] = {
        label = 'Skunk 2g',
        weight = 200,
        client = {
            image = 'weed_baggy.png',
        },
    },
    ['weapontint_6'] = {
        label = 'Orange Tint',
        weight = 1000,
        client = {
            image = 'weapontint_orange.png',
        },
    },
    ['screwdriverset'] = {
        label = 'Toolkit',
        weight = 1000,
        client = {
            image = 'screwdriverset.png',
        },
    },
    ['shotgun_ammo'] = {
        label = 'Shotgun ammo',
        weight = 500,
        client = {
            image = 'shotgun_ammo.png',
        },
    },
    ['meth'] = {
        label = 'Meth',
        weight = 100,
        client = {
            image = 'meth_baggy.png',
        },
    },
    ['weapon_flashlight'] = {
        label = 'Flashlight',
        weight = 1000,
        client = {
            image = 'weapon_flashlight.png',
        },
    },
    ['woodcamo_attachment'] = {
        label = 'Woodland Camo',
        weight = 1000,
        client = {
            image = 'woodcamo_attachment.png',
        },
    },
    ['coffee'] = {
        label = 'Coffee',
        weight = 200,
        client = {
            image = 'coffee.png',
        },
    },
    ['coke_small_brick'] = {
        label = 'Coke Package',
        weight = 350,
        client = {
            image = 'coke_small_brick.png',
        },
    },
    ['crack_baggy'] = {
        label = 'Bag of Crack',
        weight = 0,
        client = {
            image = 'crack_baggy.png',
        },
    },
    ['empty_evidence_bag'] = {
        label = 'Empty Evidence Bag',
        weight = 0,
        client = {
            image = 'evidence.png',
        },
    },
    ['weapon_stungun'] = {
        label = 'Taser',
        weight = 1000,
        client = {
            image = 'weapon_stungun.png',
        },
    },
    ['drill'] = {
        label = 'Drill',
        weight = 20000,
        client = {
            image = 'drill.png',
        },
    },
    ['weapon_assaultsmg'] = {
        label = 'Assault SMG',
        weight = 1000,
        client = {
            image = 'weapon_assaultsmg.png',
        },
    },
    ['vodka'] = {
        label = 'Vodka',
        weight = 500,
        client = {
            image = 'vodka.png',
        },
    },
    ['whiskey'] = {
        label = 'Whiskey',
        weight = 500,
        client = {
            image = 'whiskey.png',
        },
    },
    ['tactical_muzzle_brake'] = {
        label = 'Tactical Muzzle Brake',
        weight = 1000,
        client = {
            image = 'tactical_muzzle_brake.png',
        },
    },
    ['weapon_pistol'] = {
        label = 'Walther P99',
        weight = 1000,
        client = {
            image = 'weapon_pistol.png',
        },
    },
    ['water_bottle'] = {
        label = 'Bottle of Water',
        weight = 500,
        client = {
            image = 'water_bottle.png',
        },
    },
    ['markedbills'] = {
        label = 'Marked Money',
        weight = 1000,
        client = {
            image = 'markedbills.png',
        },
    },
    ['grip_attachment'] = {
        label = 'Grip',
        weight = 1000,
        client = {
            image = 'grip_attachment.png',
        },
    },
    ['laptop'] = {
        label = 'Laptop',
        weight = 4000,
        client = {
            image = 'laptop.png',
        },
    },
    ['weapon_heavyshotgun'] = {
        label = 'Heavy Shotgun',
        weight = 1000,
        client = {
            image = 'weapon_heavyshotgun.png',
        },
    },
    ['smg_ammo'] = {
        label = 'SMG ammo',
        weight = 500,
        client = {
            image = 'smg_ammo.png',
        },
    },
    ['emp_ammo'] = {
        label = 'EMP Ammo',
        weight = 200,
        client = {
            image = 'emp_ammo.png',
        },
    },
    ['grape'] = {
        label = 'Grape',
        weight = 100,
        client = {
            image = 'grape.png',
        },
    },
    ['weapontint_mk2_27'] = {
        label = 'Metallic Red Tint',
        weight = 1000,
        client = {
            image = 'weapontint_black.png',
        },
    },
    ['weapontint_mk2_26'] = {
        label = 'Metallic Purple & Lime Tint',
        weight = 1000,
        client = {
            image = 'weapontint_black.png',
        },
    },
    ['weapontint_mk2_24'] = {
        label = 'Metallic Platinum Tint',
        weight = 1000,
        client = {
            image = 'weapontint_black.png',
        },
    },
    ['weapon_rayminigun'] = {
        label = 'Widowmaker',
        weight = 1000,
        client = {
            image = 'weapon_rayminigun.png',
        },
    },
    ['perseuscamo_attachment'] = {
        label = 'Perseus Camo',
        weight = 1000,
        client = {
            image = 'perseuscamo_attachment.png',
        },
    },
    ['weapon_pumpshotgun'] = {
        label = 'Pump Shotgun',
        weight = 1000,
        client = {
            image = 'weapon_pumpshotgun.png',
        },
    },
    ['weapontint_mk2_22'] = {
        label = 'Bold Blue & White Tint',
        weight = 1000,
        client = {
            image = 'weapontint_black.png',
        },
    },
    ['veh_engine'] = {
        label = 'Engine',
        weight = 1000,
        client = {
            image = 'veh_engine.png',
        },
    },
    ['tirerepairkit'] = {
        label = 'Tire Repair Kit',
        weight = 1000,
        client = {
            image = 'tirerepairkit.png',
        },
    },
    ['weapontint_mk2_19'] = {
        label = 'Bold Cyan Features Tint',
        weight = 1000,
        client = {
            image = 'weapontint_black.png',
        },
    },
    ['weed_whitewidow_seed'] = {
        label = 'White Widow Seed',
        weight = 0,
        client = {
            image = 'weed_seed.png',
        },
    },
    ['weapon_smg_mk2'] = {
        label = 'SMG Mk II',
        weight = 1000,
        client = {
            image = 'weapon_smg_mk2.png',
        },
    },
    ['weapontint_mk2_13'] = {
        label = 'Bold Pink Tint',
        weight = 1000,
        client = {
            image = 'weapontint_black.png',
        },
    },
    ['firework1'] = {
        label = '2Brothers',
        weight = 1000,
        client = {
            image = 'firework1.png',
        },
    },
    ['weapontint_mk2_11'] = {
        label = 'Yellow Contrast Tint',
        weight = 1000,
        client = {
            image = 'weapontint_black.png',
        },
    },
    ['weapontint_mk2_9'] = {
        label = 'Red Contrast Tint',
        weight = 1000,
        client = {
            image = 'weapontint_black.png',
        },
    },
    ['brushcamo_attachment'] = {
        label = 'Brushstroke Camo',
        weight = 1000,
        client = {
            image = 'brushcamo_attachment.png',
        },
    },
    ['weapontint_mk2_8'] = {
        label = 'Classic Brown & Black Tint',
        weight = 1000,
        client = {
            image = 'weapontint_black.png',
        },
    },
    ['weapontint_mk2_6'] = {
        label = 'Classic Blue Tint',
        weight = 1000,
        client = {
            image = 'weapontint_black.png',
        },
    },
    ['cryptostick'] = {
        label = 'Crypto Stick',
        weight = 200,
        client = {
            image = 'cryptostick.png',
        },
    },
    ['weapontint_mk2_2'] = {
        label = 'Classic Two-Tone Tint',
        weight = 1000,
        client = {
            image = 'weapontint_black.png',
        },
    },
    ['weapontint_mk2_0'] = {
        label = 'Classic Black Tint',
        weight = 1000,
        client = {
            image = 'weapontint_black.png',
        },
    },
    ['weapontint_7'] = {
        label = 'Platinum Tint',
        weight = 1000,
        client = {
            image = 'weapontint_plat.png',
        },
    },
    ['comp_attachment'] = {
        label = 'Compensator',
        weight = 1000,
        client = {
            image = 'comp_attachment.png',
        },
    },
    ['driver_license'] = {
        label = 'Drivers License',
        weight = 0,
        client = {
            image = 'driver_license.png',
        },
    },
    ['barrel_attachment'] = {
        label = 'Barrel',
        weight = 1000,
        client = {
            image = 'barrel_attachment.png',
        },
    },
    ['bellend_muzzle_brake'] = {
        label = 'Bellend Muzzle Brake',
        weight = 1000,
        client = {
            image = 'bellend_muzzle_brake.png',
        },
    },
    ['rifle_ammo'] = {
        label = 'Rifle ammo',
        weight = 1000,
        client = {
            image = 'rifle_ammo.png',
        },
    },
    ['fat_end_muzzle_brake'] = {
        label = 'Fat End Muzzle Brake',
        weight = 1000,
        client = {
            image = 'fat_end_muzzle_brake.png',
        },
    },
    ['largescope_attachment'] = {
        label = 'Large Scope',
        weight = 1000,
        client = {
            image = 'largescope_attachment.png',
        },
    },
    ['suppressor_attachment'] = {
        label = 'Suppressor',
        weight = 1000,
        client = {
            image = 'suppressor_attachment.png',
        },
    },
    ['clip_attachment'] = {
        label = 'Clip',
        weight = 1000,
        client = {
            image = 'clip_attachment.png',
        },
    },
    ['weapon_compactrifle'] = {
        label = 'Compact Rifle',
        weight = 1000,
        client = {
            image = 'weapon_compactrifle.png',
        },
    },
    ['weapon_garbagebag'] = {
        label = 'Garbage Bag',
        weight = 1000,
        client = {
            image = 'weapon_garbagebag.png',
        },
    },
    ['weapon_ball'] = {
        label = 'Ball',
        weight = 1000,
        client = {
            image = 'weapon_ball.png',
        },
    },
    ['weapon_combatshotgun'] = {
        label = 'Combat Shotgun',
        weight = 1000,
        client = {
            image = 'weapon_combatshotgun.png',
        },
    },
    ['weapon_specialcarbine'] = {
        label = 'Special Carbine',
        weight = 1000,
        client = {
            image = 'weapon_specialcarbine.png',
        },
    },
    ['weapon_railgun'] = {
        label = 'Railgun',
        weight = 1000,
        client = {
            image = 'weapon_railgun.png',
        },
    },
    ['weapon_gadgetpistol'] = {
        label = 'Perico Pistol',
        weight = 1000,
        client = {
            image = 'weapon_gadgetpistol.png',
        },
    },
    ['weapon_minigun'] = {
        label = 'Minigun',
        weight = 1000,
        client = {
            image = 'weapon_minigun.png',
        },
    },
    ['weapon_grenadelauncher_smoke'] = {
        label = 'Smoke Grenade Launcher',
        weight = 1000,
        client = {
            image = 'weapon_smokegrenade.png',
        },
    },
    ['weapon_rpg'] = {
        label = 'RPG',
        weight = 1000,
        client = {
            image = 'weapon_rpg.png',
        },
    },
    ['lighter'] = {
        label = 'Lighter',
        weight = 0,
        client = {
            image = 'lighter.png',
        },
    },
    ['weapon_smg'] = {
        label = 'SMG',
        weight = 1000,
        client = {
            image = 'weapon_smg.png',
        },
    },
    ['weapon_heavysniper_mk2'] = {
        label = 'Heavy Sniper Mk II',
        weight = 1000,
        client = {
            image = 'weapon_heavysniper_mk2.png',
        },
    },
    ['weapon_remotesniper'] = {
        label = 'Remote Sniper',
        weight = 1000,
        client = {
            image = 'weapon_remotesniper.png',
        },
    },
    ['weapon_fireextinguisher'] = {
        label = 'Fire Extinguisher',
        weight = 1000,
        client = {
            image = 'weapon_fireextinguisher.png',
        },
    },
    ['weapon_stone_hatchet'] = {
        label = 'Stone Hatchet',
        weight = 1000,
        client = {
            image = 'weapon_stone_hatchet.png',
        },
    },
    ['weapon_heavysniper'] = {
        label = 'Heavy Sniper',
        weight = 1000,
        client = {
            image = 'weapon_heavysniper.png',
        },
    },
    ['weapon_bullpuprifle'] = {
        label = 'Bullpup Rifle',
        weight = 1000,
        client = {
            image = 'weapon_bullpuprifle.png',
        },
    },
    ['weed_skunk_seed'] = {
        label = 'Skunk Seed',
        weight = 0,
        client = {
            image = 'weed_seed.png',
        },
    },
    ['weapon_dbshotgun'] = {
        label = 'Double-barrel Shotgun',
        weight = 1000,
        client = {
            image = 'weapon_dbshotgun.png',
        },
    },
    ['weapon_combatpdw'] = {
        label = 'Combat PDW',
        weight = 1000,
        client = {
            image = 'weapon_combatpdw.png',
        },
    },
    ['weapon_revolver_mk2'] = {
        label = 'Violence',
        weight = 1000,
        client = {
            image = 'weapon_revolver_mk2.png',
        },
    },
    ['weapon_revolver'] = {
        label = 'Revolver',
        weight = 1000,
        client = {
            image = 'weapon_revolver.png',
        },
    },
}
