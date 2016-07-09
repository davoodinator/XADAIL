/*
	
	GRIM DAWN
	
	For more information, visit us at http://www.grimdawn.com
	
*/

gd.quests.areaCQuestNecros = {}



--
-- Malkadarr's remains only spawn if player is on the quest
--
local corpseId = 0
local spawnedCorpse = false

local CorpseState = { Default = 0, Spawned = 1 }

local corpseStateObjects = orderedTable()
	corpseStateObjects["NECRO_QUEST1_SPAWN"	] = { state = CorpseState.Spawned,  dbr = "records/items/lootchests/questchests/questchest_malkadarrremains_break.dbr"}
	corpseStateObjects[""					 	] = { state = CorpseState.Default, dbr = nil }

function gd.quests.areaCQuestNecros.corpseOnAddToWorld(objectId)

	if Server then
	
		if (not spawnedCorpse) then
			corpseId = objectId

			local userdata = {}
			local didWork, newState = TokenStateBasedObjectSwap(objectId, userdata, corpseStateObjects)
			Shared.setUserdata(objectId, userdata)
			
			-- Don't respawn corpse next time. If spawned as chest, saved into world
			if (newState == CorpseState.Spawned) then
				spawnedCorpse = true
				
			end
			
		end
		
	end
	
end

gd.quests.areaCQuestNecros.corpseOnDestroy = ClearObjectUserdata

function gd.quests.areaCQuestNecros.corpseSpawn()
	if Server then
		local player = Game.GetLocalPlayer()
		
		if player:HasToken("NECRO_QUEST1_SPAWN") && not spawnedCorpse then
			local entity = Entity.Get(corpseId)
	
			if entity != nil then
				local didWork, newState = UpdateObjectSwap(corpseId, corpseStateObjects)
		
				-- Don't respawn the corpse next time
				if (newState == CorpseState.Spawned) then
					spawnedCorpse = true
					
				end
			
			end
			
		end
	
	end

end

--
-- The Possessed only spawns if player is on the quest
--
local catalystId = 0
local spawnedCatalyst = false

local CatalystState = { Default = 0, Spawned = 1 }

local catalystStateObjects = orderedTable()
	catalystStateObjects["NECRO_QUEST3_SPAWN"	] = { state = CatalystState.Spawned, dbr = "records/creatures/enemies/boss&quest/humanpossessed_necrocatalyst01.dbr"}
	catalystStateObjects[""					 	] = { state = CatalystState.Default, dbr = nil }

local function CharacterCreateArgs()

	local averageLevel = Game.GetAveragePlayerLevel()
	local bossLevel = 0
	local maxLevel = 0
	local originPoint = Entity.Get(catalystId):GetCoords().origin

	if (Game.GetGameDifficulty() == Game.Difficulty.Normal) then
		maxLevel = 65
	elseif (Game.GetGameDifficulty() == Game.Difficulty.Epic) then
		maxLevel = 70
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

function gd.quests.areaCQuestNecros.catalystOnAddToWorld(objectId)
	if Server then
		if (not spawnedCatalyst) then
			catalystId = objectId
	
			local userdata = {}
			local didWork, newState = TokenStateBasedObjectSwap(objectId, userdata, catalystStateObjects, Character, CharacterCreateArgs)
	
			Shared.setUserdata(objectId, userdata)
	
			-- Don't respawn the Possessed next time. If spawned as hostile, will be saved into the world
			if (newState == CatalystState.Spawned) then
				spawnedCatalyst = true
				
			end
			
		end
	
	end
	
end

gd.quests.areaCQuestNecros.catalystOnDestroy = ClearObjectUserdata


function gd.quests.areaCQuestNecros.catalystSpawn()
	if Server then
		local player = Game.GetLocalPlayer()
		
		if player:HasToken("NECRO_QUEST3_SPAWN") && not spawnedCatalyst then
			local entity = Entity.Get(catalystId)
			
			if entity != nil then
				local didWork, newState = UpdateObjectSwap(catalystId, catalystStateObjects, Character, CharacterCreateArgs)
		
				-- Don't respawn the Possessed next time
				if (newState == CatalystState.Spawned) then
					spawnedCatalyst = true
					
				end
			
			end
			
		end
	
	end

