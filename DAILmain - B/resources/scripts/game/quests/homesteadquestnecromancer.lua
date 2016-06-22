/*
	
	GRIM DAWN
	
	For more information, visit us at http://www.grimdawn.com
	
*/

gd.quests.homesteadQuestNecromancer = {}


--
-- Necromancer + Steps of Torment quest line. Retroactive credit for killing oligarchs
--


function gd.quests.homesteadQuestNecromancer.oligarchOneKilled()

	local player = Game.GetLocalPlayer()
	
	if (not player:HasToken("HS_OLIGARCH_ALLKILLED")) then
		if (player != nil) then
			player:GiveToken("HS_OLIGARCHONE_KILLED")
			
		end
		
		if (player:HasToken("HS_OLIGARCHONE_KILLED") && player:HasToken("HS_OLIGARCHTWO_KILLED") && player:HasToken("HS_OLIGARCHTHREE_KILLED")) then
			player:GiveToken("HS_OLIGARCH_ALLKILLED")
			
		end
		
	end

end

function gd.quests.homesteadQuestNecromancer.oligarchTwoKilled()

	local player = Game.GetLocalPlayer()
	
	if (not player:HasToken("HS_OLIGARCH_ALLKILLED")) then
		if (player != nil) then
			player:GiveToken("HS_OLIGARCHTWO_KILLED")
			
		end
		
		if (player:HasToken("HS_OLIGARCHONE_KILLED") && player:HasToken("HS_OLIGARCHTWO_KILLED") && player:HasToken("HS_OLIGARCHTHREE_KILLED")) then
			player:GiveToken("HS_OLIGARCH_ALLKILLED")
			
		end
		
	end

end

function gd.quests.homesteadQuestNecromancer.oligarchThreeKilled()

	local player = Game.GetLocalPlayer()
	
	if (not player:HasToken("HS_OLIGARCH_ALLKILLED")) then
		if (player != nil) then
			player:GiveToken("HS_OLIGARCHTHREE_KILLED")
			
		end
		
		if (player:HasToken("HS_OLIGARCHONE_KILLED") && player:HasToken("HS_OLIGARCHTWO_KILLED") && player:HasToken("HS_OLIGARCHTHREE_KILLED")) then
			player:GiveToken("HS_OLIGARCH_ALLKILLED")
			
		end
		
	end

end


local ghostCampId = 0
local ghostOutsideRuinId =  0.
local ghostInsideRuinId = 0

local GhostState = { Camp = 0, Ruin = 1, Finished = 2 }

--Ghost in camp
local ghostCampStateObjects = orderedTable()
	ghostCampStateObjects["HS_GHOST_FINISHED"	] = { state = GhostState.Finished,  dbr = nil }
	ghostCampStateObjects["HS_GHOST_RUIN"	] = { state = GhostState.Ruin,  dbr = nil }
	ghostCampStateObjects[""					 	] = { state = GhostState.Camp, dbr = "records/creatures/npcs/questnpcs/gdareab/npc_necromancerghost_01.dbr"}

function gd.quests.homesteadQuestNecromancer.ghostCampOnAddToWorld(objectId)

	if Server then
		ghostCampId = objectId

		local userdata = {}
		TokenStateBasedObjectSwap(objectId, userdata, ghostCampStateObjects)
		Shared.setUserdata(objectId, userdata)
	
	end
	
end

gd.quests.homesteadQuestNecromancer.ghostCampOnDestroy = ClearObjectUserdata


--Ghost inside Steps of Torment
local ghostInsideRuinStateObjects = orderedTable()
	ghostInsideRuinStateObjects["HS_GHOST_FINISHED"	] = { state = GhostState.Finished,  dbr = "records/creatures/npcs/questnpcs/gdareab/npc_necromancerghost_01.dbr"}
	ghostInsideRuinStateObjects["HS_GHOST_RUIN"	] = { state = GhostState.Ruin,  dbr = nil }
	ghostInsideRuinStateObjects[""					 	] = { state = GhostState.Camp, dbr = nil }

	
function gd.quests.homesteadQuestNecromancer.ghostInsideRuinOnAddToWorld(objectId)
	
	if Server then
		ghostInsideRuinId = objectId
	
		local userdata = {}
		local didWork, newState = TokenStateBasedObjectSwap(objectId, userdata, ghostInsideRuinStateObjects)
	
		Shared.setUserdata(objectId, userdata)
	
	end

end

gd.quests.homesteadQuestNecromancer.ghostInsideRuinOnDestroy = ClearObjectUserdata


--Ghost outside Steps of Torment
local ghostOutsideRuinStateObjects = orderedTable()
	ghostOutsideRuinStateObjects["HS_GHOST_FINISHED"	] = { state = GhostState.Finished,  dbr = nil }
	ghostOutsideRuinStateObjects["HS_GHOST_RUIN"	] = { state = GhostState.Ruin,  dbr = "records/creatures/npcs/questnpcs/gdareab/npc_necromancerghost_01.dbr"}
	ghostOutsideRuinStateObjects[""					 	] = { state = GhostState.Camp, dbr = nil }

	
function gd.quests.homesteadQuestNecromancer.ghostOutsideRuinOnAddToWorld(objectId)
	
	if Server then
		ghostOutsideRuinId = objectId
	
		local userdata = {}
		local didWork, newState = TokenStateBasedObjectSwap(objectId, userdata, ghostOutsideRuinStateObjects)
	
		Shared.setUserdata(objectId, userdata)
	
	end

end

gd.quests.homesteadQuestNecromancer.ghostOutsideRuinOnDestroy = ClearObjectUserdata


-- Swap Ghost Position
local GhostSwap_1 = false
local GhostSwap_2 = false

