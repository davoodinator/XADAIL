/*
	
	GRIM DAWN
	
	For more information, visit us at http://www.grimdawn.com
	
*/

gd.quests.devilsCrossingBridges = {}

-- Possible bridge states
local BridgeState = { Destroyed = 0, Repaired = 1 }

--
-- Old Grove Bridge
--
-- The west bridge out of devil's crossing leading to the old grove is broken at the start 
-- of the storyline, but can be repaired by the player when they have gathered enough resources.
--

local oldgrove = {}

-- Bridge
local oldGroveBridgeStateObjects = orderedTable()
	oldGroveBridgeStateObjects["GD_OLDGROVEBRIDGE_REPAIRED"] 	 	= { state = BridgeState.Repaired,  dbr = "records/storyelements/questassets/waterfrontbridge_finalworking01.dbr" }
	oldGroveBridgeStateObjects[""] 							 	 	= { state = BridgeState.Destroyed, dbr = "records/storyelements/questassets/waterfrontbridge_finalworking01.dbr" }

function gd.quests.devilsCrossingBridges.oldGroveBridgeOnAddToWorld(objectId)

	if Server then
	
		oldgrove.bridgeId = objectId

		local userdata = {}
		TokenStateBasedObjectSwap(objectId, userdata, oldGroveBridgeStateObjects)
		Shared.setUserdata(objectId, userdata)
	
	end
	
end

gd.quests.devilsCrossingBridges.oldGroveBridgeOnDestroy = ClearObjectUserdata

-- Site
local oldGroveBridgeSiteStateObjects = orderedTable()
	oldGroveBridgeSiteStateObjects["GD_OLDGROVEBRIDGE_REPAIRED"] 	= { state = BridgeState.Repaired,  dbr = "records/creatures/npcs/questnpcs/interactiveobjects/npc_oldgrovebridge_01.dbr" }
	oldGroveBridgeSiteStateObjects[""] 							 	= { state = BridgeState.Destroyed, dbr = "records/creatures/npcs/questnpcs/interactiveobjects/npc_oldgrovebridge_01.dbr" }

function gd.quests.devilsCrossingBridges.oldGroveBridgeSiteOnAddToWorld(objectId)

	if Server then
	
		oldgrove.siteId = objectId;
		
		local userdata = {}
		TokenStateBasedObjectSwap(objectId, userdata, oldGroveBridgeSiteStateObjects)
		Shared.setUserdata(objectId, userdata)
		
	end

end

gd.quests.devilsCrossingBridges.oldGroveBridgeSiteOnDestroy = ClearObjectUserdata

-- Blocker
local oldGroveBridgeBlockerStateObjects = orderedTable()
	oldGroveBridgeBlockerStateObjects["GD_OLDGROVEBRIDGE_REPAIRED"] = { state = BridgeState.Repaired,  dbr = nil }
	oldGroveBridgeBlockerStateObjects[""] 							= { state = BridgeState.Destroyed, dbr = nil }
	
function gd.quests.devilsCrossingBridges.oldGroveBridgeBlockerOnAddToWorld(objectId)

	if Server then
	
		oldgrove.blockerId = objectId

		local userdata = {}
		TokenStateBasedObjectSwap(objectId, userdata, oldGroveBridgeBlockerStateObjects)
		Shared.setUserdata(objectId, userdata)
		
	end
	
end

gd.quests.devilsCrossingBridges.oldGroveBridgeBlockerOnDestroy = ClearObjectUserdata

-- Repair
function gd.quests.devilsCrossingBridges.oldGroveBridgeRepairGlobalMP()

GiveTokenToLocalPlayer("GD_OLDGROVEBRIDGE_REPAIRED")

end

function gd.quests.devilsCrossingBridges.oldGroveBridgeRepair()

	if Server then
		local blocker = Entity.Get(oldgrove.blockerId)
		
		QuestGlobalEvent("repairOldGroveBridgeToken")

		if (blocker != nil) then
			
			local coords = blocker:GetCoords()
			local pfx = Entity.Create("records/fx/general/bridgerepair_fxpak01.dbr")
			
			if (pfx != nil) then
				pfx:NetworkEnable()
				pfx:SetCoords(coords)
			end
		end
		
		UpdateObjectSwap(oldgrove.bridgeId,  oldGroveBridgeStateObjects)
		--UpdateObjectSwap(oldgrove.siteId,    oldGroveBridgeSiteStateObjects)
		UpdateObjectSwap(oldgrove.blockerId, oldGroveBridgeBlockerStateObjects)
		
	end
	