end



--
-- Necro Ritual
--

-- Malkadarr Spawning
local malkadarrRitualId = 0
local malkadarrId = 0

local Malkadarr = { Default = 0, Regular = 1, Finished = 2 }

--Malkadarr in Sanctum
local malkadarrStateObjects = orderedTable()
	malkadarrStateObjects["NECRO_MALKADARR_AREAD"]	= { state = Malkadarr.Finished,  dbr = nil }
	malkadarrStateObjects["NECRO_RITUAL_FINISHED"]	= { state = Malkadarr.Regular,  dbr = "records/creatures/npcs/questnpcs/gdareac/npc_necro_malkadarr_01.dbr" }
	malkadarrStateObjects[""]					= { state = Malkadarr.Default,   dbr = nil }
	
function gd.quests.areaCQuestNecros.malkadarrOnAddToWorld(objectId)
	
	if Server then
	
		QuestGlobalEvent("orderDeathsVigilBountyReset")
		QuestGlobalEvent("factionResetToken")
		
		malkadarrId = objectId

		local userdata = {}
		TokenStateBasedObjectSwap(objectId, userdata, malkadarrStateObjects)
		Shared.setUserdata(objectId, userdata)
		
	end
	
end

gd.quests.areaCQuestNecros.malkadarrOnDestroy = ClearObjectUserdata

--Malkadarr in Ritual Chamber
function gd.quests.areaCQuestNecros.malkadarrRitualOnAddToWorld(objectId)
	
	if Server then
	
		malkadarrRitualId = objectId
		
	end
	
end

gd.quests.areaCQuestNecros.malkadarrRitualOnDestroy = ClearObjectUserdata


-- teleport Malkadarr to Necropolis
local malkadarrMoveToNecropolis = false

function gd.quests.areaCQuestNecros.swapMalkadarr()

	if Server then
		local player = Game.GetLocalPlayer()
	
		if not malkadarrMoveToNecropolis && player:HasToken("NECRO_MALKADARR_AREAD") then
			malkadarrMoveToNecropolis = true
			local malkadarrSanctum = Entity.Get(malkadarrId)
		
			if (malkadarrSanctum != nil) then
				local coords = malkadarrSanctum:GetCoords()
				local teleportStart = Entity.Create("records/fx/ui/riftgateghostlyopen_fx02pak.dbr")
			
				if (teleportStart != nil) then
					teleportStart:NetworkEnable()
					teleportStart:SetCoords(coords)
				
				end
		
				UpdateObjectSwap(malkadarrId, malkadarrStateObjects)
			
			end
		
		end
	
	end

end

--Soulkeeper at Ritual
local soulkeeperId = 0
local soulkeeperInRitual = false

local soulkeeperStateObjects = orderedTable()
	soulkeeperStateObjects["NECRO_RITUAL_FINISHED"]	= { state = Malkadarr.Finished,  dbr = "records/creatures/npcs/questnpcs/gdareac/npc_soulkeeper_01.dbr" }
	soulkeeperStateObjects[""]					= { state = Malkadarr.Default,   dbr = "records/creatures/npcs/questnpcs/gdareac/npc_soulkeeper_01.dbr" }
	
function gd.quests.areaCQuestNecros.soulkeeperOnAddToWorld(objectId)
	
	if Server then
		local MPOverrideDbr = nil
		local MPOverrideState = false
		
		soulkeeperId = objectId
		
		if soulkeeperInRitual then
			MPOverrideDbr = "records/creatures/npcs/questnpcs/gdareac/npc_soulkeeper_02.dbr"
			MPOverrideState = true
			
		end
		
		local userdata = {}
		TokenStateBasedObjectSwap(objectId, userdata, soulkeeperStateObjects, Character, nil, MPOverrideState, MPOverrideDbr)
		Shared.setUserdata(objectId, userdata)
		
	end
	
