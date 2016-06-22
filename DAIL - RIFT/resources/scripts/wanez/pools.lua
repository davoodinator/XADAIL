/**
 * 
 * @author WareBare
 * @version v0.3.0 [BETA]
 *
 * Updated: 06/11/2016
 */


local poolHarpy01 = {
	["Common"]={"mod_wanez/creatures/enemies/harpy_a01.dbr","mod_wanez/creatures/enemies/harpy_a02.dbr"},
	["Champion"]={"mod_wanez/creatures/enemies/harpy_b01.dbr","mod_wanez/creatures/enemies/harpy_b02.dbr","mod_wanez/creatures/enemies/harpy_c01.dbr"},
	["Hero"]={"mod_wanez/creatures/enemies/hero/harpy_h01.dbr","mod_wanez/creatures/enemies/hero/harpy_h02.dbr","mod_wanez/creatures/enemies/hero/harpy_h03.dbr","mod_wanez/creatures/enemies/hero/harpy_h04.dbr","mod_wanez/creatures/enemies/hero/harpy_h05.dbr","mod_wanez/creatures/enemies/hero/harpy_h06.dbr"}
}
local poolZombie01 = {
	["Common"]={"mod_wanez/creatures/enemies/zombie_a01.dbr","mod_wanez/creatures/enemies/zombie_b01.dbr","mod_wanez/creatures/enemies/zombie_g01.dbr","mod_wanez/creatures/enemies/gazer_a01.dbr"},
	["Champion"]={"mod_wanez/creatures/enemies/zombie_c01.dbr","mod_wanez/creatures/enemies/zombie_d01.dbr","mod_wanez/creatures/enemies/zombie_e01.dbr","mod_wanez/creatures/enemies/zombie_f01.dbr"},
	["Hero"]={"mod_wanez/creatures/enemies/hero/zombie_h01.dbr","mod_wanez/creatures/enemies/hero/zombie_h02.dbr","mod_wanez/creatures/enemies/hero/zombie_h03.dbr","mod_wanez/creatures/enemies/hero/zombie_h04.dbr","mod_wanez/creatures/enemies/hero/zombie_h05.dbr"}
}
local poolSlith01 = {
	["Common"]={"mod_wanez/creatures/enemies/slitha_melee_a01.dbr"},
	["Champion"]={"mod_wanez/creatures/enemies/slitha_melee_b01.dbr","mod_wanez/creatures/enemies/slitha_melee_c01.dbr","mod_wanez/creatures/enemies/slitha_melee_c02.dbr","mod_wanez/creatures/enemies/slitha_shaman_b01.dbr","mod_wanez/creatures/enemies/slitha_shaman_b02.dbr","mod_wanez/creatures/enemies/slitha_shaman_c01.dbr","mod_wanez/creatures/enemies/slitha_shaman_c02.dbr"},
	["Hero"]={"mod_wanez/creatures/enemies/hero/slith_h01.dbr","mod_wanez/creatures/enemies/hero/slith_h02.dbr","mod_wanez/creatures/enemies/hero/slith_h03.dbr","mod_wanez/creatures/enemies/hero/slith_h04.dbr","mod_wanez/creatures/enemies/hero/slith_h05.dbr","mod_wanez/creatures/enemies/hero/slith_h06.dbr"}
}
local poolSkeleton01 = {
	["Common"]={"mod_wanez/creatures/enemies/skeleton_a01.dbr","mod_wanez/creatures/enemies/skeleton_a02_archer.dbr"},
	["Champion"]={"mod_wanez/creatures/enemies/skeleton_b01_archer.dbr","mod_wanez/creatures/enemies/skeleton_b02_knight.dbr","mod_wanez/creatures/enemies/skeleton_b03_priest.dbr","mod_wanez/creatures/enemies/skeleton_b04_warlock.dbr","mod_wanez/creatures/enemies/skeleton_c01.dbr","mod_wanez/creatures/enemies/skeleton_c02.dbr","mod_wanez/creatures/enemies/skeleton_c03.dbr"},
	["Hero"]={"mod_wanez/creatures/enemies/hero/skeleton_h01.dbr","mod_wanez/creatures/enemies/hero/skeleton_h02.dbr","mod_wanez/creatures/enemies/hero/skeleton_h03.dbr","mod_wanez/creatures/enemies/hero/skeleton_h04.dbr","mod_wanez/creatures/enemies/hero/skeleton_h05.dbr","mod_wanez/creatures/enemies/hero/skeleton_h06.dbr"}
}
local poolBoar01 = {
	["Common"]={"mod_wanez/creatures/enemies/boar_a01.dbr","mod_wanez/creatures/enemies/boar_a02.dbr","mod_wanez/creatures/enemies/boar_a03.dbr","mod_wanez/creatures/enemies/boar_a04.dbr"},
	["Champion"]={"mod_wanez/creatures/enemies/boar_b01.dbr"},
	["Hero"]={"mod_wanez/creatures/enemies/hero/boar_h01.dbr","mod_wanez/creatures/enemies/hero/boar_h02.dbr","mod_wanez/creatures/enemies/hero/boar_h03.dbr","mod_wanez/creatures/enemies/hero/boar_h04.dbr","mod_wanez/creatures/enemies/hero/boar_h05.dbr","mod_wanez/creatures/enemies/hero/boar_h06.dbr"}
}
local poolChthonian01 = {
	["Common"]={"mod_wanez/creatures/enemies/chthoniandevourer_a01.dbr"},
	["Champion"]={"mod_wanez/creatures/enemies/chthoniandevourer_b01.dbr","mod_wanez/creatures/enemies/chthoniandevourer_b02.dbr"},
	["Hero"]={"mod_wanez/creatures/enemies/hero/chthoniandevourer_h01.dbr","mod_wanez/creatures/enemies/hero/chthoniandevourer_h02.dbr","mod_wanez/creatures/enemies/hero/chthoniandevourer_h03.dbr","mod_wanez/creatures/enemies/hero/chthoniandevourer_h04.dbr","mod_wanez/creatures/enemies/hero/chthoniandevourer_h05.dbr"}
}
local poolChthonian02 = {
	["Common"]={"mod_wanez/creatures/enemies/chthoniandevourer_a01.dbr","mod_wanez/creatures/enemies/chthoniandreadguard_a01.dbr"},
	["Champion"]={"mod_wanez/creatures/enemies/chthoniandevourer_b01.dbr","mod_wanez/creatures/enemies/chthoniandevourer_b02.dbr","mod_wanez/creatures/enemies/chthoniandreadguard_b01.dbr","mod_wanez/creatures/enemies/chthoniandreadguard_c01.dbr","mod_wanez/creatures/enemies/chthoniandreadguard_c02.dbr"},
	["Hero"]={"mod_wanez/creatures/enemies/hero/chthoniandreadguard_h01.dbr","mod_wanez/creatures/enemies/hero/chthoniandreadguard_h02.dbr","mod_wanez/creatures/enemies/hero/chthoniandreadguard_h03.dbr","mod_wanez/creatures/enemies/hero/chthoniandreadguard_h04.dbr","mod_wanez/creatures/enemies/hero/chthoniandreadguard_h05.dbr"}
}
local poolGhost01 = {
	["Common"]={"mod_wanez/creatures/enemies/ghost_a01.dbr","mod_wanez/creatures/enemies/ghost_a02.dbr"},
	["Champion"]={"mod_wanez/creatures/enemies/ghost_b01.dbr","mod_wanez/creatures/enemies/ghost_b02.dbr","mod_wanez/creatures/enemies/ghost_b03.dbr","mod_wanez/creatures/enemies/ghost_b04.dbr"},
	["Hero"]={"mod_wanez/creatures/enemies/hero/ghost_h01.dbr","mod_wanez/creatures/enemies/hero/ghost_h02.dbr","mod_wanez/creatures/enemies/hero/ghost_h03.dbr","mod_wanez/creatures/enemies/hero/ghost_h04.dbr","mod_wanez/creatures/enemies/hero/ghost_h05.dbr","mod_wanez/creatures/enemies/hero/ghost_h06.dbr"}
}
local poolBonerat01 = {
	["Common"]={"mod_wanez/creatures/enemies/bonerat_meleea01.dbr","mod_wanez/creatures/enemies/bonerat_rangeda01.dbr"},
	["Champion"]={"mod_wanez/creatures/enemies/bonerat_meleeb01.dbr","mod_wanez/creatures/enemies/bonerat_meleeb02.dbr"},
	["Hero"]={"mod_wanez/creatures/enemies/hero/bonerat_melee_h01.dbr","mod_wanez/creatures/enemies/hero/bonerat_melee_h02.dbr","mod_wanez/creatures/enemies/hero/bonerat_melee_h03.dbr","mod_wanez/creatures/enemies/hero/bonerat_melee_h04.dbr","mod_wanez/creatures/enemies/hero/bonerat_melee_h05.dbr","mod_wanez/creatures/enemies/hero/bonerat_melee_h06.dbr","mod_wanez/creatures/enemies/hero/bonerat_ranged_h01.dbr"}
}
local poolHuman01 = {
	["Common"]={"mod_wanez/creatures/enemies/human_possessed_a01.dbr","mod_wanez/creatures/enemies/human_possessed_a02.dbr"},
	["Champion"]={"mod_wanez/creatures/enemies/human_possessed_b01.dbr","mod_wanez/creatures/enemies/human_possessed_c01.dbr"},
	["Hero"]={"mod_wanez/creatures/enemies/hero/human_possessed_h01.dbr","mod_wanez/creatures/enemies/hero/human_possessed_h02.dbr","mod_wanez/creatures/enemies/hero/human_possessed_h03.dbr","mod_wanez/creatures/enemies/hero/human_possessed_h04.dbr","mod_wanez/creatures/enemies/hero/human_possessed_h05.dbr"}
}
local poolMosquito01 = {
	["Common"]={"mod_wanez/creatures/enemies/mosquitogiant_a01.dbr","mod_wanez/creatures/enemies/mosquitogiantb_a01.dbr","mod_wanez/creatures/enemies/mosquitogiant_b01.dbr","mod_wanez/creatures/enemies/mosquitogiantb_b01.dbr"},
	["Champion"]={"mod_wanez/creatures/enemies/mosquitogiant_c01.dbr","mod_wanez/creatures/enemies/mosquitogiantb_c01.dbr"},
	["Hero"]={"mod_wanez/creatures/enemies/hero/mosquitogiant_h01.dbr","mod_wanez/creatures/enemies/hero/mosquitogiant_h02.dbr","mod_wanez/creatures/enemies/hero/mosquitogiant_h03.dbr","mod_wanez/creatures/enemies/hero/mosquitogiant_h04.dbr","mod_wanez/creatures/enemies/hero/mosquitogiant_h05.dbr"}
}
local poolTroll01 = {
	["Common"]={"mod_wanez/creatures/enemies/trollhalfswamp_a01.dbr","mod_wanez/creatures/enemies/trollhalfswamp_a02.dbr"},
	["Champion"]={"mod_wanez/creatures/enemies/trollhalfswamp_b01.dbr","mod_wanez/creatures/enemies/trollhalfswamp_b02.dbr","mod_wanez/creatures/enemies/trollhalfswamp_b03.dbr","mod_wanez/creatures/enemies/trollhalfswamp_c01.dbr"},
	["Hero"]={"mod_wanez/creatures/enemies/hero/trollhalfswamp_h01.dbr","mod_wanez/creatures/enemies/hero/trollhalfswamp_h02.dbr","mod_wanez/creatures/enemies/hero/trollhalfswamp_h03.dbr","mod_wanez/creatures/enemies/hero/trollhalfswamp_h04.dbr"}
}
local poolDermapteran01 = {
	["Common"]={"mod_wanez/creatures/enemies/dermapteran_weavilspawner_a01.dbr","mod_wanez/creatures/enemies/dermapteranweavil_a01.dbr"},
	["Champion"]={"mod_wanez/creatures/enemies/dermapteran_b01.dbr","mod_wanez/creatures/enemies/dermapteran_b02.dbr","mod_wanez/creatures/enemies/dermapteran_c01.dbr","mod_wanez/creatures/enemies/dermapteran_c02.dbr"},
	["Hero"]={"mod_wanez/creatures/enemies/hero/dermapteran_h01.dbr","mod_wanez/creatures/enemies/hero/dermapteran_h02.dbr","mod_wanez/creatures/enemies/hero/dermapteran_h03.dbr","mod_wanez/creatures/enemies/hero/dermapteran_h04.dbr","mod_wanez/creatures/enemies/hero/dermapteran_h05.dbr"}
}
local poolGroble01 = {
	["Common"]={"mod_wanez/creatures/enemies/groblea_ranged_a01.dbr","mod_wanez/creatures/enemies/groblea_scavenger_a01.dbr"},
	["Champion"]={"mod_wanez/creatures/enemies/groblea_shaman_a01.dbr","mod_wanez/creatures/enemies/groblea_shaman_b01.dbr","mod_wanez/creatures/enemies/groblea_warrior_a01.dbr","mod_wanez/creatures/enemies/groblea_warrior_b01.dbr"},
	["Hero"]={"mod_wanez/creatures/enemies/hero/groble_h01.dbr","mod_wanez/creatures/enemies/hero/groble_h02.dbr","mod_wanez/creatures/enemies/hero/groble_h03.dbr","mod_wanez/creatures/enemies/hero/groble_h04.dbr","mod_wanez/creatures/enemies/hero/groble_h05.dbr","mod_wanez/creatures/enemies/hero/groble_h06.dbr","mod_wanez/creatures/enemies/hero/groble_shaman_h03.dbr","mod_wanez/creatures/enemies/hero/groblea_shaman_h01.dbr","mod_wanez/creatures/enemies/hero/groblea_shaman_h02.dbr"}
}
local poolGroble02 = {
	["Common"]={"mod_wanez/creatures/enemies/grobleb_ranged_a01.dbr","mod_wanez/creatures/enemies/grobleb_scavenger_a01.dbr"},
	["Champion"]={"mod_wanez/creatures/enemies/grobleb_shaman_a01.dbr","mod_wanez/creatures/enemies/grobleb_shaman_b01.dbr","mod_wanez/creatures/enemies/grobleb_warrior_a01.dbr","mod_wanez/creatures/enemies/grobleb_warrior_b01.dbr"},
	["Hero"]={"mod_wanez/creatures/enemies/hero/groble_h01.dbr","mod_wanez/creatures/enemies/hero/groble_h02.dbr","mod_wanez/creatures/enemies/hero/groble_h03.dbr","mod_wanez/creatures/enemies/hero/groble_h04.dbr","mod_wanez/creatures/enemies/hero/groble_h05.dbr","mod_wanez/creatures/enemies/hero/groble_h06.dbr","mod_wanez/creatures/enemies/hero/groble_shaman_h03.dbr","mod_wanez/creatures/enemies/hero/groblea_shaman_h01.dbr","mod_wanez/creatures/enemies/hero/groblea_shaman_h02.dbr"}
}
local poolGroble03 = {
	["Common"]={"mod_wanez/creatures/enemies/groblec_ranged_a01.dbr","mod_wanez/creatures/enemies/groblec_scavenger_a01.dbr"},
	["Champion"]={"mod_wanez/creatures/enemies/groblec_shaman_a01.dbr","mod_wanez/creatures/enemies/groblec_shaman_b01.dbr","mod_wanez/creatures/enemies/groblec_warrior_a01.dbr","mod_wanez/creatures/enemies/groblec_warrior_b01.dbr"},
	["Hero"]={"mod_wanez/creatures/enemies/hero/groble_h01.dbr","mod_wanez/creatures/enemies/hero/groble_h02.dbr","mod_wanez/creatures/enemies/hero/groble_h03.dbr","mod_wanez/creatures/enemies/hero/groble_h04.dbr","mod_wanez/creatures/enemies/hero/groble_h05.dbr","mod_wanez/creatures/enemies/hero/groble_h06.dbr","mod_wanez/creatures/enemies/hero/groble_shaman_h03.dbr","mod_wanez/creatures/enemies/hero/groblea_shaman_h01.dbr","mod_wanez/creatures/enemies/hero/groblea_shaman_h02.dbr"}
}
local poolGroble04 = {
	["Common"]={"mod_wanez/creatures/enemies/grobled_ranged_a01.dbr","mod_wanez/creatures/enemies/grobled_scavenger_a01.dbr"},
	["Champion"]={"mod_wanez/creatures/enemies/grobled_shaman_a01.dbr","mod_wanez/creatures/enemies/grobled_shaman_b01.dbr","mod_wanez/creatures/enemies/grobled_warrior_a01.dbr","mod_wanez/creatures/enemies/grobled_warrior_b01.dbr"},
	["Hero"]={"mod_wanez/creatures/enemies/hero/groble_h01.dbr","mod_wanez/creatures/enemies/hero/groble_h02.dbr","mod_wanez/creatures/enemies/hero/groble_h03.dbr","mod_wanez/creatures/enemies/hero/groble_h04.dbr","mod_wanez/creatures/enemies/hero/groble_h05.dbr","mod_wanez/creatures/enemies/hero/groble_h06.dbr","mod_wanez/creatures/enemies/hero/groble_shaman_h03.dbr","mod_wanez/creatures/enemies/hero/groblea_shaman_h01.dbr","mod_wanez/creatures/enemies/hero/groblea_shaman_h02.dbr"}
}
local poolGroble05 = {
	["Common"]={"mod_wanez/creatures/enemies/groblee_ranged_a01.dbr","mod_wanez/creatures/enemies/groblee_scavenger_a01.dbr"},
	["Champion"]={"mod_wanez/creatures/enemies/groblee_shaman_a01.dbr","mod_wanez/creatures/enemies/groblee_shaman_b01.dbr","mod_wanez/creatures/enemies/groblee_warrior_a01.dbr","mod_wanez/creatures/enemies/groblee_warrior_b01.dbr"},
	["Hero"]={"mod_wanez/creatures/enemies/hero/groble_h01.dbr","mod_wanez/creatures/enemies/hero/groble_h02.dbr","mod_wanez/creatures/enemies/hero/groble_h03.dbr","mod_wanez/creatures/enemies/hero/groble_h04.dbr","mod_wanez/creatures/enemies/hero/groble_h05.dbr","mod_wanez/creatures/enemies/hero/groble_h06.dbr","mod_wanez/creatures/enemies/hero/groble_shaman_h03.dbr","mod_wanez/creatures/enemies/hero/groblea_shaman_h01.dbr","mod_wanez/creatures/enemies/hero/groblea_shaman_h02.dbr"}
}
local poolHumanOutlaw01 = {
	["Common"]={"mod_wanez/creatures/enemies/humanoutlaw_aether_a01.dbr","mod_wanez/creatures/enemies/humanoutlaw_aether_a02.dbr","mod_wanez/creatures/enemies/humanoutlaw_melee_a01.dbr","mod_wanez/creatures/enemies/humanoutlaw_melee_b01.dbr","mod_wanez/creatures/enemies/humanoutlaw_meleef_a01.dbr","mod_wanez/creatures/enemies/humanoutlaw_ranged_a01.dbr","mod_wanez/creatures/enemies/humanoutlaw_rangedf_a01.dbr"},
	["Champion"]={"mod_wanez/creatures/enemies/humanoutlaw_aether_b02.dbr","mod_wanez/creatures/enemies/humanoutlaw_aether_b03.dbr","mod_wanez/creatures/enemies/humanoutlaw_aether_c01.dbr","mod_wanez/creatures/enemies/humanoutlaw_melee_b02.dbr","mod_wanez/creatures/enemies/humanoutlaw_melee_b03.dbr","mod_wanez/creatures/enemies/humanoutlaw_arsonist_c01.dbr","mod_wanez/creatures/enemies/humanoutlaw_arsonistf_c01.dbr","mod_wanez/creatures/enemies/humanoutlaw_heretic_c01.dbr","mod_wanez/creatures/enemies/humanoutlaw_hereticf_c01.dbr","mod_wanez/creatures/enemies/humanoutlaw_murderer_c01.dbr","mod_wanez/creatures/enemies/humanoutlaw_murdererf_c01.dbr"},
	["Hero"]={"mod_wanez/creatures/enemies/hero/humanoutlaw_aether_h01.dbr","mod_wanez/creatures/enemies/hero/humanoutlaw_aether_h02.dbr","mod_wanez/creatures/enemies/hero/humanoutlaw_convict_h01.dbr"}
}
local poolManticore01 = {
	["Common"]={"mod_wanez/creatures/enemies/manticore_a01.dbr","mod_wanez/creatures/enemies/manticore_aether_a01.dbr","mod_wanez/creatures/enemies/manticoreb_a01.dbr"},
	["Champion"]={"mod_wanez/creatures/enemies/manticore_aether_b01.dbr","mod_wanez/creatures/enemies/manticore_aether_c01.dbr","mod_wanez/creatures/enemies/manticore_b01.dbr","mod_wanez/creatures/enemies/manticore_c01.dbr","mod_wanez/creatures/enemies/manticoreb_b01.dbr","mod_wanez/creatures/enemies/manticoreb_c01.dbr"},
	["Hero"]={"mod_wanez/creatures/enemies/hero/manticore_h01.dbr","mod_wanez/creatures/enemies/hero/manticore_h02.dbr","mod_wanez/creatures/enemies/hero/manticore_h03.dbr","mod_wanez/creatures/enemies/hero/manticore_h04.dbr","mod_wanez/creatures/enemies/hero/manticore_h05.dbr","mod_wanez/creatures/enemies/hero/manticore_h06.dbr"}
}
local poolX01 = {
	["Common"]={"mod_wanez/creatures/enemies/.dbr"},
	["Champion"]={"mod_wanez/creatures/enemies/.dbr"},
	["Hero"]={"mod_wanez/creatures/enemies/hero/.dbr"}
}
local poolMiscAetherCrystal = {
	"mod_wanez/creatures/anomalies/aethercrystal_a01.dbr","mod_wanez/creatures/anomalies/aethercrystal_a02.dbr","mod_wanez/creatures/anomalies/aethercrystal_a03.dbr"
}
local poolMiscAetherObelisk = {
	"mod_wanez/creatures/enemies/aetherialobelisk_a01.dbr"
}

