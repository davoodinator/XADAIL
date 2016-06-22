/*
	
	GRIM DAWN
	
	For more information, visit us at http://www.grimdawn.com
	
*/

gd.quests.areaDQuestExile = {}

--
-- Exile starts as a friendly NPC, but can go hostile if the player pushes her via conversation
--

local bossDoor01 = 0
local bossDoor02 = 0
local bossDoor03 = 0
local doorTest = false

function gd.quests.areaDQuestExile.bossDoor01OnAddToWorld(objectId)
	if Server && not doorTest then
		-- only checks if inner prison should be unlocked initially. If the Outcast is slain during that session, door should not open until next session
		doorTest = true
		bossDoor01 = objectId
		local door01 = Door.Get(objectId)	
		local player = Game.GetLocalPlayer()
		
		if (door01 ~= nil && player:HasToken("EXILE_SLAIN")) then
			door01:SetLocked(false)
			door01:Open()
		end
		
	end
	
end

function gd.quests.areaDQuestExile.bossDoor02OnAddToWorld(objectId)
	if Server then
		bossDoor02 = objectId
		
	end
	
end

function gd.quests.areaDQuestExile.bossDoor03OnAddToWorld(objectId)
	if Server then
		bossDoor03 = objectId
		
	end
	
end

function gd.quests.areaDQuestExile.exileKilled()
	
	if Server then
		-- Unlock doors
		local door01 = Door.Get(bossDoor02)	
		local door02 = Door.Get(bossDoor03)
		
		if door01 ~= nil then
			door01:Open()
		
		end
		
		if door02 ~= nil then
			door02:Open()
		
		end
		
	end
	
end


--Toggling Exile between friendly and hostile
local exileId = 0
local spawnedExile = false

local ExileState = { Normal = 0, Hostile = 1, Epic = 2, Ultimate = 3, Despawn = 4 }

-- Exile outside the Inner Prison
local exileStateObjects = orderedTable()
	exileStateObjects["EXILE_SLAIN"	] = { state = ExileState.Despawn,  dbr = nil }
	exileStateObjects["EXILE_HOSTILE"	] = { state = ExileState.Hostile,  dbr = "records/creatures/enemies/boss&quest/theoutcast_01.dbr" }
	exileStateObjects[""					 	] = { state = ExileState.Normal, dbr = "records/creatures/npcs/questnpcs/gdaread/npc_exile_01.dbr" }

local function CharacterCreateArgs()

	return 0, Entity.Get(exileId):GetCoords().origin
	
end

function gd.quests.areaDQuestExile.exileOnAddToWorld(objectId)

	if Server then
		if (not spawnedExile) then
			QuestGlobalEvent("outcastBountyReset")
			QuestGlobalEvent("outcastResetToken")
			
			exileId = objectId
	
			local userdata = {}
			local didWork, newState = TokenStateBasedObjectSwap(objectId, userdata, exileStateObjects, Character, CharacterCreateArgs)
		
			Shared.setUserdata(objectId, userdata)
			--Don't respawn Exile next time. If spawned as hostile, will be saved into the world
			if (newState == ExileState.Hostile) then
				spawnedExile = true
				
			end
		
		end
		
	end
	
end

gd.quests.areaDQuestExile.exileOnDestroy = ClearObjectUserdata

-- Exile inside the Inner Prison
local exile02Id = 0
local spawned02Exile = false

local exileInsideStateObjects = orderedTable()
	exileInsideStateObjects["EXILE_TIER3"	] = { state = ExileState.Ultimate,  dbr = "records/creatures/enemies/boss&quest/theoutcast_03.dbr" }
	exileInsideStateObjects["EXILE_TIER2"	] = { state = ExileState.Epic,  dbr = "records/creatures/enemies/boss&quest/theoutcast_02.dbr" }
	exileInsideStateObjects["EXILE_SLAIN"	] = { state = ExileState.Hostile,  dbr = "records/creatures/enemies/boss&quest/theoutcast_01.dbr" }
	exileInsideStateObjects[""					 	] = { state = ExileState.Normal, dbr = nil }

