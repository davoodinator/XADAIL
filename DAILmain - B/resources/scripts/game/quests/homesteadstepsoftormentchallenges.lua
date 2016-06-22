/*
	
	GRIM DAWN
	
	For more information, visit us at http://www.grimdawn.com
	
*/

gd.quests.homesteadStepsOfTormentChallenges = {}


local doorRoomA01 = 0
local doorRoomA01Loaded = false
local doorRoomA02 = 0
local doorRoomA02Loaded = false
local doorRoomB01 = 0
local doorRoomB01Loaded = false
local doorRoomB02 = 0
local doorRoomB02Loaded = false
local doorRoomC01 = 0
local doorRoomC01Loaded = false
local doorRoomC02 = 0
local doorRoomC02Loaded = false
local doorHallA01 = 0
local doorHallA01Loaded = false
local doorHallA02 = 0
local doorHallA02Loaded = false

local function openDoors(door01ObjectId, door02ObjectId)
	
	print "Opening Doors"
	local door01 = Door.Get(door01ObjectId)
	local door02 = Door.Get(door02ObjectId)
	
	if door01 != nil then
		door01:Open()
		
	end
	
	if door02 != nil then
		door02:Open()
		
	end
	
end

local function closeDoors(door01ObjectId, door02ObjectId)
	
	print "Closing Doors"
	local door01 = Door.Get(door01ObjectId)
	local door02 = Door.Get(door02ObjectId)
	
	if door01 != nil then
		door01:Close()
		
	end
	
	if door02 != nil then
		door02:Close()
		
	end
	
end

-- Challenge room Door setup
function gd.quests.homesteadStepsOfTormentChallenges.doorRoomA01OnAddToWorld(objectId)
	
	if Server then
		doorRoomA01 = objectId
		local door = Door.Get(objectId)
	
		if (not doorRoomA01Loaded) then
			door:Open()
			doorRoomA01Loaded = true
			
		end
	
	end
	
end

function gd.quests.homesteadStepsOfTormentChallenges.doorRoomA02OnAddToWorld(objectId)
	
	if Server then
		doorRoomA02 = objectId
	
	end
	
end

function gd.quests.homesteadStepsOfTormentChallenges.doorRoomB01OnAddToWorld(objectId)
	
	if Server then
		doorRoomB01 = objectId
		local door = Door.Get(objectId)
	
		if (not doorRoomB01Loaded) then
			door:Open()
			doorRoomB01Loaded = true
			
		end
	
	end
	
end

function gd.quests.homesteadStepsOfTormentChallenges.doorRoomB02OnAddToWorld(objectId)
	
	if Server then
		doorRoomB02 = objectId
		local door = Door.Get(objectId)
	
		if (not doorRoomB02Loaded) then
			door:Open()
			doorRoomB02Loaded = true
			
		end
	
	end
	
end

function gd.quests.homesteadStepsOfTormentChallenges.doorRoomC01OnAddToWorld(objectId)
	
	if Server then
		doorRoomC01 = objectId
		local door = Door.Get(objectId)
	
		if (not doorRoomC01Loaded) then
			door:Open()
			doorRoomC01Loaded = true
			
		end
	
	end
	
end

function gd.quests.homesteadStepsOfTormentChallenges.doorRoomC02OnAddToWorld(objectId)
	
	if Server then
		doorRoomC02 = objectId
		local door = Door.Get(objectId)
	
		if (not doorRoomC02Loaded) then
			door:Open()
			doorRoomC02Loaded = true
			
		end
	
	end
	
end

function gd.quests.homesteadStepsOfTormentChallenges.doorHallA01OnAddToWorld(objectId)
	
	if Server then
		doorHallA01 = objectId
		local door = Door.Get(objectId)
	
		if (not doorHallA01Loaded) then
			door:Open()
			doorHallA01Loaded = true
			
		end
	
	end
	
end

function gd.quests.homesteadStepsOfTormentChallenges.doorHallA02OnAddToWorld(objectId)
	
	if Server then
		doorHallA02 = objectId
		local door = Door.Get(objectId)
	
		if (not doorHallA02Loaded) then
			door:Open()
			doorHallA02Loaded = true
			
		end
	
	end
	