monsterPackPools = {
	[1]=poolZombie01,
	[2]=poolHarpy01,
	[3]=poolSlith01,
	[4]=poolSkeleton01,
	[5]=poolBoar01,
	[6]=poolChthonian01,
	[7]=poolChthonian02,
	[8]=poolGhost01,
	[9]=poolBonerat01,
	[10]=poolHuman01,
	[11]=poolMosquito01,
	[12]=poolTroll01,
	[13]=poolDermapteran01,
	[14]=poolGroble01,
	[15]=poolGroble02,
	[16]=poolGroble03,
	[17]=poolGroble04,
	[18]=poolGroble05,
	[19]=poolHumanOutlaw01,
	[20]=poolManticore01
}
local enemyMiniBossPool = {
	[1]="mod_wanez/creatures/enemies/boss&quest/banditminiboss_edmund.dbr",
	[2]="mod_wanez/creatures/enemies/boss&quest/banditminiboss_lieutenant_01.dbr",
	[3]="mod_wanez/creatures/enemies/boss&quest/banditminiboss_lieutenant_02.dbr",
	[4]="mod_wanez/creatures/enemies/boss&quest/banditminiboss_lieutenant_03.dbr",
	[5]="mod_wanez/creatures/enemies/boss&quest/banditminiboss_lieutenant_04.dbr",
	[6]="mod_wanez/creatures/enemies/boss&quest/banditminiboss_lieutenant_05.dbr",
	[7]="mod_wanez/creatures/enemies/boss&quest/banditminiboss_lieutenant_06.dbr"
	--[]="mod_wanez/creatures/enemies/boss&quest/.dbr"
}

