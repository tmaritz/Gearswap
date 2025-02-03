-- Original: Motenten / Modified: Arislan / Modified again: Lunafreya
-- Haste/DW Detection Requires Gearinfo Addon

-------------------------------------------------------------------------------------------------------------------
--  Keybinds
-------------------------------------------------------------------------------------------------------------------

--  Modes:      [ F9 ]              Cycle Offense Modes
--              [ CTRL+F9 ]         Cycle Hybrid Modes
--              [ WIN+F9 ]          Cycle Weapon Skill Modes
--              [ F10 ]             Emergency -PDT Mode
--              [ ALT+F10 ]         Toggle Kiting Mode
--              [ F11 ]             Emergency -MDT Mode
--              [ F12 ]             Update Current Gear / Report Current Status
--              [ CTRL+F12 ]        Cycle Idle Modes
--              [ ALT+F12 ]         Cancel Emergency -PDT/-MDT Mode
--              [ WIN+F ]           Toggle Closed Position (Facing) Mode
--              [ WIN+C ]           Toggle Capacity Points Mode
--
--  Abilities:  [ CTRL+- ]          Primary step element cycle forward.
--              [ CTRL+= ]          Primary step element cycle backward.
--              [ ALT+- ]           Secondary step element cycle forward.
--              [ ALT+= ]           Secondary step element cycle backward.
--              [ CTRL+[ ]          Toggle step target type.
--              [ CTRL+] ]          Toggle use secondary step.
--              [ Numpad0 ]         Perform Current Step
--
--              [ CTRL+` ]          Saber Dance
--              [ ALT+` ]           Chocobo Jig II
--              [ ALT+[ ]           Contradance
--              [ CTRL+Numlock ]    Reverse Flourish
--              [ CTRL+Numpad/ ]    Berserk/Meditate
--              [ CTRL+Numpad* ]    Warcry/Sekkanoki
--              [ CTRL+Numpad- ]    Aggressor/Third Eye
--              [ CTRL+Numpad+ ]    Climactic Flourish
--              [ CTRL+NumpadEnter ]Building Flourish
--              [ CTRL+Numpad0 ]    Sneak Attack
--              [ CTRL+Numpad. ]    Trick Attack
--
--  Spells:     [ WIN+, ]           Utsusemi: Ichi
--              [ WIN+. ]           Utsusemi: Ni
--
--  WS:         [ CTRL+Numpad7 ]    Exenterator
--              [ CTRL+Numpad4 ]    Evisceration
--              [ CTRL+Numpad5 ]    Rudra's Storm
--              [ CTRL+Numpad6 ]    Pyrrhic Kleos
--              [ CTRL+Numpad3 ]    Shark Bite
--              [ CTRL+Numpad1 ]    Aeolian Edge
--
--
--              (Global-Binds.lua contains additional non-job-related keybinds)


-------------------------------------------------------------------------------------------------------------------
--  Custom Commands (preface with /console to use these in macros)
-------------------------------------------------------------------------------------------------------------------

--  gs c step                       Uses the currently configured step on the target, with either <t> or
--                                  <stnpc> depending on setting.
--  gs c step t                     Uses the currently configured step on the target, but forces use of <t>.
--
--  gs c cycle mainstep             Cycles through the available steps to use as the primary step when using
--                                  one of the above commands.
--  gs c cycle altstep              Cycles through the available steps to use for alternating with the
--                                  configured main step.
--  gs c toggle usealtstep          Toggles whether or not to use an alternate step.
--  gs c toggle selectsteptarget    Toggles whether or not to use <stnpc> (as opposed to <t>) when using a step.


-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2

    -- Load and initialize the include file.
    include('Mote-Include.lua')
end

-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
    state.Buff['Climactic Flourish'] = buffactive['climactic flourish'] or false
    state.Buff['Sneak Attack'] = buffactive['sneak attack'] or false
    state.Buff['Trick Attack'] = buffactive['trick attack'] or false
    state.Buff['Striking Flourish'] = buffactive['striking flourish'] or false
    state.Buff['Sneak Attack'] = buffactive['sneak attack'] or false

    state.MainStep = M { ['description'] = 'Main Step', 'Box Step', 'Quickstep', 'Feather Step', 'Stutter Step' }
    state.AltStep = M { ['description'] = 'Alt Step', 'Quickstep', 'Feather Step', 'Stutter Step', 'Box Step' }
    state.UseAltStep = M(false, 'Use Alt Step')
    state.SelectStepTarget = M(false, 'Select Step Target')
    state.IgnoreTargetting = M(true, 'Ignore Targetting')

    state.ClosedPosition = M(false, 'Closed Position')

    state.CurrentStep = M { ['description'] = 'Current Step', 'Main', 'Alt' }
    --  state.SkillchainPending = M(false, 'Skillchain Pending')

    state.CP = M(false, "Capacity Points Mode")

    lockstyleset = 98
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('STP', 'Normal', 'LowAcc', 'MidAcc', 'HighAcc', 'Tank', 'Treasure')
    state.HybridMode:options('Normal', 'DT')
    state.WeaponskillMode:options('Normal', 'Acc')
    state.IdleMode:options('Normal', 'DT', 'Regain', 'Regain11')

    -- Additional local binds

    send_command('bind ^- gs c cycleback mainstep')
    send_command('bind ^= gs c cycle mainstep')
    send_command('bind !- gs c cycleback altstep')
    send_command('bind != gs c cycle altstep')
    send_command('bind !p gs c toggle usealtstep')
    send_command('bind ![ input /ja "Contradance" <me>')
    send_command('bind ^` input /ja "Saber Dance" <me>')
    send_command('bind !` input /ja "Chocobo Jig II" <me>')
    send_command('bind @f gs c toggle ClosedPosition')
    send_command('bind @c gs c toggle CP')

    send_command('bind ^numlock input /ja "Reverse Flourish" <me>')

    if player.sub_job == 'WAR' then
        send_command('bind ^numpad/ input /ja "Berserk" <me>')
        send_command('bind ^numpad* input /ja "Warcry" <me>')
    elseif player.sub_job == 'SAM' then
        send_command('bind ^numpad/ input /ja "Meditate" <me>')
        send_command('bind ^numpad* input /ja "Sekkanoki" <me>')
    elseif player.sub_job == 'DRG' then
        send_command('bind ^numpad/ input /ja "Jump" <t>')
        send_command('bind ^numpad* input /ja "High Jump" <t>')
    elseif player.sub_job == 'THF' then
        send_command('bind ^numpad0 input /ja "Sneak Attack" <me>')
        send_command('bind ^numpad. input /ja "Trick Attack" <me>')
    end

    send_command('bind ^numpad+ input /ja "Climactic Flourish" <me>')
    send_command('bind ^numpadenter input /ja "Building Flourish" <me>')
    send_command('bind ^numpad- input /ja "No Foot Rise" <me>')

    send_command('bind ^numpad9 input /ws "Ruthless Stroke" <t>')
    send_command('bind ^numpad7 input /ws "Exenterator" <t>')
    send_command('bind ^numpad4 input /ws "Evisceration" <t>')
    send_command('bind ^numpad5 input /ws "Rudra\'s Storm" <t>')
    send_command('bind ^numpad6 input /ws "Pyrrhic Kleos" <t>')
    send_command('bind ^numpad1 input /ws "Aeolian Edge" <t>')
    send_command('bind ^numpad3 input /ws "Shark Bite" <t>')

    send_command('bind numpad0 gs c step t')

    send_command('lua l dnc-hud')

    select_default_macro_book()
    set_lockstyle()

    Haste = 0
    DW_needed = 0
    DW = false
    moving = false
    update_combat_form()
    determine_haste_group()
end

-- Called when this job file is unloaded (eg: job change)
function user_unload()
    send_command('unbind ^-')
    send_command('unbind ^=')
    send_command('unbind !-')
    send_command('unbind !=')
    send_command('unbind !p')
    send_command('unbind ^[')
    send_command('unbind ^]')
    send_command('unbind ![')
    send_command('unbind ^`')
    send_command('unbind !`')
    send_command('unbind ^,')
    send_command('unbind @f')
    send_command('unbind @c')
    send_command('unbind ^numlock')
    send_command('unbind ^numpad/')
    send_command('unbind ^numpad*')
    send_command('unbind ^numpad-')
    send_command('unbind ^numpad+')
    send_command('unbind ^numpadenter')
    send_command('unbind ^numpad9')
    send_command('unbind ^numpad7')
    send_command('unbind ^numpad4')
    send_command('unbind ^numpad5')
    send_command('unbind ^numpad6')
    send_command('unbind ^numpad1')
    send_command('unbind numpad0')
    send_command('unbind ^numpad0')
    send_command('unbind ^numpad.')

    send_command('unbind #`')
    send_command('unbind #1')
    send_command('unbind #2')
    send_command('unbind #3')
    send_command('unbind #4')
    send_command('unbind #5')
    send_command('unbind #6')
    send_command('unbind #7')
    send_command('unbind #8')
    send_command('unbind #9')
    send_command('unbind #0')

    send_command('lua u dnc-hud')
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Precast Sets ------------------------------------------
    ------------------------------------------------------------------------------------------------

    -- Enmity set
    sets.Enmity = {
        -- ammo="Sapience Orb", --2
        -- head="Halitus Helm", --8
        body = "Emet Harness +1",    --10
        -- hands="Kurys Gloves", --9
        neck = "Unmoving Collar +1", --10
        -- ear1="Cryptic Earring", --4
        -- ear2="Trux Earring", --5
        ring1 = "Begrudging Ring", --5
        ring2 = "Petrov Ring",     --5
        waist = "Sulla Belt",      --3
    }

    sets.precast.JA['Provoke'] = sets.Enmity
    sets.precast.JA['No Foot Rise'] = { body = "Horos Casaque +3" }
    sets.precast.JA['Trance'] = { head = "Horos Tiara +1" }

    sets.precast.JA['Jump'] = {
        ammo = "Coiste Bodhar",
        neck = "Etoile Gorget +2",
        head = "Maculele Tiara +3",
        body = "Gleti's Cuirass", --9 PDT
        hands = "Gleti's Gauntlets",
        legs = "Gleti's Breeches",
        feet = "Macu. Toe Sh. +2", -- 9/9
        waist = "Sailfi Belt +1",
        left_ear = "Sherida Earring",
        right_ear = "Maculele Earring +2",
        left_ring = "Epona's Ring",
        right_ring = "Gere Ring",
        back = { name = "Senuna's Mantle", augments = { 'DEX+20', 'Accuracy+20 Attack+20', 'Accuracy+10', '"Dbl.Atk."+10', 'Phys. dmg. taken-10%', } } --10 PDT
    }

    sets.precast.JA['High Jump'] = sets.precast.JA['Jump']

    sets.precast.Waltz = {
        ammo = "Yamarang",
        head = "Horos Tiara +3",
        body = "Maxixi Casaque +1",
        hands = "Maxixi Bangles +3",
        feet = "Maxixi Toe Shoes +1",
        neck = "Etoile Gorget +2",
        waist = "Aristo Belt",
        left_ear = "Enchntr. Earring",
        right_ear = "Handler's Earring",
        left_ring = "Carb. Ring",
        right_ring = "Carb. Ring",
        back = { name = "Toetapper Mantle", augments = { '"Store TP"+2', '"Rev. Flourish"+26', } },
    } -- Waltz Potency/CHR

    sets.precast.WaltzSelf = set_combine(sets.precast.Waltz, {
        head = "Mummu Bonnet +1", --8
        ring1 = "Asklepian Ring", --3
    })                            -- Waltz effects received

    sets.precast.Waltz['Healing Waltz'] = {}
    sets.precast.Samba = { head = "Maxixi Tiara +2", back = "Senuna's Mantle" }
    sets.precast.Jig = { legs = "Horos Tights +3", feet = "Maxixi Shoes +1" }

    sets.precast.Step = {
        ammo = "C. Palug Stone",
        head = "Maxixi Tiara +2",
        body = { name = "Horos Casaque +3", augments = { 'Enhances "No Foot Rise" effect', } },
        hands = "Maxixi Bangles +3",
        legs = "Malignance Tights",
        feet = { name = "Horos T. Shoes +3", augments = { 'Enhances "Closed Position" effect', } },
        neck = "Etoile Gorget +2",
        waist = "Kentarch Belt +1",
        ear1 = "Odr Earring",
        ear2 = "Macu. Earring +2",
        ring1 = "Regal Ring",
        ring2 = "Ephramad's Ring",
        waist = "Kentarch Belt +1",
        back = { name = "Senuna's Mantle", augments = { 'DEX+20', 'Accuracy+20 Attack+20', 'DEX+10', 'Weapon skill damage +10%', } },
    }

    sets.precast.Step['Feather Step'] = set_combine(sets.precast.Step, { feet = "Macu. Toeshoes +2" })
    sets.precast.Flourish1 = {}
    sets.precast.Flourish1['Animated Flourish'] = sets.Enmity

    sets.precast.Flourish1['Violent Flourish'] = {
        ammo = "Yamarang",
        head = "Mummu Bonnet +1",
        body = "Mummu Jacket +2",
        hands = "Mummu Wrists +2",
        legs = "Mummu Kecks +2",
        feet = { name = "Horos T. Shoes +3", augments = { 'Enhances "Closed Position" effect', } },
        neck = "Sanctity Necklace",
        waist = "Kentarch Belt +1",
        left_ear = "Mache Earring +1",
        right_ear = "Sherida Earring",
        left_ring = "Stikini Ring",
        right_ring = "Mummu Ring",
        back = { name = "Senuna's Mantle", augments = { 'DEX+20', 'Accuracy+20 Attack+20', 'DEX+10', 'Weapon skill damage +10%', } },
    } -- Magic Accuracy

    sets.precast.Flourish1['Desperate Flourish'] = {
        ammo = "Yamarang",
        head = "Malignance Chapeau",
        body = { name = "Horos Casaque +3", augments = { 'Enhances "No Foot Rise" effect', } },
        hands = { name = "Adhemar Wrist. +1", augments = { 'STR+12', 'DEX+12', 'Attack+20', } },
        legs = "Meg. Chausses +2",
        feet = { name = "Horos T. Shoes +3", augments = { 'Enhances "Closed Position" effect', } },
        neck = "Sanctity Necklace",
        waist = "Kentarch Belt +1",
        left_ear = "Mache Earring +1",
        right_ear = "Sherida Earring",
        left_ring = "Meghanada Ring",
        right_ring = "Mummu Ring",
        back = { name = "Senuna's Mantle", augments = { 'DEX+20', 'Accuracy+20 Attack+20', 'DEX+10', 'Weapon skill damage +10%', } },
    } -- Accuracy

    sets.precast.Flourish2 = {}
    sets.precast.Flourish2['Reverse Flourish'] = { hands = "Maculele Bangles +1", back = "Toetapper Mantle" }
    sets.precast.Flourish3 = {}
    sets.precast.Flourish3['Striking Flourish'] = { body = "Macu. Casaque +1" }
    sets.precast.Flourish3['Climactic Flourish'] = { head = "Maculele Tiara +3", }

    sets.precast.FC = {
        -- ammo="Sapience Orb",
        -- head=gear.Herc_MAB_head, --7
        -- body=gear.Taeon_FC_body, --8
        -- hands="Leyline Gloves", --8
        -- legs="Rawhide Trousers", --5
        -- feet=gear.Herc_MAB_feet, --2
        -- neck="Orunmila's Torque", --5
        -- ear1="Loquacious Earring", --2
        -- ear2="Enchntr. Earring +1", --2
        -- ring2="Weather. Ring +1", --6(4)
    }

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {
        ammo = "Impatiens",
        body = "Passion Jacket",
        neck = "Magoraga Beads",
        ring1 = "Lebeche Ring",
    })


    ------------------------------------------------------------------------------------------------
    ------------------------------------- Weapon Skill Sets ----------------------------------------
    ------------------------------------------------------------------------------------------------

    sets.precast.WS =
    {
        ammo = "Crepuscular Pebble",
        head = "Maculele Tiara +3",
        body = { name = "Nyame Mail", augments = { 'Path: B', } },
        hands = "Nyame Gauntlets",
        legs = "Nyame Flanchard",
        feet = { name = "Nyame Sollerets", augments = { 'Path: B', } },
        neck = "Fotia Gorget",
        waist = "Fotia Belt",
        left_ear = "Ishvara Earring",
        right_ear = { name = "Moonshade Earring", augments = { 'Accuracy+4', 'TP Bonus +250', } },
        left_ring = "Karieyh Ring",
        right_ring = "Regal Ring",
        back = { name = "Senuna's Mantle", augments = { 'DEX+20', 'Accuracy+20 Attack+20', 'DEX+10', 'Weapon skill damage +10%', } },
    } -- default set

    sets.precast.WS['Ruthless Stroke'] =
    {
        ammo = "Crepuscular Pebble",
        head = "Maculele Tiara +3",
        body = { name = "Nyame Mail", augments = { 'Path: B', } },
        hands = "Maxixi Bangles +3",
        legs = "Nyame Flanchard",
        feet = { name = "Nyame Sollerets", augments = { 'Path: B', } },
        neck = "Etoile Gorget +2",
        waist = "Kentarch Belt +1",
        left_ear = "Moonshade Earring",
        right_ear = "Maculele Earring +2",
        left_ring = "Ephramad's Ring",
        right_ring = "Regal Ring",
        back = { name = "Senuna's Mantle", augments = { 'DEX+20', 'Accuracy+20 Attack+20', 'DEX+10', 'Weapon skill damage +10%', } },
    }

    sets.precast.WS['Shark Bite'] = sets.precast.WS['Ruthless Stroke']
    sets.precast.WS.Acc = set_combine(sets.precast.WS, {
        -- ammo="Falcon Eye",
        -- head="Dampening Tam",
        -- legs="Meg. Chausses +2",
        -- feet="Meg. Jam. +2",
        -- ear2="Telos Earring",
    })

    sets.precast.WS.Critical = { body = "Meg. Cuirie +2" }

    sets.precast.WS['Exenterator'] = {
        ammo = "Yamarang",
        head = "Maculele Tiara +3",
        body = { name = "Nyame Mail", augments = { 'Path: B', } },
        hands = "Nyame Gauntlets",
        legs = "Nyame Flanchard",
        feet = { name = "Nyame Sollerets", augments = { 'Path: B', } },
        neck = "Fotia Gorget",
        waist = "Fotia Belt",
        left_ear = "Brutal Earring",
        right_ear = "Sherida Earring",
        left_ring = "Ilabrat Ring",
        right_ring = "Regal Ring",
        back = { name = "Senuna's Mantle", augments = { 'DEX+20', 'Accuracy+20 Attack+20', 'DEX+10', 'Weapon skill damage +10%', } },
    }

    sets.precast.WS['Exenterator'].Acc = set_combine(sets.precast.WS['Exenterator'], {
        ammo = "Falcon Eye",
        head = "Dampening Tam",
    })

    sets.precast.WS['Pyrrhic Kleos'] = {
        ammo = "Mantoptera Eye",
        head = "Maculele Tiara +3",
        body = "Adhemar Jacket +1",
        hands = { name = "Adhemar Wrist. +1", augments = { 'STR+12', 'DEX+12', 'Attack+20', } },
        legs = "Gleti's Breeches",
        feet = { name = "Lustra. Leggings +1", augments = { 'Attack+20', 'STR+8', '"Dbl.Atk."+3', } },
        neck = "Fotia Gorget",
        waist = "Fotia Belt",
        left_ear = "Mache Earring +1",
        right_ear = "Sherida Earring",
        left_ring = "Gere Ring",
        right_ring = "Regal Ring",
        back = { name = "Senuna's Mantle", augments = { 'STR+20', 'Accuracy+20 Attack+20', 'STR+10', '"Dbl.Atk."+10', } },
    }

    sets.precast.WS['Pyrrhic Kleos'].Acc = {
        ammo = "Mantoptera Eye",
        head = "Maculele Tiara +3",
        body = "Gleti's Cuirass",
        hands = "Gleti's Gauntlets",
        legs = "Gleti's Breeches",
        feet = "Gleti's Boots",
        neck = "Fotai Gorget",
        waist = "Fotia Belt",
        left_ear = "Mache Earring +1",
        right_ear = "Sherida Earring",
        left_ring = "Gere Ring",
        right_ring = "Regal Ring",
        back = { name = "Senuna's Mantle", augments = { 'STR+20', 'Accuracy+20 Attack+20', 'STR+10', '"Dbl.Atk."+10', } },
    }

    sets.precast.WS['Evisceration'] = {
        ammo = "Charis Feather",
        head = { name = "Adhemar Bonnet +1", augments = { 'STR+12', 'DEX+12', 'Attack+20', } },
        --head="Gleti's Mask",
        body = "Meg. Cuirie +2",
        --body="Gleti's Cuirass",
        hands = "Gleti's Gauntlets",
        legs = "Gleti's Breeches",
        feet = "Gleti's Boots",
        neck = "Etoile Gorget +2",
        waist = "Fotia Belt",
        left_ear = "Odr Earring",
        right_ear = "Sherida Earring",
        left_ring = "Ilabrat Ring",
        right_ring = "Mummu Ring",
        back = { name = "Senuna's Mantle", augments = { 'DEX+20', 'Accuracy+20 Attack+20', 'DEX+10', 'Weapon skill damage +10%', } },
    }

    sets.precast.WS['Evisceration'].Acc = set_combine(sets.precast.WS['Evisceration'], {
        -- ammo="Falcon Eye",
        -- head="Dampening Tam",
        -- body=gear.Adhemar_B_body,
        --legs="Meg. Chausses +2",
        -- feet="Maxixi Toeshoes +3",
        -- ear2="Telos Earring",
        -- ring1="Regal Ring",
    })

    sets.precast.WS['Rudra\'s Storm'] = {
        ammo = "Crepuscular Pebble",
        head = "Maculele Tiara +3",
        body = { name = "Nyame Mail", augments = { 'Path: B', } },
        hands = "Nyame Gauntlets",
        legs = "Nyame Flanchard",
        feet = { name = "Nyame Sollerets", augments = { 'Path: B', } },
        neck = "Etoile Gorget +2",
        waist = "Kentarch Belt +1",
        left_ear = "Moonshade Earring",
        right_ear = "Maculele Earring +2",
        left_ring = "Regal Ring",
        right_ring = "Ephramad's Ring",
        back = { name = "Senuna's Mantle", augments = { 'DEX+20', 'Accuracy+20 Attack+20', 'DEX+10', 'Weapon skill damage +10%', } },
    }


    sets.precast.WS['Rudra\'s Storm'].Acc = set_combine(sets.precast.WS['Rudra\'s Storm'], {
        hhead = "Maculele Tiara +3",
        body = "Gleti's Cuirass",
        hands = "Maxixi Bangles +3",
        legs = { name = "Horos Tights +3", augments = { 'Enhances "Saber Dance" effect', } },
        feet = "Gleti's Boots"
    })

    sets.precast.WS['Aeolian Edge'] = {
        ammo = "Pemphredo Tathlum",
        head = "Nyame Helm",
        body = "Nyame Mail",
        hands = "Nyame Gauntlets",
        legs = "Nyame Flanchard",
        feet = "Nyame Sollerets",
        neck = "Sanctity Necklace",
        -- ear1="Novio Earring",
        ear2 = "Friomisi Earring",
        ring1 = "Regal Ring",
        ring2 = "Metamorph Ring +1",
        -- back="Argocham. Mantle",
        -- waist="Eschan Stone",
    }

    sets.precast.Skillchain = {
        hands = "Macu. Bangles +1",
    }


    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Midcast Sets ------------------------------------------
    ------------------------------------------------------------------------------------------------

    sets.midcast.FastRecast = sets.precast.FC

    sets.midcast.SpellInterrupt = {
        ammo = "Impatiens",         --10
        ring1 = "Evanescence Ring", --5
    }

    sets.midcast.Utsusemi = sets.midcast.SpellInterrupt


    ------------------------------------------------------------------------------------------------
    ----------------------------------------- Idle Sets --------------------------------------------
    ------------------------------------------------------------------------------------------------

    sets.resting = {}

    sets.idle = {
        ammo = "Yamarang",
        head = "Gleti's Mask",
        body = "Gleti's Cuirass",
        hands = "Gleti's Gauntlets",
        legs = "Gleti's Breeches",
        feet = "Skd. Jambeaux +1",
        neck = "Bathy Choker",
        waist = "Flume Belt",
        left_ear = "Sherida Earring",
        right_ear = "Maculele Earring +2",
        left_ring = "Gelatinous Ring +1",
        right_ring = "Defending Ring",
        back = { name = "Senuna's Mantle", augments = { 'DEX+20', 'Accuracy+20 Attack+20', '"Store TP"+10', 'Damage taken-5%', } },
    }

    sets.idle.Regain = {
        ammo = "Yamarang",
        head = "Turms Cap +1",
        body = { name = "Gleti's Cuirass", augments = { 'Path: A', } },
        hands = "Regal Gloves",
        legs = { name = "Gleti's Breeches", augments = { 'Path: A', } },
        feet = "Gleti's Boots",
        neck = { name = "Etoile Gorget +2", augments = { 'Path: A', } },
        waist = "Reiki Yotai",
        left_ear = "Dedition Earring",
        right_ear = { name = "Macu. Earring +2", augments = { 'System: 1 ID: 1676 Val: 0', 'Accuracy+16', 'Mag. Acc.+16', '"Store TP"+6', 'DEX+7 AGI+7', } },
        left_ring = "Roller's Ring",
        right_ring = "Chirich Ring +1",
        back = { name = "Senuna's Mantle", augments = { 'DEX+20', 'Accuracy+20 Attack+20', '"Store TP"+10', 'Damage taken-5%', } },
    }

    sets.idle.Regain11 = {
        ammo = "Yamarang",
        head = "Turms Cap +1",
        body = { name = "Gleti's Cuirass", augments = { 'Path: A', } },
        hands = "Regal Gloves",
        legs = { name = "Gleti's Breeches", augments = { 'Path: A', } },
        feet = "Gleti's Boots",
        neck = { name = "Etoile Gorget +2", augments = { 'Path: A', } },
        waist = "Reiki Yotai",
        left_ear = "Dedition Earring",
        right_ear = { name = "Macu. Earring +2", augments = { 'System: 1 ID: 1676 Val: 0', 'Accuracy+16', 'Mag. Acc.+16', '"Store TP"+6', 'DEX+7 AGI+7', } },
        left_ring = "Roller's Ring",
        right_ring = "Chirich Ring +1",
        back = { name = "Senuna's Mantle", augments = { 'DEX+20', 'Accuracy+20 Attack+20', '"Store TP"+10', 'Damage taken-5%', } },
    }


    sets.idle.DT = set_combine(sets.idle, {
        ammo = "Staunch Tathlum", --3/3
        head = "Malignance Chapeau",
        body = "Malignance Tabard",
        hands = "Malignance Gloves",
        legs = "Malignance Tights",   --5/5
        feet = "Malignance Boots",
        neck = "Loricate Torque +1",  --6/6
        ear2 = "Odnowa Earring +1",   --0/3
        ring1 = "Gelatinous Ring +1", --7/(-1)
        ring2 = "Defending Ring",     --10/10
        -- back="Moonlight Cape", --6/6
    })

    sets.idle.Town = set_combine(sets.idle, {
        head = "Maculele Tiara +3",
        body = "Ashera Harness",
        hands = "Regal Gloves",
        legs = "Gleti's Breeches",
        feet = "Skd. Jambeaux +1",
        neck = "Etoile Gorget +2",
    })

    sets.idle.Weak = sets.idle.DT


    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Defense Sets ------------------------------------------
    ------------------------------------------------------------------------------------------------

    sets.defense.PDT = sets.idle.DT
    sets.defense.MDT = sets.idle.DT

    sets.Kiting = {
        feet = "Skd. Jambeaux +1",
    }


    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Engaged Sets ------------------------------------------
    ------------------------------------------------------------------------------------------------

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion

    sets.engaged = {
        ammo = "Yamarang",
        head = { name = "Adhemar Bonnet +1", augments = { 'STR+12', 'DEX+12', 'Attack+20', } },
        body = { name = "Horos Casaque +3", augments = { 'Enhances "No Foot Rise" effect', } },
        hands = { name = "Adhemar Wrist. +1", augments = { 'STR+12', 'DEX+12', 'Attack+20', } },
        legs = { name = "Samnuha Tights", augments = { 'STR+10', 'DEX+10', '"Dbl.Atk."+3', '"Triple Atk."+3', } },
        feet = { name = "Horos T. Shoes +3", augments = { 'Enhances "Closed Position" effect', } },
        neck = "Etoile Gorget +2",
        waist = "Sailfi Belt +1",
        left_ear = "Sherida Earring",
        right_ear = "Maculele Earring +2",
        left_ring = "Gere Ring",
        right_ring = "Epona's Ring",
        back = { name = "Senuna's Mantle", augments = { 'DEX+20', 'Accuracy+20 Attack+20', '"Store TP"+10', 'Damage taken-5%', } },
    }

    sets.engaged.LowAcc = set_combine(sets.engaged, {
        head = "Dampening Tam",
        neck = "Combatant's Torque",
    })

    sets.engaged.MidAcc = set_combine(sets.engaged.LowAcc, {
        -- ammo="Falcon Eye",
        -- ear2="Telos Earring",
        -- ring1="Regal Ring",
        -- ring2="Ilabrat Ring",
        -- waist="Kentarch Belt +1 +1",
    })

    sets.engaged.HighAcc = set_combine(sets.engaged.MidAcc, {
        -- feet=gear.Herc_STP_feet,
        -- ring1="Ramuh Ring +1",
        -- waist="Olseni Belt",
        legs = "Meg. Chausses +2",
        left_ring = "Mummu Ring"
    })

    sets.engaged.STP = {
        ammo = "Yamarang",
        head = "Malignance Chapeau",
        body = "Malignance Tabard",
        hands = "Malignance Gloves",
        legs = "Malignance Tights",
        feet = "Malignance Boots",
        neck = "Etoile Gorget +2",
        waist = "Sailfi Belt +1",
        left_ear = "Sherida Earring",
        right_ear = "Maculele Earring +2",
        left_ring = "Gere Ring",
        right_ring = "Epona's Ring",
        back = { name = "Senuna's Mantle", augments = { 'DEX+20', 'Accuracy+20 Attack+20', '"Store TP"+10', 'Damage taken-5%', } },
    }

    sets.engaged.Tank = {
        ammo = "Staunch Tathlum",
        head = "Malignance Chapeau",
        body = "Malignance Tabard",
        hands = "Adhemar Wrist. +1",
        legs = "Mummu Kecks +2",
        feet = "Malignance Boots",
        neck = "Loricate Torque +1",
        waist = "Flume Belt",
        left_ear = "Etiolation Earring",
        right_ear = "Maculele Earring +2",
        left_ring = "Gelatinous Ring +1",
        right_ring = "Defending Ring",
        back = { name = "Senuna's Mantle", augments = { 'DEX+20', 'Accuracy+20 Attack+20', '"Store TP"+10', 'Damage taken-5%', } },
    }

    sets.engaged.Treasure = set_combine(sets.engaged,
        {
            legs = { name = "Herculean Trousers", augments = { 'Sklchn.dmg.+1%', '"Dbl.Atk."+2', '"Treasure Hunter"+2', } },
            feet = "Volte Boots",
            waist = "Chaac Belt",
            head = "Volte Cap"
        })

    -- * DNC Native DW Trait: 30% DW
    -- * DNC Job Points DW Gift: 5% DW

    -- No Magic Haste (74% DW to cap)
    sets.engaged.DW = {
        ammo = "Yamarang",
        head = { name = "Adhemar Bonnet +1", augments = { 'STR+12', 'DEX+12', 'Attack+20', } },
        body = { name = "Horos Casaque +3", augments = { 'Enhances "No Foot Rise" effect', } },
        hands = { name = "Adhemar Wrist. +1", augments = { 'STR+12', 'DEX+12', 'Attack+20', } },
        legs = { name = "Samnuha Tights", augments = { 'STR+10', 'DEX+10', '"Dbl.Atk."+3', '"Triple Atk."+3', } },
        feet = { name = "Horos T. Shoes +3", augments = { 'Enhances "Closed Position" effect', } },
        neck = "Etoile Gorget +2",
        waist = "Sailfi Belt +1",
        left_ear = "Sherida Earring",
        right_ear = "Maculele Earring +2",
        left_ring = "Gere Ring",
        right_ring = "Epona's Ring",
        back = { name = "Senuna's Mantle", augments = { 'DEX+20', 'Accuracy+20 Attack+20', '"Store TP"+10', 'Damage taken-5%', } },
    } -- 41%

    sets.engaged.DW.LowAcc = set_combine(sets.engaged.DW, {
        -- head="Dampening Tam",
        -- neck="Combatant's Torque",
    })

    sets.engaged.DW.MidAcc = set_combine(sets.engaged.DW.LowAcc, {
        -- head="Maxixi Tiara +3", --8
        -- body="Maxixi Casaque +3",
        -- ring2="Ilabrat Ring",
        -- waist="Kentarch Belt +1 +1",
    })

    sets.engaged.DW.HighAcc = set_combine(sets.engaged.DW.MidAcc, {
        -- legs=gear.Herc_WS_legs,
        -- feet=gear.Herc_STP_feet,
        -- ring1="Regal Ring",
        -- ring2="Ramuh Ring +1",
        -- waist="Olseni Belt",
    })

    sets.engaged.DW.STP = set_combine(sets.engaged.DW, {
        -- ring1="Chirich Ring",
    })

    sets.engaged.DW.Tank = {
        ammo = "Staunch Tathlum",
        head = "Malignance Chapeau",
        body = { name = "Horos Casaque +3", augments = { 'Enhances "No Foot Rise" effect', } },
        hands = "Turms Mittens",
        legs = "Mummu Kecks +2",
        feet = "Turms Leggings",
        neck = "Loricate Torque +1",
        waist = "Flume Belt",
        left_ear = "Etiolation Earring",
        right_ear = "Maculele Earring +2",
        left_ring = "Gelatinous Ring +1",
        right_ring = "Defending Ring",
        back = { name = "Senuna's Mantle", augments = { 'DEX+20', 'Accuracy+20 Attack+20', '"Store TP"+10', 'Damage taken-5%', } },
    }


    -- 15% Magic Haste (67% DW to cap)
    sets.engaged.DW.LowHaste = {
        ammo = "Yamarang",
        head = { name = "Adhemar Bonnet +1", augments = { 'STR+12', 'DEX+12', 'Attack+20', } },
        body = { name = "Horos Casaque +3", augments = { 'Enhances "No Foot Rise" effect', } },
        hands = { name = "Adhemar Wrist. +1", augments = { 'STR+12', 'DEX+12', 'Attack+20', } },
        legs = { name = "Samnuha Tights", augments = { 'STR+10', 'DEX+10', '"Dbl.Atk."+3', '"Triple Atk."+3', } },
        feet = { name = "Horos T. Shoes +3", augments = { 'Enhances "Closed Position" effect', } },
        neck = "Etoile Gorget +2",
        waist = "Sailfi Belt +1",
        left_ear = "Sherida Earring",
        right_ear = "Maculele Earring +2",
        left_ring = "Gere Ring",
        right_ring = "Epona's Ring",
        back = { name = "Senuna's Mantle", augments = { 'DEX+20', 'Accuracy+20 Attack+20', '"Store TP"+10', 'Damage taken-5%', } },
    } -- 32%

    sets.engaged.DW.LowAcc.LowHaste = set_combine(sets.engaged.DW.LowHaste, {
        -- head="Dampening Tam",
        -- neck="Combatant's Torque",
    })

    sets.engaged.DW.MidAcc.LowHaste = set_combine(sets.engaged.DW.LowAcc.LowHaste, {
        -- head="Maxixi Tiara +3", --8
        -- body="Maxixi Casaque +3",
        -- ring2="Ilabrat Ring",
        -- waist="Kentarch Belt +1 +1",
    })

    sets.engaged.DW.HighAcc.LowHaste = set_combine(sets.engaged.DW.MidAcc.LowHaste, {
        -- legs=gear.Herc_WS_legs,
        -- feet=gear.Herc_STP_feet,
        -- ring1="Regal Ring",
        -- ring2="Ramuh Ring +1",
        -- waist="Olseni Belt",
    })

    sets.engaged.DW.STP.LowHaste = {
        ammo = "Yamarang",
        head = { name = "Adhemar Bonnet +1", augments = { 'STR+12', 'DEX+12', 'Attack+20', } },
        body = { name = "Horos Casaque +3", augments = { 'Enhances "No Foot Rise" effect', } },
        hands = { name = "Adhemar Wrist. +1", augments = { 'STR+12', 'DEX+12', 'Attack+20', } },
        legs = { name = "Samnuha Tights", augments = { 'STR+10', 'DEX+10', '"Dbl.Atk."+3', '"Triple Atk."+3', } },
        feet = { name = "Horos T. Shoes +3", augments = { 'Enhances "Closed Position" effect', } },
        neck = "Etoile Gorget +2",
        waist = "Sailfi Belt +1",
        left_ear = "Sherida Earring",
        right_ear = "Maculele Earring +2",
        left_ring = "Gere Ring",
        right_ring = "Epona's Ring",
        back = { name = "Senuna's Mantle", augments = { 'DEX+20', 'Accuracy+20 Attack+20', '"Store TP"+10', 'Damage taken-5%', } },
    }

    sets.engaged.DW.Tank.LowHaste = {
        ammo = "Staunch Tathlum",
        head = "Malignance Chapeau",
        body = { name = "Horos Casaque +3", augments = { 'Enhances "No Foot Rise" effect', } },
        hands = "Turms Mittens",
        legs = "Mummu Kecks +2",
        feet = "Turms Leggings",
        neck = "Loricate Torque +1",
        waist = "Flume Belt",
        left_ear = "Etiolation Earring",
        right_ear = "Maculele Earring +2",
        left_ring = "Gelatinous Ring +1",
        right_ring = "Defending Ring",
        back = { name = "Senuna's Mantle", augments = { 'DEX+20', 'Accuracy+20 Attack+20', '"Store TP"+10', 'Damage taken-5%', } },
    }


    -- 30% Magic Haste (56% DW to cap)
    sets.engaged.DW.MidHaste = {
        ammo = "Yamarang",
        head = { name = "Adhemar Bonnet +1", augments = { 'STR+12', 'DEX+12', 'Attack+20', } },
        body = { name = "Horos Casaque +3", augments = { 'Enhances "No Foot Rise" effect', } },
        hands = { name = "Adhemar Wrist. +1", augments = { 'STR+12', 'DEX+12', 'Attack+20', } },
        legs = { name = "Samnuha Tights", augments = { 'STR+10', 'DEX+10', '"Dbl.Atk."+3', '"Triple Atk."+3', } },
        feet = { name = "Horos T. Shoes +3", augments = { 'Enhances "Closed Position" effect', } },
        neck = "Etoile Gorget +2",
        waist = "Sailfi Belt +1",
        left_ear = "Sherida Earring",
        right_ear = "Maculele Earring +2",
        left_ring = "Gere Ring",
        right_ring = "Epona's Ring",
        back = { name = "Senuna's Mantle", augments = { 'DEX+20', 'Accuracy+20 Attack+20', '"Store TP"+10', 'Damage taken-5%', } },
    } -- 22%

    sets.engaged.DW.LowAcc.MidHaste = set_combine(sets.engaged.DW.MidHaste, {
        -- head="Dampening Tam",
        -- neck="Combatant's Torque",
    })

    sets.engaged.DW.MidAcc.MidHaste = set_combine(sets.engaged.DW.LowAcc.MidHaste, {
        -- head="Maxixi Tiara +3", --8
        -- body="Maxixi Casaque +3",
        -- ring2="Ilabrat Ring",
        -- waist="Kentarch Belt +1 +1",
    })

    sets.engaged.DW.HighAcc.MidHaste = set_combine(sets.engaged.DW.MidAcc.MidHaste, {
        -- body="Maxixi Casaque +3",
        -- legs=gear.Herc_WS_legs,
        -- feet=gear.Herc_STP_feet,
        -- ring1="Regal Ring",
        -- ring2="Ramuh Ring +1",
        -- waist="Olseni Belt",
    })

    sets.engaged.DW.STP.MidHaste = {
        ammo = "Yamarang",
        head = "Malignance Chapeau",
        body = "Malignance Tabard",
        hands = "Malignance Gloves",
        legs = "Malignance Tights",
        feet = "Malignance Boots",
        neck = "Etoile Gorget +2",
        waist = "Sailfi Belt +1",
        left_ear = "Sherida Earring",
        right_ear = "Maculele Earring +2",
        left_ring = "Gere Ring",
        right_ring = "Epona's Ring",
        back = { name = "Senuna's Mantle", augments = { 'DEX+20', 'Accuracy+20 Attack+20', '"Store TP"+10', 'Damage taken-5%', } },
    }

    sets.engaged.DW.Tank.MidHaste = {
        ammo = "Staunch Tathlum",
        head = "Malignance Chapeau",
        body = { name = "Horos Casaque +3", augments = { 'Enhances "No Foot Rise" effect', } },
        hands = "Turms Mittens",
        legs = "Mummu Kecks +2",
        feet = "Turms Leggings",
        neck = "Loricate Torque +1",
        waist = "Flume Belt",
        left_ear = "Etiolation Earring",
        right_ear = "Maculele Earring +2",
        left_ring = "Gelatinous Ring +1",
        right_ring = "Defending Ring",
        back = { name = "Senuna's Mantle", augments = { 'DEX+20', 'Accuracy+20 Attack+20', '"Store TP"+10', 'Damage taken-5%', } },
    }


    -- 35% Magic Haste (51% DW to cap)
    sets.engaged.DW.HighHaste = {
        ammo = "Yamarang",
        head = { name = "Adhemar Bonnet +1", augments = { 'STR+12', 'DEX+12', 'Attack+20', } },
        body = { name = "Horos Casaque +3", augments = { 'Enhances "No Foot Rise" effect', } },
        hands = { name = "Adhemar Wrist. +1", augments = { 'STR+12', 'DEX+12', 'Attack+20', } },
        legs = { name = "Samnuha Tights", augments = { 'STR+10', 'DEX+10', '"Dbl.Atk."+3', '"Triple Atk."+3', } },
        feet = { name = "Horos T. Shoes +3", augments = { 'Enhances "Closed Position" effect', } },
        neck = "Etoile Gorget +2",
        waist = "Sailfi Belt +1",
        left_ear = "Sherida Earring",
        right_ear = "Maculele Earring +2",
        left_ring = "Gere Ring",
        right_ring = "Epona's Ring",
        back = { name = "Senuna's Mantle", augments = { 'DEX+20', 'Accuracy+20 Attack+20', '"Store TP"+10', 'Damage taken-5%', } },
    } -- 10% Gear

    sets.engaged.DW.LowAcc.HighHaste = set_combine(sets.engaged.DW.HighHaste, {
        -- head="Dampening Tam",
        -- neck="Combatant's Torque",
        -- waist="Kentarch Belt +1 +1",
    })

    sets.engaged.DW.MidAcc.HighHaste = set_combine(sets.engaged.DW.LowAcc.HighHaste, {
        -- body="Maxixi Casaque +3",
        -- ring2="Ilabrat Ring",
    })

    sets.engaged.DW.HighAcc.HighHaste = set_combine(sets.engaged.DW.MidAcc.HighHaste, {
        -- head="Maxixi Tiara +3", --8
        -- legs=gear.Herc_WS_legs,
        -- feet=gear.Herc_STP_feet,
        -- ring1="Regal Ring",
        -- ring2="Ramuh Ring +1",
        -- waist="Olseni Belt",
    })

    sets.engaged.DW.STP.HighHaste = {
        ammo = "Yamarang",
        head = "Malignance Chapeau",
        body = "Malignance Tabard",
        hands = "Malignance Gloves",
        legs = "Malignance Tights",
        feet = "Malignance Boots",
        neck = "Etoile Gorget +2",
        waist = "Sailfi Belt +1",
        left_ear = "Sherida Earring",
        right_ear = "Maculele Earring +2",
        left_ring = "Gere Ring",
        right_ring = "Epona's Ring",
        back = { name = "Senuna's Mantle", augments = { 'DEX+20', 'Accuracy+20 Attack+20', '"Store TP"+10', 'Damage taken-5%', } },
    }

    sets.engaged.DW.Tank.HighHaste = {
        ammo = "Staunch Tathlum",
        head = "Malignance Chapeau",
        body = { name = "Horos Casaque +3", augments = { 'Enhances "No Foot Rise" effect', } },
        hands = "Turms Mittens",
        legs = "Mummu Kecks +2",
        feet = "Turms Leggings",
        neck = "Loricate Torque +1",
        waist = "Flume Belt",
        left_ear = "Etiolation Earring",
        right_ear = "Maculele Earring +2",
        left_ring = "Gelatinous Ring +1",
        right_ring = "Defending Ring",
        back = { name = "Senuna's Mantle", augments = { 'DEX+20', 'Accuracy+20 Attack+20', '"Store TP"+10', 'Damage taken-5%', } },
    }


    -- 45% Magic Haste (36% DW to cap)
    sets.engaged.DW.MaxHaste = {
        ammo = "Yamarang",
        head = { name = "Adhemar Bonnet +1", augments = { 'STR+12', 'DEX+12', 'Attack+20', } },
        body = { name = "Horos Casaque +3", augments = { 'Enhances "No Foot Rise" effect', } },
        hands = { name = "Adhemar Wrist. +1", augments = { 'STR+12', 'DEX+12', 'Attack+20', } },
        legs = { name = "Samnuha Tights", augments = { 'STR+10', 'DEX+10', '"Dbl.Atk."+3', '"Triple Atk."+3', } },
        feet = { name = "Horos T. Shoes +3", augments = { 'Enhances "Closed Position" effect', } },
        neck = "Etoile Gorget +2",
        waist = "Sailfi Belt +1",
        left_ear = "Sherida Earring",
        right_ear = "Maculele Earring +2",
        left_ring = "Gere Ring",
        right_ring = "Epona's Ring",
        back = { name = "Senuna's Mantle", augments = { 'DEX+20', 'Accuracy+20 Attack+20', '"Store TP"+10', 'Damage taken-5%', } },
    } -- 0%

    sets.engaged.DW.LowAcc.MaxHaste = set_combine(sets.engaged.DW.MaxHaste, {
        -- head="Dampening Tam",
        -- neck="Combatant's Torque",
        -- waist="Kentarch Belt +1 +1",
    })

    sets.engaged.DW.MidAcc.MaxHaste = set_combine(sets.engaged.DW.LowAcc.MaxHaste, {
        -- body="Maxixi Casaque +3",
        -- ear1="Telos Earring",
        -- ring2="Ilabrat Ring",
    })

    sets.engaged.DW.HighAcc.MaxHaste = set_combine(sets.engaged.DW.MidAcc.MaxHaste, {
        -- head="Maxixi Tiara +3", --8
        -- legs=gear.Herc_WS_legs,
        -- feet=gear.Herc_STP_feet,
        -- ear2="Telos Earring",
        -- ring1="Regal Ring",
        -- ring2="Ramuh Ring +1",
        -- waist="Olseni Belt",
    })

    sets.engaged.DW.STP.MaxHaste = {
        ammo = "Yamarang",
        head = "Malignance Chapeau",
        body = "Malignance Tabard",
        hands = "Malignance Gloves",
        legs = "Malignance Tights",
        feet = "Malignance Boots",
        neck = "Etoile Gorget +2",
        waist = "Sailfi Belt +1",
        left_ear = "Sherida Earring",
        right_ear = "Maculele Earring +2",
        left_ring = "Gere Ring",
        right_ring = "Epona's Ring",
        back = { name = "Senuna's Mantle", augments = { 'DEX+20', 'Accuracy+20 Attack+20', '"Store TP"+10', 'Damage taken-5%', } },
    }

    sets.engaged.DW.Tank.MaxHaste = {
        ammo = "Staunch Tathlum",
        head = "Malignance Chapeau",
        body = "Malignance Tabard",
        hands = "Adhemar Wrist. +1",
        legs = "Mummu Kecks +2",
        feet = "Malignance Boots",
        neck = "Loricate Torque +1",
        waist = "Flume Belt",
        left_ear = "Etiolation Earring",
        right_ear = "Maculele Earring +2",
        left_ring = "Gelatinous Ring +1",
        right_ring = "Defending Ring",
        back = { name = "Senuna's Mantle", augments = { 'DEX+20', 'Accuracy+20 Attack+20', '"Store TP"+10', 'Damage taken-5%', } },
    }


    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Hybrid Sets -------------------------------------------
    ------------------------------------------------------------------------------------------------

    sets.engaged.Hybrid = {
        head = "Maculele Tiara +3",
        body = "Gleti's Cuirass",                                                                                                                      --9 PDT
        hands = "Malignance Gloves",                                                                                                                   --5/5
        feet = "Macu. Toe Sh. +2",                                                                                                                     -- 9/9
        legs = "Gleti's Breeches",                                                                                                                     --8 PDT
        ring1 = "Moonbeam Ring",                                                                                                                       --4/4
        ring2 = "Defending Ring",                                                                                                                      --10/10
        back = { name = "Senuna's Mantle", augments = { 'DEX+20', 'Accuracy+20 Attack+20', 'Accuracy+10', '"Dbl.Atk."+10', 'Phys. dmg. taken-10%', } } --10 PDT
    }

    sets.engaged.DT = set_combine(sets.engaged, sets.engaged.Hybrid)
    sets.engaged.LowAcc.DT = set_combine(sets.engaged.LowAcc, sets.engaged.Hybrid)
    sets.engaged.MidAcc.DT = set_combine(sets.engaged.MidAcc, sets.engaged.Hybrid)
    sets.engaged.HighAcc.DT = set_combine(sets.engaged.HighAcc, sets.engaged.Hybrid)
    sets.engaged.STP.DT = set_combine(sets.engaged.STP, sets.engaged.Hybrid)

    sets.engaged.DW.DT = set_combine(sets.engaged.DW, sets.engaged.Hybrid)
    sets.engaged.DW.LowAcc.DT = set_combine(sets.engaged.DW.LowAcc, sets.engaged.Hybrid)
    sets.engaged.DW.MidAcc.DT = set_combine(sets.engaged.DW.MidAcc, sets.engaged.Hybrid)
    sets.engaged.DW.HighAcc.DT = set_combine(sets.engaged.DW.HighAcc, sets.engaged.Hybrid)
    sets.engaged.DW.STP.DT = set_combine(sets.engaged.DW.STP, sets.engaged.Hybrid)

    sets.engaged.DW.DT.LowHaste = set_combine(sets.engaged.DW.LowHaste, sets.engaged.Hybrid)
    sets.engaged.DW.LowAcc.DT.LowHaste = set_combine(sets.engaged.DW.LowAcc.LowHaste, sets.engaged.Hybrid)
    sets.engaged.DW.MidAcc.DT.LowHaste = set_combine(sets.engaged.DW.MidAcc.LowHaste, sets.engaged.Hybrid)
    sets.engaged.DW.HighAcc.DT.LowHaste = set_combine(sets.engaged.DW.HighAcc.LowHaste, sets.engaged.Hybrid)
    sets.engaged.DW.STP.DT.LowHaste = set_combine(sets.engaged.DW.STP.LowHaste, sets.engaged.Hybrid)

    sets.engaged.DW.DT.MidHaste = set_combine(sets.engaged.DW.MidHaste, sets.engaged.Hybrid)
    sets.engaged.DW.LowAcc.DT.MidHaste = set_combine(sets.engaged.DW.LowAcc.MidHaste, sets.engaged.Hybrid)
    sets.engaged.DW.MidAcc.DT.MidHaste = set_combine(sets.engaged.DW.MidAcc.MidHaste, sets.engaged.Hybrid)
    sets.engaged.DW.HighAcc.DT.MidHaste = set_combine(sets.engaged.DW.HighAcc.MidHaste, sets.engaged.Hybrid)
    sets.engaged.DW.STP.DT.MidHaste = set_combine(sets.engaged.DW.STP.MidHaste, sets.engaged.Hybrid)

    sets.engaged.DW.DT.HighHaste = set_combine(sets.engaged.DW.HighHaste, sets.engaged.Hybrid)
    sets.engaged.DW.LowAcc.DT.HighHaste = set_combine(sets.engaged.DW.LowAcc.HighHaste, sets.engaged.Hybrid)
    sets.engaged.DW.MidAcc.DT.HighHaste = set_combine(sets.engaged.DW.MidAcc.HighHaste, sets.engaged.Hybrid)
    sets.engaged.DW.HighAcc.DT.HighHaste = set_combine(sets.engaged.DW.HighAcc.HighHaste, sets.engaged.Hybrid)
    sets.engaged.DW.STP.DT.HighHaste = set_combine(sets.engaged.DW.HighHaste.STP, sets.engaged.Hybrid)

    sets.engaged.DW.DT.MaxHaste = set_combine(sets.engaged.DW.MaxHaste, sets.engaged.Hybrid)
    sets.engaged.DW.LowAcc.DT.MaxHaste = set_combine(sets.engaged.DW.LowAcc.MaxHaste, sets.engaged.Hybrid)
    sets.engaged.DW.MidAcc.DT.MaxHaste = set_combine(sets.engaged.DW.MidAcc.MaxHaste, sets.engaged.Hybrid)
    sets.engaged.DW.HighAcc.DT.MaxHaste = set_combine(sets.engaged.DW.HighAcc.MaxHaste, sets.engaged.Hybrid)
    sets.engaged.DW.STP.DT.MaxHaste = set_combine(sets.engaged.DW.STP.MaxHaste, sets.engaged.Hybrid)


    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Special Sets ------------------------------------------
    ------------------------------------------------------------------------------------------------

    --    sets.buff['Saber Dance'] = {legs="Horos Tights +3"}
    --    sets.buff['Fan Dance'] = {body="Horos Bangles +1"}
    sets.buff['Climactic Flourish'] = { head = "Maculele Tiara +3", body = "Nyame Mail" }
    sets.buff['Striking Flourish'] = { body = "Macu. Casaque +1" }
    sets.buff['Closed Position'] = { feet = "Horos T. Shoes +3" }

    sets.buff.Doom = { ring1 = "Eshmun's Ring", ring2 = "Eshmun's Ring", waist = "Gishdubar Sash" }
    sets.CP = { back = "Mecisto. Mantle" }
    --sets.Reive = {neck="Ygnas's Resolve +1"}
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
function job_precast(spell, action, spellMap, eventArgs)
    --auto_presto(spell)
    if spellMap == 'Utsusemi' then
        if buffactive['Copy Image (3)'] or buffactive['Copy Image (4+)'] then
            cancel_spell()
            add_to_chat(123, '**!! ' .. spell.english .. ' Canceled: [3+ IMAGES] !!**')
            eventArgs.handled = true
            return
        elseif buffactive['Copy Image'] or buffactive['Copy Image (2)'] then
            send_command('cancel 66; cancel 444; cancel Copy Image; cancel Copy Image (2)')
        end
    end
    if spell.type == 'Waltz' and buffactive['Saber Dance'] then
        send_command('cancel Saber Dance')
    end
