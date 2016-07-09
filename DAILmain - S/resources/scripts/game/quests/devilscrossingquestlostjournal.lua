/*
	
	GRIM DAWN
	scripts/quests/devilscrossing.lua
	
	For more information, visit us at http://www.grimdawn.com
	
*/

gd.quests.devilsCrossingQuestLostJournal = {}

--
-- Direni in the Devil's Crossing Prison
--

local traitorId = 0
local spawnedTraitor = false
local traitorMineId = 0
local spawnedMine = false
local blockadeId = 0

local TraitorState = { Peaceful = 0, Hostile = 1, Dead = 2, Mine = 3, Boss = 4 }

local traitorStateObjects = orderedTable()
	traitorStateObjects["DC_TRAITOR_BOSS"] = { state = TraitorState.Boss,  dbr = nil }
	traitorStateObjects["DC_TRAITOR_MINE"]   = { state = TraitorState.Mine,    dbr = nil }
	traitorStateObjects["DC_TRAITOR_DEAD"] 	   = { state = TraitorState.Dead,      dbr = nil }
	traitorStateObjects["DC_TRAITOR_HOSTILE"]  = { state = TraitorState.Hostile,   dbr = "records/creatures/enemies/boss&quest/direni_hostile.dbr" }
	traitorStateObjects[""] 				   = { state = TraitorState.Peaceful,  dbr = "records/creatures/npcs/questnpcs/npc_direni_01.dbr" }
		
local function GetTraitorMaxLevel()

	local maxLevel = 0
	local averageLevel = Game.GetAveragePlayerLevel()
	local traitorLevel = 0

	traitorLevel = ((averageLevel+(averageLevel/50))+3)

	--Grimmest changes 15;65;85;
	if (Game.GetGameDifficulty() == Game.Difficulty.Normal) then
		maxLevel = traitorLevel + 5
	elseif (Game.GetGameDifficulty() == Game.Difficulty.Epic) then
		maxLevel = traitorLevel + 10
	else
		maxLevel = traitorLevel + 20
	end
	
	return maxLevel
	
end
		
local function CharacterCreateArgs()

	return GetTraitorMaxLevel(), nil
	
end
		
function gd.quests.devilsCrossingQuestLostJournal.traitorOnAddToWorld(objectId)

	if Server then
	
		if (not spawnedTraitor) then

			traitorId = objectId

			-- Create peaceful or hostile Direni
			local userdata = {}
			local didWork, newState = TokenStateBasedObjectSwap(objectId, userdata, traitorStateObjects, Character, CharacterCreateArgs)
			
			Shared.setUserdata(objectId, userdata)

			-- Don't respawn Direni next time if we spawned as hostile, he will be saved into the world
			if (newState == TraitorState.Hostile) then
				spawnedTraitor = true
			end
			
		end
		
	end
	
end

gd.quests.devilsCrossingQuestLostJournal.traitorOnDestroy = ClearObjectUserdata

-- Called by conversation, switches Direni to hostile
function gd.quests.devilsCrossingQuestLostJournal.hostileSwitch()

	if Server then
		if not spawnedTraitor then
			spawnedTraitor = true
			
			-- Update Direni
			local player = Game.GetLocalPlayer()
			local MPOverrideDbr = nil
			local MPOverrideState = false

			if (player:HasToken("DC_TRAITOR_HOSTILE") == false) then
				MPOverrideDbr = "records/creatures/enemies/boss&quest/direni_hostile.dbr"
				MPOverrideState = true
			end
			
			local didWork, newState = UpdateObjectSwap(traitorId, traitorStateObjects, Character, CharacterCreateArgs, MPOverrideState, MPOverrideDbr)

		
		end
	
	end
	
end

--
-- Lost journal item
--

function gd.quests.devilsCrossingQuestLostJournal.lootJournal(looterId, itemId)

	if looterId == Game.GetLocalPlayer():GetId() then
		local kQuest_LostJournal = 0x63541000;
		local kTask_ReturnJournal = 0xC2B2B800;
		local player = Player.Get(looterId);
		
		local questState = player:GetQuestState(kQuest_LostJournal)

		if (player != nil) && (questState == QuestState.Available) && (player:HasToken("DC_TRAITOR_MINE") == false) && (player:HasToken("DC_TRAITOR_BOSS") == false) then
			player:GrantQuest(kQuest_LostJournal, kTask_ReturnJournal)
			
		end
	
	end
	
