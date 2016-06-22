/*
	
	GRIM DAWN
	scripts/quests/devilsCrossing.lua
	
	For more information, visit us at http://www.grimdawn.com
	
*/

gd.quests.homesteadBridges = {}

-- Possible bridge states
local BridgeState = { Destroyed = 0, Repaired = 1}

--
-- Homestead Bridge
--
-- The bridge connecting Old Arkovia to Homestead is broken at the start 
-- of the storyline, but can be repaired by the player when they have gathered enough resources.
--
local homestead = {}

local homesteadBridgeStateObjects = orderedTable();
	homesteadBridgeStateObjects["GD_HOMESTEADBRIDGE_REPAIRED"]	= { state = BridgeState.Repaired,  dbr = "records/storyelements/questassets/bridge_farmlands_repaired01.dbr"};
	homesteadBridgeStateObjects[""] 								= { state = BridgeState.Destroyed, dbr = "records/storyelements/questassets/bridge_farmlands_broken01.dbr" };

function gd.quests.homesteadBridges.homesteadBridgeOnAddToWorld(objectId)

	if Server then
	
		homestead.bridgeId = objectId
		
		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, homesteadBridgeStateObjects);
		Shared.setUserdata(objectId, userdata);
		
	end

end

gd.quests.homesteadBridges.homesteadBridgeOnDestroy = ClearObjectUserdata

-- Site
local homesteadBridgeSiteStateObjects = orderedTable();
	homesteadBridgeSiteStateObjects["GD_HOMESTEADBRIDGE_REPAIRED"]	= { state = BridgeState.Repaired,  dbr = nil };
	homesteadBridgeSiteStateObjects[""] 								= { state = BridgeState.Destroyed, dbr = "records/creatures/npcs/questnpcs/interactiveobjects/npc_homesteadbridge_01.dbr" };

function gd.quests.homesteadBridges.homesteadBridgeSiteOnAddToWorld(objectId)

	if Server then
	
		homestead.siteId = objectId

		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, homesteadBridgeSiteStateObjects);
		Shared.setUserdata(objectId, userdata);
		
	end
	
end

gd.quests.homesteadBridges.homesteadBridgeSiteOnDestroy = ClearObjectUserdata

-- Blockers
local homesteadBridgeBlockerStateObjects = orderedTable();
	homesteadBridgeBlockerStateObjects["GD_HOMESTEADBRIDGE_REPAIRED"	] = { state = BridgeState.Repaired,  dbr = nil };
	homesteadBridgeBlockerStateObjects[""					 	] = { state = BridgeState.Destroyed, dbr = "records/level art/quests/dynamicblocker_invisible.dbr"  }

function gd.quests.homesteadBridges.homesteadBridgeBlockerOneOnAddToWorld(objectId)

	if Server then
	
		homestead.blockerOneId = objectId
		
		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, homesteadBridgeBlockerStateObjects);
		Shared.setUserdata(objectId, userdata);
		
	end
	
end

gd.quests.homesteadBridges.homesteadBridgeBlockerOneOnDestroy = ClearObjectUserdata

function gd.quests.homesteadBridges.homesteadBridgeBlockerTwoOnAddToWorld(objectId)

	if Server then
	
		homestead.blockerTwoId = objectId
		
		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, homesteadBridgeBlockerStateObjects);
		Shared.setUserdata(objectId, userdata);
		
	end
	
end

gd.quests.homesteadBridges.homesteadBridgeBlockerTwoOnDestroy = ClearObjectUserdata

--Homestead Bridge Repair
function gd.quests.homesteadBridges.homesteadBridgeRepairGlobalMP()

GiveTokenToLocalPlayer("GD_HOMESTEADBRIDGE_REPAIRED")

end

function gd.quests.homesteadBridges.homesteadBridgeRepair()

	if Server then
		local blocker = Entity.Get(homestead.blockerOneId)
		
		QuestGlobalEvent("repairHomesteadBridgeToken")

		if (blocker != nil) then
			
			local coords = blocker:GetCoords()
			local pfx = Entity.Create("records/fx/general/bridgerepair_fxpak01.dbr")
			
			if (pfx != nil) then
				pfx:NetworkEnable()
				pfx:SetCoords(coords)
			end
		end
		
		UpdateObjectSwap(homestead.bridgeId, homesteadBridgeStateObjects)
		--UpdateObjectSwap(homestead.siteId, homesteadBridgeSiteStateObjects)
		UpdateObjectSwap(homestead.blockerOneId, homesteadBridgeBlockerStateObjects)
		UpdateObjectSwap(homestead.blockerTwoId, homesteadBridgeBlockerStateObjects)
		
	end
	
end
