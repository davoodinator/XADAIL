/*
	
	GRIM DAWN
	
	For more information, visit us at http://www.grimdawn.com
	
*/

gd.quests.roverLegacy = {}

--
-- Shrine
-- The Shrine spawns locked, but is unlocked if host is on the quest or a client begins the quest during the session.
-- Credit can be earned for the quest retroactively in the case that player is not on the quest, but participates
--
local shrineId = 0
local shrineUnlocked = false
local shrineRestored = false

function gd.quests.roverLegacy.shrineOnAddToWorld(objectId)

	if Server then
		shrineId = objectId
		
		local shrine = Shrine.Get(objectId)
		local player = Game.GetLocalPlayer()

		if (player:HasToken("MOGDROGENSHRINE_SPAWN") || player:HasToken("MOGDROGENSHRINE_REPAIRED")) then
			shrine:SetLocked(false)
		end
	
	end

end

-- Spawn the chests that contain the two parts of the shrine
local ShrineState = { Default = 0, Active = 1, Cleansed = 2 }

local shrinePart1Id = 0
local shrinePart2Id = 0

local shrinePart1Spawned = false
local shrinePart2Spawned = false

local shrinePart1StateObjects = orderedTable()
	shrinePart1StateObjects["MOGDROGENSHRINE_SPAWN"	] = { state = ShrineState.Active,  dbr = "records/items/questitems/quest_mogdrogenshrine_01.dbr"}
	shrinePart1StateObjects[""					 	] = { state = ShrineState.Default, dbr = nil }

function gd.quests.roverLegacy.shrinePart1OnAddToWorld(objectId)

	if Server then
	
		if (not shrinePart1Spawned) then
			shrinePart1Id = objectId

			local userdata = {}
			local didWork, newState = TokenStateBasedObjectSwap(objectId, userdata, shrinePart1StateObjects)
			Shared.setUserdata(objectId, userdata)
			
			-- Don't respawn Chest. If spawned as chest, saved into world
			if (newState == ShrineState.Active) then
				shrinePart1Spawned = true
				
			end
			
		end
		
	end
	
end

gd.quests.roverLegacy.shrinePart1OnDestroy = ClearObjectUserdata

local shrinePart2StateObjects = orderedTable()
	shrinePart2StateObjects["MOGDROGENSHRINE_SPAWN"	] = { state = ShrineState.Active,  dbr = "records/items/questitems/quest_mogdrogenshrine_02.dbr"}
	shrinePart2StateObjects[""					 	] = { state = ShrineState.Default, dbr = nil }

function gd.quests.roverLegacy.shrinePart2OnAddToWorld(objectId)

	if Server then
	
		if (not shrinePart2Spawned) then
			shrinePart2Id = objectId

			local userdata = {}
			local didWork, newState = TokenStateBasedObjectSwap(objectId, userdata, shrinePart2StateObjects)
			Shared.setUserdata(objectId, userdata)
			
			-- Don't respawn Chest. If spawned as chest, saved into world
			if (newState == ShrineState.Active) then
				shrinePart2Spawned = true
				
			end
			
		end
		
	end
	
end

gd.quests.roverLegacy.shrinePart2OnDestroy = ClearObjectUserdata

-- Initial Spawn for the Shrine Part chests and unlocking of the shrine
local spawnParts = false

function gd.quests.roverLegacy.spawnParts()

	if Server then
		if not spawnParts then
			spawnParts = true
			
			-- unlock the shrine
			local shrine = Shrine.Get(shrineId)
			local player = Game.GetLocalPlayer()

			if (shrine !=nil && (player:HasToken("MOGDROGENSHRINE_SPAWN") || player:HasToken("MOGDROGENSHRINE_REPAIRED"))) then
				shrine:SetLocked(false)
			end
			
			-- spawn shrine parts in the world
			local shrinePart01 = Entity.Get(shrinePart1Id)
			local shrinePart02 = Entity.Get(shrinePart2Id)
			
			local player = Game.GetLocalPlayer()
			local MPOverrideState = false
			local MPOverrideDbr01 = nil
			local MPOverrideDbr02 = nil
			
			if (player:HasToken("MOGDROGENSHRINE_SPAWN") == false) then
				MPOverrideState = true
				MPOverrideDbr01 = "records/items/lootchests/questchests/questchest_roverlegacy_part01.dbr"
				MPOverrideDbr02 = "records/items/lootchests/questchests/questchest_roverlegacy_part02.dbr"
			end
		
			if (shrinePart01 != nil) then
				UpdateObjectSwap(shrinePart1Id, shrinePart1StateObjects, nil, nil, MPOverrideState, MPOverrideDbr01)
				shrinePart1Spawned = true
			end
		
			if (shrinePart02 != nil) then			
				UpdateObjectSwap(shrinePart2Id, shrinePart2StateObjects, nil, nil, MPOverrideState, MPOverrideDbr02)
				shrinePart2Spawned = true
			end
		
		end
	
	end

