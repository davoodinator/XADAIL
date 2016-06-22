/*
	
	GRIM DAWN
	
	For more information, visit us at http://www.grimdawn.com
	
*/

gd.quests.homesteadOldArkoviaBarricade = {}

-- Possible Blockade states
local OldArkoviaBlockadeState = { Active = 0, Destroyed = 1}

--
-- Old Arkovia Blockade
--
-- The road in Old Arkovia is blocked by an outlaw barricade, which can be cleared with dynamite.
--

local oldArkoviaBlockadeId = 0
local spawnedBlockade = false

-- Blockade
local oldArkoviaBlockadeStateObjects = orderedTable();
	oldArkoviaBlockadeStateObjects["OLDARKOVIA_BLOCKADECLEARED"]	= { state = OldArkoviaBlockadeState.Destroyed,  dbr = nil }
	oldArkoviaBlockadeStateObjects[""] 								= { state = OldArkoviaBlockadeState.Active, dbr = "records/storyelements/questassets/debriswall_oldarkovia_break.dbr" }

function gd.quests.homesteadOldArkoviaBarricade.blockadeOnAddToWorld(objectId)

	if Server then

		if (not spawnedBlockade) then

			local userdata = {};
			TokenStateBasedObjectSwap(objectId, userdata, oldArkoviaBlockadeStateObjects);
			Shared.setUserdata(objectId, userdata);
	
			spawnedBlockade = true
	
		end
		
	end
	
end

function gd.quests.homesteadOldArkoviaBarricade.blockadeAvatarOnAddToWorld(objectId)
	
	if Server then
		oldArkoviaBlockadeId = objectId
	
	end
	
end

gd.quests.homesteadOldArkoviaBarricade.blockadeOnDestroy = ClearObjectUserdata
	
-- Detonation Site
local oldArkoviaDetonationSiteStateObjects = orderedTable();
	oldArkoviaDetonationSiteStateObjects["OLDARKOVIA_BLOCKADECLEARED"]	= { state = OldArkoviaBlockadeState.Destroyed,  dbr = nil }
	oldArkoviaDetonationSiteStateObjects[""] 								= { state = OldArkoviaBlockadeState.Active, dbr = "records/creatures/npcs/questnpcs/interactiveobjects/npc_detonationsite_oldarkovia.dbr" }

function gd.quests.homesteadOldArkoviaBarricade.detonationSiteOnAddToWorld(objectId)
	
	if Server then
		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, oldArkoviaDetonationSiteStateObjects);
		Shared.setUserdata(objectId, userdata);
	
	end
	
end

gd.quests.homesteadOldArkoviaBarricade.detonationSiteOnDestroy = ClearObjectUserdata

-- Destroy Blockade
function gd.quests.homesteadOldArkoviaBarricade.blockadeDestroyGlobalMP()

GiveTokenToLocalPlayer("OLDARKOVIA_BLOCKADECLEARED")

end

function gd.quests.homesteadOldArkoviaBarricade.blockadeDestroy()

	if Server then
		if oldArkoviaBlockadeId != 0 then
			local Blockade = Destructible.Get(oldArkoviaBlockadeId)
			local coords = Blockade:GetCoords()
			Blockade:Destroy(Vec(0,1,0), 1000, false)
			oldArkoviaBlockadeId = 0
		
			local pfx = Entity.Create("records/fx/skillsother/attackradius/detonatelarge_fxpak01.dbr")
			if pfx != nil then
				pfx:NetworkEnable()
				pfx:SetCoords(coords)
				
			end
			
		end

		QuestGlobalEvent("detonationOldArkoviaToken")
		
	end

end