local function CharacterCreateArgs02()

	local averageLevel = Game.GetAveragePlayerLevel()
	local bossLevel = 0
	local maxLevel = 0
	local originPoint = Entity.Get(exile02Id):GetCoords().origin

	if (Game.GetGameDifficulty() == Game.Difficulty.Normal) then
		maxLevel = 60
	elseif (Game.GetGameDifficulty() == Game.Difficulty.Epic) then
		maxLevel = 75
	else
		maxLevel = 200
	end
	
	if (averageLevel > maxLevel) then
		bossLevel = ((maxLevel+(maxLevel/50))+3)
	else
		bossLevel = ((averageLevel+(averageLevel/50))+3)

	end
	
	if bossLevel > maxLevel then
		originPoint = nil
	
	end

	--Grimmest
	originPoint = nil

	return bossLevel, originPoint
	
end

function gd.quests.areaDQuestExile.exileInsideOnAddToWorld(objectId)

	if Server then
		if (not spawned02Exile) then
			spawned02Exile = true
			
			local player = Game.GetLocalPlayer()
			
			if (player:HasToken("EXILE_SLAIN") && player:HasToken("EXILE_TIER3") == false) then
				if (player:GetFaction("USER4") <= -20000) then
					GiveTokenToLocalPlayer("EXILE_TIER3")
					player:RemoveToken("EXILE_TIER2")
					
				elseif (player:HasToken("EXILE_TIER2") == false && player:GetFaction("USER4") <= -8000) then
					GiveTokenToLocalPlayer("EXILE_TIER2")
					
				end
			
			end
			
			exile02Id = objectId
	
			local userdata = {}
			local didWork, newState = TokenStateBasedObjectSwap(objectId, userdata, exileInsideStateObjects, Character, CharacterCreateArgs02)
		
			Shared.setUserdata(objectId, userdata)
		
		end
		
	end
	
end

gd.quests.areaDQuestExile.exileInsideOnDestroy = ClearObjectUserdata


-- Quartermaster, despawned if Anasteria goes hostile, spawned if friendly
local merchantId = 0

local MerchantState = { Spawned = 0, Despawned = 1, ExileSlain = 2 }

local merchantStateObjects = orderedTable()
	merchantStateObjects["EXILE_SLAIN"	] = { state = MerchantState.ExileSlain, dbr = nil }
	merchantStateObjects["EXILE_HOSTILE"	] = { state = MerchantState.Despawned, dbr = nil }
	merchantStateObjects[""					 	] = { state = MerchantState.Spawned, dbr = "records/creatures/npcs/merchants/merchantfaction_exile_01.dbr" }

function gd.quests.areaDQuestExile.merchantOnAddToWorld(objectId)

	if Server then
		local userdata = {}
		
		merchantId = objectId
		
		TokenStateBasedObjectSwap(objectId, userdata, merchantStateObjects)
		
		Shared.setUserdata(objectId, userdata)

	end
	
end

gd.quests.areaDQuestExile.merchantOnDestroy = ClearObjectUserdata


-- swap Exile from dialogue NPC to Boss
local exileHostileSwap = false

function gd.quests.areaDQuestExile.hostileSwitch()

	if Server then
		if not exileHostileSwap then
			exileHostileSwap = true
			local MPOverrideDbr = nil
			local MPOverrideState = false
			local MPOverrideDbr2 = nil
			local player = Game.GetLocalPlayer()
			local merchant = Entity.Get(merchantId)

			if (player:HasToken("EXILE_HOSTILE") == false) then
				MPOverrideDbr = "records/creatures/enemies/boss&quest/theoutcast_01.dbr"
				MPOverrideState = true
				
			end
			
			-- swap Exile
			local didWork, newState = UpdateObjectSwap(exileId, exileStateObjects, Character, CharacterCreateArgs, MPOverrideState, MPOverrideDbr)
			spawnedExile = true
			
			-- despawn Qurtermaster
			if (merchant != nil) then
				local coords = merchant:GetCoords()
				local riftStart = Entity.Create("records/fx/ui/riftgatepersonalopen_fxpak.dbr")
			
				if (riftStart != nil) then
					riftStart:NetworkEnable()
					riftStart:SetCoords(coords)
				end
				
				UpdateObjectSwap(merchantId, merchantStateObjects, Character, CharacterCreateArgs, MPOverrideState, MPOverrideDbr2)
			
			end
		
		end
	
	end