end


-- Avatar of Mogdrogen
local mogdrogenId = 0
local mogdrogenHostile = false

local function CharacterCreateArgs()

	local averageLevel = Game.GetAveragePlayerLevel()
	local monsterLevel = 0
	local minLevel = 0
	local maxLevel = 0

	if (Game.GetGameDifficulty() == Game.Difficulty.Normal) then
		minLevel = 65
		maxLevel = 65
	elseif (Game.GetGameDifficulty() == Game.Difficulty.Epic) then
		minLevel = 90
		maxLevel = 100
	else
		minLevel = 90
		maxLevel = 100
	end
	
	if (averageLevel < minLevel) then
		monsterLevel = ((minLevel+(minLevel/50))+5)
	elseif (averageLevel > maxLevel) then
		monsterLevel = ((maxLevel+(maxLevel/50))+5)
	else
		monsterLevel = ((averageLevel+(averageLevel/50))+5)

	end

	return monsterLevel, nil

end

local mogdrogenStateObjects = orderedTable()
	mogdrogenStateObjects["MOGDROGENSHRINE_CLEANSED"	] = { state = ShrineState.Cleansed,  dbr = "records/creatures/npcs/questnpcs/gdareab/npc_avatarofmogdrogen_01.dbr"}
	mogdrogenStateObjects[""					 	] = { state = ShrineState.Default, dbr = nil }

function gd.quests.roverLegacy.mogdrogenOnAddToWorld(objectId)

	if Server then
		if not mogdrogenHostile then
			mogdrogenId = objectId

			local userdata = {}
			TokenStateBasedObjectSwap(objectId, userdata, mogdrogenStateObjects)
			Shared.setUserdata(objectId, userdata)
		
		end
		
	end
	
end

gd.quests.roverLegacy.mogdrogenOnDestroy = ClearObjectUserdata


-- Avatar of Mogdrogen Hostile
function gd.quests.roverLegacy.avatarHostileTokenMP()
	
	GiveTokenToLocalPlayer("MOGDROGENAVATAR_HOSTILE")
	
end

-- Avatar of Mogdrogen Killed
function gd.quests.roverLegacy.avatarKilled()
	
	GiveTokenToLocalPlayer("MOGDROGENAVATAR_KILLED")
	
end

-- Swap out Mogdrogen to a boss for this session only
function gd.quests.roverLegacy.hostileSwitch()
	
	if Server then
		if not mogdrogenHostile then
			mogdrogenHostile = true
			local player = Game.GetLocalPlayer()
			local MPOverrideDbr = nil
			
			if (Game.GetGameDifficulty() == Game.Difficulty.Normal) then
				MPOverrideDbr = "records/creatures/enemies/boss&quest/avatarofmogdrogen_01.dbr"
			else
				MPOverrideDbr = "records/creatures/enemies/boss&quest/avatarofmogdrogen_02.dbr"
			end
			
			local MPOverrideState = true

			UpdateObjectSwap(mogdrogenId, mogdrogenStateObjects, Character, CharacterCreateArgs, MPOverrideState, MPOverrideDbr)
			
			QuestGlobalEvent("avatarMogdrogenHostileToken")
			GiveTokenToLocalPlayer("MOGDROGENAVATAR_HOSTILE")

		end
	
	end

end


-- Cultist Camp Spawns
local cultistsId = 0
local cultistSpawned = false

local function CreateProxyArgs()

	local entity = Entity.Get(cultistsId)
	local coords = entity:GetCoords()
	local levelLimitLocation = nil

	if (entity != nil) then
		levelLimitLocation = coords.origin
	end

	return levelLimitLocation
	
end

local cultistsStateObjects = orderedTable()
	cultistsStateObjects["MOGDROGENSHRINE_CLEANSED"	] = { state = ShrineState.Cleansed,  dbr = nil }
	cultistsStateObjects[""					 	] = { state = ShrineState.Default, dbr = "records/proxies/boss&quest/proxy_aread_roverlegacy_cultists.dbr"}

function gd.quests.roverLegacy.cultistsOnAddToWorld(objectId)

	if Server then
		if not cultistSpawned then
			cultistsId = objectId

			local userdata = {}
			local didWork, newState = TokenStateBasedObjectSwap(objectId, userdata, cultistsStateObjects, Proxy, CreateProxyArgs)
			
			Shared.setUserdata(objectId, userdata)
			
			-- Don't respawn cultists next time if already spawned.
			if (newState == ShrineState.Default) then
				cultistSpawned = true
				
			end
		end
		
	end
	
