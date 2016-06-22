/*
	
	GRIM DAWN
	scripts/quests/areaDBridges.lua
	
	For more information, visit us at http://www.grimdawn.com
	
*/

gd.quests.areaDBridges = {}

-- Possible bridge states
local BridgeState = { Destroyed = 0, Repaired = 1}

--
-- Necropolis Bridge
--
-- The bridge connecting Necropolis to area with Chthonic Roguelike
--
local necropolis = {}

local necropolisBridgeStateObjects = orderedTable();
	necropolisBridgeStateObjects["GD_NECROPOLISBRIDGE_REPAIRED"]	= { state = BridgeState.Repaired,  dbr = "records/storyelements/questassets/bridge_necropolis_repaired01.dbr"};
	necropolisBridgeStateObjects[""] 								= { state = BridgeState.Destroyed, dbr = "records/storyelements/questassets/bridge_necropolis_broken01.dbr" };

function gd.quests.areaDBridges.necropolisBridgeOnAddToWorld(objectId)

	if Server then
	
		necropolis.bridgeId = objectId
		
		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, necropolisBridgeStateObjects);
		Shared.setUserdata(objectId, userdata);
		
	end

end

gd.quests.areaDBridges.necropolisBridgeOnDestroy = ClearObjectUserdata

-- Site
local necropolisBridgeSiteStateObjects = orderedTable();
	necropolisBridgeSiteStateObjects["GD_NECROPOLISBRIDGE_REPAIRED"]	= { state = BridgeState.Repaired,  dbr = nil };
	necropolisBridgeSiteStateObjects[""] 								= { state = BridgeState.Destroyed, dbr = "records/creatures/npcs/questnpcs/interactiveobjects/npc_necropolisbridge_01.dbr" };

function gd.quests.areaDBridges.necropolisBridgeSiteOnAddToWorld(objectId)

	if Server then
	
		necropolis.siteId = objectId

		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, necropolisBridgeSiteStateObjects);
		Shared.setUserdata(objectId, userdata);
		
	end
	
end

gd.quests.areaDBridges.necropolisBridgeSiteOnDestroy = ClearObjectUserdata

-- Blockers
local necropolisBridgeBlockerStateObjects = orderedTable();
	necropolisBridgeBlockerStateObjects["GD_NECROPOLISBRIDGE_REPAIRED"	] = { state = BridgeState.Repaired,  dbr = nil };
	necropolisBridgeBlockerStateObjects[""					 	] = { state = BridgeState.Destroyed, dbr = "records/level art/quests/dynamicblockerlarge_invisible.dbr"  }

function gd.quests.areaDBridges.necropolisBridgeBlockerOneOnAddToWorld(objectId)

	if Server then
	
		necropolis.blockerOneId = objectId
		
		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, necropolisBridgeBlockerStateObjects);
		Shared.setUserdata(objectId, userdata);
		
	end
	
end

gd.quests.areaDBridges.necropolisBridgeBlockerOneOnDestroy = ClearObjectUserdata


--necropolis Bridge Repair
function gd.quests.areaDBridges.necropolisBridgeRepairGlobalMP()

GiveTokenToLocalPlayer("GD_NECROPOLISBRIDGE_REPAIRED")

end

function gd.quests.areaDBridges.necropolisBridgeRepair()

	if Server then
		local blocker = Entity.Get(necropolis.blockerOneId)
		
		QuestGlobalEvent("repairNecropolisBridgeToken")

		if (blocker != nil) then
			
			local coords = blocker:GetCoords()
			local pfx = Entity.Create("records/fx/general/bridgerepair_fxpak01.dbr")
			
			if (pfx != nil) then
				pfx:NetworkEnable()
				pfx:SetCoords(coords)
			end
		end
		
		UpdateObjectSwap(necropolis.bridgeId, necropolisBridgeStateObjects)
		UpdateObjectSwap(necropolis.blockerOneId, necropolisBridgeBlockerStateObjects)
		
	end
	
end