end

function job_post_precast(spell, action, spellMap, eventArgs)
    if spell.type == "WeaponSkill" then
        if state.Buff['Sneak Attack'] == true then
            equip(sets.precast.WS.Critical)
        end
        if state.Buff['Climactic Flourish'] then
            equip(sets.buff['Climactic Flourish'])
        end
        if state.Buff['sneak attack'] then
            equip(sets.buff['Climactic Flourish'])
        end
        if state.Buff['trick attack'] then
            equip(sets.buff['Climactic Flourish'])
        end
        if state.Buff['Striking Flourish'] then
            equip(sets.buff['Striking Flourish'])
        end
    end
    if spell.type == 'Waltz' and spell.target.type == 'SELF' then
        equip(sets.precast.WaltzSelf)
    end
end

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_aftercast(spell, action, spellMap, eventArgs)
    -- Weaponskills wipe SATA.  Turn those state vars off before default gearing is attempted.
    if spell.type == 'WeaponSkill' and not spell.interrupted then
        state.Buff['Sneak Attack'] = false
    end
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
    if buff == 'Saber Dance' or buff == 'Climactic Flourish' or buff == 'Fan Dance' or buff == 'Striking Flourish' then
        handle_equipping_gear(player.status)
    end


    --    if buffactive['Reive Mark'] then
    --        if gain then
    --            equip(sets.Reive)
    --            disable('neck')
    --        else
    --            enable('neck')
    --        end
    --    end

    if buff == "doom" then
        if gain then
            equip(sets.buff.Doom)
            send_command('@input /p Doomed.')
            disable('ring1', 'ring2', 'waist')
        else
            enable('ring1', 'ring2', 'waist')
            handle_equipping_gear(player.status)
        end
    end