end

--
-- Farmland Bridge
--
-- The north bridge out of devil's crossing leading to the old grove is broken at the start 
-- of the storyline, but can be repaired by the player when they have gathered enough resources.
--

local farmland = {}

-- Bridge
local farmlandBridgeStateObjects = orderedTable();
	farmlandBridgeStateObjects["GD_FARMLANDBRIDGE_REPAIRED"]		= { state = BridgeState.Repaired,  dbr = "records/storyelements/questassets/bridge_farmlands_repaired01.dbr"}
	farmlandBridgeStateObjects[""] 									= { state = BridgeState.Destroyed, dbr = "records/storyelements/questassets/bridge_farmlands_broken01.dbr" }
	
function gd.quests.devilsCrossingBridges.farmlandBridgeOnAddToWorld(objectId)

	if Server then
	
		farmland.bridgeId = objectId

		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, farmlandBridgeStateObjects);
		Shared.setUserdata(objectId, userdata);
		
	end
	
end

gd.quests.devilsCrossingBridges.farmlandBridgeOnDestroy = ClearObjectUserdata

-- Site
local farmlandBridgeSiteStateObjects = orderedTable();
	farmlandBridgeSiteStateObjects["GD_FARMLANDBRIDGE_REPAIRED"]	= { state = BridgeState.Repaired,  dbr = nil }
	farmlandBridgeSiteStateObjects[""] 								= { state = BridgeState.Destroyed, dbr = "records/creatures/npcs/questnpcs/interactiveobjects/npc_farmlandbridge_01.dbr" }

function gd.quests.devilsCrossingBridges.farmlandBridgeSiteOnAddToWorld(objectId)

	if Server then
	
		farmland.siteId = objectId

		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, farmlandBridgeSiteStateObjects);
		Shared.setUserdata(objectId, userdata);
		
	end
	
end

gd.quests.devilsCrossingBridges.farmlandBridgeSiteOnDestroy = ClearObjectUserdata

-- Blocker
local farmlandBridgeBlockerStateObjects = orderedTable();
	farmlandBridgeBlockerStateObjects["GD_FARMLANDBRIDGE_REPAIRED"] = { state = BridgeState.Repaired,  dbr = nil }
	farmlandBridgeBlockerStateObjects[""] 							= { state = BridgeState.Destroyed, dbr = "records/level art/quests/dynamicblocker_invisible.dbr" }

function gd.quests.devilsCrossingBridges.farmlandBridgeBlockerOnAddToWorld(objectId)

	if Server then
	
		farmland.blockerId = objectId

		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, farmlandBridgeBlockerStateObjects);
		Shared.setUserdata(objectId, userdata);
		
	end
	
end

gd.quests.devilsCrossingBridges.farmlandBridgeBlockerOnDestroy = ClearObjectUserdata

-- Repair
function gd.quests.devilsCrossingBridges.farmlandBridgeRepairGlobalMP()

GiveTokenToLocalPlayer("GD_FARMLANDBRIDGE_REPAIRED")

end

function gd.quests.devilsCrossingBridges.farmlandBridgeRepair()

	if Server then
		local blocker = Entity.Get(farmland.blockerId)
		
		QuestGlobalEvent("repairFarmlandBridgeToken")

		if (blocker != nil) then
			
			local coords = blocker:GetCoords()
			local pfx = Entity.Create("records/fx/general/bridgerepair_fxpak01.dbr")
			
			if (pfx != nil) then
				pfx:NetworkEnable()
				pfx:SetCoords(coords)
				
			end
			
		end
		
		UpdateObjectSwap(farmland.bridgeId,  farmlandBridgeStateObjects)
		UpdateObjectSwap(farmland.blockerId, farmlandBridgeBlockerStateObjects)
		
	end

end
