/*
	
	GRIM DAWN
	
	For more information, visit us at http://www.grimdawn.com
	
*/

gd.quests.areaDQuestBaneOfCairn = {}



-- crypt door, final boss door and final boss exit door
local bossCryptEntrance = 0
local bossRoomDoor = 0
local bossCryptOpen = false
local bossChestId = 0
local lootChestId = 0
local lootChest02Id = 0
local bossKilled = false
local portalOpen = false


local phase02Spawned = false
local add01Id = nil
local add02Id = nil
local loghorreanExitShortcut = 0
local bloodlordExitShortcut = 0
local bloodlordOutsideShortcut = 0

local tentacleIDs = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0}


--
-- Ulgrim in Final Boss
--
local ulgrimBossId = 0
local ulgrimAvatarId = 0

local ulgrimBossSpawned = false
local ulgrimFinalPortalAttempted = false
local ulgrimFinalPortal = false

local ulgrimEventStarted = false
local ulgrimEventFinished = false
local addsSpawned = false


local UlgrimState = { Default = 0, Boss = 1, Finished = 2 }

local function CharacterCreateArgs()

	return 0, Entity.Get(ulgrimBossId):GetCoords().origin
	
end

local bossUlgrimStateObjects = orderedTable();
	bossUlgrimStateObjects["ULGRIM_FINISHED"] = { state = UlgrimState.Finished,  dbr = nil }
	bossUlgrimStateObjects["ULGRIM_BOSS"] = { state = UlgrimState.Boss,  dbr = "records/creatures/enemies/faction/ulgrim_01.dbr" }
	bossUlgrimStateObjects[""]			= { state = UlgrimState.Default,  dbr = nil }
	
function gd.quests.areaDQuestBaneOfCairn.bossUlgrimOnAddToWorld(objectId)

	if Server then
		if (not ulgrimBossSpawned && not ulgrimFinalPortal && not ulgrimFinalPortalAttempted) then
			ulgrimBossId = objectId
		
			local userdata = {};
			local didWork, newState = TokenStateBasedObjectSwap(objectId, userdata, bossUlgrimStateObjects, Character, CharacterCreateArgs)
		
			Shared.setUserdata(objectId, userdata);
		
			--Don't respawn ulgrim
			if (newState == UlgrimState.Boss || newState == UlgrimState.Finished) then
				ulgrimBossSpawned = true
				
			end
		
		end
		
	end
	
end

function gd.quests.areaDQuestBaneOfCairn.bossUlgrimAvatarOnAddToWorld(objectId)

	if Server then
		ulgrimAvatarId = objectId
	
	end
	
end

gd.quests.areaDQuestBaneOfCairn.bossUlgrimOnDestroy = ClearObjectUserdata



-- Called by boss event, teleports Ulgrim out of the boss room
local function endEvent(objectId)
	Script.UnregisterForUpdate(objectId, "gd.quests.areaDQuestBaneOfCairn.updateStatus")

end

function gd.quests.areaDQuestBaneOfCairn.ulgrimEventOnAddToWorld(objectId)
	
	if Server then
		Shared.setUserdata(objectId, userdata)
		Script.RegisterForUpdate(objectId, "gd.quests.areaDQuestBaneOfCairn.updateStatus", 1000)
		
	end

end

function gd.quests.areaDQuestBaneOfCairn.ulgrimEventOnRemoveFromWorld(objectId)

	if Server then
		Shared.setUserdata(objectId, nil)
		Script.UnregisterForUpdate(objectId, "gd.quests.areaDQuestBaneOfCairn.updateStatus")

	end
	
end

