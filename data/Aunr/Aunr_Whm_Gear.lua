-- Setup vars that are user-dependent.  Can override this in a sidecar file.
function user_job_setup()
    state.OffenseMode:options('Normal', 'Acc')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Meva', 'Normal', 'PDT')
    state.PhysicalDefenseMode:options('DT')
    state.MagicalDefenseMode:options('MDT')
    state.ResistDefenseMode:options('Refresh')
    state.Weapons:options('None', 'DualWield', 'Trial', 'MeleeWeapons', 'LowDmg')

    state.AutoCaress = M(false, 'Auto Caress Mode')

    -- state.BarElement = M{['description']='BarElement', 'Barfira', 'Barblizzara', 'Baraera', 'Barstonra', 'Barthundra', 'Barwatera'}
    -- state.BarStatus = M{['description']='BarStatus', 'Baramnesra', 'Barvira', 'Barparalyzra', 'Barsilencera', 'Barpetra', 'Barpoisonra', 'Barblindra', 'Barsleepra'}
    -- state.BoostSpell = M{['description']='BoostSpell', 'Boost-STR', 'Boost-INT', 'Boost-AGI', 'Boost-VIT', 'Boost-DEX', 'Boost-MND', 'Boost-CHR'}

    gear.obi_cure_waist = "Austerity Belt +1"
    gear.obi_cure_back = "Alaunus's Cape"

    gear.obi_nuke_waist = "Sekhmet Corset"
    gear.obi_high_nuke_waist = "Yamabuki-no-Obi"
    gear.obi_nuke_back = "Toro Cape"

    -- Additional local binds
    send_command('bind ^backspace input /ja "Sacrosanctity" <me>')
    send_command('bind @backspace input /ma "Aurorastorm" <me>')
    send_command('bind != gs c toggle AutoSubMode') -- Automatically uses sublimation.

    send_command('bind ^\\\\ input /ma "Protectra V" <me>')
    send_command('bind !\\\\ input /ma "Shellra V" <me>')
    send_command('bind @\\\\ input /ma "Reraise IV" <me>')

    send_command('bind @p input /ja "Light Arts" <me>; wait 2; input /ja "Addendum: White" <me>')
    send_command('bind @o input /ja "Dark Arts" <me>; wait 2; input /ja "Addendum: Black" <me>')


    autows = 'Black Halo'

    select_default_macro_book()
    user_job_lockstyle()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------

    -- Weapons sets
    sets.weapons.MeleeWeapons = {
        main = "Maxentius",
        sub = "Culminus"
    }

    sets.weapons.DualWield = {
        sub = "C. Palug Hammer",
        main = "Maxentius"
    }

    sets.weapons.Trial = {
        main = "Yagrush",
        sub = "Ammurapi Shield"
    }
    sets.weapons.LowDmg = {
        main = "Cobra Staff",
        sub = "Oneiros Grip",
        ammo = "Homiliary"
    }

    sets.buff.Sublimation = {
        waist = "Embla Sash"
    }
    sets.buff.DTSublimation = {
        waist = "Embla Sash"
    }

    -- Precast Sets

    -- Fast cast sets for spells
    sets.precast.FC = {
        main = "C. Palug Hammer",
        sub = "Chanter's Shield",
        ammo = "Impatiens",
        head = "Ebers Cap +2",
        body = "Inyanga Jubbah +2",
        hands = "Inyan. Dastanas +2",
        legs = "Aya. Cosciales +2",
        feet = "Regal Pumps +1",
        neck = "Cleric's Torque",
        waist = "Witful Belt",
        left_ear = "Loquac. Earring",
        right_ear = "Malignance Earring",
        right_ring = "Prolix Ring",
        left_ring = "Kishar Ring",
        back = "Alaunus's Cape"
    }

    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {
        ear1 = "Mendi. Earring",
        waist = "Embla Sash"
    })

    sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {})

    sets.precast.FC['Healing Magic'] = set_combine(sets.precast.FC, {
        legs = "Ebers Pant. +2",
        ring2 = "Lebeche Ring"
    })

    sets.precast.FC.StatusRemoval = sets.precast.FC['Healing Magic']

    sets.precast.FC.Cure = set_combine(sets.precast.FC['Healing Magic'], {
        main = "Queller Rod",
        sub = "Sors Shield",
        feet = gear.vanya_cure_feet
    })

    sets.precast.FC.Curaga = sets.precast.FC.Cure

    sets.precast.FC.CureSolace = sets.precast.FC.Cure

    sets.precast.FC.Impact = set_combine(sets.precast.FC, {
        head = empty,
        body = "Twilight Cloak"
    })

    sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {
        main = "Daybreak",
        sub = "Genbu\'s Shield"
    })

    -- Precast sets to enhance JAs
    sets.precast.JA.Benediction = {
        body = "Piety Bliaut +1"
    }

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {
        head = "Nahtirah Hat",
        ear1 = "Roundel Earring",
        body = "Piety Bliaut +1",
        hands = "Telchine Gloves",
        waist = "Chaac Belt",
        back = "Aurist's Cape +1"
    }

    -- Weaponskill sets

    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
        ammo = "Floestone",
        head = "Nyame Helm",
        neck = "Cleric's Torque",
        ear1 = "Moonshade Earring",
        ear2 = "Ishvara Earring",
        body = "Nyame Mail",
        hands = "Nyame Gauntlets",
        ring1 = "Karieyh Ring +1",
        ring2 = "Rufescent Ring",
        back = "Alaunus's Cape",
        waist = "Grunfeld Rope",
        legs = "Nyame Flanchard",
        feet = "Nyame Sollerets"
    }

    sets.precast.WS['Black Halo'] = {
        ammo = "Floestone",
        head = "Nyame Helm",
        neck = "Cleric's Torque",
        ear1 = "Moonshade Earring",
        ear2 = "Ishvara Earring",
        body = "Nyame Mail",
        hands = "Nyame Gauntlets",
        ring1 = "Karieyh Ring +1",
        ring2 = "Rufescent Ring",
        back = "Alaunus's Cape",
        waist = "Grunfeld Rope",
        legs = "Nyame Flanchard",
        feet = "Nyame Sollerets"
    }

    sets.precast.WS.Dagan = {
        ammo = "Hasty Pinion +1",
        head = "Befouled Crown",
        neck = "Asperity Necklace",
        ear1 = "Etiolation Earring",
        ear2 = "Moonshade Earring",
        body = "Kaykaus Bliaut",
        hands = "Telchine Gloves",
        ring1 = "Stikini Ring",
        ring2 = "Rufescent Ring",
        back = "Buquwik Cape",
        waist = "Fotia Belt",
        legs = "Assid. Pants +1",
        feet = "Gende. Galosh. +1"
    }

    sets.MaxTP = {
        ear1 = "Cessance Earring",
        ear2 = "Brutal Earring"
    }
    sets.MaxTP.Dagan = {
        ear1 = "Etiolation Earring",
        ear2 = "Evans Earring"
    }

    -- sets.precast.WS['Flash Nova'] = {}

    -- sets.precast.WS['Mystic Boon'] = {}

    -- Midcast Sets

    -- sets.Kiting = {feet="Herald's Gaiters"}
    sets.Kiting = {}
    sets.latent_refresh = {
        waist = "Fucho-no-obi"
    }
    sets.latent_refresh_grip = {
        sub = "Oneiros Grip"
    }
    sets.TPEat = {
        neck = "Chrys. Torque"
    }
    sets.DayIdle = {}
    sets.NightIdle = {
        back = "Umbra Cape"
    }
    sets.TreasureHunter = set_combine(sets.TreasureHunter, {
        ammo = "Per. Lucky Egg",
        waist = "Chaac Belt"
    })

    -- Situational sets: Gear that is equipped on certain targets
    sets.Self_Healing = {
        neck = "Phalaina Locket",
        ring1 = "Kunaji Ring",
        ring2 = "Asklepian Ring",
        waist = "Gishdubar Sash"
    }
    sets.Cure_Received = {
        neck = "Phalaina Locket",
        ring1 = "Kunaji Ring",
        ring2 = "Asklepian Ring",
        waist = "Gishdubar Sash"
    }
    sets.Self_Refresh = {
        head = "Erilaz Galea",
        back = "Grapevine Cape",
        waist = "Gishdubar Sash",
        feet = "Inspirited Boots"
    }

    -- Conserve Mp set for spells that don't need anything else, for set_combine.

    sets.ConserveMP = {
        main = "Rubicundity",
        ammo = "Clarus Stone",
        head = gear.vanya_fc_head,
        feet = gear.vanya_cure_feet,
        waist = "Austerity Belt",
        right_ear = "Mendi. Earring",
        left_ear = "Gifted Earring",
        back = "Solemnity Cape"
    }

    sets.midcast.Teleport = sets.ConserveMP

    -- Gear for Magic Burst mode.
    sets.MagicBurst = {
        main = gear.grioavolr_nuke_staff,
        sub = "Enki Strap",
        neck = "Mizu. Kubikazari",
        ring1 = "Mujin Band",
        ring2 = "Locus Ring"
    }

    sets.midcast.FastRecast = {
        main = "C. Palug Hammer",
        sub = "Chanter's Shield",
        ammo = "Impatiens",
        head = "Nahtirah Hat",
        neck = "Voltsurge Torque",
        ear1 = "Enchntr. Earring +1",
        ear2 = "Malignance Earring",
        body = "Inyanga Jubbah +2",
        hands = "Gende. Gages +1",
        ring1 = "Kishar Ring",
        ring2 = "Prolix Ring",
        back = "Swith Cape +1",
        waist = "Witful Belt",
        legs = "Lengo Pants",
        feet = "Regal Pumps +1"
    }

    -- Cure sets

    sets.midcast['Full Cure'] = sets.midcast.FastRecast

    sets.midcast.Cure = {
        main = "Chatoyant Staff",
        sub = "Enki Strap",
        ammo = "Clarus Stone",
        head = "Ebers Cap +2",
        body = "Theo. Bliaut +3",
        hands = "Theophany Mitts +3",
        legs = "Ebers Pant. +2",
        feet = gear.vanya_cure_feet,
        neck = "Cleric's Torque",
        waist = "Austerity Belt",
        left_ear = "Mendi. Earring",
        right_ear = "Glorious Earring",
        left_ring = "Stikini Ring",
        right_ring = "Lebeche Ring",
        back = "Alaunus's Cape"
    }

    sets.midcast.CureSolace = {
        main = "Queller Rod",
        sub = "Sors Shield",
        ammo = "Pemphredo Tathlum",
        head = "Gende. Caubeen +1",
        neck = "Incanter's Torque",
        ear1 = "Regal Earring",
        ear2 = "Glorious Earring",
        body = "Ebers Bliaut +2",
        hands = "Theophany Mitts +3",
        ring1 = "Janniston Ring",
        ring2 = "Lebeche Ring",
        back = "Alaunus's Cape",
        waist = "Luminary Sash",
        legs = "Ebers Pant. +2",
        feet = gear.vanya_cure_feet
    }

    sets.midcast.LightWeatherCure = {
        main = "Chatoyant Staff",
        sub = "Curatio Grip",
        ammo = "Esper Stone +1",
        head = "Gende. Caubeen +1",
        neck = "Incanter's Torque",
        ear1 = "Nourish. Earring +1",
        ear2 = "Glorious Earring",
        body = "Kaykaus Bliaut",
        hands = "Theophany Mitts +3",
        ring1 = "Janniston Ring",
        ring2 = "Lebeche Ring",
        back = "Twilight Cape",
        waist = "Korin Obi",
        legs = "Ebers Pant. +2",
        feet = gear.vanya_cure_feet
    }

    sets.midcast.LightWeatherCureSolace = {
        main = "Chatoyant Staff",
        sub = "Curatio Grip",
        ammo = "Esper Stone +1",
        head = "Gende. Caubeen +1",
        neck = "Incanter's Torque",
        ear1 = "Regal Earring",
        ear2 = "Glorious Earring",
        body = "Ebers Bliaut +2",
        hands = "Theophany Mitts +3",
        ring1 = "Janniston Ring",
        ring2 = "Lebeche Ring",
        back = "Alaunus's Cape",
        waist = "Korin Obi",
        legs = "Ebers Pant. +2",
        feet = gear.vanya_cure_feet
    }

    sets.midcast.LightDayCureSolace = {
        main = "Queller Rod",
        sub = "Sors Shield",
        ammo = "Pemphredo Tathlum",
        head = "Gende. Caubeen +1",
        neck = "Incanter's Torque",
        ear1 = "Regal Earring",
        ear2 = "Glorious Earring",
        body = "Ebers Bliaut +2",
        hands = "Theophany Mitts +3",
        ring1 = "Janniston Ring",
        ring2 = "Lebeche Ring",
        back = "Alaunus's Cape",
        waist = "Korin Obi",
        legs = "Ebers Pant. +2",
        feet = gear.vanya_cure_feet
    }

    sets.midcast.LightDayCure = {
        main = "Queller Rod",
        sub = "Sors Shield",
        ammo = "Pemphredo Tathlum",
        head = "Gende. Caubeen +1",
        neck = "Incanter's Torque",
        ear1 = "Nourish. Earring +1",
        ear2 = "Glorious Earring",
        body = "Theo. Bliaut +3",
        hands = "Theophany Mitts +3",
        ring1 = "Janniston Ring",
        ring2 = "Lebeche Ring",
        back = "Twilight Cape",
        waist = "Korin Obi",
        legs = "Ebers Pant. +2",
        feet = gear.vanya_cure_feet
    }

    sets.midcast.Curaga = {
        main = "Queller Rod",
        sub = "Sors Shield",
        ammo = "Pemphredo Tathlum",
        head = "Gende. Caubeen +1",
        neck = "Incanter's Torque",
        ear1 = "Regal Earring",
        ear2 = "Glorious Earring",
        body = "Theo. Bliaut +3",
        hands = "Theophany Mitts +3",
        ring1 = "Janniston Ring",
        ring2 = "Lebeche Ring",
        back = "Alaunus's Cape",
        waist = "Luminary Sash",
        legs = "Ebers Pant. +2",
        feet = gear.vanya_cure_feet
    }

    sets.midcast.LightWeatherCuraga = {
        main = "Chatoyant Staff",
        sub = "Curatio Grip",
        ammo = "Esper Stone +1",
        head = "Gende. Caubeen +1",
        neck = "Incanter's Torque",
        ear1 = "Nourish. Earring +1",
        ear2 = "Glorious Earring",
        body = "Kaykaus Bliaut",
        hands = "Theophany Mitts +3",
        ring1 = "Janniston Ring",
        ring2 = "Lebeche Ring",
        back = "Twilight Cape",
        waist = "Korin Obi",
        legs = "Ebers Pant. +2",
        feet = gear.vanya_cure_feet
    }

    sets.midcast.LightDayCuraga = {
        main = "Queller Rod",
        sub = "Sors Shield",
        ammo = "Pemphredo Tathlum",
        head = "Gende. Caubeen +1",
        neck = "Incanter's Torque",
        ear1 = "Nourish. Earring +1",
        ear2 = "Glorious Earring",
        body = "Theo. Bliaut +3",
        hands = "Theophany Mitts +3",
        ring1 = "Janniston Ring",
        ring2 = "Lebeche Ring",
        back = "Twilight Cape",
        waist = "Korin Obi",
        legs = "Ebers Pant. +2",
        feet = gear.vanya_cure_feet
    }

    sets.midcast.Cure.DT = {
        main = "Queller Rod",
        sub = "Genbu\'s Shield",
        ammo = "Staunch Tathlum +1",
        head = "Gende. Caubeen +1",
        neck = "Loricate Torque +1",
        ear1 = "Nourish. Earring +1",
        ear2 = "Glorious Earring",
        body = "Ayanmo Corazza +2",
        hands = "Gende. Gages +1",
        ring1 = "Defending Ring",
        ring2 = "Dark Ring",
        back = "Alaunus's Cape",
        waist = "Luminary Sash",
        legs = "Ebers Pant. +2",
        feet = "Gende. Galosh. +1"
    }

    -- Melee Curesets are used whenever your Weapons state is set to anything but None.
    sets.midcast.MeleeCure = {
        ammo = "Pemphredo Tathlum",
        head = "Gende. Caubeen +1",
        neck = "Incanter's Torque",
        ear1 = "Regal Earring",
        ear2 = "Glorious Earring",
        body = "Theo. Bliaut +3",
        hands = "Kaykaus Cuffs",
        ring1 = "Janniston Ring",
        ring2 = "Lebeche Ring",
        back = "Alaunus's Cape",
        waist = "Luminary Sash",
        legs = "Ebers Pant. +2",
        feet = gear.vanya_cure_feet
    }

    sets.midcast.MeleeCureSolace = set_combine(sets.midcast.MeleeCure, {
        body = "Ebers Bliaut +2"
    })
    sets.midcast.MeleeLightWeatherCure = set_combine(sets.midcast.MeleeCure, {
        waist = "Korin Obi"
    })
    sets.midcast.MeleeLightWeatherCureSolace = set_combine(sets.midcast.MeleeCure, {
        body = "Ebers Bliaut +2",
        waist = "Korin Obi"
    })
    sets.midcast.MeleeLightDayCureSolace = set_combine(sets.midcast.MeleeCure, {
        body = "Ebers Bliaut +2",
        waist = "Korin Obi"
    })
    sets.midcast.MeleeLightDayCure = set_combine(sets.midcast.MeleeCure, {
        waist = "Korin Obi"
    })
    sets.midcast.MeleeCuraga = set_combine(sets.midcast.MeleeCure, {})
    sets.midcast.MeleeLightWeatherCuraga = set_combine(sets.midcast.MeleeCure, {
        waist = "Korin Obi"
    })
    sets.midcast.MeleeLightDayCuraga = set_combine(sets.midcast.MeleeCure, {
        waist = "Korin Obi"
    })

    sets.midcast.CureSolace.DT = set_combine(sets.midcast.Cure.DT, {
        body = "Ebers Bliaut +2"
    })
    sets.midcast.LightWeatherCure.DT = set_combine(sets.midcast.Cure.DT, {
        waist = "Korin Obi"
    })
    sets.midcast.LightWeatherCureSolace.DT = set_combine(sets.midcast.Cure.DT, {
        body = "Ebers Bliaut +2",
        waist = "Korin Obi"
    })
    sets.midcast.LightDayCureSolace.DT = set_combine(sets.midcast.Cure.DT, {
        body = "Ebers Bliaut +2",
        waist = "Korin Obi"
    })
    sets.midcast.LightDayCure.DT = set_combine(sets.midcast.Cure.DT, {
        waist = "Korin Obi"
    })
    sets.midcast.Curaga.DT = set_combine(sets.midcast.Cure.DT, {})
    sets.midcast.LightWeatherCuraga.DT = set_combine(sets.midcast.Cure.DT, {
        waist = "Korin Obi"
    })
    sets.midcast.LightDayCuraga.DT = set_combine(sets.midcast.Cure.DT, {
        waist = "Korin Obi"
    })
    sets.midcast.MeleeCure.DT = set_combine(sets.midcast.Cure.DT, {})

    sets.midcast.MeleeCureSolace.DT = set_combine(sets.midcast.Cure.DT, {
        body = "Ebers Bliaut +2"
    })
    sets.midcast.MeleeLightWeatherCure.DT = set_combine(sets.midcast.Cure.DT, {
        waist = "Korin Obi"
    })
    sets.midcast.MeleeLightWeatherCureSolace.DT = set_combine(sets.midcast.Cure.DT, {
        body = "Ebers Bliaut +2",
        waist = "Korin Obi"
    })
    sets.midcast.MeleeLightDayCureSolace.DT = set_combine(sets.midcast.Cure.DT, {
        body = "Ebers Bliaut +2",
        waist = "Korin Obi"
    })
    sets.midcast.MeleeLightDayCure.DT = set_combine(sets.midcast.Cure.DT, {
        waist = "Korin Obi"
    })
    sets.midcast.MeleeCuraga.DT = set_combine(sets.midcast.Cure.DT, {})
    sets.midcast.MeleeLightWeatherCuraga.DT = set_combine(sets.midcast.Cure.DT, {
        waist = "Korin Obi"
    })
    sets.midcast.MeleeLightDayCuraga.DT = set_combine(sets.midcast.Cure.DT, {
        waist = "Korin Obi"
    })

    sets.midcast.Cursna = {
        main = "Yagrush",
        sub = "Chanter's Shield",
        ammo = "Hasty Pinion +1",
        head = gear.vanya_healskill_head,
        neck = "Debilis Medallion",
        ear1 = "Meili Earring",
        ear2 = "Beatific Earring",
        body = "Ebers Bliaut +2",
        hands = "Fanatic Gloves",
        ring1 = "Haoma's Ring",
        ring2 = "Ephedra Ring",
        back = "Mending Cape",
        waist = "Bishop's Sash",
        legs = "Theo. Pant. +1",
        feet = gear.vanya_healskill_feet
    }

    sets.midcast.StatusRemoval = {
        main = "Yagrush",
        sub = "Chanter's Shield",
        ammo = "Hasty Pinion +1",
        head = "Bunzi's Hat",
        neck = "Voltsurge Torque",
        ear1 = "Enchntr. Earring +1",
        ear2 = "Malignance Earring",
        body = "Inyanga Jubbah +2",
        hands = "Fanatic Gloves",
        ring1 = "Kishar Ring",
        ring2 = "Prolix Ring",
        back = "Swith Cape +1",
        waist = "Witful Belt",
        legs = "Ebers Pant. +2",
        feet = "Regal Pumps +1"
    }

    sets.midcast.Erase = set_combine(sets.midcast.StatusRemoval, {
        neck = "Cleric's Torque"
    })

    -- 110 total Enhancing Magic Skill; caps even without Light Arts
    sets.midcast['Enhancing Magic'] = {
        main = "Beneficus",
        sub = "Ammurapi Shield",
        ammo = "Clarus Stone",
        head = "Umuthi Hat",
        body = {
            name = "Telchine Chas.",
            augments = { 'Enh. Mag. eff. dur. +10' }
        },
        hands = "Inyan. Dastanas +2",
        legs = "Piety Pantaln. +3",
        feet = "Ebers Duckbills +2",
        neck = "Incanter's Torque",
        waist = "Olympus Sash",
        left_ear = "Mimir Earring",
        right_ear = "Andoaa Earring",
        left_ring = "Stikini Ring",
        right_ring = "Stikini Ring",
        back = "Fi Follet Cape"
    }

    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {
        neck = "Nodens Gorget",
        ear2 = "Earthcry Earring",
        waist = "Siegel Sash",
        legs = "Shedir Seraweels",
        head = {
            name = "Telchine Cap",
            augments = { 'Enh. Mag. eff. dur. +9' }
        },
        body = {
            name = "Telchine Chas.",
            augments = { 'Enh. Mag. eff. dur. +10' }
        },
        hands = {
            name = "Telchine Gloves",
            augments = { 'Enh. Mag. eff. dur. +10' }
        },
        feet = "Theo. Duckbills +2"
    })

    sets.midcast.Auspice = set_combine(sets.midcast['Enhancing Magic'], {
        feet = "Ebers Duckbills +2",
        head = {
            name = "Telchine Cap",
            augments = { 'Enh. Mag. eff. dur. +9' }
        },
        body = {
            name = "Telchine Chas.",
            augments = { 'Enh. Mag. eff. dur. +10' }
        },
        hands = {
            name = "Telchine Gloves",
            augments = { 'Enh. Mag. eff. dur. +10' }
        },
        legs = {
            name = "Telchine Braconi",
            augments = { 'Enh. Mag. eff. dur. +10' }
        },
        waist = "Embla Sash"
    })

    sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {
        main = "Vadose Rod",
        sub = "Ammurapi Shield",
        hands = "Regal Cuffs",
        waist = "Emphatikos Rope",
        legs = "Shedir Seraweels"
    })

    sets.midcast.Regen = set_combine(sets.midcast['Enhancing Magic'], {
        main = "Bolelabunga",
        sub = "Ammurapi Shield",
        head = "Inyanga Tiara +2",
        hands = "Ebers Mitts +2",
        feet = "Theo. Duckbills +2",
        waist = "Embla Sash",
        body = {
            name = "Telchine Chas.",
            augments = { 'Enh. Mag. eff. dur. +10' }
        },
        legs = "Theo. Pant. +1",
        feet = "Theo. Duckbills +2"
    })

    sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {
        ring2 = "Sheltered Ring",
        waist = "Sekhmet Corset",
        head = {
            name = "Telchine Cap",
            augments = { 'Enh. Mag. eff. dur. +9' }
        },
        body = {
            name = "Telchine Chas.",
            augments = { 'Enh. Mag. eff. dur. +10' }
        },
        hands = {
            name = "Telchine Gloves",
            augments = { 'Enh. Mag. eff. dur. +10' }
        },
        legs = {
            name = "Telchine Braconi",
            augments = { 'Enh. Mag. eff. dur. +10' }
        },
        feet = "Theo. Duckbills +2"

    })
    sets.midcast.Protectra = set_combine(sets.midcast['Enhancing Magic'], {
        ring2 = "Sheltered Ring",
        waist = "Sekhmet Corset",
        head = {
            name = "Telchine Cap",
            augments = { 'Enh. Mag. eff. dur. +9' }
        },
        body = {
            name = "Telchine Chas.",
            augments = { 'Enh. Mag. eff. dur. +10' }
        },
        hands = {
            name = "Telchine Gloves",
            augments = { 'Enh. Mag. eff. dur. +10' }
        },
        legs = {
            name = "Telchine Braconi",
            augments = { 'Enh. Mag. eff. dur. +10' }
        },
        feet = "Theo. Duckbills +2"
    })
    sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {
        ring2 = "Sheltered Ring",
        legs = "Piety Pantaln. +3",
        waist = "Sekhmet Corset",
        head = {
            name = "Telchine Cap",
            augments = { 'Enh. Mag. eff. dur. +9' }
        },
        body = {
            name = "Telchine Chas.",
            augments = { 'Enh. Mag. eff. dur. +10' }
        },
        hands = {
            name = "Telchine Gloves",
            augments = { 'Enh. Mag. eff. dur. +10' }
        },
        feet = "Theo. Duckbills +2"
    })
    sets.midcast.Shellra = set_combine(sets.midcast['Enhancing Magic'], {
        ring2 = "Sheltered Ring",
        legs = "Piety Pantaln. +3",
        waist = "Sekhmet Corset",
        head = {
            name = "Telchine Cap",
            augments = { 'Enh. Mag. eff. dur. +9' }
        },
        body = {
            name = "Telchine Chas.",
            augments = { 'Enh. Mag. eff. dur. +10' }
        },
        hands = {
            name = "Telchine Gloves",
            augments = { 'Enh. Mag. eff. dur. +10' }
        },
        feet = "Theo. Duckbills +2"
    })

    sets.midcast.BarElement = {
        main = "Beneficus",
        sub = "Ammurapi Shield",
        ammo = "Staunch Tathlum +1",
        head = "Ebers Cap +2",
        neck = "Incanter's Torque",
        ear1 = "Mimir Earring",
        ear2 = "Andoaa Earring",
        body = "Ebers Bliaut +2",
        hands = "Ebers Mitts +2",
        ring1 = "Stikini Ring",
        ring2 = "Stikini Ring",
        back = "Alaunus's Cape",
        waist = "Embla Sash",
        legs = "Piety Pantaln. +3",
        feet = "Ebers Duckbills +2"
    }

    sets.midcast.Impact = {
        main = "Daybreak",
        sub = "Ammurapi Shield",
        ammo = "Pemphredo Tathlum",
        head = empty,
        neck = "Erra Pendant",
        ear1 = "Regal Earring",
        ear2 = "Digni. Earring",
        body = "Twilight Cloak",
        hands = "Obstin. Sash",
        ring1 = "Metamor. Ring +1",
        ring2 = "Stikini Ring",
        back = "Toro Cape",
        waist = "Acuity Belt +1",
        legs = "Chironic Hose",
        feet = gear.chironic_nuke_feet
    }

    sets.midcast['Elemental Magic'] = {
        main = "Daybreak",
        sub = "Ammurapi Shield",
        ammo = "Dosis Tathlum",
        head = "C. Palug Crown",
        neck = "Baetyl Pendant",
        ear1 = "Regal Earring",
        ear2 = "Friomisi Earring",
        body = "Witching Robe",
        hands = "Obstin. Sash",
        ring1 = "Shiva Ring",
        ring2 = "Freke Ring",
        back = "Toro Cape",
        waist = gear.ElementalObi,
        legs = "Chironic Hose",
        feet = gear.chironic_nuke_feet
    }

    sets.midcast['Elemental Magic'].Resistant = {
        main = "Daybreak",
        sub = "Ammurapi Shield",
        ammo = "Dosis Tathlum",
        head = "C. Palug Crown",
        neck = "Sanctity Necklace",
        ear1 = "Regal Earring",
        ear2 = "Crematio Earring",
        body = "Witching Robe",
        hands = "Obstin. Sash",
        ring1 = "Metamor. Ring +1",
        ring2 = "Freke Ring",
        back = "Toro Cape",
        waist = "Yamabuki-no-Obi",
        legs = "Chironic Hose",
        feet = gear.chironic_nuke_feet
    }

    sets.midcast['Divine Magic'] = {
        main = "Daybreak",
        sub = "Ammurapi Shield",
        ammo = "Pemphredo Tathlum",
        head = "C. Palug Crown",
        neck = "Incanter's Torque",
        ear1 = "Regal Earring",
        ear2 = "Digni. Earring",
        body = "Inyanga Jubbah +2",
        hands = "Fanatic Gloves",
        ring1 = "Stikini Ring",
        ring2 = "Stikini Ring",
        back = "Aurist's Cape +1",
        waist = "Luminary Sash",
        legs = "Chironic Hose",
        feet = gear.chironic_nuke_feet
    }

    sets.midcast.Holy = {
        main = "Daybreak",
        sub = "Ammurapi Shield",
        ammo = "Pemphredo Tathlum",
        head = "C. Palug Crown",
        neck = "Baetyl Pendant",
        ear1 = "Regal Earring",
        ear2 = "Friomisi Earring",
        body = "Witching Robe",
        hands = "Obstin. Sash",
        ring1 = "Metamor. Ring +1",
        ring2 = "Freke Ring",
        back = "Toro Cape",
        waist = gear.ElementalObi,
        legs = "Gyve Trousers",
        feet = gear.chironic_nuke_feet
    }

    sets.midcast['Dark Magic'] = {
        main = "Daybreak",
        sub = "Ammurapi Shield",
        ammo = "Pemphredo Tathlum",
        head = "Befouled Crown",
        neck = "Erra Pendant",
        ear1 = "Regal Earring",
        ear2 = "Digni. Earring",
        body = "Inyanga Jubbah +2",
        hands = "Obstin. Sash",
        ring1 = "Stikini Ring",
        ring2 = "Stikini Ring",
        back = "Aurist's Cape +1",
        waist = "Acuity Belt +1",
        legs = "Chironic Hose",
        feet = gear.chironic_nuke_feet
    }

    sets.midcast.Drain = {
        main = "Rubicundity",
        sub = "Ammurapi Shield",
        ammo = "Pemphredo Tathlum",
        head = "Pixie Hairpin +1",
        neck = "Erra Pendant",
        ear1 = "Regal Earring",
        ear2 = "Digni. Earring",
        body = "Inyanga Jubbah +2",
        hands = "Obstin. Sash",
        ring1 = "Evanescence Ring",
        ring2 = "Archon Ring",
        back = "Aurist's Cape +1",
        waist = "Fucho-no-obi",
        legs = "Chironic Hose",
        feet = gear.chironic_nuke_feet
    }

    sets.midcast.Drain.Resistant = {
        main = "Rubicundity",
        sub = "Ammurapi Shield",
        ammo = "Pemphredo Tathlum",
        head = "Befouled Crown",
        neck = "Erra Pendant",
        ear1 = "Regal Earring",
        ear2 = "Digni. Earring",
        body = "Chironic Doublet",
        hands = "Obstin. Sash",
        ring1 = "Stikini Ring",
        ring2 = "Stikini Ring",
        back = "Aurist's Cape +1",
        waist = "Fucho-no-obi",
        legs = "Chironic Hose",
        feet = gear.chironic_nuke_feet
    }

    sets.midcast.Aspir = sets.midcast.Drain
    sets.midcast.Aspir.Resistant = sets.midcast.Drain.Resistant

    sets.midcast.Stun = {
        main = "C. Palug Hammer",
        sub = "Chanter's Shield",
        ammo = "Hasty Pinion +1",
        head = "Nahtirah Hat",
        neck = "Voltsurge Torque",
        ear1 = "Enchntr. Earring +1",
        ear2 = "Malignance Earring",
        body = "Inyanga Jubbah +2",
        hands = "Fanatic Gloves",
        ring1 = "Kishar Ring",
        ring2 = "Stikini Ring",
        back = "Aurist's Cape +1",
        waist = "Witful Belt",
        legs = "Lengo Pants",
        feet = "Regal Pumps +1"
    }

    sets.midcast.Stun.Resistant = {
        main = "Daybreak",
        sub = "Ammurapi Shield",
        ammo = "Pemphredo Tathlum",
        head = "Nahtirah Hat",
        neck = "Erra Pendant",
        ear1 = "Regal Earring",
        ear2 = "Digni. Earring",
        body = "Inyanga Jubbah +2",
        hands = "Fanatic Gloves",
        ring1 = "Stikini Ring",
        ring2 = "Stikini Ring",
        back = "Aurist's Cape +1",
        waist = "Acuity Belt +1",
        legs = "Chironic Hose",
        feet = gear.chironic_nuke_feet
    }

    sets.midcast.Dispel = {
        main = "Daybreak",
        sub = "Ammurapi Shield",
        ammo = "Pemphredo Tathlum",
        head = "Nahtirah Hat",
        neck = "Erra Pendant",
        ear1 = "Regal Earring",
        ear2 = "Digni. Earring",
        body = "Inyanga Jubbah +2",
        hands = "Fanatic Gloves",
        ring1 = "Stikini Ring",
        ring2 = "Stikini Ring",
        back = "Aurist's Cape +1",
        waist = "Acuity Belt +1",
        legs = "Chironic Hose",
        feet = gear.chironic_nuke_feet
    }

    sets.midcast.Dispelga = set_combine(sets.midcast.Dispel, {
        main = "Daybreak",
        sub = "Ammurapi Shield"
    })

    sets.midcast['Enfeebling Magic'] = {
        main = "Daybreak",
        sub = "Ammurapi Shield",
        ammo = "Plumose Sachet",
        head = "Inyanga Tiara +2",
        body = "Theo. Bliaut +3",
        hands = "Inyan. Dastanas +2",
        legs = "Aya. Cosciales +2",
        feet = "Theo. Duckbills +2",
        neck = "Erra Pendant",
        waist = "Aswang Sash",
        left_ear = "Malignance Earring",
        right_ear = "Gwati Earring",
        left_ring = "Kishar Ring",
        right_ring = "Stikini Ring",
        back = {
            name = "Alaunus's Cape",
            augments = { 'MND+20', 'Eva.+20 /Mag. Eva.+20', '"Fast Cast"+10', 'Phys. dmg. taken-10%' }
        }
    }

    sets.midcast['Enfeebling Magic'].Resistant = {
        main = "Daybreak",
        sub = "Ammurapi Shield",
        ammo = "Pemphredo Tathlum",
        head = "Befouled Crown",
        neck = "Erra Pendant",
        ear1 = "Regal Earring",
        ear2 = "Digni. Earring",
        body = "Theophany Bliaut +2",
        hands = "Theophany Mitts +3",
        ring1 = "Metamor. Ring +1",
        ring2 = "Stikini Ring",
        back = "Aurist's Cape +1",
        waist = "Luminary Sash",
        legs = "Chironic Hose",
        feet = "Theo. Duckbills +2"
    }

    sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
    sets.midcast.Diaga = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
    sets.midcast['Dia II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
    sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
    sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)

    sets.midcast.ElementalEnfeeble = set_combine(sets.midcast['Enfeebling Magic'], {})
    sets.midcast.ElementalEnfeeble.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})

    sets.midcast.IntEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {
        waist = "Acuity Belt +1"
    })
    sets.midcast.IntEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {
        waist = "Acuity Belt +1"
    })

    sets.midcast.MndEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {
        back = "Alaunus's Cape"
    })
    sets.midcast.MndEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {
        back = "Alaunus's Cape"
    })

    -- Sets to return to when not performing an action.

    -- Resting sets
    sets.resting = {
        main = "Chatoyant Staff",
        sub = "Oneiros Grip",
        ammo = "Homiliary",
        head = "Befouled Crown",
        neck = "Chrys. Torque",
        ear1 = "Etiolation Earring",
        ear2 = "Ethereal Earring",
        body = "Ebers Bliaut +2",
        hands = gear.chironic_refresh_hands,
        ring1 = "Defending Ring",
        ring2 = "Dark Ring",
        back = "Umbra Cape",
        waist = "Fucho-no-obi",
        legs = "Assid. Pants +1",
        feet = gear.chironic_refresh_feet
    }

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
    sets.idle = {
        main = "Malignance Pole",
        sub = "Mensch Strap +1",
        ammo = "Homiliary",
        head = "Nyame Helm",
        body = "Ebers Bliaut +2",
        hands = "Inyan. Dastanas +2",
        legs = "Assid. Pants +1",
        feet = "Nyame Sollerets",
        neck = "Loricate Torque +1",
        waist = "Carrier's Sash",
        left_ear = "Eabani Earring",
        right_ear = "Hearty Earring",
        right_ring = "Inyanga Ring",
        left_ring = "Defending Ring",
        back = "Alaunus's Cape"
    }

    sets.idle.PDT = sets.idle

    sets.idle.Meva = sets.idle

    sets.idle.Town = set_combine(sets.idle, {
        main = "Yagrush",
        sub = "Ammurapi Shield"
    })

    sets.idle.Weak = {
        main = "Daybreak",
        sub = "Genbu's Shield",
        ammo = "Homiliary",
        head = "Inyanga Tiara +2",
        body = "Nyame Mail",
        hands = "Inyan. Dastanas +2",
        legs = "Nyame Flanchard",
        feet = "Inyan. Crackows +2",
        neck = "Loricate Torque +1",
        waist = "Slipor Sash",
        left_ear = "Eabani Earring",
        right_ear = "Hearty Earring",
        right_ring = "Ayanmo Ring",
        left_ring = "Defending Ring",
        back = "Alaunus's Cape"
    }

    -- Defense sets

    sets.defense.DT = {
        main = "Bolelabunga",
        sub = "Genbu\'s Shield",
        ammo = "Staunch Tathlum +1",
        head = "Nyame Helm",
        neck = "Loricate Torque +1",
        ear1 = "Etiolation Earring",
        ear2 = "Ethereal Earring",
        body = "Nyame Mail",
        hands = "Nyame Gauntlets",
        ring1 = "Defending Ring",
        ring2 = "Gelatinous Ring +1",
        back = "Solemnity Cape",
        waist = "Flax Sash",
        legs = "Nyame Flanchard",
        feet = "Nyame Sollerets"
    }

    sets.defense.MDT = {
        main = "Mafic Cudgel",
        sub = "Genbu\'s Shield",
        ammo = "Staunch Tathlum +1",
        head = "Bunzi's Hat",
        body = "Bunzi's Robe",
        hands = "Bunzi's Gloves",
        neck = "Loricate Torque +1",
        ear1 = "Etiolation Earring",
        ear2 = "Sanare Earring",
        ring1 = "Defending Ring",
        ring2 = "Ayanmo Ring",
        back = "Solemnity Cape",
        waist = "Carrier's Sash",
        legs = "Nyame Flanchard",
        feet = "Nyame Sollerets"
    }

    sets.defense.Refresh = {
        ammo = "Homiliary",
        head = "Inyanga Tiara +2",
        body = "Theo. Bliaut +3",
        hands = "Inyan. Dastanas +2",
        legs = "Assid. Pants +1",
        feet = "Inyan. Crackows +2",
        neck = "Bathy Choker +1",
        waist = "Fucho-no-obi",
        left_ear = "Eabani Earring",
        right_ear = "Hearty Earring",
        left_ring = "Inyanga Ring",
        right_ring = "Defending Ring",
        back = "Solemnity Cape"
    }

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion

    -- Basic set for if no TP weapon is defined.
    sets.engaged = {
        main = "Maxentius",
        sub = "Ammurapi Shield",
        ammo = "Amar Cluster",
        head = "Aya. Zucchetto +2",
        neck = "Bathy Choker +1",
        ear1 = "Cessance Earring",
        ear2 = "Telos Earring",
        body = "Ayanmo Corazza +2",
        hands = "Bunzi's Gloves",
        ring1 = "Petrov Ring",
        Ring2 = "Chirich Ring",
        back = "Alaunus's Cape",
        waist = "Windbuffet Belt +1",
        legs = "Aya. Cosciales +2",
        feet = "Aya. Gambieras +2"
    }

    sets.engaged.Acc = {
        ammo = "Hasty Pinion +1",
        head = "Nyame Helm",
        neck = "Combatant's Torque",
        ear1 = "Telos Earring",
        ear2 = "Brutal Earring",
        body = "Nyame Mail",
        hands = "Nyame Gauntlets",
        ring1 = "Petrov Ring",
        Ring2 = "Chirich Ring",
        back = "Alaunus's Cape",
        waist = "Olseni Belt",
        legs = "Nyame Flanchard",
        feet = "Nyame Sollerets"
    }

    sets.engaged.DW = {
        ammo = "Amar Cluster",
        head = "Nyame Helm",
        neck = "Asperity Necklace",
        ear1 = "Telos Earring",
        ear2 = "Suppanomimi",
        body = "Nyame Mail",
        hands = "Nyame Gauntlets",
        ring1 = "Petrov Ring",
        Ring2 = "Chirich Ring",
        back = "Alaunus's Cape",
        waist = "Shetal Stone",
        legs = "Nyame Flanchard",
        feet = "Battlecast Gaiters"
    }

    sets.engaged.DW.Acc = {
        ammo = "Hasty Pinion +1",
        head = "Nyame Helm",
        neck = "Combatant's Torque",
        ear1 = "Telos Earring",
        ear2 = "Suppanomimi",
        body = "Nyame Mail",
        hands = "Nyame Gauntlets",
        ring1 = "Petrov Ring",
        Ring2 = "Chirich Ring",
        back = "Kayapa Cape",
        waist = "Shetal Stone",
        legs = "Nyame Flanchard",
        feet = "Nyame Sollerets"
    }

    -- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    sets.buff['Divine Caress'] = {
        hands = "Ebers Mitts +2",
        back = "Mending Cape"
    }

    sets.HPDown = {
        head = "Pixie Hairpin +1",
        ear1 = "Mendicant's Earring",
        ear2 = "Evans Earring",
        body = "Zendik Robe",
        hands = "Hieros Mittens",
        ring1 = "Mephitas's Ring +1",
        ring2 = "Mephitas's Ring",
        back = "Swith Cape +1",
        waist = "Flax Sash",
        legs = "Shedir Seraweels",
        feet = ""
    }

    sets.HPCure = {
        main = "Queller Rod",
        sub = "Ammurapi Shield",
        ammo = "Pemphredo Tathlum",
        head = "Blistering Sallet +1",
        neck = "Nodens Gorget",
        ear1 = "Etiolation Earring",
        ear2 = "Ethereal Earring",
        body = "Kaykaus Bliaut",
        hands = "Kaykaus Cuffs",
        ring1 = "Kunaji Ring",
        ring2 = "Meridian Ring",
        back = "Alaunus's Cape",
        waist = "Eschan Stone",
        legs = "Ebers Pant. +2",
        feet = gear.vanya_cure_feet
    }

    sets.buff.Doom = set_combine(sets.buff.Doom, {})
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    set_macro_page(1, 3)
end

function user_job_lockstyle()
    windower.chat.input('/lockstyleset 009')
end
