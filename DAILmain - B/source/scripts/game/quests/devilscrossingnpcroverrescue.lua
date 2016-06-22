/*
	
	GRIM DAWN
	
	For more information, visit us at http://www.grimdawn.com
	
*/

gd.quests.devilsCrossingNPCRoverRescue = {}

--
-- Rover Rescue
--
-- The rovers spawn in a cave in the wilderness and can be rescued by the player,
-- at which point they are removed from the world.
--

local RoverState = { Captured = 0, Rescued = 1 }

-- Jasper the Rover
local captiveRoverJasperStateObjects = orderedTable();
	captiveRoverJasperStateObjects["ROVER_RESCUED"] = { state = RoverState.Rescued,  dbr = nil };
	captiveRoverJasperStateObjects[""			  ] = { state = RoverState.Captured, dbr = "records/creatures/npcs/flavornpcs/devilscrossing/npc_roverjasper_01.dbr"   }

function gd.quests.devilsCrossingNPCRoverRescue.captiveRoverJasperOnAddToWorld(objectId)
	
	if Server then
		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, captiveRoverJasperStateObjects);
		Shared.setUserdata(objectId, userdata);
		
	end
	
end
	
-- Rover01
local captiveRover01StateObjects = orderedTable();
	captiveRover01StateObjects["ROVER_RESCUED"    ] = { state = RoverState.Rescued,  dbr = nil };
	captiveRover01StateObjects[""			      ] = { state = RoverState.Captured, dbr = "records/creatures/npcs/flavornpcs/devilscrossing/npc_roverprisoner_01.dbr" }

function gd.quests.devilsCrossingNPCRoverRescue.captiveRover01OnAddToWorld(objectId)

	if Server then
		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, captiveRover01StateObjects);
		Shared.setUserdata(objectId, userdata);
		
	end
	
end
	
-- Rover02
local captiveRover02StateObjects = orderedTable();
	captiveRover02StateObjects["ROVER_RESCUED"    ] = { state = RoverState.Rescued,  dbr = nil };
	captiveRover02StateObjects[""				  ] = { state = RoverState.Captured, dbr = "records/creatures/npcs/flavornpcs/devilscrossing/npc_roverprisoner_02.dbr" }

function gd.quests.devilsCrossingNPCRoverRescue.captiveRover02OnAddToWorld(objectId)

	if Server then
		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, captiveRover02StateObjects);
		Shared.setUserdata(objectId, userdata);

	end
	
end

-- Common destructor
gd.quests.devilsCrossingNPCRoverRescue.captiveRoverOnDestroy = ClearObjectUserdata