end




-- Challenge Room Floor 4, Wave Event
local roomAWaveChestId = 0
local roomAWaveObjectId = 0

local roomAWaveEventStarted = false
local roomAWaveEventKey = "STEPSOFTORMENT_WAVEEVENTA"

function gd.quests.homesteadStepsOfTormentChallenges.waveEventRoomAChestOnAddToWorld(objectId)
	
	if Server then
		roomAWaveChestId = objectId
	
	end
	
end

function gd.quests.homesteadStepsOfTormentChallenges.waveEventRoomAChestOpened()

	GiveTokenToLocalPlayer("HS_STEPSOFTORMENT_DEATHROOM_COMPLETE")
	
end

function gd.quests.homesteadStepsOfTormentChallenges.waveEventRoomAOnAddToWorld(objectId)

	if Server then
		roomAWaveObjectId = objectId
		WaveEvent_OnAddToWorld(objectId, roomAWaveEventKey)
	
	end

end

function gd.quests.homesteadStepsOfTormentChallenges.waveEventRoomAOnRemoveFromWorld(objectId)

	if Server then
		WaveEvent_OnRemoveFromWorld(objectId)
	
	end
	
end

function gd.quests.homesteadStepsOfTormentChallenges.endRoomAWaveEvent(objectId)

	if Server then
		local waveChest = Chest.Get(roomAWaveChestId);
		openDoors(doorRoomA01, doorRoomA02)
	
		if (waveChest != nil) then
			waveChest:SetLocked(false)
		
		end
	
	end
	
end

local roomAWaveParameters = { }
	roomAWaveParameters.waves = {"records/proxies/boss&quest/proxy_areab_stepsoftorment_roomawave1.dbr", "records/proxies/boss&quest/proxy_areab_stepsoftorment_roomawave2.dbr", "records/proxies/boss&quest/proxy_areab_stepsoftorment_roomawave3.dbr"}
	roomAWaveParameters.endCallback = gd.quests.homesteadStepsOfTormentChallenges.endRoomAWaveEvent
	roomAWaveParameters.key = roomAWaveEventKey

function gd.quests.homesteadStepsOfTormentChallenges.startRoomAWaveEventMP()

	if Server then
		if (not roomAWaveEventStarted) then
			roomAWaveEventStarted = true
			
			-- Close Door01, Door02 defaults closed
			local door01 = Door.Get(doorRoomA01)
			if door01 != nil then
				door01:Close()
				
			end
			
			WaveEvent_Start(roomAWaveObjectId, roomAWaveParameters)
		
		end
		
	end

end
	
function gd.quests.homesteadStepsOfTormentChallenges.startRoomAWaveEvent(triggererId)

	QuestEvent("stepsOfTormentStartRoomAWaveEvent")

end


-- Challenge Hall Floor 5, DISABLED
local ChallengeHallARandomizer = 0
local leverSpawned = false
local monsterCoords = 0
local hallAEventStarted = false

function gd.quests.homesteadStepsOfTormentChallenges.hallSpawnOnAddToWorld(objectId)
	
	if Server then
		local entity = Entity.Get(objectId)
		monsterCoords = entity:GetCoords()
	
	end

end

function gd.quests.homesteadStepsOfTormentChallenges.hallLeverOnAddToWorld(objectId)
	
	if Server then
		local entity = Entity.Get(objectId)
		local coords = entity:GetCoords()
	
		math.randomseed(Time.Now())
		ChallengeHallARandomizer = random(1,100)
	
		if (leverSpawned == false && ChallengeHallARandomizer > 110) then
			leverSpawned = true
	
			local lever = Entity.Create("records/storyelements/questassets/stepsoftorment_doorlever01.dbr")
			lever:SetCoords(coords)

		end
	
	end

end


function gd.quests.homesteadStepsOfTormentChallenges.startHallAEventMP()

	if Server then
		if (hallAEventStarted == false && leverSpawned == true) then
			hallAEventStarted = true
			closeDoors(doorHallA01, doorHallA02)
		
			local proxy = Proxy.Create("records/proxies/area001/undead_skeletongolem_amb_solo_always.dbr", monsterCoords.origin)
			proxy:SetCoords(monsterCoords)
		
		end
	
	end

