/**
 * 
 * @author WareBare
 * @version v0.2.0 [BETA]
 *
 * Updated: 05/31/2016
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
local poolX01 = {
	["Common"]={},
	["Champion"]={},
	["Hero"]={}
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
	[12]=poolTroll01
}

local enemyBossPools = {
	[1]="mod_wanez/creatures/enemies/boss&quest/banditminiboss_coastcaveboss.dbr",
	[2]="mod_wanez/creatures/enemies/boss&quest/slith_wightmirecave01.dbr",
	[3]="mod_wanez/creatures/enemies/boss&quest/skeleton_undercity_01.dbr",
	[4]="mod_wanez/creatures/enemies/boss&quest/banditminiboss_pitmaster.dbr"
}
waEnemyPools = {
	["Boss"] = enemyBossPools,
	["Packs"]= monsterPackPools,
	["Aether"] = {poolMiscAetherCrystal,poolMiscAetherObelisk}
}

waBossPoolsPerArea = {
	[1]={1},
	[2]={2},
	[3]={3},
	[4]={4},
	[5]={4},
	[6]={4},
	[7]={4}
}

-- Common Chest Pool
local poolCommonChests = {
	"mod_wanez/items/chests/script_chest_common_01.dbr","mod_wanez/items/chests/script_chest_common_02.dbr"
}
local poolRareChests = {
	"mod_wanez/items/chests/script_chest_rare_01.dbr"
}
-- Pool for Basic DGA (Linear)
local poolRandomChest01 = {
	["Common"]=poolCommonChests,
	["Rare"]=poolRareChests,
	["Special"]={"mod_wanez/items/chests/script_chest_special_01.dbr"},
	["Boss"]={"mod_wanez/items/chests/script_chest_boss_01.dbr"}
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
waDGARewards = {
	["Containers"] = {
		[1]="mod_wanez/items/chests/script_chest_reward_01.dbr",
		[2]="mod_wanez/items/chests/script_chest_reward_02.dbr",
		[3]="mod_wanez/items/chests/script_chest_reward_03.dbr"
	},
	["Keys"] = {
		[1]="mod_wanez/items/dga/key_reward_01.dbr",
		[2]="mod_wanez/items/dga/key_reward_02.dbr",
		[3]="mod_wanez/items/dga/key_reward_03.dbr"
	}
}
-- waDGAKeys.DifficultyID.Tier
--waDGAFreeTiers = {
--	[1] = 
--}
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