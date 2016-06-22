/*
	
	GRIM DAWN
	
	For more information, visit us at http://www.grimdawn.com
	
*/

gd.quests.areaCHomesteadAttacks = {}

--
-- Attacks on Homestead
--
-- Controls the spawning of attacks on HS from the Cultist side
-- Cultist spawn on the Blood Grove side once gates are open.
-- When the cultist summoner boss is slain, the attacks cease.
--

local attacksSpawned = false
local attackId = 0

local AttackState = { Default = 0, Spawned = 1, Finished = 2}

local attacksStateObjects = orderedTable();
	attacksStateObjects["AREAC_CULTISTSUMMONER_KILLED"] = { state = AttackState.Finished, dbr = nil }
	attacksStateObjects["AREAC_HOMESTEADDOORS_OPEN"] = { state = AttackState.Spawned,  dbr = "records/proxies/boss&quest/proxy_homesteadattack_cult_n.dbr" }
	attacksStateObjects[""] 			= { state = AttackState.Default, dbr = nil }
	
local function attacksCharacterCreateArgs()

	return Entity.Get(attackId):GetCoords().origin
	
end

function gd.quests.areaCHomesteadAttacks.attacksOnAddToWorld(objectId)

	if Server then
	
		if (not attacksSpawned) then
			attacksSpawned = true
			
			attackId = objectId
			
			local userdata = {}
			TokenStateBasedObjectSwap(objectId, userdata, attacksStateObjects, Proxy, attacksCharacterCreateArgs)
			
			Shared.setUserdata(objectId, userdata)
			
		end
		
	end
	
end

function gd.quests.areaCHomesteadAttacks.attacksFollowPatrol(objectId)
	
	if Server then
	
		local proxy = Proxy.Get(objectId)
		
		proxy:LinkPatrolPointGroup("PatrolPoint_HS01")
	
	end

end

gd.quests.areaCHomesteadAttacks.attacksOnDestroy = ClearObjectUserdata

