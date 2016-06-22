/**
 * Working Features:
 * - Generated Enemy Pools
 * - Random Container (Chest) Creation
 * - Aether Crystals AND Obelisks
 * - Credit System (Stage 01)
 * - Multi-Level DGA Support
 * - Endless 02 Support
 * - Loot Generator
 * - Special DGA (Basic Support)
 * - Uber (Basic Support)
 *
 * @author WareBare
 * @version v0.3.0 [BETA]
 * 
 * Updated: 06/11/2016
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
--local dgaQuest = {}
local dgaQuests = {["isCompletion"]={}}



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
local function getEnemyCoords(argObjectId)
	local enemyInst = Character.Get(argObjectId)
	return enemyInst:GetCoords()
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
	math.randomseed(Time.Now())
	if(dgaSettings.ModeID == 2)then
		dgaSettings.Tier = dgaSettings.Tier + 1
	elseif(dgaSettings.ModeID == 3)then

	end
end
local function removeDGAKey()
	-- security, check if player has the required items
	-- check if tier is free
	if(dgaSettings.Tier > 0)then
		if(dgaSettings.Tier > waDGARequirements.FreeTiers[dgaSettings.ModeID][dgaSettings.Difficulty] || dgaSettings.SpecialID != 0)then
			local keyDBR = waDGAKeys[dgaSettings.Difficulty][dgaSettings.Tier]
			local player = Game.GetLocalPlayer()
			if(waDGARequirements.DGAKey[dgaSettings.ModeID] == 1 && dgaSettings.SpecialID == 0)then
				player:DestroyItem(keyDBR)
			else
				local loopCount = (dgaSettings.SpecialID == 0) && waDGARequirements.DGAKey[dgaSettings.ModeID] || waDGARequirements.DGAKeySpecial[dgaSettings.SpecialID]
				for i=1,loopCount do
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
				whileLayoutID = rndLayoutID
				for i=1,prevLayoutCount do
					if(rndLayoutID == dgaSettings.prevLayout[argAreaId][i])then whileLayoutID = 0 end
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
	if(argAreaId == 0)then
		local basicCount = table.getn(waBasicDGAPool)
		local randBasic = random(1,basicCount)
		dgaSettings["AreaID"] = waBasicDGAPool[randBasic]
	end
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
	local enemyLevel = Game.GetAveragePlayerLevel() + dgaSettings.Tier + waEntitySettings.Difficulty.LevelOffset[dgaSettings.Difficulty] + argMonsterLevelOffset + waEntitySettings.Category.LevelOffset[dgaSettings.CategoryOffset]
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
	dgaSettings.EnemyCount = 0
end
local function createEnemy(argFile,argOffset,argCoords)
	local newEnemy = Character.Create(argFile,getEnemyLevel(argOffset))
	newEnemy:SetCoords(argCoords)
	table.insert(dgaEntityStorage,newEnemy)
	dgaSettings.EnemyCount = dgaSettings.EnemyCount + 1
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
 * QUESTS (Local)
 */
local function checkTaskCompletion(argQuestId)
	if(dgaQuests.isCompletion[argQuestId] == nil)then dgaQuests.isCompletion[argQuestId] = false end
	local currentQuestTaskState = dgaQuests.isCompletion[argQuestId]
	dgaQuests.isCompletion[argQuestId] = false
	return currentQuestTaskState
end
local function wanezCompleteQuestTask(argQuestId)
	local player = Game.GetLocalPlayer()

	local questId = waDGAQuestPool[argQuestId][1]
	local taskId = waDGAQuestPool[argQuestId][2]

	local questTaskState = player:GetQuestTaskState(questId,taskId)
	if(questTaskState == QuestState.InProgress)then
		UI.Notify("so far working")
		--player:GrantQuest(questId,taskId)
		--player:CompleteQuest(questId)
		dgaQuests.isCompletion[argQuestId] = true
	end