local function phase02Spawns()

	if Server then
		-- when Loghorrean is in Phase 2, execute the spawn/swap
		if phase02Spawned then
		
			if not ulgrimFinalPortal then
			
				-- Teleport Ulgrim Out of Final Boss Room. Repeat this Function until this succeeds.
				ulgrimFinalPortalAttempted = true
				
				local player = Game.GetLocalPlayer()

				local ulgrimAvatar = Entity.Get(ulgrimAvatarId)
				local MPOverrideDbr01 = nil
				local MPOverrideState = true
			
				if (ulgrimAvatar != nil) then
					local coords = ulgrimAvatar:GetCoords()	
					local rift = Entity.Create("records/fx/ui/riftgateulgrimopen_fxpak.dbr")
					
					if (player:HasToken("ULGRIM_BOSS") && player:HasToken("ULGRIM_FINISHED") == false) then
						UI.Notify("tagNotification_AreaD_FinalBossUlgrim")
						GiveTokenToLocalPlayer("ULGRIM_FINISHED")
					
					end
				
					if (rift != nil) then
						rift:NetworkEnable()
						rift:SetCoords(coords)
					end
					
					ulgrimAvatar:Destroy()
					ulgrimFinalPortal = true
				
					--local didWork, newState = UpdateObjectSwap(ulgrimBossId, bossUlgrimStateObjects, nil, nil, MPOverrideState, MPOverrideDbr01)
					
					--if didWork == true then
						--ulgrimFinalPortal = true
					
					--end
				
				end
			
			end

			-- Spawn Loghorrean's Adds in Phase 2. Do this only once.
			if not addsSpawned then
				local coords = Entity.Get(add01Id):GetCoords()
				local coords02 = Entity.Get(add02Id):GetCoords()
				
				local spawn = nil
				local spawn02 = nil
				
				if (Game.GetGameDifficulty() == Game.Difficulty.Normal) then
					spawn = Character.Create ("records/creatures/enemies/chthoniandreadguard_d01_summon.dbr", 0, nil)
					spawn02 = Character.Create ("records/creatures/enemies/chthoniandreadguard_d01_summon.dbr", 0, nil)
					addsSpawned = true
				else
					spawn = Character.Create ("records/creatures/enemies/chthoniandreadguard_d01b_summon.dbr", 0, nil)
					spawn02 = Character.Create ("records/creatures/enemies/chthoniandreadguard_d01b_summon.dbr", 0, nil)
					addsSpawned = true
				end
						
				local rift = Entity.Create("records/fx/ui/riftgatelargeopen_fxpak.dbr")
		
				if (rift != nil) then
					rift:NetworkEnable()
					rift:SetCoords(coords)
				end

				spawn:SetCoords(coords)
				
				local rift02 = Entity.Create("records/fx/ui/riftgatelargeopen_fxpak.dbr")
		
				if (rift02 != nil) then
					rift02:NetworkEnable()
					rift02:SetCoords(coords02)
				end
				
				spawn02:SetCoords(coords02)
			
			end
		
		end
		
	end
	
end

function gd.quests.areaDQuestBaneOfCairn.updateStatus(objectId)

	if Server then
		-- when Loghorrean is in Phase 2, execute the spawn/swap
		
		if phase02Spawned then
		
			if not ulgrimFinalPortal then
				phase02Spawns(objectId)
			
			else
				endEvent(objectId)
			end
		
		end
			
	end
	
end


--
-- Final Boss Phases
--
function gd.quests.areaDQuestBaneOfCairn.loghorreanPhase02OnAddToWorld(objectId)
	
	if Server then
		if not phase02Spawned then
			phase02Spawned = true
			
			phase02Spawns()
		
		end
		
	end
	
end


function gd.quests.areaDQuestBaneOfCairn.loghorreanKilled()

	GiveTokenToLocalPlayer("FINALBOSS_SLAIN")
	
	if Server then
		local chest = Chest.Get(bossChestId);
		local lootChest = Chest.Get(lootChestId);
		local lootChest02 = Chest.Get(lootChest02Id);
		local door = Door.Get(loghorreanExitShortcut)
		
		bossKilled = true
	
		-- Unlock chest if present
		if (chest ~= nil) then
			chest:SetLocked(false)
		end

		if (lootChest ~= nil) then
			lootChest:SetLocked(false)
		end
		
		if (lootChest02 ~= nil) then
			lootChest02:SetLocked(false)
		end
		
		-- Unlock Shortcut out
		if door ~= nil then
			door:SetLocked(false)
			door:Open()
			portalOpen = true
		end
		
		
		local tentaclesTotal = table.getn(tentacleIDs)
		
		for id = 1, tentaclesTotal do
			local character = Character.Get(tentacleIDs[id])
			
			if (character != nil) then
				character:Kill()
				
			end
		
		end
	
	end
	
