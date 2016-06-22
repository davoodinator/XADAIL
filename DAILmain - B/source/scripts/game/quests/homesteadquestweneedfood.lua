/*
	
	GRIM DAWN
	
	For more information, visit us at http://www.grimdawn.com
	
*/

gd.quests.homesteadQuestWeNeedFood = {}

--
-- Broken Bridge
--


-- Called by trigger, quest is waiting on a token to progress
function gd.quests.homesteadQuestWeNeedFood.brokenBridge(triggererId)
	local player = Player.Get(triggererId)
	local kQuest_Food = 0xB561CE00
	local kTask_Bridge = 0xBDE28200
	local questTaskState = player:GetQuestTaskState(kQuest_Food, kTask_Bridge)
	
	if (player != nil) && (questTaskState == QuestState.InProgress) then
		UI.Notify("tagNotification_HS_WeNeedFood_HomesteadBridgeFound")
	end
end

--
-- Smuggler's Pass crossed
--

-- Called by trigger, quest is waiting on a token to progress
function gd.quests.homesteadQuestWeNeedFood.smugglerPass(triggererId)
	local player = Player.Get(triggererId)
	local kQuest_Food = 0xB561CE00
	local kTask_SmugglerPass = 0xBDE28200
	local questTaskState = player:GetQuestTaskState(kQuest_Food, kTask_SmugglerPass)
	
	GiveTokenIfPlayer(triggererId, "SMUGGLERSPASS_CROSSED");

	if (player != nil) && (questTaskState == QuestState.InProgress) then
		UI.Notify("tagNotification_HS_WeNeedFood_HomesteadSmugglerPassCrossed")
	end
end


--
-- Troll barricade
--

-- Cleared when Troll boss is slain
local trollWallId = 0

function gd.quests.homesteadQuestWeNeedFood.trollWallOnAddToWorld(objectId)

	if Server then
		trollWallId = objectId
		
	end
	
end

function gd.quests.homesteadQuestWeNeedFood.trollKilled()

	if Server then
		if (trollWallId != 0) then
	
			trollwall = Destructible.Get(trollWallId)
		
			trollwall:Destroy(Vec(0, 1, 0), 500, false)
			trollWallId = 0
		
		end
	
	end
	
end

