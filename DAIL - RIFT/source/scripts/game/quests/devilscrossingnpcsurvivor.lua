/*
	
	GRIM DAWN
	
	For more information, visit us at http://www.grimdawn.com
	
*/

gd.quests.devilsCrossingNPCSurvivor = {}

--
-- Survivor starts in Lower Crossing, teleported to Devil's Crossing by player as an introduction to the NPC rescue mechanic
--
 
local rescuedSurvivorId = 0
local trappedSurvivorId = 0
 
local SurvivorState = { Default = 0, Rescued = 1 }

-- Survivor in Devil's Crossing
local rescuedSurvivorStateObjects = orderedTable();
	rescuedSurvivorStateObjects["LOWERCROSSING_SURVIVOR_RESCUED"] = { state = SurvivorState.Rescued,  dbr = "records/creatures/npcs/flavornpcs/devilscrossing/npc_lowercrossing_survivor01b.dbr" }
	rescuedSurvivorStateObjects[""] 				= { state = SurvivorState.Default, dbr = nil }
	
function gd.quests.devilsCrossingNPCSurvivor.rescuedSurvivorOnAddToWorld(objectId)

	if Server then
		rescuedSurvivorId = objectId
	
		local userdata = {}
		TokenStateBasedObjectSwap(objectId, userdata, rescuedSurvivorStateObjects)
		Shared.setUserdata(objectId, userdata)
		
	end
	
end

gd.quests.devilsCrossingNPCSurvivor.rescuedSurvivorOnDestroy = ClearObjectUserdata

-- Survivor in the wilderness
local trappedSurvivorStateObjects = orderedTable()
	trappedSurvivorStateObjects["LOWERCROSSING_SURVIVOR_RESCUED"] = { state = SurvivorState.Rescued,  dbr = nil }
	trappedSurvivorStateObjects[""] 				= { state = SurvivorState.Default, dbr = "records/creatures/npcs/flavornpcs/devilscrossing/npc_lowercrossing_survivor01.dbr" }

function gd.quests.devilsCrossingNPCSurvivor.trappedSurvivorOnAddToWorld(objectId)

	if Server then
		trappedSurvivorId = objectId

		local userdata = {}
		TokenStateBasedObjectSwap(objectId, userdata, trappedSurvivorStateObjects)
		Shared.setUserdata(objectId, userdata)
		
	end
	
end

gd.quests.devilsCrossingNPCSurvivor.trappedSurvivorOnDestroy = ClearObjectUserdata

-- Called by conversation, teleports Survivor from the Lower Crossing to Devil's Crossing
local portal = false

function gd.quests.devilsCrossingNPCSurvivor.portal()

	if Server then
		local player = Game.GetLocalPlayer()
		
		if player:HasToken("LOWERCROSSING_SURVIVOR_RESCUED") && not portal then
			portal = true
			local trappedSurvivor = Entity.Get(trappedSurvivorId)
			local rescuedSurvivor = Entity.Get(rescuedSurvivorId)

			if (trappedSurvivor != nil) then
		
				local coords = trappedSurvivor:GetCoords()
				local rift = Entity.Create("records/fx/ui/riftgatepersonalopen_fxpak.dbr")
			
				if (rift != nil) then
					rift:NetworkEnable()
					rift:SetCoords(coords)
				end
		
				UpdateObjectSwap(trappedSurvivorId, trappedSurvivorStateObjects)
			
			end
		
			if (rescuedSurvivor != nil) then
		
				local coords = rescuedSurvivor:GetCoords()
				local riftEnd = Entity.Create("records/fx/ui/riftgatepersonalopen_fxpak.dbr")
			
				if (riftEnd != nil) then
					riftEnd:NetworkEnable()
					riftEnd:SetCoords(coords)
				end
		
				UpdateObjectSwap(rescuedSurvivorId, rescuedSurvivorStateObjects)
		
			end
		
		end
	
	end
	
end

