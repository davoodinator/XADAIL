/*
	
	GRIM DAWN
	
	For more information, visit us at http://www.grimdawn.com
	
*/

gd.quests.areaCQuestRoadToHomestead = {}


--
-- Spawn Corrupted Troll boss for Road to Homestead quest
--

local bossId = 0
local spawnedBoss = false
local homesteadRiftgate = nil

local BossState = { Default = 0, Spawned = 1, Defeated = 2 }

-- bestow tokens on boss death and unlock riftgate
function gd.quests.areaCQuestRoadToHomestead.bossKilled()

	local player = Game.GetLocalPlayer()
	
	if player:HasToken("AREAC_HOMESTEAD_PORTAL_BOSS_SPAWNED") then
		player:RemoveToken("AREAC_HOMESTEAD_PORTAL_BOSS_SPAWNED")
	
	end
	
	GiveTokenToLocalPlayer("AREAC_HOMESTEAD_PORTAL_CLEARED")
	GiveTokenToLocalPlayer("AREAC_ENCLAVE_FOUND")
	
	if homesteadRiftgate != nil then
		homesteadRiftgate:SetLocked(false)
		
	end
	
	QuestEvent("homesteadOpenMainDoor")


end

local bossStateObjects = orderedTable()
	bossStateObjects["AREAC_HOMESTEAD_PORTAL_CLEARED"	] = { state = BossState.Defeated,  dbr = nil }
	bossStateObjects["AREAC_HOMESTEAD_PORTAL_BOSS_SPAWNED"	] = { state = BossState.Spawned, dbr = "records/creatures/enemies/boss&quest/trollhalfcorrupted_harrath_01.dbr"}
	bossStateObjects[""					 	] = { state = BossState.Default, dbr = nil }
	
local function CharacterCreateArgs()

	return 0, Entity.Get(bossId):GetCoords().origin
	
end



function gd.quests.areaCQuestRoadToHomestead.bossOnAddToWorld(objectId)
	if Server then
		if (not spawnedBoss) then
			bossId = objectId
	
			local userdata = {}
			local didWork, newState = TokenStateBasedObjectSwap(objectId, userdata, bossStateObjects, Character, CharacterCreateArgs)
	
			Shared.setUserdata(objectId, userdata)
	
			-- Don't respawn the Boss next time. If spawned as hostile, will be saved into the world
			if (newState == BossState.Spawned) then
				spawnedBoss = true
				
			end
			
		end
	
	end
	
end

gd.quests.areaCQuestRoadToHomestead.bossOnDestroy = ClearObjectUserdata



-- Spawn boss when Reanimator miniboss dies
function gd.quests.areaCQuestRoadToHomestead.spawnBoss()
	
	local player = Game.GetLocalPlayer()
	
	local questId = 0xB74DBA00
	local taskId = 0x50043F00
	local taskId2 = 0x053DE488
	local questId2 = 0xB561CE00
	local taskId3 = 0xFF84B800
	
	local questTaskState = player:GetQuestTaskState(questId, taskId)
	local questTaskState2 = player:GetQuestTaskState(questId, taskId2)
	local questTaskState3 = player:GetQuestTaskState(questId2, taskId3)
	
	if player:HasToken("AREAC_HOMESTEAD_PORTAL_CLEARED") == false && (player:GetLevel() > 8 || questTaskState == QuestState.InProgress || questTaskState2 == QuestState.InProgress || questTaskState3 == QuestState.InProgress) then
		GiveTokenToLocalPlayer("AREAC_HOMESTEAD_PORTAL_BOSS_SPAWNED")
	
	end
	
	if Server then
		local boss = Entity.Get(bossId)
		
		if (player:GetLevel() > 8 || questTaskState == QuestState.InProgress || questTaskState2 == QuestState.InProgress || questTaskState3 == QuestState.InProgress) then
			if player:HasToken("AREAC_HOMESTEAD_PORTAL_CLEARED") == false && not spawnedBoss then
				local didWork, newState = UpdateObjectSwap(bossId, bossStateObjects, Character, CharacterCreateArgs)

				local coords = boss:GetCoords();
				local rift = Entity.Create("records/fx/creatures/aetherriftspawn_fxpak01.dbr");
				
				if rift != nil then
					rift:NetworkEnable()
					rift:SetCoords(coords);
				end

				
				-- Don't respawn the Boss next time
				if (newState == BossState.Spawned) then
					spawnedBoss = true
					
				end
			
			end
			
		end
	
	end

end

--
-- Spawn initial pack for Homestead rift, including a Reanimator miniboss that triggers the boss's spawn
--

local riftgateSpawnsId = 0
local riftgateSpawnsSpawned = false

local riftgateSpawnsStateObjects = orderedTable()
	riftgateSpawnsStateObjects["AREAC_HOMESTEAD_PORTAL_CLEARED"	] = { state = BossState.Defeated,  dbr = nil }
	riftgateSpawnsStateObjects["AREAC_HOMESTEAD_PORTAL_BOSS_SPAWNED"	] = { state = BossState.Spawned, dbr = nil }
	riftgateSpawnsStateObjects[""					 	] = { state = BossState.Default, dbr = "records/proxies/boss&quest/proxy_areac_homesteadriftgatespawns_01.dbr" }
	
