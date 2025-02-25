-- Gearsets your character will use among multiple jobs.
sets.BehemothSuit = {
    body = "Behemoth Suit +1",
    hands = empty,
    legs = empty,
    feet = empty
}
sets.Cooking = {
    main = "Debahocho +1",
    sub = "Heartbeater +1",
    head = "Chef's Hat",
    rin1 = "Craftkeeper's Ring",
    ring2 = "Craftmaster's Ring"
}
sets.Sheltered = {
    ring2 = "Sheltered Ring"
}
sets.Capacity = {
    back = "Aptitude Mantle"
}

sets.buff.Doom = {
    neck = "Nicander's Necklace",
    waist = "Gishdubar Sash",
    ring1 = "Eshmun's Ring",
    ring2 = "Eshmun's Ring"
}
sets.TreasureHunter = {
    head = "Wh. Rarab Cap +1",
    ammo = "Per. Lucky Egg",
    waist = "Chaac Belt",
    feet = gear.herculean_th_feet
}

sets.precast.Item['Hallowed Water'] = {}

sets.precast.Item['Holy Water'] = {
    neck = "Nicander's Necklace",
    ring1 = "Blenmot's Ring",
    ring2 = "Blenmot's Ring"
}

-- Augmented items that you'll use among multiple jobs.

gear.gada_enhancing_club = {
    name = "Gada",
    augments = { 'Enh. Mag. eff. dur. +6', 'STR+3', 'Mag. Acc.+8', '"Mag.Atk.Bns."+17', 'DMG:+7' }
}
gear.gada_healing_club = {
    name = "Gada",
    augments = { '"Cure" potency +9%', 'Mag. Acc.+11', '"Mag.Atk.Bns."+13', 'DMG:+3' }
}
gear.grioavolr_nuke_staff = {
    name = "Grioavolr",
    augments = { 'Magic burst dmg.+8%', 'MP+61', 'Mag. Acc.+16', '"Mag.Atk.Bns."+30', 'Magic Damage +7' }
}
gear.grioavolr_fc_staff = {
    name = "Grioavolr",
    augments = { '"Fast Cast"+7', 'MP+20', 'Mag. Acc.+17', '"Mag.Atk.Bns."+10', 'Magic Damage +5' }
}
gear.grioavolr_pet_staff = {
    name = "Grioavolr",
    augments = { 'Blood Pact Dmg.+8', 'Pet: STR+10', 'Pet: Mag. Acc.+19', 'Pet: "Mag.Atk.Bns."+30' }
}
gear.nibiru_b_sword = {
    name = "Nibiru Blade",
    augments = { 'STR+10', 'Attack+20', '"Store TP"+3' }
}

gear.chironic_enfeeble_hands = {
    name = "Chironic Gloves",
    augments = { 'Mag. Acc.+20 "Mag.Atk.Bns."+20', 'MND+10', 'Mag. Acc.+15' }
}
gear.chironic_refresh_hands = {
    name = "Chironic Gloves",
    augments = { '"Counter"+4', 'DEX+4', '"Refresh"+2', 'Accuracy+19 Attack+19', 'Mag. Acc.+13 "Mag.Atk.Bns."+13' }
}
gear.chironic_treasure_feet = {
    name = "Chironic Slippers",
    augments = { '"Occult Acumen"+8', 'MND+7', '"Treasure Hunter"+2' }
}
gear.chironic_nuke_feet = {
    name = "Chironic Slippers",
    augments = { 'Mag. Acc.+25 "Mag.Atk.Bns."+25', '"Drain" and "Aspir" potency +10', 'CHR+6', '"Mag.Atk.Bns."+15' }
}
gear.chironic_refresh_feet = {
    name = "Chironic Slippers",
    augments = { 'Pet: Attack+23 Pet: Rng.Atk.+23', 'Pet: Haste+1', '"Refresh"+2', 'Accuracy+10 Attack+10' }
}