end

-- Give Trust Token in MP
function gd.quests.areaDQuestExile.trustTokenGlobalMP()

	local player = Game.GetLocalPlayer()
	local questId = 0x8CB89F00
	local taskId = 0xACCCF400
	
	local questTaskState = player:GetQuestTaskState(questId, taskId)
	
	-- checks if player is on the quest and has faction status of at least 0.
	if (questTaskState == QuestState.InProgress && player:GetFaction("USER4") >= 0 && player:HasToken("EXILE_HATE") == false) then
		GiveTokenToLocalPlayer("EXILE_TRUST")

	end
	
end


-- Reset the player's faction status if they choose to on a higher difficulty
local factionReset = false
local factionResetTokens = false

function gd.quests.areaDQuestExile.factionReset()

	if not factionReset then
		local player = Game.GetLocalPlayer()
		factionReset = true
		player:SetFaction("USER4", 0)

	end

end

-- replace player tokens if they reset their faction and load on a previous difficulty
function gd.quests.areaDQuestExile.factionResetTokens()

	if not factionResetTokens then
		local player = Game.GetLocalPlayer()
		
		if ((player:HasToken("EXILE_TRUST") && player:GetFaction("USER4") < 0)) then
			factionResetTokens = true
			
			player:GiveToken("EXILE_RESET")
			player:RemoveToken("EXILE_TRUST")
			
		elseif ((player:HasToken("EXILE_SLAIN") || player:HasToken("EXILE_TIER2") || player:HasToken("EXILE_TIER3") || player:HasToken("EXILE_HOSTILE")) && player:GetFaction("USER4") > 0) then
			factionResetTokens = true
			
			player:GiveToken("EXILE_RESET")
			
			player:RemoveToken("EXILE_SLAIN")
			player:RemoveToken("EXILE_TIER2")
			player:RemoveToken("EXILE_TIER3")
			player:RemoveToken("EXILE_HOSTILE")
		
		end
		
	end

end

-- Dungeon Entrance
local dungeonDoor = 0

function gd.quests.areaDQuestExile.dungeonDoorOnAddToWorld(objectId)
	
	if Server then
		dungeonDoor = objectId
		local door = Door.Get(objectId)
		local player = Game.GetLocalPlayer()
		
		if (player:HasToken("AREAD_EXILEDUNGEON_OPEN") || player:HasToken("EXILE_HATE")|| player:HasToken("EXILE_TRUST")) then
			door:SetLocked(false)
			door:Open()
		
		end
		
	end
	
end

function gd.quests.areaDQuestExile.dungeonDoorUnlock()
	
	if Server then
		local door = Door.Get(dungeonDoor)	
	
		if door ~= nil then
			door:SetLocked(false)
			door:Open()
		
		end
		
	end

end


--
-- Outcast's Quest Target spawns. Spawn when quest initiated, and then spawn forever
--
local skeletonTargetID = 0
local spawnedSkeletonTarget = false
local chthonicTargetID = 0
local spawnedChthonicTarget = false
local aetherialTargetID = 0
local spawnedAetherialTarget = false

local OutcastTargetsState = { Default = 0, Spawned = 1 }