end

function gd.quests.areaDQuestBaneOfCairn.bossChestOnAddToWorld(objectId)
	
	if Server then
		local chestEntity = Entity.Get(objectId)
		bossChestId = objectId
		player = Game.GetLocalPlayer()
	
		if (player != nil) && (chestEntity:IsReloaded() == false) && (player:AnyoneHasToken("DUNGEONCHEST_FINALBOSS")) then
			print "Destroying Chest"
			chestEntity:Destroy()
			
		end
		
	end
	
end

function gd.quests.areaDQuestBaneOfCairn.bossChestFound()

	GiveTokenIfPlayer(Game.GetLocalPlayer():GetId(), "DUNGEONCHEST_FINALBOSS");
	
end

function gd.quests.areaDQuestBaneOfCairn.lootChestOnAddToWorld(objectId)
	
	if Server then
		lootChestId = objectId
		
	end
	
end

function gd.quests.areaDQuestBaneOfCairn.lootChest02OnAddToWorld(objectId)
	
	if Server then
		lootChest02Id = objectId
		
	end
	
end

function gd.quests.areaDQuestBaneOfCairn.loghorreanExitShortcutOnAddToWorld(objectId)
	
	if Server then
		loghorreanExitShortcut = objectId
		
		if (bossKilled && portalOpen == false) then
			local door = Door.Get(objectId)
			portalOpen = true
			
			door:SetLocked(false)
			door:Open()
			
		end
		
	end
	
end

-- Final Boss Phase 2 adds
function gd.quests.areaDQuestBaneOfCairn.phase02Add01OnAddToWorld(objectId)
	if Server then
		add01Id = objectId
	
	end

end

function gd.quests.areaDQuestBaneOfCairn.phase02Add02OnAddToWorld(objectId)
	if Server then
		add02Id = objectId
	
	end

end





--
-- Retroactive credit for destroying blood wagons
--
local wagon01Destroyed = false
local wagon02Destroyed = false
local wagon03Destroyed = false

function gd.quests.areaDQuestBaneOfCairn.wagonOneKilled()

	wagon01Destroyed = true
	
	local player = Game.GetLocalPlayer()
	
	if (not player:HasToken("NECROPOLIS_WAGONS_ALLDESTROYED")) then
		if (player != nil) then
			player:GiveToken("NECROPOLIS_WAGON01")
			
		end
		
		if (player:HasToken("NECROPOLIS_WAGON01") && player:HasToken("NECROPOLIS_WAGON02") && player:HasToken("NECROPOLIS_WAGON03")) then
			player:GiveToken("NECROPOLIS_WAGONS_ALLDESTROYED")
			
		end
		
	end
	
	if wagon01Destroyed && wagon02Destroyed && wagon03Destroyed then
		-- Open Final Boss Crypt if player is on, or has done, the final quest
		local door = Door.Get(bossCryptEntrance)
	
		if door ~= nil && player:HasToken("AREAD_FINALCRYPT") then
			door:SetLocked(false)
			door:Open()
			bossCryptOpen = true
		end
	
	end

end

function gd.quests.areaDQuestBaneOfCairn.wagonTwoKilled()

	wagon02Destroyed = true
	
	local player = Game.GetLocalPlayer()
	
	if (not player:HasToken("NECROPOLIS_WAGONS_ALLDESTROYED")) then
		if (player != nil) then
			player:GiveToken("NECROPOLIS_WAGON02")
			
		end
		
		if (player:HasToken("NECROPOLIS_WAGON01") && player:HasToken("NECROPOLIS_WAGON02") && player:HasToken("NECROPOLIS_WAGON03")) then
			player:GiveToken("NECROPOLIS_WAGONS_ALLDESTROYED")
			
		end
		
	end
	
	if wagon01Destroyed && wagon02Destroyed && wagon03Destroyed then
		-- Open Final Boss Crypt if player is on, or has done, the final quest
		local door = Door.Get(bossCryptEntrance)
	
		if door ~= nil && player:HasToken("AREAD_FINALCRYPT") then
			door:SetLocked(false)
			door:Open()
			bossCryptOpen = true
		end
	
	end

