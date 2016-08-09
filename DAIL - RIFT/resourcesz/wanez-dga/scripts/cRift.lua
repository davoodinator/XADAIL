--[[
Rifts are portals inside a DGA, leading to other parts of it
]]--
function wanez.dga.CRift()
    local LocShow = false
    local curRiftID = 0
    local prevRifts = {}
    
    local class = {
        Data = {};
        
        __constructor = function(self)
        end;
        moveRift = function(self,argLocked) -- argLocked: also decides if show coords or hide coords
            argLocked = argLocked or false
            if(curRiftID ~= 0)then
                local curData = self.Data[curRiftID]
                local newLoc = (argLocked == false) and self:getLocShow() or curData.Loc
                curData.Instance:SetLocked(argLocked)
                curData.Instance:SetCoords(newLoc)
            end
        end;
        addRift = function(self,argObjectId,argRiftId)
            if(self.Data[argRiftId] == nil)then
                local riftInstance = Door.Get(argObjectId)
                self.Data[argRiftId] = {
                    ["ObjectID"] = argObjectId,
                    ["Instance"] = riftInstance,
                    ["Loc"] = riftInstance:GetCoords()
                }
            end
        end;
        setLocShow = function(self,argObjectId)
            if(LocShow == false)then LocShow = Entity.Get(argObjectId):GetCoords();end;
        end;
        getLocShow = function(self)
            return LocShow;
        end;
        genRiftID = function(self)
            --argAreaId = argAreaId || wanez.dga.Settings:getAreaID()
            --argRiftId = argRiftId || self:getAreaID()
            -- set default LayoutID
            local newRiftID = 1
            
            local countRifts = table.getn(self.Data)
            
            if(countRifts > 1)then
                if(prevRifts == nil)then prevRifts = {};end;
                local prevRiftIDCount = table.getn(prevRifts)
                local rndRiftID = wanez.RNG({1,countRifts})
                if(prevRiftIDCount ~= 0)then
                    local whileRiftID = 0
                    while (whileRiftID == 0) do
                        whileRiftID = rndRiftID
                        for i=1,prevRiftIDCount do
                            if(rndRiftID == prevRifts[i])then whileRiftID = 0 end
                        end
                        if(whileRiftID == 0)then rndRiftID = wanez.RNG({1,countRifts}) end
                    end
                end
                newRiftID = rndRiftID
                if(prevRiftIDCount == (countRifts - 1))then prevRifts = {} end
                table.insert(prevRifts,newRiftID)
            end
            
            return newRiftID;
        end;
        setActiveRift = function(self)
            curRiftID = self:genRiftID()
        end;
        
    }
    class:__constructor()
    return class; 
end
--