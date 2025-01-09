-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_job_setup()
    state.OffenseMode:options('Normal', 'Acc', 'FullAcc', 'Fodder')
    state.HybridMode:options('Pet', 'DT', 'Normal')
    state.WeaponskillMode:options('Match', 'Normal', 'Acc', 'FullAcc', 'Fodder')
    state.PhysicalDefenseMode:options('PDT')
    state.IdleMode:options('Normal', 'PDT', 'Refresh')
    state.Weapons:options('Sakpata', 'Ohtas', 'None')
    state.PetMode = M {
        ['description'] = 'Pet Mode',
        'Melee',
        'STP',
        'Ranged',
        'Turtle',
        'Bruiser',
        'OverdriveVE',
        'OverdriveSS'
    }
    state.AutoDeployMode = M(true, 'Auto Deploy Mode')
    state.AutoPetMode = M(false, 'Auto Pet Mode')
    state.PetWSGear = M(false, 'Pet WS Gear')
    state.PetEnmityGear = M(false, 'Pet Enmity Gear')

    -- Default/Automatic maneuvers for each pet mode.  Define at least 3.
    defaultManeuvers = {
        Melee = {{
            Name = 'Fire Maneuver',
            Amount = 1
        }, {
            Name = 'Thunder Maneuver',
            Amount = 1
        }, {
            Name = 'Wind Maneuver',
            Amount = 0
        }, {
            Name = 'Light Maneuver',
            Amount = 1
        }},
        STP = {{
            Name = 'Wind Maneuver',
            Amount = 0
        }, {
            Name = 'Fire Maneuver',
            Amount = 1
        }, {
            Name = 'Light Maneuver',
            Amount = 1
        }, {
            Name = 'Thunder Maneuver',
            Amount = 1
        }},
        Ranged = {{
            Name = 'Wind Maneuver',
            Amount = 2
        }, {
            Name = 'Fire Maneuver',
            Amount = 0
        }, {
            Name = 'Light Maneuver',
            Amount = 1
        }, {
            Name = 'Thunder Maneuver',
            Amount = 0
        }},
        Turtle = {{
            Name = 'Earth Maneuver',
            Amount = 1
        }, {
            Name = 'Water Maneuver',
            Amount = 1
        }, {
            Name = 'Light Maneuver',
            Amount = 1
        }, {
            Name = 'Dark Maneuver',
            Amount = 0
        }, {
            Name = 'Water Maneuver',
            Amount = 0
        }},
        Bruiser = {{
            Name = 'Light Maneuver',
            Amount = 1
        }, {
            Name = 'Fire Maneuver',
            Amount = 1
        }, {
            Name = 'Thunder Maneuver',
            Amount = 1
        }, {
            Name = 'Dark Maneuver',
            Amount = 0
        }},
        OverdriveVE = {{
            Name = 'Light Maneuver',
            Amount = 1
        }, {
            Name = 'Fire Maneuver',
            Amount = 1
        }, {
            Name = 'Water Maneuver',
            Amount = 1
        }, {
            Name = 'Earth Maneuver',
            Amount = 0
        }},
        OverdriveSS = {{
            Name = 'Light Maneuver',
            Amount = 1
        }, {
            Name = 'Fire Maneuver',
            Amount = 1
        }, {
            Name = 'Wind Maneuver',
            Amount = 1
        }, {
            Name = 'Thunder Maneuver',
            Amount = 0
        }}
    }

    deactivatehpp = 85

    select_default_macro_book()
    user_job_lockstyle()

    send_command('bind @` gs c cycle SkillchainMode')
    send_command('bind @f7 gs c toggle AutoPuppetMode')
    send_command('bind @f8 gs c toggle AutoBuffMode')
    send_command('bind @p gs c cycle PetMode')

end

