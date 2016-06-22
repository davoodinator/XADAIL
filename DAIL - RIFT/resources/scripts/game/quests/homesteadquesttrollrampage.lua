/*
	
	GRIM DAWN

	For more information, visit us at http://www.grimdawn.com
	
*/

gd.quests.homesteadQuestTrollRampage = {}

--
-- The Troll only spawns if player is on the quest
--

local trollId = 0
local spawnedTroll = false

local TrollState = { Default = 0, Spawned = 1, Defeated = 2 }

local trollStateObjects = orderedTable()
	trollStateObjects["TROLL_DEAD"	] = { state = TrollState.Defeated,  dbr = nil }
	trollStateObjects["TROLL_SPAWNED"	] = { state = TrollState.Spawned, dbr = "records/creatures/enemies/boss&quest/troll_gulgoth.dbr"}
	trollStateObjects[""					 	] = { state = TrollState.Default, dbr = nil }

local function CharacterCreateArgs()

	return 0, Entity.Get(trollId):GetCoords().origin
	
end

function gd.quests.homesteadQuestTrollRampage.trollOnAddToWorld(objectId)
	if Server then
		if (not spawnedTroll) then
			trollId = objectId
	
			local userdata = {}
			local didWork, newState = TokenStateBasedObjectSwap(objectId, userdata, trollStateObjects, Character, CharacterCreateArgs)
	
			Shared.setUserdata(objectId, userdata)
	
			-- Don't respawn the Troll next time. If spawned as hostile, will be saved into the world
			if (newState == TrollState.Spawned) then
				spawnedTroll = true
				
			end
			
		end
	
	end
	
end

gd.quests.homesteadQuestTrollRampage.trollOnDestroy = ClearObjectUserdata


function gd.quests.homesteadQuestTrollRampage.spawnTroll()
	if Server then
		local player = Game.GetLocalPlayer()
		
		if player:HasToken("TROLL_SPAWNED") && not spawnedTroll then
			local didWork, newState = UpdateObjectSwap(trollId, trollStateObjects, Character, CharacterCreateArgs)
	
			-- Don't respawn the Troll next time
			if (newState == TrollState.Spawned) then
				spawnedTroll = true
				
			end
			
		end
	
	end

end