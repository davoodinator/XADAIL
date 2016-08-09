/*
	
	GRIM DAWN
	
	For more information, visit us at http://www.grimdawn.com
	
*/

gd.quests.devilsCrossingTownAttacks = {}

--
-- Attacks on Devil's Crossing
--
-- Controls the spawning of attacks on DC from the Lower Crossing and Arkovian Foothills sides
-- Aetherials spawn in Lower Crossing and advance onto the guards. Once the PC reaches Burrwitch and secures the rift, future attacks become stronger
-- When the Warden is defeated, the attacks cease
-- Outlaws spawn in Arkovian Foothills and advance onto newly spawned guards. Once the PC slays Cronley, attacks cease.
--



-- Lower Crossing attacks
local aetherialAttacksSpawned = false
local aetherialAttackId = 0

local AetherialAttackState = { Default = 0, Increased = 1, Finished = 2}

local aetherialAttacksStateObjects = orderedTable();
	aetherialAttacksStateObjects["WARDEN_SLAIN"] = { state = AetherialAttackState.Finished,  dbr = nil }
	aetherialAttacksStateObjects["BURRWITCH_PORTAL_CLEARED"] = { state = AetherialAttackState.Increased,  dbr = "records/proxies/boss&quest/proxy_devilscrossingattack_aetherial_t.dbr" }
	aetherialAttacksStateObjects[""] 			= { state = AetherialAttackState.Default, dbr = "records/proxies/boss&quest/proxy_devilscrossingattack_aetherial_n.dbr" }


		
local function AetherialAttacksCharacterCreateArgs()

	return Entity.Get(aetherialAttackId):GetCoords().origin
	
end

function gd.quests.devilsCrossingTownAttacks.aetherialAttacksOnAddToWorld(objectId)

	if Server then
	
		if (not aetherialAttacksSpawned) then
			aetherialAttacksSpawned = true
			
			aetherialAttackId = objectId
			
			local userdata = {}
			TokenStateBasedObjectSwap(objectId, userdata, aetherialAttacksStateObjects, Proxy, AetherialAttacksCharacterCreateArgs)
			
			Shared.setUserdata(objectId, userdata)
			
		end
		
	end
	
end

function gd.quests.devilsCrossingTownAttacks.aetherialAttacksFollowPatrol(objectId)
	
	if Server then
	
		local proxy = Proxy.Get(objectId)
		
		proxy:LinkPatrolPointGroup("PatrolPoint_DC01")
	
	end

end

gd.quests.devilsCrossingTownAttacks.aetherialAttacksOnDestroy = ClearObjectUserdata


-- Arkovian Foothills attacks
local outlawAttacksSpawned = false
local outlawAttackId = 0

local OutlawAttackState = { Default = 0, Spawned = 1, Finished = 2}

local outlawAttacksStateObjects = orderedTable();
	outlawAttacksStateObjects["CRONLEY_SLAIN"] = { state = OutlawAttackState.Finished, dbr = nil }
	outlawAttacksStateObjects["GD_FARMLANDBRIDGE_REPAIRED"] = { state = OutlawAttackState.Spawned,  dbr = "records/proxies/boss&quest/proxy_devilscrossingattack_outlaw_n.dbr" }
	outlawAttacksStateObjects[""] 			= { state = OutlawAttackState.Default, dbr = nil }

local function GetOutlawAttackMaxLevel()

	local maxLevel = 0
	local averageLevel = Game.GetAveragePlayerLevel()
	local outlawLevel = 0

	outlawLevel = ((averageLevel+(averageLevel/50))+3)

	--Grimmest changed 35;60;80 to 
	if (Game.GetGameDifficulty() == Game.Difficulty.Normal) then
		maxLevel = outlawLevel + 5
	elseif (Game.GetGameDifficulty() == Game.Difficulty.Epic) then
		maxLevel = outlawLevel + 10
	else
		maxLevel = outlawLevel + 20
	end

	return maxLevel
	
end
		
local function OutlawAttacksCharacterCreateArgs()

	return Entity.Get(outlawAttackId):GetCoords().origin
	
end

function gd.quests.devilsCrossingTownAttacks.outlawAttacksOnAddToWorld(objectId)

	if Server then
	
		if (not outlawAttacksSpawned) then
			outlawAttacksSpawned = true
			
			outlawAttackId = objectId
			
			local userdata = {}
			TokenStateBasedObjectSwap(objectId, userdata, outlawAttacksStateObjects, Proxy, OutlawAttacksCharacterCreateArgs)
			
			Shared.setUserdata(objectId, userdata)
			
		end
		
	end
	
end

function gd.quests.devilsCrossingTownAttacks.outlawAttacksFollowPatrol(objectId)
	
	if Server then
	
		local proxy = Proxy.Get(objectId)
		
		proxy:LinkPatrolPointGroup("PatrolPoint_DC02")
	
	end

end

gd.quests.devilsCrossingTownAttacks.outlawAttacksOnDestroy = ClearObjectUserdata




-- Spawn DC Guards for Outlaw Attacks
local DCGuardId = 0

local DC_GuardSpawned01 = false
local DC_GuardSpawned02 = false

local function GetGuardMaxLevel()

	local maxLevel = 0
	local playerLevel = Game.GetAveragePlayerLevel()

	if (Game.GetGameDifficulty() == Game.Difficulty.Normal) then
		maxLevel = 50
	elseif (Game.GetGameDifficulty() == Game.Difficulty.Epic) then
		maxLevel = 75
	else
		maxLevel = 100
	end
	
	if (playerLevel < maxLevel) then
		if playerLevel < 18 then
			maxLevel = 20
			
		else
			maxLevel = 0
		
		end
		
	end
	
	return maxLevel
	