-- Skeleton Target
local skeletonStateObjects = orderedTable()
	skeletonStateObjects["OUTCAST_QUEST3_SPAWN"	] = { state = OutcastTargetsState.Spawned, dbr = "records/creatures/enemies/boss&quest/skeleton_outcastquesttarget.dbr"}
	skeletonStateObjects[""					 	] = { state = OutcastTargetsState.Default, dbr = nil }

local function CharacterCreateSkeletonArgs()

	local averageLevel = Game.GetAveragePlayerLevel()
	local bossLevel = 0
	local maxLevel = 0
	local originPoint = Entity.Get(skeletonTargetID):GetCoords().origin

	if (Game.GetGameDifficulty() == Game.Difficulty.Normal) then
		maxLevel = 60
	elseif (Game.GetGameDifficulty() == Game.Difficulty.Epic) then
		maxLevel = 75
	else
		maxLevel = 200
	end
	
	if (averageLevel > maxLevel) then
		bossLevel = ((maxLevel+(maxLevel/50))+3)
	else
		bossLevel = ((averageLevel+(averageLevel/50))+3)

	end
	
	if bossLevel > maxLevel then
		originPoint = nil
	
	end
	--Grimmest
	originPoint = nil

	return bossLevel, originPoint
	
end

function gd.quests.areaDQuestExile.quest03OnAddToWorld(objectId)
	if Server then
		if (not spawnedSkeletonTarget) then
			skeletonTargetID = objectId
	
			local userdata = {}
			local didWork, newState = TokenStateBasedObjectSwap(objectId, userdata, skeletonStateObjects, Character, CharacterCreateSkeletonArgs)
	
			Shared.setUserdata(objectId, userdata)
	
			-- Don't respawn the Target next time. If spawned as hostile, will be saved into the world
			if (newState == OutcastTargetsState.Spawned) then
				spawnedSkeletonTarget = true
				
			end
			
		end
	
	end
	
end

gd.quests.areaDQuestExile.quest03OnDestroy = ClearObjectUserdata


function gd.quests.areaDQuestExile.quest03Spawn()
	if Server then
		local player = Game.GetLocalPlayer()
		
		if player:HasToken("OUTCAST_QUEST3_SPAWN") && not spawnedSkeletonTarget then
			local entity = Entity.Get(skeletonTargetID)
			
			if entity != nil then
				local didWork, newState = UpdateObjectSwap(skeletonTargetID, skeletonStateObjects, Character, CharacterCreateSkeletonArgs)
		
				-- Don't respawn the Target next time.
				if (newState == OutcastTargetsState.Spawned) then
					spawnedSkeletonTarget = true
					
				end
			
			end
			
		end
	
	end

end


-- Chthonic Target
local chthonianStateObjects = orderedTable()
	chthonianStateObjects["OUTCAST_QUEST4_SPAWN"	] = { state = OutcastTargetsState.Spawned, dbr = "records/creatures/enemies/boss&quest/chthonianmonstrosity_outcastquesttarget.dbr"}
	chthonianStateObjects[""					 	] = { state = OutcastTargetsState.Default, dbr = nil }

local function CharacterCreateChthonianArgs()

	local averageLevel = Game.GetAveragePlayerLevel()
	local bossLevel = 0
	local maxLevel = 0
	local originPoint = Entity.Get(chthonicTargetID):GetCoords().origin

	if (Game.GetGameDifficulty() == Game.Difficulty.Normal) then
		maxLevel = 60
	elseif (Game.GetGameDifficulty() == Game.Difficulty.Epic) then
		maxLevel = 75
	else
		maxLevel = 200
	end
	
	if (averageLevel > maxLevel) then
		bossLevel = ((maxLevel+(maxLevel/50))+3)
	else
		bossLevel = ((averageLevel+(averageLevel/50))+3)

	end
	
	if bossLevel > maxLevel then
		originPoint = nil
	end
	--Grimmest
	originPoint = nil

	return bossLevel, originPoint
	
end

