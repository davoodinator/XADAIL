/*
	
	GRIM DAWN
	
	For more information, visit us at http://www.grimdawn.com
	
*/

gd.quests.devilsCrossingQuestReanimator = {}

--
-- Kill Kyzogg quest
--

-- Called by trigger, quest is waiting on a token to progress
function gd.quests.devilsCrossingQuestReanimator.findBurialCave(triggererId)

	local player = Player.Get(triggererId)
	local kQuest_WakingToMisery = 0x2B43AF80
	local kTask_FindBurialCave = 0x92A0C700

	local questTaskState = player:GetQuestTaskState(kQuest_WakingToMisery, kTask_FindBurialCave)

	if (player != nil) && (questTaskState == QuestState.InProgress) then
		GiveTokenIfPlayer(triggererId, "WM_BURIAL_CAVE_FOUND")
			
	end
	
end

function gd.quests.devilsCrossingQuestReanimator.killReanimatorGlobalMP()

	QuestGlobalEvent("killReanimator")
	
end

function gd.quests.devilsCrossingQuestReanimator.killReanimator()

	local kQuest_WakingToMisery = 0x2B43AF80
	local kTask_Return 			= 0x3F73DEC0
	local kTask_TalkToBourbon 	= 0xB0371500		
	
	local player = Game.GetLocalPlayer()
		
	local questState = player:GetQuestState(kQuest_WakingToMisery)
	local questTaskState = player:GetQuestTaskState(kQuest_WakingToMisery, kTask_TalkToBourbon)

	GiveTokenToLocalPlayer("DC_REANIMATOR_KILLED")
	
	-- Give quest upon killing Kyzogg if player does not have it
	if (player != nil) && ((questState == QuestState.Available) || (questTaskState == QuestState.InProgress)) then
		player:GrantQuest(kQuest_WakingToMisery, kTask_Return)
	end
	
end