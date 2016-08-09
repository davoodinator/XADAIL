/**
 * Working Features:
 * - Generated Enemy Pools
 * - Random Container (Chest) Creation
 * - Aether Crystals AND Obelisks
 * - Credit System (Stage 01)
 * - Multi-Level DGA Support
 * - Endless 02 Support
 * - TODO: Endless Modes
 *
 * @author WareBare
 * @version v0.2.0 [BETA]
 * 
 * Updated: 05/31/2016
 */

local dgaSettings = {}
local dgaHideout = {}
local dgaPortals = {}
local dgaPortals02 = {}

local dgaEntities = {}
local dgaEntityStorage = {}

local dgaSpecial = {}
local dgaCredit = {}
local dgaRunCount = 0
local dgaQuest = {}


/**
 * No check if variable/array is set
 * @params optData (array)
 * - AreaID [default: dgaSettings.AreaID]
 * - LayoutID [default: dgaSettings.LayoutID]
 * - newCoords [default: dgaPortals[]["Loc"] using AreaID and LayoutID set via optData]
 * - isLocked (:SetLocked(bool)) [default: false]
 * - SpawnNumber (1: hideout portal leading to the area/layout pair, >1: portals inside the area/layout pair) [default: 1]
 */
local function movePortal(optData)
	if(optData == nil)then optData = {} end
	-- Set default data
	optData.AreaID = (optData.AreaID != nil) && optData.AreaID || dgaSettings.AreaID
	optData.LayoutID = (optData.LayoutID != nil) && optData.LayoutID || dgaSettings.LayoutID
	optData.isLocked = (optData.isLocked != nil) && optData.isLocked || false
	optData.SpawnNumber = (optData.SpawnNumber != nil) && optData.SpawnNumber || 1
	optData.newCoords = (optData.newCoords != nil) && optData.newCoords || dgaPortals[optData.AreaID][optData.LayoutID][optData.SpawnNumber]["Loc"]
	-- move a particual portal to set location
	if(dgaPortals[optData.AreaID][optData.LayoutID][optData.SpawnNumber] != nil)then
		dgaPortals[optData.AreaID][optData.LayoutID][optData.SpawnNumber]["Instance"]:SetLocked(optData.isLocked)
		dgaPortals[optData.AreaID][optData.LayoutID][optData.SpawnNumber]["Instance"]:SetCoords(optData.newCoords)
	end
end
/**
 * Credit and Reward - System
 */
local function getDGACredit(argAreaId,argType)
	--if(argAreaId == nil)then argAreaId = dgaSettings.AreaID end
	--if(argType == nil)then argType = "Key" end
	if(dgaCredit[argAreaId] != nil && dgaCredit[argAreaId][argType] != nil)then
		--
		local yourCredit = dgaCredit[argAreaId][argType]
		UI.Notify("Your Current Credit: "..yourCredit)
		return yourCredit
	end
end
local function calcDGACreditReward(argAreaId,argType)
	--if(argAreaId == nil)then argAreaId = dgaSettings.AreaID end
	local myCredit = getDGACredit(argAreaId,argType)
	local player = Game.GetLocalPlayer()
	local itemId = 1
	if(myCredit >= 1)then
		if(argType == "Key")then
			--myCredit = myCredit + random(1,1000)
			if(myCredit >= waCredit.Rewards.Keys[1])then
				if(myCredit >= waCredit.Rewards.Keys[2])then
					itemId = 2
					if(myCredit >= waCredit.Rewards.Keys[3])then
						itemId = 3
					end
				end
			end -- Copper Key

			local newItem = Entity.Create(waDGARewards.Keys[itemId])
			newItem:SetCoords(player:GetCoords())
		--elseif(argType == "")
		end
	end
end
local function calcDGACredit(argOldCredit)
	local newCredit = 0
	local addCredit = 0

	-- Difficulty * Runs * Tier * Mode
	if(dgaSettings.Tier != 0)then
		addCredit = dgaRunCount * waCredit.Multiplier.Difficulty[dgaSettings.Difficulty] * waCredit.Multiplier.Mode[dgaSettings.ModeID] * dgaSettings.Tier
	else
		addCredit = dgaRunCount * waCredit.Multiplier.Difficulty[dgaSettings.Difficulty] * waCredit.Multiplier.Mode[dgaSettings.ModeID]
	end
	newCredit = argOldCredit + addCredit

	return newCredit
end
local function giveCredit(argAreaId,argType,argNewValue)
	local areaId = argAreaId -- also first level key
	if(dgaCredit[areaId] == nil)then dgaCredit[areaId] = {} end
	if(dgaCredit[areaId][argType] == nil)then dgaCredit[areaId][argType] = 0 end
	if(argNewValue == nil)then
		argNewValue = calcDGACredit(dgaCredit[areaId][argType])
	end
	dgaCredit[areaId][argType] = argNewValue