end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

-- Called by the 'update' self-command, for common needs.
-- Set eventArgs.handled to true if we don't want automatic equipping of gear.
function job_handle_equipping_gear(playerStatus, eventArgs)
    update_combat_form()
    determine_haste_group()
end

function job_update(cmdParams, eventArgs)
    handle_equipping_gear(player.status)
end

function update_combat_form()
    if DW == true then
        state.CombatForm:set('DW')
    elseif DW == false then
        state.CombatForm:reset()
    end
end

function get_custom_wsmode(spell, spellMap, defaut_wsmode)
    local wsmode

    if state.Buff['Sneak Attack'] then
        wsmode = 'SA'
    end

    return wsmode
end

function customize_idle_set(idleSet)
    if state.CP.current == 'on' then
        equip(sets.CP)
        disable('back')
    else
        enable('back')
    end

    return idleSet
end

function customize_melee_set(meleeSet)
    --if state.Buff['Climactic Flourish'] then
    --    meleeSet = set_combine(meleeSet, sets.buff['Climactic Flourish'])
    --end
    if state.ClosedPosition.value == true then
        meleeSet = set_combine(meleeSet, sets.buff['Closed Position'])
    end

    return meleeSet
end

-- Handle auto-targetting based on local setup.
function job_auto_change_target(spell, action, spellMap, eventArgs)
    if spell.type == 'Step' then
        if state.IgnoreTargetting.value == true then
            state.IgnoreTargetting:reset()
            eventArgs.handled = true
        end

        eventArgs.SelectNPCTargets = state.SelectStepTarget.value
    end
