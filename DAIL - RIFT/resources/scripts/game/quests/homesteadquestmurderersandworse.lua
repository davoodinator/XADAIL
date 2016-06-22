/*
	
	GRIM DAWN
	
	For more information, visit us at http://www.grimdawn.com
	
*/

gd.quests.homesteadQuestMurderersAndWorse = {}

--
-- Edmund spawns in a proxy with other bandits
-- When he is killed, he swaps to a dialogue NPC, then never spawns again
--

local spawnedEdmund = false
local levelLimitLocation = nil

local chestSpawned = false
local bossDead = false
local chestId = 0

--Toggling Edmund between living and dead
local EdmundState = { Spawned = 0, Dead = 1 }


-- Edmund's Loot Chest, Spawns only with him, otherwise is a regular chest
local chestStateObjects = orderedTable()
	chestStateObjects["EDMUND_DEAD"	] = { state = EdmundState.Dead, dbr = "records/items/lootchests/b01_chestmetal01.dbr"}
	chestStateObjects[""					 	] = { state = EdmundState.Spawned, dbr = "records/items/lootchests/d02_bosschest_edmunddoyle.dbr"}

function gd.quests.homesteadQuestMurderersAndWorse.chestOnAddToWorld(objectId)

	if Server then
		local player = Game.GetLocalPlayer()
		
		if (not chestSpawned) then
			chestSpawned = true
			
			local userdata = {}
			TokenStateBasedObjectSwap(objectId, userdata, chestStateObjects)
			
			Shared.setUserdata(objectId, userdata)
		
		end

	end
	
end

function gd.quests.homesteadQuestMurderersAndWorse.chestAvatarOnAddToWorld(objectId)

	if Server then
		chestId = objectId
		
		if bossDead then
			local chest = Chest.Get(objectId);
			chest:SetLocked(false)
		
		end
	
	end
	
end

gd.quests.homesteadQuestMurderersAndWorse.chestOnDestroy = ClearObjectUserdata



--Edmund swapping
local edmundStateObjects = orderedTable()
	edmundStateObjects["EDMUND_DEAD"] 	= { state = EdmundState.Dead,  	 dbr = nil }
	edmundStateObjects[""] 				= { state = EdmundState.Spawned, dbr = "records/proxies/boss&quest/questproxy_bandit_edmund.dbr" }

local function CreateProxyArgs()

	return levelLimitLocation
	
end
	
function gd.quests.homesteadQuestMurderersAndWorse.edmundOnAddToWorld(objectId)
	
	if Server then
		local entity = Entity.Get(objectId)
	
		if (entity != nil) then
			levelLimitLocation = entity:GetCoords().origin
		end

		if (not spawnedEdmund) then
	
			local userdata = {}
			local didWork, newState = TokenStateBasedObjectSwap(objectId, userdata, edmundStateObjects, Proxy, CreateProxyArgs)
		
			Shared.setUserdata(objectId, userdata)
		
			--Don't respawn Edmund next time. If spawned as hostile, will be saved into the world
			if (newState == EdmundState.Spawned) then
				spawnedEdmund = true
			end
		
		end
	
	end
	
end

gd.quests.homesteadQuestMurderersAndWorse.edmundOnDestroy = ClearObjectUserdata

function gd.quests.homesteadQuestMurderersAndWorse.edmundKilled()

	GiveTokenToLocalPlayer("EDMUND_DEAD")
	
	if Server then
		bossDead = true
		
		local chest = Chest.Get(chestId);
		
		if (chest != nil) then
			chest:SetLocked(false)
			
		end
	
	end
	
end

-- Called by trigger, quest is waiting on a token to progress
function gd.quests.homesteadQuestMurderersAndWorse.homesteadBridgeScouted(triggererId)

	GiveTokenIfPlayer(triggererId, "FARMLANDBRIDGE_SCOUTED");
	
end