end
/**
 * DGA Settings (local)
 */
local function getDifficulty()
	local retValue = 1
	if (Game.GetGameDifficulty() == Game.Difficulty.Normal)then retValue = 1
	elseif (Game.GetGameDifficulty() == Game.Difficulty.Epic)then retValue = 2
	else retValue = 3 end
	return retValue
end
local function setModeChanges()
	if(dgaSettings.ModeID == 2)then
		dgaSettings.Tier = dgaSettings.Tier + 1
	elseif(dgaSettings.ModeID == 3)then

	end
end
local function removeDGAKey()
	-- security, check if player has the required items
	-- check if tier is free
	if(dgaSettings.Tier > 0)then
		if(dgaSettings.Tier > waDGARequirements.FreeTiers[dgaSettings.ModeID][dgaSettings.Difficulty])then
			local keyDBR = waDGAKeys[dgaSettings.Difficulty][dgaSettings.Tier]
			local player = Game.GetLocalPlayer()
			if(waDGARequirements.DGAKey[dgaSettings.ModeID] == 1)then
				player:DestroyItem(keyDBR)
			else
				for i=1,waDGARequirements.DGAKey[dgaSettings.ModeID] do
					player:DestroyItem(keyDBR)
				end
			end
		end
	end
	return true
end
-- argAreaId (optional) defaults to current set areaId
local function getNewLayoutID(argAreaId)
	if(argAreaId == nil)then argAreaId = dgaSettings.AreaID end
	if(dgaSettings.prevLayout == nil)then dgaSettings.prevLayout = {} end
	if(dgaSettings.prevLayout[argAreaId] == nil)then dgaSettings.prevLayout[argAreaId] = {} end

	local newLayoutID = 1

	local prevLayoutCount = table.getn(dgaSettings.prevLayout[argAreaId])
	local countLayouts = table.getn(dgaPortals[argAreaId])
	if(countLayouts > 1)then
		local rndLayoutID = random(1,countLayouts)
		if(prevLayoutCount != 0)then
			local whileLayoutID = 0
			while (whileLayoutID == 0) do
				for i=1,prevLayoutCount do
					if(rndLayoutID != dgaSettings.prevLayout[argAreaId][i])then whileLayoutID = rndLayoutID end
				end
				if(whileLayoutID == 0)then rndLayoutID = random(1,countLayouts) end
			end
		end
		newLayoutID = rndLayoutID
	end
	if(prevLayoutCount == (countLayouts - 1))then dgaSettings.prevLayout[argAreaId] = {} end
	table.insert(dgaSettings.prevLayout[argAreaId],newLayoutID)
	return newLayoutID
end
local function setTier(argTier)
	dgaSettings["Difficulty"] = getDifficulty()
	dgaSettings["Tier"] = argTier
end
local function setArea(argAreaId)
	dgaSettings["AreaID"] = argAreaId
end
local function setLayout()
	dgaSettings["LayoutID"] = getNewLayoutID()
end
local function setPortalCharges()
	dgaSettings["PortalCharges"] = Game.GetNumPlayers()
end
/**
 * DGA Entities (local)
 */
local function getEnemyLevel(argMonsterLevelOffset)
	local enemyLevel = Game.GetAveragePlayerLevel() + dgaSettings.Tier + waEntitySettings.Difficulty.LevelOffset[dgaSettings.Difficulty] + argMonsterLevelOffset
	return enemyLevel, nil
end
-- argEntityType: "Default", "Boss"
local function setEntityLoc(argObjectId,argEntityType)
	if(dgaSettings.BlockEntityReg == nil)then dgaSettings.BlockEntityReg = {} end
	if(dgaSettings.BlockEntityReg[dgaSettings.AreaID] == nil)then dgaSettings.BlockEntityReg[dgaSettings.AreaID] = {} end
	if(dgaSettings.BlockEntityReg[dgaSettings.AreaID][dgaSettings.LayoutID] == nil)then dgaSettings.BlockEntityReg[dgaSettings.AreaID][dgaSettings.LayoutID] = false end
	if(dgaSettings.BlockEntityReg[dgaSettings.AreaID][dgaSettings.LayoutID] == false)then
		if(dgaEntities[dgaSettings.AreaID] == nil)then dgaEntities[dgaSettings.AreaID] = {} end
		if(dgaEntities[dgaSettings.AreaID][dgaSettings.LayoutID] == nil)then dgaEntities[dgaSettings.AreaID][dgaSettings.LayoutID] = {} end
		if(dgaEntities[dgaSettings.AreaID][dgaSettings.LayoutID][argEntityType] == nil)then
			dgaEntities[dgaSettings.AreaID][dgaSettings.LayoutID][argEntityType] = {["Loc"]={},["Count"]=0} 
		end
		if(dgaEntities[dgaSettings.AreaID][dgaSettings.LayoutID][argEntityType]["Count"] == 0)then dgaEntities[dgaSettings.AreaID][dgaSettings.LayoutID][argEntityType]["Count"] = dgaEntities[dgaSettings.AreaID][dgaSettings.LayoutID][argEntityType]["Count"] + 1 end
		dgaEntities[dgaSettings.AreaID][dgaSettings.LayoutID][argEntityType]["Loc"][dgaEntities[dgaSettings.AreaID][dgaSettings.LayoutID][argEntityType]["Count"]] = Proxy.Get(argObjectId):GetCoords()
		dgaEntities[dgaSettings.AreaID][dgaSettings.LayoutID][argEntityType]["Count"] = dgaEntities[dgaSettings.AreaID][dgaSettings.LayoutID][argEntityType]["Count"] + 1
	end
