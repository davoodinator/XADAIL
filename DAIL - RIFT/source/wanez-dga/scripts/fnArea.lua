
local dgaVar = wanez.dga.localVar
local dgaCleanProxies = true -- true: 
local BlockBridge = false
local useGlobalProxy = false

local function setEntityLoc(argObjectId,argType)
    if(Server and useGlobalProxy)then
        if(--[[dgaCleanProxies == true and ]]wanez.dga.var.BlockProxyCleanUp == false)then --
            wanez.dga.Areas[dgaAreaType] = wanez.dga.cArea({"Default","Boss"});
            --dgaCleanProxies = false
            wanez.dga.var.BlockProxyCleanUp = true
        end;
        --if(argType == "Boss")then UI.Notify("onLoad Boss");end
        if(wanez.dga.var.BlockProxyCleanUp == true)then
            wanez.dga.Areas[dgaAreaType]:addProxy(argObjectId,argType)
        end
    end
end
local collectFailed = 0
-- the trigger will perform the rift collection
local function collectRifts()
    collectFailed = collectFailed + 1
    wanez.dga.Data.Rewards:resetKillCount()
    local hideLoc = Game.GetLocalPlayer():GetCoords()
    if(collectFailed < 3)then hideLoc = wanez.dga.Areas[dgaAreaType]:getRiftCollectionLoc();end;
    --local _playerCoords = Game.GetLocalPlayer():GetCoords()
    for i=1,table.getn(wanez.dga.DynRifts) do
        --[[
        if(collectFailed < 3)then
            wanez.dga.DynRifts[i]:actionPortal('hide',wanez.dga.Areas[dgaAreaType]:getRiftCollectionLoc())
        else
            wanez.dga.DynRifts[i]:actionPortal('hide',_playerCoords)
        end
        ]]
        wanez.dga.DynRifts[i]:actionPortal('hide',hideLoc)
    end
    --wanez.dga.RiftHO:actionPortal('hide',wanez.dga.Areas[dgaAreaType]:getRiftCollectionLoc())
    --wanez.dga.RiftHO:actionPortal('hide',_playerCoords)
    wanez.dga.RiftHO:actionPortal('hide',hideLoc)
    collectFailed = 0
end
function wanez.dga.spawnTrigger(argObjectId)
    if(Server and wanez.dga.Settings:getSpawnTrigger() == true)then
        math.randomseed(Time.Now())
        --local aSettings = wanez.dga.Settings:getSettings()
        --UI.Notify('Current: '..dgaVar.AreaID..' | '..dgaVar.LayoutID..' | '..dgaVar.FloorID..' | '..dgaVar.RegionID)
        collectRifts()
        
        wanez.dga.Areas[dgaAreaType]:spawnEntities();
        
        --UI.Notify("AreaID: "..aSettings.Data.AreaID.." | LayoutID: "..aSettings.Data.LayoutID.." | FloorID: "..aSettings.Data.FloorID.." | RegionID: "..aSettings.Data.RegionID)
        --if(wanez.dga.Settings:getAreaID() ~= 102)then
            --if(wanez.dga.Areas[dgaAreaType]:getAreaTypeID() ~= 1 and Game.GetLocalPlayer():HasItem('mod_wanez/items/dga/scroll_portal_hideout.dbr',1,true))then ;end;
        --end
        dgaCleanProxies = true
        wanez.dga.var.BlockProxyCleanUp = true
        wanez.dga.Settings:setSpawnTrigger();
        if(wanez.dga.Settings:getModeID() == 2)then wanez.dga.Settings:setTier(wanez.dga.Settings:getTier() + 1);end;
        UI.Notify("tagWaEventNewMonsters")
    end
end

function wanez.dga.regProxyDefault_00(argObjectId) setEntityLoc(argObjectId,"Default");end;
function wanez.dga.regProxyBoss_00(argObjectId) setEntityLoc(argObjectId,"Boss");end;
function wanez.dga.regProxyOmega_00(argObjectId) setEntityLoc(argObjectId,"Omega");end;

function wanez.dga.portalToStart01(argObjectId)
	-- body
	wanez.dga.Settings:setSpawnTrigger(true)
end
--
function wanez.dga.bridgeTrigger01()
	if(Server and BlockBridge == false)then
        collectRifts()
        local areaRifts = wanez.dga.Rifts[wanez.dga.Settings:getAreaID()]
		wanez.dga.Settings:setSpawnTrigger(true);
		
		wanez.dga.portalToNextLayout01OnInteract()
        areaRifts:setActiveRift()
        areaRifts:moveRift()

        wanez.dga.var.BlockProxyCleanUp = false
		-- Remove Entities
		wanez.dga.Areas[dgaAreaType]:removeEntities()

        BlockBridge = true
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
-- sets the rift collection loc whenever the onAddToWorld Event is triggered inside a DGA
function wanez.dga.collectPortals00(argObjectId)
    if not(dgaBlockPortalCollector)then wanez.dga.Areas[dgaAreaType]:setRiftCollectionLoc(Entity.Get(argObjectId):GetCoords());end;
    dgaBlockPortalCollector = true
    --UI.Notify("Triggered")
end
-- for special portals found in endless dungeons or multi-level areas
local function setPortalDataToNextLayout(argObjectId,argRiftId,argLayoutId)
    if(wanez.dga.Rifts[wanez.dga.Settings:getAreaID()] == nil)then wanez.dga.Rifts[wanez.dga.Settings:getAreaID()] = wanez.dga.CRift();end;
    wanez.dga.Rifts[wanez.dga.Settings:getAreaID()]:addRift(argObjectId,argRiftId)
end
-- set new FloorID, remove entities, etc
function wanez.dga.gotoNextFloor(argObjectId)
    --UI.Notify("GoTo Next Floor")
    wanez.dga.var.BlockProxyCleanUp = false
    wanez.dga.Settings:setSpawnTrigger(true);
    wanez.dga.Settings:incFloorID();
    wanez.dga.Areas[dgaAreaType]:removeEntities();
    --UI.Notify(dgaVar.FloorID)
    --UI.Notify(wanez.dga.Settings:getAreaID())
end
--
function wanez.dga.regPortalToNextLayout_02(argObjectId) setPortalDataToNextLayout(argObjectId,1,2);end;
function wanez.dga.regPortalToNextLayout_03(argObjectId) setPortalDataToNextLayout(argObjectId,2,3);end;
function wanez.dga.regPortalToNextLayout_04(argObjectId) setPortalDataToNextLayout(argObjectId,3,4);end;
function wanez.dga.regPortalToNextLayout_05(argObjectId) setPortalDataToNextLayout(argObjectId,4,5);end;
