/*
	
	GRIM DAWN
	
	For more information, visit us at http://www.grimdawn.com
	
*/

gd.quests.devilsCrossingQuestLostCaravan = {}

--
-- Lost Caravan quest
--

-- Called by trigger, update quest progress
local caravanFound = false

function gd.quests.devilsCrossingQuestLostCaravan.findCaravan(triggererId)

	QuestGlobalEvent("merchantBeginQuest")
	gd.quests.devilsCrossingNPCMerchant.merchantQuestFix()
	
	local player = Player.Get(triggererId)
	
	if (caravanFound == false && player:HasToken("WIGHTMIRE_CARAVAN_DRIVER_FOUND") == false && player:HasToken("MERCHANT_RESCUED") == false && player:HasToken("MERCHANT_SERVICE") == false) then
		caravanFound = true
		UI.Notify("tagNotification_WightmireCaravanFound")
			
	end
	

end

-- Called by trigger, quest is waiting on a token to progress
function gd.quests.devilsCrossingQuestLostCaravan.findDriverGlobalMP()

	local kQuest_LostCaravan = 0xCA968200
	local kTask_FindCaravan  = 0x5F267080
	
	local player = Game.GetLocalPlayer()
	local questTaskState_FindCaravan = player:GetQuestTaskState(kQuest_LostCaravan, kTask_FindCaravan)

	if (player != nil) && (questTaskState_FindCaravan == QuestState.InProgress) then
		player:GiveToken("WIGHTMIRE_CARAVAN_DRIVER_FOUND")
			
	end
	
end

function gd.quests.devilsCrossingQuestLostCaravan.findDriver(triggererId)

	local player = Player.Get(triggererId)
	
	if (player:HasToken("WIGHTMIRE_CARAVAN_DRIVER_FOUND") == false && player:HasToken("MERCHANT_RESCUED") == false && player:HasToken("MERCHANT_SERVICE") == false) then
		UI.Notify("tagNotification_WightmireCaravanDriverFound")
			
	end
	
	QuestGlobalEvent("merchantFoundToken")
	gd.quests.devilsCrossingNPCMerchant.merchantQuestFix()
	
end
