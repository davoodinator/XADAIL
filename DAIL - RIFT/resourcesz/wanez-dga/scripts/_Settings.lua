
-- 
local rewardKeyThreshold = {0,2000,10000};

-- TODO
local enemyAreaPoolsDefault = { -- [int AreaID]={int chance/10,int PoolID}
    [1]={3,2},
    [2]={3,3},
    [3]={3,1},
    [4]={3,19},
    [5]={3,6},
    [6]={3,10},
    [7]={3,12},
    [9]={3,4},
    [10]={3,4},
    [11]={3,2}
}
-- unset area will roll a random boss
local enemyAreaPoolsBoss = { -- [int AreaID]={int BossID,int BossID,...}
	[1]={8},
	[2]={2},
	[3]={3},
	[4]={9},
	[5]={10},
	[6]={16},
	[7]={27},
    --[9]={27},
    --[10]={27},
    [11]={26}
};
--
local enemyRatioAether = {3,1}; -- Crystal,Obelisk
-- For randomized DGA selection
local areaRandomDefault = {1,2,3,5,6,7,9,10,11}
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
                    ["Kills"] = {1,3,5,7,10,20,1,60,1,1} -- {1,3,5,7,10,30,1,50,1,1}
                },
                ["Requirements"] = {
                    ["BossSpawn"] = {5000,5000,5000}
                },
                ["Scaling"] = {0,0,0} -- 0: no scaling
            }
        },
        {
            ["Credit"] = {
                ["Gain"] = {
                    ["Kills"] = {0,0,10,0,15,30,0,90,0,0} -- {1,3,5,7,10,30,1,50,1,1}
                },
                ["Requirements"] = {
                    ["BossSpawn"] = {5000,5000,5000}
                },
                ["Scaling"] = {0,0,0} -- 0: no scaling
            }
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