end

--
-- Direni in Mine, AreaB
--
local direniMineStateObjects = orderedTable()
	direniMineStateObjects["DC_TRAITOR_BOSS"] = { state = TraitorState.Boss, dbr = "records/creatures/enemies/boss&quest/direni_hostile02.dbr" }
	direniMineStateObjects["DC_TRAITOR_MINE"]   = { state = TraitorState.Mine,   dbr = "records/creatures/npcs/questnpcs/npc_direni_02.dbr" }
	direniMineStateObjects["DC_TRAITOR_DEAD"] 	= { state = TraitorState.Dead,     dbr = nil }
	direniMineStateObjects["DC_TRAITOR_HOSTILE"]  = { state = TraitorState.Hostile,  dbr = nil }
	direniMineStateObjects[""] 					= { state = TraitorState.Peaceful, dbr = nil }

	--[[ PrincessLuna fix from forums
local function CharacterCreateArgs()

	return 0, Entity.Get(traitorMineId):GetCoords().origin
	
end
	--]]
		
function gd.quests.devilsCrossingQuestLostJournal.direniMineOnAddToWorld(objectId)

	if Server then
	
		if (not spawnedMine) then
			traitorMineId = objectId
			
			local userdata = {}
			local didWork, newState = TokenStateBasedObjectSwap(objectId, userdata, direniMineStateObjects, Character, CharacterCreateArgs)
			
			Shared.setUserdata(objectId, userdata)
			
			--Don't respawn Direni next time. If spawned as hostile, will be saved into the world
			if (newState == TraitorState.Boss) then
				spawnedMine = true
			end
		end
		
	end
	
end

gd.quests.devilsCrossingQuestLostJournal.direniMineOnDestroy = ClearObjectUserdata


--
-- Trigger Direni's Mine Spawn
--
local direniMineTrigger = false

function gd.quests.devilsCrossingQuestLostJournal.direniMineTriggeredGlobalMP()

	local player = Game.GetLocalPlayer()
	local kQuest_LostJournal = 0x63541000
	local questState = player:GetQuestState(kQuest_LostJournal)
		
	if (player != nil) && (player:HasToken("DC_TRAITOR_MINE") == false) && (player:HasToken("DC_TRAITOR_BOSS") == false) then
		if (player:HasToken("DC_TRAITOR_SPARED") || ((questState != QuestState.InProgress) && player:HasToken("DC_TRAITOR_DEAD") == false)) then
			
			player:GiveToken("DC_TRAITOR_MINE")

		end
		
	end

end

function gd.quests.devilsCrossingQuestLostJournal.direniMineSpawn()

	if Server then
		if (direniMineTrigger == false && spawnedTraitor == false) then
			direniMineTrigger = true
			
			local player = Game.GetLocalPlayer()
			local kQuest_LostJournal = 0x63541000
			local questState = player:GetQuestState(kQuest_LostJournal)
		
			local traitorTown = Entity.Get(traitorId)
			local traitorMine = Entity.Get(traitorMineId)
		
			if (player != nil) && (player:HasToken("DC_TRAITOR_MINE") == false) && (player:HasToken("DC_TRAITOR_BOSS") == false) then
				if (player:HasToken("DC_TRAITOR_SPARED") || ((questState != QuestState.InProgress) && player:HasToken("DC_TRAITOR_DEAD") == false)) then
					print "triggered direni mine spawn"
					
					player:GiveToken("DC_TRAITOR_MINE")
				
					if (traitorMine != nil) then
						UpdateObjectSwap(traitorMineId, direniMineStateObjects)
					
					end
				
					if (traitorTown != nil) then
						UpdateObjectSwap(traitorId, traitorStateObjects)
					
					end

				end
			
			end
			
			QuestGlobalEvent("direniMineSpawnToken")
		
		end
	
	end
	
end

function gd.quests.devilsCrossingQuestLostJournal.direniMineTriggered(triggererId)

	QuestEvent("direniMineSpawn")
	
end

--
-- Swap Mine Direni to Hostile upon conversation trigger
--
local direniMineHostileSwap = false