function gd.quests.areaDQuestExile.quest04OnAddToWorld(objectId)
	if Server then
		if (not spawnedChthonicTarget) then
			chthonicTargetID = objectId
	
			local userdata = {}
			local didWork, newState = TokenStateBasedObjectSwap(objectId, userdata, chthonianStateObjects, Character, CharacterCreateChthonianArgs)
	
			Shared.setUserdata(objectId, userdata)
	
			-- Don't respawn the Target next time. If spawned as hostile, will be saved into the world
			if (newState == OutcastTargetsState.Spawned) then
				spawnedChthonicTarget = true
				
			end
			
		end
	
	end
	
end

gd.quests.areaDQuestExile.quest04OnDestroy = ClearObjectUserdata


function gd.quests.areaDQuestExile.quest04Spawn()
	if Server then
		local player = Game.GetLocalPlayer()
		
		if player:HasToken("OUTCAST_QUEST4_SPAWN") && not spawnedChthonicTarget then
			local entity = Entity.Get(chthonicTargetID)
			
			if entity != nil then
				local didWork, newState = UpdateObjectSwap(chthonicTargetID, chthonianStateObjects, Character, CharacterCreateChthonianArgs)
		
				-- Don't respawn the Target next time.
				if (newState == OutcastTargetsState.Spawned) then
					spawnedChthonicTarget = true
					
				end
			
			end
			
		end
	
	end

end


-- Aetherial Target
local aetherialStateObjects = orderedTable()
	aetherialStateObjects["OUTCAST_QUEST5_SPAWN"	] = { state = OutcastTargetsState.Spawned, dbr = "records/creatures/enemies/boss&quest/humanpossessed_outcastquesttarget.dbr"}
	aetherialStateObjects[""					 	] = { state = OutcastTargetsState.Default, dbr = nil }

local function CharacterCreateAetherialArgs()

	local averageLevel = Game.GetAveragePlayerLevel()
	local bossLevel = 0
	local maxLevel = 0
	local originPoint = Entity.Get(aetherialTargetID):GetCoords().origin

	if (Game.GetGameDifficulty() == Game.Difficulty.Normal) then
		maxLevel = 60
	elseif (Game.GetGameDifficulty() == Game.Difficulty.Epic) then
		maxLevel = 75
	else
		maxLevel = 200
	end
	
	if (averageLevel > maxLevel) then
		bossLevel = ((maxLevel+(maxLevel/50))+3)
	else
		bossLevel = ((averageLevel+(averageLevel/50))+3)

	end
	
	if bossLevel > maxLevel then
		originPoint = nil
	end
	--Grimmest
	originPoint = nil

	return bossLevel, originPoint
	
end

function gd.quests.areaDQuestExile.quest05OnAddToWorld(objectId)
	if Server then
		if (not spawnedAetherialTarget) then
			aetherialTargetID = objectId
	
			local userdata = {}
			local didWork, newState = TokenStateBasedObjectSwap(objectId, userdata, aetherialStateObjects, Character, CharacterCreateAetherialArgs)
	
			Shared.setUserdata(objectId, userdata)
	
			-- Don't respawn the Target next time. If spawned as hostile, will be saved into the world
			if (newState == OutcastTargetsState.Spawned) then
				spawnedAetherialTarget = true
				
			end
			
		end
	
	end
	
end

gd.quests.areaDQuestExile.quest05OnDestroy = ClearObjectUserdata


function gd.quests.areaDQuestExile.quest05Spawn()
	if Server then
		local player = Game.GetLocalPlayer()
		
		if player:HasToken("OUTCAST_QUEST5_SPAWN") && not spawnedAetherialTarget then
			local entity = Entity.Get(aetherialTargetID)
			
			if entity != nil then
				local didWork, newState = UpdateObjectSwap(aetherialTargetID, aetherialStateObjects, Character, CharacterCreateAetherialArgs)
		
				-- Don't respawn the Target next time.
				if (newState == OutcastTargetsState.Spawned) then
					spawnedAetherialTarget = true
					
				end
			
			end
			
		end
	
	end

end


