--[[
Created by IntelliJ IDEA.
User: WareBare
Date: 7/25/2016
Time: 3:51 AM

Package: Wanez.dga

Because for some reason the game triggers the onAddToWorld Event for more than one area, I have to make this less dynamic
]]--
local dgaVar = wanez.dga.localVar
local function resetArea()
    if(wanez.dga.var.BlockProxyCleanUp == false)then
        wanez.dga.Areas[dgaAreaType] = wanez.dga.cArea({"Default","Boss"});
        wanez.dga.var.BlockProxyCleanUp = true
    end;
end

--
local function setEntityLoc(argObjectId,argType,argAreaID,argLayoutID,argFloorID,argRegionID)
    argAreaID = argAreaID or 1
    argLayoutID = argLayoutID or 1
    argFloorID = argFloorID or 1
    argRegionID = argRegionID or 1
    local isAreaProxy = false
    if(argAreaID == dgaVar.AreaID and argLayoutID == dgaVar.LayoutID and argFloorID == dgaVar.FloorID and argRegionID == dgaVar.RegionID)then isAreaProxy = true;end;
    if(Server)then -- isAreaProxy
        --[[
        if(wanez.dga.var.BlockProxyCleanUp == false)then
            wanez.dga.Areas[dgaAreaType] = wanez.dga.cArea({"Default","Boss"});
            wanez.dga.var.BlockProxyCleanUp = true
        end;
        ]]--
        resetArea()
        if(wanez.dga.var.BlockProxyCleanUp == true)then
            wanez.dga.Areas[dgaAreaType]:addProxy(argObjectId,argType,argAreaID,argLayoutID,argFloorID,argRegionID)
        end
    end
end
local function setPortalCollectLoc(argObjectId,argAreaID,argLayoutID,argFloorID,argRegionID)
    argAreaID = argAreaID or 1
    argLayoutID = argLayoutID or 1
    argFloorID = argFloorID or 1
    argRegionID = argRegionID or 1
    resetArea()
    wanez.dga.Areas[dgaAreaType]:setRiftCollectionLoc(argObjectId,argAreaID,argLayoutID,argFloorID,argRegionID)
    --UI.Notify(' Floor: '..argAreaID..' | '..argLayoutID..' | '..argFloorID..' | '..argRegionID)
