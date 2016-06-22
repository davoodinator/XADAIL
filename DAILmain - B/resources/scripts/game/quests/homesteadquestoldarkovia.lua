/*
	
	GRIM DAWN
	
	For more information, visit us at http://www.grimdawn.com
	
*/

gd.quests.homesteadQuestOldArkovia = {}


--
-- Old Arkovia quest lines and harpy quest
--

function gd.quests.homesteadQuestOldArkovia.harpyKilled()

	GiveTokenToLocalPlayer("HS_LUTRA_KILLED")

end

--
-- Item grants a quest if the player didn't already receive it from the questgiver
--

function gd.quests.homesteadQuestOldArkovia.lootPassage(looterId, itemId)

	if looterId == Game.GetLocalPlayer():GetId() then
		local kQuest_Passages = 0x6428B280
		local kTask_Loot  = 0xABD4E300
		local player = Player.Get(looterId)
		
		local questState = player:GetQuestState(kQuest_Passages)

		if ((player != nil) && (questState == QuestState.Available)) then
			player:GrantQuest(kQuest_Passages, kTask_Loot)
			
		end
	
	end
	
end

--
-- Kilrian's Shrine
--
local shrineId = 0
local shrineUnlocked = false

function gd.quests.homesteadQuestOldArkovia.shrineOnAddToWorld(objectId)

	if Server then
		shrineId = objectId
		
		local shrine = Shrine.Get(objectId)
		local player = Game.GetLocalPlayer()

		if (shrineUnlocked) then
			shrine:SetLocked(false)
		end
	
	end

end

--
-- Undercity Boss door
--
local bossDoor = 0
local bossDoor02 = 0

function gd.quests.homesteadQuestOldArkovia.bossDoorOnAddToWorld(objectId)

	if Server then
		bossDoor = objectId
		
	end
	
end

function gd.quests.homesteadQuestOldArkovia.bossDoor02OnAddToWorld(objectId)

	if Server then
		bossDoor02 = objectId
	
	end
	
end

function gd.quests.homesteadQuestOldArkovia.bossKilled()
	
	if Server then
		local door = Door.Get(bossDoor)
		local door02 = Door.Get(bossDoor02)
	
		if door != nil then
			door:Open()
		
		end
	
		if door02 != nil then
			door02:Open()
		
		end
		
		shrineUnlocked = true
		
		local shrine = Shrine.Get(shrineId)
		shrine:SetLocked(false)
	
	end

end


--
-- Item grants a quest
--

function gd.quests.homesteadQuestOldArkovia.lootAnnals(looterId, itemId)

	if looterId == Game.GetLocalPlayer():GetId() then
		local kQuest = 0xE6BFED00
		local kTask  = 0x4248F600
		local player = Player.Get(looterId)
		
		local questState = player:GetQuestState(kQuest)

		if ((player != nil) && (questState == QuestState.Available)) then
			player:GrantQuest(kQuest, kTask)
			
		end
	
	end
	
end


--
-- Undercity Blocker spawns until host reaches Broken Hills, or has ULGRIM_HOMESTEAD
--
local spawnedBlockade = false

function gd.quests.homesteadQuestOldArkovia.brokenHillsEntered(triggererId)

	local player = Player.Get(triggererId)

	if (player:HasToken("ULGRIM_HOMESTEAD") == false && player:HasToken("UNDERCITY_SHORTCUT") == false) then
		GiveTokenIfPlayer(triggererId, "UNDERCITY_SHORTCUT")
			
	end
	
end


local UndercityState = { Default = 0, Cleared = 1, ClearedHomestead = 2 }

local undercityShortcutStateObjects = orderedTable();
	undercityShortcutStateObjects["ULGRIM_HOMESTEAD"] = { state = UndercityState.ClearedHomestead,  dbr = nil }
	undercityShortcutStateObjects["UNDERCITY_SHORTCUT"] = { state = UndercityState.Cleared,  dbr = nil }
	undercityShortcutStateObjects[""]			= { state = UndercityState.Default,  dbr = "records/storyelements/questassets/undercityshortcut_blocker_01.dbr" }
	
function gd.quests.homesteadQuestOldArkovia.undercityShortcutOnAddToWorld(objectId)

	if Server && not spawnedBlockade then
		spawnedBlockade = true
		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, undercityShortcutStateObjects);
		Shared.setUserdata(objectId, userdata);
		
	end
	
end

gd.quests.homesteadQuestOldArkovia.undercityShortcutOnDestroy = ClearObjectUserdata

