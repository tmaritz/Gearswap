-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_job_setup()
    state.OffenseMode:options('Normal')
    state.CastingMode:options('Normal', 'Resistant', 'Proc', 'OccultAcumen', '9k')
    state.IdleMode:options('Normal', 'PDT')
    state.HybridMode:options('Normal', 'PDT')
    state.Weapons:options('None', 'DayMax', 'Mpaca')

    gear.obi_cure_back = "Tempered Cape +1"
    gear.obi_cure_waist = "Witful Belt"

    gear.obi_low_nuke_waist = "Refoccilation Stone"
    gear.obi_high_nuke_waist = "Refoccilation Stone"

    -- Additional local binds
    send_command('bind ^\' gs c cycle MagicBurstMode')
    send_command('bind !\' gs c cycle ElementalMode')
    send_command('bind @\' gs c elemental weather')

    send_command('bind @f10 gs c cycle RecoverMode')
    send_command('bind @f8 gs c toggle AutoSubMode') -- Automatically uses sublimation and Myrkr.

    send_command('bind ^= gs c scholar light')
    send_command('bind != gs c scholar dark')

    send_command('bind ^\\\\ input /ma "Protect V" <stal>')
    send_command('bind !\\\\ input /ma "Shell V" <stal>')
    send_command('bind @\\\\ input /ma "Reraise III" <me>')

    send_command('bind @1 gs c scholar cost')
    send_command('bind @2 gs c scholar speed')
    send_command('bind @3 gs c scholar aoe')
    send_command('bind @4 gs c scholar power')
    send_command('bind @5 gs c scholar duration')
    send_command('bind @6 gs c scholar accuracy')
    send_command('bind @7 gs c scholar enmity')
    send_command('bind @0 gs c scholar skillchain')

    select_default_macro_book()
    user_job_lockstyle()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------

    -- Precast Sets

    -- Precast sets to enhance JAs

    sets.precast.JA['Tabula Rasa'] = {
        legs = "Peda. Pants +1"
    }
    sets.precast.JA['Enlightenment'] = {} -- body="Peda. Gown +1"

    -- Fast cast sets for spells

    sets.precast.FC = {
        main = "Mpaca's Staff",
        sub = "Clerisy Strap",
        ammo = "Impatiens",
        head = "Amalric Coif +1",
        neck = "Voltsurge Torque",
        ear1 = "Enchntr. Earring +1",
        ear2 = "Malignance Earring",
        body = "Zendik Robe",
        hands = "Acad. Bracers +2",
        ring1 = "Kishar Ring",
        ring2 = "Lebeche Ring",
        back = "Perimede Cape",
        waist = "Witful Belt",
        legs = "Psycloth Lappas",
        feet = "Regal Pumps +1"
    }

    sets.precast.FC.Arts = {}

    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {
        waist = "Siegel Sash"
    })

    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {
        ear1 = "Malignance Earring"
    })

    sets.precast.FC.Cure = set_combine(sets.precast.FC, {
        main = "Serenity",
        sub = "Clerisy Strap",
        body = "Heka's Kalasiris"
    })

    sets.precast.FC.Curaga = sets.precast.FC.Cure

    sets.precast.FC.Impact = set_combine(sets.precast.FC['Elemental Magic'], {
        head = empty,
        body = "Twilight Cloak"
    })
    sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {
        main = "Daybreak",
        sub = "Genbu\'s Shield"
    })

    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS['Myrkr'] = {
        ammo = "Staunch Tathlum",
        head = "Pixie Hairpin +1",
        neck = "Sanctity Necklace",
        ear1 = "Evans Earring",
        ear2 = "Etiolation Earring",
        body = "Amalric Doublet",
        hands = "Regal Cuffs",
        ring1 = "Mephitas's Ring +1",
        ring2 = "Mephitas's Ring",
        back = "Aurist's Cape +1",
        waist = "Yamabuki-no-Obi",
        legs = "Psycloth Lappas",
        feet = "Medium's Sabots"
    }

    -- Midcast Sets

    sets.TreasureHunter = set_combine(sets.TreasureHunter, {
        feet = gear.chironic_treasure_feet
    })

    -- Gear that converts elemental damage done to recover MP.	
    sets.RecoverMP = {
        body = "Seidr Cotehardie"
    }

    -- Gear for Magic Burst mode.
    sets.HelixBurst = {
        main = "Marin Staff +1",
        sub = "Enki Strap",
        ammo = "Ghastly Tathlum +1",
        head = "Agwu\'s Cap",
        neck = "Sybil Scarf",
        ear1 = "Bakarole Earring",
        ear2 = "Malignance Earring",
        body = "Agwu\'s Robe",
        hands = "Agwu\'s Gages",
        ring1 = "Mujin Band",
        ring2 = "Metamor. Ring +1",
        back = "Lugh\'s Cape",
        waist = "Refoccilation Stone",
        legs = "Agwu\'s Slops",
        feet = "Agwu\'s Pigaches"
    }

    sets.MagicBurst = {
        main = "Marin Staff +1",
        sub = "Enki Strap",
        ammo = "Ghastly Tathlum +1",
        head = "Agwu\'s Cap",
        neck = "Sybil Scarf",
        ear1 = "Bakarole Earring",
        ear2 = "Malignance Earring",
        body = "Agwu\'s Robe",
        hands = "Agwu\'s Gages",
        ring1 = "Mujin Band",
        ring2 = "Metamor. Ring +1",
        back = "Lugh\'s Cape",
        waist = "Refoccilation Stone",
        legs = "Agwu\'s Slops",
        feet = "Agwu\'s Pigaches"
    }

    -- Gear for specific elemental nukes.
    sets.element.Dark = {
        head = "Pixie Hairpin +1",
        ring2 = "Archon Ring"
    }

    sets.midcast.FastRecast = {
        main = gear.grioavolr_fc_staff,
        sub = "Clerisy Strap",
        ammo = "Hasty Pinion +1",
        head = "Amalric Coif +1",
        neck = "Voltsurge Torque",
        ear1 = "Enchntr. Earring +1",
        ear2 = "Malignance Earring",
        body = "Zendik Robe",
        hands = "Gende. Gages +1",
        ring1 = "Kishar Ring",
        ring2 = "Prolix Ring",
        back = "Swith Cape +1",
        waist = "Witful Belt",
        legs = "Psycloth Lappas",
        feet = "Regal Pumps +1"
    }

    sets.midcast.Cure = {
        main = "Serenity",
        sub = "Curatio Grip",
        ammo = "Hasty Pinion +1",
        head = "Gende. Caubeen +1",
        neck = "Incanter's Torque",
        ear1 = "Meili Earring",
        ear2 = "Malignance Earring",
        body = "Kaykaus Bliaut",
        hands = "Kaykaus Cuffs",
        ring1 = "Janniston Ring",
        ring2 = "Lebeche Ring",
        back = "Tempered Cape +1",
        waist = "Luminary Sash",
        legs = "Chironic Hose",
        feet = "Kaykaus Boots"
    }

    sets.midcast.LightWeatherCure = {
        main = "Chatoyant Staff",
        sub = "Curatio Grip",
        ammo = "Hasty Pinion +1",
        head = "Gende. Caubeen +1",
        neck = "Incanter's Torque",
        ear1 = "Meili Earring",
        ear2 = "Malignance Earring",
        body = "Kaykaus Bliaut",
        hands = "Kaykaus Cuffs",
        ring1 = "Janniston Ring",
        ring2 = "Lebeche Ring",
        back = "Twilight Cape",
        waist = "Hachirin-no-Obi",
        legs = "Chironic Hose",
        feet = "Kaykaus Boots"
    }

    sets.midcast.LightDayCure = {
        main = "Serenity",
        sub = "Curatio Grip",
        ammo = "Hasty Pinion +1",
        head = "Gende. Caubeen +1",
        neck = "Incanter's Torque",
        ear1 = "Meili Earring",
        ear2 = "Malignance Earring",
        body = "Kaykaus Bliaut",
        hands = "Kaykaus Cuffs",
        ring1 = "Janniston Ring",
        ring2 = "Lebeche Ring",
        back = "Twilight Cape",
        waist = "Hachirin-no-Obi",
        legs = "Chironic Hose",
        feet = "Kaykaus Boots"
    }

    sets.midcast.Curaga = sets.midcast.Cure

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
        back = "Grapevine Cape",
        waist = "Gishdubar Sash",
        feet = "Inspirited Boots"
    }

    sets.midcast.Cursna = {
        main = gear.grioavolr_fc_staff,
        sub = "Clemency Grip",
        ammo = "Hasty Pinion +1",
        head = "Amalric Coif +1",
        neck = "Debilis Medallion",
        ear1 = "Meili Earring",
        ear2 = "Malignance Earring",
        body = "Zendik Robe",
        hands = "Hieros Mittens",
        ring1 = "Haoma's Ring",
        ring2 = "Menelaus's Ring",
        back = "Oretan. Cape +1",
        waist = "Witful Belt",
        legs = "Psycloth Lappas",
        feet = "Vanya Clogs"
    }

    sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {
        main = gear.grioavolr_fc_staff,
        sub = "Clemency Grip"
    })

    sets.midcast['Enhancing Magic'] = {
        main = "Bolelabunga",
        sub = "Ammurapi Shield",
        ammo = "Savant's Treatise",
        head = "Arbatel Bonnet +2",
        neck = "Incanter's Torque",
        ear1 = "Andoaa Earring",
        ear2 = "Gifted Earring",
        body = "Telchine Chas.",
        hands = "Telchine Gloves",
        ring1 = "Stikini Ring",
        ring2 = "Stikini Ring",
        back = "Fi Follet Cape",
        waist = "Embla Sash",
        legs = "Telchine Braconi",
        feet = "Telchine Pigaches"
    }

    sets.midcast.Regen = {
        main = "Bolelabunga",
        sub = "Ammurapi Shield",
        ammo = "Savant's Treatise",
        head = "Arbatel Bonnet +2",
        neck = "Incanter's Torque",
        ear1 = "Andoaa Earring",
        ear2 = "Gifted Earring",
        body = "Telchine Chas.",
        hands = "Telchine Gloves",
        ring1 = "Stikini Ring",
        ring2 = "Stikini Ring",
        back = "Fi Follet Cape",
        waist = "Embla Sash",
        legs = "Telchine Braconi",
        feet = "Telchine Pigaches"
    }

    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {
        neck = "Nodens Gorget",
        ear2 = "Earthcry Earring",
        waist = "Siegel Sash",
        legs = "Shedir Seraweels"
    })

    sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {
        head = "Amalric Coif +1"
    })

    sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {
        main = "Vadose Rod",
        sub = "Genbu\'s Shield",
        head = "Amalric Coif +1",
        hands = "Regal Cuffs",
        waist = "Emphatikos Rope",
        legs = "Shedir Seraweels"
    })

    sets.midcast.BarElement = {
        main = "Bolelabunga",
        sub = "Ammurapi Shield",
        "Savant's Treatise",
        head = "Arbatel Bonnet +2",
        neck = "Incanter's Torque",
        ear1 = "Andoaa Earring",
        ear2 = "Gifted Earring",
        body = "Telchine Chas.",
        hands = "Telchine Gloves",
        ring1 = "Stikini Ring",
        ring2 = "Stikini Ring",
        back = "Fi Follet Cape",
        waist = "Embla Sash",
        legs = "Telchine Braconi",
        feet = "Telchine Pigaches"
    }

    sets.midcast.Storm = set_combine(sets.midcast['Enhancing Magic'], {
        feet = "Peda. Loafers +1"
    })

    sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {
        ring2 = "Sheltered Ring"
    })
    sets.midcast.Protectra = sets.midcast.Protect

    sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {
        ring2 = "Sheltered Ring"
    })
    sets.midcast.Shellra = sets.midcast.Shell

    -- Custom spell classes

    sets.midcast['Enfeebling Magic'] = {
        main = "Daybreak",
        sub = "Ammurapi Shield",
        ammo = "Pemphredo Tathlum",
        head = "Acad. Mortar. +2",
        neck = "Erra Pendant",
        ear1 = "Regal Earring",
        ear2 = "Malignance Earring",
        body = "Chironic Doublet",
        hands = "Regal Cuffs",
        ring1 = "Kishar Ring",
        ring2 = "Stikini Ring",
        back = "Lugh\'s Cape",
        waist = "Luminary Sash",
        legs = "Chironic Hose",
        feet = "Uk'uxkaj Boots"
    }

    sets.midcast['Enfeebling Magic'].Resistant = {
        main = "Daybreak",
        sub = "Ammurapi Shield",
        ammo = "Pemphredo Tathlum",
        head = "Acad. Mortar. +2",
        neck = "Erra Pendant",
        ear1 = "Regal Earring",
        ear2 = "Digni. Earring",
        body = "Chironic Doublet",
        hands = "Acad. Bracers +2",
        ring1 = "Metamor. Ring +1",
        ring2 = "Stikini Ring",
        back = "Lugh\'s Cape",
        waist = "Luminary Sash",
        legs = "Chironic Hose",
        feet = "Medium's Sabots"
    }

    sets.midcast.ElementalEnfeeble = set_combine(sets.midcast['Enfeebling Magic'], {
        head = "Amalric Coif +1",
        ear2 = "Malignance Earring",
        back = "Lugh\'s Cape",
        waist = "Acuity Belt +1"
    })
    sets.midcast.ElementalEnfeeble.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {
        head = "Amalric Coif +1",
        back = "Lugh\'s Cape",
        waist = "Acuity Belt +1"
    })

    sets.midcast.IntEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {
        head = "Amalric Coif +1",
        ear1 = "Malignance Earring",
        back = "Lugh\'s Cape",
        waist = "Acuity Belt +1"
    })
    sets.midcast.IntEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {
        head = "Amalric Coif +1",
        back = "Lugh\'s Cape",
        waist = "Acuity Belt +1"
    })

    sets.midcast.MndEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {})
    sets.midcast.MndEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})

    sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
    sets.midcast.Diaga = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
    sets.midcast['Dia II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
    sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
    sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)

    sets.midcast['Divine Magic'] = set_combine(sets.midcast['Enfeebling Magic'], {
        ring2 = "Stikini Ring",
        feet = gear.chironic_nuke_feet
    })

    sets.midcast['Dark Magic'] = {
        main = "Rubicundity",
        sub = "Ammurapi Shield",
        ammo = "Pemphredo Tathlum",
        head = "Amalric Coif +1",
        neck = "Incanter's Torque",
        ear1 = "Regal Earring",
        ear2 = "Malignance Earring",
        body = "Chironic Doublet",
        hands = "Acad. Bracers +2",
        ring1 = "Stikini Ring",
        ring2 = "Stikini Ring",
        back = "Lugh\'s Cape",
        waist = "Acuity Belt +1",
        legs = "Chironic Hose",
        feet = gear.merlinic_aspir_feet
    }

    sets.midcast.Kaustra = {
        main = "Akademos",
        sub = "Enki Strap",
        ammo = "Pemphredo Tathlum",
        head = "Pixie Hairpin +1",
        neck = "Saevus Pendant +1",
        ear1 = "Crematio Earring",
        ear2 = "Malignance Earring",
        body = gear.merlinic_nuke_body,
        hands = "Amalric Gages",
        ring1 = "Freke Ring",
        ring2 = "Archon Ring",
        back = "Lugh\'s Cape",
        waist = "Refoccilation Stone",
        legs = "Merlinic Shalwar",
        feet = gear.merlinic_nuke_feet
    }

    sets.midcast.Kaustra.Resistant = {
        main = gear.grioavolr_nuke_staff,
        sub = "Enki Strap",
        ammo = "Pemphredo Tathlum",
        head = gear.merlinic_nuke_head,
        neck = "Erra Pendant",
        ear1 = "Crematio Earring",
        ear2 = "Malignance Earring",
        body = gear.merlinic_nuke_body,
        hands = "Amalric Gages",
        ring1 = "Metamor. Ring +1",
        ring2 = "Freke Ring",
        back = "Lugh\'s Cape",
        waist = "Acuity Belt +1",
        legs = "Merlinic Shalwar",
        feet = gear.merlinic_nuke_feet
    }

    sets.midcast.Drain = {
        main = "Marin Staff +1",
        sub = "Enki Strap",
        ammo = "Staunch Tathlum +1",
        head = "Pixie Hairpin +1",
        neck = "Erra Pendant",
        ear1 = "Hirudinea Earring",
        ear2 = "Malignance Earring",
        body = "Agwu\'s Robe",
        hands = "Agwu\'s Gages",
        ring1 = "Stikini Ring",
        ring2 = "Stikini Ring",
        back = "Merciful Cape",
        waist = "Fucho-no-obi",
        legs = "Agwu\'s Slops",
        feet = "Agwu\'s Pigaches"
    }

    sets.midcast.Drain.Resistant = {
        main = "Marin Staff +1",
        sub = "Enki Strap",
        ammo = "Staunch Tathlum +1",
        head = "Pixie Hairpin +1",
        neck = "Erra Pendant",
        ear1 = "Hirudinea Earring",
        ear2 = "Malignance Earring",
        body = "Agwu\'s Robe",
        hands = "Agwu\'s Gages",
        ring1 = "Stikini Ring",
        ring2 = "Stikini Ring",
        back = "Merciful Cape",
        waist = "Fucho-no-obi",
        legs = "Agwu\'s Slops",
        feet = "Agwu\'s Pigaches"
    }

    sets.midcast.Aspir = sets.midcast.Drain
    sets.midcast.Aspir.Resistant = sets.midcast.Drain.Resistant

    sets.midcast.Stun = {
        main = "Mpaca's Staff",
        sub = "Clerisy Strap",
        ammo = "Hasty Pinion +1",
        head = "Amalric Coif +1",
        neck = "Voltsurge Torque",
        ear1 = "Enchntr. Earring +1",
        ear2 = "Malignance Earring",
        body = "Zendik Robe",
        hands = "Acad. Bracers +2",
        ring1 = "Metamor. Ring +1",
        ring2 = "Stikini Ring",
        back = "Lugh\'s Cape",
        waist = "Witful Belt",
        legs = "Psycloth Lappas",
        feet = "Regal Pumps +1"
    }

    sets.midcast.Stun.Resistant = {
        main = "Daybreak",
        sub = "Ammurapi Shield",
        ammo = "Pemphredo Tathlum",
        head = "Acad. Mortar. +2",
        neck = "Erra Pendant",
        ear1 = "Regal Earring",
        ear2 = "Malignance Earring",
        body = "Zendik Robe",
        hands = "Acad. Bracers +2",
        ring1 = "Metamor. Ring +1",
        ring2 = "Stikini Ring",
        back = "Lugh\'s Cape",
        waist = "Acuity Belt +1",
        legs = "Chironic Hose",
        feet = gear.merlinic_aspir_feet
    }

    -- Elemental Magic sets are default for handling low-tier nukes.
    sets.midcast['Elemental Magic'] = {
        main = "Marin Staff +1",
        sub = "Enki Strap",
        ammo = "Ghastly Tathlum +1",
        head = "Agwu\'s Cap",
        neck = "Sybil Scarf",
        ear1 = "Bakarole Earring",
        ear2 = "Malignance Earring",
        body = "Agwu\'s Robe",
        hands = "Agwu\'s Gages",
        ring1 = "Metamor. Ring +1",
        ring2 = "Metamor. Ring +1",
        back = "Lugh\'s Cape",
        waist = "Refoccilation Stone",
        legs = "Agwu\'s Slops",
        feet = "Agwu\'s Pigaches"
    }

    sets.midcast['Elemental Magic'].Resistant = {
        main = "Marin Staff +1",
        sub = "Enki Strap",
        ammo = "Ghastly Tathlum +1",
        head = "Agwu\'s Cap",
        neck = "Sybil Scarf",
        ear1 = "Bakarole Earring",
        ear2 = "Malignance Earring",
        body = "Agwu\'s Robe",
        hands = "Agwu\'s Gages",
        ring1 = "Metamor. Ring +1",
        ring2 = "Metamor. Ring +1",
        back = "Lugh\'s Cape",
        waist = "Refoccilation Stone",
        legs = "Agwu\'s Slops",
        feet = "Agwu\'s Pigaches"
    }

    sets.midcast['Elemental Magic'].Fodder = {
        main = "Marin Staff +1",
        sub = "Enki Strap",
        ammo = "Ghastly Tathlum +1",
        head = "Agwu\'s Cap",
        neck = "Sybil Scarf",
        ear1 = "Bakarole Earring",
        ear2 = "Malignance Earring",
        body = "Agwu\'s Robe",
        hands = "Agwu\'s Gages",
        ring1 = "Metamor. Ring +1",
        ring2 = "Metamor. Ring +1",
        back = "Lugh\'s Cape",
        waist = "Refoccilation Stone",
        legs = "Agwu\'s Slops",
        feet = "Agwu\'s Pigaches"
    }

    sets.midcast['Elemental Magic']['9k'] = {
        main = "Marin Staff +1",
        sub = "Enki Strap",
        ammo = "Ghastly Tathlum +1",
        head = "Agwu\'s Cap",
        neck = "Sybil Scarf",
        ear1 = "Bakarole Earring",
        ear2 = "Malignance Earring",
        body = "Agwu\'s Robe",
        hands = "Agwu\'s Gages",
        ring1 = "Metamor. Ring +1",
        ring2 = "Metamor. Ring +1",
        back = "Lugh\'s Cape",
        waist = "Refoccilation Stone",
        legs = "Agwu\'s Slops",
        feet = "Agwu\'s Pigaches"
    }

    sets.midcast['Elemental Magic'].Proc = {
        main = "Marin Staff +1",
        sub = "Enki Strap",
        ammo = "Ghastly Tathlum +1",
        head = "Agwu\'s Cap",
        neck = "Sybil Scarf",
        ear1 = "Bakarole Earring",
        ear2 = "Malignance Earring",
        body = "Agwu\'s Robe",
        hands = "Agwu\'s Gages",
        ring1 = "Metamor. Ring +1",
        ring2 = "Metamor. Ring +1",
        back = "Lugh\'s Cape",
        waist = "Refoccilation Stone",
        legs = "Agwu\'s Slops",
        feet = "Agwu\'s Pigaches"
    }

    sets.midcast['Elemental Magic'].OccultAcumen = {
        main = "Marin Staff +1",
        sub = "Enki Strap",
        ammo = "Ghastly Tathlum +1",
        head = "Agwu\'s Cap",
        neck = "Sybil Scarf",
        ear1 = "Bakarole Earring",
        ear2 = "Malignance Earring",
        body = "Agwu\'s Robe",
        hands = "Agwu\'s Gages",
        ring1 = "Metamor. Ring +1",
        ring2 = "Metamor. Ring +1",
        back = "Lugh\'s Cape",
        waist = "Refoccilation Stone",
        legs = "Agwu\'s Slops",
        feet = "Agwu\'s Pigaches"
    }

    -- Custom refinements for certain nuke tiers
    sets.midcast['Elemental Magic'].HighTierNuke = set_combine(sets.midcast['Elemental Magic'], {
        ammo = "Pemphredo Tathlum",
        ear1 = "Regal Earring",
        ear2 = "Malignance Earring",
        hands = "Amalric Gages",
        ring1 = "Metamor. Ring +1"
    })
    sets.midcast['Elemental Magic'].HighTierNuke.Resistant =
        set_combine(sets.midcast['Elemental Magic'].Resistant, {
            ammo = "Pemphredo Tathlum",
            ear1 = "Regal Earring",
            ear2 = "Malignance Earring",
            hands = "Amalric Gages",
            ring1 = "Metamor. Ring +1"
        })
    sets.midcast['Elemental Magic'].HighTierNuke.Fodder = set_combine(sets.midcast['Elemental Magic'].Fodder, {
        ammo = "Pemphredo Tathlum",
        ear1 = "Regal Earring",
        ear2 = "Malignance Earring",
        hands = "Amalric Gages",
        ring1 = "Metamor. Ring +1"
    })

    sets.midcast.Helix = {
        main = "Marin Staff +1",
        sub = "Enki Strap",
        ammo = "Ghastly Tathlum +1",
        head = "Agwu\'s Cap",
        neck = "Sybil Scarf",
        ear1 = "Bakarole Earring",
        ear2 = "Malignance Earring",
        body = "Agwu\'s Robe",
        hands = "Agwu\'s Gages",
        ring1 = "Metamor. Ring +1",
        ring2 = "Metamor. Ring +1",
        back = "Lugh\'s Cape",
        waist = "Refoccilation Stone",
        legs = "Agwu\'s Slops",
        feet = "Agwu\'s Pigaches"
    }

    sets.midcast.Helix.Resistant = {
        main = "Marin Staff +1",
        sub = "Enki Strap",
        ammo = "Ghastly Tathlum +1",
        head = "Agwu\'s Cap",
        neck = "Sybil Scarf",
        ear1 = "Bakarole Earring",
        ear2 = "Malignance Earring",
        body = "Agwu\'s Robe",
        hands = "Agwu\'s Gages",
        ring1 = "Metamor. Ring +1",
        ring2 = "Metamor. Ring +1",
        back = "Lugh\'s Cape",
        waist = "Refoccilation Stone",
        legs = "Agwu\'s Slops",
        feet = "Agwu\'s Pigaches"
    }

    sets.midcast.Helix.Proc = {
        main = "Marin Staff +1",
        sub = "Enki Strap",
        ammo = "Ghastly Tathlum +1",
        head = "Agwu\'s Cap",
        neck = "Sybil Scarf",
        ear1 = "Bakarole Earring",
        ear2 = "Malignance Earring",
        body = "Agwu\'s Robe",
        hands = "Agwu\'s Gages",
        ring1 = "Metamor. Ring +1",
        ring2 = "Metamor. Ring +1",
        back = "Lugh\'s Cape",
        waist = "Refoccilation Stone",
        legs = "Agwu\'s Slops",
        feet = "Agwu\'s Pigaches"
    }

    sets.midcast.Impact = {
        main = "Daybreak",
        sub = "Ammurapi Shield",
        ammo = "Pemphredo Tathlum",
        head = empty,
        neck = "Erra Pendant",
        ear1 = "Regal Earring",
        ear2 = "Malignance Earring",
        body = "Twilight Cloak",
        hands = "Acad. Bracers +2",
        ring1 = "Metamor. Ring +1",
        ring2 = "Stikini Ring",
        back = "Lugh\'s Cape",
        waist = "Acuity Belt +1",
        legs = "Merlinic Shalwar",
        feet = gear.merlinic_nuke_feet
    }

    sets.midcast.Impact.OccultAcumen = set_combine(sets.midcast['Elemental Magic'].OccultAcumen, {
        head = empty,
        body = "Twilight Cloak"
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
        body = "Amalric Doublet",
        hands = gear.merlinic_refresh_hands,
        ring1 = "Defending Ring",
        ring2 = "Dark Ring",
        back = "Moonbeam Cape",
        waist = "Fucho-no-obi",
        legs = "Assid. Pants +1",
        feet = gear.chironic_refresh_feet
    }

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)

    sets.idle = {
        main = "Mpaca's Staff",
        sub = "Khonsu",
        ammo = "Homiliary",
        head = "Arbatel Bonnet +2",
        neck = "Warder's Charm +1",
        ear1 = "Eabani Earring",
        ear2 = "Hearty Earring",
        body = "Agwu\'s Robe",
        hands = "Nyame Gauntlets",
        ring1 = "Defending Ring",
        ring2 = "Shadow Ring",
        back = "Moonbeam Cape",
        waist = "Carrier's Sash",
        legs = "Nyame Flanchard",
        feet = "Nyame Sollerets"
    }

    sets.idle.PDT = {
        main = "Mpaca's Staff",
        sub = "Khonsu",
        ammo = "Homiliary",
        head = "Arbatel Bonnet +2",
        neck = "Warder's Charm +1",
        ear1 = "Eabani Earring",
        ear2 = "Hearty Earring",
        body = "Agwu\'s Robe",
        hands = "Nyame Gauntlets",
        ring1 = "Defending Ring",
        ring2 = "Shadow Ring",
        back = "Moonbeam Cape",
        waist = "Carrier's Sash",
        legs = "Nyame Flanchard",
        feet = "Nyame Sollerets"
    }

    sets.idle.Hippo = set_combine(sets.idle.PDT, {
        feet = "Hippo. Socks +1"
    })

    sets.idle.Weak = {
        main = "Malignance Pole",
        sub = "Khonsu",
        ammo = "Homiliary",
        head = "Nyame Helm",
        neck = "Warder's Charm +1",
        ear1 = "Lugalbanda Earring",
        ear2 = "Hearty Earring",
        body = "Agwu\'s Robe",
        hands = "Nyame Gauntlets",
        ring1 = "Defending Ring",
        ring2 = "Shadow Ring",
        back = "Moonbeam Cape",
        waist = "Embla Sash",
        legs = "Nyame Flanchard",
        feet = "Nyame Sollerets"
    }

    -- Defense sets

    sets.defense.PDT = sets.idle.PDT

    sets.defense.MDT = {
        main = "Malignance Pole",
        sub = "Khonsu",
        ammo = "Staunch Tathlum +1",
        head = "Nyame Helm",
        neck = "Warder's Charm +1",
        ear1 = "Lugalbanda Earring",
        ear2 = "Hearty Earring",
        body = "Nyame Mail",
        hands = "Nyame Gauntlets",
        ring1 = "Defending Ring",
        ring2 = "Shadow Ring",
        back = "Moonbeam Cape",
        waist = "Slipor Sash",
        legs = "Nyame Flanchard",
        feet = "Nyame Sollerets"
    }

    sets.defense.MEVA = sets.defense.MDT

    sets.Kiting = {
        feet = "Herald's Gaiters"
    }
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
    sets.NightIdle = {}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion

    -- Normal melee group
    sets.engaged = {
        ammo = "Amar Cluster",
        head = "Nyame Helm",
        neck = "Loricate Torque +1",
        ear1 = "Cessance Earring",
        ear2 = "Telos Earring",
        body = "Nyame Mail",
        hands = "Gazu Bracelets +1",
        ring1 = "Defending Ring",
        ring2 = "Chirich Ring +1",
        back = "Moonbeam Cape",
        waist = "Grunfeld Rope",
        legs = "Nyame Flanchard",
        feet = "Nyame Sollerets"
    }

    sets.engaged.PDT = sets.idle

    -- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    sets.buff['Ebullience'] = {
        head = "Arbatel Bonnet +2"
    }
    sets.buff['Rapture'] = {
        head = "Arbatel Bonnet +2"
    }
    sets.buff['Perpetuance'] = {
        hands = "Arbatel Bracers +1"
    }
    sets.buff['Immanence'] = {
        hands = "Arbatel Bracers +1"
    }
    sets.buff['Penury'] = {
        legs = "Arbatel Pants +1"
    }
    sets.buff['Parsimony'] = {
        legs = "Arbatel Pants +1"
    }
    sets.buff['Celerity'] = {
        feet = "Peda. Loafers +1"
    }
    sets.buff['Alacrity'] = {
        feet = "Peda. Loafers +1"
    }
    sets.buff['Klimaform'] = {
        feet = "Arbatel Loafers +1"
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
        main = "Daybreak",
        sub = "Sors Shield",
        range = empty,
        ammo = "Hasty Pinion +1",
        head = "Gende. Caubeen +1",
        neck = "Unmoving Collar +1",
        ear1 = "Gifted Earring",
        ear2 = "Mendi. Earring",
        body = "Kaykaus Bliaut",
        hands = "Kaykaus Cuffs",
        ring1 = "Gelatinous Ring +1",
        ring2 = "Meridian Ring",
        back = "Solemnity Cape",
        waist = "Luminary Sash",
        legs = "Carmine Cuisses +1",
        feet = "Kaykaus Boots"
    }

    sets.buff.Doom = set_combine(sets.buff.Doom, {})
    sets.buff['Light Arts'] = {} -- legs="Academic's Pants +3"
    sets.buff['Dark Arts'] = {}  -- body="Academic's Gown +3"

    sets.buff.Sublimation = {
        head = "Acad. Mortar. +2",
        waist = "Embla Sash"
    }
    sets.buff.DTSublimation = {
        waist = "Embla Sash"
    }

    -- Weapons sets
    sets.weapons.DayMax = {
        main = "Maxentius",
        sub = "Daybreak"
    }
    sets.weapons.Mpaca = {
        main = "Mpaca's Staff",
        sub = "Khonsu"
    }
end

function user_job_lockstyle()
    windower.chat.input('/lockstyleset 012')
end

-- Select default macro book on initial load or subjob change.
-- Default macro set/book
function select_default_macro_book()
    if player.sub_job == 'RDM' then
        set_macro_page(1, 20)
    elseif player.sub_job == 'BLM' then
        set_macro_page(1, 20)
    elseif player.sub_job == 'WHM' then
        set_macro_page(1, 20)
    else
        set_macro_page(1, 20)
    end
end
