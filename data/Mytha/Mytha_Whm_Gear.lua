-- Setup vars that are user-dependent.  Can override this in a sidecar file.
function user_job_setup()
    state.OffenseMode:options('Normal','Acc')
    state.CastingMode:options('Normal','Resistant','SIRD','DT')
    state.IdleMode:options('Normal','PDT','MDT','MEVA')
	state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('None','DualWeapons','MeleeWeapons')
	state.WeaponskillMode:options('Normal','Fodder')

		-- Additional local binds
	send_command('bind ^` input /ma "Afflatus Misery" <me>')
	send_command('bind !` input /ja "Afflatus Solace" <me>')
	send_command('bind @` gs c cycle MagicBurstMode')
	send_command('bind ^@!` gs c toggle AutoCaress')
	send_command('bind ^backspace input /ja "Sacrosanctity" <me>')
	send_command('bind @backspace input /ma "Aurora Storm" <me>')
	send_command('bind !pause gs c toggle AutoSubMode') --Automatically uses sublimation.
	send_command('bind !backspace input /ja "Accession" <me>')
	send_command('bind != input /ja "Sublimation" <me>')
	send_command('bind ^delete input /ja "Dark Arts" <me>')
	send_command('bind !delete input /ja "Addendum: Black" <me>')
	send_command('bind @delete input /ja "Manifestation" <me>')
	send_command('bind ^\\\\ input /ma "Protectra V" <me>')
	send_command('bind @\\\\ input /ma "Shellra V" <me>')
	send_command('bind !\\\\ input /ma "Reraise IV" <me>')

    select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------

	-- Weapons sets
	sets.weapons.MeleeWeapons = {main="Maxentius",sub="Genmei Shield"}
	sets.weapons.DualWeapons = {main="Maxentius",sub="Daybreak"}
	
    sets.buff.Sublimation = {waist="Embla Sash"}
    sets.buff.DTSublimation = {waist="Embla Sash"}
	
    -- Precast Sets

    -- Fast cast sets for spells
    sets.precast.FC = {main=gear.grioavolr_fc_staff,sub="Clerisy Strap +1",ammo="Impatiens",
		head="Bunzi's Hat",neck="Clr. Torque +1",ear1="Loquac. Earring",ear2="Malignance Earring",
		body="Inyanga Jubbah +2",hands="Fanatic Gloves",ring1="Kishar Ring",ring2="Lebeche Ring",
		back="Perimede Cape",waist="Witful Belt",legs="Aya. Cosciales +2",feet="Regal Pumps +1"}
		
    sets.precast.FC.DT = {main=gear.grioavolr_fc_staff,sub="Clerisy Strap +1",ammo="Impatiens",
		head="Bunzi's Hat",neck="Clr. Torque +1",ear1="Loquac. Earring",ear2="Malignance Earring",
		body="Inyanga Jubbah +2",hands="Fanatic Gloves",ring1="Kishar Ring",ring2="Lebeche Ring",
		back="Perimede Cape",waist="Witful Belt",legs="Aya. Cosciales +2",feet="Regal Pumps +1"}

    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
	
    sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {})

    sets.precast.FC['Healing Magic'] = set_combine(sets.precast.FC, {legs="Ebers Pant. +3"})

    sets.precast.FC.StatusRemoval = sets.precast.FC['Healing Magic']
	
    sets.precast.FC.Cure = set_combine(sets.precast.FC['Healing Magic'], {})

    sets.precast.FC.Curaga = sets.precast.FC.Cure

	sets.precast.FC.CureSolace = sets.precast.FC.Cure

	sets.precast.FC.Impact =  set_combine(sets.precast.FC, {head=empty,body="Crepuscular Cloak"})
	
	sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {main="Daybreak",sub="Genmei Shield"})

    -- Precast sets to enhance JAs
    sets.precast.JA.Benediction = {body="Piety Bliaut +3"}

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {}

    -- Weaponskill sets

    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {}
	
    sets.precast.WS.Dagan = {}
    sets.precast.WS['Flash Nova'] = {main="Daybreak",sub="Sors Shield",ammo="Ghastly Tathlum +1",
		head=gear.chironic_nuke_head,neck="Baetyl Pendant",ear1="Friomisi Earring",ear2="Malignance Earring",
		body=gear.chironic_nuke_body,hands=gear.chironic_nuke_hands,ring1="Strendu Ring",ring2="Persis Ring",
		back="Alaunus's Cape",waist="Yamabuki-no-Obi",legs=gear.chironic_macc_legs,feet=gear.chironic_treasure_feet}
    sets.precast.WS['Mystic Boon'] = {}
		
	sets.MaxTP = {}
	sets.MaxTP.Myrkr = {}
	sets.MaxTP.Dagan = {}

	
	--Situational sets: Gear that is equipped on certain targets
	sets.Self_Healing = {neck="Phalaina Locket",waist="Gishdubar Sash"}
	sets.Cure_Received = {neck="Phalaina Locket",waist="Gishdubar Sash"}
	sets.Self_Refresh = {back="Grapevine Cape",waist="Gishdubar Sash",feet="Inspirited Boots"}
	sets.Refresh_Received = {back="Grapevine Cape",waist="Gishdubar Sash",feet="Inspirited Boots"}
	
    sets.Kiting = {ring2="Shneddick Ring"}
    sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.latent_refresh_grip = {sub="Oneiros Grip"}
	sets.TPEat = {neck="Chrys. Torque"}
	sets.DayIdle = {}
	sets.NightIdle = {}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {feet=gear.chironic_treasure_feet})

	-- Conserve Mp set for spells that don't need anything else, for set_combine.
	
	sets.ConserveMP = {main=gear.grioavolr_nuke_staff,sub="Clemency Grip",ammo="Pemphredo Tathlum",
		head="Telchine Cap",neck="Incanter's Torque",ear1="Calamitous Earring",ear2="Gifted Earring",
		body="Witching Robe",hands="Fanatic Gloves",ring1="Kishar Ring",ring2="Lebeche Ring",
		back="Solemnity Cape",waist="Luminary Sash",legs="Theurgist's Slacks",feet="Medium's Sabots"}
		
	sets.midcast.Teleport = sets.ConserveMP
	
	-- Gear for Magic Burst mode.
    sets.MagicBurst = {main=gear.grioavolr_nuke_staff,sub="Enki Strap",neck="Mizu. Kubikazari",ring2="Locus Ring"}
	
    sets.midcast.FastRecast = {main=gear.grioavolr_fc_staff,sub="Clemency Grip",ammo="Hasty Pinion +1",
		head="Ebers Cap +3",neck="Clr. Torque +1",ear1="Loquac. Earring",ear2="Malignance Earring",
		body="Inyanga Jubbah +2",hands="Fanatic Gloves",ring1="Kishar Ring",ring2="Prolix Ring",
		back="Perimede Cape",waist="Embla Sash",legs="Aya. Cosciales +2",feet="Regal Pumps +1"}

    -- Cure sets

	sets.midcast['Full Cure'] = sets.midcast.FastRecast
	
	sets.midcast.Cure = {main="Queller Rod",sub="Sors Shield",ammo="Pemphredo Tathlum",
		head="Ebers Cap +3",neck="Incanter's Torque",ear1="Mendi. Earring",ear2="Glorious Earring",
		body="Theo. Bliaut +2",hands=gear.chironic_nuke_hands,ring1="Sirona's Ring",ring2="Lebeche Ring",
		back="Mending Cape",waist="Luminary Sash",legs="Ebers Pant. +3",feet="Piety Duckbills +3"}
		
	sets.midcast.CureSolace = {main="Queller Rod",sub="Sors Shield",ammo="Pemphredo Tathlum",
		head="Ebers Cap +3",neck="Incanter's Torque",ear1="Mendi. Earring",ear2="Glorious Earring",
		body="Ebers Bliaut +3",hands=gear.chironic_nuke_hands,ring1="Sirona's Ring",ring2="Lebeche Ring",
		back="Alaunus's Cape",waist="Luminary Sash",legs="Ebers Pant. +3",feet="Piety Duckbills +3"}

	sets.midcast.LightWeatherCure = {main="Chatoyant Staff",sub="Enki Strap",ammo="Pemphredo Tathlum",
		head="Ebers Cap +3",neck="Incanter's Torque",ear1="Mendi. Earring",ear2="Glorious Earring",
		body="Theo. Bliaut +2",hands=gear.chironic_nuke_hands,ring1="Sirona's Ring",ring2="Lebeche Ring",
		back="Twilight Cape",waist="Hachirin-no-Obi",legs="Ebers Pant. +3",feet="Piety Duckbills +3"}

	sets.midcast.LightWeatherCureSolace = {main="Chatoyant Staff",sub="Enki Strap",ammo="Pemphredo Tathlum",
		head="Ebers Cap +3",neck="Incanter's Torque",ear1="Mendi. Earring",ear2="Glorious Earring",
		body="Ebers Bliaut +3",hands=gear.chironic_nuke_hands,ring1="Sirona's Ring",ring2="Lebeche Ring",
		back="Alaunus's Cape",waist="Hachirin-no-Obi",legs="Ebers Pant. +3",feet="Piety Duckbills +3"}
		
	sets.midcast.LightDayCureSolace = {main="Queller Rod",sub="Sors Shield",ammo="Pemphredo Tathlum",
		head="Ebers Cap +3",neck="Incanter's Torque",ear1="Mendi. Earring",ear2="Glorious Earring",
		body="Ebers Bliaut +3",hands=gear.chironic_nuke_hands,ring1="Sirona's Ring",ring2="Lebeche Ring",
		back="Alaunus's Cape",waist="Hachirin-no-Obi",legs="Ebers Pant. +3",feet="Piety Duckbills +3"}

	sets.midcast.LightDayCure = {main="Queller Rod",sub="Sors Shield",ammo="Pemphredo Tathlum",
		head="Ebers Cap +3",neck="Incanter's Torque",ear1="Mendi. Earring",ear2="Glorious Earring",
		body="Ebers Bliaut +3",hands=gear.chironic_nuke_hands,ring1="Sirona's Ring",ring2="Lebeche Ring",
		back="Twilight Cape",waist="Hachirin-no-Obi",legs="Ebers Pant. +3",feet="Piety Duckbills +3"}

	sets.midcast.Curaga = {main="Queller Rod",sub="Sors Shield",ammo="Pemphredo Tathlum",
		head="Ebers Cap +3",neck="Incanter's Torque",ear1="Mendi. Earring",ear2="Glorious Earring",
		body="Theo. Bliaut +2",hands=gear.chironic_nuke_hands,ring1="Sirona's Ring",ring2="Lebeche Ring",
		back="Mending Cape",waist="Luminary Sash",legs="Ebers Pant. +3",feet="Piety Duckbills +3"}
		
	sets.midcast.LightWeatherCuraga = {main="Chatoyant Staff",sub="Enki Strap",ammo="Pemphredo Tathlum",
		head="Ebers Cap +3",neck="Incanter's Torque",ear1="Mendi. Earring",ear2="Glorious Earring",
		body="Theo. Bliaut +2",hands=gear.chironic_nuke_hands,ring1="Sirona's Ring",ring2="Lebeche Ring",
		back="Twilight Cape",waist="Hachirin-no-Obi",legs="Ebers Pant. +3",feet="Piety Duckbills +3"}
		
	sets.midcast.LightDayCuraga = {main="Queller Rod",sub="Sors Shield",ammo="Pemphredo Tathlum",
		head="Ebers Cap +3",neck="Incanter's Torque",ear1="Mendi. Earring",ear2="Glorious Earring",
		body="Ebers Bliaut +3",hands=gear.chironic_nuke_hands,ring1="Sirona's Ring",ring2="Lebeche Ring",
		back="Twilight Cape",waist="Hachirin-no-Obi",legs="Ebers Pant. +3",feet="Piety Duckbills +3"}

	sets.midcast.Cure.DT = {main="Queller Rod",sub="Genmei Shield",ammo="Pemphredo Tathlum",
		head="Ebers Cap +3",neck="Loricate Torque +1",ear1="Mendi. Earring",ear2="Glorious Earring",
		body="Bunzi's Robe",hands=gear.chironic_nuke_hands,ring1="Defending Ring",ring2="Lebeche Ring",
		back="Alaunus's Cape",waist="Luminary Sash",legs="Ebers Pant. +3",feet="Ebers Duckbills +2"}
		
	--Melee Curesets are used whenever your Weapons state is set to anything but None.
	sets.midcast.MeleeCure = {main="Queller Rod",sub="Sors Shield",ammo="Pemphredo Tathlum",
		head="Ebers Cap +3",neck="Incanter's Torque",ear1="Mendi. Earring",ear2="Glorious Earring",
		body=gear.chironic_nuke_body,hands="Bokwus Gloves",ring1="Sirona's Ring",ring2="Lebeche Ring",
		back="Mending Cape",waist="Luminary Sash",legs=gear.chironic_macc_legs,feet="Piety Duckbills +3"}
		
	sets.midcast.MeleeCureSolace = set_combine(sets.midcast.MeleeCure, {body="Ebers Bliaut +3",back="Alaunus's Cape",})
	sets.midcast.MeleeLightWeatherCure = set_combine(sets.midcast.MeleeCure, {back="Twilight Cape",waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightWeatherCureSolace = set_combine(sets.midcast.MeleeCure, {body="Ebers Bliaut +3",back="Alaunus's Cape",waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightDayCureSolace = set_combine(sets.midcast.MeleeCure, {body="Ebers Bliaut +3",back="Twilight Cape",waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightDayCure = set_combine(sets.midcast.MeleeCure, {back="Twilight Cape",waist="Hachirin-no-Obi"})
	sets.midcast.MeleeCuraga = set_combine(sets.midcast.MeleeCure, {})
	sets.midcast.MeleeLightWeatherCuraga = set_combine(sets.midcast.MeleeCure, {back="Twilight Cape",waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightDayCuraga = set_combine(sets.midcast.MeleeCure, {back="Twilight Cape",waist="Hachirin-no-Obi"})

	sets.midcast.CureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaut +3"})
	sets.midcast.LightWeatherCure.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.LightWeatherCureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaut +3",waist="Hachirin-no-Obi"})
	sets.midcast.LightDayCureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaut +3",waist="Hachirin-no-Obi"})
	sets.midcast.LightDayCure.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.Curaga.DT = set_combine(sets.midcast.Cure.DT, {})
	sets.midcast.LightWeatherCuraga.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.LightDayCuraga.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeCure.DT = set_combine(sets.midcast.Cure.DT, {})
	
	sets.midcast.MeleeCureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaut +3"})
	sets.midcast.MeleeLightWeatherCure.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightWeatherCureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaut +3",waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightDayCureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaut +3",waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightDayCure.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeCuraga.DT = set_combine(sets.midcast.Cure.DT, {})
	sets.midcast.MeleeLightWeatherCuraga.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightDayCuraga.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})

	sets.midcast.Cursna = {main=gear.grioavolr_fc_staff,sub="Clemency Grip",ammo="Hasty Tathlum",
		head="Ebers Cap +3",neck="Debilis Medallion",ear1="Meili Earring",ear2="Ebers Earring +1",
		body="Ebers Bliaut +3",hands="Fanatic Gloves",ring1="Haoma's Ring",ring2="Menelaus's Ring",
		back="Alaunus's Cape",waist="Bishop's Sash",legs="Th. Pantaloons +2",feet="Regal Pumps +1"}

	sets.midcast.StatusRemoval = {main=gear.grioavolr_fc_staff,sub="Clemency Grip",ammo="Pemphredo Tathlum",
		head="Ebers Cap +3",neck="Clr. Torque +1",ear1="Loquac. Earring",ear2="Malignance Earring",
		body="Inyanga Jubbah +2",hands="Fanatic Gloves",ring1="Kishar Ring",ring2="Lebeche Ring",
		back="Perimede Cape",waist="Embla Sash",legs="Ebers Pant. +3",feet="Regal Pumps +1"}
		
	sets.midcast.Erase = set_combine(sets.midcast.StatusRemoval, {neck="Clr. Torque +1"})

    -- 110 total Enhancing Magic Skill; caps even without Light Arts
	sets.midcast['Enhancing Magic'] = {main=gear.gada_enhancing_club,sub="Sors Shield",ammo="Pemphredo Tathlum",
		head="Telchine Cap",neck="Incanter's Torque",ear1="Calamitous Earring",ear2="Andoaa Earring",
		body="Telchine Chas.",hands="Telchine Gloves",ring1="Kishar Ring",ring2="Lebeche Ring",
		back="Mending Cape",waist="Embla Sash",legs="Telchine Braconi",feet="Telchine Pigaches"}

	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {neck="Nodens Gorget",waist="Siegel Sash"})

	sets.midcast.Auspice = set_combine(sets.midcast['Enhancing Magic'], {feet="Ebers Duckbills +2"})

	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {main="Vadose Rod",sub="Sors Shield",head=gear.chironic_nuke_head})

	sets.midcast.Regen = set_combine(sets.midcast['Enhancing Magic'], {main="Bolelabunga",sub="Sors Shield",head="Inyanga Tiara +2",body="Piety Bliaut +3",hands="Ebers Mitts +2"})
	
	sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {})
	sets.midcast.Protectra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
	sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {})
	sets.midcast.Shellra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
	
	sets.midcast.BarElement = {main="Beneficus",sub="Sors Shield",ammo="Pemphredo Tathlum",
		head="Ebers Cap +3",neck="Incanter's Torque",ear1="Calamitous Earring",ear2="Andoaa Earring",
		body="Ebers Bliaut +3",hands="Ebers Mitts +2",ring1="Kishar Ring",ring2="Lebeche Ring",
		back="Alaunus's Cape",waist="Embla Sash",legs="Piety Pantaln. +3",feet="Ebers Duckbills +2"}
		
	sets.midcast.BarStatus = set_combine(sets.midcast['Enhancing Magic'], {neck="Sroda Necklace"})

	sets.midcast.Impact = {main="Daybreak",sub="Sors Shield",ammo="Pemphredo Tathlum",
		head=empty,neck="Erra Pendant",ear1="Gwati Earring",ear2="Malignance Earring",
		body="Crepuscular Cloak",hands="Inyan. Dastanas +1",ring1="Evanescence Ring",ring2="Sangoma Ring",
		back="Alaunus's Cape",waist="Eschan Stone",legs=gear.chironic_macc_legs,feet=gear.chironic_treasure_feet}
		
	sets.midcast['Elemental Magic'] = {main="Bunzi's Rod",sub="Sors Shield",ammo="Ghastly Tathlum +1",
		head="Bunzi's Hat",neck="Baetyl Pendant",ear1="Friomisi Earring",ear2="Malignance Earring",
		body="Bunzi's Robe",hands="Bunzi's Gloves",ring1="Strendu Ring",ring2="Persis Ring",
		back="Alaunus's Cape",waist="Yamabuki-no-Obi",legs="Bunzi's Pants",feet="Bunzi's Sabots"}

	sets.midcast['Elemental Magic'].Resistant = {main="Daybreak",sub="Sors Shield",ammo="Pemphredo Tathlum",
		head=gear.chironic_nuke_head,neck="Sanctity Necklace",ear1="Hermetic Earring",ear2="Malignance Earring",
		body=gear.chironic_nuke_body,hands=gear.chironic_nuke_hands,ring1="Strendu Ring",ring2="Persis Ring",
		back="Alaunus's Cape",waist="Yamabuki-no-Obi",legs=gear.chironic_macc_legs,feet=gear.chironic_treasure_feet}

	sets.midcast['Divine Magic'] = {main="Daybreak",sub="Sors Shield",ammo="Ghastly Tathlum +1",
		head="Bunzi's Hat",neck="Baetyl Pendant",ear1="Friomisi Earring",ear2="Malignance Earring",
		body="Bunzi's Robe",hands="Bunzi's Gloves",ring1="Strendu Ring",ring2="Persis Ring",
		back="Alaunus's Cape",waist="Yamabuki-no-Obi",legs="Bunzi's Pants",feet="Bunzi's Sabots"}
		
	sets.midcast.Repose = {main="Daybreak",sub="Sors Shield",ammo="Pemphredo Tathlum",
		head="Theophany Cap +2",neck="Erra Pendant",ear1="Gwati Earring",ear2="Malignance Earring",
		body="Theo. Bliaut +2",hands="Theophany Mitts +2",ring1="Persis Ring",ring2="Sangoma Ring",
		back="Alaunus's Cape",waist="Luminary Sash",legs=gear.chironic_macc_legs,feet="Theo. Duckbills +2"}
		
	sets.midcast.Holy = {main="Daybreak",sub="Sors Shield",ammo="Pemphredo Tathlum",
		head=gear.chironic_nuke_head,neck="Baetyl Pendant",ear1="Friomisi Earring",ear2="Malignance Earring",
		body=gear.chironic_nuke_body,hands=gear.chironic_nuke_hands,ring1="Strendu Ring",ring2="Persis Ring",
		back="Alaunus's Cape",waist="Eschan Stone",legs=gear.chironic_macc_legs,feet=gear.chironic_treasure_feet}

	sets.midcast['Dark Magic'] = {main="Daybreak",sub="Sors Shield",ammo="Pemphredo Tathlum",
		head=gear.chironic_nuke_head,neck="Erra Pendant",ear1="Gwati Earring",ear2="Malignance Earring",
		body=gear.chironic_nuke_body,hands=gear.chironic_nuke_hands,ring1="Evanescence Ring",ring2="Persis Ring",
		back="Alaunus's Cape",waist="Eschan Stone",legs=gear.chironic_macc_legs,feet=gear.chironic_treasure_feet}

    sets.midcast.Drain = {main="Rubicundity",sub="Sors Shield",ammo="Pemphredo Tathlum",
        head=gear.chironic_nuke_head,neck="Erra Pendant",ear1="Gwati Earring",ear2="Malignance Earring",
        body=gear.chironic_nuke_body,hands=gear.chironic_nuke_hands,ring1="Evanescence Ring",ring2="Sangoma Ring",
        back="Alaunus's Cape",waist="Fucho-no-obi",legs=gear.chironic_macc_legs,feet=gear.chironic_treasure_feet}

    sets.midcast.Drain.Resistant = {main="Rubicundity",sub="Sors Shield",ammo="Pemphredo Tathlum",
        head=gear.chironic_nuke_head,neck="Erra Pendant",ear1="Gwati Earring",ear2="Malignance Earring",
        body=gear.chironic_nuke_body,hands=gear.chironic_nuke_hands,ring1="Evanescence Ring",ring2="Sangoma Ring",
        back="Alaunus's Cape",waist="Fucho-no-obi",legs=gear.chironic_macc_legs,feet=gear.chironic_treasure_feet}

    sets.midcast.Aspir = sets.midcast.Drain
	sets.midcast.Aspir.Resistant = sets.midcast.Drain.Resistant

	sets.midcast.Stun = {main=gear.grioavolr_fc_staff,sub="Clerisy Strap +1",ammo="Hasty Pinion +1",
		head=gear.chironic_nuke_head,neck="Clr. Torque +1",ear1="Gwati Earring",ear2="Malignance Earring",
		body="Inyanga Jubbah +2",hands="Fanatic Gloves",ring1="Kishar Ring",ring2="Prolix Ring",
		back="Alaunus's Cape",waist="Embla Sash",legs="Aya. Cosciales +2",feet="Regal Pumps +1"}

	sets.midcast.Stun.Resistant = {main="Daybreak",sub="Sors Shield",ammo="Pemphredo Tathlum",
		head=gear.chironic_nuke_head,neck="Sanctity Necklace",ear1="Gwati Earring",ear2="Malignance Earring",
		body=gear.chironic_nuke_body,hands=gear.chironic_nuke_hands,ring1="Evanescence Ring",ring2="Sangoma Ring",
		back="Alaunus's Cape",waist="Luminary Sash",legs=gear.chironic_macc_legs,feet=gear.chironic_treasure_feet}
		
	sets.midcast.Dispel = {main="Daybreak",sub="Sors Shield",ammo="Pemphredo Tathlum",
		head=gear.chironic_nuke_head,neck="Sanctity Necklace",ear1="Gwati Earring",ear2="Malignance Earring",
		body=gear.chironic_nuke_body,hands=gear.chironic_nuke_hands,ring1="Evanescence Ring",ring2="Sangoma Ring",
		back="Alaunus's Cape",waist="Luminary Sash",legs=gear.chironic_macc_legs,feet=gear.chironic_treasure_feet}
		
	sets.midcast.Dispelga = set_combine(sets.midcast.Dispel, {main="Daybreak",sub="Sors Shield"})

	sets.midcast['Enfeebling Magic'] = {main="Daybreak",sub="Sors Shield",ammo="Pemphredo Tathlum",
		head="Theophany Cap +2",neck="Erra Pendant",ear1="Gwati Earring",ear2="Malignance Earring",
		body="Theo. Bliaut +2",hands="Theophany Mitts +2",ring1="Persis Ring",ring2="Sangoma Ring",
		back="Alaunus's Cape",waist="Luminary Sash",legs=gear.chironic_macc_legs,feet="Theo. Duckbills +2"}

	sets.midcast['Enfeebling Magic'].Resistant = {main="Daybreak",sub="Sors Shield",ammo="Pemphredo Tathlum",
		head="Theophany Cap +2",neck="Erra Pendant",ear1="Gwati Earring",ear2="Malignance Earring",
		body="Theo. Bliaut +2",hands="Theophany Mitts +2",ring1="Persis Ring",ring2="Sangoma Ring",
		back="Alaunus's Cape",waist="Luminary Sash",legs=gear.chironic_macc_legs,feet="Theo. Duckbills +2"}
		
	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Diaga = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia II'] = sets.midcast['Enfeebling Magic']
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio II'] = sets.midcast['Enfeebling Magic']

    sets.midcast.ElementalEnfeeble = set_combine(sets.midcast['Enfeebling Magic'], {})
    sets.midcast.ElementalEnfeeble.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})

    -- Sets to return to when not performing an action.

    -- Resting sets
	sets.resting = {}

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
	sets.idle = {main="Mpaca's Staff",sub="Oneiros Grip",ammo="Homiliary",
		head="Befouled Crown",neck="Sibyl Scarf",ear1="Sanare Earring",ear2="Ethereal Earring",
		body="Ebers Bliaut +3",hands=gear.chironic_refresh_hands,ring1="Defending Ring",ring2="Shneddick Ring",
		back="Solemnity Cape",waist="Isa Belt",legs="Assid. Pants +1",feet=gear.chironic_refresh_feet}

	sets.idle.PDT = {main="Daybreak",sub="Genmei Shield",ammo="Staunch Tathlum +1",
		head="Nyame Helm",neck="Loricate Torque +1",ear1="Sanare Earring",ear2="Ethereal Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Shadow Ring",ring2="Shneddick Ring",
		back="Shadow Mantle",waist="Isa Belt",legs="Nyame Flanchard",feet="Nyame Sollerets"}
		
	sets.idle.MDT = {main="Daybreak",sub="Genmei Shield",ammo="Staunch Tathlum +1",
		head="Bunzi's Hat",neck="Warder's Charm",ear1="Sanare Earring",ear2="Ethereal Earring",
		body="Bunzi's Robe",hands="Bunzi's Gloves",ring1="Shadow Ring",ring2="Woltaris Ring",
		back="Alaunus's Cape",waist="Isa Belt",legs="Ebers Pant. +3",feet="Ebers Duckbills +2"}
		
	sets.idle.MEVA = {main="Daybreak",sub="Genmei Shield",ammo="Staunch Tathlum +1",
		head="Bunzi's Hat",neck="Warder's Charm",ear1="Sanare Earring",ear2="Ethereal Earring",
		body="Bunzi's Robe",hands="Bunzi's Gloves",ring1="Shadow Ring",ring2="Woltaris Ring",
		back="Alaunus's Cape",waist="Isa Belt",legs="Ebers Pant. +3",feet="Ebers Duckbills +2"}

    -- Defense sets

	sets.defense.PDT = {main="Daybreak",sub="Genmei Shield",ammo="Staunch Tathlum +1",
		head="Nyame Helm",neck="Loricate Torque +1",ear1="Sanare Earring",ear2="Ethereal Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Shadow Ring",ring2="Woltaris Ring",
		back="Shadow Mantle",waist="Isa Belt",legs="Nyame Flanchard",feet="Nyame Sollerets"}

	sets.defense.MDT = {main="Daybreak",sub="Genmei Shield",ammo="Staunch Tathlum +1",
		head="Bunzi's Hat",neck="Warder's Charm",ear1="Sanare Earring",ear2="Ethereal Earring",
		body="Bunzi's Robe",hands="Bunzi's Gloves",ring1="Shadow Ring",ring2="Woltaris Ring",
		back="Alaunus's Cape",waist="Isa Belt",legs="Ebers Pant. +3",feet="Ebers Duckbills +2"}

    sets.defense.MEVA = {main="Daybreak",sub="Genmei Shield",ammo="Staunch Tathlum +1",
		head="Bunzi's Hat",neck="Warder's Charm",ear1="Sanare Earring",ear2="Ethereal Earring",
		body="Bunzi's Robe",hands="Bunzi's Gloves",ring1="Shadow Ring",ring2="Woltaris Ring",
		back="Alaunus's Cape",waist="Isa Belt",legs="Ebers Pant. +3",feet="Ebers Duckbills +2"}
		
		-- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion

    -- Basic set for if no TP weapon is defined.
    sets.engaged = {}

    sets.engaged.Acc = {}

	sets.engaged.DW = {}

    sets.engaged.DW.Acc = {}

		-- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    sets.buff['Divine Caress'] = {hands="Ebers Mitts +2",back="Mending Cape"}

	sets.HPDown = {main="Queller Rod",sub="Genmei Shield",ammo="Homiliary",
		head="Wivre Hairpin",neck="Loricate Torque +1",ear1="Hirudinea Earring",ear2="Ethereal Earring",
		body="Councilor's Garb",hands="Hieros Mittens",ring1="Defending Ring",ring2="Persis Ring",
		back="Solemnity Cape",waist="Isa Belt",legs="",feet=""}

	sets.HPCure = {main="Queller Rod",sub="Sors Shield",ammo="Pemphredo Tathlum",
		head="Ebers Cap +3",neck="Nodens Gorget",ear1="Etiolation Earring",ear2="Odnowa Earring +1",
		body="Ebers Bliaut +3",hands="Bokwus Gloves",ring1="Sirona's Ring",ring2="Lebeche Ring",
		back="Twilight Cape",waist="Eschan Stone",legs="Piety Pantaln. +3",feet="Ebers Duckbills +2"}

	sets.buff.Doom = set_combine(sets.buff.Doom, {})

end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	set_macro_page(1, 1)
end

function user_job_lockstyle()
	if player.sub_job == 'SCH' then
		if state.Buff['Light Arts'] or state.Buff['Addendum: White'] then
			windower.chat.input('/lockstyleset 001')
		elseif state.Buff['Dark Arts'] or state.Buff['Addendum: Black'] then
			windower.chat.input('/lockstyleset 002')
		else
			windower.chat.input('/lockstyleset 003')
		end
	else
		windower.chat.input('/lockstyleset 003')
	end
	

	
end

autows_list = {['DualWeapons']='Realmrazer',['MeleeWeapons']='Realmrazer'}