-- Define sets used by this job file.
function init_gear_sets()

    -- Precast Sets

    -- Fast cast sets for spells
    sets.precast.FC = {
        head = gear.herculean_fc_head,
        neck = "Voltsurge Torque",
        ear1 = "Enchntr. Earring +1",
        ear2 = "Loquac. Earring",
        body = "Zendik Robe",
        hands = "Malignance Gloves",
        ring1 = "Lebeche Ring",
        ring2 = "Prolix Ring",
        back = "Perimede Cape",
        waist = "Isa Belt",
        legs = "Rawhide Trousers",
        feet = "Regal Pumps +1"
    }

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {
        neck = "Magoraga Beads"
    })

    -- Precast sets to enhance JAs
    sets.precast.JA['Tactical Switch'] = {
        feet = "Cirque Scarpe +2"
    }
    sets.precast.JA['Repair'] = {
        ammo = "Automat. Oil +3"
    } -- feet="Foire Babouches"
    sets.precast.JA['Maintenance'] = {
        ammo = "Automat. Oil +3"
    }

    sets.precast.JA.Maneuver = {
        main = "Midnights",
        back = "Visucius's Mantle",
        neck = "Buffoon's Collar",
        hands = "Pup. Dastanas +1",
        body = "Cirque Farsetto +1"
    }

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {
        head = "Lilitu Headpiece",
        neck = "Unmoving Collar +1",
        ear1 = "Enchntr. Earring +1",
        ear2 = "Handler's Earring +1",
        body = gear.herculean_waltz_body,
        hands = gear.herculean_waltz_hands,
        ring1 = "Defending Ring",
        ring2 = "Valseur's Ring",
        back = "Solemnity Cape",
        waist = "Chaac Belt",
        legs = "Hiza. Hizayoroi +2",
        feet = gear.herculean_waltz_feet
    }

    sets.precast.Waltz['Healing Waltz'] = {}

    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
        head = "Lilitu Headpiece",
        neck = "Caro Necklace",
        ear1 = "Moonshade Earring",
        ear2 = "Brutal Earring",
        body = gear.herculean_wsd_body,
        hands = "Ryuo Tekko",
        ring1 = "Niqmaddu Ring",
        ring2 = "Regal Ring",
        back = "Visucius's Mantle",
        waist = "Grunfeld Rope",
        legs = "Hiza. Hizayoroi +2",
        feet = gear.herculean_ta_feet
    }
    sets.precast.WS.Acc = {
        head = "Lilitu Headpiece",
        neck = "Fotia Gorget",
        ear1 = "Moonshade Earring",
        ear2 = "Telos Earring",
        body = gear.herculean_wsd_body,
        hands = "Ryuo Tekko",
        ring1 = "Niqmaddu Ring",
        ring2 = "Regal Ring",
        back = "Visucius's Mantle",
        waist = "Grunfeld Rope",
        legs = "Hiza. Hizayoroi +2",
        feet = "Malignance Boots"
    }
    sets.precast.WS.FullAcc = {
        head = "Lilitu Headpiece",
        neck = "Combatant's Torque",
        ear1 = "Digni. Earring",
        ear2 = "Telos Earring",
        body = gear.herculean_wsd_body,
        hands = "Ryuo Tekko",
        ring1 = "Ramuh Ring +1",
        ring2 = "Ramuh Ring +1",
        back = "Visucius's Mantle",
        waist = "Olseni Belt",
        legs = "Hiza. Hizayoroi +2",
        feet = "Malignance Boots"
    }
    sets.precast.WS.Fodder = {
        head = "Lilitu Headpiece",
        neck = "Caro Necklace",
        ear1 = "Moonshade Earring",
        ear2 = "Brutal Earring",
        body = gear.herculean_wsd_body,
        hands = "Ryuo Tekko",
        ring1 = "Niqmaddu Ring",
        ring2 = "Regal Ring",
        back = "Visucius's Mantle",
        waist = "Grunfeld Rope",
        legs = "Hiza. Hizayoroi +2",
        feet = gear.herculean_ta_feet
    }

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Victory Smite'] = set_combine(sets.precast.WS, {
        body = "Abnoba Kaftan"
    })
    sets.precast.WS['Victory Smite'].Acc = set_combine(sets.precast.WS.Acc, {
        body = "Sayadio's Kaftan"
    })
    sets.precast.WS['Victory Smite'].FullAcc = set_combine(sets.precast.WS.FullAcc, {
        body = "Sayadio's Kaftan"
    })
    sets.precast.WS['Victory Smite'].Fodder = set_combine(sets.precast.WS.Fodder, {
        body = "Abnoba Kaftan"
    })

    sets.precast.WS['Stringing Pummel'] = set_combine(sets.precast.WS, {
        body = "Abnoba Kaftan"
    })
    sets.precast.WS['Stringing Pummel'].Acc = set_combine(sets.precast.WS.FullAcc, {
        body = "Sayadio's Kaftan"
    })
    sets.precast.WS['Stringing Pummel'].FullAcc = set_combine(sets.precast.WS.FullAcc, {
        body = "Sayadio's Kaftan"
    })
    sets.precast.WS['Stringing Pummel'].Fodder = set_combine(sets.precast.WS.Fodder, {
        body = "Abnoba Kaftan"
    })

    sets.precast.WS['Shijin Spiral'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Shijin Spiral'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Shijin Spiral'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Shijin Spiral'].Fodder = set_combine(sets.precast.WS.Fodder, {})

    sets.precast.WS['Asuran Fists'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Asuran Fists'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Asuran Fists'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Asuran Fists'].Fodder = set_combine(sets.precast.WS.Fodder, {})

    sets.precast.WS['Dragon Kick'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Dragon Kick'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Dragon Kick'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Dragon Kick'].Fodder = set_combine(sets.precast.WS.Fodder, {})

    sets.precast.WS['Tornado Kick'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Tornado Kick'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Tornado Kick'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Tornado Kick'].Fodder = set_combine(sets.precast.WS.Fodder, {})

    sets.precast.WS['Asuran Fists'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Asuran Fists'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Asuran Fists'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Asuran Fists'].Fodder = set_combine(sets.precast.WS.Fodder, {})

    sets.precast.WS['Raging Fists'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Raging Fists'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Raging Fists'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Raging Fists'].Fodder = set_combine(sets.precast.WS.Fodder, {})

    sets.precast.WS['Howling Fist'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Howling Fist'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Howling Fist'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Howling Fist'].Fodder = set_combine(sets.precast.WS.Fodder, {})

    sets.precast.WS['Backhand Blow'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Backhand Blow'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Backhand Blow'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Backhand Blow'].Fodder = set_combine(sets.precast.WS.Fodder, {})

    sets.precast.WS['Spinning Attack'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Spinning Attack'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Spinning Attack'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Spinning Attack'].Fodder = set_combine(sets.precast.WS.Fodder, {})

    sets.precast.WS['Shoulder Tackle'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Shoulder Tackle'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Shoulder Tackle'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Shoulder Tackle'].Fodder = set_combine(sets.precast.WS.Fodder, {})
    -- Midcast Sets

    sets.midcast.FastRecast = {
        head = gear.herculean_fc_head,
        neck = "Voltsurge Torque",
        ear1 = "Enchntr. Earring +1",
        ear2 = "Loquac. Earring",
        body = "Zendik Robe",
        hands = "Malignance Gloves",
        ring1 = "Lebeche Ring",
        ring2 = "Prolix Ring",
        back = "Perimede Cape",
        waist = "Isa Belt",
        legs = "Rawhide Trousers",
        feet = "Regal Pumps +1"
    }

    sets.midcast.Dia = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)
    sets.midcast.Diaga = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)
    sets.midcast['Dia II'] = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)
    sets.midcast.Bio = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)
    sets.midcast['Bio II'] = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)

    -- Midcast sets for pet actions
    sets.midcast.Pet.Cure = {}
    sets.midcast.Pet['Enfeebling Magic'] = {
        neck = "Adad Amulet",
        ear1 = "Handler's Earring +1",
        ear2 = "Enmerkar Earring",
        body = "Taeon Tabard",
        hands = "Regimen Mittens",
        ring1 = "Varar Ring +1",
        ring2 = "C. Palug Ring",
        waist = "Incarnation Sash",
        legs = "Tali'ah Sera. +2"
    }
    sets.midcast.Pet['Elemental Magic'] = {
        neck = "Adad Amulet",
        ear1 = "Handler's Earring +1",
        ear2 = "Enmerkar Earring",
        body = "Taeon Tabard",
        hands = "Regimen Mittens",
        ring1 = "Varar Ring +1",
        ring2 = "C. Palug Ring",
        waist = "Incarnation Sash",
        legs = "Tali'ah Sera. +2"
    }

    -- The following sets are predictive and are equipped before we even know the ability will happen, as a workaround due to
    -- the fact that start of ability packets are too late in the case of Pup abilities, WS, and certain spells.
    sets.midcast.Pet.PetEnmityGear = {}
    sets.midcast.Pet.PetWSGear = {
        neck = "Shulmanu Collar",
        ear1 = "Handler's Earring +1",
        ear2 = "Enmerkar Earring",
        body = "Taeon Tabard",
        hands = "Regimen Mittens",
        ring1 = "Varar Ring +1",
        ring2 = "C. Palug Ring",
        back = "Dispersal Mantle",
        waist = "Incarnation Sash",
        legs = "Tali'ah Sera. +2"
    }

    sets.midcast.Pet.PetWSGear.Ranged = set_combine(sets.midcast.Pet.PetWSGear, {})
    sets.midcast.Pet.PetWSGear.Melee = set_combine(sets.midcast.Pet.PetWSGear, {
        ring2 = "C. Palug Ring"
    })
    sets.midcast.Pet.PetWSGear.Tank = set_combine(sets.midcast.Pet.PetWSGear, {})
    sets.midcast.Pet.PetWSGear.LightTank = set_combine(sets.midcast.Pet.PetWSGear, {})
    sets.midcast.Pet.PetWSGear.Magic = set_combine(sets.midcast.Pet.PetWSGear, {})
    sets.midcast.Pet.PetWSGear.Heal = set_combine(sets.midcast.Pet.PetWSGear, {})
    sets.midcast.Pet.PetWSGear.Nuke = set_combine(sets.midcast.Pet.PetWSGear, {})

    -- Currently broken, preserved in case of future functionality.
    -- sets.midcast.Pet.WeaponSkill = {}

    -- Sets to return to when not performing an action.

    -- Resting sets
    sets.resting = {}

    -- Idle sets

    sets.idle = {
        head = "Nyame Helm",
        neck = "Warder's Charm +1",
        ear1 = "Eabani Earring",
        ear2 = "Odnowa Earring +1",
        body = "Nyame Mail",
        hands = "Nyame Gauntlets",
        ring1 = "Defending Ring",
        ring2 = "Gelatinous Ring +1",
        back = "Moonbeam Cape",
        waist = "Carrier's Sash",
        legs = "Nyame Flanchard",
        feet = "Nyame Sollerets"
    }

    sets.idle.Refresh = {
        head = "Malignance Chapeau",
        neck = "Loricate Torque +1",
        ear1 = "Enmerkar Earring",
        ear2 = "Handler's Earring +1",
        body = "Malignance Tabard",
        hands = "Malignance Gloves",
        ring1 = "Defending Ring",
        ring2 = "Shneddick Ring",
        back = "Solemnity Cape",
        waist = "Klouskap Sash +1",
        legs = gear.taeon_pet_legs,
        feet = "Malignance Boots"
    }

    -- Set for idle while pet is out (eg: pet regen gear)
    sets.idle.Pet = {
        head = "Malignance Chapeau",
        neck = "Bathy Choker +1",
        ear2 = "Burana Earring",
        ear1 = "Infused Earring",
        body = "Malignance Tabard",
        hands = "Malignance Gloves",
        ring1 = "Defending Ring",
        ring2 = "Shneddick Ring",
        back = "Solemnity Cape",
        waist = "Isa Belt",
        legs = gear.taeon_pet_legs,
        feet = "Malignance Boots"
    }

    -- Idle sets to wear while pet is engaged
    sets.idle.Pet.Engaged = {
        head = gear.taeon_pet_head,
        neck = "Shepherd's Chain",
        ear1 = "Rimeice Earring",
        ear2 = "Enmerkar Earring",
        body = gear.taeon_pet_body,
        hands = gear.taeon_pet_hands,
        ring1 = "Varar Ring +1",
        ring2 = "C. Palug Ring",
        back = "Visucius's Mantle",
        waist = "Klouskap Sash +1",
        legs = gear.taeon_pet_legs,
        feet = "Mpaca's Boots"
    }

    sets.idle.Pet.Engaged.Melee = set_combine(sets.idle.Pet.Engaged, {})
    sets.idle.Pet.Engaged.STP = set_combine(sets.idle.Pet.Engaged, {})
    sets.idle.Pet.Engaged.Ranged = set_combine(sets.idle.Pet.Engaged, {})
    sets.idle.Pet.Engaged.Turtle = {
        head = gear.taeon_pet_head,
        neck = "Shepherd's Chain",
        ear1 = "Rimeice Earring",
        ear2 = "Enmerkar Earring",
        body = gear.taeon_pet_body,
        hands = gear.taeon_pet_hands,
        ring1 = "Varar Ring +1",
        ring2 = "C. Palug Ring",
        back = "Visucius's Mantle",
        waist = "Klouskap Sash +1",
        legs = gear.taeon_pet_legs,
        feet = gear.taeon_pet_feet
    }

    sets.idle.Pet.Engaged.Bruiser = {
        head = gear.taeon_pet_head,
        neck = "Shepherd's Chain",
        ear1 = "Rimeice Earring",
        ear2 = "Enmerkar Earring",
        body = gear.taeon_pet_body,
        hands = gear.taeon_pet_hands,
        ring1 = "Varar Ring +1",
        ring2 = "C. Palug Ring",
        back = "Visucius's Mantle",
        waist = "Klouskap Sash +1",
        legs = gear.taeon_pet_legs,
        feet = gear.taeon_pet_feet
    }

    sets.idle.Pet.Engaged.OverdriveVE = {
        head = gear.taeon_pet_head,
        neck = "Shepherd's Chain",
        ear1 = "Rimeice Earring",
        ear2 = "Enmerkar Earring",
        body = gear.taeon_pet_body,
        hands = gear.taeon_pet_hands,
        ring1 = "Varar Ring +1",
        ring2 = "C. Palug Ring",
        back = "Visucius's Mantle",
        waist = "Klouskap Sash +1",
        legs = gear.taeon_pet_legs,
        feet = "Mpaca's Boots"
    }
    sets.idle.Pet.Engaged.OverdriveSS = set_combine(sets.idle.Pet.Engaged.Ranged, {})

    -- Defense sets

    sets.defense.PDT = {
        head = "Nyame Helm",
        neck = "Warder's Charm +1",
        ear1 = "Eabani Earring",
        ear2 = "Odnowa Earring +1",
        body = "Nyame Mail",
        hands = "Nyame Gauntlets",
        ring1 = "Defending Ring",
        ring2 = "Gelatinous Ring +1",
        back = "Moonbeam Cape",
        waist = "Carrier's Sash",
        legs = "Nyame Flanchard",
        feet = "Nyame Sollerets"
    }

    sets.defense.MDT = {
        head = "Nyame Helm",
        neck = "Warder's Charm +1",
        ear1 = "Eabani Earring",
        ear2 = "Odnowa Earring +1",
        body = "Nyame Mail",
        hands = "Nyame Gauntlets",
        ring1 = "Defending Ring",
        ring2 = "Shadow Ring",
        back = "Moonbeam Cape",
        waist = "Carrier's Sash",
        legs = "Nyame Flanchard",
        feet = "Nyame Sollerets"
    }

    sets.defense.MEVA = {
        head = "Nyame Helm",
        neck = "Warder's Charm +1",
        ear1 = "Eabani Earring",
        ear2 = "Odnowa Earring +1",
        body = "Nyame Mail",
        hands = "Nyame Gauntlets",
        ring1 = "Defending Ring",
        ring2 = "Gelatinous Ring +1",
        back = "Moonbeam Cape",
        waist = "Carrier's Sash",
        legs = "Nyame Flanchard",
        feet = "Nyame Sollerets"
    }

    -- sets.Kiting = {feet="Hermes' Sandals"}
    sets.Kiting = {
        ring2 = "Shneddick Ring"
    }

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion

    -- Normal melee group
    sets.engaged = {
        head = "Malignance Chapeau",
        neck = "Sanctity Necklace",
        ear1 = "Telos Earring",
        ear2 = "Dedition Earring",
        body = "Malignance Tabard",
        hands = "Malignance Gloves",
        ring1 = "Chirich Ring +1",
        ring2 = "Epona's Ring",
        back = "Visucius's Mantle",
        waist = "Klouskap Sash +1",
        legs = "Malignance Tights",
        feet = "Malignance Boots"
    }
    sets.engaged.Acc = sets.engaged
    sets.engaged.FullAcc = sets.engaged
    sets.engaged.Fodder = sets.engaged

    sets.engaged.DT = {
        head = "Malignance Chapeau",
        neck = "Shepherd's Chain",
        ear1 = "Rimeice Earring",
        ear2 = "Enmerkar Earring",
        body = "Malignance Tabard",
        hands = "Malignance Gloves",
        ring1 = "Varar Ring +1",
        ring2 = "C. Palug Ring",
        back = "Visucius's Mantle",
        waist = "Klouskap Sash +1",
        legs = "Nyame Flanchard",
        feet = "Malignance Boots"
    }
    sets.engaged.Acc.DT = sets.engaged.DT
    sets.engaged.FullAcc.DT = sets.engaged.DT
    sets.engaged.Fodder.DT = sets.engaged.DT

    sets.engaged.Pet = {
        head = "Malignance Chapeau",
        neck = "Sanctity Necklace",
        ear1 = "Mache Earring +1",
        ear2 = "Dedition Earring",
        body = "Mpaca's Doublet",
        hands = "Mpaca's Gloves",
        ring1 = "Varar Ring +1",
        ring2 = "C. Palug Ring",
        back = "Visucius's Mantle",
        waist = "Klouskap Sash +1",
        legs = gear.taeon_pet_legs,
        feet = "Mpaca's Boots"
    }
    sets.engaged.Acc.Pet = sets.engaged.Pet
    sets.engaged.FullAcc.Pet = sets.engaged.Pet
    sets.engaged.Fodder.Pet = sets.engaged.Pet

    -- Weapons sets
    sets.weapons.Sakpata = {
        main = "Sakpata's Fists",
        range = "Animator P +1",
	ammo = "Automat. Oil +3"
    }
    sets.weapons.Ohtas = {
        main = "Ohtas",
        range = "Animator P +1",
	ammo = "Automat. Oil +3"
    }
end

function user_job_lockstyle()
    windower.chat.input('/lockstyleset 006')
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'DNC' then
        set_macro_page(1, 18)
    elseif player.sub_job == 'NIN' then
        set_macro_page(1, 18)
    elseif player.sub_job == 'THF' then
        set_macro_page(1, 18)
    else
        set_macro_page(1, 18)
    end
end
