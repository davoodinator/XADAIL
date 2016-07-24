-- NPCPool.[1:int spawn chance;2:array Pools] - Pool: {string DBR,(optional) int spawn ratio [default: 1],(optional) array conversation settings [default: nil]} - ConversationSettings: int number of options, array ratio
local listRandomNPC = {
    {
        25,
        {
            {"mod_wanez/creatures/npcs/dga/souleater/event_souleater_01_npc.dbr",2,{2,{6,4,2,1}}}, -- Vanilla (Relics)
            --{"mod_wanez/creatures/npcs/dga/souleater/event_souleater_02_npc.dbr",2}, -- DGA
            {"mod_wanez/creatures/npcs/dga/souleater/event_souleater_03_npc.dbr",2} -- OMEGA
        }
    }
}

local listRewardsDGA = {
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
local listKeysDGA = {
    {
        [1]={
            [1] = "mod_wanez/items/dga/key_normal_01.dbr",
            [2] = "mod_wanez/items/dga/key_normal_02.dbr",
            [3] = "mod_wanez/items/dga/key_normal_03.dbr",
            [4] = "mod_wanez/items/dga/key_normal_04.dbr",
            [5] = "mod_wanez/items/dga/key_normal_05.dbr"
        },
        [2]={
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
-- 
local listAether = {
    {
        [1] = {
            {"records/items/materia/compa_aethercrystal.dbr"}
        },
        [2] = {
            {"records/items/materia/compa_aethercrystal.dbr"}
        },
        [3] = {
            {"records/items/materia/compa_aethercrystal.dbr"}
        }
    }
}
-- 
local listSouls = {
    {
        [1] = {
            {"mod_wanez/items/token/souls/soul_common.dbr"},
            {"mod_wanez/items/token/souls/soul_champion.dbr"},
            {"mod_wanez/items/token/souls/soul_hero.dbr"},
            {"mod_wanez/items/token/souls/soul_boss.dbr"},
            {"mod_wanez/items/token/souls/soul_boss.dbr"},
            {"mod_wanez/items/token/souls/soul_nemesis.dbr"},
            {"mod_wanez/items/token/souls/soul_raid.dbr"},
            {"mod_wanez/items/token/souls/soul_souleater.dbr"},
            {"mod_wanez/items/token/souls/soul_aethercrystal.dbr"},
            {"mod_wanez/items/token/souls/soul_aetherobelisk.dbr"}
        },
        [2] = {
            {"mod_wanez/items/token/souls/soul_common.dbr"},
            {"mod_wanez/items/token/souls/soul_champion.dbr"},
            {"mod_wanez/items/token/souls/soul_hero.dbr"},
            {"mod_wanez/items/token/souls/soul_boss.dbr"},
            {"mod_wanez/items/token/souls/soul_boss.dbr"},
            {"mod_wanez/items/token/souls/soul_nemesis.dbr"},
            {"mod_wanez/items/token/souls/soul_raid.dbr"},
            {"mod_wanez/items/token/souls/soul_souleater.dbr"},
            {"mod_wanez/items/token/souls/soul_aethercrystal.dbr"},
            {"mod_wanez/items/token/souls/soul_aetherobelisk.dbr"}
        },
        [3] = {
            {"mod_wanez/items/token/souls/soul_common.dbr"},
            {"mod_wanez/items/token/souls/soul_champion.dbr"},
            {"mod_wanez/items/token/souls/soul_hero.dbr"},
            {"mod_wanez/items/token/souls/soul_boss.dbr"},
            {"mod_wanez/items/token/souls/soul_boss.dbr"},
            {"mod_wanez/items/token/souls/soul_nemesis.dbr"},
            {"mod_wanez/items/token/souls/soul_raid.dbr"},
            {"mod_wanez/items/token/souls/soul_souleater.dbr"},
            {"mod_wanez/items/token/souls/soul_aethercrystal.dbr"},
            {"mod_wanez/items/token/souls/soul_aetherobelisk.dbr"}
        }
    }
}
--[[
{x,y,z}
x: int max (random(min,max))
y: int chance (minimum int required to roll)
z: array number of rolls (amount of loot-slots)
1: Type
]]--
local globalDropChancePerEntity = {
	["Classification"] = {
		[1] = { -- Common
			"Common",
			{{1000,1}}
		},
		[2] = { -- Champion
			"Champion",
			{{500,1}}
		},
		[3] = { -- Hero
			"Hero",
			{{2,1},{4,1},{6,1},{8,1},{10,1}}
		},
		[4] = { -- Mini-Boss
			"MiniBoss",
			{{5,1},{15,1}}
		},
		[5] = { -- Boss
			"Boss",
			{{1,1},{2,1},{4,1},{6,1},{8,1}}
		},
		[6] = { -- Nemesis
			"Nemesis",
			{{1,1},{1,1},{2,1},{2,1},{4,1},{4,1}}
		},
		[7] = { -- Raid
			"Raid",
			{{3,1},{5,1}}
		},
		[8] = { -- Uber
			"SoulEater",
			{{3,1},{5,1}}
		},
        [9] = { -- 
			"AetherCrystal",
			{{100,1}}
		},
        [10] = { -- 
			"AetherObelisk",
			{{20,1}}
		}
	}
}
--[[
{x,{y,z,...}}
x: int max (random(min,max))
y,z: int chance - order has to be the same with waLootTable and organized from lowest to highest
]]--
-- X.Name is primarily used for debugging
-- UseTier: array using bool - true will use the map-tier instead [LevelRequirements still apply]
-- ICwD: Increase Count with Difficulty (bool)
local ltDGA_01 = {
	{
		["Name"] = "DGA",
        ["Ratio"] = 1,
		["LevelRequirements"] = {25,50,80},
		["UseTier"] = {{2,1},false}, -- min: Tier -2; max: Tier +1 and using monster leveloffset
        ["ICwD"] = {false},
		["Lists"] = {
			listDGAComp,
			listDGAToken
		}
	},
    {
        ["Name"] = "DGA-Essences",
        ["Ratio"] = 2,
		["LevelRequirements"] = {0,25,50},
		["UseTier"] = {false},
        ["ICwD"] = {false},
		["Lists"] = {
			listDGAToken
		}
    },
	{
		["Name"] = "Currency",
        ["Ratio"] = 3,
		["LevelRequirements"] = {0,50,80},
		["UseTier"] = {false},
        ["ICwD"] = {false},
		["Lists"] = {
			listCurrency
		}
	}
	-- Artifacts
}
-- {QuestID,TaskID} pairs
local questsRepeatable = {
	{0xB1E80D00,0xF9C04D00} -- Repeatable01 (Kill DGA Boss)
}
local questsSpecialDGA = {
    {0x61B19780,0xD2572B00} -- SpecialID 1 - Task 1
}
-- DBR,int base Chance
local specialUberCompTables = {
	{{"mod_wanez/items/dga/special_01b_material.dbr",5}}
}
local uberUberCompTables = {
    {{"mod_wanez/items/dga/special_01b_material.dbr",5}}
}
local specialUberCompChance = {2,5,10}
-- 
wanez.dga._Data = {
    ["Items"] = {
        ["Global"] = {
            ["Currency"] = listCurrency,
            ["DGA"] = {
                ["TierComp"] = listDGAComp,
                ["TierKeys"] = listKeysDGA,
                ["Essences"] = listDGAToken
            },
            ["Aether"] = listAether
        },
        ["Special"] = {
            ["UberComp"] = specialUberCompTables
        },
        ["Uber"] = {
            ["Token"] = uberUberCompTables
        },
        ["Souls"] = listSouls
    },
    ["LootTables"] = { -- LootTable  -- X.Ratio = int [default: 1]
        ["Global"] = { -- every LootTable is used
            ltDGA_01
        }
    },
    ["Chances"] = {
        ["Global"] = globalDropChancePerEntity,
        ["Special"] = {
            ["UberComp"] = specialUberCompChance
        }
    },
    ["Rewards"] = listRewardsDGA,
    ["Quests"] = {
        ["Repeatable"] = questsRepeatable,
        ["SpecialDGA"] = questsSpecialDGA
    },
    ["NPC"] = {
        ["Random"] = listRandomNPC
    }
};