end
local function wanezGrantQuest(argQuestId)
	local player = Game.GetLocalPlayer()

	local questId = waDGAQuestPool[argQuestId][1]
	local taskId = waDGAQuestPool[argQuestId][2]

	local questState = player:GetQuestState(questId)
	if(questState != QuestState.InProgress)then
	--	UI.Notify("so far working")
		player:GrantQuest(questId,taskId)
		--player:CompleteQuest(questId)
		--dgaQuests.isCompletion[argQuestId] = true
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
	dgaSettings.SpecialID = 0
	dgaSettings.CategoryOffset = "Default"
	dgaSettings.KillCount = 0
	dgaSettings.SpecialCredit = 0
	dgaSettings.BlockRespawn = false
	dgaSettings.BlockBossSpawn = false
	--dgaSettings.SpecialReset = true
	math.randomseed(Time.Now())
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
		if(dgaSettings.SpecialID == 1)then
			dgaSettings.SpecialCredit = 1
			--wanezGrantQuest(2)
		end
		if(dgaSettings.prevPortal[argAreaId] != nil)then dgaSettings.prevPortal[argAreaId] = {} end
	end
end
function wanez.dga.openSpecialPortal(argAreaId,argSpecialId)
	dgaSettings.SpecialID = argSpecialId
	dgaSettings.CategoryOffset = "Special"
	wanez.dga.openPortal(argAreaId)
end
function wanez.dga.openUberPortal(argAreaId,argSpecialId)
	dgaSettings.SpecialID = argSpecialId
	dgaSettings.CategoryOffset = "Uber"
	wanez.dga.openPortal(argAreaId)
end
-- If Entities should respawn
local function checkSpecialRespawnCredit()
	local isSpawn = false
	if(waSpecialDGA[dgaSettings.SpecialID]["RespawnThreshold"] != nil)then
		local mathRespawnThreshold = (dgaSettings.EnemyCount / 100) * waSpecialDGA[dgaSettings.SpecialID]["RespawnThreshold"]
		if(dgaSettings.KillCount >= mathRespawnThreshold)then isSpawn = true end
	end
	return isSpawn
end
-- if a boss should spawn
local function checkSpecialBossCredit()
	local isSpawn = false
	--if(waSpecialDGA[dgaSettings.SpecialID]["ReqBossCredit"] != nil)then
	--	if(dgaSettings.SpecialCredit >= waSpecialDGA[dgaSettings.SpecialID]["ReqBossCredit"])then isSpawn = true end
	--end
	return isSpawn
