/*
	
	GRIM DAWN
	
	For more information, visit us at http://www.grimdawn.com
	
*/

gd.quests.homesteadQuestRemoveTheHead = {}

--
-- Darius starts as an NPC if the player is on the quest, allowing them to talk to Darius before killing him.
-- Otherwise, Darius spawns hostile
--

--Toggling Darius between friendly and hostile
local dariusId = 0
local bossId = 0
local spawnedDarius = false
local dariusEntryDoor = 0
local dariusExitDoor = 0
local secretwallId = 0
local dariusCoords = nil

local DariusState = { Default = 0, Waiting = 1, Hostile = 2 }

--Darius swapping
local dariusStateObjects = orderedTable()
	dariusStateObjects["DARIUS_HOSTILE"	] = { state = DariusState.Hostile,  dbr = "records/creatures/enemies/boss&quest/banditleader_darius.dbr"}
	dariusStateObjects["DARIUS_TALK"	] = { state = DariusState.Waiting, dbr = "records/creatures/npcs/questnpcs/gdareab/npc_dariuscronley_01.dbr" }
	dariusStateObjects[""					 	] = { state = DariusState.Default, dbr = "records/creatures/enemies/boss&quest/banditleader_darius.dbr" }

local function CharacterCreateArgs()

	local averageLevel = Game.GetAveragePlayerLevel()
	local dariusLevel = 0
	local maxLevel = 0
	local originPoint = Entity.Get(dariusId):GetCoords().origin


	--Grimmest changes 36;68;200 to 50;75;200
	if (Game.GetGameDifficulty() == Game.Difficulty.Normal) then
		maxLevel = 50
	elseif (Game.GetGameDifficulty() == Game.Difficulty.Epic) then
		maxLevel = 75
	else
		maxLevel = 200
	end
	
	if (averageLevel > maxLevel) then
		dariusLevel = ((maxLevel+(maxLevel/50))+3)
	else
		dariusLevel = ((averageLevel+(averageLevel/50))+3)

	end
	
	if dariusLevel > maxLevel then
		originPoint = nil
	end
	--Grimmest
	originPoint = nil

	return dariusLevel, originPoint
	
end

function gd.quests.homesteadQuestRemoveTheHead.dariusOnAddToWorld(objectId)
	
	if Server then
		if (not spawnedDarius) then
			dariusId = objectId
			dariusCoords = Entity.Get(objectId):GetCoords()
	
			local userdata = {}
			local didWork, newState = TokenStateBasedObjectSwap(objectId, userdata, dariusStateObjects, Character, CharacterCreateArgs)
	
			Shared.setUserdata(objectId, userdata)
	
			-- Don't respawn Darius next time. If spawned as hostile, will be saved into the world
			if (newState == DariusState.Default || newState == DariusState.Hostile) then
				spawnedDarius = true
				
			end
			
		end
	
	end
	
end

function gd.quests.homesteadQuestRemoveTheHead.dariusAvatarOnAddToWorld(objectId)

	if Server then
		bossId = objectId
	
	end

end

gd.quests.homesteadQuestRemoveTheHead.dariusOnDestroy = ClearObjectUserdata

-- Called by conversation, switches Darius to hostile
function gd.quests.homesteadQuestRemoveTheHead.hostileSwitchGlobalMP()

	local player = Game.GetLocalPlayer()
	
	if (player != nil && (player:HasToken("DARIUS_TALK"))) then
		player:RemoveToken("DARIUS_TALK")
		player:GiveToken("DARIUS_HOSTILE")
	
	end

end

function gd.quests.homesteadQuestRemoveTheHead.hostileSwitch()
	
	if Server then
		if not spawnedDarius then
			
			QuestGlobalEvent("dariusHostileSwapToken")
			
			local didWork, newState = UpdateObjectSwap(dariusId, dariusStateObjects, Character, CharacterCreateArgs)
	
			-- Don't respawn Darius next time. If spawned as hostile, will be saved into the world
			if (newState == DariusState.Default || newState == DariusState.Hostile) then
				spawnedDarius = true
				
			end
		
		end
	
	end

end


-- clean up of Darius' NPC version and Edmund's spawn if Darius was killed and Edmund was not and/or if player is not on the quest
-- open Darius' One Shot Chest on death

local dariusChestId = 0

