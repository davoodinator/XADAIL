--[[
Portal "Class"
]]--
function wanez.dga.cPortal(argObjectId)
    local portalInstance = Door.Get(argObjectId);
    --argObjectId = argObjectId || 0
    local class = {
        ObjectID = argObjectId;
        Loc = portalInstance:GetCoords();
        Data = {};
        movePortal = function(self,argLocked) -- argLocked: also decides if show coords or hide coords
            argLocked = argLocked || false
            local newLoc = (argLocked == false) && self:getLocPortalToArea() || self:getLoc()
            portalInstance:SetLocked(argLocked)
            portalInstance:SetCoords(newLoc)
        end;
        getObjectID = function(self)
            return self.ObjectID;
        end;
        getLoc = function(self)
            return self.Loc;
        end;
        getLocPortalToArea = function(self) -- is set in .cSettings
            return wanez.dga.Settings:getLocPortalToArea();
        end;
        
    }
    return class
end