end
local function setEntityLoc_old(argObjectId,argEntityType,argAreaId,argLayoutId)
	if(argAreaId == dgaSettings.AreaID && argLayoutId == dgaSettings.LayoutID)then
		if(dgaSettings.BlockEntityReg == nil)then dgaSettings.BlockEntityReg = {} end
		if(dgaSettings.BlockEntityReg[dgaSettings.AreaID] == nil)then dgaSettings.BlockEntityReg[dgaSettings.AreaID] = {} end
		if(dgaSettings.BlockEntityReg[dgaSettings.AreaID][dgaSettings.LayoutID] == nil)then dgaSettings.BlockEntityReg[dgaSettings.AreaID][dgaSettings.LayoutID] = false end
		if(dgaSettings.BlockEntityReg[dgaSettings.AreaID][dgaSettings.LayoutID] == false)then
			if(dgaEntities[dgaSettings.AreaID] == nil)then dgaEntities[dgaSettings.AreaID] = {} end
			if(dgaEntities[dgaSettings.AreaID][dgaSettings.LayoutID] == nil)then dgaEntities[dgaSettings.AreaID][dgaSettings.LayoutID] = {} end
			if(dgaEntities[dgaSettings.AreaID][dgaSettings.LayoutID][argEntityType] == nil)then
				dgaEntities[dgaSettings.AreaID][dgaSettings.LayoutID][argEntityType] = {["Loc"]={},["Count"]=0} 
			end
			if(dgaEntities[dgaSettings.AreaID][dgaSettings.LayoutID][argEntityType]["Count"] == 0)then dgaEntities[dgaSettings.AreaID][dgaSettings.LayoutID][argEntityType]["Count"] = dgaEntities[dgaSettings.AreaID][dgaSettings.LayoutID][argEntityType]["Count"] + 1 end
			dgaEntities[dgaSettings.AreaID][dgaSettings.LayoutID][argEntityType]["Loc"][dgaEntities[dgaSettings.AreaID][dgaSettings.LayoutID][argEntityType]["Count"]] = Proxy.Get(argObjectId):GetCoords()
			dgaEntities[dgaSettings.AreaID][dgaSettings.LayoutID][argEntityType]["Count"] = dgaEntities[dgaSettings.AreaID][dgaSettings.LayoutID][argEntityType]["Count"] + 1
		end
	end
end
local function saveEntity(argEntityInstance)
	table.insert(dgaEntityStorage,argEntityInstance)
end
local function removeEntities()
	local entityStorageCount = table.getn(dgaEntityStorage)
	if(entityStorageCount >= 1)then
		for i=1,entityStorageCount do
			dgaEntityStorage[i]:Destroy()
		end
	end
	dgaEntityStorage = {}
end
local function createEnemy(argFile,argOffset,argCoords)
	local newEnemy = Character.Create(argFile,getEnemyLevel(argOffset))
	newEnemy:SetCoords(argCoords)
	table.insert(dgaEntityStorage,newEnemy)
end
local function createContainer(argCoords,argDBR)
	local chestDBR = argDBR
	-- Common||Rare Container
	if(argDBR == nil) then
		local rngSpawnContainer = random(1,100)
		if(rngSpawnContainer <= waEntitySettings.Containers.Chances.Rare[dgaSettings.Difficulty])then
			local randChest = random(1,table.getn(waContainerPool[dgaSettings.AreaID]["Rare"]))
			chestDBR = waContainerPool[dgaSettings.AreaID]["Rare"][randChest]
		elseif(rngSpawnContainer <= waEntitySettings.Containers.Chances.Common[dgaSettings.Difficulty])then
			local randChest = random(1,table.getn(waContainerPool[dgaSettings.AreaID]["Common"]))
			chestDBR = waContainerPool[dgaSettings.AreaID]["Common"][randChest]
		end
		
	end
	-- if DBR is set, create Container
	if(chestDBR != nil) then
		local newContainer = Entity.Create(chestDBR)
		newContainer:SetCoords(argCoords)
		--saveContainer(newContainer)
		table.insert(dgaEntityStorage,newContainer)
	end