end
function wanez.dga.spawnTrigger()
	if(dgaSettings.BlockSpawn == false)then
		dgaSettings.BlockEntityReg[dgaSettings.AreaID][dgaSettings.LayoutID] = true
		removeEntities()
		if(dgaSettings.SpecialID == 1)then wanezGrantQuest(2) end
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
						doSpecialContainer[randomContainerLoc] = {["DBR"]=waContainerPool[dgaSettings.AreaID]["Special"][i]}
						endWhile = true
					end
				end
			end
		end
		local playerFactionValue = Game.GetLocalPlayer():GetFaction("USER15")
		local FactionValueID = 0
		if(playerFactionValue <= -20000)then FactionValueID = 3
		elseif(playerFactionValue <= -8000)then FactionValueID = 2
		elseif(playerFactionValue <= -1500)then FactionValueID = 1 end
		if (FactionValueID != 0)then
			-- number of nemesis spawns
			local countNemesisSpawns = random(waEntitySettings.Enemies.Count.Nemesis[FactionValueID][1],waEntitySettings.Enemies.Count.Nemesis[FactionValueID][2])
			-- check if Nemesis should spawn
			if(countNemesisSpawns > 0)then
				for i=1,countNemesisSpawns do
					local endWhile = false
					while (endWhile == false) do
						local randomNemesisLoc = random(1,dgaEntities[dgaSettings.AreaID][dgaSettings.LayoutID]["Default"]["Count"])
						if(doSpecialContainer[randomNemesisLoc] == nil) then
							local totalNemeses = table.getn(waEnemyNemesisPool) -- total nemesis for later to pick one
							local randNemesis = random(1,totalNemeses)
							doSpecialContainer[randomNemesisLoc] = {["DBR"]=waEnemyNemesisPool[randNemesis],["Offset"]=waEntitySettings.Enemies.LevelOffset.Nemesis}
							endWhile = true
						end
					end
				end
			end
			--UI.Notify(countNemesisSpawns.." Nemeses Spawned")
		end
		-- Proxy (Default)
		if(dgaEntities[dgaSettings.AreaID][dgaSettings.LayoutID]["Default"]["Count"] >= 1)then
			for i=1,dgaEntities[dgaSettings.AreaID][dgaSettings.LayoutID]["Default"]["Count"] do
				createEntityDefault(dgaEntities[dgaSettings.AreaID][dgaSettings.LayoutID]["Default"]["Loc"][i],doSpecialContainer[i])
			end
		end
		-- Proxy (Boss)
		local doCreateBoss = true
		if(dgaSettings.SpecialID != 0)then
			--doCreateBoss = checkSpecialBossCredit() -- return bool
			doCreateBoss = false
		end
		if(dgaEntities[dgaSettings.AreaID][dgaSettings.LayoutID]["Boss"]["Count"] >= 1)then
			if(doCreateBoss == true)then
				for i=1,dgaEntities[dgaSettings.AreaID][dgaSettings.LayoutID]["Boss"]["Count"] do
					createEntityBoss(dgaEntities[dgaSettings.AreaID][dgaSettings.LayoutID]["Boss"]["Loc"][i])
					if(table.getn(waContainerPool[dgaSettings.AreaID]["Boss"]) >= 1) then
						createEntityDefault(dgaEntities[dgaSettings.AreaID][dgaSettings.LayoutID]["Boss"]["Loc"][i],{["DBR"]=waContainerPool[dgaSettings.AreaID]["Boss"][random(1,table.getn(waContainerPool[dgaSettings.AreaID]["Boss"]))]})
					end
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
	--UI.Notify("01")
	if(countPortals > 1)then
		local rndPortalID = random(1,countPortals)
		--UI.Notify(prevPortalCount)
		if(prevPortalCount >= 1)then
			--UI.Notify("03")
			local whilePortalID = 0
			while (whilePortalID == 0) do
				--UI.Notify("03 while")
				whilePortalID = rndPortalID
				for i=1,prevPortalCount do
					if(rndPortalID == dgaSettings.prevPortal[argAreaId][i])then whilePortalID = 0 end
				end
				if(whilePortalID == 0)then rndPortalID = random(1,countPortals) end
			end
		end
		newPortalID = rndPortalID
	end
	if(prevPortalCount == (countPortals - 1))then
		dgaSettings.prevPortal[argAreaId] = {}
		--UI.Notify("04 if")
	end
	--UI.Notify("blub: "..table.getn(dgaSettings.prevPortal[argAreaId]))
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
		dgaSettings.BridgePortalID = getNewPortalID()
		
		dgaSettings.LayoutID = dgaPortals02[dgaSettings.AreaID]["Portals"][dgaSettings.BridgePortalID]["LayoutID"]

		-- Show Portal
		dgaPortals02[dgaSettings.AreaID]["Portals"][dgaSettings.BridgePortalID]["Instance"]:SetLocked(false)
		dgaPortals02[dgaSettings.AreaID]["Portals"][dgaSettings.BridgePortalID]["Instance"]:SetCoords(dgaPortals02[dgaSettings.AreaID]["PortalLoc"])

		-- Remove Entities
		removeEntities()
		
		--UI.Notify("ok".." | LayoutID: "..dgaSettings.LayoutID.." | PortalID: "..dgaSettings.BridgePortalID.." | PortalCount: "..table.getn(dgaPortals02[dgaSettings.AreaID]["Portals"]).." | prevPortalCount: "..table.getn(dgaSettings.prevPortal[dgaSettings.AreaID]))
		calcDGACreditReward(dgaSettings.AreaID,"Key")
		--UI.Notify("Your Current Credit: "..dgaCredit[dgaSettings.AreaID]["Key"])
	end
