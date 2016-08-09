--[[
Created by IntelliJ IDEA.
User: WareBare
Date: 7/31/2016
Time: 7:54 AM

Package: wanez.dga
]]--
wanez.dga.bounties = {}

-- {QuestID, TaskID, int AreaTypeID},
-- {int dropChanceNormal, int dropChanceElite, int dropChanceUltimate},
-- Bool incCount
local listBounties = { -- TODO: add it to settings
    { -- 1: Common
        {{},{3,6,15}}
    },
    { -- 2: Champion
        {{},{3,6,15}}
    },
    { -- 3: Hero
        {{0x1A7E3AA0,0x553AEC00,1},{5,10,25},true}
    },
    { -- 4: MiniBoss
        {{0xFCAFE400,0x7FBDF000,1},{50,50,100},true}
    },
    { -- 5: Boss
        {{},{5,10,25} }
    },
    { -- 6: Nemesis
        {{0x5AF4D080,0x7EA32800,1},{5,10,25},true}
    },
    { -- 7: RaidBoss
        {{},{5,10,25} }
    },
    { -- 8: Souleater
        {{},{5,10,25} }
    },
    { -- 9: AetherCrystal
        {{},{5,10,25} }
    },
    { -- 10: AetherObelisk
        {{},{5,10,25} }
    }
}

--
function wanez.dga.bounties.giveTokenPM(argEnemyClassId)
    local chanceMultiplier = (wanez.dga.Settings:getTier() > 0) and wanez.dga.Settings:getTier() / 10 or 0
    local questTaskState = false;
    local _player = Game.GetLocalPlayer()
    local curData = false

    if(table.getn(listBounties[argEnemyClassId]) > 0)then
        for i=1,table.getn(listBounties[argEnemyClassId]) do
            questTaskState = _player:GetQuestTaskState(listBounties[argEnemyClassId][i][1][1],listBounties[argEnemyClassId][i][1][2])
            if(questTaskState == QuestState.InProgress)then
                if(wanez.dga.Areas[dgaAreaType]:getAreaTypeID() == 0 or wanez.dga.Areas[dgaAreaType]:getAreaTypeID() == listBounties[argEnemyClassId][i][1][3])then curData = listBounties[argEnemyClassId][i][2][wanez.DifficultyID];end;
            end
        end;
    end

    --UI.Notify("triggered bounty kill")
    if(curData)then
        local curChance = curData + chanceMultiplier * curData
        local itemCount = wanez.dga.Data.Rewards:mathDupeChance(curChance)
        --UI.Notify("triggered bounty kill loot")
        if(itemCount > 0)then
            local DBR = "mod_wanez/items/dga/rewards/bounty_token_dga_pm.dbr"
            _player:GiveItem(DBR,itemCount,false)
        end
        --UI.Notify("triggered bounty kill, after loot")
    end
end

function wanez.dga.bounties.incEntityCount(argAreaType)
    local aEntities = {}
    local _player = Game.GetLocalPlayer()
    aEntities.Nemesis = 0
    aEntities.MiniBoss = 0

    if(_player:GetQuestTaskState(0x5AF4D080,0x7EA32800) == QuestState.InProgress and argAreaType == 1)then
        aEntities.Nemesis = aEntities.Nemesis + 1;
    end;
    if(_player:GetQuestTaskState(0xFCAFE400,0x7FBDF000) == QuestState.InProgress and argAreaType == 1)then
        aEntities.MiniBoss = aEntities.MiniBoss + 1;
    end

    return aEntities;
end