end
-- argSpecialDBR (optional) - can be a special container at set location or something else
local function createEntityDefault(argCoords,optSpecialDBR)
	if(optSpecialDBR == nil)then optSpecialDBR = {} end
	if(optSpecialDBR.DBR == nil)then
		local championChance = 0
		if(Game.GetAveragePlayerLevel() >= waEntitySettings.Enemies.LevelRequirements.Champion)then
			championChance = random(1,100)
		end
		if(championChance <= waEntitySettings.Enemies.Chances.Aether[dgaSettings.Difficulty] && championChance != 0)then
			createEnemy(waEnemyPools.Aether[2][1],waEntitySettings.Enemies.LevelOffset.AetherObelisk,argCoords)
		elseif(championChance <= waEntitySettings.Anomalies.Chances.Aether[dgaSettings.Difficulty] && championChance != 0)then
			createEnemy(waEnemyPools.Aether[1][1],waEntitySettings.Enemies.LevelOffset.AetherCrystal,argCoords)
		else
			-- Container
			createContainer(argCoords)
			-- ENEMIES
			local randPool = random(1,dgaSettings.PoolSize)
			-- Check if Champion, if not then spawn common + hero
			if(championChance <= waEntitySettings.Enemies.Chances.Champion[dgaSettings.Difficulty] && championChance != 0)then
				-- Enemies (Champion)
				local championTotal = table.getn(monsterPackPools[randPool]["Champion"])
				local randChampionCount = random(waEntitySettings.Enemies.Count.Champion[dgaSettings.Difficulty][1],waEntitySettings.Enemies.Count.Champion[dgaSettings.Difficulty][2])
				for i=1,randChampionCount do
					local randChampion = random(1,championTotal)
					createEnemy(monsterPackPools[randPool]["Champion"][randChampion],waEntitySettings.Enemies.LevelOffset.Champion,argCoords)
				end
			else
				-- Enemies (Common)
				local commonTotal = table.getn(monsterPackPools[randPool]["Common"])
				local randCommonCount = random(waEntitySettings.Enemies.Count.Common[dgaSettings.Difficulty][1],waEntitySettings.Enemies.Count.Common[dgaSettings.Difficulty][2])
				
				for i=1,randCommonCount do
					local randCommon = random(1,commonTotal)
					createEnemy(monsterPackPools[randPool]["Common"][randCommon],waEntitySettings.Enemies.LevelOffset.Common,argCoords)
				end
				-- Enemies (Hero)
				if(Game.GetAveragePlayerLevel() >= waEntitySettings.Enemies.LevelRequirements.Hero) then
					local heroTotal = table.getn(monsterPackPools[randPool]["Hero"])
					local randHeroCount = waEntitySettings.Enemies.Count.Hero[dgaSettings.Difficulty]
					local rollHeroChance = random(1,100)
					local setHeroChance = waEntitySettings.Enemies.Chances.Hero[dgaSettings.Difficulty]
					for i=1,randHeroCount do
						if(rollHeroChance <= setHeroChance) then
							local randHero = random(1,heroTotal)
							createEnemy(monsterPackPools[randPool]["Hero"][randHero],waEntitySettings.Enemies.LevelOffset.Hero,argCoords)
						end
						setHeroChance = setHeroChance / 2
					end
				end
			end
		end
	else
		-- Special cases
		optSpecialDBR.DBR = (optSpecialDBR.DBR != nil) && optSpecialDBR.DBR || false
		if(optSpecialDBR.Offset != nil)then
			createEnemy(optSpecialDBR.DBR,optSpecialDBR.Offset,argCoords)
		else
			createContainer(argCoords,optSpecialDBR.DBR)
		end
	end
end
-- based on createEntityDefault
local function createEntityBoss(argCoords)
	local enemyBossID = 0
	if(waBossPoolsPerArea[dgaSettings.AreaID] != nil) then
		enemyBossID = waBossPoolsPerArea[dgaSettings.AreaID][random(1,table.getn(waBossPoolsPerArea[dgaSettings.AreaID]))]
	else
		enemyBossID = random(1,table.getn(waEnemyPools.Boss))
	end
	local enemyBossDBR = waEnemyPools.Boss[enemyBossID]
	createEntityDefault(argCoords,{["DBR"]=enemyBossDBR,["Offset"]=waEntitySettings.Enemies.LevelOffset.Boss})
end

