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
    local killCount = 0
    
    local class = {
        --__constructor = function(self)
        --end;
        setSpecialData = function(self)
            UberID = wanez.dga.Settings:getUberID()
            waData = wanez.dga._Settings.Reward.Special[SpecialID][UberID]
            --wanez.dga._Settings.Reward.Special[SpecialID][1].Credit.Gain.Kills
        end;
        resetData = function(self,argUberID)
            SpecialCredit = 0
            SpecialID = 0
            ModeID = 0
            UberID = argUberID
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
            local mathRespawnThreshold = 1
            if(SpecialID > 0)then
                if(waData.Credit.Scaling[wanez.DifficultyID] ~= 0)then
                    mathRespawnThreshold = (wanez.dga.Areas[dgaAreaType].EnemyCount / 100) * waData.Credit.Scaling[wanez.DifficultyID];
                    spawnRating = SpecialCredit / mathRespawnThreshold * 100 * 10
                else
                    spawnRating = SpecialCredit
                end
                
                --if(mathSpawn >= waData.Credit.Requirements[argType][wanez.DifficultyID])
            elseif(ModeID > 1)then
                
            end
            return spawnRating
        end;
        checkIfSpawn = function(self,argObjectId)
            local poolBoss = wanez._Data.Enemies.RandomRaid
            local spawnRating = self:getSpawnRating()
            if(waData.Credit.Requirements.BossSpawn ~= nil and BlockBossSpawn == false)then
                if(spawnRating >= waData.Credit.Requirements.BossSpawn[wanez.DifficultyID])then
                    local enemyLoc = Character.Get(argObjectId):GetCoords()
                    local bossDBR = poolBoss[wanez.RNG({1,table.getn(poolBoss)})]
                    --createEntityDefault(enemyLoc,{["DBR"]=bossDBR,["Offset"]=waEntitySettings.Enemies.LevelOffset.Raid})
                    wanez.dga.Areas[dgaAreaType]:createEntity(bossDBR,enemyLoc,wanez.dga.Areas[dgaAreaType]:getEnemyLevel(wanez._Settings.Enemies.LevelOffset[wanez.data.Enemies.Classification[7]]));
                    if(wanez.dga.affixdga.getAffixData(5))then
                        wanez.dga.Areas[dgaAreaType]:createEntity(bossDBR,Game.GetLocalPlayer():GetCoords(),wanez.dga.Areas[dgaAreaType]:getEnemyLevel(wanez._Settings.Enemies.LevelOffset[wanez.data.Enemies.Classification[7]]));
                    end
                    BlockBossSpawn = true
                    UI.Notify("tagWaSpecialBossSpawned")
                end
            elseif(waData.Credit.Requirements.ReSpawn ~= nil)then
                
            end
            --if(spawnRating >= waData.Credit.Requirements[argType][wanez.DifficultyID])
        end;
        giveSpecialCredit = function(self,argEvent,argClassId,argObjectId)
            if(argEvent == "onDie")then
                local scrollDBR = 'mod_wanez/items/dga/scroll_portal_dga01.dbr'
                local _player = Game.GetLocalPlayer()
                if(argClassId == 4 and SpecialCredit ~= 0)then
                    _player:GiveItem(scrollDBR,1,true)
                    UI.Notify("tagWaScrollSpecialReceived")
                end
                SpecialCredit = SpecialCredit + waData.Credit.Gain.Kills[argClassId]
                if(BlockBossSpawn and argClassId == 7)then
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
                        if(UberID == 1)then wanez.dga.Data.Entities[5]:dropLoot(itemDBR,itemCount,enemyLoc);end;
                        if(UberID == 2)then wanez.dga.Data.Entities[5]:dropLoot('mod_wanez/items/token/souls/soul_uber.dbr',itemCount,enemyLoc);end;
                    end
                    SpecialCredit = 0
                    -- remove portal scroll if player has one
                    if(_player:HasItem(scrollDBR,1,true))then
                        _player:TakeItem(scrollDBR,1,true)
                    end
                    UI.Notify("tagWaSpecialBossDeafeated")
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
        addKill = function(self)
            killCount = killCount + 1
        end;
        getKillCount = function(self)
            return killCount
        end;
        resetKillCount = function(self)
            killCount = 0
        end;
        
        mathDupeChance = function(self,argTotalChance) -- when the chance is higher than 100% it can drop additional items
            local itemCount = 0; -- {int ItemCount,int RemainingChance}
            local remainingChance = argTotalChance
            
            if(argTotalChance > 100)then
                -- wanez.RNG({},curChance)
                itemCount = math.floor(argTotalChance / 100)
                remainingChance = argTotalChance - (itemCount * 100)
            end
            itemCount = (wanez.RNG({1,100},remainingChance)) and itemCount + 1 or itemCount
            
            return itemCount;
        end;
    }
    --class:__constructor();
    return class;
end
--