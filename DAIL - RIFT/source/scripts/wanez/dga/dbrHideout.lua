 --[[
 Events triggered upon entering the hideout
 ]]--
local currentPortalToArea = false
local portalCharges = 0
local resetGlobalCharges = 0

local function iniEntity()
    local totalClassIDs = table.getn(wanez.data.Enemies.Classification)
    for i=1,totalClassIDs do
        wanez.dga.Data.Entities[i] = wanez.dga.cEntity(i)
    end
end
local function removeDGAKey()
    --
    local Tier = wanez.dga.Settings:getTier()
    local ModeID = wanez.dga.Settings:getModeID()
    local SpecialID = wanez.dga.Settings:getSpecialID()
    local FreeTier = wanez.dga._Settings.Areas.Requirements.FreeTiers[ModeID][wanez.DifficultyID]
	-- TODO: security, check if player has the required items
	-- check if tier is free
	if(Tier > 0)then
		if(Tier > FreeTier)then
			local keyDBR = wanez.dga._Data.Items.Global.DGA.TierKeys[1][wanez.DifficultyID][Tier]
			local player = Game.GetLocalPlayer()
			if(wanez.dga._Settings.Areas.Requirements.DGAKey[ModeID] == 1 && SpecialID == 0)then
				player:DestroyItem(keyDBR)
			else
				local loopCount = (SpecialID == 0) && wanez.dga._Settings.Areas.Requirements.DGAKey[ModeID] || wanez.dga._Settings.Areas.Requirements.DGAKeySpecial[SpecialID]
				for i=1,loopCount do
					player:DestroyItem(keyDBR)
				end
			end
		end
	end
	return true
end
local function waGrantQuest(argType,argQuestId)
    local questPool = wanez.dga._Data.Quests[argType]
	local player = Game.GetLocalPlayer()
    
    if(questPool)then
        local questId = questPool[argQuestId][1]
        local taskId = questPool[argQuestId][2]

        local questState = player:GetQuestState(questId)
        if(questState != QuestState.InProgress)then
            if(wanez.dga.Settings:getSpecialID())then wanez.dga.Data.Rewards:setCredit(1);end;
            player:GrantQuest(questId,taskId)
            --player:CompleteQuest(questId)
        end
    end
end
--
local function resetGlobal()
    if(resetGlobalCharges == 0)then
        wanez.dga.Areas[dgaAreaType]:removeEntities();
        wanez.dga.Data.Rewards:resetData()
    end
end
--
local function applyGameSettings()
    local aSettings = {"DGA_NO_NEMESIS"}
    local totalSettings = table.getn(aSettings)
    
    for i=1,totalSettings do
        wanez.dga.Token[aSettings[i]] = wanez.dga.getGameSettings(aSettings[i]);
    end
    wanez.dga.var.GiveItem = wanez.dga.getGameSettings("DGA_GIVE_ITEM")
end
--
function wanez.dga.regPortalCoordsToDGA(argObjectId)
	math.randomseed(Time.Now())
    if(wanez.dga.Settings == nil)then
        wanez.dga.Settings = wanez.dga.cSettings(argObjectId)
        wanez.dga.Areas = {}
        wanez.dga.Data.Rewards = wanez.dga.cReward();
        -- 
        iniEntity()
        applyGameSettings()
        UI.Notify("tagWaWelcomeDGA");
    else
        if(resetGlobalCharges > 0)then
            resetGlobalCharges = resetGlobalCharges - 1
            resetGlobal()
        end
    end
    --UI.Notify(wanez.dga.Settings:getData().AreaID);
    --wanez.dga.Settings:onOpenPortal(3);
    --UI.Notify(wanez.dga.Settings.Data.AreaID);
    --UI.Notify(tostring(wanez.dga.Settings:getLocPortalToArea()));
    
end
function wanez.dga.setSettings(argTier,argModeId)
    if(currentPortalToArea != false)then currentPortalToArea:movePortal(true);end;
    argTier = argTier || 0
    argModeId = argModeId || 1
    wanez.dga.Settings:prepPortal(argTier,argModeId)
	math.randomseed(Time.Now())
    --UI.Notify(wanez.dga.Settings:getTier())
	--dgaSettings.CategoryOffset = "Default"
	--dgaSettings.BlockRespawn = false
	--dgaSettings.BlockBossSpawn = false
	--dgaSettings.SpecialReset = true
	--setTier(argTier)
	--hidePortal()
	--removeEntities()
