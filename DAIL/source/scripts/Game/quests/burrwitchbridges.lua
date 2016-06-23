/*
	
	GRIM DAWN
	scripts/quests/devilsCrossing.lua
	
	For more information, visit us at http://www.grimdawn.com
	
*/

gd.quests.burrwitchBridges = {}

-- Possible bridge states
local BridgeState = { Destroyed = 0, Repaired = 1}

--
-- Wightmire to Burrwitch Bridge
--
-- The bridge connecting Wightmire to Burrwitch is broken at the start 
-- of the storyline, but can be repaired by the player when they have gathered enough resources.
--
local wightmire = {}

local wightmireBridgeStateObjects = orderedTable();
	wightmireBridgeStateObjects["GD_WIGHTMIREBRIDGE_REPAIRED"]	= { state = BridgeState.Repaired,  dbr = "records/storyelements/questassets/bridge_farmlands_repaired01.dbr"};
	wightmireBridgeStateObjects[""] 								= { state = BridgeState.Destroyed, dbr = "records/storyelements/questassets/bridge_farmlands_broken01.dbr" };

function gd.quests.burrwitchBridges.wightmireBridgeOnAddToWorld(objectId)

	if Server then
	
		wightmire.bridgeId = objectId
		
		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, wightmireBridgeStateObjects);
		Shared.setUserdata(objectId, userdata);

	end
	
end

gd.quests.burrwitchBridges.wightmireBridgeOnDestroy = ClearObjectUserdata

-- Site
local wightmireBridgeSiteStateObjects = orderedTable();
	wightmireBridgeSiteStateObjects["GD_WIGHTMIREBRIDGE_REPAIRED"]	= { state = BridgeState.Repaired,  dbr = nil };
	wightmireBridgeSiteStateObjects[""] 								= { state = BridgeState.Destroyed, dbr = "records/creatures/npcs/questnpcs/interactiveobjects/npc_wightmirebridge_01.dbr" };

function gd.quests.burrwitchBridges.wightmireBridgeSiteOnAddToWorld(objectId)

	if Server then
	
		wightmire.siteId = objectId

		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, wightmireBridgeSiteStateObjects);
		Shared.setUserdata(objectId, userdata);
		
	end
	
end

gd.quests.burrwitchBridges.wightmireBridgeSiteOnDestroy = ClearObjectUserdata

-- Blockers
local wightmireBridgeBlockerStateObjects = orderedTable();
	wightmireBridgeBlockerStateObjects["GD_WIGHTMIREBRIDGE_REPAIRED"	] = { state = BridgeState.Repaired,  dbr = nil };
	wightmireBridgeBlockerStateObjects[""					 	] = { state = BridgeState.Destroyed, dbr = "records/level art/quests/dynamicblocker_invisible.dbr"  }

function gd.quests.burrwitchBridges.wightmireBridgeBlockerOneOnAddToWorld(objectId)

	if Server then
	
		wightmire.blockerOneId = objectId
		
		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, wightmireBridgeBlockerStateObjects);
		Shared.setUserdata(objectId, userdata);
		
	end
	
end

gd.quests.burrwitchBridges.wightmireBridgeBlockerOneOnDestroy = ClearObjectUserdata

function gd.quests.burrwitchBridges.wightmireBridgeBlockerTwoOnAddToWorld(objectId)

	if Server then
	
		wightmire.blockerTwoId = objectId
		
		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, wightmireBridgeBlockerStateObjects);
		Shared.setUserdata(objectId, userdata);
		
	end
	
end

gd.quests.burrwitchBridges.wightmireBridgeBlockerTwoOnDestroy = ClearObjectUserdata

--Wightmire Bridge Repair
function gd.quests.burrwitchBridges.wightmireBridgeRepairGlobalMP()

GiveTokenToLocalPlayer("GD_WIGHTMIREBRIDGE_REPAIRED")

end

function gd.quests.burrwitchBridges.wightmireBridgeRepair()

	if Server then
		local blocker = Entity.Get(wightmire.blockerOneId)
		
		QuestGlobalEvent("repairWightmireBridgeToken")

		if (blocker != nil) then
			
			local coords = blocker:GetCoords()
			local pfx = Entity.Create("records/fx/general/bridgerepair_fxpak01.dbr")
			
			if (pfx != nil) then
				pfx:NetworkEnable()
				pfx:SetCoords(coords)
			end
		end
		
		UpdateObjectSwap(wightmire.bridgeId, wightmireBridgeStateObjects)
		--UpdateObjectSwap(wightmire.siteId, wightmireBridgeSiteStateObjects)
		UpdateObjectSwap(wightmire.blockerOneId, wightmireBridgeBlockerStateObjects)
		UpdateObjectSwap(wightmire.blockerTwoId, wightmireBridgeBlockerStateObjects)
		
	end
	
end




--
-- Burrwitch Bridge
--
-- The bridge connecting Burrwitch to a secluded part of the swamp is initially broken
-- but can be repaired by the player when they have gathered enough resources.
--
local burrwitch = {}

local burrwitchBridgeStateObjects = orderedTable();
	burrwitchBridgeStateObjects["GD_BURRWITCHBRIDGE_REPAIRED"]	= { state = BridgeState.Repaired,  dbr = "records/storyelements/questassets/bridge_burrwitch_repaired01.dbr"};
	burrwitchBridgeStateObjects[""] 								= { state = BridgeState.Destroyed, dbr = "records/storyelements/questassets/bridge_burrwitch_broken01.dbr" };