function gd.quests.devilsCrossingQuestLostJournal.direniMineHostileSwitch()

	if Server then
		if not direniMineHostileSwap then	
			direniMineHostileSwap = true
			local player = Game.GetLocalPlayer()
		
			if (player:HasToken("DC_TRAITOR_MINE")) then
				player:GiveToken("DC_TRAITOR_BOSS")
				player:RemoveToken("DC_TRAITOR_MINE")
			end
			
			local didWork, newState = UpdateObjectSwap(traitorMineId, direniMineStateObjects, Character, CharacterCreateArgs)
		
			--Don't respawn Direni next time. If spawned as hostile, will be saved into the world
			if (newState == TraitorState.Boss) then
				spawnedMine = true
			end
		
		end
	
	end

end

local direniDoor = 0

function gd.quests.devilsCrossingQuestLostJournal.direniDoorOnAddToWorld(objectId)

	if Server then
	
		local player = Game.GetLocalPlayer()
		local kQuest_LostJournal = 0x63541000
		local questState = player:GetQuestState(kQuest_LostJournal)
		print "Door Loaded!"
		direniDoor = objectId	
		local door = Door.Get(objectId)
		
		if ((questState == QuestState.InProgress) || player:HasToken("DC_TRAITOR_DEAD")) then
			-- Player is on Lost Journal quest or Direni is already dead. Unlock door.
			door:Open()
			print "Door Opened!"	
		end
		
	end
	
end

function gd.quests.devilsCrossingQuestLostJournal.direniDoorOpen()

	if Server then
	
		print "Telling Door to Open!"
		
		local door = Door.Get(direniDoor)
		
		if door ~= nil then
			door:Open()
			print "Door Opened!"	
		end
		
	end

end


--
-- Hidden cellar door
--

local hiddenCellarDoorId = 0

function gd.quests.devilsCrossingQuestLostJournal.hiddenCellarOnAddToWorld(objectId)

	if Server then
	
		hiddenCellarDoorId = objectId;
		
		local door = Door.Get(objectId)
		local player = Game.GetLocalPlayer()

		if (player:HasToken("WIGHTMIRE_CULTIST_CELLAR_UNLOCKED")) then
			-- Player already unlocked this door
			door:SetLocked(false)
		end
		
	end
		
end


function gd.quests.devilsCrossingQuestLostJournal.cellarDoorOnInteractGlobalMP()

	GiveTokenToLocalPlayer("WIGHTMIRE_CULTIST_CELLAR_UNLOCKED")

end

function gd.quests.devilsCrossingQuestLostJournal.cellarDoorOnInteract(objectId, userId)

	local player = Player.Get(userId)
	local door = Door.Get(objectId)
		
	if ((door != nil) && (door:IsLocked())) then
		if player:HasItem("records/storyelements/questitems/cultistkey.dbr", 1, false) then
			-- Consume key to unlock door		
			door:SetLocked(false)
			door:Open()

			QuestGlobalEvent("unlockCultistCellarToken")
				
			player:TakeItem("records/storyelements/questitems/cultistkey.dbr", 1, false)
				
		end
		
	end
	
end

--
-- Grant quest from key item
--
function gd.quests.devilsCrossingQuestLostJournal.lootKey(looterId, itemId)

	if looterId == Game.GetLocalPlayer():GetId() then
		local kQuest_StrangeKey = 0xD8AC3F00
		local kTask_HasKey = 0x144F3240
		local player = Player.Get(looterId)
		
		local questTaskState = player:GetQuestTaskState(kQuest_StrangeKey, kTask_HasKey)

		if (player != nil) then
			if (questTaskState != QuestState.InProgress && questTaskState != QuestState.Complete) then
				player:GrantQuest(kQuest_StrangeKey, kTask_HasKey)
				
			end
			
		end
	
	end
	
end

--
-- Give out the token for sparing Direni
--
function gd.quests.devilsCrossingQuestLostJournal.direniSparedTokenGlobalMP()

	local player = Game.GetLocalPlayer()

	local kQuest_Direni = 0x63541000
	local kTask_Direni = 0xC2B2B800

	local questTaskState = player:GetQuestTaskState(kQuest_Direni, kTask_Direni)
	
	if (player != nil && questTaskState == QuestState.InProgress) then
		player:GiveToken("DC_TRAITOR_SPARED")

	end
	
end