end
function wanez.dga.openPortal(argAreaId,argSpecialId,argIsUber)
    argAreaId = argAreaId || 0
    argSpecialId = argSpecialId || 0
    argIsUber = argIsUber || false
    
    portalCharges = Game.GetNumPlayers()
    resetGlobalCharges = Game.GetNumPlayers()
    
    if(removeDGAKey())then
        local data = wanez.dga.Settings:onOpenPortal(argAreaId,argSpecialId,argIsUber)
        --UI.Notify(data[1].." | "..data[2])
        currentPortalToArea = wanez.dga.Data.Portals[data[1]][data[2]]
        currentPortalToArea:movePortal()
        
        if(argSpecialId > 0)then
            waGrantQuest("SpecialDGA",argSpecialId)
        end
        
    end
    --UI.Notify() -- tostring(portal:getObjectID())..tostring(portal.Loc)
	-- remove DGA-Key from invetory and (TODO) check if player has required items before opening the portal
	--if(removeDGAKey() == true)then
	--	showPortal()
	--	dgaSettings["BlockSpawn"] = false
	--	dgaSettings.BlockBridge = false
	--	if(dgaSettings.SpecialID == 1)then
	--		dgaSettings.SpecialCredit = 1
	--		--wanezGrantQuest(2)
	--	end
	--	if(dgaSettings.prevPortal[argAreaId] != nil)then dgaSettings.prevPortal[argAreaId] = {} end
	--end
end
function wanez.dga.openSpecialPortal(argAreaId,argSpecialId)
	--wanez.dga.Settings:setSpecialID(argSpecialId)
	--dgaSettings.CategoryOffset = "Special"
    wanez.dga.openPortal(argAreaId,argSpecialId)
    --if()then
    --  if(dgaSettings.SpecialID == 1)then
	--		dgaSettings.SpecialCredit = 1
	--		--wanezGrantQuest(2)
	--	end
    --end
end
--
local rewardChestLoc = false
local rewardContainer = nil
--
function wanez.dga.regRewardChest01Loc(argObjectId)
	if(rewardChestLoc == false)then rewardChestLoc = Entity.Get(argObjectId):GetCoords();end;
end
function wanez.dga.showRewardChest(argChestId)
    argChestId = argChestId || 1
	local player = Game.GetLocalPlayer()
    local rewardData = wanez.dga._Data.Rewards
	if(rewardContainer != nil)then
		rewardContainer:Destroy()
		rewardContainer = nil
	end
	rewardContainer = Entity.Create(rewardData.Containers[argChestId])
	rewardContainer:SetCoords(rewardChestLoc)
    
	player:DestroyItem(rewardData.Keys[argChestId])
end
--
function wanez.dga.setGameSettings(argName,argValue)
    argValue = argValue || false
    local player = Game.GetLocalPlayer()
    if(argValue)then
        player:GiveToken(argName)
    else
        player:RemoveToken(argName)
    end
    if(argName == "DGA_GIVE_ITEM")then
        wanez.dga.var.GiveItem = argValue
    else
        wanez.dga.Token[argName] = argValue
    end
    
end
--
function wanez.dga.getGameSettings(argName)
    local player = Game.GetLocalPlayer()
    return player:HasToken(argName)
end
--
function wanez.dga.openUberPortal(argAreaId,argSpecialId)
	--dgaSettings.SpecialID = argSpecialId
	--dgaSettings.CategoryOffset = "Uber"
	--wanez.dga.openPortal(argAreaId)
end
function wanez.dga.tempPortalOnInteract(argObjectId)
    portalCharges = portalCharges - 1
    if(currentPortalToArea != false && portalCharges == 0)then currentPortalToArea:movePortal(true);end;
