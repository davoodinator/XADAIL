
local dgaCleanProxies = true -- true: 
local BlockBridge = false

local function setEntityLoc(argObjectId,argType)
    if(Server)then
        if(dgaCleanProxies == true && wanez.dga.var.BlockProxyCleanUp == false)then
            wanez.dga.Areas[dgaAreaType] = wanez.dga.cArea({"Default","Boss"});
            dgaCleanProxies = false
        end;
        --if(argType == "Boss")then UI.Notify("onLoad Boss");end
        if(wanez.dga.var.BlockProxyCleanUp == false)then
            wanez.dga.Areas[dgaAreaType]:addProxy(argObjectId,argType)
        end
    end
end


function wanez.dga.spawnTrigger(argObjectId)
    if(Server && wanez.dga.Settings:getSpawnTrigger() == true)then
        math.randomseed(Time.Now())
        --local aSettings = wanez.dga.Settings:getSettings()
        
        wanez.dga.Areas[dgaAreaType]:spawnEntities();
        
        --UI.Notify("AreaID: "..aSettings.Data.AreaID.." | LayoutID: "..aSettings.Data.LayoutID.." | FloorID: "..aSettings.Data.FloorID.." | RegionID: "..aSettings.Data.RegionID)
        dgaCleanProxies = true
        wanez.dga.var.BlockProxyCleanUp = true
        wanez.dga.Settings:setSpawnTrigger();
        UI.Notify("tagWaEventNewMonsters")
    end
end

function wanez.dga.regProxyDefault_00(argObjectId) setEntityLoc(argObjectId,"Default");end;
function wanez.dga.regProxyBoss_00(argObjectId) setEntityLoc(argObjectId,"Boss");end;


function wanez.dga.portalToStart01(argObjectId)
	-- body
	wanez.dga.Settings:setSpawnTrigger(true)
end
--
function wanez.dga.bridgeTrigger01()
	if(Server && BlockBridge == false)then
        local areaRifts = wanez.dga.Rifts[wanez.dga.Settings:getAreaID()]
		BlockBridge = true
		wanez.dga.Settings:setSpawnTrigger(true);
		
		wanez.dga.portalToNextLayout01OnInteract()
        areaRifts:setActiveRift()
        areaRifts:moveRift()

        wanez.dga.var.BlockProxyCleanUp = false
		-- Remove Entities
		wanez.dga.Areas[dgaAreaType]:removeEntities()
		
		--calcDGACreditReward(dgaSettings.AreaID,"Key")
	end
end
--
function wanez.dga.portalToBridge01OnInteract(argObjectId)
	BlockBridge = false
    wanez.dga.Settings:applyMode()
end
--
function wanez.dga.portalToNextLayout01OnInteract(argObjectId)
    wanez.dga.Rifts[wanez.dga.Settings:getAreaID()]:moveRift(true);
end
--
function wanez.dga.regPortalCoordsForBridge01(argObjectId)
    if(wanez.dga.Rifts[wanez.dga.Settings:getAreaID()] == nil)then wanez.dga.Rifts[wanez.dga.Settings:getAreaID()] = wanez.dga.CRift();end;
    wanez.dga.Rifts[wanez.dga.Settings:getAreaID()]:setLocShow(argObjectId)
    BlockBridge = false
end
-- for special portals found in endless dungeons or multi-level areas
local function setPortalDataToNextLayout(argObjectId,argRiftId,argLayoutId)
    if(wanez.dga.Rifts[wanez.dga.Settings:getAreaID()] == nil)then wanez.dga.Rifts[wanez.dga.Settings:getAreaID()] = wanez.dga.CRift();end;
    wanez.dga.Rifts[wanez.dga.Settings:getAreaID()]:addRift(argObjectId,argRiftId)
end
--
function wanez.dga.regPortalToNextLayout_02(argObjectId) setPortalDataToNextLayout(argObjectId,1,2);end;
function wanez.dga.regPortalToNextLayout_03(argObjectId) setPortalDataToNextLayout(argObjectId,2,3);end;
function wanez.dga.regPortalToNextLayout_04(argObjectId) setPortalDataToNextLayout(argObjectId,3,4);end;
function wanez.dga.regPortalToNextLayout_05(argObjectId) setPortalDataToNextLayout(argObjectId,4,5);end;