end


local function GuardCharacterCreateArgs()

	return GetGuardMaxLevel(), nil
	
end

local DCGuard01StateObjects = orderedTable();
	DCGuard01StateObjects["CRONLEY_SLAIN"] = { state = OutlawAttackState.Finished, dbr = "records/creatures/npcs/guard/guard_dc_ranged02.dbr" }
	DCGuard01StateObjects["GD_FARMLANDBRIDGE_REPAIRED"] = { state = OutlawAttackState.Spawned,  dbr = "records/creatures/npcs/guard/guard_dc_ranged02.dbr" }
	DCGuard01StateObjects[""] 			= { state = OutlawAttackState.Default, dbr = nil }

function gd.quests.devilsCrossingTownAttacks.DCGuard01OnAddToWorld(objectId)

	if Server then
	
		if (not DC_GuardSpawned01) then
			DCGuardId = objectId
			
			local userdata = {}
			local didWork, newState = TokenStateBasedObjectSwap(objectId, userdata, DCGuard01StateObjects, Character, GuardCharacterCreateArgs)
			
			Shared.setUserdata(objectId, userdata)
			
			if (newState == OutlawAttackState.Spawned || newState == OutlawAttackState.Finished) then
				DC_GuardSpawned01 = true
			end
			
		end
		
	end
	
end

gd.quests.devilsCrossingTownAttacks.DCGuard01OnOnDestroy = ClearObjectUserdata


local DCGuard02StateObjects = orderedTable();
	DCGuard02StateObjects["CRONLEY_SLAIN"] = { state = OutlawAttackState.Finished, dbr = "records/creatures/npcs/guard/guard_dc_melee03.dbr" }
	DCGuard02StateObjects["GD_FARMLANDBRIDGE_REPAIRED"] = { state = OutlawAttackState.Spawned,  dbr = "records/creatures/npcs/guard/guard_dc_melee03.dbr" }
	DCGuard02StateObjects[""] 			= { state = OutlawAttackState.Default, dbr = nil }

function gd.quests.devilsCrossingTownAttacks.DCGuard02OnAddToWorld(objectId)

	if Server then
	
		if (not DC_GuardSpawned02) then
			local userdata = {}
			local didWork, newState = TokenStateBasedObjectSwap(objectId, userdata, DCGuard02StateObjects, Character, GuardCharacterCreateArgs)
			
			Shared.setUserdata(objectId, userdata)
			
			if (newState == OutlawAttackState.Spawned || newState == OutlawAttackState.Finished) then
				DC_GuardSpawned02 = true
			end
			
		end
		
	end
	
end

gd.quests.devilsCrossingTownAttacks.DCGuard02OnOnDestroy = ClearObjectUserdata




-- Spawn DC Guards in pre-attack State
local DC_GuardIdleSpawned01 = false
local DC_GuardIdleSpawned02 = false

local DCGuardIdle01StateObjects = orderedTable();
	DCGuardIdle01StateObjects["CRONLEY_SLAIN"] = { state = OutlawAttackState.Finished, dbr = nil }
	DCGuardIdle01StateObjects["GD_FARMLANDBRIDGE_REPAIRED"] = { state = OutlawAttackState.Spawned,  dbr = nil }
	DCGuardIdle01StateObjects[""] 			= { state = OutlawAttackState.Default, dbr = "records/creatures/npcs/flavornpcs/devilscrossing/npc_dcguard_idle_01.dbr" }

function gd.quests.devilsCrossingTownAttacks.DCGuardIdle01OnAddToWorld(objectId)

	if Server then
	
		if (not DC_GuardIdleSpawned01) then			
			local userdata = {}
			local didWork, newState = TokenStateBasedObjectSwap(objectId, userdata, DCGuardIdle01StateObjects, Character)
			
			Shared.setUserdata(objectId, userdata)
			
			if (newState == OutlawAttackState.Spawned || newState == OutlawAttackState.Finished) then
				DC_GuardIdleSpawned01 = true
			end
			
		end
		
	end
	
end

gd.quests.devilsCrossingTownAttacks.DCGuardIdle01OnOnDestroy = ClearObjectUserdata


local DCGuardIdle02StateObjects = orderedTable();
	DCGuardIdle02StateObjects["CRONLEY_SLAIN"] = { state = OutlawAttackState.Finished, dbr = nil }
	DCGuardIdle02StateObjects["GD_FARMLANDBRIDGE_REPAIRED"] = { state = OutlawAttackState.Spawned,  dbr = nil }
	DCGuardIdle02StateObjects[""] 			= { state = OutlawAttackState.Default, dbr = "records/creatures/npcs/flavornpcs/devilscrossing/npc_dcguard_idle_02.dbr" }

function gd.quests.devilsCrossingTownAttacks.DCGuardIdle02OnAddToWorld(objectId)

	if Server then
	
		if (not DC_GuardIdleSpawned02) then
			local userdata = {}
			local didWork, newState = TokenStateBasedObjectSwap(objectId, userdata, DCGuardIdle02StateObjects, Character)
			
			Shared.setUserdata(objectId, userdata)
			
			if (newState == OutlawAttackState.Spawned || newState == OutlawAttackState.Finished) then
				DC_GuardIdleSpawned02 = true
			end
			
		end
		
	end
	
end

gd.quests.devilsCrossingTownAttacks.DCGuardIdle02OnOnDestroy = ClearObjectUserdata