function gd.quests.homesteadQuestRemoveTheHead.dariusKilled()

	local player = Game.GetLocalPlayer()
	
	local kQuest_RemoveTheHead = 0x554DB080
	local kTask_KillDarius = 0x5F79AE00
	local questTaskState = player:GetQuestTaskState(kQuest_RemoveTheHead, kTask_KillDarius)

	local kQuest_PayingTribute = 0xE6A00600
	local kTask_TributeReturn = 0xCC4D9900
	local questTaskStatePayingTribute = player:GetQuestTaskState(kQuest_PayingTribute, kTask_TributeReturn)
		
	if (player != nil) && (questTaskState == QuestState.InProgress) then
		if (player:HasToken("DARIUS_TALK")) then
			player:RemoveToken("DARIUS_TALK")
		end
	end
	
	--Check status of Paying Tribute and giving token if appropriate
	if (player != nil) && (player:HasToken("SILAS_KILLED") == false) && (player:HasToken("SILAS_DESTROYED") == false) && (player:HasToken("SILAS_BRIBED") == false) && (player:HasToken("SILAS_CHILDRENRESCUED") == false) then
		GiveTokenToLocalPlayer("SILAS_FLED")
		
		if (questTaskStatePayingTribute == QuestState.Complete || questTaskStatePayingTribute == QuestState.InProgress) then
			GiveTokenToLocalPlayer("SILAS_REWARD")
			
		end
		
	end
	
	-- Give Token for slaying Cronley
	GiveTokenToLocalPlayer("CRONLEY_SLAIN")
	
	if Server then
		local dariusChest = Chest.Get(dariusChestId);
		
		--Check status of Paying Tribute and remove Silas if needed
		if (player != nil) && (player:HasToken("SILAS_KILLED") == false) && (player:HasToken("SILAS_DESTROYED") == false) && (player:HasToken("SILAS_BRIBED") == false) && (player:HasToken("SILAS_CHILDRENRESCUED") == false) then
			gd.quests.homesteadQuestPayingTribute.SilasFlee()
			
		end
		
		-- Unlock darius chest if present
		if (dariusChest ~= nil) then
			dariusChest:SetLocked(false)
			
		end
	
		-- Reopen doors to darius' room
		local doorEntry = Door.Get(dariusEntryDoor)
		local doorExit = Door.Get(dariusExitDoor)
	
		if doorEntry ~= nil then
			doorEntry:Open()
			
		end
	
		if doorExit ~= nil then
			doorExit:Open()
			
		end
	
	end
	
	if (secretwallId != 0) then
	
		rockwall = Destructible.Get(secretwallId)
	
		rockwall:Destroy(Vec(0, 1, 0), 100, false)
		secretwallId = 0
		
	end
	
end

-- Control for Darius' one shot chest
function gd.quests.homesteadQuestRemoveTheHead.dariusChestOnAddToWorld(objectId)
	
	if Server then
		dariusChestEntity = Entity.Get(objectId)
		dariusChestId = objectId
		player = Game.GetLocalPlayer()
	
		if (player != nil) && (dariusChestEntity:IsReloaded() == false) && (player:AnyoneHasToken("DUNGEONCHEST_DARIUS")) then
			print "Destroying Chest"
			dariusChestEntity:Destroy()
			
		end
	
	end
	
end

function gd.quests.homesteadQuestRemoveTheHead.dariusChestFound()

	GiveTokenToLocalPlayer("DUNGEONCHEST_DARIUS");
	
end

-- Darius doors, entry door reopens after boss dies. Exit door opens only if boss is dead
function gd.quests.homesteadQuestRemoveTheHead.bossEntryDoorOnAddToWorld(objectId)

	if Server then
		dariusEntryDoor = objectId
	
	end
	
end

function gd.quests.homesteadQuestRemoveTheHead.bossExitDoorOnAddToWorld(objectId)

	if Server then
		dariusExitDoor = objectId
	
	end
	
end

-- Kill function for "Moneybags" Martin for side quest

function gd.quests.homesteadQuestRemoveTheHead.martinKilled()
	GiveTokenToLocalPlayer("MONEYBAGS_SLAIN")
end


-- Called by trigger volume, sets Cronley to hostile if he's in dialogue mode and players run past him into his secret room
function gd.quests.homesteadQuestRemoveTheHead.secretTriggered(triggererId)
	local player = Player.Get(triggererId)

	if (player:ServerHasToken("DARIUS_TALK")) then
		QuestEvent("dariusHostileSwap")
		
	end
	
end

-- Cronley Secret debris
-- cleared out when boss dies
function gd.quests.homesteadQuestRemoveTheHead.debrisOnAddToWorld(objectId)
	
	if Server then
		secretwallId = objectId
		
	end
	
end

-- Boss reset
function gd.quests.homesteadQuestRemoveTheHead.bossLeaveRoom()

	if Server then
		-- Teleport boss back to spawn point if he is somehow kited out of boss room
		local bossEntity = Character.Get(bossId)
		
		if bossEntity != nil then
			local coords = bossEntity:GetCoords()
			local rift = Entity.Create("records/fx/ui/riftgatepersonalopen_fxpak.dbr")

			if (rift != nil) then
				rift:NetworkEnable()
				rift:SetCoords(coords)
			end
			
			bossEntity:SetCoords(dariusCoords)
		
		end
	
	end


end


