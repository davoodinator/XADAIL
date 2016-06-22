/*
	
	GRIM DAWN
	
	For more information, visit us at http://www.grimdawn.com
	
*/

gd.quests.devilsCrossingNPCSpiritGuide = {}

--
-- Spirit Guide Swapping from NPC to Service
--

local spiritGuideId = 0

local SpiritGuideState = { NPC = 0, Service = 1 }

-- Luther Graves in devil's crossing
local spiritGuideStateObjects = orderedTable();
	spiritGuideStateObjects["SPIRITGUIDE_SERVICE"] = { state = SpiritGuideState.Service,  dbr = "records/creatures/npcs/merchants/reallocatora01.dbr" };
	spiritGuideStateObjects[""] 				= { state = SpiritGuideState.NPC, dbr = "records/creatures/npcs/flavornpcs/devilscrossing/npc_spiritguide_01.dbr" };
	
function gd.quests.devilsCrossingNPCSpiritGuide.spiritGuideOnAddToWorld(objectId)

	if Server then
		spiritGuideId = objectId
		
		local userdata = {}
		TokenStateBasedObjectSwap(objectId, userdata, spiritGuideStateObjects)
		Shared.setUserdata(objectId, userdata)
		
	end
	
end

gd.quests.devilsCrossingNPCSpiritGuide.spiritGuideOnDestroy = ClearObjectUserdata


-- Called by conversation, swaps Spirit Guide from conversation npc to service NPC
local spiritGuideSwap = false

function gd.quests.devilsCrossingNPCSpiritGuide.spiritGuideSwap()

	if Server then
		if not spiritGuideSwap then
			spiritGuideSwap = true
			GiveTokenToLocalPlayer("SPIRITGUIDE_SERVICE")
			UpdateObjectSwap(spiritGuideId, spiritGuideStateObjects)
		
		end
		
	end
	
end


-- Give starting player their necklace
function gd.quests.devilsCrossingNPCSpiritGuide.triggerSpawnNecklace(triggererId)

	local player = Player.Get(triggererId)
		
	if (player:GetLevel() < 2 && player:HasToken("SALT_NECKLACE") == false) then
		GiveTokenIfPlayer(triggererId, "SALT_NECKLACE")
		player:GiveItem("records/items/gearaccessories/necklaces/a00_necklace.dbr", 1, false)

		
	end
	
end

