function user_job_setup()
    state.OffenseMode:options('Normal', 'Inquartata', 'Magic', 'TP')
    state.WeaponskillMode:options('Match', 'Normal', 'Inquartata', 'Magic', 'TP')
    state.CastingMode:options('SIRD', 'Normal')
    state.PhysicalDefenseMode:options('PDT')
    state.MagicalDefenseMode:options('MDT')
    state.ResistDefenseMode:options('AoE')
    state.IdleMode:options('Normal', 'AoE')
    state.Weapons:options('Epeolatry', 'Montante', 'Aettir')

    state.ExtraDefenseMode = M {
        ['description'] = 'Extra Defense Mode',
        'None',
        'MP'
    }

    gear.enmity_jse_back = {
        name = "Ogma's cape",
        augments = { 'HP+60', 'Eva.+20 /Mag. Eva.+20', 'Mag. Evasion+10', 'Enmity+10', 'Phys. dmg. taken-10%' }
    }
    gear.stp_jse_back = {
        name = "Ogma's cape",
        augments = { 'DEX+20', 'Accuracy+20 Attack+20', 'Accuracy+10', '"Store TP"+10', 'Phys. dmg. taken-10%' }
    }
    gear.da_jse_back = {
        name = "Ogma's cape",
        augments = { 'STR+20', 'Accuracy+20 Attack+20', 'STR+7', '"Dbl.Atk."+10' }
    }
    gear.wsd_jse_back = {
        name = "Ogma's cape",
        augments = { 'DEX+20', 'Accuracy+20 Attack+20', 'DEX+10', 'Weapon skill damage +10%' }
    }
    gear.fc_jse_back = {
        name = "Ogma's cape",
        augments = { 'HP+60', '"Fast Cast"+10', 'Phys. dmg. taken-10%' }
    }

    autows = 'Dimidiation'

    -- Additional local binds
    -- send_command('bind ^` gs c SubJobEnmity')
    send_command('bind ^\' gs c toggle AutoRuneMode')
    send_command('bind !\' gs c cycle RuneElement')
    send_command('bind @\' gs c RuneElement')
    send_command('bind ^delete input /ja "Provoke" <stnpc>')
    send_command('bind !delete input /ma "Cure IV" <stal>')
    send_command('bind @delete input /ma "Flash" <stnpc>')
    send_command('bind ^\\\\ input /ma "Protect IV" <t>')
    send_command('bind @\\\\ input /ma "Shell V" <t>')
    send_command('bind !\\\\ input /ma "Crusade" <me>')
    send_command('bind ^backspace input /ja "Lunge" <t>')
    send_command('bind @backspace input /ja "Gambit" <t>')
    send_command('bind !backspace input /ja "Rayke" <t>')
    send_command('bind @f8 gs c toggle AutoTankMode')
    send_command('bind @f10 gs c toggle TankAutoDefense')
    send_command('bind ^@!` gs c cycle SkillchainMode')

    select_default_macro_book()
end