gear.herculean_fc_head = {
    name = "Herculean Helm",
    augments = { '"Fast Cast"+6', '"Mag.Atk.Bns."+13' }
}
gear.herculean_nuke_head = {
    name = "Herculean Helm",
    augments = { 'Mag. Acc.+16 "Mag.Atk.Bns."+16', 'Enmity-3', 'INT+9', '"Mag.Atk.Bns."+13' }
}
gear.herculean_wsd_head = {
    name = "Herculean Helm",
    augments = { 'Mag. Acc.+20', 'Weapon skill damage +2%' }
}

gear.herculean_dt_hands = {
    name = "Herculean Gloves",
    augments = { 'Attack+4', 'Damage taken-4%' }
}
gear.herculean_phalanx_hands = {
    name = "Herculean Gloves",
    augments = { 'INT+6', 'MND+7', 'Phalanx +4', 'Accuracy+10 Attack+10', 'Mag. Acc.+13 "Mag.Atk.Bns."+13' }
}
gear.herculean_treasure_hands = {
    name = "Herculean Gloves",
    augments = { '"Store TP"+7', 'INT+6', '"Treasure Hunter"+2', 'Accuracy+17 Attack+17',
        'Mag. Acc.+17 "Mag.Atk.Bns."+17' }
}
gear.herculean_refresh_hands = {
    name = "Herculean Gloves",
    augments = { 'Enmity+2', 'Pet: "Store TP"+4', '"Refresh"+1' }
}
gear.herculean_waltz_hands = {
    name = "Herculean Gloves",
    augments = { 'Rng.Acc.+16', '"Waltz" potency +11%', 'AGI+1' }
}
gear.herculean_waltz_body = {
    name = "Herculean Vest",
    augments = { 'Attack+26', '"Waltz" potency +11%', 'AGI+4', 'Accuracy+5' }
}
gear.herculean_wsd_body = {
    name = "Herculean Vest",
    augments = { 'Accuracy+11', 'Weapon skill damage +5%', 'DEX+7' }
}
gear.herculean_dt_legs = {
    name = "Herculean Trousers",
    augments = { 'Attack+15', 'Damage taken-4%', 'STR+3', 'Accuracy+12' }
}
gear.herculean_wsd_legs = {
    name = "Herculean Trousers",
    augments = { 'Weapon skill damage +5%', 'DEX+8', 'Accuracy+13', 'Attack+14' }
}
gear.herculean_nuke_legs = {
    name = "Herculean Trousers",
    augments = { 'Mag. Acc.+18 "Mag.Atk.Bns."+18', 'Damage taken-2%', '"Mag.Atk.Bns."+14' }
}
gear.herculean_phalanx_feet = {
    name = "Herculean Boots",
    augments = { 'Accuracy+15', 'Pet: DEX+7', 'Phalanx +3', 'Mag. Acc.+14 "Mag.Atk.Bns."+14' }
}
gear.herculean_acc_feet = {
    name = "Herculean Boots",
    augments = { 'Accuracy+25 Attack+25', 'Crit. hit damage +1%', 'DEX+10', 'Accuracy+14', 'Attack+1' }
}

gear.herculean_ta_feet = {
    name = "Herculean Boots",
    augments = { 'Accuracy+20', '"Dbl.Atk."+2', '"Treasure Hunter"+1' }
}
gear.herculean_refresh_feet = {
    name = "Herculean Boots",
    augments = { 'CHR+2', 'MND+6', '"Refresh"+2', 'Accuracy+7 Attack+7' }
}
gear.herculean_wsd_feet = {
    name = "Herculean Boots",
    augments = { '"Store TP"+2', 'STR+1', 'Weapon skill damage +7%', 'Accuracy+18 Attack+18' }
}
gear.herculean_waltz_feet = {
    name = "Herculean Boots",
    augments = { 'Attack+10', '"Waltz" potency +10%', 'AGI+4', 'Accuracy+9' }
}
gear.herculean_nuke_feet = {
    name = "Herculean Boots",
    augments = { '"Mag.Atk.Bns."+23', 'Rng.Acc.+14', 'Phalanx +1', 'Mag. Acc.+15 "Mag.Atk.Bns."+15' }
}
gear.herculean_th_feet = {
    feet = {
        name = "Herculean Boots",
        augments = { '"Cure" potency +7%', 'DEX+1', '"Treasure Hunter"+2' }
    }
}