end

-- Function to display the current relevant user state when doing an update.
-- Set eventArgs.handled to true if display was handled, and you don't want the default info shown.
function display_current_job_state(eventArgs)
    local msg = '[ Melee'

    if state.CombatForm.has_value then
        msg = msg .. ' (' .. state.CombatForm.value .. ')'
    end

    msg = msg .. ': '

    msg = msg .. state.OffenseMode.value
    if state.HybridMode.value ~= 'Normal' then
        msg = msg .. '/' .. state.HybridMode.value
    end
    msg = msg .. ' ][ WS: ' .. state.WeaponskillMode.value .. ' ]'

    if state.DefenseMode.value ~= 'None' then
        msg = msg ..
            '[ Defense: ' .. state.DefenseMode.value .. state[state.DefenseMode.value .. 'DefenseMode'].value .. ' ]'
    end

    if state.ClosedPosition.value then
        msg = msg .. '[ Closed Position: ON ]'
    end

    if state.Kiting.value then
        msg = msg .. '[ Kiting Mode: ON ]'
    end

    msg = msg .. '[ ' .. state.MainStep.current

    if state.UseAltStep.value == true then
        msg = msg .. '/' .. state.AltStep.current
    end

    msg = msg .. ' ]'

    add_to_chat(060, msg)

    eventArgs.handled = true
