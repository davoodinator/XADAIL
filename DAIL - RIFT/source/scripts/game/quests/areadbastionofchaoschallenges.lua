/*
	
	GRIM DAWN
	
	For more information, visit us at http://www.grimdawn.com
	
*/

gd.quests.areaDBastionOfChaosChallenges = {}


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
function gd.quests.areaDBastionOfChaosChallenges.doorRoomA01OnAddToWorld(objectId)
	
	if Server then
		doorRoomA01 = objectId
		local door = Door.Get(objectId)
	
		if (not doorRoomA01Loaded) then
			door:Open()
			doorRoomA01Loaded = true
			
		end
	
	end
	
end

function gd.quests.areaDBastionOfChaosChallenges.doorRoomA02OnAddToWorld(objectId)
	
	if Server then
		doorRoomA02 = objectId
		local door = Door.Get(objectId)
	
	end
	
end

function gd.quests.areaDBastionOfChaosChallenges.doorRoomB01OnAddToWorld(objectId)
	
	if Server then
		doorRoomB01 = objectId
		local door = Door.Get(objectId)
	
		if (not doorRoomB01Loaded) then
			door:Open()
			doorRoomB01Loaded = true
			
		end
	
	end
	
end

function gd.quests.areaDBastionOfChaosChallenges.doorRoomB02OnAddToWorld(objectId)
	
	if Server then
		doorRoomB02 = objectId
		local door = Door.Get(objectId)
	
		if (not doorRoomB02Loaded) then
			door:Open()
			doorRoomB02Loaded = true
			
		end
	
	end
	
end

function gd.quests.areaDBastionOfChaosChallenges.doorRoomC01OnAddToWorld(objectId)
	
	if Server then
		doorRoomC01 = objectId
		local door = Door.Get(objectId)
	
		if (not doorRoomC01Loaded) then
			door:Open()
			doorRoomC01Loaded = true
			
		end
	
	end
	
end

function gd.quests.areaDBastionOfChaosChallenges.doorRoomC02OnAddToWorld(objectId)
	
	if Server then
		doorRoomC02 = objectId
		local door = Door.Get(objectId)
	
		if (not doorRoomC02Loaded) then
			door:Open()
			doorRoomC02Loaded = true
			
		end
	
	end
	
end

-- Floor 2 Gauntlet
local GauntletEventStarted = false
local guardian01Killed = false
local guardian02Killed = false
local gauntletChestId = 0

function gd.quests.areaDBastionOfChaosChallenges.gauntletChestOnAddToWorld(objectId)
	
	if Server then
		gauntletChestId = objectId
		
		if guardian01Killed && guardian02Killed then
			local chest = Chest.Get(objectId);
			chest:SetLocked(false)
			
		end
	
	end
	
end

function gd.quests.areaDBastionOfChaosChallenges.gauntletChestOpened()

	GiveTokenToLocalPlayer("AREAD_BASTIONOFCHAOS_GAUNTLET_COMPLETE")
	
end

function gd.quests.areaDBastionOfChaosChallenges.gauntletGuardian01Killed()
	
	if Server then
		guardian01Killed = true

		if guardian01Killed && guardian02Killed then
			local door01 = Door.Get(doorRoomA01)
			local door02 = Door.Get(doorRoomA02)
			local chest = Chest.Get(gauntletChestId);
			
			if door01 != nil then
				door01:Open()
				
			end
			
			if door02 != nil then
				door02:Open()
				door02:SetLocked(false)
				
			end

			if (chest != nil) then
				chest:SetLocked(false)
			
			end
		
		end

	end
	
end

function gd.quests.areaDBastionOfChaosChallenges.gauntletGuardian02Killed()
	
	if Server then
		guardian02Killed = true

		if guardian01Killed && guardian02Killed then
			local door01 = Door.Get(doorRoomA01)
			local door02 = Door.Get(doorRoomA02)
			local chest = Chest.Get(gauntletChestId);
			
			if door01 != nil then
				door01:Open()
				
			end
			
			if door02 != nil then
				door02:Open()
				door:SetLocked(false)
				
			end

			if (chest != nil) then
				chest:SetLocked(false)
			
			end
		
		end

	end
	
end

function gd.quests.areaDBastionOfChaosChallenges.startGauntletEventMP()

	if Server then
		if (not GauntletEventStarted) then
			GauntletEventStarted = true
			local door01 = Door.Get(doorRoomA01)
			
			if door01 != nil then
				door01:Close()
		
			end
		
		end
		
	end