end
-- Hideout Floor to get DGA-Portal Coords
function wanez.dga.regPortalCoordsToDGA(argObjectId)
	if(dgaHideout["PortalLoc"] == nil)then
		dgaHideout["PortalLoc"] = Entity.Get(argObjectId):GetCoords()
		dgaCredit["Global"] = {}
		dgaCredit["Global"]["Hero"] = 0
		--dgaSettings.SpecialCredit = 10
		--wanezGrantQuest(2)
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
function wanez.dga.regPortalToNextLayout_05(argObjectId) setPortalData02(argObjectId,4,5) end

/**
 * QUESTS (global)
 */
function wanez.dga.checkCompletion001() return checkTaskCompletion(1) end

-- 727043; d4ce34; d75836

/**
 * Reward-System (Credit|Keys)
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
	end
end
function wanez.dga.destroyHeroOrb()
	if(dgaSettings.AreaID != nil)then
		giveCredit(dgaSettings.AreaID,"Hero")
	end
	dgaCredit["Global"]["Hero"] = dgaCredit["Global"]["Hero"] + 1
	if(dgaCredit["Global"]["Hero"] >= 10)then
		local player = Game.GetLocalPlayer()
		local newItem = Entity.Create(waDGARewards.Keys[dgaSettings.Difficulty])
		newItem:SetCoords(player:GetCoords())
		UI.Notify("tagWaEventGlobalHeroReward01")
		dgaCredit["Global"]["Hero"] = 0
	end
end
/**
 * Enemy onDie
 */
