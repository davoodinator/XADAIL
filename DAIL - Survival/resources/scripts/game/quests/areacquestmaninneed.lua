/*
	
	GRIM DAWN
	
	For more information, visit us at http://www.grimdawn.com
	
*/

gd.quests.areaCQuestManInNeed = {}

--
-- Myla begins in a friendly state, then teleports inside his UG
-- Inside the UG he starts friendly but swaps to hostile on conversation
--

local mylesId = 0
local mylesOutsideId = 0
local mylesAvalancheId = 0
local spawnedMyles = false
local mylesPortal = false

local MylesState = { Waiting = 0, Inside = 1, Hostile = 2 }

--Myla in cave swapping
local mylesStateObjects = orderedTable()
	mylesStateObjects["MYLES_HOSTILE"	] = { state = MylesState.Hostile,  dbr = "records/creatures/enemies/boss&quest/ghost_maninneed_01.dbr" }
	mylesStateObjects["MYLES_INSIDE"	] = { state = MylesState.Inside,  dbr = "records/creatures/npcs/questnpcs/gdareac/npc_mylafinegan_02.dbr" }
	mylesStateObjects[""					 	] = { state = MylesState.Waiting, dbr = "records/creatures/npcs/questnpcs/gdareac/npc_mylafinegan_02.dbr" }

local function CharacterCreateArgs()

	local averageLevel = Game.GetAveragePlayerLevel()
	local monsterLevel = 0
	local maxLevel = 0
	local originPoint = Entity.Get(mylesId):GetCoords().origin

	--Grimmest changes 48 to 50
	if (Game.GetGameDifficulty() == Game.Difficulty.Normal) then
		maxLevel = 50
	elseif (Game.GetGameDifficulty() == Game.Difficulty.Epic) then
		maxLevel = 75
	else
		maxLevel = 200
	end
	
	if (averageLevel > maxLevel) then
		monsterLevel = ((maxLevel+(maxLevel/50))+3)
	else
		monsterLevel = ((averageLevel+(averageLevel/50))+3)

	end
	
	if monsterLevel > maxLevel then
		originPoint = nil
	
	end
	--Grimmest
	originPoint = nil

	return monsterLevel, originPoint

end

function gd.quests.areaCQuestManInNeed.mylesOnAddToWorld(objectId)

	if Server then
		if (not spawnedMyles) then
			mylesId = objectId
	
			local userdata = {}
			local didWork, newState = TokenStateBasedObjectSwap(objectId, userdata, mylesStateObjects, Character, CharacterCreateArgs)
		
			Shared.setUserdata(objectId, userdata)
		
			--Don't respawn Myles next time. If spawned as hostile, will be saved into the world
			if (newState == MylesState.Hostile) then
				spawnedMyles = true
				
			end
			
		end
		
	end
	
end

gd.quests.areaCQuestManInNeed.mylesOnDestroy = ClearObjectUserdata

function gd.quests.areaCQuestManInNeed.hostileSwitch()
	
	if Server then
		if not spawnedMyles then
			local player = Game.GetLocalPlayer()
			local MPOverrideDbr = nil
			local MPOverrideState = false

			if (player:HasToken("MYLES_HOSTILE") == false) then
				MPOverrideDbr = "records/creatures/enemies/boss&quest/ghost_maninneed_01.dbr"
				MPOverrideState = true
			end

			local coords = Entity.Get(mylesId):GetCoords();
			local rift = Entity.Create("records/fx/ui/riftgateghostlyopen_fx02pak.dbr")
			
			if rift ~= nil then
				rift:NetworkEnable()
				rift:SetCoords(coords)
				
			end
			
			UpdateObjectSwap(mylesId, mylesStateObjects, Character, CharacterCreateArgs, MPOverrideState, MPOverrideDbr)
			spawnedMyles = true

		end
	
	end

end

--Myles outside swapping
local mylesOutsideStateObjects = orderedTable()
	mylesOutsideStateObjects["MYLES_HOSTILE"	] = { state = MylesState.Hostile,  dbr = nil }
	mylesOutsideStateObjects["MYLES_INSIDE"	] = { state = MylesState.Inside,  dbr = nil }
	mylesOutsideStateObjects[""					 	] = { state = MylesState.Waiting, dbr = "records/creatures/npcs/questnpcs/gdareac/npc_mylafinegan_01.dbr" }