end

-------------------------------------------------------------------------------------------------------------------
-- User self-commands.
-------------------------------------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

function determine_haste_group()
    classes.CustomMeleeGroups:clear()
    if DW == true then
        if DW_needed <= 1 then
            classes.CustomMeleeGroups:append('MaxHaste')
        elseif DW_needed > 1 and DW_needed <= 9 then
            classes.CustomMeleeGroups:append('HighHaste')
        elseif DW_needed > 9 and DW_needed <= 21 then
            classes.CustomMeleeGroups:append('MidHaste')
        elseif DW_needed > 21 and DW_needed <= 39 then
            classes.CustomMeleeGroups:append('LowHaste')
        elseif DW_needed > 39 then
            classes.CustomMeleeGroups:append('')
        end
    end
end

function job_self_command(cmdParams, eventArgs)
    if cmdParams[1] == 'step' then
        if cmdParams[2] == 't' then
            state.IgnoreTargetting:set()
        end

        local doStep = ''
        if state.UseAltStep.value == true then
            doStep = state[state.CurrentStep.current .. 'Step'].current
            state.CurrentStep:cycle()
        else
            doStep = state.MainStep.current
        end

        send_command('@input /ja "' .. doStep .. '" <t>')
    end

    gearinfo(cmdParams, eventArgs)
