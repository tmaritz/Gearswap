function user_job_setup()
    -- Options: Override default values
    state.CastingMode:options('Normal', 'OccultAcumen')
    state.OffenseMode:options('Normal')
    state.IdleMode:options('Normal', 'DT')
    state.Weapons:options('None', 'Mpaca')

    gear.obi_cure_waist = "Witful Belt"
    gear.obi_low_nuke_waist = "Sekhmet Corset"
    gear.obi_high_nuke_waist = "Refoccilation Stone"

    gear.idlefc_jse_back = {
        name = "Taranus's Cape",
        augments = { 'MP+60', 'Mag. Acc+20 /Mag. Dmg.+20', 'MP+20', '"Fast Cast"+10', 'Damage taken-5%', }
    }
    gear.nuke_jse_back = {
        name = "Taranus's Cape",
        augments = { 'INT+20', 'Mag. Acc+20 /Mag. Dmg.+20', 'INT+10', '"Mag.Atk.Bns."+10' }
    }
    gear.stp_jse_back = {
        name = "Taranus's Cape",
        augments = { 'DEX+20', 'Accuracy+20 Attack+20', '"Store TP"+10' }
    }

    -- Additional local binds
    send_command('bind ^\' gs c cycle MagicBurstMode')
    send_command('bind !\' gs c cycle ElementalMode')
    send_command('bind @\' gs c elemental weather')

    select_default_macro_book()
    user_job_lockstyle()
end

