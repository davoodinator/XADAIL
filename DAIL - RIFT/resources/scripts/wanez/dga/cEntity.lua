--[[
Entity Classification Methods
]]--
function wanez.dga.cEntity(argClassID)
    local ClassID = argClassID or 0
    local GlobalLoot = {}
    local class = {
        __constructor = function(self)
            -- perform most of the basic calculations before the onDie event
            GlobalLoot.DropChance = wanez.dga._Data.Chances.Global.Classification[ClassID][2]
            GlobalLoot.DropSlots = table.getn(GlobalLoot.DropChance)
            GlobalLoot.ListLT = wanez.dga._Data.LootTables.Global
            GlobalLoot.CountLT = table.getn(GlobalLoot.ListLT)
            GlobalLoot.aLT = {} -- list tables inside globalLT
            
            for i=1,GlobalLoot.CountLT do
                local curLT = GlobalLoot.ListLT[i]
                local maxRatio = 0
                
                GlobalLoot.aLT[i] = {}
                GlobalLoot.aLT[i].Count = table.getn(curLT)
                GlobalLoot.aLT[i].aRatio = {}
                GlobalLoot.aLT[i].Lists = {}
                for j=1,GlobalLoot.aLT[i].Count do
                    maxRatio = maxRatio + curLT[j].Ratio
                    table.insert(GlobalLoot.aLT[i].aRatio,curLT[j].Ratio)
                end;
                GlobalLoot.aLT[i].maxRatio = maxRatio
            end;
        end;
        dropLoot = function(self,argDBR,argCount,argCoords)
            argCoords = argCoords or false
            if(Game.GetLocalPlayer():HasToken('DGA_AUTOLOOT') or argCoords == false)then -- wanez.dga.var.GiveItem
                Game.GetLocalPlayer():GiveItem(argDBR,argCount,false)
            else
                for j=1,argCount do
                    local newItem = Entity.Create(argDBR)
                    newItem:SetCoords(argCoords)
                end;
            end
        end;
        calcGlobalDropChance = function(self,argSlot)
            return wanez.RNG({1,GlobalLoot.DropChance[argSlot][1]},GlobalLoot.DropChance[argSlot][2])
        end;
        usesLevel = function(self,argList,argEnemyLevel)
            local totalItems = table.getn(argList)
            local randItem = wanez.RNG({1,totalItems})
            local retDBR = false
            
            local endWhile = false;
            while(endWhile == false)do
                local reqLevel = argList[randItem][2] or 0
                
                if(argEnemyLevel >= reqLevel)then
                    retDBR = argList[randItem][1]
                    endWhile = true;
                else
                    randItem = wanez.RNG({1,totalItems})
                end
            end;
            return retDBR;
        end;
        usesTier = function(self,argCurLt,optTierBalance)
            local countTierDrops = table.getn(argCurLt)
            local minTier = wanez.dga.Settings:getTier() - optTierBalance[1] + wanez._Settings.Enemies.LevelOffset[wanez.data.Enemies.Classification[ClassID]]
            if(minTier <= 0)then minTier = 1;end;
            if(minTier > countTierDrops)then minTier = countTierDrops;end;
            local maxTier = wanez.dga.Settings:getTier() + optTierBalance[2] + wanez._Settings.Enemies.LevelOffset[wanez.data.Enemies.Classification[ClassID]]
            if(maxTier > countTierDrops)then maxTier = countTierDrops end
            -- calculate tier drop
            return argCurLt[wanez.RNG({minTier,maxTier})][1];
        end;
        getDBR = function(self,arg)
            
        end;
        genLoot = function(self,argObjectId,argItemCount)
            argItemCount = argItemCount or 0
            local enemy = Character.Get(argObjectId)
            for h=1,GlobalLoot.DropSlots do
                if(self:calcGlobalDropChance(h))then
                    for i=1,GlobalLoot.CountLT do
                        local curLT = GlobalLoot.ListLT[i][wanez.RNG({1,GlobalLoot.aLT[i].maxRatio},GlobalLoot.aLT[i].aRatio)]
                        --local curLT = GlobalLoot.ListLT[wanez.RNG({1,GlobalLoot.aLT.maxRatio},GlobalLoot.aLT.aRatio)]
                        
                        if(enemy:GetLevel() >= curLT.LevelRequirements[wanez.DifficultyID])then
                            --UI.Notify(curLT.Name)
                            local totalLists = table.getn(curLT["Lists"])
                            local randList = wanez.RNG({1,totalLists})
                            local totalListTypes = table.getn(curLT["Lists"][randList])
                            local randListType = wanez.RNG({1,totalListTypes})
                            --local totalItems = table.getn(curLT["Lists"][randList][randListType][wanez.DifficultyID])
                            --local randItem = wanez.RNG({1,totalItems})
                            --local itemCount = (argItemCount > 0) && argItemCount || 1
                            local itemCount = 1
                            local itemDBR = false

                            -- check if reqlevel or tier is used to determine DBR
                            if(curLT["UseTier"][randList] == false)then
                                itemDBR = self:usesLevel(curLT["Lists"][randList][randListType][wanez.DifficultyID],enemy:GetLevel())
                            else
                                itemDBR = self:usesTier(curLT["Lists"][randList][randListType][wanez.DifficultyID],curLT["UseTier"][randList])
                            end
                            --itemDBR = curLT["Lists"][randList][randListType][wanez.DifficultyID][randItem][1]
                            
                            -- give additional items depending on difficulty
                            if(curLT["ICwD"][randList])then itemCount = wanez.DifficultyID;end;
                            -- Give or Drop Items
                            self:dropLoot(itemDBR,itemCount,enemy:GetCoords())
                        end
                    end;
                end
            end;
        end;
        getClassID = function(self)
            return ClassID;
        end;
        
    }
    class:__constructor();
    return class;
end