local function setPortalData(argObjectId,argMapId,argLayoutId,argSpawnNumber)
	if(argSpawnNumber == nil)then argSpawnNumber = 1 end
	if(dgaPortals[argMapId] == nil)then dgaPortals[argMapId] = {} end
	if(dgaPortals[argMapId][argLayoutId] == nil)then dgaPortals[argMapId][argLayoutId] = {} end
	if(dgaPortals[argMapId][argLayoutId][argSpawnNumber] == nil)then
		local portalInstance = Door.Get(argObjectId)
		dgaPortals[argMapId][argLayoutId][argSpawnNumber] = {
			["ID"] = argObjectId,
			["Instance"] = portalInstance,
			["Loc"] = portalInstance:GetCoords()
		}

	end
end
-- for special portals found in endless dungeons or multi-level areas
local function setPortalData02(argObjectId,argPortalId,argLayoutId)
	if(dgaPortals02[dgaSettings.AreaID] == nil)then dgaPortals02[dgaSettings.AreaID] = {} end
	if(dgaPortals02[dgaSettings.AreaID]["Portals"] == nil)then dgaPortals02[dgaSettings.AreaID]["Portals"] = {} end
	-- add Portal
	if(dgaPortals02[dgaSettings.AreaID]["Portals"][argPortalId] == nil)then
		local portalInstance = Door.Get(argObjectId)
		dgaPortals02[dgaSettings.AreaID]["Portals"][argPortalId] = {
			["ID"] = argObjectId,
			["LayoutID"] = argLayoutId,
			["Instance"] = portalInstance,
			["Loc"] = portalInstance:GetCoords()
		}
	end
end
/**
 * Portal (local)
 */
local function hidePortal()
	if(dgaSettings.AreaID != nil && dgaSettings.LayoutID != nil)then
		movePortal({["isLocked"]=true})
	end
end
-- When a temporary portal is being used (e.g. From Hideout To DGA)
local function usePortalCharge(argObjectId)
	if(dgaSettings["PortalCharges"] == 1)then hidePortal() end
	dgaSettings["PortalCharges"] = dgaSettings["PortalCharges"] - 1
end
local function showPortal(argCoords)
	if(argCoords == nil)then argCoords = dgaHideout["PortalLoc"] end
	movePortal({["newCoords"]=argCoords})
end
/**
 * Conversations
 */
function wanez.dga.setSettings(argTier,argModeId)
	if(argModeId == nil)then argModeId = 1 end
	dgaSettings["ModeID"] = argModeId
	setTier(argTier)
	hidePortal()
	removeEntities()
end
function wanez.dga.openPortal(argAreaId)
	setArea(argAreaId)
	setLayout()
	setPortalCharges()
	-- remove DGA-Key from invetory and (TODO) check if player has required items before opening the portal
	if(removeDGAKey() == true)then
		showPortal()
		dgaSettings["BlockSpawn"] = false
		dgaSettings.BlockBridge = false
		if(dgaSettings.prevPortal[argAreaId] != nil)then dgaSettings.prevPortal[argAreaId] = {} end
	end
end
function wanez.dga.spawnTrigger()
	if(dgaSettings.BlockSpawn == false)then
		dgaSettings.BlockEntityReg[dgaSettings.AreaID][dgaSettings.LayoutID] = true
		removeEntities()
		-- Containers (Special)
		local specialContainerNumber = table.getn(waContainerPool[dgaSettings.AreaID]["Special"])
		local doSpecialContainer = {}
		if(specialContainerNumber >= 1)then
			for i=1,specialContainerNumber do
				--
				local endWhile = false
				while (endWhile == false) do
					local randomContainerLoc = random(1,dgaEntities[dgaSettings.AreaID][dgaSettings.LayoutID]["Default"]["Count"])
					if(doSpecialContainer[randomContainerLoc] == nil) then
						doSpecialContainer[randomContainerLoc] = waContainerPool[dgaSettings.AreaID]["Special"][i]
						endWhile = true
					end
				end
			end
		end
		-- Proxy (Default)
		if(dgaEntities[dgaSettings.AreaID][dgaSettings.LayoutID]["Default"]["Count"] >= 1)then
			for i=1,dgaEntities[dgaSettings.AreaID][dgaSettings.LayoutID]["Default"]["Count"] do
				createEntityDefault(dgaEntities[dgaSettings.AreaID][dgaSettings.LayoutID]["Default"]["Loc"][i],{["DBR"]=doSpecialContainer[i]})
			end
		end
		-- Proxy (Boss)
		if(dgaEntities[dgaSettings.AreaID][dgaSettings.LayoutID]["Boss"]["Count"] >= 1)then
			for i=1,dgaEntities[dgaSettings.AreaID][dgaSettings.LayoutID]["Boss"]["Count"] do
				createEntityBoss(dgaEntities[dgaSettings.AreaID][dgaSettings.LayoutID]["Boss"]["Loc"][i])
				if(table.getn(waContainerPool[dgaSettings.AreaID]["Boss"]) >= 1) then
					createEntityDefault(dgaEntities[dgaSettings.AreaID][dgaSettings.LayoutID]["Boss"]["Loc"][i],{["DBR"]=waContainerPool[dgaSettings.AreaID]["Boss"][random(1,table.getn(waContainerPool[dgaSettings.AreaID]["Boss"]))]})
				end
			end
		end
		if(dgaSettings.AreaID == 101)then
			calcDGACreditReward(dgaSettings.AreaID,"Key")
		end
		dgaRunCount = dgaRunCount + 1
		
		dgaSettings.BlockSpawn = true
		--UI.Notify("DEV: EntityCount: "..table.getn(dgaEntityStorage).." | ProxyCount: "..dgaEntities[dgaSettings.AreaID][dgaSettings.LayoutID]["Default"]["Count"])
		UI.Notify("tagWaEventNewMonsters")
	end
