/*
	
	GRIM DAWN
	scripts/quests/devilscrossing.lua
	
	For more information, visit us at http://www.grimdawn.com
	
*/

gd.quests.devilsCrossingQuestWarden = {}

--
-- Warden cellar discovery
--

-- Called by trigger, quest is waiting on a token to progress
function gd.quests.devilsCrossingQuestWarden.wardenCellarFound(triggererId)

	local player = Player.Get(triggererId)
	local kQuest_Warden = 0xD631D200
	local kTask_FindCellar = 0x44EB9400
	local questTaskState = player:GetQuestTaskState(kQuest_Warden, kTask_FindCellar)

	GiveTokenIfPlayer(triggererId, "WARDEN_CELLAR_FOUND");

	if (player != nil) && (questTaskState == QuestState.InProgress) then
		UI.Notify("tagNotification_WardenCellarFound")
	end
	
end

--
-- Warden lab discovery
--

-- Called by trigger, quest is waiting on a token to progress
function gd.quests.devilsCrossingQuestWarden.wardenLabFound(triggererId)

	local player = Player.Get(triggererId)
	local kQuest_Warden = 0xD631D200
	local kTask_FindCellar = 0x44EB9400
	local kTask_FindLab = 0xAE906500
	local questTaskState = player:GetQuestTaskState(kQuest_Warden, kTask_FindCellar)
	local questTaskState02 = player:GetQuestTaskState(kQuest_Warden, kTask_FindLab)

	GiveTokenIfPlayer(triggererId, "WARDEN_LAB_FOUND");

	if (questTaskState == QuestState.InProgress) then
		GiveTokenToLocalPlayer("WARDEN_CELLAR_FOUND")
	
	end
		
	if (player != nil) && (questTaskState02 == QuestState.InProgress) then
		UI.Notify("tagNotification_WardenLabFound")
		
	end
	
end

--
-- Warden death / oneshot chest
--

local bossDoor = 0
local wardenChestId = 0

function gd.quests.devilsCrossingQuestWarden.wardenKilled()
	
	GiveTokenToLocalPlayer("WARDEN_SLAIN")
	Script.Event("EV_WARDEN");
	
	if Server then
		local player = Game.GetLocalPlayer()
		local wardenChest = Chest.Get(wardenChestId);
		
		-- Unlock warden chest if present
		if (wardenChest ~= nil) then
			wardenChest:SetLocked(false)
		end
	
		-- Reopen door to warden room
		local door = Door.Get(bossDoor)
	
		if door ~= nil then
			door:Open()
		end
	
		-- Spawn Mornay in town if he has not already been spawned
		gd.quests.homesteadNPCMornay.mornaySwap()
		
	end
	
end

function gd.quests.devilsCrossingQuestWarden.wardenChestOnAddToWorld(objectId)
	
	if Server then
		wardenChestEntity = Entity.Get(objectId)
		wardenChestId = objectId
		player = Game.GetLocalPlayer()
	
		if (player != nil) && (wardenChestEntity:IsReloaded() == false) && (player:AnyoneHasToken("DUNGEONCHEST_WARDEN")) then
			print "Destroying Chest"
			wardenChestEntity:Destroy()
			
		end
		
	end
	
end

function gd.quests.devilsCrossingQuestWarden.wardenChestFound()

	GiveTokenIfPlayer(Game.GetLocalPlayer():GetId(), "DUNGEONCHEST_WARDEN");
	
end

function gd.quests.devilsCrossingQuestWarden.bossDoorOnAddToWorld(objectId)
	
	if Server then
		bossDoor = objectId
		
	end
	
end