end

gd.quests.roverLegacy.cultistsOnDestroy = ClearObjectUserdata


-- Shrine of Mogdrogen Wave Event
local waveObjectId = 0

local waveEventStarted = false
local waveEventKey = "MOGDROGENSHRINE_WAVEEVENT"

function gd.quests.roverLegacy.chthonianAttackOnAddToWorld(objectId)

	if Server then
		waveObjectId = objectId
		WaveEvent_OnAddToWorld(objectId, waveEventKey)
	
	end

end

function gd.quests.roverLegacy.chthonianAttackOnRemoveFromWorld(objectId)

	if Server then
		WaveEvent_OnRemoveFromWorld(objectId)
	
	end
	
end

function gd.quests.roverLegacy.endWaveEventGlobalMP()
	-- Bestows quest token if player is on the quest
	local player = Game.GetLocalPlayer()
	local kQuest = 0x5BF24780
	local kTask = 0x1348AB80
	local questTaskState = player:GetQuestTaskState(kQuest, kTask)
	
	if (player:HasToken("MOGDROGENSHRINE_REPAIRED") || questTaskState == QuestState.InProgress) then
		player:GiveToken("MOGDROGENSHRINE_CLEANSED")
	
	end

end

function gd.quests.roverLegacy.endWaveEvent(objectId)

	if Server then
	
		QuestGlobalEvent("roverLegacyEndEvent")
	
		-- Swap in Mogdrogen
		local mogdrogen = Entity.Get(mogdrogenId)
		
		local player = Game.GetLocalPlayer()
		local MPOverrideState = false
		local MPOverrideDbr01 = nil
		
		if (player:HasToken("MOGDROGENSHRINE_CLEANSED") == false) then
			MPOverrideState = true
			MPOverrideDbr01 = "records/creatures/npcs/questnpcs/gdareab/npc_avatarofmogdrogen_01.dbr"
			
		end
	
		if (mogdrogen != nil) then
			local coords = mogdrogen:GetCoords()
			local rift = Entity.Create("records/fx/ui/riftgateghostlyopen_fx02pak.dbr")
		
			if (rift != nil) then
				rift:NetworkEnable()
				rift:SetCoords(coords)
			
			end
			
			UpdateObjectSwap(mogdrogenId, mogdrogenStateObjects, nil, nil, MPOverrideState, MPOverrideDbr01)
			
		end

	end
	
end

local waveParameters = { }
	waveParameters.waves = {"records/proxies/boss&quest/proxy_aread_roverlegacy_wave1.dbr", "records/proxies/boss&quest/proxy_aread_roverlegacy_wave2.dbr", "records/proxies/boss&quest/proxy_aread_roverlegacy_wave3.dbr"}
	waveParameters.endCallback = gd.quests.roverLegacy.endWaveEvent
	waveParameters.key = waveEventKey
	
function gd.quests.roverLegacy.triggerWaveEventMP()

	if Server then
		local player = Game.GetLocalPlayer()
		
		if (not waveEventStarted && player:HasToken("MOGDROGENSHRINE_BATTLE")) then
			waveEventStarted = true
			WaveEvent_Start(waveObjectId, waveParameters)
			
			UI.Notify("tagNotification_HS_RoverLegacy_Chthonians")
		
		end
		
	end

end
	
function gd.quests.roverLegacy.startWaveEvent(triggererId)

	QuestEvent("roverLegacyTriggerEvent")

end


-- Grant token for repairing shrine to all players and begin the wave event
function gd.quests.roverLegacy.shrineRestoredGlobalMP()

	if not shrineRestored then
		shrineRestored = true
		GiveTokenToLocalPlayer("MOGDROGENSHRINE_REPAIRED")
		
	end
	
end

function gd.quests.roverLegacy.shrineRestored()
	
	if Server then
		local player = Game.GetLocalPlayer()
		local kQuest = 0x5BF24780
		local kTask = 0x7F4AF980
		local questTaskState = player:GetQuestTaskState(kQuest, kTask)
		
		if (questTaskState == QuestState.InProgress) then
			player:GiveToken("MOGDROGENSHRINE_BATTLE")
		
		end
	
		GiveTokenToLocalPlayer("MOGDROGENSHRINE_REPAIRED")
		
		if (not waveEventStarted && player:HasToken("MOGDROGENSHRINE_CLEANSED") == false) then
			waveEventStarted = true
			WaveEvent_Start(waveObjectId, waveParameters)
			
			UI.Notify("tagNotification_HS_RoverLegacy_Chthonians")
		
		end
		
		QuestGlobalEvent("roverLegacyRepairShrine")
	
	end

end