local enemyBossPools = {
	[1]="mod_wanez/creatures/enemies/boss&quest/banditminiboss_coastcaveboss.dbr",
	[2]="mod_wanez/creatures/enemies/boss&quest/slith_wightmirecave01.dbr",
	[3]="mod_wanez/creatures/enemies/boss&quest/skeleton_undercity_01.dbr",
	[4]="mod_wanez/creatures/enemies/boss&quest/banditminiboss_pitmaster.dbr",
	[5]="mod_wanez/creatures/enemies/boss&quest/aetherial_fleshhulk_mine.dbr", -- Chest 01
	[6]="mod_wanez/creatures/enemies/boss&quest/aetherialabomination_01.dbr", -- Chest 02
	[7]="mod_wanez/creatures/enemies/boss&quest/aetherialcommander_01.dbr", -- Chest 02
	[8]="mod_wanez/creatures/enemies/boss&quest/banditminiboss_mine01.dbr",
	[9]="mod_wanez/creatures/enemies/boss&quest/banditminiboss_mine02.dbr",
	[10]="mod_wanez/creatures/enemies/boss&quest/chthonian_kymonsecret_01.dbr",
	[11]="mod_wanez/creatures/enemies/boss&quest/chthoniandevourer_chthonicvoid.dbr", -- 02
	[12]="mod_wanez/creatures/enemies/boss&quest/chthonianleech_necropolis_01.dbr", -- 02
	[13]="mod_wanez/creatures/enemies/boss&quest/chthonianleech_void_01.dbr", -- 02
	[14]="mod_wanez/creatures/enemies/boss&quest/cultist_captain_01.dbr",
	[15]="mod_wanez/creatures/enemies/boss&quest/cultist_captain_02.dbr",
	[16]="mod_wanez/creatures/enemies/boss&quest/cultist_cultleader_01.dbr",
	[17]="mod_wanez/creatures/enemies/boss&quest/dermapteran_vizier01.dbr",
	[18]="mod_wanez/creatures/enemies/boss&quest/dermapteran_vizier02.dbr",
	[19]="mod_wanez/creatures/enemies/boss&quest/dermapteran_vizier03.dbr",
	[20]="mod_wanez/creatures/enemies/boss&quest/dranghoul_jaggedwaste.dbr", -- 02
	[21]="mod_wanez/creatures/enemies/boss&quest/ghost_arkovianfoothills_01.dbr",
	[22]="mod_wanez/creatures/enemies/boss&quest/ghost_maninneed_01.dbr",
	[23]="mod_wanez/creatures/enemies/boss&quest/ghost_necroritual_01.dbr",
	[24]="mod_wanez/creatures/enemies/boss&quest/ghost_oligarch_01.dbr",
	[25]="mod_wanez/creatures/enemies/boss&quest/ghost_oligarch_02.dbr",
	[26]="mod_wanez/creatures/enemies/boss&quest/ghost_oligarch_03.dbr",
	[27]="mod_wanez/creatures/enemies/boss&quest/ghoul_factioncrypt_01.dbr", -- 02
	[28]="mod_wanez/creatures/enemies/boss&quest/ghoul_kymoncrypt_01.dbr", -- 02
	[29]="mod_wanez/creatures/enemies/boss&quest/ghoul_necropolis_01.dbr", -- 02
	[30]="mod_wanez/creatures/enemies/boss&quest/golemrock_miniboss_cave.dbr",
	[31]="mod_wanez/creatures/enemies/boss&quest/golemrock_miniboss_cave_02.dbr",
	[32]="mod_wanez/creatures/enemies/boss&quest/groble_burrwitchoutskirts_01.dbr",
	[33]="mod_wanez/creatures/enemies/boss&quest/grundleplith.dbr",
	[34]="mod_wanez/creatures/enemies/boss&quest/yeti_asterkarnmountains_01.dbr"
	--[]="mod_wanez/creatures/enemies/boss&quest/.dbr"
}
local enemyRaidPools = {
	[1]="mod_wanez/creatures/enemies/boss&quest/banditleader_darius.dbr",
	[2]="mod_wanez/creatures/enemies/boss&quest/chthonian_chthonicroguelike_01.dbr",
	[3]="mod_wanez/creatures/enemies/boss&quest/cultist_chthonianmonstrosity.dbr"
	--[]="mod_wanez/creatures/enemies/boss&quest/.dbr"
}
waEnemyPools = {
	["Boss"] = enemyBossPools,
	["Packs"]= monsterPackPools,
	["Aether"] = {poolMiscAetherCrystal,poolMiscAetherObelisk}
}
waBossPoolsPerArea = {
	[1]={8},
	[2]={2},
	[3]={3},
	[4]={9},
	[5]={10},
	[6]={16},
	[7]={34}
}
waEnemyNemesisPool = {
	"mod_wanez/creatures/enemies/nemesis/nemesis_aetherial_01.dbr",
	"mod_wanez/creatures/enemies/nemesis/nemesis_aetherial_02.dbr",
	"mod_wanez/creatures/enemies/nemesis/nemesis_aetherial_03.dbr",
	"mod_wanez/creatures/enemies/nemesis/nemesis_chthonian_01.dbr",
	"mod_wanez/creatures/enemies/nemesis/nemesis_chthonian_02.dbr",
	"mod_wanez/creatures/enemies/nemesis/nemesis_chthonian_03.dbr",
	"mod_wanez/creatures/enemies/nemesis/nemesis_kymon_01.dbr",
	"mod_wanez/creatures/enemies/nemesis/nemesis_kymon_02.dbr",
	"mod_wanez/creatures/enemies/nemesis/nemesis_orderdeathsvigil_01.dbr",
	"mod_wanez/creatures/enemies/nemesis/nemesis_orderdeathsvigil_02.dbr",
	"mod_wanez/creatures/enemies/nemesis/nemesis_outlaw_01.dbr",
	"mod_wanez/creatures/enemies/nemesis/nemesis_outlaw_02.dbr",
	"mod_wanez/creatures/enemies/nemesis/nemesis_outlaw_03.dbr",
	"mod_wanez/creatures/enemies/nemesis/nemesis_undead_01.dbr",
	"mod_wanez/creatures/enemies/nemesis/nemesis_undead_02a.dbr",
	"mod_wanez/creatures/enemies/nemesis/nemesis_undead_02b.dbr",
	"mod_wanez/creatures/enemies/nemesis/nemesis_undead_03.dbr"
}
-- For randomized DGA selection
waBasicDGAPool = {1,2,3,4,5,6,7}