function init_gear_sets()
    sets.Enmity = {
        ammo = "Aqreqaq Bomblet",
        head = "Rabid Visor",
        body = "Emet Harness +1",
        hands = "Turms Mittens",
        legs = "Eri. Leg Guards +1",
        feet = "Erilaz Greaves +1",
        neck = "Unmoving Collar",
        waist = "Kasiri Belt",
        left_ear = "Cryptic Earring",
        right_ear = "Odnowa Earring +1",
        left_ring = "Eihwaz Ring",
        right_ring = "Gelatinous Ring +1",
        back = gear.enmity_jse_back
    }

    sets.Enmity.SIRD = {
        ammo = "Staunch Tathlum +1",
        head = "Agwu's Cap",
        body = "Nyame Mail",
        hands = "Rawhide Gloves",
        legs = "Carmine Cuisses +1",
        feet = gear.taeon_regensird_feet,
        neck = "Moonbeam Necklace",
        waist = "Audumbla Sash",
        left_ear = "Magnetic Earring",
        right_ear = "Odnowa Earring +1",
        left_ring = "Gelatinous Ring +1",
        right_ring = "Defending Ring",
        back = gear.enmity_jse_back
    }

    sets.Enmity.SIRD.DT = {
        ammo = "Staunch Tathlum +1",
        head = "Agwu's Cap",
        body = "Nyame Mail",
        hands = "Rawhide Gloves",
        legs = "Carmine Cuisses +1",
        feet = gear.taeon_regensird_feet,
        neck = "Moonbeam Necklace",
        waist = "Audumbla Sash",
        left_ear = "Magnetic Earring",
        right_ear = "Odnowa Earring +1",
        left_ring = "Gelatinous Ring +1",
        right_ring = "Defending Ring",
        back = gear.enmity_jse_back
    }

    sets.Enmity.DT = {
        ammo = "Staunch Tathlum +1",
        head = "Rabid Visor",
        neck = "Moonbeam Necklace",
        ear1 = "Cryptic Earring",
        ear2 = "Odnowa Earring +1",
        body = "Emet Harness +1",
        hands = "Turms Mittens",
        ring1 = "Gelatinous Ring +1",
        ring2 = "Eihwaz Ring",
        back = gear.enmity_jse_back,
        waist = "Kasiri Belt",
        legs = "Eri. Leg Guards +1",
        feet = "Erilaz Greaves +1"
    }

    --------------------------------------
    -- Precast sets
    --------------------------------------

    -- Item sets.

    -- Precast sets to enhance JAs
    sets.precast.JA['Vallation'] = set_combine(sets.Enmity, {
        body = "Runeist's Coat +3",
        legs = "Futhark Trousers +1"
    })
    sets.precast.JA['Valiance'] = sets.precast.JA['Vallation']
    sets.precast.JA['Pflug'] = set_combine(sets.Enmity, {
        feet = "Runeist Boots +3"
    })
    sets.precast.JA['Battuta'] = set_combine(sets.Enmity, {
        head = "Fu. Bandeau +1"
    })
    sets.precast.JA['Liement'] = set_combine(sets.Enmity, {
        body = "Futhark Coat +2"
    })
    sets.precast.JA['Gambit'] = set_combine(sets.Enmity, {
        hands = "Runeist Mitons +2"
    })
    sets.precast.JA['Rayke'] = set_combine(sets.Enmity, {
        feet = "Futhark Boots +1"
    })
    sets.precast.JA['Elemental Sforzo'] = set_combine(sets.Enmity, {
        body = "Futhark Coat +2"
    })
    sets.precast.JA['Swordplay'] = set_combine(sets.Enmity, {
        hands = "Futhark Mitons +1"
    })
    sets.precast.JA['Embolden'] = set_combine(sets.Enmity, {})
    sets.precast.JA['One For All'] = set_combine(sets.Enmity, {})
    sets.precast.JA['Provoke'] = set_combine(sets.Enmity, {})
    sets.precast.JA['Warcry'] = set_combine(sets.Enmity, {})
    sets.precast.JA['Defender'] = set_combine(sets.Enmity, {})
    sets.precast.JA['Berserk'] = set_combine(sets.Enmity, {})
    sets.precast.JA['Last Resort'] = set_combine(sets.Enmity, {})
    sets.precast.JA['Aggressor'] = set_combine(sets.Enmity, {})
    sets.precast.JA['Animated Flourish'] = set_combine(sets.Enmity, {})

    sets.precast.JA['Vallation'].DT = set_combine(sets.Enmity.DT, {
        body = "Runeist's Coat +3",
        legs = "Futhark Trousers +1"
    })
    sets.precast.JA['Valiance'].DT = sets.precast.JA['Vallation'].DT
    sets.precast.JA['Pflug'].DT = set_combine(sets.Enmity.DT, {
        feet = "Runeist Bottes"
    })
    sets.precast.JA['Battuta'].DT = set_combine(sets.Enmity.DT, {
        head = "Fu. Bandeau +1"
    })
    sets.precast.JA['Liement'].DT = set_combine(sets.Enmity.DT, {
        body = "Futhark Coat +2"
    })
    sets.precast.JA['Gambit'].DT = set_combine(sets.Enmity.DT, {
        hands = "Runeist Mitons +2"
    })
    sets.precast.JA['Rayke'].DT = set_combine(sets.Enmity.DT, {
        feet = "Futhark Boots"
    })
    sets.precast.JA['Elemental Sforzo'].DT = set_combine(sets.Enmity.DT, {
        body = "Futhark Coat +2"
    })
    sets.precast.JA['Swordplay'].DT = set_combine(sets.Enmity.DT, {
        hands = "Futhark Mitons"
    })
    sets.precast.JA['Embolden'].DT = set_combine(sets.Enmity.DT, {})
    sets.precast.JA['One For All'].DT = set_combine(sets.Enmity.DT, {})
    sets.precast.JA['Provoke'].DT = set_combine(sets.Enmity.DT, {})
    sets.precast.JA['Warcry'].DT = set_combine(sets.Enmity.DT, {})
    sets.precast.JA['Defender'].DT = set_combine(sets.Enmity.DT, {})
    sets.precast.JA['Berserk'].DT = set_combine(sets.Enmity.DT, {})
    sets.precast.JA['Last Resort'].DT = set_combine(sets.Enmity.DT, {})
    sets.precast.JA['Aggressor'].DT = set_combine(sets.Enmity.DT, {})
    sets.precast.JA['Animated Flourish'].DT = set_combine(sets.Enmity.DT, {})

    sets.precast.JA['Lunge'] = {
        ammo = "Seeth. Bomblet +1",
        head = gear.herculean_nuke_head,
        neck = "Baetyl Pendant",
        ear1 = "Friomisi Earring",
        ear2 = "Crematio Earring",
        body = "Samnuha Coat",
        hands = "Carmine Fin. Ga. +1",
        ring1 = "Metamor. Ring +1",
        ring2 = "Shiva Ring",
        back = "Toro Cape",
        waist = "Eschan Stone",
        legs = gear.herculean_nuke_legs,
        feet = gear.herculean_nuke_feet
    }

    sets.precast.JA['Swipe'] = sets.precast.JA['Lunge']

    -- Gear for specific elemental nukes.
    sets.element.Dark = {
        head = "Pixie Hairpin +1",
        ring2 = "Archon Ring"
    }

    -- Pulse sets, different stats for different rune modes, stat aligned.
    sets.precast.JA['Vivacious Pulse'] = {
        head = "Erilaz Galea +1",
        neck = "Incanter's Torque",
        ring1 = "Stikini Ring",
        ring2 = "Stikini Ring",
        legs = "Rune. Trousers +1"
    }
    sets.precast.JA['Vivacious Pulse']['Ignis'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
    sets.precast.JA['Vivacious Pulse']['Gelus'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
    sets.precast.JA['Vivacious Pulse']['Flabra'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
    sets.precast.JA['Vivacious Pulse']['Tellus'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
    sets.precast.JA['Vivacious Pulse']['Sulpor'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
    sets.precast.JA['Vivacious Pulse']['Unda'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
    sets.precast.JA['Vivacious Pulse']['Lux'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
    sets.precast.JA['Vivacious Pulse']['Tenebrae'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {
        ammo = "Yamarang",
        head = "Carmine Mask +1",
        neck = "Unmoving Collar +1",
        ear1 = "Enchntr. Earring +1",
        ear2 = "Handler's Earring +1",
        body = gear.herculean_waltz_body,
        hands = gear.herculean_waltz_hands,
        ring1 = "Defending Ring",
        ring2 = "Valseur's Ring",
        back = "Solemnity Cape",
        waist = "Chaac Belt",
        legs = "Dashing Subligar",
        feet = gear.herculean_waltz_feet
    }

    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

    sets.precast.Step = {}

    sets.precast.JA['Violent Flourish'] = {}

    -- Fast cast sets for spells
    sets.precast.FC = {
        ammo = "Staunch Tathlum +1",
        head = "Nyame Helm",
        neck = "Warder's Charm",
        ear1 = "Loquac. Earring",
        ear2 = "Odnowa Earring +1",
        body = "Nyame Mail",
        hands = "Leyline Gloves",
        ring1 = "Gelatinous Ring +1",
        ring2 = "Moonbeam Ring",
        back = gear.fc_jse_back,
        waist = "Kasiri Belt",
        legs = "Futhark Trousers +1",
        feet = "Carmine Greaves +1"
    }

    sets.precast.FC.DT = {
        ammo = "Staunch Tathlum +1",
        head = "Nyame Helm",
        neck = "Warder's Charm",
        ear1 = "Loquac. Earring",
        ear2 = "Odnowa Earring +1",
        body = "Nyame Mail",
        hands = "Leyline Gloves",
        ring1 = "Gelatinous Ring +1",
        ring2 = "Moonbeam Ring",
        back = gear.fc_jse_back,
        waist = "Kasiri Belt",
        legs = "Futhark Trousers +1",
        feet = "Carmine Greaves +1"
    }

    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {
        waist = "Siegel Sash"
    })

    sets.precast.FC['Enhancing Magic'].DT = set_combine(sets.precast.FC.DT, {
        waist = "Siegel Sash"
    })

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {
        neck = 'Magoraga Beads'
    })
    sets.precast.FC.Cure = set_combine(sets.precast.FC, {})

    -- Weaponskill sets
    sets.precast.WS = {
        ammo = "Seeth. Bomblet +1",
        head = "Adhemar Bonnet",
        body = "Adhemar Jacket +1",
        hands = "Adhemar Wrist. +1",
        legs = "Samnuha Tights",
        feet = gear.herculean_ta_feet,
        neck = "Soil Gorget",
        waist = "Fotia Belt",
        left_ear = "Moonshade Earring",
        right_ear = "Sherida Earring",
        left_ring = "Petrov Ring",
        right_ring = "Ifrit Ring",
        back = gear.da_jse_back
    }

    sets.precast.WS.Acc = sets.precast.WS
    sets.precast.WS.HighAcc = sets.precast.WS
    sets.precast.WS.FullAcc = sets.precast.WS

    sets.precast.WS['Resolution'] = {
        ammo = "Seeth. Bomblet +1",
        head = "Lustratio Cap +1",
        body = "Adhemar Jacket +1",
        hands = "Adhemar Wrist. +1",
        legs = "Lustr. Subligar +1",
        feet = "Lustra. Leggings +1",
        neck = "Light Gorget",
        waist = "Fotia Belt",
        left_ear = "Moonshade Earring",
        right_ear = "Sherida Earring",
        left_ring = "Epona's Ring",
        right_ring = "Petrov Ring",
        back = gear.wsd_jse_back
    }
    sets.precast.WS['Resolution'].Inquartata = {
        ammo = "Seeth. Bomblet +1",
        head = "Nyame Helm",
        body = "Nyame Mail",
        hands = "Nyame Gauntlets",
        legs = "Nyame Flanchard",
        feet = "Nyame Sollerets",
        neck = "Light Gorget",
        waist = "Fotia Belt",
        left_ear = "Moonshade Earring",
        right_ear = "Sherida Earring",
        left_ring = "Epona's Ring",
        right_ring = "Petrov Ring",
        back = gear.wsd_jse_back
    }
    sets.precast.WS['Resolution'].Magic = sets.precast.WS['Resolution'].Inquartata
    sets.precast.WS['Resolution'].TP = sets.precast.WS['Resolution']

    sets.precast.WS['Dimidiation'] = {
        ammo = "Knobkierrie",
        head = "Lustratio Cap +1",
        body = "Adhemar Jacket +1",
        hands = "Meg. Gloves +2",
        legs = "Lustr. Subligar +1",
        feet = "Lustra. Leggings +1",
        neck = "Light Gorget",
        waist = "Grunfeld Rope",
        left_ear = "Moonshade Earring",
        right_ear = "Sherida Earring",
        left_ring = "Petrov Ring",
        right_ring = "Ilabrat Ring",
        back = gear.wsd_jse_back
    }

    sets.precast.WS['Dimidiation'].Inquartata = {
        ammo = "Knobkierrie",
        head = "Nyame Helm",
        body = "Nyame Mail",
        hands = "Nyame Gauntlets",
        legs = "Nyame Flanchard",
        feet = "Nyame Sollerets",
        neck = "Light Gorget",
        waist = "Grunfeld Rope",
        left_ear = "Moonshade Earring",
        right_ear = "Sherida Earring",
        left_ring = "Petrov Ring",
        right_ring = "Ilabrat Ring",
        back = gear.wsd_jse_back
    }
    sets.precast.WS['Dimidiation'].Magic = sets.precast.WS['Dimidiation'].Inquartata
    sets.precast.WS['Dimidiation'].TP = sets.precast.WS['Dimidiation']

    sets.precast.WS['Ground Strike'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Ground Strike'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Ground Strike'].HighAcc = set_combine(sets.precast.WS.HighAcc, {})
    sets.precast.WS['Ground Strike'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})

    sets.precast.WS['Herculean Slash'] = set_combine(sets.precast['Lunge'], {})
    sets.precast.WS['Sanguine Blade'] = set_combine(sets.precast['Lunge'], {})

    --------------------------------------
    -- Midcast sets
    --------------------------------------

    sets.midcast.FastRecast = sets.precast.FC

    sets.midcast.FastRecast.DT = sets.precast.FC.DT

    sets.midcast.FastRecast.SIRD = {
        ammo = "Staunch Tathlum +1",
        head = "Agwu's Cap",
        body = "Nyame Mail",
        hands = "Rawhide Gloves",
        legs = "Carmine Cuisses +1",
        feet = gear.taeon_regensird_feet,
        neck = "Moonbeam Necklace",
        waist = "Audumbla Sash",
        left_ear = "Magnetic Earring",
        right_ear = "Odnowa Earring +1",
        left_ring = "Gelatinous Ring +1",
        right_ring = "Defending Ring",
        back = gear.enmity_jse_back

    }

    sets.midcast['Enhancing Magic'] = {
        ammo = "Staunch Tathlum +1",
        head = "Erilaz Galea +1",
        body = "Runeist's Coat +3",
        hands = "Runeist's Mitons +2",
        legs = "Carmine Cuisses +1",
        feet = "Carmine Greaves +1",
        neck = "Incanter's Torque",
        waist = "Kasiri Belt",
        left_ear = "Mimir Earring",
        right_ear = "Odnowa Earring +1",
        left_ring = "Stikini Ring",
        right_ring = "Stikini Ring",
        back = "Moonbeam Cape"
    }

    sets.midcast['Aquaveil'] = {
        ammo = "Staunch Tathlum +1",
        head = "Agwu's Cap",
        body = "Nyame Mail",
        hands = "Rawhide Gloves",
        legs = "Carmine Cuisses +1",
        feet = gear.taeon_regensird_feet,
        neck = "Moonbeam Necklace",
        waist = "Audumbla Sash",
        left_ear = "Magnetic Earring",
        right_ear = "Odnowa Earring +1",
        left_ring = "Gelatinous Ring +1",
        right_ring = "Defending Ring",
        back = gear.enmity_jse_back

    }

    sets.midcast['Temper'] = {
        ammo = "Sapience Orb",
        head = "Erilaz Galea +1",
        body = "Runeist's Coat +3",
        hands = "Runeist's Mitons +2",
        legs = "Carmine Cuisses +1",
        feet = "Carmine Greaves +1",
        neck = "Incanter's Torque",
        waist = "Olympus Sash",
        left_ear = "Mimir Earring",
        right_ear = "Andoaa Earring",
        left_ring = "Stikini Ring",
        right_ring = "Stikini Ring",
        back = "Merciful Cape"
    }

    sets.midcast['Phalanx'] = set_combine(sets.midcast['Enhancing Magic'], {
        feet = gear.herculean_phalanx_feet
    })
    sets.midcast['Regen'] = set_combine(sets.midcast['Enhancing Magic'], {
        head = "Rune. Bandeau +2",
        neck = "Sacro Gorget",
        feet = gear.taeon_regensird_feet,
        hands = "Regal Gauntlets",
        waist = "Sroda Belt",
        left_ear = "Mendi. Earring",
    })
    sets.midcast['Refresh'] = set_combine(sets.midcast['Enhancing Magic'], {
        head = "Erilaz Galea +1"
    })
    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {
        ear2 = "Earthcry Earring",
        waist = "Siegel Sash"
    })
    sets.midcast.Flash = sets.Enmity.SIRD
    sets.midcast.Flash.DT = sets.Enmity.SIRD.DT
    sets.midcast.Foil = sets.Enmity.SIRD
    sets.midcast.Foil.DT = sets.Enmity.SIRD.DT
    sets.midcast.Stun = sets.Enmity.SIRD
    sets.midcast.Stun.DT = sets.Enmity.SIRD.DT
    sets.midcast.Jettatura = sets.Enmity.SIRD
    sets.midcast.Jettatura.DT = sets.Enmity.SIRD.DT
    sets.midcast['Blue Magic'] = sets.Enmity.SIRD
    sets.midcast['Blue Magic'].DT = sets.Enmity.SIRD.DT
    sets.midcast['Blue Magic'].SIRD = sets.Enmity.SIRD

    sets.midcast.Cure = {
        ammo = "Staunch Tathlum +1",
        head = "Carmine Mask +1",
        neck = "Sacro Gorget",
        ear1 = "Mendi. Earring",
        ear2 = "Roundel Earring",
        body = "Vrikodara Jupon",
        hands = "Buremte Gloves",
        ring1 = "Lebeche Ring",
        ring2 = "Janniston Ring",
        back = "Tempered Cape +1",
        waist = "Sroda Belt",
        legs = "Carmine Cuisses +1",
        feet = "Skaoi Boots"
    }

    sets.midcast['Wild Carrot'] = set_combine(sets.midcast.Cure, {})

    sets.Self_Healing = {
        hands = "Buremte Gloves",
        ring2 = "Kunaji Ring",
        waist = "Gishdubar Sash"
    }
    sets.Cure_Received = {
        hands = "Buremte Gloves",
        ring2 = "Kunaji Ring",
        waist = "Gishdubar Sash"
    }
    sets.Self_Refresh = {
        waist = "Gishdubar Sash"
    }
    sets.Phalanx_Received = {
        main = "Deacon Sword",
        hands = gear.herculean_phalanx_hands,
        feet = gear.herculean_nuke_feet
    }

    sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {
        ring2 = "Sheltered Ring"
    })
    sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {
        ring2 = "Sheltered Ring"
    })

    --------------------------------------
    -- Idle/resting/defense/etc sets
    --------------------------------------

    sets.resting = {}

    sets.idle = {
        ammo = "Staunch Tathlum +1",
        head = "Nyame Helm",
        body = "Nyame Mail",
        hands = "Regal Gauntlets",
        legs = "Nyame Flanchard",
        feet = "Nyame Sollerets",
        neck = "Loricate Torque +1",
        waist = "Flume Belt +1",
        left_ear = "Tuisto Earring",
        right_ear = "Odnowa Earring +1",
        left_ring = "Gelatinous Ring +1",
        right_ring = "Karieyh Ring +1",
        back = gear.enmity_jse_back
    }

    sets.idle.AoE = {
        ammo = "Staunch Tathlum +1",
        head = "Nyame Helm",
        body = "Nyame Mail",
        hands = "Nyame Gauntlets",
        legs = "Nyame Flanchard",
        feet = "Nyame Sollerets",
        neck = "Loricate Torque +1",
        waist = "Flume Belt +1",
        left_ear = "Tuisto Earring",
        right_ear = "Odnowa Earring +1",
        left_ring = "Gelatinous Ring +1",
        right_ring = "Moonbeam Ring",
        back = gear.enmity_jse_back
    }

    -- not using
    sets.idle.KiteTank = set_combine(sets.idle.Tank, {
        legs = "Carmine Cuisses +1"
    })

    sets.idle.Weak = set_combine(sets.idle.Tank, {})

    sets.Kiting = {
        legs = "Carmine Cuisses +1"
    }

    sets.latent_refresh = {
        waist = "Fucho-no-obi"
    }
    sets.latent_refresh_grip = {
        sub = "Oneiros Grip"
    }
    sets.DayIdle = {}
    sets.NightIdle = {}

    -- Extra defense sets.  Apply these on top of melee or defense sets.
    sets.Knockback = {}
    sets.MP = {
        ear2 = "Ethereal Earring",
        body = "Erilaz Surcoat +2",
        waist = "Flume Belt +1"
    }
    sets.TreasureHunter = {
        body = "Herculean Vest",
        feet = gear.herculean_th_feet,
        waist = "Chaac Belt",
        ammo = "Per. Lucky Egg"
    }

    -- Weapons sets
    sets.weapons.Epeolatry = {
        main = "Epeolatry",
        sub = "Utu Grip"
    }

    sets.weapons.Montante = {
        main = "Montante +1",
        sub = "Utu Grip"
    }

    sets.weapons.Aettir = {
        main = "Aettir",
        sub = "Utu Grip"
    }

    -- Defense Sets

    sets.defense.PDT = {
        ammo = "Staunch Tathlum +1",
        head = "Nyame Helm",
        body = "Nyame Mail",
        hands = "Turms Mittens",
        legs = "Nyame Flanchard",
        feet = "Turms Leggings",
        neck = "Loricate Torque +1",
        waist = "Engraved Belt",
        left_ear = "Cryptic Earring",
        right_ear = "Odnowa Earring +1",
        left_ring = "Gelatinous Ring +1",
        right_ring = "Moonbeam Ring",
        back = gear.enmity_jse_back
    }

    sets.defense.MDT = {
        ammo = "Staunch Tathlum +1",
        head = "Nyame Helm",
        body = "Runeist's Coat +3",
        hands = "Nyame Gauntlets",
        legs = "Nyame Flanchard",
        feet = "Nyame Sollerets",
        neck = "Loricate Torque +1",
        waist = "Engraved Belt",
        left_ear = "Hearty Earring",
        right_ear = "Odnowa Earring +1",
        left_ring = "Shadow Ring",
        right_ring = "Vexer Ring +1",
        back = gear.enmity_jse_back
    }

    sets.defense.AoE = sets.idle.AoE

    sets.defense.Death = {
        ring1 = "Eihwaz Ring"
    }

    sets.defense.DTCharm = sets.engaged.Magic

    sets.defense.Charm = sets.engaged.Magic

    -- Swap to these on Moonshade using WS if at 3000 TP
    sets.MaxTP = {
        ear1 = "Brutal Earring"
    }
    sets.AccMaxTP = {
        ear1 = "Telos Earring"
    }

    --------------------------------------
    -- Engaged sets
    --------------------------------------

    sets.engaged = {
        ammo = "Yamarang",
        head = "Nyame Helm",
        body = "Ayanmo Corazza +2",
        hands = "Nyame Gauntlets",
        legs = "Nyame Flanchard",
        feet = "Nyame Sollerets",
        neck = "Anu Torque",
        waist = "Sailfi Belt +1",
        left_ear = "Telos Earring",
        right_ear = "Sherida Earring",
        left_ring = "Epona's Ring",
        right_ring = "Moonbeam Ring",
        back = gear.stp_jse_back
    }

    sets.engaged.Inquartata = sets.defense.PDT
    sets.engaged.Magic = sets.defense.MDT

    sets.engaged.TP = {
        ammo = "Coiste Bodhar",
        head = "Adhemar Bonnet +1",
        body = "Adhemar Jacket +1",
        hands = "Adhemar Wrist. +1",
        legs = "Samnuha Tights",
        feet = "Nyame Sollerets",
        neck = "Anu Torque",
        waist = "Windbuffet Belt +1",
        left_ear = "Telos Earring",
        right_ear = "Sherida Earring",
        left_ring = "Epona's Ring",
        right_ring = "Chirich Ring +1",
        back = gear.stp_jse_back
    }

    sets.engaged.DT = sets.engaged
    sets.engaged.Inquartata.DT = sets.engaged.Inquartata
    sets.engaged.Magic.DT = sets.engaged.Magic
    sets.engaged.TP.DT = sets.engaged.TP

    --------------------------------------
    -- Custom buff sets
    --------------------------------------
    sets.buff.Doom = set_combine(sets.buff.Doom, {})
    sets.buff.Sleep = {
        head = "Frenzy Sallet"
    }
    sets.buff.Battuta = {
        hands = "Turms Mittens"
    }
    sets.buff.Embolden = {
        back = "Evasionist's Cape"
    }
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    -- set_macro_page(1, 22)
    if player.sub_job == 'BLU' then
        set_macro_page(3, 22)
        -- elseif player.sub_job == 'RDM' then
        -- 	set_macro_page(5, 2)
        -- elseif player.sub_job == 'SCH' then
        -- 	set_macro_page(5, 2)
        -- elseif player.sub_job == 'DNC' then
        -- 	set_macro_page(6, 2)
        -- elseif player.sub_job == 'WAR' then
        -- 	set_macro_page(7, 2)
        -- elseif player.sub_job == 'SAM' then
        -- 	set_macro_page(8, 2)
        -- elseif player.sub_job == 'DRK' then
        -- 	set_macro_page(9, 2)
        -- elseif player.sub_job == 'NIN' then
        -- 	set_macro_page(10, 2)
    else
        set_macro_page(1, 22)
    end
end

-- Job Specific Trust Overwrite
function check_trust()
    if not moving then
        if state.AutoTrustMode.value and not data.areas.cities:contains(world.area) and
            (buffactive['Elvorseal'] or buffactive['Reive Mark'] or not player.in_combat) then
            local party = windower.ffxi.get_party()
            if party.p5 == nil then
                local spell_recasts = windower.ffxi.get_spell_recasts()

                if spell_recasts[980] < spell_latency and not have_trust("Yoran-Oran") then
                    windower.send_command('input /ma "Yoran-Oran (UC)" <me>')
                    tickdelay = os.clock() + 3
                    return true
                elseif spell_recasts[952] < spell_latency and not have_trust("Koru-Moru") then
                    windower.send_command('input /ma "Koru-Moru" <me>')
                    tickdelay = os.clock() + 3
                    return true
                elseif spell_recasts[979] < spell_latency and not have_trust("Selh'teus") then
                    windower.send_command('input /ma "Selh\'teus" <me>')
                    tickdelay = os.clock() + 3
                    return true
                elseif spell_recasts[967] < spell_latency and not have_trust("Qultada") then
                    windower.send_command('input /ma "Qultada" <me>')
                    tickdelay = os.clock() + 3
                    return true
                elseif spell_recasts[914] < spell_latency and not have_trust("Ulmia") then
                    windower.send_command('input /ma "Ulmia" <me>')
                    tickdelay = os.clock() + 3
                    return true
                else
                    return false
                end
            end
        end
    end
    return false
end

function user_job_lockstyle()
    if state.Weapons.value == 'Lionheart' then
        windower.chat.input('/lockstyleset 034')
    else
        windower.chat.input('/lockstyleset 010')
    end
end