end

function gd.quests.homesteadStepsOfTormentChallenges.startHallAEvent(triggererId)

	QuestEvent("stepsOfTormentStartHallAEvent")

end

function gd.quests.homesteadStepsOfTormentChallenges.endHallAEvent()
	
	if Server then
		openDoors(doorHallA01, doorHallA02)
	
	end
	
end



-- Challenge Rooms Floor 5, randomized locations and events
-- Randomizes between Room B and Room C. Only spawns in one or the other

-- Determines which event is loaded
local ChallengeFloor5Randomizer = 0
local RoomLoaded = 0

local floor5Started = false
local floor5Coords = nil
local floor5ObjectId = 0
local Floor5Proxy = nil
local floor5Chest = 0

local floor5EventFinished = false

local floor5WaveEventKey = "STEPSOFTORMENT_WAVEEVENTB"

local floor5RevenantProxy = "records/proxies/boss&quest/proxy_areab_stepsoftorment_floor5revenants.dbr"
local floor5HeroesProxy = "records/proxies/boss&quest/proxy_areab_stepsoftorment_floor5heroes.dbr"
local floor5EventFillerProxy = "records/proxies/boss&quest/proxy_areab_stepsoftorment_floor5eventfiller.dbr"
local floor5FillerProxy = "records/proxies/boss&quest/proxy_areab_stepsoftorment_floor5filler.dbr"


function gd.quests.homesteadStepsOfTormentChallenges.endFloor5WaveEvent(objectId)
	
	if Server then
		local waveChest = Chest.Get(floor5Chest)
		
		if RoomLoaded == 1 then
			openDoors(doorRoomB01, doorRoomB02)
		else
			openDoors(doorRoomC01, doorRoomC02)
	
		end
		
		if (waveChest != nil) then
			waveChest:SetLocked(false)
		
		end
	
	end
	
end

function gd.quests.homesteadStepsOfTormentChallenges.endFloor5Event()
	
	if Server then
		local waveChest = Chest.Get(floor5Chest)

		Script.UnregisterForUpdate(floor5ObjectId, "gd.quests.homesteadStepsOfTormentChallenges.updateStatus")
	
		if RoomLoaded == 1 then
			openDoors(doorRoomB01, doorRoomB02)
		else
			openDoors(doorRoomC01, doorRoomC02)
	
		end
	
		if (waveChest != nil) then
			waveChest:SetLocked(false)
		
		end
	
	end

end

function gd.quests.homesteadStepsOfTormentChallenges.updateStatus()
	
	if Server then
		if (not floor5EventFinished) then
			if Floor5Proxy != nil && Floor5Proxy:AllKilled() == true then
				floor5EventFinished = true
				gd.quests.homesteadStepsOfTormentChallenges.endFloor5Event()
			
			end
		
		end
		
	end
	
end

local floor5WaveParameters = { }
	floor5WaveParameters.waves = {"records/proxies/boss&quest/proxy_areab_stepsoftorment_floor5wave1.dbr", "records/proxies/boss&quest/proxy_areab_stepsoftorment_floor5wave2.dbr", "records/proxies/boss&quest/proxy_areab_stepsoftorment_floor5wave3.dbr"}
	floor5WaveParameters.endCallback = gd.quests.homesteadStepsOfTormentChallenges.endFloor5WaveEvent
	floor5WaveParameters.key = floor5WaveEventKey	

local function startFloor5Event()

	if (not floor5Started) then
		floor5Started = true
		
		if RoomLoaded == 1 then
			closeDoors(doorRoomB01, doorRoomB02)
			
		else
			closeDoors(doorRoomC01, doorRoomC02)
			
		end

		if ChallengeFloor5Randomizer <= 40 then
			-- Event 1: 4 Revenants spawn
			Floor5Proxy = Proxy.Create(floor5RevenantProxy, floor5Coords.origin)
			
		elseif ChallengeFloor5Randomizer <= 80 then
			-- Event 2: 2+ hero spawn
			Floor5Proxy = Proxy.Create(floor5HeroesProxy, floor5Coords.origin)
			
		else
			-- Event 3: big waves of weak skeletons
			WaveEvent_Start(floor5ObjectId, floor5WaveParameters)
		end
	
		if Floor5Proxy != nil then
			Floor5Proxy:SetCoords(floor5Coords)
		
		end
		
	end

