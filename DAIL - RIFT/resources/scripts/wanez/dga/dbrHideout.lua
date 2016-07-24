--[[
 Events triggered upon entering the hideout
]]--
local currentPortalToArea = false
portalCharges = 0
dgaBlockPortalCollector = false
dgaBlockScrollPortalSpawnDGA = false
local resetGlobalCharges = 0

--
local function devOnlyFn()
    if(wanez.isDev)then
        local player = Game.GetLocalPlayer()
        local playerCoords = player:GetCoords()
        local mainPath = 'mod_wanez/items/artifacts/dev/'
        local godModeItems = {
            '0000_accessoryset_necklace',
            '0000_accessoryset_ring01',
            '0000_accessoryset_ring02',
            '0000_accessoryset_waist',
            '0000_armourset_feet',
            '0000_armourset_hands',
            '0000_armourset_head',
            '0000_armourset_legs',
            '0000_armourset_shoulders',
            '0000_armourset_torso',
            '0000_armourset_waist',
            '0000_weapon_scepter001',
            '0000_weapon_focus001'
        }
        for i=1,table.getn(godModeItems) do
            local newItem = Entity.Create(mainPath..godModeItems[i]..'.dbr')
            newItem:SetCoords(playerCoords)
        end
    end
end
local function iniFirstEnter()
    local player = Game.GetLocalPlayer()
    if not(player:HasToken("DGA_FIRST_ENTER_01"))then
        player:GiveToken("DISMANTLING_UNLOCKED") -- Dismantle
        if not(player:HasItem("mod_wanez/items/dga/scroll_portal_hideout.dbr",1,true))then
            player:GiveItem("mod_wanez/items/dga/scroll_portal_hideout.dbr",1,true) -- Portal Scroll (Hideout)
        end
        -- give DGA Token at the end in case of a crash
        --player:GiveToken("DGA_FIRST_ENTER_01")
    end
end
local function iniHideout()
    local totalClassIDs = table.getn(wanez.data.Enemies.Classification)
    for i=1,totalClassIDs do
        wanez.dga.Data.Entities[i] = wanez.dga.cEntity(i)
    end

    iniFirstEnter()
    --devOnlyFn()
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
			if(wanez.dga._Settings.Areas.Requirements.DGAKey[ModeID] == 1 and SpecialID == 0)then
				player:DestroyItem(keyDBR)
			else
				local loopCount = (SpecialID == 0) and wanez.dga._Settings.Areas.Requirements.DGAKey[ModeID] or wanez.dga._Settings.Areas.Requirements.DGAKeySpecial[SpecialID]
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
        if(questState ~= QuestState.InProgress)then
            if(wanez.dga.Settings:getSpecialID())then wanez.dga.Data.Rewards:setCredit(1);end;
            player:GrantQuest(questId,taskId)
            --player:CompleteQuest(questId)
        end
    end
end
--
local function moveRiftsBackToHO()
    for i=1,table.getn(wanez.dga.DynRifts) do
        wanez.dga.DynRifts[i]:actionPortal('hide')
    end
    wanez.dga.RiftHO:actionPortal('hide')
end
--
local function resetGlobal()
    if(resetGlobalCharges == 0)then
        wanez.dga.Areas[dgaAreaType]:removeEntities();
        wanez.dga.Data.Rewards:resetData()

        moveRiftsBackToHO('hide')
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
        --if(wanez.isDev)then
            --Game.GetLocalPlayer():GiveItem("mod_wanez/items/artifacts/beginner/tdev/token.dbr",1,true)
        --end

        -- DEV: test if new faction fn is working - remove with v0.5
        --if(wanez.getFactionRank('USER14') >= 4)then UI.Notify("PM is maxed");end;
        --if(wanez.getFactionRank('USER14') >= 3)then UI.Notify("PM is 3+");end;
        --if(wanez.getFactionRank('USER15') >= 3)then UI.Notify("INV is maxed");end;

        iniHideout()
        applyGameSettings()
        UI.Notify("tagWaWelcomeDGA");
    else
        if(resetGlobalCharges > 0)then
            resetGlobalCharges = resetGlobalCharges - 1
            resetGlobal()
        end
        local scrollDBR = 'mod_wanez/items/dga/scroll_portal_dga01.dbr'
        local _player = Game.GetLocalPlayer()
        if not(_player:HasItem(scrollDBR,1,true))then
            dgaBlockScrollPortalSpawnDGA = true
            _player:TakeItem(scrollDBR,1,true)
            dgaBlockScrollPortalSpawnDGA = false
        end
    end
    
end
function wanez.dga.setSettings(argTier,argModeId)
    if(currentPortalToArea ~= false)then currentPortalToArea:movePortal(true);end;
    argTier = argTier or 0
    argModeId = argModeId or 1
    wanez.dga.Settings:prepPortal(argTier,argModeId)
	math.randomseed(Time.Now())
