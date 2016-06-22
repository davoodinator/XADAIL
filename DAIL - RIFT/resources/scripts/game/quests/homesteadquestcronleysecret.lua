/*
	
	GRIM DAWN
	
	For more information, visit us at http://www.grimdawn.com
	
*/

gd.quests.homesteadQuestCronleySecret = {}

-- Possible Blockade states


--
-- Rover Blockade
--
-- The road in the Arkovian Foothills is blocked by bandits, but it can be destroyed with Dynamite
--



local crystalId = 0
local fireId = 0

local CrystalState = { Active = 0, Destroyed = 1, Kept = 2}

-- Aether Crystal
local crystalStateObjects = orderedTable();
	crystalStateObjects["HS_CRONLEYCRYSTAL_KEEP"]	= { state = CrystalState.Kept,  dbr = nil }
	crystalStateObjects["HS_CRONLEYCRYSTAL_DESTROY"]	= { state = CrystalState.Destroyed,  dbr = nil }
	crystalStateObjects[""] 								= { state = CrystalState.Active, dbr = "records/creatures/npcs/questnpcs/interactiveobjects/npc_crystal_cronleysecret.dbr" }

function gd.quests.homesteadQuestCronleySecret.crystalOnAddToWorld(objectId)

	if Server then
			crystalId = objectId
			
			local userdata = {};
			TokenStateBasedObjectSwap(objectId, userdata, crystalStateObjects);
			Shared.setUserdata(objectId, userdata);
		
	end
	
end

gd.quests.homesteadQuestCronleySecret.crystalOnDestroy = ClearObjectUserdata

-- Lab Fire
local fireStateObjects = orderedTable();
	fireStateObjects["HS_CRONLEYCRYSTAL_KEEP"]	= { state = CrystalState.Kept,  dbr = "records/fx/ambient/fx_firebonfire01.dbr"}
	fireStateObjects["HS_CRONLEYCRYSTAL_DESTROY"]	= { state = CrystalState.Destroyed,  dbr = "records/fx/ambient/fx_firebonfire01.dbr"}
	fireStateObjects[""] 								= { state = CrystalState.Active, dbr = nil}

function gd.quests.homesteadQuestCronleySecret.fireOnAddToWorld(objectId)
	
	if Server then
		fireId= objectId

		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, fireStateObjects);
		Shared.setUserdata(objectId, userdata);
	
	end
	
end

gd.quests.homesteadQuestCronleySecret.fireOnDestroy = ClearObjectUserdata

-- Destroy Lab and Crystal
local crystalDestroyed = false
local crystalSwapped = false
local crystalDestructibleId = 0

function gd.quests.homesteadQuestCronleySecret.crystalDestructibleOnAddToWorld(objectId)
	
	if Server then
		local crystal = Destructible.Get(objectId)
		crystal:Destroy(Vec(0,1,0), 10, true)
	
	end

end


function gd.quests.homesteadQuestCronleySecret.crystalSwap()

	if Server && not crystalSwapped then
		local player = Game.GetLocalPlayer()
		
		if player:HasToken("HS_CRONLEYCRYSTAL_DESTROY") || player:HasToken("HS_CRONLEYCRYSTAL_KEEP") then
			crystalSwapped = true
			
			UpdateObjectSwap(crystalId, crystalStateObjects)
			UpdateObjectSwap(fireId, fireStateObjects)
			
			if crystalId != 0 then
				local coords = Entity.Get(crystalId):GetCoords()
				local crystal = nil
				
				if player:HasToken("HS_CRONLEYCRYSTAL_DESTROY") then
					crystal = Destructible.Create("records/storyelements/questassets/cronleysecret_crystaldestroyed_break.dbr")
				
				else
					crystal = Destructible.Create("records/storyelements/questassets/cronleysecret_crystalkept_break.dbr")
				
				end
				
				crystal:SetCoords(coords)
				
			end
		
		end
	
	end
	
end
