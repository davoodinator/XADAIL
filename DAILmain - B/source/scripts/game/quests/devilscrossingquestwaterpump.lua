/*
	
	GRIM DAWN
	scripts/quests/devilscrossing.lua
	
	For more information, visit us at http://www.grimdawn.com
	
*/

gd.quests.devilsCrossingQuestWaterpump = {}

--
-- Waterpump replacement
--

local waterpumpId = 0
local waterPumpRepaired = false
local waterPumpCleansed = false

local WaterpumpState = { Destroyed = 0, Repaired = 1, Cleansed = 2 }

local waterpumpStateObjects = orderedTable()
	waterpumpStateObjects["DC_WATERPUMP_CLEANSED"] = { state = WaterpumpState.Cleansed,  dbr = "records/storyelements/questassets/watersupply_finalworking01.dbr" };
	waterpumpStateObjects["DC_WATERPUMP_REPAIRED"] = { state = WaterpumpState.Repaired,  dbr = "records/storyelements/questassets/watersupply_poisonedwater01.dbr" };
	waterpumpStateObjects[""]					   = { state = WaterpumpState.Destroyed, dbr = "records/storyelements/questassets/watersupply_brokenwindmill01.dbr" };

-- Update waterpump asset based on token states
local function UpdateWaterpump()

	if Server then
	
		local userdata = Shared.getUserdata(waterpumpId)

		TokenStateBasedObjectSwap(waterpumpId, userdata, waterpumpStateObjects);
		
	end

end
	
function gd.quests.devilsCrossingQuestWaterpump.waterpumpOnAddToWorld(objectId)

	if Server then
	
		waterpumpId = objectId

		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, waterpumpStateObjects);
	
		Shared.setUserdata(objectId, userdata);
		
	end
	
end

gd.quests.devilsCrossingQuestWaterpump.waterpumpOnDestroy = ClearObjectUserdata

-- Transition waterpump to repaired asset

function gd.quests.devilsCrossingQuestWaterpump.repairWaterpumpMP()

		GiveTokenToLocalPlayer("DC_WATERPUMP_REPAIRED")
		
end

function gd.quests.devilsCrossingQuestWaterpump.repairWaterpump()

	if Server then
		-- Give repair credit to all players
		QuestGlobalEvent("repairWaterpumpToken")
		
		if not waterPumpRepaired then
			local pump = Entity.Get(waterpumpId)
			
			UpdateWaterpump()
			
			waterPumpRepaired = true
		
			if (pump != nil) then
			
				local coords = pump:GetCoords()
				local pfx = Entity.Create("records/fx/general/bridgerepair_fxpak01.dbr")
			
				if (pfx != nil) then
					pfx:NetworkEnable()
					pfx:SetCoords(coords)
				end
			end
		
		end
		
	end
	
end

-- Transition waterpump to cleaned asset
function gd.quests.devilsCrossingQuestWaterpump.cleanseWaterpump()
	
	if Server then
		local player = Game.GetLocalPlayer()
		
		if player:HasToken("DC_WATERPUMP_CLEANSED") && not waterPumpCleansed then
			waterPumpCleansed = true
			UpdateWaterpump()
		
		end
		
	end
		
end


--
-- Reservoir trapdoor
--
local reservoirTrapdoorId = 0

function gd.quests.devilsCrossingQuestWaterpump.barnabasTrapDoorOnAddToWorld(objectId)

	if Server then
	
		reservoirTrapdoorId = objectId;
		
		local player = Game.GetLocalPlayer()
		local door = Door.Get(objectId)
		
		if player:HasToken("DC_RESEVOIR_OPEN") || player:HasToken("DC_RESERVOIR_OPEN") then
			door:SetLocked(false)
		end
		
	end
		
end

local trapDoorOpened = false

function gd.quests.devilsCrossingQuestWaterpump.barnabasTrapDoorUnlock()
	
	if Server then
		if not trapDoorOpened then
			trapDoorOpened = true	
			local door = Door.Get(reservoirTrapdoorId)
		
			if (door != nil) then
				door:SetLocked(false)
				
			end
			
		end
	
	end

end

-- Kill function for Viloth
function gd.quests.devilsCrossingQuestWaterpump.vilothKilledGlobalMP()

	QuestGlobalEvent("killViloth")
	
end

function gd.quests.devilsCrossingQuestWaterpump.vilothKilled()
	GiveTokenToLocalPlayer("VILOTH_KILLED")
end