gear.merlinic_fc_head = {
    name = "Merlinic Hood",
    augments = { '"Mag.Atk.Bns."+13', '"Fast Cast"+6', }
}
gear.merlinic_nuke_head = {
    name = "Merlinic Hood",
    augments = { 'Mag. Acc.+21 "Mag.Atk.Bns."+21', 'INT+15', 'Mag. Acc.+3', '"Mag.Atk.Bns."+13' }
}
gear.merlinic_nuke_body = {
    name = "Merlinic Jubbah",
    augments = { 'Mag. Acc.+22 "Mag.Atk.Bns."+22', '"Occult Acumen"+4', 'INT+10', 'Mag. Acc.+2', '"Mag.Atk.Bns."+15' }
}
gear.merlinic_occult_body = {
    name = "Merlinic Jubbah",
    augments = {'"Occult Acumen"+11','MND+4','"Mag.Atk.Bns."+14',}
}
gear.merlinic_aspir_hands = {
    name = "Merlinic Dastanas",
    augments = { '"Drain" and "Aspir" potency +11', 'INT+3', }
}
gear.merlinic_occult_hands = {
    name = "Merlinic Dastanas",
    augments = { 'Mag. Acc.+14 "Mag.Atk.Bns."+14', '"Occult Acumen"+11', 'Mag. Acc.+7', }
}
gear.merlinic_aspir_legs = {
    name = "Merlinic Shalwar",
    augments = { '"Drain" and "Aspir" potency +11', 'CHR+7', 'Mag. Acc.+7', }
}
gear.merlinic_fc_feet = {
    name = "Merlinic Crackows",
    augments = {'"Mag.Atk.Bns."+8','"Fast Cast"+6','MND+2',}
}
gear.merlinic_aspir_feet = {
    name = "Merlinic Crackows",
    augments = { '"Drain" and "Aspir" potency +10', 'Mag. Acc.+14', }
}
gear.merlinic_treasure_feet = {
    name = "Merlinic Crackows",
    augments = { 'Accuracy+5', '"Snapshot"+2', '"Treasure Hunter"+2', 'Mag. Acc.+11 "Mag.Atk.Bns."+11' }
}
gear.merlinic_refresh_feet = {
    name = "Merlinic Crackows",
    augments = { 'Pet: DEX+7', 'Pet: Mag. Acc.+7', '"Refresh"+2', 'Accuracy+20 Attack+20' }
}
gear.merlinic_occult_feet = {
    name = "Merlinic Crackows",
    augments = { 'Mag. Acc.+5', '"Occult Acumen"+11', 'INT+4', '"Mag.Atk.Bns."+12', }
}

gear.taeon_pet_head = {
    name = "Taeon Chapeau",
    augments = { 'Pet: Accuracy+15 Pet: Rng. Acc.+15', 'Pet: "Dbl. Atk."+5', 'Pet: Damage taken -4%' }
}
gear.taeon_pet_body = {
    name = "Taeon Tabard",
    augments = { 'Pet: Accuracy+19 Pet: Rng. Acc.+19', 'Pet: "Dbl. Atk."+5', 'Pet: Damage taken -4%' }
}
gear.taeon_pet_hands = {
    name = "Taeon Gloves",
    augments = { 'Pet: Accuracy+22 Pet: Rng. Acc.+22', 'Pet: "Dbl. Atk."+5', 'Pet: Damage taken -4%' }
}
gear.taeon_pet_legs = {
    name = "Taeon Tights",
    augments = { 'Pet: Accuracy+20 Pet: Rng. Acc.+20', 'Pet: "Dbl. Atk."+5', 'Pet: Damage taken -4%' }
}
gear.taeon_pet_feet = {
    name = "Taeon Boots",
    augments = { 'Pet: Accuracy+23 Pet: Rng. Acc.+23', 'Pet: "Dbl. Atk."+5', 'Pet: Damage taken -4%' }
}

gear.telchine_enh_feet = {
    name = "Telchine Braconi",
    augments = { 'Enh. Mag. eff. dur. +10', }
}

gear.taeon_regensird_feet = {
    name = "Taeon Boots",
    augments = { 'Spell interruption rate down -9%', '"Regen" potency+3' }
}