end
	
function gd.quests.areaDBastionOfChaosChallenges.startGauntletEvent(triggererId)

	QuestEvent("bastionOfChaosStartGauntletEvent")

end

-- Challenge Rooms Floor 3, randomized locations and events
-- Randomizes between Room B and Room C. Only spawns in one or the other

-- Determines which event is loaded
local ChallengeTrapRoomRandomizer = 0
local RoomLoaded = 0

local trapRoomStarted = false
local trapRoomCoords = nil
local trapRoomObjectId = 0
local trapRoomProxy = nil
local trapRoomChest = 0

local trapRoomFinished = false

local trapRoomEventKey = "BASTIONOFCHAOS_WAVEEVENTA"

local trapRoomDreadguardProxy = "records/proxies/boss&quest/proxy_aread_bastionofchaos_traproomdreadguards.dbr"
local trapRoomHeroProxy = "records/proxies/boss&quest/proxy_aread_bastionofchaos_traproomheroes.dbr"
local trapRoomFillerProxy = "records/proxies/boss&quest/proxy_aread_bastionofchaos_traproomfiller.dbr"


function gd.quests.areaDBastionOfChaosChallenges.endTrapRoomWaveEvent(objectId)
	
	if Server then
		local waveChest = Chest.Get(trapRoomChest)
		
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

function gd.quests.areaDBastionOfChaosChallenges.endTrapRoomEvent()
	
	if Server then
		local waveChest = Chest.Get(trapRoomChest)

		Script.UnregisterForUpdate(trapRoomObjectId, "gd.quests.areaDBastionOfChaosChallenges.updateStatus")
	
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

function gd.quests.areaDBastionOfChaosChallenges.updateStatus()
	
	if Server then
		if (not trapRoomFinished) then
			if trapRoomProxy != nil && trapRoomProxy:AllKilled() == true then
				trapRoomFinished = true
				gd.quests.areaDBastionOfChaosChallenges.endTrapRoomEvent()
			
			end
		
		end
		
	end
	
end

local trapRoomWaveParameters = { }
	trapRoomWaveParameters.waves = {"records/proxies/boss&quest/proxy_aread_bastionofchaos_traproomwave1.dbr", "records/proxies/boss&quest/proxy_aread_bastionofchaos_traproomwave2.dbr", "records/proxies/boss&quest/proxy_aread_bastionofchaos_traproomwave3.dbr"}
	trapRoomWaveParameters.endCallback = gd.quests.areaDBastionOfChaosChallenges.endTrapRoomWaveEvent
	trapRoomWaveParameters.key = trapRoomEventKey	

local function startTrapRoomEvent()

	if (not trapRoomStarted) then
		trapRoomStarted = true
		
		if RoomLoaded == 1 then
			closeDoors(doorRoomB01, doorRoomB02)
			
		else
			closeDoors(doorRoomC01, doorRoomC02)
			
		end

		if ChallengeTrapRoomRandomizer <= 40 then
			-- Event 1: 4 Dreadguards spawn
			trapRoomProxy = Proxy.Create(trapRoomDreadguardProxy, trapRoomCoords.origin)
			
		elseif ChallengeTrapRoomRandomizer <= 80 then
			-- Event 2: 2+ hero spawn
			trapRoomProxy = Proxy.Create(trapRoomHeroProxy, trapRoomCoords.origin)
			
		else
			-- Event 3: big waves of chthonians spawn
			WaveEvent_Start(trapRoomObjectId, trapRoomWaveParameters)
		end
	
		if trapRoomProxy != nil then
			trapRoomProxy:SetCoords(trapRoomCoords)
		
		end
		
	end

end

local function trapRoomSetup(objectId)

	trapRoomObjectId = objectId

	local entity = Entity.Get(objectId)
	trapRoomCoords = entity:GetCoords()
	
	if (ChallengeTrapRoomRandomizer == 0) then
		math.randomseed(Time.Now())
		ChallengeTrapRoomRandomizer = random(1,100)
	end
	
	if ChallengeTrapRoomRandomizer > 80 then
		WaveEvent_OnAddToWorld(objectId, trapRoomEventKey)
	
	elseif (ChallengeTrapRoomRandomizer <= 80 && trapRoomFinished == false) then
		Script.RegisterForUpdate(objectId, "gd.quests.areaDBastionOfChaosChallenges.updateStatus", 1000)
		
	end

