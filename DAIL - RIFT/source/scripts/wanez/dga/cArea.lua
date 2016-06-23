--[[
Events happening inside an Area (DGA), ie spawning entities
]]--
function wanez.dga.cArea(argProxyTypes)
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
            -- calculation
            local enemyLevel = playerLevel + dgaTier + difOffset + enemyOffset + catOffset
            return enemyLevel -- , nil
        end;
        --
        setEnemyLevels = function(self)
            local totalEnemyClasses = table.getn(wanez.data.Enemies.Classification)
            for i=1,totalEnemyClasses do
                local enemyClassName = wanez.data.Enemies.Classification[i]
                local enemyOffset = wanez._Settings.Enemies.LevelOffset[enemyClassName] || 0
                self.EnemyLevels[enemyClassName] = self:getEnemyLevel(enemyOffset)
            end
            
        end;
        --
        createEntity = function(self,argDBR,argLoc,argEnemyLevel)
            local newEntity = false
            if(argEnemyLevel != nil && argEnemyLevel != 0)then -- its a monster
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
            if(chestDBR != nil) then
                --local newContainer = Entity.Create(chestDBR)
                --newContainer:SetCoords(argCoords)
                --saveContainer(newContainer)
                --table.insert(dgaEntityStorage,newContainer)
                local aContainer = {chestDBR,0}
                table.insert(optEntities,aContainer)
                --UI.Notify("chest spawned")
            end
            return optEntities
        end;
        -- PROXIES
        genProxyDefault = function(self)
            local aEntities = {}
            local aEnemies = {}
            local aEnemyData = {
                ["enemyCount"] = 1,
                ["totalPoolCount"] = 1,
                ["pool"] = 1,
                ["enemyClassName"] = "Common"
            }
            -- check if Aether
            local spawnType = wanez.RNG({},{
                    ((self.EnemyLevels["AetherCrystal"] >= wanez._Settings.Anomalies.LevelRequirements.AetherCrystal) && wanez._Settings.Anomalies.Chances["Aether"][wanez.DifficultyID] || 0),
                    ((self.EnemyLevels["AetherObelisk"] >= wanez._Settings.Enemies.LevelRequirements.AetherObelisk) && wanez._Settings.Enemies.Chances["Aether"][wanez.DifficultyID] || 0),
                    ((self.EnemyLevels["Champion"] >= wanez._Settings.Enemies.LevelRequirements.Champion) && wanez._Settings.Enemies.Chances["Champion"][wanez.DifficultyID] || 0)
                });
            -- check if champion spawn or common
            --if(wanez.RNG({},wanez._Settings.Enemies.Chances["Champion"][wanez.DifficultyID]))then aEnemyData.enemyClassName = "Champion";end;
            if(spawnType == 1)then aEnemyData.enemyClassName = "AetherCrystal";end;
            if(spawnType == 2)then aEnemyData.enemyClassName = "AetherObelisk";end;
            if(spawnType == 3)then aEnemyData.enemyClassName = "Champion";end;
            
            if(aEnemyData.enemyClassName == "AetherObelisk" || aEnemyData.enemyClassName == "AetherCrystal")then
                --if(aEnemyData.enemyClassName == "AetherCrystal")then
                --   aEnemyData.randPoolDefault = 1
                --elseif(aEnemyData.enemyClassName == "AetherObelisk")then
                --   aEnemyData.randPoolDefault = 2
                --end
                aEnemyData.randPoolDefault = spawnType
                aEnemyData.pool = wanez._Data.Enemies.Aether[aEnemyData.randPoolDefault]
                aEnemyData.totalPoolCount = table.getn(aEnemyData.pool)
                aEnemyData.enemyCount = 1
                
                aEntities = self:genEnemy(aEnemyData,aEntities)
            elseif(aEnemyData.enemyClassName == "Common" || aEnemyData.enemyClassName == "Champion")then
                -- TODO: wanez.dga._Settings.Enemies.Pools.Area.Default
                
                -- Containers
                aEntities = self:genContainer(aEntities)
                
                -- get Enemy Pool
                aEnemyData.randPoolDefault = wanez.RNG({1,self.PoolCounts.Default})
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
            if(poolBossContainer != nil)then
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
            local totalProxies = table.getn(self.Proxies[argProxyType])
            local aSpecial = {}
            
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
                local FactionValueID = 0
                if(wanez.dga.Token["DGA_NO_NEMESIS"] == false)then
                    local playerFactionValue = Game.GetLocalPlayer():GetFaction("USER15")
                    if(playerFactionValue <= -20000)then FactionValueID = 3
                    elseif(playerFactionValue <= -8000)then FactionValueID = 2
                    elseif(playerFactionValue <= -1500)then FactionValueID = 1 end
                end
                if (FactionValueID != 0)then
                    -- number of nemesis spawns
                    local countNemesisSpawns = wanez.RNG({wanez._Settings.Enemies.Count.Nemesis[FactionValueID][1],wanez._Settings.Enemies.Count.Nemesis[FactionValueID][2]})
                    -- check if Nemesis should spawn
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
                -- TODO: SPECIAL
            end
            
            for i=1,totalProxies do
                local newArray = false
                local enemyDBR = false
                local proxyLoc = 0
                local enemyLevel = nil
                proxyLoc = self.Proxies[argProxyType][i]
                if(argProxyType == "Default")then 
                    newArray = aSpecial[i] || self:genProxyDefault()
                elseif(argProxyType == "Boss" && wanez.dga.Settings:getSpecialID() == 0)then
                    newArray = self:genProxyBoss()
                end;
                
                if(newArray != false)then
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
            self.Tier = wanez.dga.Settings:getTier();
            self:setEnemyLevels();
            self:removeEntities();
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
        
    }
    class:__constructor();
    return class;
end
--