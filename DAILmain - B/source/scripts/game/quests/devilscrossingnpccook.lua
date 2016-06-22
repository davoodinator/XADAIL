/*
	
	GRIM DAWN
	
	For more information, visit us at http://www.grimdawn.com
	
*/

gd.quests.devilsCrossingNPCCook = {}

--
-- Ulgrim (Cook) movement
--
-- Ulgrim starts off in the wilderness and can be rescued by the player, at 
-- which point he sets up in a cook area in the prison in devil's crossing.
-- Later he is transported to act 3 regardless of player's earlier intervention.
--

local captiveCookId = 0
local rescuedCookId = 0
local cookAreaId = 0
local assistantId = 0


local CookState = { Captured = 0, Rescued = 1, Act3 = 2}

-- Ulgrim inside the prison
local rescuedCookStateObjects = orderedTable();
	rescuedCookStateObjects["COOK_ACT3"] = { state = CookState.Act3,  dbr = nil }
	rescuedCookStateObjects["COOK_RESCUED"] = { state = CookState.Rescued,  dbr = "records/creatures/npcs/questnpcs/npc_ulgrim_02.dbr" }
	rescuedCookStateObjects[""] 			= { state = CookState.Captured, dbr = nil }
	
function gd.quests.devilsCrossingNPCCook.rescuedCookOnAddToWorld(objectId)

	if Server then
	
		rescuedCookId = objectId;
		
		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, rescuedCookStateObjects);
		Shared.setUserdata(objectId, userdata);
		
	end
	
end

gd.quests.devilsCrossingNPCCook.rescuedCookOnDestroy = ClearObjectUserdata

-- Ulgrim in the wilderness
local captiveCookStateObjects = orderedTable();
	captiveCookStateObjects["COOK_ACT3"] = { state = CookState.Act3,  dbr = nil }
	captiveCookStateObjects["COOK_RESCUED"] = { state = CookState.Rescued,  dbr = nil };
	captiveCookStateObjects[""] 			= { state = CookState.Captured, dbr = "records/creatures/npcs/questnpcs/npc_ulgrim_01.dbr" }

function gd.quests.devilsCrossingNPCCook.captiveCookOnAddToWorld(objectId)

	if Server then
	
		captiveCookId = objectId

		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, captiveCookStateObjects);
		Shared.setUserdata(objectId, userdata);
		
	end
	
end

gd.quests.devilsCrossingNPCCook.captiveCookOnDestroy = ClearObjectUserdata

-- Ulgrim's area inside the prison
local cookAreaStateObjects = orderedTable()
	cookAreaStateObjects["COOK_RESCUED"] 	= { state = CookState.Rescued,  dbr = "records/storyelements/questassets/dc_cookarea.dbr"}
	cookAreaStateObjects[""] 				= { state = CookState.Captured, dbr = "records/storyelements/questassets/dc_cookarea_wrecked.dbr" }

function gd.quests.devilsCrossingNPCCook.cookAreaOnAddToWorld(objectId)

	if Server then
	
		cookAreaId = objectId

		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, cookAreaStateObjects)
		Shared.setUserdata(objectId, userdata)
		
	end
	
end

function gd.quests.devilsCrossingNPCCook.cookAreaOnRemoveFromWorld(objectId)

	if Server then
	
		cookAreaId = 0
		
	end
end

gd.quests.devilsCrossingNPCCook.cookAreaOnDestroy = ClearObjectUserdata


-- Chef assistant
local assistantStateObjects = orderedTable()
	assistantStateObjects["COOK_ACT3"] 	= { state = CookState.Rescued,  dbr = "records/creatures/npcs/questnpcs/npc_edwin_02.dbr" }
	assistantStateObjects[""] 				= { state = CookState.Captured, dbr = "records/creatures/npcs/questnpcs/npc_edwin_01.dbr" }

function gd.quests.devilsCrossingNPCCook.assistantOnAddToWorld(objectId)

	if Server then
	
		assistantId = objectId

		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, assistantStateObjects)
		Shared.setUserdata(objectId, userdata)
		
	end
	
end

gd.quests.devilsCrossingNPCCook.assistantOnDestroy = ClearObjectUserdata


-- Called by conversation, teleports Ulgrim from the wilderness to the prison and updates the cook area
local cookPortal = false

function gd.quests.devilsCrossingNPCCook.captiveCookPortal()

	if Server then
		local player = Game.GetLocalPlayer()
		
		if player:HasToken("COOK_RESCUED") && cookPortal == false then
			cookPortal = true
			
			local captiveCook = Entity.Get(captiveCookId)
			local rescuedCook = Entity.Get(rescuedCookId)
		
			if (captiveCook != nil) then
		
				local coords = captiveCook:GetCoords()
				local rift = Entity.Create("records/fx/ui/riftgatepersonalopen_fxpak.dbr")
			
				if (rift != nil) then
					rift:NetworkEnable()
					rift:SetCoords(coords)
				end
			
				UpdateObjectSwap(captiveCookId, captiveCookStateObjects)
			
			end
		
			if (rescuedCook != nil) then
		
				local coords = rescuedCook:GetCoords()	
				local riftEnd = Entity.Create("records/fx/ui/riftgatepersonalopen_fxpak.dbr")
			
				if (riftEnd != nil) then
					riftEnd:NetworkEnable()
					riftEnd:SetCoords(coords)
				end
			
				UpdateObjectSwap(rescuedCookId, rescuedCookStateObjects)
			
			end
		
			if (cookAreaId != 0) then
				UpdateObjectSwap(cookAreaId, cookAreaStateObjects)
			end
		
		end
		
	end
	
end





-- Despawn Ulgrim from Act 1
local ulgrimSwap = false

function gd.quests.devilsCrossingNPCCook.UlgrimSwap()

	if Server then
		if not ulgrimSwap then
			ulgrimSwap = true
			local captiveCook = Entity.Get(captiveCookId)
			local rescuedCook = Entity.Get(rescuedCookId)
			local assistant = Entity.Get(assistantId)

			GiveTokenToLocalPlayer("COOK_ACT3")
			
			if (rescuedCook != nil) then
				UpdateObjectSwap(rescuedCookId, rescuedCookStateObjects)
				
			end
			
			if (captiveCook != nil) then
				UpdateObjectSwap(captiveCookId, captiveCookStateObjects)
				
			end
			
			if (assistant != nil) then
				UpdateObjectSwap(assistantId, assistantStateObjects)
			
			end
		
		end
	
	end

end

function gd.quests.devilsCrossingNPCCook.triggerUlgrimSwap(triggererId)

	local player = Player.Get(triggererId)
	
	if (player:HasToken("COOK_ACT3") == false) then
		GiveTokenIfPlayer(triggererId, "COOK_ACT3")
	
	end

	QuestEvent("triggerUlgrimAct3Swap")
	
end


-- Checks if the player has used the Give Soup dialogue with either Ulgrim or Edwin
local hasEaten = false

function gd.quests.devilsCrossingNPCCook.foodCheck()

	local test = false
	
	if not hasEaten then
		test = true
	
	end
	
	return test

end

function gd.quests.devilsCrossingNPCCook.giveFood()
	
	if not hasEaten then
		hasEaten = true
		
	end

end