-- script generated drops
local function genDropDGA(argObjectId,argEnemyClassId)
	if Server then
		math.randomseed(Time.Now())
		local typeMax = 0
		local typeRandom = 0 -- random(1,typeMax)
		local typeChance = 0 -- if(typeRandom <= typeChance)
		local typeCount = 0
		local typeRandom2 = 0
		local enemyInstance = false
		local enemyCoords = false
		local enemyLevel = false
		local typeRandomizerCount = table.getn(waDropRandomizer.Classification[argEnemyClassId][2])
		for i=1,typeRandomizerCount do
			typeMax = waDropRandomizer.Classification[argEnemyClassId][2][i][1]
			typeChance = waDropRandomizer.Classification[argEnemyClassId][2][i][2]
			typeRandom = random(1,typeMax)
			if(typeRandom <= typeChance)then
				if(enemyCoords == false)then 
					enemyInstance = Character.Get(argObjectId)
					enemyCoords = enemyInstance:GetCoords()
					--enemyLevel = getEnemyLevel(waEntitySettings.Enemies.LevelOffset[waDropRandomizer.Classification[argEnemyClassId][1]])
					enemyLevel = enemyInstance:GetLevel()
				end
				typeRandom2 = random(1,waLootRatio.Type[1])
				typeCount = table.getn(waLootTable)
				for j=1,typeCount do
					if(typeRandom2 <= waLootRatio.Type[2][j] && enemyLevel >= waLootTable[j]["LevelRequirements"][dgaSettings.Difficulty])then
						-- 
						local listCount = table.getn(waLootTable[j]["Lists"])
						local listRandom = random(1,listCount)
						local listTypeCount = table.getn(waLootTable[j]["Lists"][listRandom])
						local listTypeRandom = random(1,listTypeCount)
						local dropCount = 0
						local dropRandom = 0
						
						if(waLootTable[j]["UseTier"][listRandom] == false)then
							dropCount = table.getn(waLootTable[j]["Lists"][listRandom][listTypeRandom][dgaSettings.Difficulty])
							dropRandom = random(1,dropCount)
							if(waLootTable[j]["Lists"][listRandom][listTypeRandom][dgaSettings.Difficulty][dropRandom][2] != nil)then
								local newReqLevel = 0
								local whileNewDBRisFalse = false
								while(whileNewDBRisFalse == false) do
									if(waLootTable[j]["Lists"][listRandom][listTypeRandom][dgaSettings.Difficulty][dropRandom][2] != nil)then
										newReqLevel = waLootTable[j]["LevelRequirements"][dgaSettings.Difficulty] + waLootTable[j]["Lists"][listRandom][listTypeRandom][dgaSettings.Difficulty][dropRandom][2]
									else
										newReqLevel = 0
									end
									if(enemyLevel >= newReqLevel)then
										whileNewDBRisFalse = true
									else
										dropRandom = random(1,dropCount)
									end
								end
							end
						else
							local countTierDrops = table.getn(waLootTable[j]["Lists"][listRandom][listTypeRandom][dgaSettings.Difficulty])
							local minTier = dgaSettings.Tier - waLootTable[j]["UseTier"][listRandom][1] + waEntitySettings.Enemies.LevelOffset[waDropRandomizer.Classification[argEnemyClassId][1]]
							if(minTier <= 0)then minTier = 1 end
							if(minTier > countTierDrops)then minTier = countTierDrops end
							local maxTier = dgaSettings.Tier + waLootTable[j]["UseTier"][listRandom][2] + waEntitySettings.Enemies.LevelOffset[waDropRandomizer.Classification[argEnemyClassId][1]]
							if(maxTier > countTierDrops)then maxTier = countTierDrops end
							-- calculate tier drop
							dropRandom = random(minTier,maxTier)
						end
						--UI.Notify(""..j.." | "..listRandom.." | "..listTypeRandom.." | "..dropRandom)
						local newItem = Entity.Create(waLootTable[j]["Lists"][listRandom][listTypeRandom][dgaSettings.Difficulty][dropRandom][1])
						newItem:SetCoords(getEnemyCoords(argObjectId))

						-- set j to leave loop
						j = typeCount
					end
				end
			end
		end
	end
end
-- Add Credit and increase Kill Count
local function fnSpecialCredit_old(argEnemyClassId,argEnemyId)
	dgaSettings.KillCount = dgaSettings.KillCount + argEnemyClassId
	if(dgaSettings.SpecialID != 0)then
		if(waSpecialDGA[dgaSettings.SpecialID]["CreditScale"] != nil)then
			dgaSettings.SpecialCredit = dgaSettings.SpecialCredit + waSpecialDGA[dgaSettings.SpecialID]["CreditScale"][argEnemyClassId]
		end
		if(checkSpecialRespawnCredit() == true && dgaSettings.BlockRespawn == false)then
			dgaSettings.BlockSpawn = false
			dgaSettings.KillCount = 0
		elseif(waSpecialDGA[dgaSettings.SpecialID]["ReqBossCredit"] != nil)then
			if(dgaSettings.SpecialCredit >= waSpecialDGA[dgaSettings.SpecialID]["ReqBossCredit"])then
				local enemyLoc = Character.Get(argEnemyId):GetCoords()
				local bossDBR = waEnemyPools.Boss[random(1,table.getn(waEnemyPools.Boss))]
				createEntityDefault(enemyLoc,{["DBR"]=bossDBR,["Offset"]=waEntitySettings.Enemies.LevelOffset.Raid})
				dgaSettings.SpecialCredit = 0
			end
		end
		wanez.dga.spawnTrigger()
	end
end
function wanez.dga.questSpecial001Task01_old()
	local retCredit = (dgaSettings.SpecialCredit == 0) && 1000000 || dgaSettings.SpecialCredit
	return retCredit