-- Common Chest Pool
local poolCommonChests = {
	"mod_wanez/items/chests/containers/dga_common_01.dbr","mod_wanez/items/chests/containers/dga_common_02.dbr"
}
local poolRareChests = {
	"mod_wanez/items/chests/containers/dga_rare_01.dbr"
}
-- Pool for Basic DGA (Linear)
local poolRandomChest01 = {
	["Common"]=poolCommonChests,
	["Rare"]=poolRareChests,
	["Special"]={"mod_wanez/items/chests/containers/dga_special_01.dbr"},
	["Boss"]={"mod_wanez/items/chests/containers/dga_boss_01.dbr"}
}
-- Pool for Basic DGA (Maze)
local poolRandomChest02 = {
	["Common"]=poolCommonChests,
	["Rare"]=poolRareChests,
	["Special"]={},
	["Boss"]={}
}
-- Pool for Endless DGA (Linear)
local poolRandomChest11 = {
	["Common"]=poolCommonChests,
	["Rare"]=poolRareChests,
	["Special"]={},
	["Boss"]={}
}
-- Pool for Endless DGA (Maze)
local poolRandomChest12 = {
	["Common"]=poolCommonChests,
	["Rare"]=poolRareChests,
	["Special"]={},
	["Boss"]={}
}
-- Pool for Special01 DGA
local poolSpecialChest01 = {
	["Common"]=poolCommonChests,
	["Rare"]=poolRareChests,
	["Special"]={},
	["Boss"]={}
}
-- Pool for Raid DGA
-- Pool for Gauntlet/Labyrinth
-- new pool
local poolY01 = {
	["Common"]=poolCommonChests,
	["Rare"]=poolRareChests,
	["Special"]={},
	["Boss"]={}
}
waContainerPool = {
	-- BASIC (LINEAR)
	[1]=poolRandomChest01,
	[2]=poolRandomChest01,
	[3]=poolRandomChest01,
	[4]=poolRandomChest01,
	[5]=poolRandomChest01,
	[6]=poolRandomChest01,
	[7]=poolRandomChest01,
	-- BASIC (MAZE)
	-- ENDLESS (LINEAR)
	[101]=poolRandomChest11,
	[102]=poolRandomChest11
	-- ENDLESS (MAZE)
	-- SPECIAL
}
-- additional settings for SpecialID
waSpecialPool = {}