end

function gd.quests.areaDQuestBaneOfCairn.wagonThreeKilled()

	wagon03Destroyed = true
	
	local player = Game.GetLocalPlayer()
	
	if (not player:HasToken("NECROPOLIS_WAGONS_ALLDESTROYED")) then
		if (player != nil) then
			player:GiveToken("NECROPOLIS_WAGON03")
			
		end
		
		if (player:HasToken("NECROPOLIS_WAGON01") && player:HasToken("NECROPOLIS_WAGON02") && player:HasToken("NECROPOLIS_WAGON03")) then
			player:GiveToken("NECROPOLIS_WAGONS_ALLDESTROYED")
			
		end
		
	end
	
	if wagon01Destroyed && wagon02Destroyed && wagon03Destroyed then
		-- Open Final Boss Crypt if player is on, or has done, the final quest
		local door = Door.Get(bossCryptEntrance)
	
		if door ~= nil && player:HasToken("AREAD_FINALCRYPT") then
			door:SetLocked(false)
			door:Open()
			bossCryptOpen = true
		end
	
	end

end


-- Trigger volume to remind player about the blood wagons if they destroyed them before
local doorLockedReminder = false 

function gd.quests.areaDQuestBaneOfCairn.doorStillLocked(triggererId)

	local player = Player.Get(triggererId)
	
	if (doorLockedReminder == false && bossCryptOpen == false && player:HasToken("AREAD_FINALCRYPT")) then
		UI.Notify("tagNotification_AreaD_FinalCryptLocked") 
		doorLockedReminder = true
	
	end

end



-- Crypt Door
function gd.quests.areaDQuestBaneOfCairn.bossCryptDoorOnAddToWorld(objectId)
	
	if Server then
		local player = Game.GetLocalPlayer()
		
		bossCryptEntrance = objectId
		
		if (wagon01Destroyed && wagon02Destroyed && wagon03Destroyed) || (player:HasToken("NECROPOLIS_WAGON01") && player:HasToken("NECROPOLIS_WAGON02") && player:HasToken("NECROPOLIS_WAGON03")) ||(player:HasToken("NECROPOLIS_WAGONS_ALLDESTROYED")) then
			-- Open Final Boss Crypt if player is on, or has done, the final quest
			local door = Door.Get(objectId)
		
			if door ~= nil && player:HasToken("AREAD_FINALCRYPT") then
				door:SetLocked(false)
				door:Open()
				bossCryptOpen = true
			end
		
		end
		
	end
	
end

function gd.quests.areaDQuestBaneOfCairn.unlockBossCryptDoor()
	
	if Server && not bossCryptOpen then
		local player = Game.GetLocalPlayer()
		
		if (wagon01Destroyed && wagon02Destroyed && wagon03Destroyed) || (player:HasToken("NECROPOLIS_WAGON01") && player:HasToken("NECROPOLIS_WAGON02") && player:HasToken("NECROPOLIS_WAGON03")) ||(player:AnyoneHasToken("NECROPOLIS_WAGONS_ALLDESTROYED")) then
			-- Open Final Boss Crypt if player is on the final quest
			local door = Door.Get(bossCryptEntrance)
		
			if door ~= nil then
				door:SetLocked(false)
				door:Open()
				bossCryptOpen = true
			end
		
		end
		
	end
	
end

-- Boss Room Door
function gd.quests.areaDQuestBaneOfCairn.bossRoomDoorOnAddToWorld(objectId)
	
	if Server then
		bossRoomDoor = objectId
		
	end
	
