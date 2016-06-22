/*
	
	GRIM DAWN
	
	For more information, visit us at http://www.grimdawn.com
	
*/

gd.quests.homesteadQuestClearingTheWay = {}

-- Possible Blockade states
local RoverBlockadeState = { Active = 0, Destroyed = 1}

--
-- Rover Blockade
--
-- The road in the Arkovian Foothills is blocked by bandits, but it can be destroyed with Dynamite
--

local blockadeId = 0
local spawnedBlockade = false

-- Blockade
local roverBlockadeStateObjects = orderedTable();
	roverBlockadeStateObjects["ROVERS_BLOCKADECLEARED"]	= { state = RoverBlockadeState.Destroyed,  dbr = nil }
	roverBlockadeStateObjects[""] 								= { state = RoverBlockadeState.Active, dbr = "records/storyelements/questassets/debriswall_clearingtheway_break.dbr" }

function gd.quests.homesteadQuestClearingTheWay.roverBlockadeOnAddToWorld(objectId)

	if Server then
		if (not spawnedBlockade) then

			local userdata = {};
			TokenStateBasedObjectSwap(objectId, userdata, roverBlockadeStateObjects);
			Shared.setUserdata(objectId, userdata);
		
			spawnedBlockade = true
		
		end
		
	end
	
end

function gd.quests.homesteadQuestClearingTheWay.roverBlockadeAvatarOnAddToWorld(objectId)

	if Server then
		blockadeId = objectId
		
	end
	
end

gd.quests.homesteadQuestClearingTheWay.roverBlockadeOnDestroy = ClearObjectUserdata
	
-- Detonation Site
local roverDetonationSiteStateObjects = orderedTable();
	roverDetonationSiteStateObjects["ROVERS_BLOCKADECLEARED"]	= { state = RoverBlockadeState.Destroyed,  dbr = nil }
	roverDetonationSiteStateObjects[""] 								= { state = RoverBlockadeState.Active, dbr = "records/creatures/npcs/questnpcs/interactiveobjects/npc_detonationsite_clearingtheway.dbr" }

function gd.quests.homesteadQuestClearingTheWay.roverDetonationSiteOnAddToWorld(objectId)

	if Server then
		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, roverDetonationSiteStateObjects);
		Shared.setUserdata(objectId, userdata);
		
	end
	
end

gd.quests.homesteadQuestClearingTheWay.roverDetonationSiteOnDestroy = ClearObjectUserdata

-- Destroy Blockade
function gd.quests.homesteadQuestClearingTheWay.roverBlockadeDestroyGlobalMP()

GiveTokenToLocalPlayer("ROVERS_BLOCKADECLEARED")

end

function gd.quests.homesteadQuestClearingTheWay.roverBlockadeDestroy()

	if Server then
		if blockadeId != 0 then
			local roverBlockade = Destructible.Get(blockadeId)
			local coords = roverBlockade:GetCoords()
			roverBlockade:Destroy(Vec(0,1,0), 1000, false)
			blockadeId = 0
		
			local pfx = Entity.Create("records/fx/skillsother/attackradius/detonatelarge_fxpak01.dbr")
			if pfx != nil then
				pfx:NetworkEnable()
				pfx:SetCoords(coords)
				
			end
			
		end
	
		QuestGlobalEvent("detonationArkoviaFoothillsToken")
	
	end
	
end



--
-- Retroactive credit for destroying forges
--
local forgesDestroyedTotal = 0

function gd.quests.homesteadQuestClearingTheWay.forgeDestroyedGlobalMP()

	GiveTokenToLocalPlayer("OUTLAW_FORGES_DESTROYED")

end

function gd.quests.homesteadQuestClearingTheWay.forgeDestroyed()
	local player = Game.GetLocalPlayer()
	
	forgesDestroyedTotal = forgesDestroyedTotal + 1
	
	if (forgesDestroyedTotal >= 3 && player:ServerHasToken("OUTLAW_FORGES_DESTROYED") == false) then
		QuestGlobalEvent("forgesDestroyed")
	
	end

end