end
local function getNewPortalID(argAreaId)
	if(argAreaId == nil)then argAreaId = dgaSettings.AreaID end
	if(dgaSettings.prevPortal == nil)then dgaSettings.prevPortal = {} end
	if(dgaSettings.prevPortal[argAreaId] == nil)then dgaSettings.prevPortal[argAreaId] = {} end

	local newPortalID = 1

	local prevPortalCount = table.getn(dgaSettings.prevPortal[argAreaId])
	local countPortals = table.getn(dgaPortals02[argAreaId]["Portals"])
	if(countPortals > 1)then
		local rndPortalID = random(1,countPortals)
		if(prevPortalCount != 0)then
			local whilePortalID = 0
			while (whilePortalID == 0) do
				for i=1,prevPortalCount do
					if(rndPortalID != dgaSettings.prevPortal[argAreaId][i])then whilePortalID = rndPortalID end
				end
				if(whilePortalID == 0)then rndPortalID = random(1,countPortals) end
			end
		end
		newPortalID = rndPortalID
	end
	if(prevPortalCount == (countPortals - 1))then dgaSettings.prevPortal[argAreaId] = {} end
	table.insert(dgaSettings.prevPortal[argAreaId],newPortalID)
	return newPortalID
end
function wanez.dga.bridgeTrigger01()
	if(dgaSettings.BlockBridge == false)then
		dgaSettings.BlockBridge = true
		dgaSettings.BlockSpawn = false
		
		if(dgaSettings.BridgePortalID != nil)then
			wanez.dga.portalToNextLayout01OnInteract(dgaPortals02[dgaSettings.AreaID]["Portals"][dgaSettings.BridgePortalID]["ID"])
		end

		-- TODO: RNG method
		-- Get PortalID
		/*
		local whilePortalID = 0
		while (whilePortalID == 0) do
			local randPortal = random(1,table.getn(dgaPortals02[dgaSettings.AreaID]["Portals"]))
			if(randPortal != dgaSettings.BridgePortalID)then
				dgaSettings.BridgePortalID = randPortal
				whilePortalID = 1
			end
		end
		*/
		dgaSettings.BridgePortalID = getNewPortalID()
		
		dgaSettings.LayoutID = dgaPortals02[dgaSettings.AreaID]["Portals"][dgaSettings.BridgePortalID]["LayoutID"]

		-- Show Portal
		dgaPortals02[dgaSettings.AreaID]["Portals"][dgaSettings.BridgePortalID]["Instance"]:SetLocked(false)
		dgaPortals02[dgaSettings.AreaID]["Portals"][dgaSettings.BridgePortalID]["Instance"]:SetCoords(dgaPortals02[dgaSettings.AreaID]["PortalLoc"])

		-- Remove Entities
		removeEntities()
		
		calcDGACreditReward(dgaSettings.AreaID,"Key")
		--UI.Notify("Your Current Credit: "..dgaCredit[dgaSettings.AreaID]["Key"])
		--UI.Notify("ok".." | LayoutID: "..dgaSettings.LayoutID.." | PortalID: "..dgaSettings.BridgePortalID)
	end
end
-- Hideout Floor to get DGA-Portal Coords
function wanez.dga.regPortalCoordsToDGA(argObjectId)
	if(dgaHideout["PortalLoc"] == nil)then
		dgaHideout["PortalLoc"] = Entity.Get(argObjectId):GetCoords()
		dgaCredit["Global"] = {}
		dgaCredit["Global"]["Hero"] = 0
		UI.Notify("tagWaWelcomeDGA")
	end
	dgaSettings["PoolSize"] = table.getn(monsterPackPools)
