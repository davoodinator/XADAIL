--[[
Primary Settings, or global settings inside DGA-MOD
]]--
function wanez.dga.cSettings(argObjectId,optData)
    optData = optData or {["AreaID"]=0,["LayoutID"]=0,["FloorID"]=0,["RegionID"]=0,["Tier"]=0,["ModeID"]=0,["SpecialID"]=0};

    local class = {
        Data = optData;
        Hideout = {};
        Reward = {};
        PrevLayoutID = {};
        -- SET
        genRandomAreaID = function(self,argAreaId)
            local newAreaID = argAreaId
            if(newAreaID == 0)then
                local totalAreaCount = table.getn(wanez.dga._Settings.Areas.Random.Default)
                newAreaID = wanez.dga._Settings.Areas.Random.Default[wanez.RNG({1,totalAreaCount})]
            end
            return newAreaID
        end;
        setAreaID = function(self,argAreaId)
            self.Data.AreaID = self:genRandomAreaID(argAreaId);
            wanez.dga.localVar.AreaID = self.Data.AreaID;
        end;
        setLayoutID = function(self,argLayoutId)
            argLayoutId = argLayoutId or self:genLayoutID()
            self.Data.LayoutID = argLayoutId;
            wanez.dga.localVar.LayoutID = self.Data.LayoutID
        end;
        setFloorID = function(self,argFloorId)
            self.Data.FloorID = argFloorId;
            wanez.dga.localVar.FloorID = self.Data.FloorID
        end;
        incFloorID = function(self)
            self.Data.FloorID = self.Data.FloorID + 1
            self.Data.RegionID = 1
            wanez.dga.localVar.FloorID = self.Data.FloorID
            wanez.dga.localVar.RegionID = self.Data.RegionID
        end;
        setRegionID = function(self,argRegionId)
            self.Data.RegionID = argRegionId;
            wanez.dga.localVar.RegionID = self.Data.RegionID
        end;
        incRegionID = function(self)
            self.Data.RegionID = self.Data.RegionID + 1
            wanez.dga.localVar.RegionID = self.Data.RegionID
        end;
        setPortalCharges = function(self)
            self.Data.PortalCharges = Game.GetNumPlayers();
        end;
        setTier = function(self,argTier)
            self.Data.Tier = argTier
        end;
        setModeID = function(self,argModeId)
            self.Data.ModeID = argModeId
        end;
        setSpecialID = function(self,argSpecialId)
            self.Data.SpecialID = argSpecialId
        end;
        setKillCount = function(self,argKillCount)
            self.Reward.KillCount = argKillCount
        end;
        setSpecialCredit = function(self,argCredit)
            self.Reward.SpecialCredit = argCredit
        end;
        setLocPortalToArea = function(self)
            self.Hideout.LocPortalToArea = Entity.Get(argObjectId):GetCoords();
        end;
        setSpawnTrigger = function(self,argSpawn)
            argSpawn = argSpawn or false
            self.Data.SpawnTrigger = argSpawn
        end;
        setIsUber = function(self,argIsUber)
            self.Data.isUber = argIsUber
        end;
        -- METHODS
        __constructor = function(self)
            self:setLocPortalToArea();
            --self.Data.DifficultyID = self:genDifficultyID();
            wanez.DifficultyID = self:genDifficultyID();
        end;
        applyMode = function(self)
            local ModeID = self.Data.ModeID
            if(ModeID == 2)then
                self:setTier(self:getTier()+1)
            elseif(ModeID == 3)then
            end
            
        end;
        onOpenPortal = function(self,argAreaId,argSpecialId,argIsUber)
            argIsUber = argIsUber or false
            self:setSpecialID(argSpecialId);
            self:setIsUber(argIsUber)
            self:setAreaID(argAreaId);
            self:setLayoutID();
            self:setFloorID(1);
            self:setRegionID(1);
            self:setPortalCharges();
            self:setSpawnTrigger(true);
            wanez.dga.Data.Rewards:resetData(self:getUberID())
            
            return {self:getAreaID(),self:getLayoutID(),self:getTier()};
        end;
        prepPortal = function(self,argTier,argModeId)
            --argIsUber = argIsUber or false
            --self:setIsUber(argIsUber)
            math.randomseed(Time.Now())
            self:setTier(argTier);
            self:setModeID(argModeId);
            self:setSpecialID(0);
            self:setKillCount(0);
            self:setSpecialCredit(0);
            wanez.dga.var.BlockProxyCleanUp = false
            wanez.dga.Data.Rewards:resetData(1)
            
            wanez.dga.Areas.Default:removeEntities();
            --wanez.dga.Data.Portals[self:getAreaID()][self:getLayoutID()]:movePortal(true);
        end;
        onOpenPortalNextArea = function(self,argAreaId)
            wanez.dga.var.BlockProxyCleanUp = false
            math.randomseed(Time.Now())
            self:setAreaID(argAreaId);
            self:setLayoutID();
            self:setFloorID(1);
            self:setRegionID(1);
            self:setPortalCharges();
            --self:setSpawnTrigger(true);

            wanez.dga.Areas.Default:removeEntities();

            return {self:getAreaID(),self:getLayoutID(),self:getTier()};
        end;
        genLayoutID = function(self,argAreaId)
            argAreaId = argAreaId or self:getAreaID()
            -- set default LayoutID
            local newLayoutID = 1
            local rndLayoutID = newLayoutID

            local countLayouts = table.getn(wanez.dga.Data.Portals[argAreaId])
            --UI.Notify(countLayouts)
            if(countLayouts > 1)then
                if(self.PrevLayoutID[argAreaId] == nil)then self.PrevLayoutID[argAreaId] = {};end;
                local prevLayoutIDCount = table.getn(self.PrevLayoutID[argAreaId])
                if(prevLayoutIDCount ~= 0)then
                    local doWhile = true
                    while (doWhile) do
                        rndLayoutID = wanez.RNG({1,countLayouts})
                        for i=1,prevLayoutIDCount do
                            if(rndLayoutID ~= self.PrevLayoutID[argAreaId][i])then doWhile = false end
                        end;
                    end;
                end
                newLayoutID = rndLayoutID
                if(prevLayoutIDCount == (countLayouts - 1))then self.PrevLayoutID[argAreaId] = {} end
                table.insert(self.PrevLayoutID[argAreaId],newLayoutID)
            end
            
            return newLayoutID;
        end;
        genDifficultyID = function(self)
            local retValue = 1
            if (Game.GetGameDifficulty() == Game.Difficulty.Normal)then retValue = 1
            elseif (Game.GetGameDifficulty() == Game.Difficulty.Epic)then retValue = 2
            else retValue = 3 end
            return retValue
        end;
        -- GET
        getSettings = function(self,argArray) -- string argArray only returns one of the arrays
            local newArray = {
                ["Data"] = self.Data,
                ["Reward"] = self.Reward,
                ["Hideout"] = self.Hideout
            }
            local retArray = (argArray ~= nil) and newArray[argArray] or newArray
            return retArray;
        end;
        getTier = function(self) return self.Data.Tier;end;
        getFloorID = function(self) return self.Data.FloorID;end;
        getRegionID = function(self) return self.Data.RegionID;end;
        getModeID = function(self) return self.Data.ModeID;end;
        getSpecialID = function(self) return self.Data.SpecialID;end;
        getAreaID = function(self) return self.Data.AreaID;end;
        getLayoutID = function(self) return self.Data.LayoutID;end;
        getLocPortalToArea = function(self) return self.Hideout.LocPortalToArea;end;
        getSpawnTrigger = function(self) return self.Data.SpawnTrigger;end;
        getIsUber = function(self) return self.Data.isUber;end;
        getUberID = function(self)
            local uberId = self.Data.isUber and 2 or 1
            return uberId;
        end;
        
        
    }
    -- "constructor"
    class:__constructor();
    return class;
end;
--