end
local function fnSpawnRating()
	--
	local mathRespawnThreshold = (dgaSettings.EnemyCount / 100) * waSpecialDGA[dgaSettings.SpecialID]["RespawnThreshold"]
	local mathSpawn = dgaSettings.SpecialCredit / mathRespawnThreshold * 100 * 10
	return mathSpawn
	--if(dgaSettings.KillCount >= mathRespawnThreshold)then isSpawn = true end
end
function wanez.dga.questSpecial001Task01()
	--
	local retCredit = (dgaSettings.SpecialCredit == 0) && 1000000 || fnSpawnRating()
	return retCredit
end
local function fnSpecialCredit(argEnemyClassId,argEnemyId)
	dgaSettings.SpecialCredit = dgaSettings.SpecialCredit + waSpecialDGA[dgaSettings.SpecialID]["CreditScale"][argEnemyClassId]
	if(dgaSettings.SpecialID != 0)then
		if(fnSpawnRating() >= waSpecialDGA[dgaSettings.SpecialID]["ReqBossCredit"] && dgaSettings.BlockBossSpawn == false)then
			local enemyLoc = Character.Get(argEnemyId):GetCoords()
			local bossDBR = waEnemyPools.Boss[random(1,table.getn(waEnemyPools.Boss))]
			createEntityDefault(enemyLoc,{["DBR"]=bossDBR,["Offset"]=waEntitySettings.Enemies.LevelOffset.Raid})
			dgaSettings.BlockBossSpawn = true
			UI.Notify("tagWaSpecialBossSpawned")
		end
	end
end
function wanez.dga.dieCommon(argObjectId)
	local enemyClassID = 1
	genDropDGA(argObjectId,enemyClassID)
	fnSpecialCredit(enemyClassID,argObjectId)
end
function wanez.dga.dieChampion(argObjectId)
	local enemyClassID = 2
	genDropDGA(argObjectId,enemyClassID)
	fnSpecialCredit(enemyClassID,argObjectId)
end
function wanez.dga.dieHero(argObjectId)
	local enemyClassID = 3
	genDropDGA(argObjectId,enemyClassID)
	fnSpecialCredit(enemyClassID,argObjectId)
end
function wanez.dga.dieBoss(argObjectId)
	local enemyClassID = 5
	wanezCompleteQuestTask(1)
	genDropDGA(argObjectId,enemyClassID)
	fnSpecialCredit(enemyClassID,argObjectId)
	if(dgaSettings.SpecialID == 1)then
		--removeEntities()
		dgaSettings.BlockRespawn = true
		local calcChance = waDGAUberComponents[1][2] * (dgaSettings.Tier + 1)
		math.randomseed(Time.Now())
		local randUberChance = random(1,100)
		if(randUberChance <= calcChance)then
			local enemyLoc = Character.Get(argObjectId):GetCoords()
			local newItem = Entity.Create(waDGAUberComponents[1][1])
			newItem:SetCoords(enemyLoc)
		end
		dgaSettings.SpecialCredit = 0
		UI.Notify("tagWaSpecialBossDeafeated")
	end
end
function wanez.dga.dieNemesis(argObjectId)
	local enemyClassID = 6
	genDropDGA(argObjectId,enemyClassID)
	fnSpecialCredit(enemyClassID,argObjectId)
	--wanezCompleteQuestTask(1)
end

/**
 * GAMBLING
 */
function wanez.dga.dieGambleBeginner01(argObjectId)
	local player = Game.GetLocalPlayer()
	math.randomseed(Time.Now())
	local moneyValue = random(1,30000)
	player:AdjustMoney(moneyValue)
	UI.Notify("You just gambled: "..moneyValue.." Iron Bits")
end
function wanez.dga.dieGambleBeginner01b(argObjectId)
	UI.Notify("gambled - 02")
end