end
function wanez.dga.regPortalCoordsForBridge01(argObjectId)
	if(dgaPortals02[dgaSettings.AreaID] == nil)then dgaPortals02[dgaSettings.AreaID] = {} end
	if(dgaPortals02[dgaSettings.AreaID]["PortalLoc"] == nil)then
		dgaPortals02[dgaSettings.AreaID]["PortalLoc"] = Entity.Get(argObjectId):GetCoords()
	end
end
/**
 * PROXIES
 */
function wanez.dga.regProxyDefault_00(argObjectId) setEntityLoc(argObjectId,"Default") end
function wanez.dga.regProxyBoss_00(argObjectId) setEntityLoc(argObjectId,"Boss") end
--function wanez.dga.regProxyBasicDGA_001_A_00_Boss(argObjectId) setEntityLoc(argObjectId,"Boss",1,1) end
--function wanez.dga.regProxyBasicDGA_001_A_00_Default(argObjectId) setEntityLoc(argObjectId,"Default",1,1) end
/**
 * Portals (Event)
 */
-- Hideout Portal OnInteract/Use
function wanez.dga.tempPortalOnInteract(argObjectId)
	usePortalCharge(argObjectId)
	-- set reward system to 0
	giveCredit(dgaSettings.AreaID,"Key",0)
	giveCredit(dgaSettings.AreaID,"Hero",0)
	dgaRunCount = 0
end
function wanez.dga.portalToBridge01OnInteract(argObjectId)
	dgaSettings.BlockBridge = false
	setModeChanges()
end
function wanez.dga.portalToNextLayout01OnInteract(argObjectId)
	dgaPortals02[dgaSettings.AreaID]["Portals"][dgaSettings.BridgePortalID]["Instance"]:SetLocked(true)
	dgaPortals02[dgaSettings.AreaID]["Portals"][dgaSettings.BridgePortalID]["Instance"]:SetCoords(dgaPortals02[dgaSettings.AreaID]["Portals"][dgaSettings.BridgePortalID]["Loc"])
end
function wanez.dga.portalToStart01(argObjectId)
	-- body
	dgaSettings["BlockSpawn"] = false
end
/**
 * SPECIAL
 */
function wanez.dga.regSpecialDoorBoss_00(argObjectId)
	if(dgaSpecial[dgaSpecial.AreaID] == nil)then dgaSpecial[dgaSettings.AreaID] = {} end
	if(dgaSpecial[dgaSpecial.AreaID]["BossDoor"] == nil)then dgaSpecial[dgaSettings.AreaID]["BossDoor"] = {} end
end
function wanez.dga.regSpecialPortalToBoss_00(argObjectId)

end
function wanez.dga.specialToBoss00OnInteract(argObjectId)
end
-- ID: 1
function wanez.dga.regPortalBasicDGA_001_A_00(argObjectId) setPortalData(argObjectId,1,1) end
--function wanez.dga.regPortalBasicDGA_001_B_00(argObjectId) setPortalData(argObjectId,1,2) end
function wanez.dga.regPortalBasicDGA_001_C_00(argObjectId) setPortalData(argObjectId,1,3) end
function wanez.dga.regPortalBasicDGA_001_D_00(argObjectId) setPortalData(argObjectId,1,4) end
function wanez.dga.regPortalBasicDGA_001_E_00(argObjectId) setPortalData(argObjectId,1,5) end
-- ID: 2
function wanez.dga.regPortalBasicDGA_002_A_00(argObjectId) setPortalData(argObjectId,2,1) end
--function wanez.dga.regPortalBasicDGA_002_B_00(argObjectId) setPortalData(argObjectId,2,2) end
function wanez.dga.regPortalBasicDGA_002_C_00(argObjectId) setPortalData(argObjectId,2,3) end
function wanez.dga.regPortalBasicDGA_002_D_00(argObjectId) setPortalData(argObjectId,2,4) end
function wanez.dga.regPortalBasicDGA_002_E_00(argObjectId) setPortalData(argObjectId,2,5) end
-- ID: 3
function wanez.dga.regPortalBasicDGA_003_A_00(argObjectId) setPortalData(argObjectId,3,1) end
--function wanez.dga.regPortalBasicDGA_003_B_00(argObjectId) setPortalData(argObjectId,3,2) end
function wanez.dga.regPortalBasicDGA_003_C_00(argObjectId) setPortalData(argObjectId,3,3) end
function wanez.dga.regPortalBasicDGA_003_D_00(argObjectId) setPortalData(argObjectId,3,4) end
function wanez.dga.regPortalBasicDGA_003_E_00(argObjectId) setPortalData(argObjectId,3,5) end
-- ID: 4
function wanez.dga.regPortalBasicDGA_004_A_00(argObjectId) setPortalData(argObjectId,4,1) end
function wanez.dga.regPortalBasicDGA_004_B_00(argObjectId) setPortalData(argObjectId,4,2) end
function wanez.dga.regPortalBasicDGA_004_C_00(argObjectId) setPortalData(argObjectId,4,3) end
function wanez.dga.regPortalBasicDGA_004_D_00(argObjectId) setPortalData(argObjectId,4,4) end
function wanez.dga.regPortalBasicDGA_004_E_00(argObjectId) setPortalData(argObjectId,4,5) end
-- ID: 5
--function wanez.dga.regPortalBasicDGA_005_A_00(argObjectId) setPortalData(argObjectId,5,1) end
function wanez.dga.regPortalBasicDGA_005_B_00(argObjectId) setPortalData(argObjectId,5,1) end
function wanez.dga.regPortalBasicDGA_005_C_00(argObjectId) setPortalData(argObjectId,5,2) end
function wanez.dga.regPortalBasicDGA_005_D_00(argObjectId) setPortalData(argObjectId,5,4) end
function wanez.dga.regPortalBasicDGA_005_E_00(argObjectId) setPortalData(argObjectId,5,5) end
-- ID: 6
function wanez.dga.regPortalBasicDGA_006_A_00(argObjectId) setPortalData(argObjectId,6,1) end
-- ID: 7
function wanez.dga.regPortalBasicDGA_007_A_00(argObjectId) setPortalData(argObjectId,7,1) end
function wanez.dga.regPortalBasicDGA_007_B_00(argObjectId) setPortalData(argObjectId,7,2) end
-- ID: 101
function wanez.dga.regPortalEndlessDGA_001_A_00(argObjectId) setPortalData(argObjectId,101,1) end
-- ID: 102
function wanez.dga.regPortalEndlessDGA_002_A_00(argObjectId) setPortalData(argObjectId,102,1) end

