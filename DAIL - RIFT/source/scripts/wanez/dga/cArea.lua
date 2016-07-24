--[[
Events happening inside an Area (DGA), ie spawning entities
]]--
--
function wanez.dga.cArea(argProxyTypes)
    local inhabitants = false
    local riftCollectionLoc = false

    local settingsNPC = {}
    settingsNPC.Special = false
    settingsNPC.ConvID = {}


    local factionRank_DGA_Friend = 0
    local factionRank_DGA_Enemy = 0
    
    
    local class={
        ProxyTypes = argProxyTypes;
        ProxyTypeCount = 0;
        Proxies = {};
        Entities = {};
        EnemyLevels = {};
        Tier = 0;
        CategoryOffset = "Default";
        PoolCounts = {}; -- wanez._Data.Enemies.X
        --
        __constructor = function(self)
            self.ProxyTypeCount = table.getn(self.ProxyTypes)
            for i=1,self.ProxyTypeCount do
                self.Proxies[self.ProxyTypes[i]] = {};
            end;
            self.EnemyLevels = {}
            local TotalEnemyPoolIndex = table.getn(wanez.data.Enemies.Pool)
            for i=1,TotalEnemyPoolIndex do
                local enemyPoolName = wanez.data.Enemies.Pool[i]
                self.PoolCounts[enemyPoolName] = table.getn(wanez._Data.Enemies[enemyPoolName])
            end
            --collectgarbage()
        end;
        getEnemyLevel = function(self,argEnemyLevelOffset)
            -- var
            local playerLevel = Game.GetAveragePlayerLevel()
            local dgaTier = self.Tier
            local difOffset = wanez._Settings.Difficulty.LevelOffset[wanez.DifficultyID]
            local enemyOffset = argEnemyLevelOffset
            local catOffset = wanez._Settings.Category.LevelOffset[self.CategoryOffset]
            local uberOffset = wanez.dga.Settings:getUberID() == 1 and 0 or 5 -- TODO: better solution with changing catOffset
            -- calculation
            local enemyLevel = playerLevel + dgaTier + difOffset + enemyOffset + catOffset + uberOffset
            return enemyLevel -- , nil
        end;
        --
        setEnemyLevels = function(self)
            local totalEnemyClasses = table.getn(wanez.data.Enemies.Classification)
            for i=1,totalEnemyClasses do
                local enemyClassName = wanez.data.Enemies.Classification[i]
                local enemyOffset = wanez._Settings.Enemies.LevelOffset[enemyClassName] or 0
                self.EnemyLevels[enemyClassName] = self:getEnemyLevel(enemyOffset)
            end
            
        end;
        --
        createEntity = function(self,argDBR,argLoc,argEnemyLevel)
            local newEntity = false
            if(argEnemyLevel ~= nil and argEnemyLevel ~= 0)then -- its a monster
                newEntity = Character.Create(argDBR,argEnemyLevel,nil)
                self.EnemyCount = self.EnemyCount + 1;
            else -- its a container
                newEntity = Entity.Create(argDBR)
            end
            newEntity:SetCoords(argLoc)
            table.insert(self.Entities,newEntity)
        end;
        --
        genEnemyCommon = function(self)
            
        end;
        genEnemy = function(self,optEnemyData,optEntities)
            --local aEnemies = {}
            for i=1,optEnemyData.enemyCount do
                local randEnemyDBR = wanez.RNG({1,optEnemyData.totalPoolCount})
                local aEnemy = {
                    optEnemyData.pool[randEnemyDBR],
                    self.EnemyLevels[optEnemyData.enemyClassName]
                }
                if(optEnemyData.enemyClassName == "Hero")then -- Heroes have a special case, because every possible hero gets its own chance to spawn
                    
                    if(wanez.RNG({1,100},wanez._Settings.Enemies.Chances[optEnemyData.enemyClassName][wanez.DifficultyID][i]))then table.insert(optEntities,aEnemy);end;
                else -- 
                    table.insert(optEntities,aEnemy)
                end
            end;
            return optEntities
        end;
        --
        genContainer = function(self,optEntities)
            local chestDBR = nil
            -- Common||Rare Container
            if(chestDBR == nil) then
                local rngSpawnContainer = random(1,100)
                if(rngSpawnContainer <= wanez._Settings.Containers.Chances.Rare[wanez.DifficultyID])then
                    local randChest = random(1,table.getn(wanez._Data.Containers[wanez.dga.Settings:getAreaID()]["Rare"]))
                    chestDBR = wanez._Data.Containers[wanez.dga.Settings:getAreaID()]["Rare"][randChest]
                elseif(rngSpawnContainer <= wanez._Settings.Containers.Chances.Common[wanez.DifficultyID])then
                    local randChest = random(1,table.getn(wanez._Data.Containers[wanez.dga.Settings:getAreaID()]["Common"]))
                    chestDBR = wanez._Data.Containers[wanez.dga.Settings:getAreaID()]["Common"][randChest]
                end
            end
            -- if DBR is set, create Container
            if(chestDBR ~= nil) then
                local aContainer = {chestDBR,0}
                table.insert(optEntities,aContainer)
            end
            return optEntities
        end;
        -- PROXIES
        genProxyDefault = function(self)
            local _player = Game.GetLocalPlayer()
            local aEntities = {}
            local aEnemies = {}
            local aEnemyData = {
                ["enemyCount"] = 1,
                ["totalPoolCount"] = 1,
                ["pool"] = 1,
                ["enemyClassName"] = "Common"
            }
            local isInhabitant = false
            -- check if Aether
            local spawnType = wanez.RNG({},{
                    ((self.EnemyLevels["AetherCrystal"] >= wanez._Settings.Anomalies.LevelRequirements.AetherCrystal) and wanez._Settings.Anomalies.Chances["Aether"][wanez.DifficultyID] or 0),
                    ((self.EnemyLevels["AetherObelisk"] >= wanez._Settings.Enemies.LevelRequirements.AetherObelisk) and wanez._Settings.Enemies.Chances["Aether"][wanez.DifficultyID] or 0),
                    ((self.EnemyLevels["Champion"] >= wanez._Settings.Enemies.LevelRequirements.Champion) and wanez._Settings.Enemies.Chances["Champion"][wanez.DifficultyID] or 0)
                });
            -- check if champion spawn or common
            if(spawnType == 1)then aEnemyData.enemyClassName = "AetherCrystal";end;
            if(spawnType == 2)then aEnemyData.enemyClassName = "AetherObelisk";end;
            if(spawnType == 3)then aEnemyData.enemyClassName = "Champion";end;
            
            if(aEnemyData.enemyClassName == "AetherObelisk" or aEnemyData.enemyClassName == "AetherCrystal")then
                aEnemyData.randPoolDefault = spawnType
                aEnemyData.pool = wanez._Data.Enemies.Aether[aEnemyData.randPoolDefault]
                aEnemyData.totalPoolCount = table.getn(aEnemyData.pool)
                aEnemyData.enemyCount = 1
                
                aEntities = self:genEnemy(aEnemyData,aEntities)
            elseif(aEnemyData.enemyClassName == "Common" or aEnemyData.enemyClassName == "Champion")then
                -- TODO: wanez.dga._Settings.Enemies.Pools.Area.Default
                
                -- Inhabitants
                isInhabitant = (inhabitants) and wanez.RNG({1,10},inhabitants[1]) or false
                
                -- Containers
                aEntities = self:genContainer(aEntities)
                
                -- get Enemy Pool
                aEnemyData.randPoolDefault = (isInhabitant) and inhabitants[2] or wanez.RNG({1,self.PoolCounts.Default})
                aEnemyData.pool = wanez._Data.Enemies.Default[aEnemyData.randPoolDefault][aEnemyData.enemyClassName]
                aEnemyData.totalPoolCount = table.getn(aEnemyData.pool)
                -- get enemy count
                aEnemyData.enemyCount = wanez.RNG({wanez._Settings.Enemies.Count[aEnemyData.enemyClassName][wanez.DifficultyID][1],wanez._Settings.Enemies.Count[aEnemyData.enemyClassName][wanez.DifficultyID][2]})
                
                aEntities = self:genEnemy(aEnemyData,aEntities)
                if(aEnemyData.enemyClassName == "Common")then
                    -- roll hero
                    aEnemyData.enemyClassName = "Hero"
                    -- get Enemy Pool
                    --aEnemyData.randPoolDefault = wanez.RNG({1,self.PoolCounts.Default})
                    aEnemyData.pool = wanez._Data.Enemies.Default[aEnemyData.randPoolDefault][aEnemyData.enemyClassName]
                    aEnemyData.totalPoolCount = table.getn(aEnemyData.pool)
                    -- get enemy count
                    aEnemyData.enemyCount = wanez._Settings.Enemies.Count[aEnemyData.enemyClassName][wanez.DifficultyID]
                    if(_player:GetQuestTaskState(0x1A7E3AA0,0x553AEC00) == QuestState.InProgress and self:getAreaTypeID() == 1)then aEnemyData.enemyCount = aEnemyData.enemyCount + 1;end;
                    aEntities = self:genEnemy(aEnemyData,aEntities)
                end
            end;
            
            return aEntities
        end;
        genProxyBoss = function(self)
            local aEntities = {}
            
            -- Boss (Enemy)
            local poolBoss = wanez._Data.Enemies.Boss
            
            local areaBoss = wanez.dga._Settings.Enemies.Pools.Area.Boss[wanez.dga.Settings:getAreaID()]
            local BossID = 1
            if(areaBoss == nil)then
                local totalBoss = table.getn(poolBoss)
                BossID = wanez.RNG({1,totalBoss})
            else
                local totalAreaBoss = table.getn(areaBoss)
                BossID = wanez.RNG({1,totalAreaBoss})
            end
            table.insert(aEntities,{poolBoss[BossID],self.EnemyLevels["Boss"]})
            
            -- Boss (Container)
            --if({wanez._Data.Containers[wanez.dga.Settings:getAreaID()]["Boss"][1])
            local poolBossContainer = wanez._Data.Containers[wanez.dga.Settings:getAreaID()]["Boss"]
            if(poolBossContainer ~= nil)then
                local totalContainer = table.getn(poolBossContainer)
                if(totalContainer > 0)then
                    local ContainerID = wanez.RNG({1,totalContainer})
                    table.insert(aEntities,{wanez._Data.Containers[wanez.dga.Settings:getAreaID()]["Boss"][ContainerID],0})
                end
            end
            
            return aEntities
        end;
        --
        prepEntity = function(self,argProxyType)
            local player = Game.GetLocalPlayer()
            local totalProxies = table.getn(self.Proxies[argProxyType])
            local aSpecial = {}
            inhabitants = wanez.dga._Settings.Enemies.Pools.Area.Default[wanez.dga.Settings:getAreaID()] or false
            
            if(argProxyType == "Default")then -- TODO: Special Container / Nemesis / other special spawns
                -- SPECIAL-CONTAINER
                local totalSpecialContainer = table.getn(wanez._Data.Containers[wanez.dga.Settings:getAreaID()]["Special"])
                if(totalSpecialContainer > 0)then
                    for i=1,totalSpecialContainer do
                        local randProxyLoc = wanez.RNG({1,totalProxies})
                        local endWhile = false
                        while(endWhile == false)do
                            if(aSpecial[randProxyLoc] == nil) then 
                                --aSpecial[randProxyLoc] = {{wanez._Data.Containers[wanez.dga.Settings:getAreaID()]["Special"][i]}}
                                aSpecial[randProxyLoc] = {}
                                table.insert(aSpecial[randProxyLoc],{wanez._Data.Containers[wanez.dga.Settings:getAreaID()]["Special"][i]})
                                endWhile = true
                            else
                                randProxyLoc = wanez.RNG({1,totalProxies})
                            end
                        end
                    end
                end
                -- NEMESIS
                --local FactionValueID = 0
                --if(wanez.dga.Token["DGA_NO_NEMESIS"] == false)then
                --    local playerFactionValue = Game.GetLocalPlayer():GetFaction("USER15")
                --    if(playerFactionValue <= -20000)then FactionValueID = 3
                --    elseif(playerFactionValue <= -8000)then FactionValueID = 2
                --    elseif(playerFactionValue <= -1500)then FactionValueID = 1 end
                --end
                if (factionRank_DGA_Enemy > 0 and player:HasToken("DGA_BLOCK_SPAWN_NEMESIS") == false)then
                    -- number of nemesis spawns
                    local countNemesisSpawns = wanez.RNG({wanez._Settings.Enemies.Count.Nemesis[factionRank_DGA_Enemy][1],wanez._Settings.Enemies.Count.Nemesis[factionRank_DGA_Enemy][2]})
                    -- check if Nemesis should spawn
                    if(player:GetQuestTaskState(0x5AF4D080,0x7EA32800) == QuestState.InProgress and self:getAreaTypeID() == 1)then countNemesisSpawns = countNemesisSpawns + 1;end;
                    if(countNemesisSpawns > 0)then
                        for i=1,countNemesisSpawns do
                            local totalNemeses = table.getn(wanez._Data.Enemies.Nemesis) -- total nemesis for later to pick one
                            local randNemesis = wanez.RNG({1,totalNemeses})
                            local endWhile = false
                            while (endWhile == false) do
                                local randomNemesisLoc = wanez.RNG({1,totalProxies})
                                if(aSpecial[randomNemesisLoc] == nil) then
                                    --aSpecial[randomNemesisLoc] = {{wanez._Data.Enemies.Nemesis[randNemesis],self.EnemyLevels["Nemesis"]}}
                                    aSpecial[randomNemesisLoc] = {}
                                    table.insert(aSpecial[randomNemesisLoc],{wanez._Data.Enemies.Nemesis[randNemesis],self.EnemyLevels["Nemesis"]})
                                    endWhile = true
                                end
                            end
                        end
                    end
                end
                -- BOUNTY
                if(player:HasToken("BOUNTY_ACTIVE_DGA_PM"))then
                    if(player:GetQuestTaskState(0xFCAFE400,0x7FBDF000) == QuestState.InProgress and self:getAreaTypeID() == 1)then
                        --UI.Notify("mini boss")
                        local miniBossData = wanez._Data.Enemies.MiniBoss
                        local randMiniBoss = wanez.RNG({1,table.getn(miniBossData)})
                        local endWhile = false
                        while (endWhile == false) do
                            local randomLoc = wanez.RNG({1,totalProxies})
                            if(aSpecial[randomLoc] == nil) then
                                aSpecial[randomLoc] = {}
                                table.insert(aSpecial[randomLoc],{miniBossData[randMiniBoss],self.EnemyLevels["MiniBoss"]})
                                endWhile = true
                            end
                        end
                    end
                end
                -- TODO: SPECIAL
                if(wanez.dga.Settings:getSpecialID() ~= 0)then
                    local miniBossData = wanez._Data.Enemies.MiniBoss
                    local randMiniBoss = wanez.RNG({1,table.getn(miniBossData)})
                    local endWhile = false
                    while (endWhile == false) do
                        local randomLoc = wanez.RNG({1,totalProxies})
                        if(aSpecial[randomLoc] == nil) then
                            aSpecial[randomLoc] = {}
                            table.insert(aSpecial[randomLoc],{miniBossData[randMiniBoss],self.EnemyLevels["MiniBoss"]})
                            endWhile = true
                        end
                    end
                end
                -- NPC
                local listNPC = wanez.dga._Data.NPC.Random
                local totalNPC = table.getn(listNPC)
                settingsNPC.ConvID = false
                --UI.Notify(totalNPC)
                if(totalNPC > 0 and factionRank_DGA_Friend >= 1 and factionRank_DGA_Enemy >= 1)then
                    for i=1,totalNPC do
                        if(wanez.RNG({1,100},listNPC[i][1]))then
                            local totalSubNPC = table.getn(listNPC[i][2])
                            local subRatioTotal = 0
                            local aSubRatio = {}
                            for j=1,totalSubNPC do
                                local curRatio = 1
                                -- prevent error by checking if set
                                if(listNPC[i][2][j][2] ~= nil)then curRatio = listNPC[i][2][j][2];end;
                                subRatioTotal = subRatioTotal + curRatio
                                table.insert(aSubRatio,curRatio)
                            end
                            --UI.Notify("debug")
                            local useIndexNPC = wanez.RNG({1,subRatioTotal},aSubRatio)
                            local randNPC = listNPC[i][2][useIndexNPC][1]
                            -- get location (default proxy)
                            local endWhile = false
                            while (endWhile == false) do
                                local randomNPCLoc = wanez.RNG({1,totalProxies})
                                if(aSpecial[randomNPCLoc] == nil) then
                                    --aSpecial[randomNemesisLoc] = {{wanez._Data.Enemies.Nemesis[randNemesis],self.EnemyLevels["Nemesis"]}}
                                    aSpecial[randomNPCLoc] = {}
                                    table.insert(aSpecial[randomNPCLoc],{randNPC,self.EnemyLevels["Common"]})
                                    if(listNPC[i][2][useIndexNPC][3] ~= nil)then
                                        settingsNPC.ConvID = {}
                                        for k=1,listNPC[i][2][useIndexNPC][3][1] do
                                            local sumRatioConv = 0
                                            local aRatioConv = {}
                                            for k=1,table.getn(listNPC[i][2][useIndexNPC][3][2]) do
                                                table.insert(aRatioConv,listNPC[i][2][useIndexNPC][3][2][k])
                                                sumRatioConv = sumRatioConv + listNPC[i][2][useIndexNPC][3][2][k]
                                            end
                                            table.insert(settingsNPC.ConvID,wanez.RNG({1,sumRatioConv},aRatioConv))
                                        end
                                    end
                                    endWhile = true
                                end
                            end
                            
                        end
                    end;
                end
            end
            
            for i=1,totalProxies do
                local newArray = false
                local enemyDBR = false
                local proxyLoc = 0
                local enemyLevel = false
                proxyLoc = self.Proxies[argProxyType][i]
                if(argProxyType == "Default")then 
                    newArray = aSpecial[i] or false
                    if not(newArray)then
                        if(wanez.RNG({1,100},75))then newArray = self:genProxyDefault();end;
                    end
                elseif(argProxyType == "Boss" and wanez.dga.Settings:getSpecialID() == 0)then
                    newArray = self:genProxyBoss()
                end;
                
                if(newArray ~= false)then
                    local totalEntities = table.getn(newArray)
                    if(totalEntities > 0)then
                        for j=1,totalEntities do
                            enemyDBR = newArray[j][1]
                            enemyLevel = newArray[j][2]
                            self:createEntity(enemyDBR,proxyLoc,enemyLevel);
                        end
                    end
                end;
            end
        end;
        --
        addProxy = function(self,argObjectId,argType)
            table.insert(self.Proxies[argType],Proxy.Get(argObjectId):GetCoords())
        end;
        spawnEntities = function(self)
            factionRank_DGA_Friend = wanez.getFactionRank('USER14')
            factionRank_DGA_Enemy = wanez.getFactionRank('USER15')
            self.Tier = wanez.dga.Settings:getTier();
            self:setEnemyLevels();
            self:removeEntities();
            settingsNPC.Special = wanez.RNG({},10)
            self.EnemyCount = 0;
            local totalProxyTypes = table.getn(self.ProxyTypes)
            for i=1,totalProxyTypes do
                
                self:prepEntity(self.ProxyTypes[i])
                
            end
            --UI.Notify("Enemies: "..self.EnemyCount)
        end;
        --
        removeEntities = function(self)
            local totalEntities = table.getn(self.Entities)
            if(totalEntities > 0)then
                for i=1,totalEntities do
                    self.Entities[i]:Destroy()
                end
            end;
            
            self.Entities = {}
            --UI.Notify("Entities removed")
        end;
        npcHasSpecial = function(self)
            return settingsNPC.Special
        end;
        npcHasConv = function(self,argConvId)
            local isConv = false
            if(settingsNPC.ConvID)then
                for i=1,table.getn(settingsNPC.ConvID) do
                    if(settingsNPC.ConvID[i] == argConvId)then isConv = true;end;
                end;
            end
            return isConv;
        end;
        -- DYN - RIFT
        setRiftCollectionLoc = function(self,argCoords)
            riftCollectionLoc = argCoords;
        end;
        getRiftCollectionLoc = function(self)
            return riftCollectionLoc;
        end;
        getAreaTypeID = function(self) -- 1 Basic, 2 Endless, 3 Special, 4 Raid
            local areaTypeID = 1
            if(wanez.dga.Settings:getModeID() ~= 1)then areaTypeID = 2
            elseif(wanez.dga.Settings:getSpecialID() ~= 0)then areaTypeID = 3;end;
            return areaTypeID;
        end;
        -- onDie
        onDieSpawnContainer = function(self,argEnemyClassId,argEnemyId)
            local dbr = {
                [4] = {"mod_wanez/items/chests/containers/dga_special_01.dbr",{1,2,10}},
                [5] = {"mod_wanez/items/chests/containers/dga_boss_01.dbr",{20,30,50}},
                [6] = {"mod_wanez/items/chests/containers/dga_special_01.dbr",{10,20,40}},
                [7] = {"mod_wanez/items/chests/containers/dga_boss_01.dbr",{20,40,80}},
                [8] = {"mod_wanez/items/chests/containers/dga_special_01.dbr",{5,10,20}}
            }
            local areaMul = {
                1, -- Basic
                0, -- Endless
                0.25 -- Special
            }
            local uberMul = {1,2}
            local curTier = self.Tier + 1
            local curTypeID = self:getAreaTypeID()

            local isUber = wanez.dga.Settings:getIsUber() and 1 or 2;
            local curMul = areaMul[curTypeID] * uberMul[isUber] * curTier

            if(wanez.RNG({},math.ceil(dbr[argEnemyClassId][2][wanez.DifficultyID] * curMul)))then
                self:createEntity(dbr[argEnemyClassId][1],Character.Get(argEnemyId):GetCoords())
                UI.Notify("tagWaContainerSpawned")
            end

        end;
    }
    class:__constructor();
    return class;
end
--