end
local function setPortalDataToArea(argObjectId,argAreaId,argLayoutId) -- LayoutID == PortalID (!= Portal's ObjectID)
    if(wanez.dga.Data.Portals[argAreaId] == nil)then wanez.dga.Data.Portals[argAreaId] = {};end;
    if(wanez.dga.Data.Portals[argAreaId][argLayoutId] == nil)then wanez.dga.Data.Portals[argAreaId][argLayoutId] = wanez.dga.cPortal(argObjectId);end; -- prevent override
end
function wanez.dga.regPortalBasicDGA_001_A_00(argObjectId) setPortalDataToArea(argObjectId,1,1);end;
--function wanez.dga.regPortalBasicDGA_001_B_00(argObjectId) setPortalData(argObjectId,1,2);end;
function wanez.dga.regPortalBasicDGA_001_C_00(argObjectId) setPortalDataToArea(argObjectId,1,3);end;
function wanez.dga.regPortalBasicDGA_001_D_00(argObjectId) setPortalDataToArea(argObjectId,1,4);end;
function wanez.dga.regPortalBasicDGA_001_E_00(argObjectId) setPortalDataToArea(argObjectId,1,5);end;
-- ID: 2
function wanez.dga.regPortalBasicDGA_002_A_00(argObjectId) setPortalDataToArea(argObjectId,2,1);end;
--function wanez.dga.regPortalBasicDGA_002_B_00(argObjectId) setPortalData(argObjectId,2,2);end;
function wanez.dga.regPortalBasicDGA_002_C_00(argObjectId) setPortalDataToArea(argObjectId,2,3);end;
function wanez.dga.regPortalBasicDGA_002_D_00(argObjectId) setPortalDataToArea(argObjectId,2,4);end;
function wanez.dga.regPortalBasicDGA_002_E_00(argObjectId) setPortalDataToArea(argObjectId,2,5);end;
-- ID: 3
function wanez.dga.regPortalBasicDGA_003_A_00(argObjectId) setPortalDataToArea(argObjectId,3,1);end;
--function wanez.dga.regPortalBasicDGA_003_B_00(argObjectId) setPortalData(argObjectId,3,2);end;
function wanez.dga.regPortalBasicDGA_003_C_00(argObjectId) setPortalDataToArea(argObjectId,3,3);end;
function wanez.dga.regPortalBasicDGA_003_D_00(argObjectId) setPortalDataToArea(argObjectId,3,4);end;
function wanez.dga.regPortalBasicDGA_003_E_00(argObjectId) setPortalDataToArea(argObjectId,3,5);end;
-- ID: 4
function wanez.dga.regPortalBasicDGA_004_A_00(argObjectId) setPortalDataToArea(argObjectId,4,1);end;
function wanez.dga.regPortalBasicDGA_004_B_00(argObjectId) setPortalDataToArea(argObjectId,4,2);end;
function wanez.dga.regPortalBasicDGA_004_C_00(argObjectId) setPortalDataToArea(argObjectId,4,3);end;
function wanez.dga.regPortalBasicDGA_004_D_00(argObjectId) setPortalDataToArea(argObjectId,4,4);end;
function wanez.dga.regPortalBasicDGA_004_E_00(argObjectId) setPortalDataToArea(argObjectId,4,5);end;
-- ID: 5
--function wanez.dga.regPortalBasicDGA_005_A_00(argObjectId) setPortalData(argObjectId,5,1);end;
function wanez.dga.regPortalBasicDGA_005_B_00(argObjectId) setPortalDataToArea(argObjectId,5,1);end;
function wanez.dga.regPortalBasicDGA_005_C_00(argObjectId) setPortalDataToArea(argObjectId,5,2);end;
function wanez.dga.regPortalBasicDGA_005_D_00(argObjectId) setPortalDataToArea(argObjectId,5,4);end;
function wanez.dga.regPortalBasicDGA_005_E_00(argObjectId) setPortalDataToArea(argObjectId,5,5);end;
-- ID: 6
function wanez.dga.regPortalBasicDGA_006_A_00(argObjectId) setPortalDataToArea(argObjectId,6,1);end;
-- ID: 7
function wanez.dga.regPortalBasicDGA_007_A_00(argObjectId) setPortalDataToArea(argObjectId,7,1);end;
function wanez.dga.regPortalBasicDGA_007_B_00(argObjectId) setPortalDataToArea(argObjectId,7,2);end;
-- ID: 101
function wanez.dga.regPortalEndlessDGA_001_A_00(argObjectId) setPortalDataToArea(argObjectId,101,1);end;
-- ID: 102
function wanez.dga.regPortalEndlessDGA_002_A_00(argObjectId) setPortalDataToArea(argObjectId,102,1);end;
