function user_job_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal','Acc')
    state.HybridMode:options('Normal','DT')
	state.WeaponskillMode:options('Match','Proc')
	state.CastingMode:options('Normal','Resistant','Proc')
    state.IdleMode:options('Normal','PDT','MDT','MEVA')
    state.PhysicalDefenseMode:options('PDT','NukeLock')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('None','Naegling','DualAcc','DualWeapons','DualProcSword','DualPrime','DualMaxentius','EnspellOnly')
	state.BuffWeaponsMode = M{'Always','Never'}
	state.AutoBuffMode = M{['description'] = 'Auto Buff Mode','Off','Auto','AutoMelee','AutoMage','AutoTrial'}
	state.RecoverMode = M('Never','35%','60%','Always')
	
	gear.mnd_enfeebling_jse_back = {name="Sucellos's Cape",augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10',}}
	gear.str_wsd_jse_back = {name="Sucellos's Cape",augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}}
	gear.nuke_jse_back = {name="Sucellos's Cape",augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}}
	gear.stp_jse_back = {name="Sucellos's Cape",augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}}
	
		-- Additional local binds
	send_command('bind ^` gs c cycle ElementalMode')
	send_command('bind @` gs c cycle MagicBurstMode')
	send_command('bind ^@!` input /ja "Accession" <me>')
	send_command('bind ^backspace input /ja "Saboteur" <me>')
	send_command('bind !backspace input /ja "Spontaneity" <t>')
	send_command('bind @backspace input /ja "Composure" <me>')
	send_command('bind @f8 gs c toggle AutoNukeMode')
	send_command('bind != input /ja "Penury" <me>')
	send_command('bind @= input /ja "Parsimony" <me>')
	send_command('bind ^delete input /ja "Dark Arts" <me>')
	send_command('bind !delete input /ja "Addendum: Black" <me>')
	send_command('bind @delete input /ja "Manifestation" <me>')
	send_command('bind ^\\\\ input /ma "Protect V" <t>')
	send_command('bind @\\\\ input /ma "Shell V" <t>')
	send_command('bind !\\\\ input /ma "Reraise" <me>')
	send_command('bind @f10 gs c cycle RecoverMode')
	send_command('bind ^r gs c set skipprocweapons true;gs c reset weaponskillmode;gs c weapons Default;gs c set unlockweapons false')
	send_command('bind ^q gs c set weapons enspellonly;gs c set unlockweapons true')
	send_command('bind !r gs c set skipprocweapons true;gs c reset weaponskillmode;gs c set weapons none')
	send_command('bind !q gs c set skipprocweapons false;gs c set weapons DualProcSword;gs c set weaponskillmode proc')
	
	select_default_macro_book()
end