end
--[[
BASIC
]]--
-- ID: 1
function wanez.dga.regProxy__00_Area_0001_01_01_01__Boss_00(argObjectId)setEntityLoc(argObjectId,'Boss',1,1,1,1);end;
function wanez.dga.regProxy__00_Area_0001_01_01_01__Default_00(argObjectId)setEntityLoc(argObjectId,'Default',1,1,1,1);end;
function wanez.dga.regProxy__00_Area_0001_01_01_01__Portals_00(argObjectId)setPortalCollectLoc(argObjectId,1,1,1,1);end;
function wanez.dga.regProxy__00_Area_0001_02_01_01__Boss_00(argObjectId)setEntityLoc(argObjectId,'Boss',1,2,1,1);end;
function wanez.dga.regProxy__00_Area_0001_02_01_01__Default_00(argObjectId)setEntityLoc(argObjectId,'Default',1,2,1,1);end;
function wanez.dga.regProxy__00_Area_0001_02_01_01__Portals_00(argObjectId)setPortalCollectLoc(argObjectId,1,2,1,1);end;
function wanez.dga.regProxy__00_Area_0001_03_01_01__Boss_00(argObjectId)setEntityLoc(argObjectId,'Boss',1,3,1,1);end;
function wanez.dga.regProxy__00_Area_0001_03_01_01__Default_00(argObjectId)setEntityLoc(argObjectId,'Default',1,3,1,1);end;
function wanez.dga.regProxy__00_Area_0001_03_01_01__Portals_00(argObjectId)setPortalCollectLoc(argObjectId,1,3,1,1);end;
function wanez.dga.regProxy__00_Area_0001_04_01_01__Boss_00(argObjectId)setEntityLoc(argObjectId,'Boss',1,4,1,1);end;
function wanez.dga.regProxy__00_Area_0001_04_01_01__Default_00(argObjectId)setEntityLoc(argObjectId,'Default',1,4,1,1);end;
function wanez.dga.regProxy__00_Area_0001_04_01_01__Portals_00(argObjectId)setPortalCollectLoc(argObjectId,1,4,1,1);end;
function wanez.dga.regProxy__00_Area_0001_05_01_01__Boss_00(argObjectId)setEntityLoc(argObjectId,'Boss',1,5,1,1);end;
function wanez.dga.regProxy__00_Area_0001_05_01_01__Default_00(argObjectId)setEntityLoc(argObjectId,'Default',1,5,1,1);end;
function wanez.dga.regProxy__00_Area_0001_05_01_01__Portals_00(argObjectId)setPortalCollectLoc(argObjectId,1,5,1,1);end;
-- ID: 2
function wanez.dga.regProxy__00_Area_0002_01_01_01__Boss_00(argObjectId)setEntityLoc(argObjectId,'Boss',2,1,1,1);end;
function wanez.dga.regProxy__00_Area_0002_01_01_01__Default_00(argObjectId)setEntityLoc(argObjectId,'Default',2,1,1,1);end;
function wanez.dga.regProxy__00_Area_0002_01_01_01__Portals_00(argObjectId)setPortalCollectLoc(argObjectId,2,1,1,1);end;
function wanez.dga.regProxy__00_Area_0002_02_01_01__Boss_00(argObjectId)setEntityLoc(argObjectId,'Boss',2,2,1,1);end;
function wanez.dga.regProxy__00_Area_0002_02_01_01__Default_00(argObjectId)setEntityLoc(argObjectId,'Default',2,2,1,1);end;
function wanez.dga.regProxy__00_Area_0002_02_01_01__Portals_00(argObjectId)setPortalCollectLoc(argObjectId,2,2,1,1);end;
function wanez.dga.regProxy__00_Area_0002_03_01_01__Boss_00(argObjectId)setEntityLoc(argObjectId,'Boss',2,3,1,1);end;
function wanez.dga.regProxy__00_Area_0002_03_01_01__Default_00(argObjectId)setEntityLoc(argObjectId,'Default',2,3,1,1);end;
function wanez.dga.regProxy__00_Area_0002_03_01_01__Portals_00(argObjectId)setPortalCollectLoc(argObjectId,2,3,1,1);end;
function wanez.dga.regProxy__00_Area_0002_04_01_01__Boss_00(argObjectId)setEntityLoc(argObjectId,'Boss',2,4,1,1);end;
function wanez.dga.regProxy__00_Area_0002_04_01_01__Default_00(argObjectId)setEntityLoc(argObjectId,'Default',2,4,1,1);end;
function wanez.dga.regProxy__00_Area_0002_04_01_01__Portals_00(argObjectId)setPortalCollectLoc(argObjectId,2,4,1,1);end;
function wanez.dga.regProxy__00_Area_0002_05_01_01__Boss_00(argObjectId)setEntityLoc(argObjectId,'Boss',2,5,1,1);end;
function wanez.dga.regProxy__00_Area_0002_05_01_01__Default_00(argObjectId)setEntityLoc(argObjectId,'Default',2,5,1,1);end;
function wanez.dga.regProxy__00_Area_0002_05_01_01__Portals_00(argObjectId)setPortalCollectLoc(argObjectId,2,5,1,1);end;
-- ID: 3
function wanez.dga.regProxy__00_Area_0003_01_01_01__Boss_00(argObjectId)setEntityLoc(argObjectId,'Boss',3,1,1,1);end;
function wanez.dga.regProxy__00_Area_0003_01_01_01__Default_00(argObjectId)setEntityLoc(argObjectId,'Default',3,1,1,1);end;
function wanez.dga.regProxy__00_Area_0003_01_01_01__Portals_00(argObjectId)setPortalCollectLoc(argObjectId,3,1,1,1);end;
function wanez.dga.regProxy__00_Area_0003_02_01_01__Boss_00(argObjectId)setEntityLoc(argObjectId,'Boss',3,2,1,1);end;
function wanez.dga.regProxy__00_Area_0003_02_01_01__Default_00(argObjectId)setEntityLoc(argObjectId,'Default',3,2,1,1);end;
function wanez.dga.regProxy__00_Area_0003_02_01_01__Portals_00(argObjectId)setPortalCollectLoc(argObjectId,3,2,1,1);end;
function wanez.dga.regProxy__00_Area_0003_03_01_01__Boss_00(argObjectId)setEntityLoc(argObjectId,'Boss',3,3,1,1);end;
function wanez.dga.regProxy__00_Area_0003_03_01_01__Default_00(argObjectId)setEntityLoc(argObjectId,'Default',3,3,1,1);end;
function wanez.dga.regProxy__00_Area_0003_03_01_01__Portals_00(argObjectId)setPortalCollectLoc(argObjectId,3,3,1,1);end;
function wanez.dga.regProxy__00_Area_0003_04_01_01__Boss_00(argObjectId)setEntityLoc(argObjectId,'Boss',3,4,1,1);end;
function wanez.dga.regProxy__00_Area_0003_04_01_01__Default_00(argObjectId)setEntityLoc(argObjectId,'Default',3,4,1,1);end;
function wanez.dga.regProxy__00_Area_0003_04_01_01__Portals_00(argObjectId)setPortalCollectLoc(argObjectId,3,4,1,1);end;
function wanez.dga.regProxy__00_Area_0003_05_01_01__Boss_00(argObjectId)setEntityLoc(argObjectId,'Boss',3,5,1,1);end;
function wanez.dga.regProxy__00_Area_0003_05_01_01__Default_00(argObjectId)setEntityLoc(argObjectId,'Default',3,5,1,1);end;
function wanez.dga.regProxy__00_Area_0003_05_01_01__Portals_00(argObjectId)setPortalCollectLoc(argObjectId,3,5,1,1);end;
-- ID: 4
function wanez.dga.regProxy__00_Area_0004_01_01_01__Boss_00(argObjectId)setEntityLoc(argObjectId,'Boss',4,1,1,1);end;
function wanez.dga.regProxy__00_Area_0004_01_01_01__Default_00(argObjectId)setEntityLoc(argObjectId,'Default',4,1,1,1);end;
function wanez.dga.regProxy__00_Area_0004_01_01_01__Portals_00(argObjectId)setPortalCollectLoc(argObjectId,4,1,1,1);end;
function wanez.dga.regProxy__00_Area_0004_02_01_01__Boss_00(argObjectId)setEntityLoc(argObjectId,'Boss',4,2,1,1);end;
function wanez.dga.regProxy__00_Area_0004_02_01_01__Default_00(argObjectId)setEntityLoc(argObjectId,'Default',4,2,1,1);end;
function wanez.dga.regProxy__00_Area_0004_02_01_01__Portals_00(argObjectId)setPortalCollectLoc(argObjectId,4,2,1,1);end;
function wanez.dga.regProxy__00_Area_0004_03_01_01__Boss_00(argObjectId)setEntityLoc(argObjectId,'Boss',4,3,1,1);end;
function wanez.dga.regProxy__00_Area_0004_03_01_01__Default_00(argObjectId)setEntityLoc(argObjectId,'Default',4,3,1,1);end;
function wanez.dga.regProxy__00_Area_0004_03_01_01__Portals_00(argObjectId)setPortalCollectLoc(argObjectId,4,3,1,1);end;
function wanez.dga.regProxy__00_Area_0004_04_01_01__Boss_00(argObjectId)setEntityLoc(argObjectId,'Boss',4,4,1,1);end;
function wanez.dga.regProxy__00_Area_0004_04_01_01__Default_00(argObjectId)setEntityLoc(argObjectId,'Default',4,4,1,1);end;
function wanez.dga.regProxy__00_Area_0004_04_01_01__Portals_00(argObjectId)setPortalCollectLoc(argObjectId,4,4,1,1);end;
function wanez.dga.regProxy__00_Area_0004_05_01_01__Boss_00(argObjectId)setEntityLoc(argObjectId,'Boss',4,5,1,1);end;
function wanez.dga.regProxy__00_Area_0004_05_01_01__Default_00(argObjectId)setEntityLoc(argObjectId,'Default',4,5,1,1);end;
function wanez.dga.regProxy__00_Area_0004_05_01_01__Portals_00(argObjectId)setPortalCollectLoc(argObjectId,4,5,1,1);end;
-- ID: 5
function wanez.dga.regProxy__00_Area_0005_01_01_01__Boss_00(argObjectId)setEntityLoc(argObjectId,'Boss',5,1,1,1);end;
function wanez.dga.regProxy__00_Area_0005_01_01_01__Default_00(argObjectId)setEntityLoc(argObjectId,'Default',5,1,1,1);end;
function wanez.dga.regProxy__00_Area_0005_01_01_01__Portals_00(argObjectId)setPortalCollectLoc(argObjectId,5,1,1,1);end;
function wanez.dga.regProxy__00_Area_0005_02_01_01__Boss_00(argObjectId)setEntityLoc(argObjectId,'Boss',5,2,1,1);end;
function wanez.dga.regProxy__00_Area_0005_02_01_01__Default_00(argObjectId)setEntityLoc(argObjectId,'Default',5,2,1,1);end;
function wanez.dga.regProxy__00_Area_0005_02_01_01__Portals_00(argObjectId)setPortalCollectLoc(argObjectId,5,2,1,1);end;
function wanez.dga.regProxy__00_Area_0005_03_01_01__Boss_00(argObjectId)setEntityLoc(argObjectId,'Boss',5,3,1,1);end;
function wanez.dga.regProxy__00_Area_0005_03_01_01__Default_00(argObjectId)setEntityLoc(argObjectId,'Default',5,3,1,1);end;
function wanez.dga.regProxy__00_Area_0005_03_01_01__Portals_00(argObjectId)setPortalCollectLoc(argObjectId,5,3,1,1);end;
function wanez.dga.regProxy__00_Area_0005_04_01_01__Boss_00(argObjectId)setEntityLoc(argObjectId,'Boss',5,4,1,1);end;
function wanez.dga.regProxy__00_Area_0005_04_01_01__Default_00(argObjectId)setEntityLoc(argObjectId,'Default',5,4,1,1);end;
function wanez.dga.regProxy__00_Area_0005_04_01_01__Portals_00(argObjectId)setPortalCollectLoc(argObjectId,5,4,1,1);end;
function wanez.dga.regProxy__00_Area_0005_05_01_01__Boss_00(argObjectId)setEntityLoc(argObjectId,'Boss',5,5,1,1);end;
function wanez.dga.regProxy__00_Area_0005_05_01_01__Default_00(argObjectId)setEntityLoc(argObjectId,'Default',5,5,1,1);end;
function wanez.dga.regProxy__00_Area_0005_05_01_01__Portals_00(argObjectId)setPortalCollectLoc(argObjectId,5,5,1,1);end;
-- ID: 6
function wanez.dga.regProxy__00_Area_0006_01_01_01__Boss_00(argObjectId)setEntityLoc(argObjectId,'Boss',6,1,1,1);end;
function wanez.dga.regProxy__00_Area_0006_01_01_01__Default_00(argObjectId)setEntityLoc(argObjectId,'Default',6,1,1,1);end;
function wanez.dga.regProxy__00_Area_0006_01_01_01__Portals_00(argObjectId)setPortalCollectLoc(argObjectId,6,1,1,1);end;
function wanez.dga.regProxy__00_Area_0006_02_01_01__Boss_00(argObjectId)setEntityLoc(argObjectId,'Boss',6,2,1,1);end;
function wanez.dga.regProxy__00_Area_0006_02_01_01__Default_00(argObjectId)setEntityLoc(argObjectId,'Default',6,2,1,1);end;
function wanez.dga.regProxy__00_Area_0006_02_01_01__Portals_00(argObjectId)setPortalCollectLoc(argObjectId,6,2,1,1);end;
function wanez.dga.regProxy__00_Area_0006_03_01_01__Boss_00(argObjectId)setEntityLoc(argObjectId,'Boss',6,3,1,1);end;
function wanez.dga.regProxy__00_Area_0006_03_01_01__Default_00(argObjectId)setEntityLoc(argObjectId,'Default',6,3,1,1);end;
function wanez.dga.regProxy__00_Area_0006_03_01_01__Portals_00(argObjectId)setPortalCollectLoc(argObjectId,6,3,1,1);end;
function wanez.dga.regProxy__00_Area_0006_04_01_01__Boss_00(argObjectId)setEntityLoc(argObjectId,'Boss',6,4,1,1);end;
function wanez.dga.regProxy__00_Area_0006_04_01_01__Default_00(argObjectId)setEntityLoc(argObjectId,'Default',6,4,1,1);end;
function wanez.dga.regProxy__00_Area_0006_04_01_01__Portals_00(argObjectId)setPortalCollectLoc(argObjectId,6,4,1,1);end;
function wanez.dga.regProxy__00_Area_0006_05_01_01__Boss_00(argObjectId)setEntityLoc(argObjectId,'Boss',6,5,1,1);end;
function wanez.dga.regProxy__00_Area_0006_05_01_01__Default_00(argObjectId)setEntityLoc(argObjectId,'Default',6,5,1,1);end;
function wanez.dga.regProxy__00_Area_0006_05_01_01__Portals_00(argObjectId)setPortalCollectLoc(argObjectId,6,5,1,1);end;
-- ID: 7
function wanez.dga.regProxy__00_Area_0007_01_01_01__Boss_00(argObjectId)setEntityLoc(argObjectId,'Boss',7,1,1,1);end;
function wanez.dga.regProxy__00_Area_0007_01_01_01__Default_00(argObjectId)setEntityLoc(argObjectId,'Default',7,1,1,1);end;
function wanez.dga.regProxy__00_Area_0007_01_01_01__Portals_00(argObjectId)setPortalCollectLoc(argObjectId,7,1,1,1);end;
function wanez.dga.regProxy__00_Area_0007_02_01_01__Boss_00(argObjectId)setEntityLoc(argObjectId,'Boss',7,2,1,1);end;
function wanez.dga.regProxy__00_Area_0007_02_01_01__Default_00(argObjectId)setEntityLoc(argObjectId,'Default',7,2,1,1);end;
function wanez.dga.regProxy__00_Area_0007_02_01_01__Portals_00(argObjectId)setPortalCollectLoc(argObjectId,7,2,1,1);end;
function wanez.dga.regProxy__00_Area_0007_03_01_01__Boss_00(argObjectId)setEntityLoc(argObjectId,'Boss',7,3,1,1);end;
function wanez.dga.regProxy__00_Area_0007_03_01_01__Default_00(argObjectId)setEntityLoc(argObjectId,'Default',7,3,1,1);end;
function wanez.dga.regProxy__00_Area_0007_03_01_01__Portals_00(argObjectId)setPortalCollectLoc(argObjectId,7,3,1,1);end;
function wanez.dga.regProxy__00_Area_0007_04_01_01__Boss_00(argObjectId)setEntityLoc(argObjectId,'Boss',7,4,1,1);end;
function wanez.dga.regProxy__00_Area_0007_04_01_01__Default_00(argObjectId)setEntityLoc(argObjectId,'Default',7,4,1,1);end;
function wanez.dga.regProxy__00_Area_0007_04_01_01__Portals_00(argObjectId)setPortalCollectLoc(argObjectId,7,4,1,1);end;
function wanez.dga.regProxy__00_Area_0007_05_01_01__Boss_00(argObjectId)setEntityLoc(argObjectId,'Boss',7,5,1,1);end;
function wanez.dga.regProxy__00_Area_0007_05_01_01__Default_00(argObjectId)setEntityLoc(argObjectId,'Default',7,5,1,1);end;
function wanez.dga.regProxy__00_Area_0007_05_01_01__Portals_00(argObjectId)setPortalCollectLoc(argObjectId,7,5,1,1);end;
-- ID: 8
function wanez.dga.regProxy__00_Area_0008_01_01_01__Boss_00(argObjectId)setEntityLoc(argObjectId,'Boss',8,1,1,1);end;
function wanez.dga.regProxy__00_Area_0008_01_01_01__Default_00(argObjectId)setEntityLoc(argObjectId,'Default',8,1,1,1);end;
function wanez.dga.regProxy__00_Area_0008_01_01_01__Portals_00(argObjectId)setPortalCollectLoc(argObjectId,8,1,1,1);end;
function wanez.dga.regProxy__00_Area_0008_02_01_01__Boss_00(argObjectId)setEntityLoc(argObjectId,'Boss',8,2,1,1);end;
function wanez.dga.regProxy__00_Area_0008_02_01_01__Default_00(argObjectId)setEntityLoc(argObjectId,'Default',8,2,1,1);end;
function wanez.dga.regProxy__00_Area_0008_02_01_01__Portals_00(argObjectId)setPortalCollectLoc(argObjectId,8,2,1,1);end;
function wanez.dga.regProxy__00_Area_0008_03_01_01__Boss_00(argObjectId)setEntityLoc(argObjectId,'Boss',8,3,1,1);end;
function wanez.dga.regProxy__00_Area_0008_03_01_01__Default_00(argObjectId)setEntityLoc(argObjectId,'Default',8,3,1,1);end;
function wanez.dga.regProxy__00_Area_0008_03_01_01__Portals_00(argObjectId)setPortalCollectLoc(argObjectId,8,3,1,1);end;
function wanez.dga.regProxy__00_Area_0008_04_01_01__Boss_00(argObjectId)setEntityLoc(argObjectId,'Boss',8,4,1,1);end;
function wanez.dga.regProxy__00_Area_0008_04_01_01__Default_00(argObjectId)setEntityLoc(argObjectId,'Default',8,4,1,1);end;
function wanez.dga.regProxy__00_Area_0008_04_01_01__Portals_00(argObjectId)setPortalCollectLoc(argObjectId,8,4,1,1);end;
function wanez.dga.regProxy__00_Area_0008_05_01_01__Boss_00(argObjectId)setEntityLoc(argObjectId,'Boss',8,5,1,1);end;
function wanez.dga.regProxy__00_Area_0008_05_01_01__Default_00(argObjectId)setEntityLoc(argObjectId,'Default',8,5,1,1);end;
function wanez.dga.regProxy__00_Area_0008_05_01_01__Portals_00(argObjectId)setPortalCollectLoc(argObjectId,8,5,1,1);end;
-- ID: 9
function wanez.dga.regProxy__00_Area_0009_01_01_01__Boss_00(argObjectId)setEntityLoc(argObjectId,'Boss',9,1,1,1);end;
function wanez.dga.regProxy__00_Area_0009_01_01_01__Default_00(argObjectId)setEntityLoc(argObjectId,'Default',9,1,1,1);end;
function wanez.dga.regProxy__00_Area_0009_01_01_01__Portals_00(argObjectId)setPortalCollectLoc(argObjectId,9,1,1,1);end;
function wanez.dga.regProxy__00_Area_0009_02_01_01__Boss_00(argObjectId)setEntityLoc(argObjectId,'Boss',9,2,1,1);end;
function wanez.dga.regProxy__00_Area_0009_02_01_01__Default_00(argObjectId)setEntityLoc(argObjectId,'Default',9,2,1,1);end;
function wanez.dga.regProxy__00_Area_0009_02_01_01__Portals_00(argObjectId)setPortalCollectLoc(argObjectId,9,2,1,1);end;
function wanez.dga.regProxy__00_Area_0009_03_01_01__Boss_00(argObjectId)setEntityLoc(argObjectId,'Boss',9,3,1,1);end;
function wanez.dga.regProxy__00_Area_0009_03_01_01__Default_00(argObjectId)setEntityLoc(argObjectId,'Default',9,3,1,1);end;
function wanez.dga.regProxy__00_Area_0009_03_01_01__Portals_00(argObjectId)setPortalCollectLoc(argObjectId,9,3,1,1);end;
function wanez.dga.regProxy__00_Area_0009_04_01_01__Boss_00(argObjectId)setEntityLoc(argObjectId,'Boss',9,4,1,1);end;
function wanez.dga.regProxy__00_Area_0009_04_01_01__Default_00(argObjectId)setEntityLoc(argObjectId,'Default',9,4,1,1);end;
function wanez.dga.regProxy__00_Area_0009_04_01_01__Portals_00(argObjectId)setPortalCollectLoc(argObjectId,9,4,1,1);end;
function wanez.dga.regProxy__00_Area_0009_05_01_01__Boss_00(argObjectId)setEntityLoc(argObjectId,'Boss',9,5,1,1);end;
function wanez.dga.regProxy__00_Area_0009_05_01_01__Default_00(argObjectId)setEntityLoc(argObjectId,'Default',9,5,1,1);end;
function wanez.dga.regProxy__00_Area_0009_05_01_01__Portals_00(argObjectId)setPortalCollectLoc(argObjectId,9,5,1,1);end;
-- ID: 10
function wanez.dga.regProxy__00_Area_0010_01_01_01__Boss_00(argObjectId)setEntityLoc(argObjectId,'Boss',10,1,1,1);end;
function wanez.dga.regProxy__00_Area_0010_01_01_01__Default_00(argObjectId)setEntityLoc(argObjectId,'Default',10,1,1,1);end;
function wanez.dga.regProxy__00_Area_0010_01_01_01__Portals_00(argObjectId)setPortalCollectLoc(argObjectId,10,1,1,1);end;
function wanez.dga.regProxy__00_Area_0010_02_01_01__Boss_00(argObjectId)setEntityLoc(argObjectId,'Boss',10,2,1,1);end;
function wanez.dga.regProxy__00_Area_0010_02_01_01__Default_00(argObjectId)setEntityLoc(argObjectId,'Default',10,2,1,1);end;
function wanez.dga.regProxy__00_Area_0010_02_01_01__Portals_00(argObjectId)setPortalCollectLoc(argObjectId,10,2,1,1);end;
function wanez.dga.regProxy__00_Area_0010_03_01_01__Boss_00(argObjectId)setEntityLoc(argObjectId,'Boss',10,3,1,1);end;
function wanez.dga.regProxy__00_Area_0010_03_01_01__Default_00(argObjectId)setEntityLoc(argObjectId,'Default',10,3,1,1);end;
function wanez.dga.regProxy__00_Area_0010_03_01_01__Portals_00(argObjectId)setPortalCollectLoc(argObjectId,10,3,1,1);end;
function wanez.dga.regProxy__00_Area_0010_04_01_01__Boss_00(argObjectId)setEntityLoc(argObjectId,'Boss',10,4,1,1);end;
function wanez.dga.regProxy__00_Area_0010_04_01_01__Default_00(argObjectId)setEntityLoc(argObjectId,'Default',10,4,1,1);end;
function wanez.dga.regProxy__00_Area_0010_04_01_01__Portals_00(argObjectId)setPortalCollectLoc(argObjectId,10,4,1,1);end;
function wanez.dga.regProxy__00_Area_0010_05_01_01__Boss_00(argObjectId)setEntityLoc(argObjectId,'Boss',10,5,1,1);end;
function wanez.dga.regProxy__00_Area_0010_05_01_01__Default_00(argObjectId)setEntityLoc(argObjectId,'Default',10,5,1,1);end;
function wanez.dga.regProxy__00_Area_0010_05_01_01__Portals_00(argObjectId)setPortalCollectLoc(argObjectId,10,5,1,1);end;
-- ID: 11
function wanez.dga.regProxy__00_Area_0011_01_01_01__Boss_00(argObjectId)setEntityLoc(argObjectId,'Boss',11,1,1,1);end;
function wanez.dga.regProxy__00_Area_0011_01_01_01__Default_00(argObjectId)setEntityLoc(argObjectId,'Default',11,1,1,1);end;
function wanez.dga.regProxy__00_Area_0011_01_01_01__Portals_00(argObjectId)setPortalCollectLoc(argObjectId,11,1,1,1);end;
function wanez.dga.regProxy__00_Area_0011_01_02_01__Boss_00(argObjectId)setEntityLoc(argObjectId,'Boss',11,1,2,1);end;
function wanez.dga.regProxy__00_Area_0011_01_02_01__Default_00(argObjectId)setEntityLoc(argObjectId,'Default',11,1,2,1);end;
function wanez.dga.regProxy__00_Area_0011_01_02_01__Portals_00(argObjectId)setPortalCollectLoc(argObjectId,11,1,2,1);end;
function wanez.dga.regProxy__00_Area_0011_01_03_01__Boss_00(argObjectId)setEntityLoc(argObjectId,'Boss',11,1,3,1);end;
function wanez.dga.regProxy__00_Area_0011_01_03_01__Default_00(argObjectId)setEntityLoc(argObjectId,'Default',11,1,3,1);end;
function wanez.dga.regProxy__00_Area_0011_01_03_01__Portals_00(argObjectId)setPortalCollectLoc(argObjectId,11,1,3,1);end;
--[[
ENDLESS
]]--
-- ID: 901
function wanez.dga.regProxy__00_Area_0901_01_01_01__Boss_00(argObjectId)setEntityLoc(argObjectId,'Boss',901,1,1,1);end;
function wanez.dga.regProxy__00_Area_0901_01_01_01__Default_00(argObjectId)setEntityLoc(argObjectId,'Default',901,1,1,1);end;
function wanez.dga.regProxy__00_Area_0901_01_01_01__Portals_00(argObjectId)setPortalCollectLoc(argObjectId,901,1,1,1);end;
-- ID: 902
function wanez.dga.regProxy__00_Area_0902_01_01_01__Boss_00(argObjectId)setEntityLoc(argObjectId,'Boss',902,1,1,1);end;
function wanez.dga.regProxy__00_Area_0902_01_01_01__Default_00(argObjectId)setEntityLoc(argObjectId,'Default',902,1,1,1);end;
function wanez.dga.regProxy__00_Area_0902_01_01_01__Portals_00(argObjectId)setPortalCollectLoc(argObjectId,902,1,1,1);end;
function wanez.dga.regProxy__00_Area_0902_02_01_01__Boss_00(argObjectId)setEntityLoc(argObjectId,'Boss',902,2,1,1);end;
function wanez.dga.regProxy__00_Area_0902_02_01_01__Default_00(argObjectId)setEntityLoc(argObjectId,'Default',902,2,1,1);end;
function wanez.dga.regProxy__00_Area_0902_02_01_01__Portals_00(argObjectId)setPortalCollectLoc(argObjectId,902,2,1,1);end;
function wanez.dga.regProxy__00_Area_0902_03_01_01__Boss_00(argObjectId)setEntityLoc(argObjectId,'Boss',902,3,1,1);end;
function wanez.dga.regProxy__00_Area_0902_03_01_01__Default_00(argObjectId)setEntityLoc(argObjectId,'Default',902,3,1,1);end;
function wanez.dga.regProxy__00_Area_0902_03_01_01__Portals_00(argObjectId)setPortalCollectLoc(argObjectId,902,3,1,1);end;
function wanez.dga.regProxy__00_Area_0902_04_01_01__Boss_00(argObjectId)setEntityLoc(argObjectId,'Boss',902,4,1,1);end;
function wanez.dga.regProxy__00_Area_0902_04_01_01__Default_00(argObjectId)setEntityLoc(argObjectId,'Default',902,4,1,1);end;
function wanez.dga.regProxy__00_Area_0902_04_01_01__Portals_00(argObjectId)setPortalCollectLoc(argObjectId,902,4,1,1);end;
