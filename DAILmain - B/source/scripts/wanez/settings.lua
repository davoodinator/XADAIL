/**
 * DGA-Settings
 * change the values as you like, just be careful with it, 
 * as it may cause the script to crash/stop
 *
 * @author WareBare
 * @version v0.2.0 [BETA]
 *
 * Updated: 05/31/2016
 */

/*
 * Difficulty:
 * - 1: NORMAL
 * - 2: ELITE
 * - 3: ULTIMATE
 */
local DifficultyLevelOffset = {0,0,0}
local TierThreshold = {6}
local rewardKeyThreshold = {0,2000,10000}
/**
 * Level Offsets
 */
local EnemyLevelOffset = {
	["Common"] = 0,
	["Champion"] = 1,
	["Hero"] = 2,
	["Boss"] = 3,
	["Nemesis"] = 4,
	["Raid"] = 5,
	["AetherObelisk"] = 1,
	["AetherCrystal"] = 2
}
local SpecialLevelOffset = {
	["Default"] = 0,
	["Raid"] = 2,
	["Uber"] = 3,
	["UberRaid"] = 5
}
/**
 * Enemy Count
 */
local EnemyCount = {
	["Common"] = {{4,5},{4,6},{4,6}},
	["Champion"] = {{3,4},{3,5},{4,5}},
	["Hero"] = {1,2,2}
}
local EntityChance = {
	["Containers"] = {
		["Common"] = {5,10,15},
		["Rare"] = {2,4,6}
	},
	["Enemies"] = {
		["Champion"] = {30,45,60},
		["Hero"] = {50,75,100},
		["Aether"] = {2,2,2} -- must be lower than Anomalies.Aether chance
	},
	["Anomalies"] = {
		["Aether"] = {15,20,25} -- must be lower than Enemies.Champion chance
	}
}
local EntityLevelRequirements = {
	["Enemies"] = {
		["Champion"] = 10,
		["Hero"] = 15,
		["Nemesis"] = 80
	}
}
waEntitySettings = {
	["Enemies"] = {
		["Count"] = EnemyCount,
		["LevelOffset"] = EnemyLevelOffset,
		["Chances"] = EntityChance.Enemies,
		["LevelRequirements"] = EntityLevelRequirements.Enemies
	},
	["Containers"] = {
		["Chances"] = EntityChance.Containers
	},
	["Difficulty"] = {
		["LevelOffset"] = DifficultyLevelOffset,
		["TierThreshold"] = TierThreshold
	},
	["Anomalies"] = {
		["Chances"] = EntityChance.Anomalies
	}
}
waDGARequirements = {
	["FreeTiers"] = { -- By Mode
		[1] = {2,2,2},
		[2] = {1,2,3},
		[3] = {1,1,1}
	},
	["DGAKey"] = {1,5,3} -- DGA-Key requirement by Mode
}

waCredit = {
	["Multiplier"] = {
		["Difficulty"] = {1,2,3},
		["Mode"] = {1,3,1}
	},
	["Rewards"] = {
		["Keys"] = rewardKeyThreshold
	}
}