function init_gear_sets()
	--------------------------------------
	-- Start defining the sets
	--------------------------------------
	
	-- Precast Sets
	
	-- Precast sets to enhance JAs
	sets.precast.JA['Chainspell'] = {body="Viti. Tabard +1"}
	

	-- Waltz set (chr and vit)
	sets.precast.Waltz = {}
		
	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}

	-- Fast cast sets for spells
	
	sets.precast.FC = {main=gear.grioavolr_fc_staff,sub="Clerisy Strap +1",ammo="Impatiens",
		head="Atro. Chapeau +3",neck="Orunmila's Torque",ear1="Malignance Earring",ear2="Lethargy Earring",
		body="Viti. Tabard +1",hands="Gende. Gages +1",ring1="Kishar Ring",ring2="Lebeche Ring",
		back="Perimede Cape",waist="Witful Belt",legs="Aya. Cosciales +2",feet="Regal Pumps +1"}
		
	sets.precast.FC.Impact = set_combine(sets.precast.FC, {head=empty,body="Crepuscular Cloak"})
	sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {main="Daybreak",sub="Genmei Shield"})
       
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {range=empty,ammo="Oshasha's Treatise",
		head="Nyame Helm",neck="Fotia Gorget",ear1="Sherida Earring",ear2="Moonshade Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Sroda Ring",ring2="Cornelia's Ring",
		back=gear.str_wsd_jse_back,waist="Fotia Belt",legs="Nyame Flanchard",feet="Leth. Houseaux +3"}
		
	sets.precast.WS.Proc = 	{ammo="Ginsen",
		head="Malignance Chapeau",neck="Anu Torque",ear1="Sherida Earring",ear2="Brutal Earring",
		body="Ayanmo Corazza +2",hands="Malignance Gloves",ring1="Chirich Ring +1",ring2="Chirich Ring +1",
		back=gear.stp_jse_back,waist="Windbuffet Belt +1",legs="Malignance Tights",feet="Malignance Boots"}
	
	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Requiescat'] = {range=empty,ammo="Regal Gem",
		head="Nyame Helm",neck="Fotia Gorget",ear1="Sherida Earring",ear2="Brutal Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Epaminonda's Ring",ring2="Cornelia's Ring",
		back="Atheling Mantle",waist="Fotia Belt",legs="Nyame Flanchard",feet="Nyame Sollerets"}

	sets.precast.WS['Chant Du Cygne'] = {range=empty,ammo="Ginsen",
		head="Nyame Helm",neck="Fotia Gorget",ear1="Sherida Earring",ear2="Brutal Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Epaminonda's Ring",ring2="Cornelia's Ring",
		back=gear.str_wsd_jse_back,waist="Fotia Belt",legs="Nyame Flanchard",feet="Leth. Houseaux +3"}
		
	sets.precast.WS['Evisceration'] = sets.precast.WS['Chant Du Cygne']

	sets.precast.WS['Savage Blade'] = {range=empty,ammo="Oshasha's Treatise",
		head="Nyame Helm",neck="Rep. Plat. Medal",ear1="Sherida Earring",ear2="Moonshade Earring",
		body="Nyame Mail",hands="Atrophy Gloves +3",ring1="Sroda Ring",ring2="Cornelia's Ring",
		back=gear.str_wsd_jse_back,waist="Cornelia's Belt",legs="Nyame Flanchard",feet="Leth. Houseaux +3"}
		
	sets.precast.WS['Sanguine Blade'] = {range=empty,ammo="Sroda Tathlum",
		head="Pixie Hairpin +1",neck="Fotia Gorget",ear1="Malignance Earring",ear2="Moonshade Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Epaminonda's Ring",ring2="Cornelia's Ring",
		back=gear.str_wsd_jse_back,waist="Orpheus's Sash",legs="Nyame Flanchard",feet="Leth. Houseaux +3"}
		
	sets.precast.WS['Seraph Blade'] = {range=empty,ammo="Sroda Tathlum",
		head="Nyame Helm",neck="Fotia Gorget",ear1="Malignance Earring",ear2="Moonshade Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Epaminonda's Ring",ring2="Cornelia's Ring",
		back=gear.str_wsd_jse_back,waist="Orpheus's Sash",legs="Nyame Flanchard",feet="Leth. Houseaux +3"}
		
	sets.precast.WS['Shining Strike'] = sets.precast.WS['Seraph Blade'] 
		
	sets.precast.WS['Aeolian Edge'] = {range=empty,ammo="Sroda Tathlum",
		head="Nyame Helm",neck="Fotia Gorget",ear1="Malignance Earring",ear2="Moonshade Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Epaminonda's Ring",ring2="Cornelia's Ring",
		back=gear.str_wsd_jse_back,waist="Orpheus's Sash",legs="Nyame Flanchard",feet="Leth. Houseaux +3"}
		
	sets.precast.WS['Red Lotus Blade'] = sets.precast.WS['Aeolian Edge']

	-- Midcast Sets

	sets.TreasureHunter = set_combine(sets.TreasureHunter, {feet=gear.chironic_treasure_feet})
	
	-- Gear that converts elemental damage done to recover MP.	
	sets.RecoverMP = {body="Seidr Cotehardie"}
	
	sets.midcast.FastRecast = {main=gear.grioavolr_fc_staff,sub="Clerisy Strap +1",ammo="Hasty Pinion +1",
		head="Atro. Chapeau +3",neck="Orunmila's Torque",ear1="Malignance Earring",ear2="Lethargy Earring",
		body="Viti. Tabard +1",hands="Gende. Gages +1",ring1="Kishar Ring",ring2="Lebeche Ring",
		back="Perimede Cape",waist="Witful Belt",legs="Aya. Cosciales +2",feet="Regal Pumps +1"}

    sets.midcast.Cure = {main="Daybreak",sub="Sors Shield",range=empty,ammo="Regal Gem",
        head="Gende. Caubeen +1",neck="Incanter's Torque",ear1="Meili Earring",ear2="Mendi. Earring",
        body="Bunzi's Robe",hands="Gende. Gages +1",ring1="Janniston Ring",ring2="Menelaus's Ring",
        back=gear.mnd_enfeebling_jse_back,waist="Luminary Sash",legs="Atrophy Tabard +1",feet="Medium's Sabots"}
		
    sets.midcast.LightWeatherCure = {main="Daybreak",sub="Sors Shield",range=empty,ammo="Regal Gem",
        head="Gende. Caubeen +1",neck="Incanter's Torque",ear1="Meili Earring",ear2="Mendi. Earring",
        body="Bunzi's Robe",hands="Gende. Gages +1",ring1="Janniston Ring",ring2="Menelaus's Ring",
        back=gear.mnd_enfeebling_jse_back,waist="Luminary Sash",legs="Carmine Cuisses +1",feet="Medium's Sabots"}
		
		--Cureset for if it's not light weather but is light day.
    sets.midcast.LightDayCure = {main="Daybreak",sub="Sors Shield",range=empty,ammo="Regal Gem",
        head="Gende. Caubeen +1",neck="Incanter's Torque",ear1="Meili Earring",ear2="Mendi. Earring",
        body="Gende. Bliaut +1",hands="Gende. Gages +1",ring1="Janniston Ring",ring2="Menelaus's Ring",
        back=gear.mnd_enfeebling_jse_back,waist="Hachirin-no-Obi",legs="Carmine Cuisses +1",feet="Medium's Sabots"}
		
	sets.midcast.Cursna = {main=gear.grioavolr_fc_staff,sub="Curatio Grip",range=empty,ammo="Hasty Pinion +1",
        head="Vanya Hood",neck="Debilis Medallion",ear1="Meili Earring",ear2="Mendi. Earring",
        body="Viti. Tabard +1",hands="Hieros Mittens",ring1="Haoma's Ring",ring2="Menelaus's Ring",
        back=gear.mnd_enfeebling_jse_back,waist="Bishop's Sash",legs="Carmine Cuisses +1",feet="Vanya Clogs"}

	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {main=gear.grioavolr_fc_staff,sub="Clemency Grip"})
		
	sets.midcast.Curaga = sets.midcast.Cure
	sets.Self_Healing = {neck="Phalaina Locket",ear1="Etiolation Earring",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Cure_Received = {neck="Phalaina Locket",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = {waist="Gishdubar Sash"}
	sets.Self_Phalanx = {main="Sakpata's Sword",head="Taeon Chapeau",body="Taeon Tabard",hands="Taeon Gloves",legs="Taeon Tights",feet="Taeon Boots",ammo="Staunch Tathlum +1"}
	sets.Self_Phalanx.DW = {main="Sakpata's Sword",sub="Egeking"}

	sets.midcast['Enhancing Magic'] = {main="Daybreak",sub="Sors Shield",ammo="Pemphredo Tathlum",
		head="Telchine Cap",neck="Dls. Torque +2",ear1="Andoaa Earring",ear2="Lethargy Earring",
		body="Telchine Chas.",hands="Atrophy Gloves +3",ring1="Kishar Ring",ring2="Lebeche Ring",
		back="Ghostfyre Cape",waist="Embla Sash",legs="Telchine Braconi",feet="Leth. Houseaux +3"}

	--Atrophy Gloves are better than Lethargy for me despite the set bonus for duration on others.		
	sets.buff.ComposureOther = {head="Leth. Chappel +3",
		body="Lethargy Sayon +3",
		legs="Leth. Fuseau +3",feet="Leth. Houseaux +3"}
		
	--Red Mage enhancing sets are handled in a different way from most, layered on due to the way Composure works
	--Don't set combine a full set with these spells, they should layer on Enhancing Set > Composure (If Applicable) > Spell
	sets.EnhancingSkill = {main="Pukulatmuj +1",sub="Sors Shield",
	head="Befouled Crown",neck="Incanter's Torque",ear1="Andoaa Earring",
	body="Viti. Tabard +1",hands="Viti. Gloves +1",
	back="Ghostfyre Cape",legs="Atrophy Tights +1",feet="Leth. Houseaux +3"}
	
	sets.midcast.Refresh = {head="Amalric Coif",body="Atrophy Tabard +2",legs="Leth. Fuseau +3"}
	sets.midcast.Aquaveil = {head="Amalric Coif",hands="Regal Cuffs",waist="Emphatikos Rope",legs="Shedir Seraweels"}
	sets.midcast.BarElement = {legs="Shedir Seraweels"}
	sets.midcast.Temper = sets.EnhancingSkill
	sets.midcast.Temper.DW = {main="Pukulatmuj +1",sub="Pukulatmuj"}
	sets.midcast.Enspell = sets.EnhancingSkill
	sets.midcast.Enspell.DW = {main="Pukulatmuj +1",sub="Pukulatmuj"}
	sets.midcast.BoostStat = {}
	sets.midcast.Stoneskin = {neck="Nodens Gorget",waist="Siegel Sash"}
	sets.midcast.Protect = {ring2="Sheltered Ring"}
	sets.midcast.Shell = {ring2="Sheltered Ring"}
	sets.midcast.Phalanx = {head="Taeon Chapeau",body="Taeon Tabard",hands="Taeon Gloves",legs="Taeon Tights",feet="Taeon Boots",ammo="Staunch Tathlum +1"}
	sets.midcast.Phalanx.DW = {}
	sets.midcast.Regen = {main="Bolelabunga",sub="Sors Shield"}
	
	sets.midcast['Enfeebling Magic'] = {main="Bunzi's Rod",sub="Sors Shield",range=empty,ammo="Regal Gem",
		head="Leth. Chappel +3",neck="Dls. Torque +2",ear1="Malignance Earring",ear2="Gwati Earring",
		body="Lethargy Sayon +3",hands="Leth. Ganth. +3",ring1="Globidonta Ring",ring2="Metamor. Ring +1",
		back=gear.mnd_enfeebling_jse_back,waist="Luminary Sash",legs=gear.chironic_macc_legs,feet="Vitiation Boots +3"}
		
	sets.midcast['Enfeebling Magic'].Resistant = {main="Bunzi's Rod",sub="Sors Shield",range=empty,ammo="Regal Gem",
		head="Leth. Chappel +3",neck="Dls. Torque +2",ear1="Malignance Earring",ear2="Gwati Earring",
		body="Lethargy Sayon +3",hands="Leth. Ganth. +3",ring1="Sangoma Ring",ring2="Metamor. Ring +1",
		back=gear.mnd_enfeebling_jse_back,waist="Luminary Sash",legs=gear.chironic_macc_legs,feet="Leth. Houseaux +3"}
		
	sets.midcast['Enfeebling Magic'].DW = {main="Bunzi's Rod",sub="Maxentius"}
		
	sets.midcast.Sleep = {main="Bunzi's Rod",sub="Sors Shield",range=empty,ammo="Regal Gem",
		head="Leth. Chappel +3",neck="Dls. Torque +2",ear1="Malignance Earring",ear2="Gwati Earring",
		body="Lethargy Sayon +3",hands="Leth. Ganth. +3",ring1="Kishar Ring",ring2="Metamor. Ring +1",
		back=gear.mnd_enfeebling_jse_back,waist="Acuity Belt +1",legs="Leth. Fuseau +3",feet="Leth. Houseaux +3"} --Obstinate Sash
		
	sets.midcast.Bind = sets.midcast.Sleep
	sets.midcast.Break = sets.midcast.Sleep
	sets.midcast['Dia III'] = sets.midcast.Sleep
	sets.midcast['Bio III'] = sets.midcast.Sleep
	sets.midcast.Inundation = sets.midcast.Sleep
	
	sets.midcast.Dia = set_combine(sets.midcast.Sleep, sets.TreasureHunter)
	sets.midcast.Diaga = set_combine(sets.midcast.Sleep, sets.TreasureHunter)
	sets.midcast.Bio = set_combine(sets.midcast.Sleep, sets.TreasureHunter)
		
	sets.midcast.Sleep.Resistant = {main="Bunzi's Rod",sub="Sors Shield",range=empty,ammo="Regal Gem",
		head="Leth. Chappel +3",neck="Dls. Torque +2",ear1="Malignance Earring",ear2="Gwati Earring",
		body="Lethargy Sayon +3",hands="Leth. Ganth. +3",ring1="Sangoma Ring",ring2="Metamor. Ring +1",
		back=gear.mnd_enfeebling_jse_back,waist="Acuity Belt +1",legs=gear.chironic_macc_legs,feet="Leth. Houseaux +3"}
		
	sets.midcast.Bind.Resistant = sets.midcast.Sleep.Resistant
	sets.midcast.Break.Resistant = sets.midcast.Sleep.Resistant
	
	sets.midcast.Sleep.DW = {main="Bunzi's Rod",sub="Maxentius"}
	sets.midcast.Bind.DW = sets.midcast.Sleep.DW
	sets.midcast.Break.DW = sets.midcast.Sleep.DW

	sets.midcast.Dispel = {main="Bunzi's Rod",sub="Sors Shield",range=empty,ammo="Regal Gem",
		head="Leth. Chappel +3",neck="Dls. Torque +2",ear1="Malignance Earring",ear2="Gwati Earring",
		body="Lethargy Sayon +3",hands="Leth. Ganth. +3",ring1="Metamor. Ring +1",ring2="Sangoma Ring",
		back=gear.mnd_enfeebling_jse_back,waist="Luminary Sash",legs=gear.chironic_macc_legs,feet="Leth. Houseaux +3"}
		
	sets.midcast.Dispel.DW = {main="Bunzi's Rod",sub="Maxentius"}
	sets.midcast.Dispelga = set_combine(sets.midcast.Dispel, {main="Daybreak",sub="Sor's Shield"})
	sets.midcast.Dispelga.DW = {main="Daybreak",sub="Bunzi's Rod"}
	
	sets.midcast.Frazzle = {main="Daybreak",sub="Sors Shield",range=empty,ammo="Regal Gem",
		head="Leth. Chappel +3",neck="Dls. Torque +2",ear1="Malignance Earring",ear2="Gwati Earring",
		body="Lethargy Sayon +3",hands="Leth. Ganth. +3",ring1="Globidonta Ring",ring2="Metamor. Ring +1",
		back=gear.mnd_enfeebling_jse_back,waist="Luminary Sash",legs=gear.chironic_macc_legs,feet="Vitiation Boots +3"}
		
	sets.midcast.Distract = sets.midcast.Frazzle
		
	sets.midcast.Frazzle.Resistant = {main="Daybreak",sub="Sors Shield",range=empty,ammo="Regal Gem",
		head="Leth. Chappel +3",neck="Dls. Torque +2",ear1="Malignance Earring",ear2="Gwati Earring",
		body="Lethargy Sayon +3",hands="Leth. Ganth. +3",ring1="Globidonta Ring",ring2="Metamor. Ring +1",
		back=gear.mnd_enfeebling_jse_back,waist="Luminary Sash",legs=gear.chironic_macc_legs,feet="Leth. Houseaux +3"}
		
	sets.midcast.Distract.Resistant = sets.midcast.Frazzle.Resistant
		
	sets.midcast['Frazzle II'] = sets.midcast.Frazzle.Resistant
	sets.midcast.Frazzle.DW = {main="Bunzi's Rod",sub="Daybreak"}
	sets.midcast.Distract.DW = sets.midcast.Frazzle.DW
	
	sets.midcast.Addle = {main="Daybreak",sub="Sors Shield",range=empty,ammo="Regal Gem",
		head="Leth. Chappel +3",neck="Dls. Torque +2",ear1="Malignance Earring",ear2="Gwati Earring",
		body="Lethargy Sayon +3",hands="Leth. Ganth. +3",ring1="Globidonta Ring",ring2="Metamor. Ring +1",
		back=gear.mnd_enfeebling_jse_back,waist="Luminary Sash",legs=gear.chironic_macc_legs,feet="Vitiation Boots +3"}
		
	sets.midcast.Paralyze = sets.midcast.Addle
	sets.midcast.Slow = sets.midcast.Addle
	
	sets.midcast.Addle.Resistant = {main="Daybreak",sub="Sors Shield",range=empty,ammo="Regal Gem",
		head="Leth. Chappel +3",neck="Dls. Torque +2",ear1="Malignance Earring",ear2="Gwati Earring",
		body="Lethargy Sayon +3",hands="Leth. Ganth. +3",ring1="Globidonta Ring",ring2="Metamor. Ring +1",
		back=gear.mnd_enfeebling_jse_back,waist="Luminary Sash",legs=gear.chironic_macc_legs,feet="Leth. Houseaux +3"}
		
	sets.midcast.Paralyze.Resistant = sets.midcast.Addle.Resistant
	sets.midcast.Slow.Resistant = sets.midcast.Addle.Resistant
	
	sets.midcast.Addle.DW = {main="Bunzi's Rod",sub="Daybreak"}
	sets.midcast.Paralyze.DW = sets.midcast.Addle.DW
	sets.midcast.Slow.DW = sets.midcast.Addle.DW
	
	sets.midcast.Gravity = {main="Bunzi's Rod",sub="Sors Shield",range=empty,ammo="Regal Gem",
		head="Leth. Chappel +3",neck="Dls. Torque +2",ear1="Malignance Earring",ear2="Gwati Earring",
		body="Lethargy Sayon +3",hands="Leth. Ganth. +3",ring1="Kishar Ring",ring2="Metamor. Ring +1",
		back=gear.mnd_enfeebling_jse_back,waist="Acuity Belt +1",legs="Leth. Fuseau +3",feet="Leth. Houseaux +3"}
		
	sets.midcast.Gravity.Resistant = {main="Bunzi's Rod",sub="Sors Shield",range=empty,ammo="Regal Gem",
		head="Leth. Chappel +3",neck="Dls. Torque +2",ear1="Malignance Earring",ear2="Gwati Earring",
		body="Lethargy Sayon +3",hands="Leth. Ganth. +3",ring1="Kishar Ring",ring2="Metamor. Ring +1",
		back=gear.mnd_enfeebling_jse_back,waist="Acuity Belt +1",legs="Leth. Fuseau +3",feet="Leth. Houseaux +3"}
		
	sets.midcast.Gravity.DW = {main="Bunzi's Rod",sub="Maxentius"}
	
	sets.midcast.Blind = {main="Bunzi's Rod",sub="Sors Shield",range=empty,ammo="Regal Gem",
		head="Leth. Chappel +3",neck="Dls. Torque +2",ear1="Malignance Earring",ear2="Gwati Earring",
		body="Lethargy Sayon +3",hands="Leth. Ganth. +3",ring1="Kishar Ring",ring2="Metamor. Ring +1",
		back=gear.mnd_enfeebling_jse_back,waist="Acuity Belt +1",legs="Leth. Fuseau +3",feet="Leth. Houseaux +3"}
		
	sets.midcast.Blind.Resistant = {main="Bunzi's Rod",sub="Sors Shield",range=empty,ammo="Regal Gem",
		head="Leth. Chappel +3",neck="Dls. Torque +2",ear1="Malignance Earring",ear2="Gwati Earring",
		body="Lethargy Sayon +3",hands="Leth. Ganth. +3",ring1="Kishar Ring",ring2="Metamor. Ring +1",
		back=gear.mnd_enfeebling_jse_back,waist="Acuity Belt +1",legs="Leth. Fuseau +3",feet="Leth. Houseaux +3"}
		
	sets.midcast.Blind.DW = {main="Bunzi's Rod",sub="Maxentius"}
	
	sets.midcast.Silence = {main="Bunzi's Rod",sub="Sors Shield",range=empty,ammo="Regal Gem",
		head="Leth. Chappel +3",neck="Dls. Torque +2",ear1="Malignance Earring",ear2="Gwati Earring",
		body="Lethargy Sayon +3",hands="Leth. Ganth. +3",ring1="Kishar Ring",ring2="Metamor. Ring +1",
		back=gear.mnd_enfeebling_jse_back,waist="Acuity Belt +1",legs="Leth. Fuseau +3",feet="Leth. Houseaux +3"}
		
	sets.midcast.Silence.Resistant = {main="Bunzi's Rod",sub="Sors Shield",range=empty,ammo="Regal Gem",
		head="Leth. Chappel +3",neck="Dls. Torque +2",ear1="Malignance Earring",ear2="Gwati Earring",
		body="Lethargy Sayon +3",hands="Leth. Ganth. +3",ring1="Kishar Ring",ring2="Metamor. Ring +1",
		back=gear.mnd_enfeebling_jse_back,waist="Acuity Belt +1",legs="Leth. Fuseau +3",feet="Leth. Houseaux +3"}
		
	sets.midcast.Silence.DW = {main="Bunzi's Rod",sub="Daybreak"}
	
	--After Bunzi's is augmented it will probably win on low-tier nukes.
	sets.midcast['Elemental Magic'] = {main="Bunzi's Rod",sub="Sors Shield",ammo="Ghastly Tathlum +1",
		head="Leth. Chappel +3",neck="Baetyl Pendant",ear1="Malignance Earring",ear2="Friomisi Earring",
		body="Lethargy Sayon +3",hands="Leth. Ganth. +3",ring1="Strendu Ring",ring2="Metamor. Ring +1",
		back=gear.nuke_jse_back,waist="Acuity Belt +1",legs="Leth. Fuseau +3",feet="Leth. Houseaux +3"}
		
    sets.midcast['Elemental Magic'].Resistant = {main="Bunzi's Rod",sub="Sors Shield",ammo="Ghastly Tathlum +1",
		head="Leth. Chappel +3",neck="Sibyl Scarf",ear1="Malignance Earring",ear2="Friomisi Earring",
		body="Lethargy Sayon +3",hands="Leth. Ganth. +3",ring1="Strendu Ring",ring2="Metamor. Ring +1",
		back=gear.nuke_jse_back,waist="Acuity Belt +1",legs="Leth. Fuseau +3",feet="Leth. Houseaux +3"}
		
    sets.midcast['Elemental Magic'].Proc = {main=empty,sub=empty,range=empty,ammo="Impatiens",
        head="Vanya Hood",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
        body="Zendik Robe",hands="Gende. Gages +1",ring1="Kishar Ring",ring2="Prolix Ring",
        back="Swith Cape +1",waist="Witful Belt",legs="Psycloth Lappas",feet="Regal Pumps +1"}
		
	sets.midcast['Elemental Magic'].HighTierNuke = {main="Bunzi's Rod",sub="Sors Shield",ammo="Ghastly Tathlum +1",
		head="Leth. Chappel +3",neck="Sibyl Scarf",ear1="Malignance Earring",ear2="Friomisi Earring",
		body="Lethargy Sayon +3",hands="Leth. Ganth. +3",ring1="Strendu Ring",ring2="Metamor. Ring +1",
		back=gear.nuke_jse_back,waist="Acuity Belt +1",legs="Leth. Fuseau +3",feet="Leth. Houseaux +3"}
		
	sets.midcast['Elemental Magic'].HighTierNuke.Resistant = {main="Bunzi's Rod",sub="Sors Shield",ammo="Ghastly Tathlum +1",
		head="Leth. Chappel +3",neck="Sibyl Scarf",ear1="Malignance Earring",ear2="Friomisi Earring",
		body="Lethargy Sayon +3",hands="Leth. Ganth. +3",ring1="Strendu Ring",ring2="Metamor. Ring +1",
		gear.nuke_jse_back,waist="Acuity Belt +1",legs="Leth. Fuseau +3",feet="Leth. Houseaux +3"}
	
	-- Gear for Magic Burst mode.
    sets.MagicBurst = {}
	sets.midcast['Elemental Magic'].DW = {main="Bunzi's Rod",sub="Daybreak"}
		
	sets.midcast.Impact = {main="Daybreak",sub="Sors Shield",range=empty,ammo="Regal Gem",
		head=empty,neck="Dls. Torque +2",ear1="Malignance Earring",ear2="Gwati Earring",
		body="Crepuscular Cloak",hands="Bunzi's Gloves",ring1="Metamor. Ring +1",ring2="Sangoma Ring",
		back=gear.mnd_enfeebling_jse_back,waist="Luminary Sash",legs="Bunzi's Pants",feet="Bunzi's Sabots"}

	sets.midcast['Dark Magic'] = {main="Daybreak",sub="Sors Shield",range=empty,ammo="Regal Gem",
		head="Bunzi's Hat",neck="Erra Pendant",ear1="Malignance Earring",ear2="Gwati Earring",
		body="Bunzi's Robe",hands="Bunzi's Gloves",ring1="Metamor. Ring +1",ring2="Sangoma Ring",
		back=gear.mnd_enfeebling_jse_back,waist="Luminary Sash",legs="Bunzi's Pants",feet="Bunzi's Sabots"}

    sets.midcast.Drain = {main="Rubicundity",sub="Ammurapi Shield",range="Kaja Bow",ammo=empty,
        head="Pixie Hairpin +1",neck="Erra Pendant",ear1="Malignance Earring",ear2="Regal Earring",
        body=gear.merlinic_nuke_body,hands=gear.chironic_enfeeble_hands,ring1="Evanescence Ring",ring2="Archon Ring",
        back=gear.nuke_jse_back,waist="Fucho-no-obi",legs="Chironic Hose",feet=gear.merlinic_aspir_feet}

	sets.midcast.Aspir = sets.midcast.Drain
	
	sets.midcast['Absorb-TP'] = {main="Rubicundity",sub="Ammurapi Shield",range="Kaja Bow",ammo=empty,
        head="Pixie Hairpin +1",neck="Erra Pendant",ear1="Malignance Earring",ear2="Regal Earring",
        body=gear.merlinic_nuke_body,hands=gear.chironic_enfeeble_hands,ring1="Metamor. Ring +1",ring2="Sangoma Ring",
        back=gear.nuke_jse_back,waist="Fucho-no-obi",legs="Chironic Hose",feet=gear.merlinic_aspir_feet}
		
	sets.midcast.Stun = {main=gear.grioavolr_fc_staff,sub="Clerisy Strap +1",range=empty,ammo="Regal Gem",
		head="Bunzi's Hat",neck="Dls. Torque +2",ear1="Malignance Earring",ear2="Gwati Earring",
		body="Bunzi's Robe",hands="Bunzi's Gloves",ring1="Metamor. Ring +1",ring2="Sangoma Ring",
		back=gear.mnd_enfeebling_jse_back,waist="Luminary Sash",legs="Bunzi's Pants",feet="Bunzi's Sabots"}
		
	sets.midcast.Stun.Resistant = {main="Bunzi's Rod",sub="Sors Shield",range=empty,ammo="Regal Gem",
		head="Bunzi's Hat",neck="Dls. Torque +2",ear1="Malignance Earring",ear2="Gwati Earring",
		body="Bunzi's Robe",hands="Bunzi's Gloves",ring1="Metamor. Ring +1",ring2="Sangoma Ring",
		back=gear.mnd_enfeebling_jse_back,waist="Luminary Sash",legs="Bunzi's Pants",feet="Bunzi's Sabots"}
		
	sets.midcast.Stun.DW = {main="Bunzi's Rod",sub="Maxentius"}

	-- Sets for special buff conditions on spells.
		
	sets.buff.Saboteur = {hands="Leth. Ganth. +3"}
	
	sets.HPDown = {main="Queller Rod",sub="Genmei Shield",ammo="Homiliary",
		head="Wivre Hairpin",neck="Loricate Torque +1",ear1="Hirudinea Earring",ear2="Ethereal Earring",
		body="Councilor's Garb",hands="Hieros Mittens",ring1="Defending Ring",ring2="Metamor. Ring +1",
		back="Solemnity Cape",waist="Plat. Mog. Belt",legs="",feet=""}
		
    sets.HPCure = {main="Queller Rod",sub="Sors Shield",ammo="Pemphredo Tathlum",
		head="Nyame Helm",neck="Sanctity Necklace",ear1="Etiolation Earring",ear2="Odnowa Earring +1",
		body="Bunzi's Robe",hands="Bokwus Gloves",ring1="Sirona's Ring",ring2="Kunaji Ring",
		back="Engulfer Cape +1",waist="Gishdubar Sash",legs="Nyame Flanchard",feet="Medium's Sabots"}
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {})

	-- Sets to return to when not performing an action.
	
	-- Resting sets
	sets.resting = {main="Chatoyant Staff",sub="Oneiros Grip",range=empty,ammo="Impatiens",
		head="Viti. Chapeau +3",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
		body="Lethargy Sayon +3",hands=gear.merlinic_refresh_hands,ring1="Defending Ring",ring2="Sheltered Ring",
		back="Umbra Cape",waist="Flume Belt +1",legs="Lengo Pants",feet=gear.chironic_refresh_feet}
	

	-- Idle sets
	sets.idle = {main="Mpaca's Staff",sub="Oneiros Grip",ammo="Homiliary",
		head="Viti. Chapeau +1",neck="Sibyl Scarf",ear1="Etiolation Earring",ear2="Ethereal Earring",
		body="Lethargy Sayon +3",hands=gear.chironic_refresh_hands,ring1="Defending Ring",ring2="Shadow Ring",
		back="Solemnity Cape",waist="Plat. Mog. Belt",legs="Bunzi's Pants",feet=gear.chironic_refresh_feet}
		
	sets.idle.PDT = {main="Daybreak",sub="Genmei Shield",ammo="Staunch Tathlum +1",
		head="Nyame Helm",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Defending Ring",ring2="Shadow Ring",
		back="Shadow Mantle",waist="Plat. Mog. Belt",legs="Nyame Flanchard",feet="Nyame Sollerets"}
		
	sets.idle.MDT = {main="Daybreak",sub="Genmei Shield",range=empty,ammo="Staunch Tathlum +1",
		head="Bunzi's Hat",neck="Warder's Charm",ear1="Etiolation Earring",ear2="Sanare Earring",
		body="Bunzi's Robe",hands="Bunzi's Gloves",ring1="Defending Ring",ring2="Shadow Ring",
		back="Engulfer Cape +1",waist="Plat. Mog. Belt",legs="Bunzi's Pants",feet="Bunzi's Sabots"}
		
	sets.idle.MEVA = {main="Daybreak",sub="Genmei Shield",range=empty,ammo="Staunch Tathlum +1",
		head="Bunzi's Hat",neck="Warder's Charm",ear1="Etiolation Earring",ear2="Sanare Earring",
		body="Bunzi's Robe",hands="Bunzi's Gloves",ring1="Defending Ring",ring2="Shadow Ring",
		back=gear.mnd_enfeebling_jse_back,waist="Plat. Mog. Belt",legs="Bunzi's Pants",feet="Bunzi's Sabots"}
	
	sets.idle.DTHippo = set_combine(sets.idle.PDT, {back="Umbra Cape",legs="Carmine Cuisses +1",feet="Hippo. Socks +1"})
	
	-- Defense sets
	sets.defense.PDT = {main="Daybreak",sub="Genmei Shield",ammo="Staunch Tathlum +1",
		head="Nyame Helm",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Defending Ring",ring2="Shadow Ring",
		back="Shadow Mantle",waist="Plat. Mog. Belt",legs="Nyame Flanchard",feet="Nyame Sollerets"}

	sets.defense.NukeLock = sets.midcast['Elemental Magic']
		
	sets.defense.MDT = {main="Daybreak",sub="Genmei Shield",range=empty,ammo="Staunch Tathlum +1",
		head="Bunzi's Hat",neck="Warder's Charm",ear1="Etiolation Earring",ear2="Sanare Earring",
		body="Bunzi's Robe",hands="Bunzi's Gloves",ring1="Defending Ring",ring2="Shadow Ring",
		back="Engulfer Cape +1",waist="Plat. Mog. Belt",legs="Bunzi's Pants",feet="Bunzi's Sabots"}
		
    sets.defense.MEVA = {main="Daybreak",sub="Genmei Shield",range=empty,ammo="Staunch Tathlum +1",
		head="Bunzi's Hat",neck="Warder's Charm",ear1="Etiolation Earring",ear2="Sanare Earring",
		body="Bunzi's Robe",hands="Bunzi's Gloves",ring1="Defending Ring",ring2="Shadow Ring",
		back=gear.mnd_enfeebling_jse_back,waist="Plat. Mog. Belt",legs="Bunzi's Pants",feet="Bunzi's Sabots"}
		
	sets.Kiting = {legs="Carmine Cuisses +1"}
	sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.latent_refresh_grip = {sub="Oneiros Grip"}
	sets.DayIdle = {}
	sets.NightIdle = {}
	
	-- Weapons sets
	sets.weapons.Naegling = {main="Naegling",sub="Genmei Shield",range=empty}
	sets.weapons.DualWeapons = {main="Naegling",sub="Machaera +3",range=empty}
	sets.weapons.DualAcc = {main="Naegling",sub="Gleti's Knife",range=empty}
	sets.weapons.DualPrime = {main="Mpu Gandring",sub="Gleti's Knife",range=empty}
	sets.weapons.DualEvisceration = {main="Tauret",sub="Gleti's Knife",range=empty}
	sets.weapons.DualAeolian = {main="Tauret",sub="Bunzi's Rod",range=empty}
	sets.weapons.DualProcSword = {main="Kyukoto",sub="Qutrub Knife",range=empty}
	sets.weapons.EnspellOnly = {main="Qutrub Knife",sub="Kyukoto",range="Kaja Bow",ammo="Beetle Arrow"}
	sets.weapons.EnspellDW = {main="Blurred Knife +1",sub="Atoyac",range="Kaja Bow",ammo="Beetle Arrow"}
	sets.weapons.DualBow = {main="Naegling",sub="Tauret",range="Kaja Bow"}
	sets.weapons.BowMacc = {main="Naegling",sub="Tauret",range="Kaja Bow",ammo=empty}
	sets.weapons.DualMaxentius = {main="Maxentius",sub="Gleti's Knife",range=empty}
	
    sets.buff.Sublimation = {waist="Embla Sash"}
    sets.buff.DTSublimation = {waist="Embla Sash"}

	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.Dagger.Accuracy.Evasion
	
	-- Normal melee group

	sets.engaged = {ammo="Ginsen",
		head="Malignance Chapeau",neck="Anu Torque",ear1="Sherida Earring",ear2="Brutal Earring",
		body="Ayanmo Corazza +2",hands="Malignance Gloves",ring1="Chirich Ring +1",ring2="Chirich Ring +1",
		back=gear.stp_jse_back,waist="Windbuffet Belt +1",legs="Malignance Tights",feet="Malignance Boots"}
		
	sets.engaged.EnspellOnly = {ammo="Ginsen",
		head="Malignance Chapeau",neck="Anu Torque",ear1="Sherida Earring",ear2="Brutal Earring",
		body="Ayanmo Corazza +2",hands="Malignance Gloves",ring1="Hetairoi Ring",ring2="Petrov Ring",
		back=gear.stp_jse_back,waist="Orpheus's Sash",legs="Carmine Cuisses +1",feet="Malignance Boots"}

	sets.engaged.Acc = {ammo="Ginsen",
		head="Malignance Chapeau",neck="Anu Torque",ear1="Sherida Earring",ear2="Brutal Earring",
		body="Ayanmo Corazza +2",hands="Malignance Gloves",ring1="Chirich Ring +1",ring2="Chirich Ring +1",
		back=gear.stp_jse_back,waist="Windbuffet Belt +1",legs="Malignance Tights",feet="Malignance Boots"}

	sets.engaged.DT = {ammo="Ginsen",
		head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Sherida Earring",ear2="Brutal Earring",
		body="Ayanmo Corazza +2",hands="Malignance Gloves",ring1="Chirich Ring +1",ring2="Chirich Ring +1",
		back=gear.stp_jse_back,waist="Windbuffet Belt +1",legs="Malignance Tights",feet="Malignance Boots"}
		
	sets.engaged.Acc.DT = {ammo="Ginsen",
		head="Malignance Chapeau",neck="Anu Torque",ear1="Sherida Earring",ear2="Brutal Earring",
		body="Ayanmo Corazza +2",hands="Malignance Gloves",ring1="Chirich Ring +1",ring2="Chirich Ring +1",
		back=gear.stp_jse_back,waist="Windbuffet Belt +1",legs="Malignance Tights",feet="Malignance Boots"}

		
	sets.engaged.DW = {ammo="Ginsen",
		head="Malignance Chapeau",neck="Anu Torque",ear1="Sherida Earring",ear2="Brutal Earring",
		body="Ayanmo Corazza +2",hands="Malignance Gloves",ring1="Chirich Ring +1",ring2="Chirich Ring +1",
		back=gear.stp_jse_back,waist="Windbuffet Belt +1",legs="Malignance Tights",feet="Malignance Boots"}
		
	sets.engaged.DW.Acc = {ammo="Ginsen",
		head="Malignance Chapeau",neck="Anu Torque",ear1="Sherida Earring",ear2="Brutal Earring",
		body="Ayanmo Corazza +2",hands="Malignance Gloves",ring1="Chirich Ring +1",ring2="Chirich Ring +1",
		back=gear.stp_jse_back,waist="Windbuffet Belt +1",legs="Malignance Tights",feet="Malignance Boots"}
		
	sets.engaged.DW.DT = {ammo="Ginsen",
		head="Malignance Chapeau",neck="Anu Torque",ear1="Sherida Earring",ear2="Brutal Earring",
		body="Ayanmo Corazza +2",hands="Malignance Gloves",ring1="Chirich Ring +1",ring2="Chirich Ring +1",
		back=gear.stp_jse_back,waist="Windbuffet Belt +1",legs="Malignance Tights",feet="Malignance Boots"}
		
	sets.engaged.DW.Acc.DT = {ammo="Ginsen",
		head="Malignance Chapeau",neck="Anu Torque",ear1="Sherida Earring",ear2="Brutal Earring",
		body="Ayanmo Corazza +2",hands="Malignance Gloves",ring1="Chirich Ring +1",ring2="Chirich Ring +1",
		back=gear.stp_jse_back,waist="Windbuffet Belt +1",legs="Malignance Tights",feet="Malignance Boots"}
end

-- Select default macro book on initial load or subjob change.
-- Default macro set/book
function select_default_macro_book()
	if player.sub_job == 'SCH' then
		set_macro_page(1, 2)
	elseif player.sub_job == 'DNC' then
		set_macro_page(4, 2)
	elseif player.sub_job == 'NIN' then
		set_macro_page(5, 2)
	elseif player.sub_job == 'BLM' then
		set_macro_page(2, 2)
	else
		set_macro_page(3, 2)
	end
end

--Job Specific Trust Overwrite
function check_trust()
	if not moving then
		if state.AutoTrustMode.value and not data.areas.cities:contains(world.area) and (buffactive['Elvorseal'] or buffactive['Reive Mark'] or not in_combat) then
			local party = windower.ffxi.get_party()
			if party.p5 == nil then
				local spell_recasts = windower.ffxi.get_spell_recasts()

				if spell_recasts[980] < spell_latency and not have_trust("Yoran-Oran") then
					windower.chat.input('/ma "Yoran-Oran (UC)" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[911] < spell_latency and not have_trust("Joachim") then
					windower.chat.input('/ma "Joachim" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[967] < spell_latency and not have_trust("Qultada") then
					windower.chat.input('/ma "Qultada" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[914] < spell_latency and not have_trust("Ulmia") then
					windower.chat.input('/ma "Ulmia" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[979] < spell_latency and not have_trust("Selh'teus") then
					windower.chat.input('/ma "Selh\'teus" <me>')
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

function user_job_buff_change(buff, gain)
	if buff:startswith('Addendum: ') or buff:endswith(' Arts') then
		style_lock = true
	end
end

function user_job_lockstyle()
	if player.sub_job == 'NIN' or player.sub_job == 'DNC' then
		if player.equipment.main == nil or player.equipment.main == 'empty' then
			windower.chat.input('/lockstyleset 021')
		elseif res.items[item_name_to_id(player.equipment.main)].skill == 3 then --Sword in main hand.
			if res.items[item_name_to_id(player.equipment.sub)].skill == 3 then --Sword/Sword.
				windower.chat.input('/lockstyleset 021')
			elseif res.items[item_name_to_id(player.equipment.sub)].skill == 2 then --Sword/Dagger.
				windower.chat.input('/lockstyleset 022')
			elseif res.items[item_name_to_id(player.equipment.sub)].skill == 11 then --Sword/Club.
				windower.chat.input('/lockstyleset 022')
			else
				windower.chat.input('/lockstyleset 021') --Catchall
			end
		elseif res.items[item_name_to_id(player.equipment.main)].skill == 2 then --Dagger in main hand.
			if res.items[item_name_to_id(player.equipment.sub)].skill == 3 then --Dagger/Sword.
				windower.chat.input('/lockstyleset 021')
			elseif res.items[item_name_to_id(player.equipment.sub)].skill == 2 then --Dagger/Dagger.
				windower.chat.input('/lockstyleset 021')
			elseif res.items[item_name_to_id(player.equipment.sub)].skill == 11 then --Dagger/Club.
				windower.chat.input('/lockstyleset 022')
			else
				windower.chat.input('/lockstyleset 021') --Catchall
			end
		elseif res.items[item_name_to_id(player.equipment.main)].skill == 11 then --Club in main hand.
			if res.items[item_name_to_id(player.equipment.sub)].skill == 3 then --Club/Sword.
				windower.chat.input('/lockstyleset 021')
			elseif res.items[item_name_to_id(player.equipment.sub)].skill == 2 then --Club/Dagger.
				windower.chat.input('/lockstyleset 021')
			elseif res.items[item_name_to_id(player.equipment.sub)].skill == 11 then --Club/Club.
				windower.chat.input('/lockstyleset 022')
			else
				windower.chat.input('/lockstyleset 021') --Catchall
			end
		end
	elseif player.sub_job == 'WHM' or state.Buff['Light Arts'] or state.Buff['Addendum: White'] then
		windower.chat.input('/lockstyleset 030')
	elseif player.sub_job == 'BLM' or state.Buff['Dark Arts'] or state.Buff['Addendum: Black'] then
		windower.chat.input('/lockstyleset 031')
	else
		windower.chat.input('/lockstyleset 033')
	end
end

autows_list = {['Naegling']='Savage Blade',['DualWeapons']='Savage Blade',['DualWeaponsAcc']='Savage Blade',['DualEvisceration']='Evisceration',['DualClubs']='Black Halo',['DualAeolian']='Aeolian Edge',['EnspellDW']='Sanguine Blade',['DualPrime']='Exenterator'}

buff_spell_lists = {
	Auto = {--Options for When are: Always, Engaged, Idle, OutOfCombat, Combat
		{Name='Refresh III',	Buff='Refresh',		SpellID=894,	When='Always'},
		{Name='Haste II',		Buff='Haste',		SpellID=511,	When='Always'},
		{Name='Aurorastorm',	Buff='Aurorastorm',	SpellID=119,	When='Idle'},
		{Name='Reraise',		Buff='Reraise',		SpellID=135,	When='Always'},
	},
	
	AutoMelee = {
		{Name='Phalanx II',		Buff='Phalanx',			SpellID=107,	When='Always'},
		{Name='Haste II',		Buff='Haste',			SpellID=511,	When='Always'},
		{Name='Temper II',		Buff='Multi Strikes',	SpellID=895,	When='Always'},
		{Name='Refresh III',	Buff='Refresh',			SpellID=894,	When='Always'},
	},
	
	AutoMage = {
		{Name='Phalanx II',		Buff='Phalanx',			SpellID=107,	When='Always'},
		{Name='Haste II',		Buff='Haste',			SpellID=511,	When='Always'},
		{Name='Refresh III',	Buff='Refresh',			SpellID=894,	When='Always'},
		{Name='Refresh III',	Buff='Refresh',			SpellID=894,	When='Always'},
		{Name='Gain-INT',		Buff='INT Boost',		SpellID=490,	When='Always'},
		{Name='Aquaveil',		Buff='Aquaveil',		SpellID=55,		When='Always'},
		{Name='Blink',			Buff='Blink',			SpellID=53,		When='Always'},
		{Name='Shell V',		Buff='Shell',			SpellID=52,		When='Always'},
		{Name='Protect V',		Buff='Protect',			SpellID=47,		When='Always'},
		{Name='Stoneskin',		Buff='Stoneskin',		SpellID=54,		When='Always'},
	},
	
	AutoTrial = {
		{Name='Phalanx II',		Buff='Phalanx',			SpellID=107,	When='Always'},
		{Name='Haste II',		Buff='Haste',			SpellID=511,	When='Always'},
		{Name='Refresh III',	Buff='Refresh',			SpellID=894,	When='Always'},
		{Name='Temper II',		Buff='Multi Strikes',	SpellID=895,	When='Always'},
		{Name='Refresh III',	Buff='Refresh',			SpellID=894,	When='Always'},
		{Name='Gain-DEX',		Buff='DEX Boost',		SpellID=480,	When='Always'},
		{Name='Protect V',		Buff='Protect',			SpellID=47,		When='Always'},
		{Name='Shell V',		Buff='Shell',			SpellID=52,		When='Always'},
	},
	
	Default = {
		{Name='Haste II',		Buff='Haste',			SpellID=511,	Reapply=false},
		{Name='Refresh III',	Buff='Refresh',			SpellID=894,	Reapply=false},
		{Name='Gain-MND',		Buff='MND Boost',		SpellID=491,	Reapply=false},
		{Name='Aquaveil',		Buff='Aquaveil',		SpellID=55,		Reapply=false},
		{Name='Phalanx II',		Buff='Phalanx',			SpellID=107,	Reapply=false},
		{Name='Stoneskin',		Buff='Stoneskin',		SpellID=54,		Reapply=false},
		{Name='Blink',			Buff='Blink',			SpellID=53,		Reapply=false},
		{Name='Shell V',		Buff='Shell',			SpellID=52,		Reapply=false},
		{Name='Protect V',		Buff='Protect',			SpellID=47,		Reapply=false},
	},

	MageBuff = {
		{Name='Haste II',		Buff='Haste',			SpellID=511,	Reapply=false},
		{Name='Refresh III',	Buff='Refresh',			SpellID=894,	Reapply=false},
		{Name='Gain-INT',		Buff='INT Boost',		SpellID=490,	Reapply=false},
		{Name='Aquaveil',		Buff='Aquaveil',		SpellID=55,		Reapply=false},
		{Name='Phalanx II',		Buff='Phalanx',			SpellID=107,	Reapply=false},
		{Name='Stoneskin',		Buff='Stoneskin',		SpellID=54,		Reapply=false},
		{Name='Blink',			Buff='Blink',			SpellID=53,		Reapply=false},
		{Name='Shell V',		Buff='Shell',			SpellID=52,		Reapply=false},
		{Name='Protect V',		Buff='Protect',			SpellID=47,		Reapply=false},
	},
	
	FullMeleeBuff = {
		{Name='Haste II',		Buff='Haste',			SpellID=511,	Reapply=false},
		{Name='Refresh III',	Buff='Refresh',			SpellID=894,	Reapply=false},
		{Name='Phalanx II',		Buff='Phalanx',			SpellID=107,	Reapply=false},
		{Name='Temper II',		Buff='Multi Strikes',	SpellID=895,	Reapply=false},
		{Name='Gain-STR',		Buff='STR Boost',		SpellID=486,	Reapply=false},
		{Name='Enthunder',		Buff='Enthunder',		SpellID=104,	Reapply=false},
		{Name='Shock Spikes',	Buff='Shock Spikes',	SpellID=251,	Reapply=false},
		{Name='Shell V',		Buff='Shell',			SpellID=52,		Reapply=false},
		{Name='Protect V',		Buff='Protect',			SpellID=47,		Reapply=false},
		{Name='Barblizzard',	Buff='Barblizzard',		SpellID=61,		Reapply=false},
		{Name='Barparalyze',	Buff='Barparalyze',		SpellID=74,		Reapply=false},
		{Name='Aquaveil',		Buff='Aquaveil',		SpellID=55,		Reapply=false},		
		{Name='Regen II',		Buff='Regen',			SpellID=110,	Reapply=false},
		{Name='Stoneskin',		Buff='Stoneskin',		SpellID=54,		Reapply=false},
		{Name='Blink',			Buff='Blink',			SpellID=53,		Reapply=false},
	},
	
	MeleeBuff = {
		{Name='Haste II',		Buff='Haste',			SpellID=511,	Reapply=false},
		{Name='Refresh III',	Buff='Refresh',			SpellID=894,	Reapply=false},
		{Name='Phalanx II',		Buff='Phalanx',			SpellID=107,	Reapply=false},
		{Name='Temper II',		Buff='Multi Strikes',	SpellID=895,	Reapply=false},
		{Name='Gain-STR',		Buff='STR Boost',		SpellID=486,	Reapply=false},
		{Name='Enthunder',		Buff='Enthunder',		SpellID=104,	Reapply=false},
		{Name='Shock Spikes',	Buff='Shock Spikes',	SpellID=251,	Reapply=false},
	},

	Odin = {
		{Name='Refresh III',	Buff='Refresh',			SpellID=894,	Reapply=false},
		{Name='Haste II',		Buff='Haste',			SpellID=511,	Reapply=false},
		{Name='Phalanx II',		Buff='Phalanx',			SpellID=107,	Reapply=false},
		{Name='Gain-INT',		Buff='INT Boost',		SpellID=490,	Reapply=false},
		{Name='Temper II',		Buff='Multi Strikes',	SpellID=895,	Reapply=false},
		{Name='Regen II',		Buff='Regen',			SpellID=110,	Reapply=false},
		{Name='Enaero',			Buff='Enaero',			SpellID=102,	Reapply=false},
		{Name='Stoneskin',		Buff='Stoneskin',		SpellID=54,		Reapply=false},
		{Name='Shell V',		Buff='Shell',			SpellID=52,		Reapply=false},
		{Name='Protect V',		Buff='Protect',			SpellID=47,		Reapply=false},
	},
	
	HybridCleave = {
		{Name='Refresh III',	Buff='Refresh',			SpellID=894,	Reapply=false},
		{Name='Haste II',		Buff='Haste',			SpellID=511,	Reapply=false},
		{Name='Phalanx II',		Buff='Phalanx',			SpellID=107,	Reapply=false},
		{Name='Gain-INT',		Buff='INT Boost',		SpellID=490,	Reapply=false},
		{Name='Enthunder II',	Buff='Enthunder II',	SpellID=316,	Reapply=false},
		{Name='Temper II',		Buff='Multi Strikes',	SpellID=895,	Reapply=false},
		{Name='Shell V',		Buff='Shell',			SpellID=52,		Reapply=false},
		{Name='Protect V',		Buff='Protect',			SpellID=47,		Reapply=false},
	},
}