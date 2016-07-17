--[[
arrays normaly use
Difficulty:
- 1: NORMAL
- 2: ELITE
- 3: ULTIMATE
]]--
local DifficultyLevelOffset = {0,0,0}
-- Bonus Level for Enemy Classifications
local EnemyLevelOffset = {
	["Common"] = 0, -- Common Enemy (white)
	["Champion"] = 1, -- Champion Enemy (Yellow)
	["Hero"] = 2, -- Hero Enemy (Star + Orb onDie)
	["MiniBoss"] = 2, -- Nemesis (Small)
	["Boss"] = 3, -- DGA Boss, Endless Boss, Special Boss
	["Nemesis"] = 4, -- Nemesis
	["RaidBoss"] = 10, -- Raid Boss (v0.5.x)
	["SoulEater"] = 5, -- Souleater (only found after making special NPCs angry)
	["AetherCrystal"] = 2,
	["AetherObelisk"] = 1
}
-- Bonus Offset depending on the DGA-Category
local CategoryLevelOffset = {
	["Default"] = 0, -- Endless DGA, Basic DGA
	["Special"] = 1, -- Special DGA
	["Uber"] = 6, -- Special Uber DGA
	["Raid"] = 5, -- Special DGA (RAID)
	["UberRaid"] = 10 -- Special Uber DGA (UBER RAID)
}
--[[
 * Enemy Count
]]
local EnemyCount = {
	["Common"] = {{4,5},{4,6},{4,6}},
	["Champion"] = {{3,4},{3,5},{4,5}},
	["Hero"] = {1,2,3},
	["Nemesis"] = {{0,1},{1,1},{1,2}} -- not in difficulty but faction rank {Despised},{Hated},{Nemesis}
}
-- chances: Enemies.Champion + Enemies.Aether + Anomalies.Aether != 100 or common enemies wont spawn and heroes can only spawn inside a common monster pack
local EntityChance = {
	["Containers"] = { -- Special don't have a chance because they contain items required to finish certain Special-DGA/Raids
		["Common"] = {5,10,15},
		["Rare"] = {2,4,6}
	},
	["Enemies"] = {
		["Champion"] = {20,30,40},
		["Hero"] = {{40,15,0},{75,40,10},{100,50,25}}, -- {1st},{2nd},{3rd} - hero chance (per common pack); 3rd chance won't be used if the hero count < 3
		["Aether"] = {1,1,1}
	},
	["Anomalies"] = {
		["Aether"] = {10,10,10}
	}
}
local EntityLevelRequirements = {
	["Enemies"] = {
		["Champion"] = 10,
		["Hero"] = 15,
		["Nemesis"] = 80,
        ["AetherObelisk"] = 25
        
	},
    ["Anomalies"] = {
        ["AetherCrystal"] = 10
    }
}
wanez._Settings = {
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
		["LevelOffset"] = DifficultyLevelOffset
		--["TierThreshold"] = TierThreshold
	},
	["Anomalies"] = {
		["Chances"] = EntityChance.Anomalies,
        ["LevelRequirements"] = EntityLevelRequirements.Anomalies
	},
	["Category"] = {
		["LevelOffset"] = CategoryLevelOffset
	}
}
