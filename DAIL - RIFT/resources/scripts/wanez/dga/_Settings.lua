
-- 
local rewardKeyThreshold = {0,2000,10000};

-- TODO
local enemyAreaPoolsDefault = {
    
}
-- unset area will roll a random boss
local enemyAreaPoolsBoss = {
	[1]={8},
	[2]={2},
	[3]={3},
	[4]={9},
	[5]={10},
	[6]={16},
	[7]={34}
};
--
local enemyRatioAether = {3,1}; -- Crystal,Obelisk
-- For randomized DGA selection
local areaRandomDefault = {1,2,3,4,5,6,7}
--
local areaRequirements = {
	["FreeTiers"] = { -- By Mode
		[1] = {2,2,2},
		[2] = {0,0,0},
		[3] = {0,0,0}
	},
	["DGAKey"] = {1,5,3}, -- DGA-Key requirement by Mode
	["DGAKeySpecial"] = {10}
}
--
local rewardEndless = {
	["Multiplier"] = {
		["Difficulty"] = {1,2,3},
		["Mode"] = {1,3,1}
	},
	["Rewards"] = {
		["Keys"] = rewardKeyThreshold
	}
}
-- organized by SpecialID 1:Normal/2:Uber
local rewardSpecialDGA = {
	{
		{
            ["Credit"] = {
                ["Gain"] = {
                    ["Kills"] = {1,3,5,7,10,30}
                },
                ["Requirements"] = {
                    ["BossSpawn"] = {1000,1000,1000}
                },
                ["Scaling"] = {90,90,90} -- 0: no scaling
            }
        },
        {
        }
	}
}
-- 
wanez.dga._Settings = {
    ["Enemies"] = {
        ["Pools"] = {
            ["Area"] = {
                ["Default"] = enemyAreaPoolsDefault,
                ["Boss"] = enemyAreaPoolsBoss
            },
            ["Ratio"] = {
                ["Aether"] = enemyRatioAether
            }
        }
    },
    ["Containers"] = {
    },
    ["Areas"] = {
        ["Random"] = {
            ["Default"] = areaRandomDefault
        },
        ["Requirements"] = areaRequirements
    },
    ["Reward"] = {
        ["Special"] = rewardSpecialDGA,
        ["Endless"] = rewardEndless
    }
    
};
wanez.dga.var.GiveItem = false -- true: gives the player the drop; false: drop on enemy location