end

-- Cultist mini-boss death and access to final boss
local bloodlordKilled = false

function gd.quests.areaDQuestBaneOfCairn.cultistBossKilled()

	if Server then
		bloodlordKilled = true
		
		local door = Door.Get(bossRoomDoor)
		local shortcut01 = Door.Get(bloodlordExitShortcut)
		local shortcut02 = Door.Get(bloodlordOutsideShortcut)
		
		-- Unlock Shortcut outside, works both ways
		if shortcut01 ~= nil then
			shortcut01:SetLocked(false)
			shortcut01:Open()
		end
		
		if shortcut02 ~= nil then
			shortcut02:SetLocked(false)
			shortcut02:Open()
		end
	
		-- Unlock Loghorrean Room
		if door ~= nil then
			door:SetLocked(false)
			door:Open()
		end
		
	end
	
end

function gd.quests.areaDQuestBaneOfCairn.bloodlordCryptShortcutOnAddToWorld(objectId)
	
	if Server then
		bloodlordExitShortcut = objectId
		
		if bloodlordKilled then
			local door = Door.Get(objectId)
		
			if door ~= nil then
				door:SetLocked(false)
				door:Open()

			end
		
		end
		
	end
	
end

function gd.quests.areaDQuestBaneOfCairn.bloodlordOutsideShortcutOnAddToWorld(objectId)
	
	if Server then
		bloodlordOutsideShortcut = objectId
		
		if bloodlordKilled then
			local door = Door.Get(objectId)
		
			if door ~= nil then
				door:SetLocked(false)
				door:Open()

			end
		
		end
		
	end
	
end


-- Obsidian Throne Shortcut Exit on Boss Kill
local obsidianThroneExitShortcut = 0

function gd.quests.areaDQuestBaneOfCairn.obsidianThroneBossKilled()

	GiveTokenToLocalPlayer("AREAC_CHTHONICVOIDBOSS_KILLED")
	
	if Server then
		-- open shortcut back out
		local door = Door.Get(obsidianThroneExitShortcut)
	
		if door ~= nil then
			door:SetLocked(false)
			door:Open()
		end
		
	end
	
end


function gd.quests.areaDQuestBaneOfCairn.obsidianThroneExitShortcutOnAddToWorld(objectId)
	
	if Server then
		obsidianThroneExitShortcut = objectId
		
	end
	
end


--Secret Door control A
-- Door control
local secretDoorId = 0
local secretDoorId02 = 0
local secretOpened = false
local secretBOpened = false

function gd.quests.areaDQuestBaneOfCairn.dungeonDoorOnAddToWorld(objectId)

	if Server then
		secretDoorId = objectId;
		
	end
		
end

function gd.quests.areaDQuestBaneOfCairn.dungeonDoor02OnAddToWorld(objectId)

	if Server then
		secretDoorId02 = objectId;
		
	end
		
end

function gd.quests.areaDQuestBaneOfCairn.openSecret()

	if Server && not secretOpened then
		secretOpened = true
		local door = Door.Get(secretDoorId)
		local door02 = Door.Get(secretDoorId02)
		
		UI.Notify("tagNotification_AreaD_KymonSecret")
		
		if ((door != nil) && (door:IsLocked())) then
			door:SetLocked(false)
			door:Open()
			
		end
		
		if ((door02 != nil) && (door02:IsLocked())) then
			door02:SetLocked(false)
			door02:Open()
			
		end
	
	end
	
end

--Secret Door control B
-- Door control
local secretDoorBId = 0
local secretDoorBId02 = 0

function gd.quests.areaDQuestBaneOfCairn.dungeonDoorBOnAddToWorld(objectId)

	if Server then
		secretDoorBId = objectId;
		
	end
		
end

function gd.quests.areaDQuestBaneOfCairn.dungeonDoorB02OnAddToWorld(objectId)

	if Server then
		secretDoorBId02 = objectId;
		
	end
		
end