function gd.quests.homesteadQuestNecromancer.swapGhostOne()

	if Server then
		if not GhostSwap_1 then
			GhostSwap_1 = true
			local ghostCamp = Entity.Get(ghostCampId)
			local ghostOutsideRuin = Entity.Get(ghostOutsideRuinId)

			local player = Game.GetLocalPlayer()
			local MPOverrideState = false
			local MPOverrideDbr01 = nil
			local MPOverrideDbr02 = nil
			
			if (player:HasToken("HS_GHOST_RUIN") == false) then
				MPOverrideState = true
				MPOverrideDbr02 = "records/creatures/npcs/questnpcs/gdareab/npc_necromancerghost_01.dbr"
			end
		
			if (ghostCamp != nil) then
				local coords = ghostCamp:GetCoords()
				local teleportStart = Entity.Create("records/fx/ui/riftgateghostlyopen_fx02pak.dbr")
			
				if (teleportStart != nil) then
					teleportStart:NetworkEnable()
					teleportStart:SetCoords(coords)
					
				end
		
				UpdateObjectSwap(ghostCampId, ghostCampStateObjects, nil, nil, MPOverrideState, MPOverrideDbr01)
			
			end
		
			if (ghostOutsideRuin != nil) then
				local coords2 = ghostOutsideRuin:GetCoords()
				local teleport2Start = Entity.Create("records/fx/ui/riftgateghostlyopen_fx02pak.dbr")
			
				if (teleport2Start != nil) then
					teleport2Start:NetworkEnable()
					teleport2Start:SetCoords(coords2)
					
				end
		
				UpdateObjectSwap(ghostOutsideRuinId, ghostOutsideRuinStateObjects, nil, nil, MPOverrideState, MPOverrideDbr02)
			
			end
		
		end
		
	end

end

function gd.quests.homesteadQuestNecromancer.swapGhostTwo()

	if Server then
		if not GhostSwap_2 then
			GhostSwap_2 = true
			local ghostOutsideRuin = Entity.Get(ghostOutsideRuinId)
			local ghostInsideRuin = Entity.Get(ghostInsideRuinId)
			
			local player = Game.GetLocalPlayer()
			local MPOverrideState = false
			local MPOverrideDbr01 = nil
			local MPOverrideDbr02 = nil
			
			if (player:HasToken("HS_GHOST_FINISHED") == false) then
				MPOverrideState = true
				MPOverrideDbr02 = "records/creatures/npcs/questnpcs/gdareab/npc_necromancerghost_01.dbr"
			end
		
			if (ghostOutsideRuin != nil) then
				local coords2 = ghostOutsideRuin:GetCoords()
				local teleport2Start = Entity.Create("records/fx/ui/riftgateghostlyopen_fx02pak.dbr")
			
				if (teleport2Start != nil) then
					teleport2Start:NetworkEnable()
					teleport2Start:SetCoords(coords2)
				
				end
		
				UpdateObjectSwap(ghostOutsideRuinId, ghostOutsideRuinStateObjects, nil, nil, MPOverrideState, MPOverrideDbr01)
			
			end
		
			if (ghostInsideRuin != nil) then
				local coords3 = ghostInsideRuin:GetCoords()
				local teleport3Start = Entity.Create("records/fx/ui/riftgateghostlyopen_fx02pak.dbr")
			
				if (teleport3Start != nil) then
					teleport3Start:NetworkEnable()
					teleport3Start:SetCoords(coords3)
				
				end
			
				UpdateObjectSwap(ghostInsideRuinId, ghostInsideRuinStateObjects, nil, nil, MPOverrideState, MPOverrideDbr02)
			
			end
		
		end
	
	end

end



-- Necromancer Camp
local necromancerCampStateObjects = orderedTable()
	necromancerCampStateObjects["HS_GHOST_FINISHED"	] = { state = GhostState.Finished,  dbr = nil }
	necromancerCampStateObjects["HS_GHOST_RUIN"	] = { state = GhostState.Ruin,  dbr = "records/creatures/npcs/questnpcs/gdareab/npc_necromancer_01.dbr"}
	necromancerCampStateObjects[""					 	] = { state = GhostState.Camp, dbr = "records/creatures/npcs/questnpcs/gdareab/npc_necromancer_01.dbr"}

function gd.quests.homesteadQuestNecromancer.necromancerCampOnAddToWorld(objectId)
	
	if Server then
		local userdata = {}
		TokenStateBasedObjectSwap(objectId, userdata, necromancerCampStateObjects)
		Shared.setUserdata(objectId, userdata)
	
	end
	
end

gd.quests.homesteadQuestNecromancer.necromancerCampOnDestroy = ClearObjectUserdata


-- Necromancer in home base
local necromancerBaseStateObjects = orderedTable()
	necromancerBaseStateObjects["HS_GHOST_FINISHED"	] = { state = GhostState.Finished,  dbr = "records/creatures/npcs/questnpcs/gdareac/npc_balvoruuk.dbr"}
	necromancerBaseStateObjects["HS_GHOST_RUIN"	] = { state = GhostState.Ruin,  dbr = nil }
	necromancerBaseStateObjects[""					 	] = { state = GhostState.Camp, dbr = nil }

function gd.quests.homesteadQuestNecromancer.necromancerBaseOnAddToWorld(objectId)

	if Server then
		local userdata = {}
		TokenStateBasedObjectSwap(objectId, userdata, necromancerBaseStateObjects)
		Shared.setUserdata(objectId, userdata)
	
	end
	
end

gd.quests.homesteadQuestNecromancer.necromancerBaseOnDestroy = ClearObjectUserdata