local function RiftgateSpawnsCreateArgs()

	return Entity.Get(riftgateSpawnsId):GetCoords().origin
	
end



function gd.quests.areaCQuestRoadToHomestead.riftgateSpawnsOnAddToWorld(objectId)
	if Server then
		if (not riftgateSpawnsSpawned) then
			riftgateSpawnsId = objectId
	
			local userdata = {}
			local didWork, newState = TokenStateBasedObjectSwap(objectId, userdata, riftgateSpawnsStateObjects, Proxy, RiftgateSpawnsCreateArgs)
	
			Shared.setUserdata(objectId, userdata)
	
			-- Don't respawn next time. If spawned, will be saved into the world
			if (newState == BossState.Default) then
				riftgateSpawnsSpawned = true
				
			end
			
		end
	
	end
	
end

gd.quests.areaCQuestRoadToHomestead.riftgateSpawnsOnDestroy = ClearObjectUserdata


-- Spawn Homestead Guards after rift is secured
local GuardId = 0

local GuardSpawned01 = false
local GuardSpawned02 = false
local GuardSpawned03 = false
local GuardSpawned04 = false

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
		if playerLevel < 35 then
			maxLevel = 35
			
		else
			maxLevel = 0
		
		end
		
	end
	
	return maxLevel
	
end


local function GuardCharacterCreateArgs()

	return GetGuardMaxLevel(), nil
	
end

local Guard01StateObjects = orderedTable();
	Guard01StateObjects["AREAC_HOMESTEAD_PORTAL_CLEARED"] = { state = BossState.Defeated, dbr = "records/creatures/npcs/guard/guard_blacklegion_melee01.dbr" }
	Guard01StateObjects[""] 			= { state = BossState.Default, dbr = nil }

function gd.quests.areaCQuestRoadToHomestead.Guard01OnAddToWorld(objectId)

	if Server then
	
		if (not GuardSpawned01) then
			GuardId = objectId
			
			local userdata = {}
			local didWork, newState = TokenStateBasedObjectSwap(objectId, userdata, Guard01StateObjects, Character, GuardCharacterCreateArgs)

			Shared.setUserdata(objectId, userdata)
			
			-- Don't respawn the guard if spawned
			if (newState == BossState.Defeated) then
				GuardSpawned01 = true
				
			end
			

			
		end
		
	end
	
end

gd.quests.areaCQuestRoadToHomestead.Guard01OnOnDestroy = ClearObjectUserdata


local Guard02StateObjects = orderedTable();
	Guard02StateObjects["AREAC_HOMESTEAD_PORTAL_CLEARED"] = { state = BossState.Defeated, dbr = "records/creatures/npcs/guard/guard_blacklegion_ranged_female01.dbr" }
	Guard02StateObjects[""] 			= { state = BossState.Default, dbr = nil }

function gd.quests.areaCQuestRoadToHomestead.Guard02OnAddToWorld(objectId)

	if Server then
	
		if (not GuardSpawned02) then
			local userdata = {}
			local didWork, newState = TokenStateBasedObjectSwap(objectId, userdata, Guard02StateObjects, Character, GuardCharacterCreateArgs)
			
			-- Don't respawn the guard if spawned
			if (newState == BossState.Defeated) then
				GuardSpawned02 = true
				
			end			
			Shared.setUserdata(objectId, userdata)
			
		end
		
	end
	
end

gd.quests.areaCQuestRoadToHomestead.Guard02OnOnDestroy = ClearObjectUserdata


local Guard03StateObjects = orderedTable();
	Guard03StateObjects["AREAC_HOMESTEAD_PORTAL_CLEARED"] = { state = BossState.Defeated, dbr = "records/creatures/npcs/guard/guard_blacklegion_ranged01.dbr" }
	Guard03StateObjects[""] 			= { state = BossState.Default, dbr = nil }
	
function gd.quests.areaCQuestRoadToHomestead.Guard03OnAddToWorld(objectId)

	if Server then
	
		if (not GuardSpawned03) then
			GuardId = objectId
			
			local userdata = {}
			local didWork, newState = TokenStateBasedObjectSwap(objectId, userdata, Guard03StateObjects, Character, GuardCharacterCreateArgs)

			Shared.setUserdata(objectId, userdata)
			
			-- Don't respawn the guard if spawned
			if (newState == BossState.Defeated) then
				GuardSpawned03 = true
				
			end
			

			
		end
		
	end
	
end

gd.quests.areaCQuestRoadToHomestead.Guard03OnOnDestroy = ClearObjectUserdata

local Guard04StateObjects = orderedTable();
	Guard04StateObjects["AREAC_HOMESTEAD_PORTAL_CLEARED"] = { state = BossState.Defeated, dbr = "records/creatures/npcs/guard/guard_blacklegion_ranged01.dbr" }
	Guard04StateObjects[""] 			= { state = BossState.Default, dbr = nil }