function gd.quests.areaDQuestBaneOfCairn.openSecretB()

	if Server && not secretBOpened then
		secretBOpened = true
		local door = Door.Get(secretDoorBId)
		local door02 = Door.Get(secretDoorBId02)
		
		UI.Notify("tagNotification_AreaD_KymonSecret")
		
		if ((door != nil) && (door:IsLocked())) then
			door:SetLocked(false)
			door:Open()
			
		end
		
		if ((door02 != nil) && (door02:IsLocked())) then
			door02:SetLocked(false)
			door02:Open()
			
		end
	
	end
	
end

-- Loghorrean room tentacles
function gd.quests.areaDQuestBaneOfCairn.tentacle01OnAddToWorld(objectId)

	if Server then
		tentacleIDs[1] = objectId;
	
	end

end

function gd.quests.areaDQuestBaneOfCairn.tentacle02OnAddToWorld(objectId)

	if Server then
		tentacleIDs[2] = objectId;
	
	end

end

function gd.quests.areaDQuestBaneOfCairn.tentacle03OnAddToWorld(objectId)

	if Server then
		tentacleIDs[3] = objectId;
	
	end

end

function gd.quests.areaDQuestBaneOfCairn.tentacle04OnAddToWorld(objectId)

	if Server then
		tentacleIDs[4] = objectId;
	
	end

end

function gd.quests.areaDQuestBaneOfCairn.tentacle05OnAddToWorld(objectId)

	if Server then
		tentacleIDs[5] = objectId;
	
	end

end

function gd.quests.areaDQuestBaneOfCairn.tentacle06OnAddToWorld(objectId)

	if Server then
		tentacleIDs[6] = objectId;
	
	end

end

function gd.quests.areaDQuestBaneOfCairn.tentacle07OnAddToWorld(objectId)

	if Server then
		tentacleIDs[7] = objectId;
	
	end

end

function gd.quests.areaDQuestBaneOfCairn.tentacle08OnAddToWorld(objectId)

	if Server then
		tentacleIDs[8] = objectId;
	
	end

end

function gd.quests.areaDQuestBaneOfCairn.tentacle09OnAddToWorld(objectId)

	if Server then
		tentacleIDs[9] = objectId;
	
	end

end

function gd.quests.areaDQuestBaneOfCairn.tentacle10OnAddToWorld(objectId)

	if Server then
		tentacleIDs[10] = objectId;
	
	end

end

-- Trigger volume for Loghorrean's Roar
local loghorreanRoar01 = false 
local loghorreanRoar02 = false 

function gd.quests.areaDQuestBaneOfCairn.loghorreanRoar01GlobalMP()

	loghorreanRoar01 = true

end

function gd.quests.areaDQuestBaneOfCairn.loghorreanRoar01(triggererId)
	
	if (not loghorreanRoar01) then
		loghorreanRoar01 = true
		local playerEntity = Entity.Get(triggererId)

		if (playerEntity != nil) then
		
			local coords = playerEntity:GetCoords()
			local pfx = Entity.Create("records/fx/creatures/loghorrean_roarscreenshake_02.dbr")
			
			if (pfx != nil) then
				pfx:NetworkEnable()
				pfx:SetCoords(coords)
			end
			
		end
	
	end

	QuestGlobalEvent("loghorreanRoar01")

end

function gd.quests.areaDQuestBaneOfCairn.loghorreanRoar02GlobalMP()

	loghorreanRoar02 = true

end

function gd.quests.areaDQuestBaneOfCairn.loghorreanRoar02(triggererId)

	if (not loghorreanRoar02) then
		loghorreanRoar02 = true
		local playerEntity = Entity.Get(triggererId)

		if (playerEntity != nil) then
		
			local coords = playerEntity:GetCoords()
			local pfx = Entity.Create("records/fx/creatures/loghorrean_roarscreenshake_01.dbr")
			
			if (pfx != nil) then
				pfx:NetworkEnable()
				pfx:SetCoords(coords)
			end
			
		end
	
	end

	QuestGlobalEvent("loghorreanRoar02")
	
end
