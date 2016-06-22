/*
	
	GRIM DAWN
	
	For more information, visit us at http://www.grimdawn.com
	
*/

gd.quests.homesteadFlavorDefectors = {}

--
-- Three defectors are imprisoned in Cronley's area. Can be talked to and released, if so, they despawn later and give PC information. Otherwise, can go hostile and be killed
--

local defector01Id = 0
local defector02Id = 0
local defector03Id = 0

--Toggles state of extortionists based on dialogue choices
local DefectorState = { Default = 0, Gone = 1 }

-- Frankie, only conversation NPC in script
local defector01ActiveStateObjects = orderedTable();
	defector01ActiveStateObjects["HS_DEFECTORS"] = { state = DefectorState.Gone, dbr = nil }
	defector01ActiveStateObjects[""	                    ] = { state = DefectorState.Default,  dbr = "records/creatures/npcs/flavornpcs/homestead/npc_outlawdefector_02.dbr"}

function gd.quests.homesteadFlavorDefectors.defector01OnAddToWorld(objectId)
	if Server then
		defector01Id = objectId
	
		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, defector01ActiveStateObjects);
		Shared.setUserdata(objectId, userdata)
	
	end
	
end

gd.quests.homesteadFlavorDefectors.defector01OnDestroy = ClearObjectUserdata

local defector02ActiveStateObjects = orderedTable();
	defector02ActiveStateObjects["HS_DEFECTORS"] = { state = DefectorState.Gone, dbr = nil }
	defector02ActiveStateObjects[""	                    ] = { state = DefectorState.Default,  dbr = "records/creatures/npcs/flavornpcs/homestead/npc_outlawdefector_03.dbr"}

function gd.quests.homesteadFlavorDefectors.defector02OnAddToWorld(objectId)
	if Server then
		defector02Id = objectId
	
		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, defector02ActiveStateObjects);
		Shared.setUserdata(objectId, userdata)
	
	end
	
end

gd.quests.homesteadFlavorDefectors.defector02OnDestroy = ClearObjectUserdata

local defector03ActiveStateObjects = orderedTable();
	defector03ActiveStateObjects["HS_DEFECTORS"] = { state = DefectorState.Gone, dbr = nil }
	defector03ActiveStateObjects[""	                    ] = { state = DefectorState.Default,  dbr = "records/creatures/npcs/flavornpcs/homestead/npc_outlawdefector_04.dbr"}

function gd.quests.homesteadFlavorDefectors.defector03OnAddToWorld(objectId)
	if Server then
		defector03Id = objectId
	
		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, defector03ActiveStateObjects);
		Shared.setUserdata(objectId, userdata)
	
	end
	
end

gd.quests.homesteadFlavorDefectors.defector03OnDestroy = ClearObjectUserdata


-- Outlaw Defector Cage Doors
local cageDoor01Id = 0
local cageDoor02Id = 0
local cageDoor03Id = 0
local cagesDestroyed = false

function gd.quests.homesteadFlavorDefectors.cageDoor01OnAddToWorld(objectId)
	if Server then
		cageDoor01Id = objectId
		
	end
	
end

function gd.quests.homesteadFlavorDefectors.cageDoor02OnAddToWorld(objectId)
	if Server then
		cageDoor02Id = objectId
		
	end
	
end

function gd.quests.homesteadFlavorDefectors.cageDoor03OnAddToWorld(objectId)
	if Server then
		cageDoor03Id = objectId
		
	end
	
end

function gd.quests.homesteadFlavorDefectors.destroyCages()

	if Server then
		local door01 = Destructible.Get(cageDoor01Id)
		local door02 = Destructible.Get(cageDoor02Id)
		local door03 = Destructible.Get(cageDoor03Id)
				
		if door01 != nil then
			door01:Destroy(Vec(0,1,0), 1, false)

		end
		
		if door02 != nil then
			door02:Destroy(Vec(0,1,0), 1, false)

		end
		
		if door03 != nil then
			door03:Destroy(Vec(0,1,0), 1, false)

		end
		
	end
	
end

--Triggered by conversation. Hostile Swap: non-standard hostile swap as the NPCs do not remain hostile on subsequent playthroughs. One-shot hostile NPCs that never spawn again.
local hostileSwap = false

function gd.quests.homesteadFlavorDefectors.despawnTokenGlobalMP()

	GiveTokenToLocalPlayer("HS_DEFECTORS")

end

function gd.quests.homesteadFlavorDefectors.hostileSwitch()

	if Server && not hostileSwap then
		hostileSwap = true

		GiveTokenToLocalPlayer("HS_DEFECTORS")
		QuestGlobalEvent("outlawDefectorDespawnToken")
		
		gd.quests.homesteadFlavorDefectors.destroyCages()
		
		local coords01 = Entity.Get(defector01Id):GetCoords()
		local coords02 = Entity.Get(defector02Id):GetCoords()
		local coords03 = Entity.Get(defector03Id):GetCoords()
		
		UpdateObjectSwap(defector01Id, defector01ActiveStateObjects)
		UpdateObjectSwap(defector02Id, defector02ActiveStateObjects)
		UpdateObjectSwap(defector03Id, defector03ActiveStateObjects)
		

		local entity = Character.Create("records/creatures/enemies/boss&quest/humanoutlaw_defector01.dbr", 0, coords01.origin)			

		if entity != nil then
			entity:SetCoords(coords01)
			
		end

		entity = Character.Create("records/creatures/enemies/boss&quest/humanoutlaw_defector02.dbr", 0, coords02.origin)			

		if entity != nil then
			entity:SetCoords(coords02)
			
		end

		entity = Character.Create("records/creatures/enemies/boss&quest/humanoutlaw_defector03.dbr", 0, coords03.origin)			

		if entity != nil then
			entity:SetCoords(coords03)
			
		end
	
	end

end
