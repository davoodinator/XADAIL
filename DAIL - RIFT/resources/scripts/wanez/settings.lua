/**
 * DGA-Settings
 * change the values as you like, just be careful with it, 
 * as it may cause the script to crash/stop
 *
 * @author WareBare
 * @version v0.3.0 [BETA]
 *
 * Updated: 06/11/2016
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
-- Level Offset depending on the Enemy
local EnemyLevelOffset = {
	["Common"] = 0, -- Common Enemy (white)
	["Champion"] = 1, -- Champion Enemy (Yellow)
	["Hero"] = 2, -- Hero Enemy (Star + Orb onDie)
	["MiniBoss"] = 2, -- Nemesis (Small)
	["Boss"] = 3, -- DGA Boss, Endless Boss, Special Boss
	["Nemesis"] = 4, -- Nemesis
	["Raid"] = 5, -- Raid Boss (only found in Special DGA)
	["Uber"] = 10, -- Uber Boss (v2.0)
	["AetherObelisk"] = 1,
	["AetherCrystal"] = 2
}
-- Bonus Offset depending on the DGA-Category
local CategoryLevelOffset = {
	["Default"] = 0, -- Endless DGA, Basic DGA
	["Special"] = 1, -- SPecial DGA
	["Uber"] = 6, -- Special Uber DGA
	["Raid"] = 5, -- Special DGA (RAID)
	["UberRaid"] = 10 -- Special Uber DGA (UBER RAID)
}
/**
 * Enemy Count
 */
local EnemyCount = {
	["Common"] = {{4,5},{4,6},{4,6}},
	["Champion"] = {{3,4},{3,5},{4,5}},
	["Hero"] = {1,2,2},
	["Nemesis"] = {{0,1},{1,1},{1,2}} -- not in difficulty but faction rank {Despised},{Hated},{Nemesis}
}
local EntityChance = {
	["Containers"] = {
		["Common"] = {5,10,15},
		["Rare"] = {2,4,6}
	},
	["Enemies"] = {
		["Champion"] = {30,45,60},
		["Hero"] = {30,75,100},
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
	},
	["Category"] = {
		["LevelOffset"] = CategoryLevelOffset
	}
}
waDGARequirements = {
	["FreeTiers"] = { -- By Mode
		[1] = {2,2,2},
		[2] = {1,2,3},
		[3] = {1,1,1}
	},
	["DGAKey"] = {1,5,3}, -- DGA-Key requirement by Mode
	["DGAKeySpecial"] = {10}
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

waSpecialDGA = {
	{
		["CreditScale"]={1,3,5,7,10,15},
		["ReqBossCredit"]=1000, -- unsigned int
		["RespawnThreshold"] = 90 -- in percent
	}
}