/**
 * LOOT / DROPS
 */
waDGARewards = {
	["Containers"] = {
		[1]="mod_wanez/items/chests/containers/dga_reward_01.dbr",
		[2]="mod_wanez/items/chests/containers/dga_reward_02.dbr",
		[3]="mod_wanez/items/chests/containers/dga_reward_03.dbr"
	},
	["Keys"] = {
		[1]="mod_wanez/items/dga/key_reward_01.dbr",
		[2]="mod_wanez/items/dga/key_reward_02.dbr",
		[3]="mod_wanez/items/dga/key_reward_03.dbr"
	}
}
waDGAKeys = {
	[1]={
		--[0] = "mod_wanez/items/dga/key_normal_00.dbr",
		[1] = "mod_wanez/items/dga/key_normal_01.dbr",
		[2] = "mod_wanez/items/dga/key_normal_02.dbr",
		[3] = "mod_wanez/items/dga/key_normal_03.dbr",
		[4] = "mod_wanez/items/dga/key_normal_04.dbr",
		[5] = "mod_wanez/items/dga/key_normal_05.dbr"
	},
	[2]={
		--[0] = "mod_wanez/items/dga/key_elite_00.dbr",
		[1] = "mod_wanez/items/dga/key_elite_01.dbr",
		[2] = "mod_wanez/items/dga/key_elite_02.dbr",
		[3] = "mod_wanez/items/dga/key_elite_03.dbr",
		[4] = "mod_wanez/items/dga/key_elite_04.dbr",
		[5] = "mod_wanez/items/dga/key_elite_05.dbr",
		[6] = "mod_wanez/items/dga/key_elite_06.dbr",
		[7] = "mod_wanez/items/dga/key_elite_07.dbr",
		[8] = "mod_wanez/items/dga/key_elite_08.dbr",
		[9] = "mod_wanez/items/dga/key_elite_09.dbr",
		[10] = "mod_wanez/items/dga/key_elite_10.dbr"
	},
	[3]={
		[1] = "mod_wanez/items/dga/key_ultimate_01.dbr",
		[2] = "mod_wanez/items/dga/key_ultimate_02.dbr",
		[3] = "mod_wanez/items/dga/key_ultimate_03.dbr",
		[4] = "mod_wanez/items/dga/key_ultimate_04.dbr",
		[5] = "mod_wanez/items/dga/key_ultimate_05.dbr",
		[6] = "mod_wanez/items/dga/key_ultimate_06.dbr",
		[7] = "mod_wanez/items/dga/key_ultimate_07.dbr",
		[8] = "mod_wanez/items/dga/key_ultimate_08.dbr",
		[9] = "mod_wanez/items/dga/key_ultimate_09.dbr",
		[10] = "mod_wanez/items/dga/key_ultimate_10.dbr",
		[11] = "mod_wanez/items/dga/key_ultimate_11.dbr",
		[12] = "mod_wanez/items/dga/key_ultimate_12.dbr",
		[13] = "mod_wanez/items/dga/key_ultimate_13.dbr",
		[14] = "mod_wanez/items/dga/key_ultimate_14.dbr",
		[15] = "mod_wanez/items/dga/key_ultimate_15.dbr"
		-- AND MORE
	}
}
local listDGAComp = {
	{
		[1] = {
			{"mod_wanez/items/dga/comp_normal_01.dbr"},
			{"mod_wanez/items/dga/comp_normal_02.dbr"},
			{"mod_wanez/items/dga/comp_normal_03.dbr"},
			{"mod_wanez/items/dga/comp_normal_04.dbr"},
			{"mod_wanez/items/dga/comp_normal_05.dbr"}
		},
		[2] = {
			{"mod_wanez/items/dga/comp_elite_01.dbr"},
			{"mod_wanez/items/dga/comp_elite_02.dbr"},
			{"mod_wanez/items/dga/comp_elite_03.dbr"},
			{"mod_wanez/items/dga/comp_elite_04.dbr"},
			{"mod_wanez/items/dga/comp_elite_05.dbr"},
			{"mod_wanez/items/dga/comp_elite_06.dbr"},
			{"mod_wanez/items/dga/comp_elite_07.dbr"},
			{"mod_wanez/items/dga/comp_elite_08.dbr"},
			{"mod_wanez/items/dga/comp_elite_09.dbr"},
			{"mod_wanez/items/dga/comp_elite_10.dbr"}
		},
		[3] = {
			{"mod_wanez/items/dga/comp_ultimate_01.dbr"},
			{"mod_wanez/items/dga/comp_ultimate_02.dbr"},
			{"mod_wanez/items/dga/comp_ultimate_03.dbr"},
			{"mod_wanez/items/dga/comp_ultimate_04.dbr"},
			{"mod_wanez/items/dga/comp_ultimate_05.dbr"},
			{"mod_wanez/items/dga/comp_ultimate_06.dbr"},
			{"mod_wanez/items/dga/comp_ultimate_07.dbr"},
			{"mod_wanez/items/dga/comp_ultimate_08.dbr"},
			{"mod_wanez/items/dga/comp_ultimate_09.dbr"},
			{"mod_wanez/items/dga/comp_ultimate_10.dbr"}
		}
	}
	
}
local listDGAToken = {
	--["Upgrade"] = 
	{
		[1] = {
			{"mod_wanez/items/dga/upgrade_token_01.dbr"}
		},
		[2] = {
			{"mod_wanez/items/dga/upgrade_token_01.dbr"}
		},
		[3] = {
			{"mod_wanez/items/dga/upgrade_token_01.dbr"}
		}
	}
}
local listCurrency = {
	{
		[1] = {
			{"mod_wanez/items/token/currency_normal_01.dbr"},
			{"mod_wanez/items/token/currency_normal_01.dbr"},
			{"mod_wanez/items/token/currency_normal_02.dbr",15},
			{"mod_wanez/items/token/currency_normal_03.dbr",35},
			{"mod_wanez/items/token/currency_normal_04.dbr",75}
		},
		[2] = {
			--{"mod_wanez/items/token/currency_normal_01.dbr"},
			{"mod_wanez/items/token/currency_normal_02.dbr"},
			{"mod_wanez/items/token/currency_normal_03.dbr"},
			{"mod_wanez/items/token/currency_normal_04.dbr"}
			--{"mod_wanez/items/token/currency_normal_05.dbr"}
		},
		[3] = {
			--{"mod_wanez/items/token/currency_normal_01.dbr"},
			--{"mod_wanez/items/token/currency_normal_02.dbr"},
			--{"mod_wanez/items/token/currency_normal_03.dbr"},
			{"mod_wanez/items/token/currency_normal_04.dbr"},
			{"mod_wanez/items/token/currency_normal_05.dbr"}
		}
	}
}
/*
 * {x,y,z}
 *  x: int max (random(min,max))
 *  y: int chance (minimum int required to roll)
 *  z: array number of rolls (amount of loot-slots)
 * 1: Type
 */