gear.odyssean_wsd_hands = {
    name = "Odyssean Gauntlets",
    augments = { 'Accuracy+26', 'Weapon skill damage +4%', 'STR+6', 'Attack+14' }
}
gear.odyssean_stp_legs = {
    name = "Odyssean Cuisses",
    augments = { 'Accuracy+28', '"Store TP"+6', 'DEX+9' }
}
gear.odyssean_fc_legs = {
    name = "Odyssean Cuisses",
    augments = { '"Fast Cast"+6', '"Mag.Atk.Bns."+12' }
}

gear.valorous_magical_wsd_head = {
    name = "Valorous Mask",
    augments = { '"Mag.Atk.Bns."+17', 'Weapon skill damage +5%', 'Attack+10' }
}
gear.valorous_wsd_head = {
    name = "Valorous Mask",
    augments = { 'Accuracy+10 Attack+10', 'Weapon skill damage +4%', 'STR+4', 'Attack+10' }
}
gear.valorous_pet_head = {
    name = "Valorous Mask",
    augments = { 'Pet: "Mag.Atk.Bns."+25', 'Pet: "Regen"+3', 'Pet: INT+14', 'Pet: Accuracy+2 Pet: Rng. Acc.+2' }
}
gear.valorous_pet_body = {
    name = "Valorous Mail",
    augments = { 'Pet: "Mag.Atk.Bns."+26', '"Dbl.Atk."+3', 'Pet: INT+8', 'Pet: Accuracy+13 Pet: Rng. Acc.+13',
        'Pet: Attack+12 Pet: Rng.Atk.+12' }
}
gear.valorous_wsd_body = {
    name = "Valorous Mail",
    augments = { 'Accuracy+25 Attack+25', 'Weapon skill damage +4%', 'Accuracy+10', 'Attack+12' }
}
gear.valorous_wsd_hands = {
    name = "Valorous Mitts",
    augments = { 'Accuracy+30', 'Weapon skill damage +2%', 'STR+10', 'Attack+10' }
}
gear.valorous_acc_hands = {
    name = "Valorous Mitts",
    augments = { 'Accuracy+21 Attack+21', '"Store TP"+4', 'Accuracy+15', 'Attack+9' }
}
gear.valorous_physical_pet_legs = {
    name = "Valor. Hose",
    augments = { 'Pet: Attack+29 Pet: Rng.Atk.+29', 'Pet: "Dbl.Atk."+3 Pet: Crit.hit rate +3', 'Pet: STR+8',
        'Pet: Accuracy+8 Pet: Rng. Acc.+8' }
}
gear.valorous_magical_pet_legs = {
    name = "Valor. Hose",
    augments = { 'Pet: "Mag.Atk.Bns."+28', 'Pet: "Regen"+3', 'Pet: INT+13', 'Pet: Attack+2 Pet: Rng.Atk.+2' }
}
gear.valorous_magical_pet_feet = {
    name = "Valorous Greaves",
    augments = { 'Pet: "Mag.Atk.Bns."+29', 'Pet: "Dbl.Atk."+1 Pet: Crit.hit rate +1', 'Pet: INT+9',
        'Pet: Accuracy+1 Pet: Rng. Acc.+1', 'Pet: Attack+4 Pet: Rng.Atk.+4' }
}
gear.valorous_wsd_feet = {
    name = "Valorous Greaves",
    augments = { 'Accuracy+25', 'Weapon skill damage +4%', 'STR+5' }
}

gear.vanya_fc_head = {
    name = "Vanya Hood",
    augments = { 'MP+50', '"Fast Cast"+10', 'Haste+2%' }
}
gear.vanya_healskill_head = {
    name = "Vanya Hood",
    augments = { 'Healing magic skill +20', '"Cure" spellcasting time -7%', 'Magic dmg. taken -3' }
}
gear.vanya_cure_feet = {
    name = "Vanya Clogs",
    augments = { '"Cure" potency +5%', '"Cure" spellcasting time -15%', '"Conserve MP"+6' }
}
gear.vanya_healskill_feet = {
    name = "Vanya Clogs",
    augments = { 'Healing magic skill +20', '"Cure" spellcasting time -7%', 'Magic dmg. taken -3' }
}