end
function wanez.dga.openPortal(argAreaId,argSpecialId,argIsUber)
    --wanez.dga.movePortalReturnToHideout()
    moveRiftsBackToHO()
    argAreaId = argAreaId or 0
    argSpecialId = argSpecialId or 0
    argIsUber = argIsUber or false
    
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
end
function wanez.dga.openSpecialPortal(argAreaId,argSpecialId,argIsUber)
    argIsUber = argIsUber or false
	--wanez.dga.Settings:setSpecialID(argSpecialId)
	--dgaSettings.CategoryOffset = "Special"
    wanez.dga.openPortal(argAreaId,argSpecialId,argIsUber)
end
--
function wanez.dga.openRaidPortal(argAreaId,argSpecialId)
	--dgaSettings.SpecialID = argSpecialId
	--dgaSettings.CategoryOffset = "Uber"
	--wanez.dga.openPortal(argAreaId)
end
--
local rewardChestLoc = false
local rewardContainer = false
--
function wanez.dga.regRewardChest01Loc(argObjectId)
	if(rewardChestLoc == false)then rewardChestLoc = Entity.Get(argObjectId):GetCoords();end;
end
function wanez.dga.showRewardChest(argChestId)
    argChestId = argChestId or 1
	local player = Game.GetLocalPlayer()
    local rewardData = wanez.dga._Data.Rewards
	if(rewardContainer ~= false)then
		rewardContainer:Destroy()
		rewardContainer = false
	end
	rewardContainer = Entity.Create(rewardData.Containers[argChestId])
	rewardContainer:SetCoords(rewardChestLoc)
    
	player:DestroyItem(rewardData.Keys[argChestId])
end
--
function wanez.dga.setGameSettings(argName,argValue)
    if(Server)then
        argValue = argValue and false
        local player = Game.GetLocalPlayer()
        if(argValue)then
            player:GiveToken(argName)
        else
            player:RemoveToken(argName)
        end
        if(argName == "DGA_AUTOLOOT")then
            wanez.dga.var.GiveItem = argValue
        else
            wanez.dga.Token[argName] = argValue
        end
    end
end
--
function wanez.dga.getGameSettings(argName)
    if(Server)then
        local player = Game.GetLocalPlayer()
        return player:HasToken(argName)
    end
end
function wanez.dga.tempPortalOnInteract(argObjectId)
    portalCharges = portalCharges - 1
    if(wanez.dga.Settings:getSpawnTrigger() == true)then
        if(currentPortalToArea ~= false and portalCharges == 0)then currentPortalToArea:movePortal(true);end;
    else
        wanez.dga.Settings:setSpawnTrigger(true)
    end
    dgaBlockPortalCollector = false
end
-- Portal for "Portal Scroll (Hideout)"
function wanez.dga.regPortalReturnToHideout(argObjectId)
    if(wanez.dga.RiftHO == false)then
        wanez.dga.RiftHO = wanez.dga.cPortal(argObjectId)
    end
end
--
local function setPortalDataToArea(argObjectId,argAreaId,argLayoutId)
    if(Server)then
        local randomData = wanez.dga._Settings.Areas.Random.Default
        --local isInRandomData = false
        -- wanez.dga.DynRifts
        if(wanez.dga.Data.Portals[argAreaId] == nil)then
            wanez.dga.Data.Portals[argAreaId] = {};
            if(wanez.dga.Data.Portals[argAreaId][argLayoutId] == nil)then
                wanez.dga.Data.Portals[argAreaId][argLayoutId] = wanez.dga.cPortal(argObjectId);
                for i=1,table.getn(randomData) do
                    if(randomData[i] == argAreaId)then
                        --local newCount = table.getn(wanez.dga.DynRifts) + 1
                        --wanez.dga.DynRifts[newCount] = wanez.dga.Data.Portals[argAreaId][argLayoutId]
                        table.insert(wanez.dga.DynRifts,wanez.dga.Data.Portals[argAreaId][argLayoutId])
                    end
                end
            end
        end
    end
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
-- ID: 9
function wanez.dga.regPortalBasicDGA_009_A_00(argObjectId) setPortalDataToArea(argObjectId,9,1);end;
-- ID: 10
function wanez.dga.regPortalBasicDGA_010_A_00(argObjectId) setPortalDataToArea(argObjectId,10,1);end;
-- ID: 101
function wanez.dga.regPortalEndlessDGA_001_A_00(argObjectId) setPortalDataToArea(argObjectId,101,1);end;
-- ID: 102
function wanez.dga.regPortalEndlessDGA_002_A_00(argObjectId) setPortalDataToArea(argObjectId,102,1);end;

-- ID 500
function wanez.dga.regPortalSpecialOmegaDGA_001_A_00(argObjectId) setPortalDataToArea(argObjectId,500,1);end;