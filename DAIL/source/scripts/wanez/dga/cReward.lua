--[[
Reward & Credit - also includes "temp special-dga quests"
]]--
--
function wanez.dga.cReward()
    local SpecialCredit = 0
    local SpecialID = 0
    local ModeID = 0
    local UberID = 1
    local waData = {}
    local BlockBossSpawn = false
    
    local class = {
        --__constructor = function(self)
        --end;
        setSpecialData = function(self)
            UberID = (wanez.dga.Settings:getIsUber()) && 2 || 1
            waData = wanez.dga._Settings.Reward.Special[SpecialID][UberID]
            --wanez.dga._Settings.Reward.Special[SpecialID][1].Credit.Gain.Kills
        end;
        resetData = function(self)
            SpecialCredit = 0
            SpecialID = 0
            ModeID = 0
            UberID = 1
            waData = {}
            BlockBossSpawn = false
        end;
        isSpecialDGA = function(self) -- return bool and set SpecialID
            local isSpecial = false
            SpecialID = wanez.dga.Settings:getSpecialID()
            if(SpecialID > 0)then
                isSpecial = true;
                self:setSpecialData() -- no need to do that unless its a Special-DGA with a SpecialID
            end;
            return isSpecial;
        end;
        getSpawnRating = function(self)
            local spawnRating = 0
            if(SpecialID > 0)then
                local mathRespawnThreshold = (wanez.dga.Areas[dgaAreaType].EnemyCount / 100) * waData.Credit.Scaling[wanez.DifficultyID]
                spawnRating = SpecialCredit / mathRespawnThreshold * 100 * 10
                
                --if(mathSpawn >= waData.Credit.Requirements[argType][wanez.DifficultyID])
            elseif(ModeID > 0)then
                
            end
            return spawnRating
        end;
        checkIfSpawn = function(self,argObjectId)
            local poolBoss = wanez._Data.Enemies.Boss
            local spawnRating = self:getSpawnRating()
            if(waData.Credit.Requirements.BossSpawn != nil && BlockBossSpawn == false)then
                if(spawnRating >= waData.Credit.Requirements.BossSpawn[wanez.DifficultyID])then
                    local enemyLoc = Character.Get(argObjectId):GetCoords()
                    local bossDBR = poolBoss[wanez.RNG({1,table.getn(poolBoss)})]
                    --createEntityDefault(enemyLoc,{["DBR"]=bossDBR,["Offset"]=waEntitySettings.Enemies.LevelOffset.Raid})
                    wanez.dga.Areas[dgaAreaType]:createEntity(bossDBR,enemyLoc,wanez.dga.Areas[dgaAreaType]:getEnemyLevel(wanez._Settings.Enemies.LevelOffset[wanez.data.Enemies.Classification[7]]));
                    BlockBossSpawn = true
                    UI.Notify("tagWaSpecialBossSpawned")
                end
            elseif(waData.Credit.Requirements.ReSpawn != nil)then
                
            end
            --if(spawnRating >= waData.Credit.Requirements[argType][wanez.DifficultyID])
        end;
        giveSpecialCredit = function(self,argEvent,argClassId,argObjectId)
            if(argEvent == "onDie")then
                SpecialCredit = SpecialCredit + waData.Credit.Gain.Kills[argClassId]
                if(BlockBossSpawn && argClassId == 5)then
                    SpecialCredit = 0;
                    -- TODO: UBER SWITCH
                    local uberChance = wanez.dga._Data.Chances.Special.UberComp[wanez.DifficultyID] * (wanez.dga.Settings:getTier() + 1)
                    if(wanez.RNG({1,100},uberChance))then
                        local uberMaterials = wanez.dga._Data.Items.Special.UberComp[SpecialID]
                        local totalMaterials = table.getn(uberMaterials)
                        local rngArray = {}
                        local totalRNG = 0
                        for i=1,totalMaterials do
                            rngArray[i] = wanez.dga._Data.Items.Uber.Token[SpecialID][i][2]
                            totalRNG = totalRNG + rngArray[i]
                        end;
                        
                        local itemDBR = wanez.dga._Data.Items.Uber.Token[SpecialID][wanez.RNG({1,totalRNG},rngArray)][1]
                        local itemCount = 1
                        local enemyLoc = Character.Get(argObjectId):GetCoords()
                        wanez.dga.Data.Entities[5]:dropLoot(itemDBR,itemCount,enemyLoc)
                    end
                    
                    SpecialCredit = 0
                    UI.Notify("tagWaMonsterDespawnedYouCanLeave")
                    --wanez.dga.Areas[dgaAreaType]:removeEntities()
                end;
            end
        end;
        giveCredit = function(self,argEvent,argClassId,argObjectId)
            if(self:isSpecialDGA())then -- checks if special 
                self:giveSpecialCredit(argEvent,argClassId,argObjectId)
                self:checkIfSpawn(argObjectId)
            end
        end;
        getSpecialCredit = function(self)
            return SpecialCredit;
        end;
        setCredit = function(self,argValue)
            SpecialCredit = 1
        end;
    }
    --class:__constructor();
    return class;
end
--