end

local function trapRoomCleanup(objectId)
		
	if ChallengeTrapRoomRandomizer > 80 then
		WaveEvent_OnRemoveFromWorld(objectId)
		
	elseif trapRoomFinished == false then
		Script.UnregisterForUpdate(objectId, "gd.quests.areaDBastionOfChaosChallenges.updateStatus")
	
	end
	
end

function gd.quests.areaDBastionOfChaosChallenges.trapRoomChestOnAddToWorld(objectId)
	
	if Server then
		trapRoomChest = objectId
	
	end
	
end

-- Determine which room needs to be loaded

function gd.quests.areaDBastionOfChaosChallenges.triggerTrapRoomEventMP()

	if Server then
		startTrapRoomEvent()
	
	end

end

function gd.quests.areaDBastionOfChaosChallenges.triggerTrapRoomB(triggererId)
	
	QuestEvent("bastionOfChaosStartTrapRoomEvent")

end

function gd.quests.areaDBastionOfChaosChallenges.triggerTrapRoomC(triggererId)

	QuestEvent("bastionOfChaosStartTrapRoomEvent")

end

function gd.quests.areaDBastionOfChaosChallenges.trapRoomBOnAddToWorld(objectId)
	
	if Server then
		RoomLoaded = 1
		
		trapRoomSetup(objectId)
	
	end

end

function gd.quests.areaDBastionOfChaosChallenges.trapRoomCOnAddToWorld(objectId)
	
	if Server then
		RoomLoaded = 2
		
		trapRoomSetup(objectId)
	
	end

end

function gd.quests.areaDBastionOfChaosChallenges.trapRoomBOnRemoveFromWorld(objectId)
	
	if Server then
		trapRoomCleanup(objectId)
	
	end
	
end

function gd.quests.areaDBastionOfChaosChallenges.trapRoomCOnRemoveFromWorld(objectId)
	
	if Server then
		trapRoomCleanup(objectId)
	
	end
	
end
	

-- Trapped Chest event
local TrappedChestCoords01 = nil
local TrappedChestCoords02 = nil
local TrappedChestRandomizer01 = 0
local TrappedChestRandomizer02 = 0

function gd.quests.areaDBastionOfChaosChallenges.trappedChest01OnAddToWorld(objectId)
	
	if Server then
		local entity = Entity.Get(objectId)
		TrappedChestCoords = entity:GetCoords()
	
		if (TrappedChestRandomizer01 == 0) then
			math.randomseed(Time.Now())
			TrappedChestRandomizer01 = random(1,100)
			
		end
	
	end

end

function gd.quests.areaDBastionOfChaosChallenges.trappedChest01OpenedMP()
	
	if Server then		
		if TrappedChestRandomizer01 > 60 then
			local proxy = Proxy.Create("records/proxies/boss&quest/proxy_aread_bastionofchaos_trappedchest01.dbr", TrappedChestCoords01.origin)
			proxy:SetCoords(TrappedChestCoords01)
		
		end
	
	end

end

function gd.quests.areaDBastionOfChaosChallenges.trappedChest01Opened()
	
	QuestEvent("bastionOfChaosTriggerTrappedChest01")

end


function gd.quests.areaDBastionOfChaosChallenges.trappedChest02OnAddToWorld(objectId)
	
	if Server then
		local entity = Entity.Get(objectId)
		TrappedChestCoords = entity:GetCoords()
	
		if (TrappedChestRandomizer02 == 0) then
			math.randomseed(Time.Now())
			TrappedChestRandomizer02 = random(1,100)
			
		end
	
	end

end

function gd.quests.areaDBastionOfChaosChallenges.trappedChest02OpenedMP()
	
	if Server then		
		if TrappedChestRandomizer02 > 60 then
			local proxy = Proxy.Create("records/proxies/boss&quest/proxy_aread_bastionofchaos_trappedchest02.dbr", TrappedChestCoords02.origin)
			proxy:SetCoords(TrappedChestCoords02)
		
		end
	
	end

end

function gd.quests.areaDBastionOfChaosChallenges.trappedChest02Opened()
	
	QuestEvent("bastionOfChaosTriggerTrappedChest02")

end
