--[[
Portal "Class"
]]--
function wanez.dga.cPortal(argObjectId)
    local portalInstance = Door.Get(argObjectId);

    local class = {
        ObjectID = argObjectId;
        Loc = portalInstance:GetCoords();
        Data = {};
        movePortal = function(self,argLocked) -- argLocked: also decides if show coords or hide coords
            argLocked = argLocked or false
            local newLoc = (argLocked == false) and self:getLocPortalToArea() or self:getLoc()
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
        setLocked = function(self,argIsLocked)
            argIsLocked = argIsLocked or false
            portalInstance:SetLocked(argIsLocked)
        end;
        actionPortalReturn = function(self,argAction)
            argAction = argAction or 'show'
            local isLocked = false
            local newLoc = false
            if(argAction == 'show')then
                local player = Game.GetLocalPlayer()
                newLoc = player:GetCoords()
            elseif(argAction == 'lock')then
                isLocked = true
            elseif(argAction == 'hide')then
                isLocked = true
                newLoc = self:getLoc()
                UI.Notify("ok")
            end
            portalInstance:SetLocked(isLocked)
            if(newLoc)then portalInstance:SetCoords(newLoc);end;
        end;
        actionPortal = function(self,argAction,argCoords)
            argAction = argAction or 'show'
            argCoords = argCoords or self:getLoc()
            local isLocked = false
            local newLoc = false
            if(argAction == 'show')then
                local player = Game.GetLocalPlayer()
                newLoc = player:GetCoords()
            elseif(argAction == 'lock')then
                isLocked = true
            elseif(argAction == 'hide')then
                isLocked = true
                newLoc = argCoords
            end
            portalInstance:SetLocked(isLocked)
            if(newLoc)then portalInstance:SetCoords(newLoc);end;
        end;
        
    }
    return class
end