function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------

    -- Weapons sets
    sets.weapons.Mpaca = {
        main = "Mpaca's Staff",
        sub = "Enki Strap"
    }

    sets.buff.Sublimation = {
        waist = "Embla Sash"
    }
    sets.buff.DTSublimation = {
        waist = "Embla Sash"
    }

    -- Treasure Hunter

    sets.TreasureHunter = set_combine(sets.TreasureHunter, {
        feet = gear.merlinic_treasure_feet
    })

    ---- Precast Sets ----

    -- Precast sets to enhance JAs
    sets.precast.JA['Mana Wall'] = {
        back = gear.nuke_jse_back,
        feet = "Wicce Sabots +2"
    }

    sets.precast.JA.Manafont = {
        body = "Sorcerer's Coat"
    }

    -- equip to maximize HP (for Tarus) and minimize MP loss before using convert
    sets.precast.JA.Convert = {}

    -- Fast cast sets for spells

    sets.precast.FC = {
        ammo = "Impatiens",
        head = gear.merlinic_fc_head,
        body = "Agwu's Robe",
        hands = "Agwu's Gages",
        legs = "Agwu's Slops",
        feet = "Regal Pumps +1",
        neck = "Voltsurge Torque",
        waist = "Witful Belt",
        left_ear = "Malignance Earring",
        right_ear = "Loquac. Earring",
        left_ring = "Medada's Ring",
        right_ring = "Lebeche Ring",
        back = gear.idlefc_jse_back,
    }

    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {
        waist = "Siegel Sash"
    })

    sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {})

    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {
        ammo = "Staunch Tathlum",
        ear1 = "Malignance Earring",
        ring2 = "Prolix Ring",
        back = "Swith Cape +1",
        waist = "Siegel Sash"
    })

    sets.precast.FC.Cure = set_combine(sets.precast.FC, {
        main = "Serenity",
        sub = "Clerisy Strap",
        body = "Heka's Kalasiris"
    })

    sets.precast.FC.Curaga = sets.precast.FC.Cure

    sets.precast.FC.Impact = set_combine(sets.precast.FC, {
        head = empty,
        body = "Twilight Cloak"
    })
    sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {
        main = "Daybreak",
        sub = "Genbu\'s Shield"
    })

    sets.precast.FC.Death = {
        main = gear.grioavolr_nuke_staff,
        sub = "Enki Strap",
        ammo = "Impatiens",
        head = "Amalric Coif +1",
        neck = "Voltsurge Torque",
        ear1 = "Enchanter Earring +1",
        ear2 = "Loquac. Earring",
        body = gear.merlinic_nuke_body,
        hands = "Volte Gloves",
        ring1 = "Mephitas's Ring +1",
        ring2 = "Lebeche Ring",
        back = "Perimede Cape",
        waist = "Witful Belt",
        legs = "Psycloth Lappas",
        feet = "Regal Pumps +1"
    }

    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
        ammo = "Dosis Tathlum",
        head = "Hagondes Hat +1",
        neck = "Saevus Pendant +1",
        ear1 = "Friomisi Earring",
        ear2 = "Crematio Earring",
        body = "Jhakri Robe +2",
        hands = "Jhakri Cuffs",
        ring1 = "Freke Ring",
        ring2 = "Shiva Ring",
        back = gear.nuke_jse_back,
        waist = "Fotia Belt",
        legs = "Jhakri Slops +1",
        feet = "Jhakri Pigaches"
    }

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Vidohunir'] = {
        ammo = "Dosis Tathlum",
        head = "Hagondes Hat +1",
        neck = "Saevus Pendant +1",
        ear1 = "Friomisi Earring",
        ear2 = "Crematio Earring",
        body = "Zendik Robe",
        hands = "Hagondes Cuffs +1",
        ring1 = "Freke Ring",
        ring2 = "Shiva Ring",
        back = gear.nuke_jse_back,
        waist = "Fotia Belt",
        legs = "Hagondes Pants +1",
        feet = gear.merlinic_nuke_feet
    }

    sets.precast.WS['Myrkr'] = {
        ammo = "Staunch Tathlum",
        head = "Pixie Hairpin +1",
        neck = "Sanctity Necklace",
        ear1 = "Moonshade Earring",
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

    sets.MaxTPMyrkr = {
        ear1 = "Evans Earring",
        ear2 = "Etiolation Earring"
    }

    ---- Midcast Sets ----

    sets.midcast.FastRecast = {
        main = gear.grioavolr_fc_staff,
        sub = "Clerisy Strap",
        ammo = "Hasty Pinion +1",
        head = "Amalric Coif +1",
        neck = "Voltsurge Torque",
        ear1 = "Enchntr. Earring +1",
        ear2 = "Malignance Earring",
        body = "Zendik Robe",
        hands = "Volte Gloves",
        ring1 = "Kishar Ring",
        ring2 = "Prolix Ring",
        back = "Swith Cape +1",
        waist = "Witful Belt",
        legs = "Psycloth Lappas",
        feet = "Regal Pumps +1"
    }

    sets.midcast.Cure = {
        main = gear.gada_healing_club,
        sub = "Sors Shield",
        ammo = "Hasty Pinion +1",
        head = "Vanya Hood",
        neck = "Incanter's Torque",
        ear1 = "Gifted Earring",
        ear2 = "Etiolation Earring",
        body = "Zendik Robe",
        hands = "Telchine Gloves",
        ring1 = "Janniston Ring",
        ring2 = "Menelaus's Ring",
        back = "Tempered Cape +1",
        waist = "Witful Belt",
        legs = "Psycloth Lappas",
        feet = "Vanya Clogs"
    }

    sets.midcast.LightWeatherCure = {
        main = "Chatoyant Staff",
        sub = "Curatio Grip",
        ammo = "Hasty Pinion +1",
        head = "Vanya Hood",
        neck = "Phalaina Locket",
        ear1 = "Gifted Earring",
        ear2 = "Etiolation Earring",
        body = "Heka's Kalasiris",
        hands = "Telchine Gloves",
        ring1 = "Janniston Ring",
        ring2 = "Menelaus's Ring",
        back = "Twilight Cape",
        waist = "Hachirin-no-Obi",
        legs = "Psycloth Lappas",
        feet = "Vanya Clogs"
    }

    -- Cureset for if it's not light weather but is light day.
    sets.midcast.LightDayCure = {
        main = "Serenity",
        sub = "Curatio Grip",
        ammo = "Hasty Pinion +1",
        head = "Vanya Hood",
        neck = "Phalaina Locket",
        ear1 = "Gifted Earring",
        ear2 = "Etiolation Earring",
        body = "Zendik Robe",
        hands = "Telchine Gloves",
        ring1 = "Janniston Ring",
        ring2 = "Menelaus's Ring",
        back = "Twilight Cape",
        waist = "Hachirin-no-Obi",
        legs = "Psycloth Lappas",
        feet = "Vanya Clogs"
    }

    sets.midcast.Curaga = sets.midcast.Cure

    sets.midcast.Cursna = set_combine(sets.midcast.Cure, {
        neck = "Debilis Medallion",
        hands = "Hieros Mittens",
        ring1 = "Haoma's Ring",
        ring2 = "Menelaus's Ring",
        back = "Oretan. Cape +1"
    })

    sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {
        main = gear.grioavolr_fc_staff,
        sub = "Clemency Grip"
    })

    sets.midcast['Enhancing Magic'] = {
        main = gear.gada_enhancing_club,
        sub = "Ammurapi Shield",
        ammo = "Hasty Pinion +1",
        head = "Telchine Cap",
        neck = "Incanter's Torque",
        ear1 = "Andoaa Earring",
        ear2 = "Gifted Earring",
        body = "Telchine Chas.",
        hands = "Telchine Gloves",
        ring1 = "Stikini Ring",
        ring2 = "Stikini Ring",
        back = "Perimede Cape",
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

    sets.midcast.BarElement = set_combine(sets.precast.FC['Enhancing Magic'], {
        legs = "Shedir Seraweels"
    })

    sets.midcast['Enfeebling Magic'] = {
        main = "Daybreak",
        sub = "Ammurapi Shield",
        ammo = "Pemphredo Tathlum",
        head = "Jhakri Coronal +2",
        neck = "Src. Stole +1",
        ear1 = "Barkaro. Earring",
        ear2 = "Malignance Earring",
        body = "Wicce Coat +2",
        hands = "Amalric Gages",
        ring1 = "Medada's Ring",
        ring2 = "Metamor. Ring +1",
        back = gear.nuke_jse_back,
        waist = "Refoccilation Stone",
        legs = "Agwu's Slops",
        feet = "Wicce Sabots +2"
    }

    sets.midcast.ElementalEnfeeble = set_combine(sets.midcast['Enfeebling Magic'], {
        head = "Amalric Coif +1",
        waist = "Acuity Belt +1",
        legs = "Arch. Tonban +3",
        feet = "Arch. Sabots +3"
    })

    sets.midcast.IntEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {
        head = "Amalric Coif +1",
        ear1 = "Malignance Earring",
        waist = "Acuity Belt +1"
    })

    sets.midcast.MndEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {})

    sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
    sets.midcast['Dia II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)

    sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
    sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)

    sets.midcast['Divine Magic'] = set_combine(sets.midcast['Enfeebling Magic'], {})

    sets.midcast['Dark Magic'] = {
        main = "Rubicundity",
        sub = "Ammurapi Shield",
        ammo = "Pemphredo Tathlum",
        head = "Amalric Coif +1",
        neck = "Erra Pendant",
        ear1 = "Malignance Earring",
        ear2 = "Regal Earring",
        body = gear.merlinic_nuke_body,
        hands = "Amalric Gages",
        ring1 = "Stikini Ring",
        ring2 = "Metamor. Ring +1",
        back = gear.nuke_jse_back,
        waist = "Acuity Belt +1",
        legs = "Merlinic Shalwar",
        feet = gear.merlinic_aspir_feet
    }

    sets.midcast.Drain = {
        main = "Daybreak",
        sub = "Ammurapi Shield",
        ammo = "Plumose Sachet",
        head = "Pixie Hairpin +1",
        body = "Wicce Coat +2",
        hands = gear.merlinic_aspir_hands,
        legs = gear.merlinic_aspir_legs,
        feet = "Agwu\'s Pigaches",
        neck = "Erra Pendant",
        waist = "Fucho-no-Obi",
        left_ear = "Hirudinea Earring",
        right_ear = "Malignance Earring",
        left_ring = "Medada's Ring",
        right_ring = "Evanescence Ring",
        back = "Aurist's Cape +1",
    }

    sets.midcast.Aspir = sets.midcast.Drain

    sets.midcast.Aspir.Death = {
        main = gear.grioavolr_nuke_staff,
        sub = "Enki Strap",
        ammo = "Pemphredo Tathlum",
        head = "Pixie Hairpin +1",
        neck = "Erra Pendant",
        ear1 = "Malignance Earring",
        ear2 = "Regal Earring",
        body = gear.merlinic_nuke_body,
        hands = "Amalric Gages",
        ring1 = "Evanescence Ring",
        ring2 = "Archon Ring",
        back = gear.nuke_jse_back,
        waist = "Fucho-no-obi",
        legs = "Merlinic Shalwar",
        feet = gear.merlinic_aspir_feet
    }

    sets.midcast.Death = {
        main = gear.grioavolr_nuke_staff,
        sub = "Enki Strap",
        ammo = "Pemphredo Tathlum",
        head = "Pixie Hairpin +1",
        neck = "Mizu. Kubikazari",
        ear1 = "Malignance Earring",
        ear2 = "Etiolation Earring",
        body = gear.merlinic_nuke_body,
        hands = "Amalric Gages",
        ring1 = "Mujin Band",
        ring2 = "Archon Ring",
        back = gear.nuke_jse_back,
        waist = gear.ElementalObi,
        legs = "Merlinic Shalwar",
        feet = gear.merlinic_nuke_feet
    }

    sets.midcast.Stun = {
        main = gear.grioavolr_fc_staff,
        sub = "Clerisy Strap",
        ammo = "Hasty Pinion +1",
        head = "Amalric Coif +1",
        neck = "Voltsurge Torque",
        ear1 = "Enchntr. Earring +1",
        ear2 = "Malignance Earring",
        body = "Zendik Robe",
        hands = "Volte Gloves",
        ring1 = "Stikini Ring",
        ring2 = "Metamor. Ring +1",
        back = gear.nuke_jse_back,
        waist = "Witful Belt",
        legs = "Psycloth Lappas",
        feet = "Regal Pumps +1"
    }

    sets.midcast.BardSong = {
        main = "Daybreak",
        sub = "Ammurapi Shield",
        ammo = "Dosis Tathlum",
        head = "Amalric Coif +1",
        neck = "Sanctity Necklace",
        ear1 = "Digni. Earring",
        ear2 = "Regal Earring",
        body = "Zendik Robe",
        hands = "Regal Cuffs",
        ring1 = "Stikini Ring",
        ring2 = "Metamor. Ring +1",
        back = gear.nuke_jse_back,
        waist = "Luminary Sash",
        legs = "Merlinic Shalwar",
        feet = "Medium's Sabots"
    }

    sets.midcast.Impact = {
        main = "Daybreak",
        sub = "Ammurapi Shield",
        ammo = "Pemphredo Tathlum",
        head = empty,
        neck = "Erra Pendant",
        ear1 = "Malignance Earring",
        ear2 = "Regal Earring",
        body = "Twilight Cloak",
        hands = "Regal Cuffs",
        ring1 = "Stikini Ring",
        ring2 = "Metamor. Ring +1",
        back = gear.nuke_jse_back,
        waist = "Acuity Belt +1",
        legs = "Merlinic Shalwar",
        feet = gear.merlinic_aspir_feet
    }

    -- Elemental Magic sets

    sets.midcast['Elemental Magic'] = {
        main = "Mpaca's Stagg",
        sub = "Enki Strap",
        ammo = "Ghastly Tathlum +1",
        head = "Wicce Petasos +2",
        neck = "Sibyl Scarf",
        ear1 = "Barkaro. Earring",
        ear2 = "Friomisi Earring",
        body = "Wicce Coat +2",
        hands = "Wicce Gloves +2",
        ring1 = "Medada's Ring",
        ring2 = "Metamor. Ring +1",
        back = gear.nuke_jse_back,
        waist = "Acuity Belt +1",
        legs = "Wicce Chausses +2",
        feet = "Wicce Sabots +2"
    }

    sets.midcast['Elemental Magic'].HighTierNuke = sets.midcast['Elemental Magic']

    sets.midcast.Helix = sets.midcast['Elemental Magic']

    sets.midcast['Elemental Magic'].OccultAcumen = {
        ammo = "Seraphic Ampulla",
        head = "Mall. Chapeau +2",
        body = "Wicce Coat +2", -- Shango Robe
        hands = gear.merlinic_occult_hands,
        legs = "Perdition Slops",
        feet = gear.merlinic_occult_feet,
        neck = "Asperity Necklace", -- Lissome/Combatants better
        waist = "Oneiros Rope",
        left_ear = "Dedition Earring",
        right_ear = "Telos Earring",
        left_ring = "Chirich Ring +1",
        right_ring = "Crepuscular Ring",
        back = "Aurist's Cape +1",
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
        head = "Befouled Crown",
        neck = "Chrys. Torque",
        ear1 = "Ethereal Earring",
        ear2 = "Sanare Earring",
        body = "Jhakri Robe +2",
        hands = gear.merlinic_refresh_hands,
        ring1 = "Defending Ring",
        ring2 = "Dark Ring",
        back = "Umbra Cape",
        waist = "Fucho-no-obi",
        legs = "Assid. Pants +1",
        feet = gear.merlinic_refresh_feet
    }

    -- Idle sets

    -- Normal refresh idle set
    sets.idle = {
        main = "Mpaca's Staff",
        sub = "Oneiros Grip",
        ammo = "Staunch Tathlum +1",
        head = "Wicce Petasos +2",
        neck = "Sibyl Scarf",
        ear1 = "Eabani Earring",
        ear2 = "Infused Earring",
        body = "Wicce Coat +2",
        hands = "Wicce Gloves +2",
        ring1 = "Defending Ring",
        ring2 = "Shadow Ring",
        back = gear.idlefc_jse_back,
        waist = "Fucho-no-Obi",
        legs = "Assid. Pants +1",
        feet = "Wicce Sabots +2"
    }

    -- Idle mode that keeps PDT gear on, but doesn't prevent normal gear swaps for precast/etc.
    sets.idle.DT = {
        main = "Malignance Pole",
        sub = "Oneiros Grip",
        ammo = "Staunch Tathlum",
        head = "Hagondes Hat +1",
        neck = "Loricate Torque +1",
        ear1 = "Genmei Earring",
        ear2 = "Etiolation Earring",
        body = "Vrikodara Jupon",
        hands = gear.merlinic_refresh_hands,
        ring1 = "Defending Ring",
        ring2 = "Dark Ring",
        back = "Shadow Mantle",
        waist = "Flax Sash",
        legs = "Assid. Pants +1",
        feet = "Mallquis Clogs +2"
    }

    sets.idle.Death = {
        main = gear.grioavolr_nuke_staff,
        sub = "Umbra Strap",
        ammo = "Staunch Tathlum",
        head = "Befouled Crown",
        neck = "Loricate Torque +1",
        ear1 = "Gifted Earring",
        ear2 = "Etiolation Earring",
        body = "Jhakri Robe +2",
        hands = gear.merlinic_refresh_hands,
        ring1 = "Mephitas's Ring +1",
        ring2 = "Mephitas's Ring",
        back = "Umbra Cape",
        waist = "Fucho-no-obi",
        legs = "Assid. Pants +1",
        feet = gear.merlinic_refresh_feet
    }

    sets.idle.Weak = {
        main = "Bolelabunga",
        sub = "Genbu\'s Shield",
        ammo = "Staunch Tathlum",
        head = "Befouled Crown",
        neck = "Loricate Torque +1",
        ear1 = "Ethereal Earring",
        ear2 = "Etiolation Earring",
        body = "Jhakri Robe +2",
        hands = gear.merlinic_refresh_hands,
        ring1 = "Defending Ring",
        ring2 = "Dark Ring",
        back = "Umbra Cape",
        waist = "Flax Sash",
        legs = "Assid. Pants +1",
        feet = gear.merlinic_refresh_feet
    }

    -- Defense sets

    sets.defense.PDT = {
        main = "Malignance Pole",
        sub = "Umbra Strap",
        ammo = "Staunch Tathlum",
        head = "Hagondes Hat +1",
        neck = "Loricate Torque +1",
        ear1 = "Genmei Earring",
        ear2 = "Etiolation Earring",
        body = "Mallquis Saio +2",
        hands = "Hagondes Cuffs +1",
        ring1 = "Defending Ring",
        ring2 = "Dark Ring",
        back = "Shadow Mantle",
        waist = "Flax Sash",
        legs = "Hagondes Pants +1",
        feet = "Mallquis Clogs +2"
    }

    sets.defense.MDT = {
        main = "Malignance Pole",
        sub = "Umbra Strap",
        ammo = "Staunch Tathlum",
        head = "Hagondes Hat +1",
        neck = "Loricate Torque +1",
        ear1 = "Genmei Earring",
        ear2 = "Etiolation Earring",
        body = "Mallquis Saio +2",
        hands = "Hagondes Cuffs +1",
        ring1 = "Defending Ring",
        ring2 = "Shadow Ring",
        back = "Solemnity Cape",
        waist = "Flax Sash",
        legs = "Hagondes Pants +1",
        feet = "Mallquis Clogs +2"
    }

    sets.defense.MEVA = {
        main = "Malignance Pole",
        sub = "Enki Strap",
        ammo = "Staunch Tathlum",
        head = gear.merlinic_nuke_head,
        neck = "Warder's Charm +1",
        ear1 = "Sanare Earring",
        ear2 = "Etiolation Earring",
        body = gear.merlinic_nuke_body,
        hands = "Amalric Gages",
        ring1 = "Vengeful Ring",
        ring2 = "Purity Ring",
        back = gear.nuke_jse_back,
        waist = "Luminary Sash",
        legs = "Hagondes Pants +1",
        feet = gear.merlinic_nuke_feet
    }

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

    -- Buff sets: Gear that needs to be worn to actively enhance a current player buff.

    sets.HPDown = {
        head = "Pixie Hairpin +1",
        ear1 = "Genmei Earring",
        ear2 = "Evans Earring",
        body = "Jhakri Robe +2",
        hands = "Jhakri Cuffs",
        ring1 = "Mephitas's Ring +1",
        ring2 = "Mephitas's Ring",
        back = "Swith Cape +1",
        legs = "Shedir Seraweels",
        feet = "Jhakri Pigaches"
    }

    sets.HPCure = {
        main = gear.gada_healing_club,
        sub = "Sors Shield",
        ammo = "Hasty Pinion +1",
        head = "Blistering Sallet +1",
        neck = "Nodens Gorget",
        ear1 = "Etiolation Earring",
        ear2 = "Ethereal Earring",
        body = "Vrikodara Jupon",
        hands = "Telchine Gloves",
        ring1 = "Kunaji Ring",
        ring2 = "Meridian Ring",
        back = "Tempered Cape +1",
        waist = "Witful Belt",
        legs = "Psycloth Lappas",
        feet = "Vanya Clogs"
    }

    sets.buff.Doom = set_combine(sets.buff.Doom, {})
    sets.buff['Mana Wall'] = {
        ammo = "Staunch Tathlum +1",
        head = "Wicce Petasos +2",
        neck = "Loricate Torque +1",
        ear1 = "Hearty Earring",
        ear2 = "Ethereal Earring",
        body = "Wicce Coat +2",
        hands = "Wicce Gloves +2",
        ring1 = "Defending Ring",
        ring2 = "Supershear Ring",
        back = gear.idlefc_jse_back,
        waist = "Plat. Mog. Belt",
        legs = "Wicce Chausses +2",
        feet = "Wicce Sabots +2"
    }

    -- Gear that converts elemental damage done to recover MP.	
    sets.RecoverMP = {
        body = "Spaekona's Coat +3"
    }
    -- Gear for Magic Burst mode.
    sets.MagicBurst = {
        main = gear.grioavolr_nuke_staff,
        sub = "Enki Strap",
        head = "Ea Hat",
        body = "Wicce Coat +2",
        hands = "Amalric Gages",
        ring1 = "Mujin Band",
        legs = "Ea Slops",
        feet = "Jhakri Pigaches"
    }
    sets.ResistantMagicBurst = {
        main = gear.grioavolr_nuke_staff,
        sub = "Enki Strap",
        head = "Ea Hat",
        body = "Ea Houppelande",
        hands = "Amalric Gages",
        ring1 = "Mujin Band",
        legs = "Ea Slops",
        feet = "Jhakri Pigaches"
    }

    -- Gear for specific elemental nukes.
    sets.element.Dark = {
        head = "Pixie Hairpin +1",
        ring2 = "Archon Ring"
    }

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion

    -- Normal melee group
    sets.engaged = {
        ammo = "Staunch Tathlum",
        head = "Jhakri Coronal +1",
        neck = "Combatant's Torque",
        ear1 = "Mache Earring +1",
        ear2 = "Telos Earring",
        body = "Jhakri Robe +2",
        hands = "Jhakri Cuffs",
        ring1 = "Ramuh Ring +1",
        ring2 = "Ramuh Ring +1",
        back = gear.stp_jse_back,
        waist = "Olseni Belt",
        legs = "Jhakri Slops +1",
        feet = "Jhakri Pigaches"
    }

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
        back = "Grapevine Cape",
        waist = "Gishdubar Sash",
        feet = "Inspirited Boots"
    }
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    set_macro_page(1, 4)
end

function user_job_lockstyle()
    windower.chat.input('/lockstyleset 011')
end