function gd.quests.areaCQuestRoadToHomestead.Guard04OnAddToWorld(objectId)

	if Server then
	
		if (not GuardSpawned04) then
			GuardId = objectId
			
			local userdata = {}
			local didWork, newState = TokenStateBasedObjectSwap(objectId, userdata, Guard04StateObjects, Character, GuardCharacterCreateArgs)

			Shared.setUserdata(objectId, userdata)
			
			-- Don't respawn the guard if spawned
			if (newState == BossState.Defeated) then
				GuardSpawned04 = true
				
			end
			

			
		end
		
	end
	
end

gd.quests.areaCQuestRoadToHomestead.Guard04OnOnDestroy = ClearObjectUserdata


--
-- Bestow token and show notification when entering Enclave area for first time
-- Also swaps in the Vengeance quest NPCs by calling an external function
-- 
function gd.quests.areaCQuestRoadToHomestead.findEnclave(triggererId)

	local player = Player.Get(triggererId)
	local questId = 0xB74DBA00
	local taskId = 0x50043F00
	local taskId2 = 0x053DE488
	local questId2 = 0xB561CE00
	local taskId3 = 0xA1853400
	
	local questTaskState = player:GetQuestTaskState(questId, taskId)
	local questTaskState2 = player:GetQuestTaskState(questId, taskId2)
	local questTaskState3 = player:GetQuestTaskState(questId2, taskId3)

	if (player:HasToken("AREAC_HOMESTEAD_PORTAL_CLEARED") == false) then
		
		if (questTaskState3 == QuestState.InProgress || questTaskState == QuestState.InProgress || questTaskState2 == QuestState.InProgress) then
	
			if (player:HasToken("AREAC_ENCLAVE_FOUND") == false) then
				GiveTokenIfPlayer(triggererId, "AREAC_ENCLAVE_FOUND")
				UI.Notify("tagNotification_AreaC_EnclaveRiftgateEvent")
			end
			
		end
	
	end
	
	QuestEvent("vengeanceHomesteadSpawn")
		
end


--
-- Homestead portal
-- Controls the unlocking of the Homestead Riftgate
--
function gd.quests.areaCQuestRoadToHomestead.riftgateOnAddToWorld(objectId)

	-- This function is run locally on all clients to set the variable and unlock the gate. Riftgates are not spawned by the server
	local player = Game.GetLocalPlayer()
	homesteadRiftgate = Riftgate.Get(objectId)

	if player:HasToken("AREAC_HOMESTEAD_PORTAL_CLEARED") then
		homesteadRiftgate:SetLocked(false)
	
	end

end


--
-- Homestead Doors
-- Unlock the doors in Homestead at various points in quest line
--
local mainDoorId = 0
local dermapteranDoorId = 0
local cultistDoorId = 0
local mainDoorOpened = false
local sideDoorsOpened = false
local cultDoorOpened = false

function gd.quests.areaCQuestRoadToHomestead.mainDoorOnAddToWorld(objectId)

	if Server then
		mainDoorId = objectId
		local door01 = Door.Get(objectId)	
		local player = Game.GetLocalPlayer()
		
		if player:HasToken("AREAC_HOMESTEAD_PORTAL_CLEARED") then
			door01:Open()
	
		end
		

	end

end

function gd.quests.areaCQuestRoadToHomestead.dermapteranDoorOnAddToWorld(objectId)

	if Server then
		dermapteranDoorId = objectId
		local door01 = Door.Get(objectId)	
		local player = Game.GetLocalPlayer()
		
		if player:HasToken("AREAC_HOMESTEADDOORS_OPEN") then
			door01:Open()
	
		end
		

	end


end

function gd.quests.areaCQuestRoadToHomestead.cultistDoorOnAddToWorld(objectId)

	if Server then
		cultistDoorId = objectId
		local door01 = Door.Get(objectId)	
		local player = Game.GetLocalPlayer()
		
		local questId = 0xDF0DCC00
		local taskId = 0x02B5F500
		local questTaskState = player:GetQuestTaskState(questId, taskId)
		
		if (questTaskState == QuestState.InProgress || player:HasToken("AREAC_NECROS_CHOSEN") || player:HasToken("AREAC_ZEALOTS_CHOSEN") || player:HasToken("AREAC_CULTISTDOORS_OPEN")) then
			door01:Open()
	
		end
		

	end


end

function gd.quests.areaCQuestRoadToHomestead.mainDoorOpen()
	
	if Server && not mainDoorOpened then
		mainDoorOpened = true
		local door01 = Door.Get(mainDoorId)	
	
		if door01 ~= nil then
			door01:Open()
		
		end
		
	end

end

function gd.quests.areaCQuestRoadToHomestead.southDoorOpen()
	
	if Server && not sideDoorsOpened then
		sideDoorsOpened = true
		local door01 = Door.Get(dermapteranDoorId)	
	
		if door01 ~= nil then
			door01:Open()
		
		end

	end

end

function gd.quests.areaCQuestRoadToHomestead.northDoorOpen()
	
	if Server && not cultDoorOpened then
		cultDoorOpened = true
		local door01 = Door.Get(cultistDoorId)	
		
		if door01 ~= nil then
			door01:Open()
		
		end
		
	end

end