waDropRandomizer = {
	["Classification"] = {
		[1] = { -- Common
			"Common",
			{{50,1}}
		},
		[2] = { -- Champion
			"Champion",
			{{25,1}}
		},
		[3] = { -- Hero
			"Hero",
			{{10,1},{20,1}}
		},
		[4] = { -- Mini-Boss
			"MiniBoss",
			{{5,1},{15,1}}
		},
		[5] = { -- Boss
			"Boss",
			{{3,1},{5,1}}
		},
		[6] = { -- Nemesis
			"Nemesis",
			{{3,1},{5,1}}
		},
		[7] = { -- Raid
			"Raid",
			{{3,1},{5,1}}
		},
		[8] = { -- Uber
			"Uber",
			{{3,1},{5,1}}
		}
	}
}
/* {x,{y,z,...}}
 *  x: int max (random(min,max))
 *  y,z: int chance - order has to be the same with waLootTable and organized from lowest to highest
 */
waLootRatio = {
	["Type"] = {100,{70,100}}
}
/*
 * - UseTier: array using bool - true will use the map-tier instead [LevelRequirements still applies]
 */
waLootTable = {
	[1] = {
		["Name"] = "DGA",
		["LevelRequirements"] = {50,70,85},
		["UseTier"] = {{2,1},false},
		["Lists"] = {
			listDGAComp,
			listDGAToken
		}
	},
	[2] = {
		["Name"] = "Currency",
		["LevelRequirements"] = {0,50,80},
		["UseTier"] = {false},
		["Lists"] = {
			listCurrency
		}
	}
	-- Artifacts
}

-- {QuestID,TaskID} pairs
waDGAQuestPool = {
	{0xB1E80D00,0xF9C04D00}, -- Repeatable01 (Kill DGA Boss)
	{0x61B19780,0xD2572B00}, -- SpecialID 1 - Task 1
	{0x61B19780,0xF0A71600} -- SpecialID 1 - Task 5
}
-- DBR,int base Chance
waDGAUberComponents = {
	{"mod_wanez/items/dga/special_01b_material.dbr",5}
}

/*
 * List of IDs set dynamically
 * MapID (Area/Region)
 * 1 - Map001
 * 2 - Map002
 * 3 - Map003
 * 4 - Map003
 * 
 * Special Maps starting at ID 100
 * 100 - Endless001
 *
 */