function gd.quests.areaCQuestManInNeed.mylesOutsideOnAddToWorld(objectId)
	
	if Server then
		if (spawnedMyles == false && mylesPortal == false) then
			mylesOutsideId = objectId
	
			local userdata = {}
			TokenStateBasedObjectSwap(objectId, userdata, mylesOutsideStateObjects)
			Shared.setUserdata(objectId, userdata)
		
		end
	
	end
	
end

gd.quests.areaCQuestManInNeed.mylesOutsideOnDestroy = ClearObjectUserdata

-- UG Door
local caveEntranceId = 0

function gd.quests.areaCQuestManInNeed.caveEntranceOnAddToWorld(objectId)

	if Server then
	
		caveEntranceId = objectId;
		
		local door = Door.Get(objectId)
		local player = Game.GetLocalPlayer()

		if (player:HasToken("MYLES_INSIDE") || player:HasToken("MYLES_HOSTILE")) then
			-- Player already unlocked this door
			door:SetLocked(false)
			door:Open()
		end
		
	end
		
end

--Avalanche
local avalancheSpawned = false 

local mylesAvalancheStateObjects = orderedTable();
	mylesAvalancheStateObjects["MYLES_HOSTILE"]	= { state = MylesState.Hostile,  dbr = nil }
	mylesAvalancheStateObjects["MYLES_INSIDE"]	= { state = MylesState.Inside,  dbr = nil }
	mylesAvalancheStateObjects[""] 								= { state = MylesState.Waiting, dbr = "records/storyelements/questassets/debriswall_maninneed_break.dbr" }
	
function gd.quests.areaCQuestManInNeed.mylesAvalancheOnAddToWorld(objectId)
	
	if Server then
		if (not avalancheSpawned) then
			avalancheSpawned = true
			
			local userdata = {};
			TokenStateBasedObjectSwap(objectId, userdata, mylesAvalancheStateObjects);
			Shared.setUserdata(objectId, userdata);
		
		end
		
	end
	
end

gd.quests.areaCQuestManInNeed.mylesAvalancheOnDestroy = ClearObjectUserdata

function gd.quests.areaCQuestManInNeed.mylesAvalancheAvatarOnAddToWorld(objectId)
	
	if Server then
		mylesAvalancheId = objectId
	
	end
	
end


-- Triggered by conversation. Teleports Myla inside the cave and destroys the rock blockade
function gd.quests.areaCQuestManInNeed.mylesOutsidePortal()

	if Server then
		if not mylesPortal then
			mylesPortal = true
			
			local player = Game.GetLocalPlayer()
			local MPOverrideState = false
			local MPOverrideDbr = nil
			
			local mylesOutside = Entity.Get(mylesOutsideId)
			
			if (player:HasToken("MYLES_INSIDE") == false) then
				MPOverrideState = true
			end
	
			if mylesOutside != nil then
				local coords = mylesOutside:GetCoords();
				local riftStart = Entity.Create("records/fx/ui/riftgatepersonalopen_fxpak.dbr")
		
				if riftStart ~= nil then
					riftStart:NetworkEnable()
					riftStart:SetCoords(coords)
				
				end
		
				UpdateObjectSwap(mylesOutsideId, mylesOutsideStateObjects, nil, nil, MPOverrideState, MPOverrideDbr)
		
			end
	
			if mylesAvalancheId != 0 then
				local rockwall = Destructible.Get(mylesAvalancheId)
				local coords = rockwall:GetCoords()
				rockwall:Destroy(Vec(0,1,0), 1000, false)
				mylesAvalancheId = 0
		
				local pfx = Entity.Create("records/fx/skillsother/attackradius/detonatelarge_fxpak01.dbr")
				if pfx != nil then
					pfx:NetworkEnable()
					pfx:SetCoords(coords)
				
				end	
			
			end
			
			local door = Door.Get(caveEntranceId)
			
			if ((door != nil) && (door:IsLocked())) then
				door:SetLocked(false)
				door:Open()
				
			end
		
		end
	
	end
	
end