function wanez.dga.regPortalToNextLayout_02(argObjectId) setPortalData02(argObjectId,1,2) end
function wanez.dga.regPortalToNextLayout_03(argObjectId) setPortalData02(argObjectId,2,3) end
function wanez.dga.regPortalToNextLayout_04(argObjectId) setPortalData02(argObjectId,3,4) end
--function wanez.dga.regPortalToNextLayout_05(argObjectId) setPortalData02(argObjectId,4,5) end

-- 727043; d4ce34; d75836

/**
 * Reward-System (Credit|Key)
 */
function wanez.dga.regRewardChest01Loc(argObjectId)
	if(dgaCredit.Reward == nil)then dgaCredit.Reward = {} end
	dgaCredit.Reward.Loc = Entity.Get(argObjectId):GetCoords()
end
function wanez.dga.showRewardChest(argChestId)
	if(argChestId == nil)then argChestId = 1 end
	if(dgaCredit.Reward.ContainerInstance != nil)then
		dgaCredit.Reward.ContainerInstance:Destroy()
		dgaCredit.Reward.ContainerInstance = nil
	end
	local newContainer = Entity.Create(waDGARewards.Containers[argChestId])
	newContainer:SetCoords(dgaCredit.Reward.Loc)
	dgaCredit.Reward.ContainerInstance = newContainer
	local player = Game.GetLocalPlayer()
	player:DestroyItem(waDGARewards.Keys[argChestId])
end
/**
 * Boss/Hero Orb-Chests
 */
function wanez.dga.destroyBossOrb()
	if(dgaSettings.AreaID != nil)then
		giveCredit(dgaSettings.AreaID,"Key")
		--UI.Notify(dgaCredit[dgaSettings.AreaID]["Key"])
	end
	--if(dgaQuest["Main01"] == nil)then dgaQuest["Main01"] = {} end
	--dgaQuest["DGABossKilled"] = true
end
function wanez.dga.destroyHeroOrb()
	if(dgaSettings.AreaID != nil)then
		giveCredit(dgaSettings.AreaID,"Hero")
		--UI.Notify(dgaCredit[dgaSettings.AreaID]["Hero"])
	end
	--giveCredit("Global","Hero")
	--local myCredit = getDGACredit()
	dgaCredit["Global"]["Hero"] = dgaCredit["Global"]["Hero"] + 1
	--UI.Notify(dgaCredit["Global"]["Hero"])
	if(dgaCredit["Global"]["Hero"] >= 10)then
		local player = Game.GetLocalPlayer()
		local newItem = Entity.Create(waDGARewards.Keys[dgaSettings.Difficulty])
		newItem:SetCoords(player:GetCoords())
		UI.Notify("tagWaEventGlobalHeroReward01")
		--giveCredit("Global","Hero",0)
		dgaCredit["Global"]["Hero"] = 0
	end
end

/**
 * QUEST

function wanez.dga.questKilledDGABoss(argQuestID)
	if(dgaQuest["DGABossKilled"] != nil && dgaQuest["DGABossKilled"] == true)then

		dgaQuest["DGABossKilled"] = false
	end
end
 */