end

function gearinfo(cmdParams, eventArgs)
    if cmdParams[1] == 'gearinfo' then
        if type(tonumber(cmdParams[2])) == 'number' then
            if tonumber(cmdParams[2]) ~= DW_needed then
                DW_needed = tonumber(cmdParams[2])
                DW = true
            end
        elseif type(cmdParams[2]) == 'string' then
            if cmdParams[2] == 'false' then
                DW_needed = 0
                DW = false
            end
        end
        if type(tonumber(cmdParams[3])) == 'number' then
            if tonumber(cmdParams[3]) ~= Haste then
                Haste = tonumber(cmdParams[3])
            end
        end
        if type(cmdParams[4]) == 'string' then
            if cmdParams[4] == 'true' then
                moving = true
            elseif cmdParams[4] == 'false' then
                moving = false
            end
        end
    end
end

-- Automatically use Presto for steps when it's available and we have less than 3 finishing moves
function job_pretarget(spell, action, spellMap, eventArgs)
    if spell.type == 'Step' then
        local allRecasts = windower.ffxi.get_ability_recasts()
        local prestoCooldown = allRecasts[236]
        local under3FMs = not buffactive['Finishing Move 3'] and not buffactive['Finishing Move 4'] and
            not buffactive['Finishing Move 5']

        if player.main_job_level >= 77 and prestoCooldown < 1 and under3FMs and not buffactive['Presto'] then
            cast_delay(1.1)
            send_command('input /ja "Presto" <me>')
        end
    end
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    set_macro_page(1, 18)
end

function set_lockstyle()
    send_command('wait 2; input /lockstyleset ' .. lockstyleset)
end
