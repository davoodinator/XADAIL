/*
	
	GRIM DAWN
	
	For more information, visit us at http://www.grimdawn.com
	
*/

gd.devilsCrossingBarricades = {}

-- Possible Blockade states
local DCBlockadeState = { Active = 0, Destroyed = 1}

--
-- Flooded Passage Ruin Blockade
--
-- There is a collapsed wall into the flooded passage, but it can be destroyed with Dynamite
--

local floodedPassageBlockadeId = 0
local spawnedFloodedPassageBlockade = false

-- Blockade

local floodedPassageBlockadeStateObjects = orderedTable();
	floodedPassageBlockadeStateObjects["FLOODEDPASSAGERUIN_BLOCKADECLEARED"]	= { state = DCBlockadeState.Destroyed,  dbr = nil }
	floodedPassageBlockadeStateObjects[""] 								= { state = DCBlockadeState.Active, dbr = "records/storyelements/questassets/debriswall_floodedpassageruins_break.dbr" }

function gd.devilsCrossingBarricades.floodedPassageBlockadeOnAddToWorld(objectId)

	if Server then
	
		if (not spawnedFloodedPassageBlockade) then

			local userdata = {};
			TokenStateBasedObjectSwap(objectId, userdata, floodedPassageBlockadeStateObjects);
			Shared.setUserdata(objectId, userdata);
			
			spawnedFloodedPassageBlockade = true
			
		end
		
	end
	
end

function gd.devilsCrossingBarricades.floodedPassageBlockadeAvatarOnAddToWorld(objectId)

	if Server then
	
		floodedPassageBlockadeId = objectId
		
	end
	
end

gd.devilsCrossingBarricades.floodedPassageBlockadeOnDestroy = ClearObjectUserdata
	
-- Detonation Site
local floodedPassageDetonationSiteStateObjects = orderedTable();
	floodedPassageDetonationSiteStateObjects["FLOODEDPASSAGERUIN_BLOCKADECLEARED"]	= { state = DCBlockadeState.Destroyed,  dbr = nil }
	floodedPassageDetonationSiteStateObjects[""] 								= { state = DCBlockadeState.Active, dbr = "records/creatures/npcs/questnpcs/interactiveobjects/npc_detonationsite_floodedpassageruin.dbr" }

function gd.devilsCrossingBarricades.floodedPassageDetonationSiteOnAddToWorld(objectId)

	if Server then
	
		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, floodedPassageDetonationSiteStateObjects);
		Shared.setUserdata(objectId, userdata);
		
	end
	
end

gd.devilsCrossingBarricades.floodedPassageDetonationSiteOnDestroy = ClearObjectUserdata

-- Destroy Blockade
function gd.devilsCrossingBarricades.floodedPassageBlockadeDestroyGlobalMP()

GiveTokenToLocalPlayer("FLOODEDPASSAGERUIN_BLOCKADECLEARED")
Script.Event("EV_SUNKENRELIQUARY");

end

function gd.devilsCrossingBarricades.floodedPassageBlockadeDestroy()

	if Server then
	
		if floodedPassageBlockadeId != 0 then
			local Blockade = Destructible.Get(floodedPassageBlockadeId)
			local coords = Blockade:GetCoords()
			Blockade:Destroy(Vec(0,1,0), 1000, false)
			floodedPassageBlockadeId = 0
			
			local pfx = Entity.Create("records/fx/skillsother/attackradius/detonatelarge_fxpak01.dbr")
			if pfx != nil then
				pfx:NetworkEnable()
				pfx:SetCoords(coords)
			end
		end
		
		QuestGlobalEvent("detonationFloodedPassageToken")
		
	end
	
end



--
-- Lower Crossing Blockade
--
-- There is an avalanche near Lower Crossing, but it can be destroyed with Dynamite
--

local lowerCrossingBlockadeId = 0
local spawnedLowerCrossingBlockade = false

-- Blockade
local lowerCrossingBlockadeStateObjects = orderedTable();
	lowerCrossingBlockadeStateObjects["LOWERCROSSING_BLOCKADECLEARED"]	= { state = DCBlockadeState.Destroyed,  dbr = nil }
	lowerCrossingBlockadeStateObjects[""] 								= { state = DCBlockadeState.Active, dbr = "records/storyelements/questassets/debriswall_lowercrossing_break.dbr" }

function gd.devilsCrossingBarricades.lowerCrossingBlockadeOnAddToWorld(objectId)

	if Server then
	
		if (not spawnedLowerCrossingBlockade) then

			local userdata = {};
			TokenStateBasedObjectSwap(objectId, userdata, lowerCrossingBlockadeStateObjects);
			Shared.setUserdata(objectId, userdata);
			
			spawnedLowerCrossingBlockade = true
			
		end
		
	end
	
end

function gd.devilsCrossingBarricades.lowerCrossingBlockadeAvatarOnAddToWorld(objectId)

	if Server then
	
		lowerCrossingBlockadeId = objectId
		
	end
	
end

gd.devilsCrossingBarricades.lowerCrossingBlockadeOnDestroy = ClearObjectUserdata
	
-- Detonation Site
local lowerCrossingDetonationSiteStateObjects = orderedTable();
	lowerCrossingDetonationSiteStateObjects["LOWERCROSSING_BLOCKADECLEARED"]	= { state = DCBlockadeState.Destroyed,  dbr = nil }
	lowerCrossingDetonationSiteStateObjects[""] 								= { state = DCBlockadeState.Active, dbr = "records/creatures/npcs/questnpcs/interactiveobjects/npc_detonationsite_lowercrossing.dbr" }

function gd.devilsCrossingBarricades.lowerCrossingDetonationSiteOnAddToWorld(objectId)

	if Server then
	
		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, lowerCrossingDetonationSiteStateObjects);
		Shared.setUserdata(objectId, userdata);
		
	end
	
end

gd.devilsCrossingBarricades.lowerCrossingDetonationSiteOnDestroy = ClearObjectUserdata

-- Destroy Blockade
function gd.devilsCrossingBarricades.lowerCrossingBlockadeDestroyGlobalMP()

GiveTokenToLocalPlayer("LOWERCROSSING_BLOCKADECLEARED")

end

function gd.devilsCrossingBarricades.lowerCrossingBlockadeDestroy()

	if Server then

		if lowerCrossingBlockadeId != 0 then
			local Blockade = Destructible.Get(lowerCrossingBlockadeId)
			local coords = Blockade:GetCoords()
			Blockade:Destroy(Vec(0,1,0), 1000, false)
			lowerCrossingBlockadeId = 0
			
			local pfx = Entity.Create("records/fx/skillsother/attackradius/detonatelarge_fxpak01.dbr")
			if pfx != nil then
				pfx:NetworkEnable()
				pfx:SetCoords(coords)
			end
		end
		
		QuestGlobalEvent("detonationLowerCrossingToken")
		
	end
	
end