function gd.quests.burrwitchBridges.burrwitchBridgeOnAddToWorld(objectId)

	if Server then
	
		burrwitch.bridgeId = objectId
		
		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, burrwitchBridgeStateObjects);
		Shared.setUserdata(objectId, userdata);
		
	end

end

gd.quests.burrwitchBridges.burrwitchBridgeOnDestroy = ClearObjectUserdata

-- Site
local burrwitchBridgeSiteStateObjects = orderedTable();
	burrwitchBridgeSiteStateObjects["GD_BURRWITCHBRIDGE_REPAIRED"]	= { state = BridgeState.Repaired,  dbr = nil };
	burrwitchBridgeSiteStateObjects[""] 								= { state = BridgeState.Destroyed, dbr = "records/creatures/npcs/questnpcs/interactiveobjects/npc_burrwitchbridge_01.dbr" };

function gd.quests.burrwitchBridges.burrwitchBridgeSiteOnAddToWorld(objectId)

	if Server then
	
		burrwitch.siteId = objectId

		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, burrwitchBridgeSiteStateObjects);
		Shared.setUserdata(objectId, userdata);
		
	end
	
end

gd.quests.burrwitchBridges.burrwitchBridgeSiteOnDestroy = ClearObjectUserdata

-- Blockers
local burrwitchBridgeBlockerStateObjects = orderedTable();
	burrwitchBridgeBlockerStateObjects["GD_BURRWITCHBRIDGE_REPAIRED"	] = { state = BridgeState.Repaired,  dbr = nil };
	burrwitchBridgeBlockerStateObjects[""					 	] = { state = BridgeState.Destroyed, dbr = "records/level art/quests/dynamicblocker_invisible.dbr"  }

function gd.quests.burrwitchBridges.burrwitchBridgeBlockerOneOnAddToWorld(objectId)

	if Server then
	
		burrwitch.blockerOneId = objectId
		
		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, burrwitchBridgeBlockerStateObjects);
		Shared.setUserdata(objectId, userdata);
		
	end
	
end

gd.quests.burrwitchBridges.burrwitchBridgeBlockerOneOnDestroy = ClearObjectUserdata

--Burrwitch Bridge Repair
function gd.quests.burrwitchBridges.burrwitchBridgeRepairGlobalMP()
	local player = Game.GetLocalPlayer()
	
	if player:HasToken("GD_BURRWITCHBRIDGE_BLOCKADECLEARED") then
		GiveTokenToLocalPlayer("GD_BURRWITCHBRIDGE_REPAIRED")
	
	end

end

function gd.quests.burrwitchBridges.burrwitchBridgeRepair()

	if Server then
		local blocker = Entity.Get(burrwitch.blockerOneId)
		
		QuestGlobalEvent("repairBurrwitchBridgeToken")
		
		if (blocker != nil) then
			
			local coords = blocker:GetCoords()
			local pfx = Entity.Create("records/fx/general/bridgerepair_fxpak01.dbr")
			
			if (pfx != nil) then
				pfx:NetworkEnable()
				pfx:SetCoords(coords)
			end
		end
		
		UpdateObjectSwap(burrwitch.bridgeId, burrwitchBridgeStateObjects)
		--UpdateObjectSwap(burrwitch.siteId, burrwitchBridgeSiteStateObjects)
		UpdateObjectSwap(burrwitch.blockerOneId, burrwitchBridgeBlockerStateObjects)
		
	end
	
end

--Burrwitch Bridge Blockade, must be destroyed before bridge can be repaired
local blockadeId = 0
local spawnedBlockade = false

-- Blockade
local burrwitchBlockadeStateObjects = orderedTable();
	burrwitchBlockadeStateObjects["GD_BURRWITCHBRIDGE_BLOCKADECLEARED"]	= { state = BridgeState.Repaired,  dbr = nil }
	burrwitchBlockadeStateObjects[""] 								= { state = BridgeState.Destroyed, dbr = "records/storyelements/questassets/debriswall_burrwitchbridge_break.dbr" }

function gd.quests.burrwitchBridges.burrwitchBlockadeOnAddToWorld(objectId)

	if Server then
		if (not spawnedBlockade) then

			local userdata = {};
			TokenStateBasedObjectSwap(objectId, userdata, burrwitchBlockadeStateObjects);
			Shared.setUserdata(objectId, userdata);
		
			spawnedBlockade = true
		
		end
		
	end
	
end

function gd.quests.burrwitchBridges.burrwitchBlockadeAvatarOnAddToWorld(objectId)

	if Server then
		blockadeId = objectId
		
	end
	
end

gd.quests.burrwitchBridges.burrwitchBlockadeOnDestroy = ClearObjectUserdata

-- Burrwitch Destroy Blockade
function gd.quests.burrwitchBridges.blockadeDestroyGlobalMP()

GiveTokenToLocalPlayer("GD_BURRWITCHBRIDGE_BLOCKADECLEARED")

end

function gd.quests.burrwitchBridges.blockadeDestroy()

	if Server then
		if blockadeId != 0 then
			local blockade = Destructible.Get(blockadeId)
			local coords = blockade:GetCoords()
			blockade:Destroy(Vec(0,1,0), 1000, false)
			blockadeId = 0
		
			local pfx = Entity.Create("records/fx/skillsother/attackradius/detonatelarge_fxpak01.dbr")
			if pfx != nil then
				pfx:NetworkEnable()
				pfx:SetCoords(coords)
				
			end
			
		end
	
		QuestGlobalEvent("detonationBurrwitchBridgeToken")
	
	end
	
end