end

gd.quests.areaCQuestNecros.soulkeeperOnDestroy = ClearObjectUserdata

-- swap Soulkeeper during ritual
local soulkeeperSwap = false

function gd.quests.areaCQuestNecros.swapSoulkeeper()

	if Server then
		local player = Game.GetLocalPlayer()
		local MPOverrideDbr = nil
		local MPOverrideState = false
	
		if not soulkeeperSwap then
			if player:HasToken("NECRO_RITUAL_FINISHED") then
				soulkeeperSwap = true
				soulkeeperInRitual = false
			end
			
			if soulkeeperInRitual then
				MPOverrideDbr = "records/creatures/npcs/questnpcs/gdareac/npc_soulkeeper_02.dbr"
				MPOverrideState = true
				
			end
			
			local soulkeeperEntity = Entity.Get(soulkeeperId)
		
			if (soulkeeperEntity != nil) then
				UpdateObjectSwap(soulkeeperId, soulkeeperStateObjects, nil, nil, MPOverrideState, MPOverrideDbr)
			
			end
		
		end
	
	end

end


-- Door Control
local doorId = 0

function gd.quests.areaCQuestNecros.doorOnAddToWorld(objectId)
	if Server then
		doorId = objectId
		
		local door = Door.Get(objectId)
		local player = Game.GetLocalPlayer()

		if (player:HasToken("NECRO_RITUAL_STARTED") || player:HasToken("NECRO_RITUAL_FINISHED")) then
			-- Player already unlocked this door
			door:SetLocked(false)
			
			if player:HasToken("NECRO_RITUAL_FINISHED") then
				door:Open()
			
			end
			
		end

	end
	
end

-- unlocks the door if player starts the quest
function gd.quests.areaCQuestNecros.unlockDoor()
	if Server then
		local door = Door.Get(doorId)
		door:SetLocked(false)

	end
	
end

function gd.quests.areaCQuestNecros.endRitual()
	if Server then
		local door = Door.Get(doorId)
		
		if door != nil then
			door:Open()
			
		end
		
		-- swap Soulkeeper back to dialogue NPC
		gd.quests.areaCQuestNecros.swapSoulkeeper()
		
		-- Spawn Malkadarr in Ritual Chamber
		local coords = Entity.Get(malkadarrRitualId):GetCoords()
		local malkadarr = Character.Create("records/creatures/npcs/questnpcs/gdareac/npc_necro_malkadarr_01.dbr")
		
		if malkadarr != nil then
			malkadarr:SetCoords(coords)
			
		end
		
	end

end


-- Quest token for defeating boss while on quest
function gd.quests.areaCQuestNecros.bossKilled()
		local player = Game.GetLocalPlayer()

		if player:HasToken("NECRO_RITUAL_STARTED") then
			GiveTokenToLocalPlayer("NECRO_RITUAL_FINISHED")
		end
		
end


-- Ritual Wave Event
local ritualObjectId = 0

local ritualStarted = false
local ritualKey = "NECRORITUAL_WAVEEVENT"
local ritualParameters = { }
	ritualParameters.waves = {"records/proxies/boss&quest/proxy_areac_necroritualwave1.dbr", "records/proxies/boss&quest/proxy_areac_necroritualwave2.dbr", "records/proxies/boss&quest/proxy_areac_necroritualwave3.dbr", "records/proxies/boss&quest/proxy_areac_necroritualwave4.dbr", "records/proxies/boss&quest/proxy_areac_necroritualwave5.dbr"}
	ritualParameters.endCallback = gd.quests.areaCQuestNecros.endRitual
	ritualParameters.key = ritualKey
	
function gd.quests.areaCQuestNecros.ritualOnAddToWorld(objectId)

	if Server then
		ritualObjectId = objectId
		WaveEvent_OnAddToWorld(objectId, ritualKey)
	
	end

end

function gd.quests.areaCQuestNecros.ritualOnRemoveFromWorld(objectId)

	if Server then
		WaveEvent_OnRemoveFromWorld(objectId)
	
	end
	
