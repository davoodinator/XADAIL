/*
	
	GRIM DAWN
	
	For more information, visit us at http://www.grimdawn.com
	
*/

gd.quests.devilsCrossingQuestLostApprentice = {}

--
-- Lost apprentice discovery
--

-- Called by trigger, quest is waiting on a token to progress
function gd.quests.devilsCrossingQuestLostApprentice.findApprenticeGlobalMP()

	local kQuest_LostApprentice = 0xA6E46100
	local kTask_FindApprentice  = 0xF1B40300
	
	local player = Game.GetLocalPlayer()
	local questTaskState_FindApprentice = player:GetQuestTaskState(kQuest_LostApprentice, kTask_FindApprentice)
	
	if (player != nil) && (questTaskState_FindApprentice == QuestState.InProgress) then
		player:GiveToken("KASPAROV_APPRENTICE_FOUND")
			
	end

end

function gd.quests.devilsCrossingQuestLostApprentice.findApprentice(triggererId)

	QuestGlobalEvent("apprenticeFoundToken")
	
end

-- Called by trigger
function gd.quests.devilsCrossingQuestLostApprentice.findApprenticeCellar(triggererId)

	local player = Player.Get(triggererId)

	if (not player:HasToken("KASPAROV_APPRENTICE_FOUND")) then
		UI.Notify("tagNotification_LostApprenticeCellar") 	
			
	end
	
end