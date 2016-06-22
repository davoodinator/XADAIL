/*
	
	GRIM DAWN
	
	For more information, visit us at http://www.grimdawn.com
	
*/

gd.quests.necropolisBarricades = {}

-- Possible Blockade states
local DCBlockadeState = { Active = 0, Destroyed = 1}

--
-- Jagged Wastes Blockade
--
-- There is an avalanche in the Jagged Wastes, but it can be destroyed with Dynamite
--

local jaggedWastesBlockadeId = 0
local spawnedJaggedWastesBlockade = false

-- Blockade

local jaggedWastesBlockadeStateObjects = orderedTable();
	jaggedWastesBlockadeStateObjects["JAGGEDWASTES_BLOCKADECLEARED"]	= { state = DCBlockadeState.Destroyed,  dbr = nil }
	jaggedWastesBlockadeStateObjects[""] 								= { state = DCBlockadeState.Active, dbr = "records/storyelements/questassets/debriswall_jaggedwastes_break.dbr" }

function gd.quests.necropolisBarricades.jaggedWastesBlockadeOnAddToWorld(objectId)

	if Server then
	
		if (not spawnedJaggedWastesBlockade) then

			local userdata = {};
			TokenStateBasedObjectSwap(objectId, userdata, jaggedWastesBlockadeStateObjects);
			Shared.setUserdata(objectId, userdata);
			
			spawnedJaggedWastesBlockade = true
			
		end
		
	end
	
end

function gd.quests.necropolisBarricades.jaggedWastesBlockadeAvatarOnAddToWorld(objectId)

	if Server then
	
		jaggedWastesBlockadeId = objectId
		
	end
	
end

gd.quests.necropolisBarricades.jaggedWastesBlockadeOnDestroy = ClearObjectUserdata
	
-- Detonation Site
local jaggedWastesDetonationSiteStateObjects = orderedTable();
	jaggedWastesDetonationSiteStateObjects["JAGGEDWASTES_BLOCKADECLEARED"]	= { state = DCBlockadeState.Destroyed,  dbr = nil }
	jaggedWastesDetonationSiteStateObjects[""] 								= { state = DCBlockadeState.Active, dbr = "records/creatures/npcs/questnpcs/interactiveobjects/npc_detonationsite_jaggedwastes.dbr" }

function gd.quests.necropolisBarricades.jaggedWastesDetonationSiteOnAddToWorld(objectId)

	if Server then
	
		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, jaggedWastesDetonationSiteStateObjects);
		Shared.setUserdata(objectId, userdata);
		
	end
	
end

gd.quests.necropolisBarricades.jaggedWastesDetonationSiteOnDestroy = ClearObjectUserdata

-- Destroy Blockade
function gd.quests.necropolisBarricades.jaggedWastesBlockadeDestroyGlobalMP()

GiveTokenToLocalPlayer("JAGGEDWASTES_BLOCKADECLEARED")

end

function gd.quests.necropolisBarricades.jaggedWastesBlockadeDestroy()

	if Server then
	
		if jaggedWastesBlockadeId != 0 then
			local Blockade = Destructible.Get(jaggedWastesBlockadeId)
			local coords = Blockade:GetCoords()
			Blockade:Destroy(Vec(0,1,0), 1000, false)
			jaggedWastesBlockadeId = 0
			
			local pfx = Entity.Create("records/fx/skillsother/attackradius/detonatelarge_fxpak01.dbr")
			if pfx != nil then
				pfx:NetworkEnable()
				pfx:SetCoords(coords)
				
			end
			
		end
		
		QuestGlobalEvent("detonationJaggedWasteToken")
		
	end
	
end