end


	
function gd.quests.areaCQuestNecros.startRitualMP()

	if Server then
		if (not ritualStarted) then
			ritualStarted = true
			WaveEvent_Start(ritualObjectId, ritualParameters)
			
			-- swap Soulkeeper to ritual NPC
			soulkeeperInRitual = true
			gd.quests.areaCQuestNecros.swapSoulkeeper()
		
		end
		
	end

end

-- Old trigger function started by trigger volume instead of NPC dialogue
-- no longer used
function gd.quests.areaCQuestNecros.startRitual(triggererId)
	local player = Player.Get(triggererId)
	local kQuest = 0x418E3300
	local kTask = 0xC3260C00
	local questTaskState = player:GetQuestTaskState(kQuest, kTask)

	-- starts the ritual if entering player is on the quest and Host has not previously completed it
	if (player != nil) && (questTaskState == QuestState.InProgress && player:ServerHasToken("NECRO_RITUAL_FINISHED") == false) then
		QuestEvent("necroRitualSpawn")
	
	end

end


--
-- Search for Uroboruuk
--
local uroboruukQuestId = 0
local uroboruukQuestSpawned = false

local UroboruukQuestState = { Default = 0, Spawned = 1 }

local function UroboruukQuestCreateArgs()

	return 0, Entity.Get(uroboruukQuestId):GetCoords().origin
	
end

local uroboruukQuestStateObjects = orderedTable()
	uroboruukQuestStateObjects["NECRO_FINALQUEST"	] = { state = UroboruukQuestState.Spawned, dbr = "records/creatures/enemies/boss&quest/skeletalgolem_uroboruuksearch_01.dbr"}
	uroboruukQuestStateObjects[""					 	] = { state = UroboruukQuestState.Default, dbr = nil }

function gd.quests.areaCQuestNecros.uroboruukQuestOnAddToWorld(objectId)
	if Server then
		if (not uroboruukQuestSpawned) then
			local player = Game.GetLocalPlayer()
			local MPOverrideDbr = nil
			local MPOverrideState = false

			if (player:AnyoneHasToken("NECRO_FINALQUEST")) then
				MPOverrideDbr = "records/creatures/enemies/boss&quest/skeletalgolem_uroboruuksearch_01.dbr"
				MPOverrideState = true
				uroboruukQuestSpawned = true
				
			end

			uroboruukQuestId = objectId
	
			local userdata = {}
			local didWork, newState = TokenStateBasedObjectSwap(objectId, userdata, uroboruukQuestStateObjects, Character, UroboruukQuestCreateArgs, MPOverrideState, MPOverrideDbr)
	
			Shared.setUserdata(objectId, userdata)
	
			-- Don't respawn the Monster next time. If spawned as hostile, will be saved into the world
			if (newState == UroboruukQuestState.Spawned) then
				uroboruukQuestSpawned = true
				
			end
			
		end
	
	end
	
end

gd.quests.areaCQuestNecros.malkadarrRitualOnDestroy = ClearObjectUserdata

function gd.quests.areaCQuestNecros.uroboruukQuestSpawn()
	if Server then
		local player = Game.GetLocalPlayer()
		
		if not uroboruukQuestSpawned then
			local player = Game.GetLocalPlayer()
			local MPOverrideDbr = nil
			local MPOverrideState = false

			if (player:AnyoneHasToken("NECRO_FINALQUEST")) then
				MPOverrideDbr = "records/creatures/enemies/boss&quest/skeletalgolem_uroboruuksearch_01.dbr"
				MPOverrideState = true
				
			end
			
			local entity = Entity.Get(uroboruukQuestId)
			
			if entity != nil then
				local didWork, newState = UpdateObjectSwap(uroboruukQuestId, uroboruukQuestStateObjects, Character, UroboruukQuestCreateArgs, MPOverrideState, MPOverrideDbr)
				
				-- Don't respawn the Monster next time. If spawned as hostile, will be saved into the world
				uroboruukQuestSpawned = true
			
			end
			
		end
	
	end

end