end

local function floor5Setup(objectId)

	floor5ObjectId = objectId

	local entity = Entity.Get(objectId)
	floor5Coords = entity:GetCoords()
	
	if (ChallengeFloor5Randomizer == 0) then
		math.randomseed(Time.Now())
		ChallengeFloor5Randomizer = random(1,100)
	end
	
	if ChallengeFloor5Randomizer > 80 then
		WaveEvent_OnAddToWorld(objectId, floor5WaveEventKey)
	
	elseif (ChallengeFloor5Randomizer <= 80 && floor5EventFinished == false) then
		Script.RegisterForUpdate(objectId, "gd.quests.homesteadStepsOfTormentChallenges.updateStatus", 1000)
		
	end

end

local function floor5Cleanup(objectId)
		
	if ChallengeFloor5Randomizer > 80 then
		WaveEvent_OnRemoveFromWorld(objectId)
		
	elseif floor5EventFinished == false then
		Script.UnregisterForUpdate(objectId, "gd.quests.homesteadStepsOfTormentChallenges.updateStatus")
	
	end
	
end

function gd.quests.homesteadStepsOfTormentChallenges.floor5ChestOnAddToWorld(objectId)
	
	if Server then
		floor5Chest = objectId
	
	end
	
end

-- Determine which room needs to be loaded

function gd.quests.homesteadStepsOfTormentChallenges.triggerFloor5RoomEventMP()

	if Server then
		startFloor5Event()
	
	end

end

function gd.quests.homesteadStepsOfTormentChallenges.triggerFloor5RoomB(triggererId)
	
	QuestEvent("stepsOfTormentStartFloor5RoomEvent")

end

function gd.quests.homesteadStepsOfTormentChallenges.triggerFloor5RoomC(triggererId)

	QuestEvent("stepsOfTormentStartFloor5RoomEvent")

end

function gd.quests.homesteadStepsOfTormentChallenges.floor5RoomBOnAddToWorld(objectId)
	
	if Server then
		RoomLoaded = 1
		
		floor5Setup(objectId)
	
	end

end

function gd.quests.homesteadStepsOfTormentChallenges.floor5RoomCOnAddToWorld(objectId)
	
	if Server then
		RoomLoaded = 2
		
		floor5Setup(objectId)
	
	end

end

function gd.quests.homesteadStepsOfTormentChallenges.floor5RoomBOnRemoveFromWorld(objectId)
	
	if Server then
		floor5Cleanup(objectId)
	
	end
	
end

function gd.quests.homesteadStepsOfTormentChallenges.floor5RoomCOnRemoveFromWorld(objectId)
	
	if Server then
		floor5Cleanup(objectId)
	
	end
	
end
	

-- Trapped Chest event
local TrappedChestCoords = nil
local TrappedChestRandomizer = 0

function gd.quests.homesteadStepsOfTormentChallenges.trappedChestOnAddToWorld(objectId)
	
	if Server then
		local entity = Entity.Get(objectId)
		TrappedChestCoords = entity:GetCoords()
	
		if (TrappedChestRandomizer == 0) then
			math.randomseed(Time.Now())
			TrappedChestRandomizer = random(1,100)
			
		end
	
	end

end

function gd.quests.homesteadStepsOfTormentChallenges.trappedChestOpenedMP()
	
	if Server then		
		if TrappedChestRandomizer > 60 then
			local proxy = Proxy.Create("records/proxies/boss&quest/proxy_areab_stepsoftorment_trappedchest.dbr", TrappedChestCoords.origin)
			proxy:SetCoords(TrappedChestCoords)
		
		end
	
	end

end

function gd.quests.homesteadStepsOfTormentChallenges.trappedChestOpened()
	
	QuestEvent("stepsOfTormentTriggerTrappedChest")

end
