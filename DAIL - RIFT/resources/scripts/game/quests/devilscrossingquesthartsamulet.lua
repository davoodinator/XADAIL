/*
	
	GRIM DAWN
	
	For more information, visit us at http://www.grimdawn.com
	
*/

gd.quests.devilsCrossingQuestHartsAmulet = {}

--
-- Hart's Amulet item grants a quest if the player didn't already receive it from the questgiver
--

function gd.quests.devilsCrossingQuestHartsAmulet.lootAmulet(looterId, itemId)

	if looterId == Game.GetLocalPlayer():GetId() then
		local kQuest_HartsAmulet = 0x39C1FF00
		local kTask_FieldReturn  = 0xD167CF00
		local player = Player.Get(looterId)
		
		local questState = player:GetQuestState(kQuest_HartsAmulet)

		if ((player != nil) && (questState == QuestState.Available)) then
			player:GrantQuest(kQuest_HartsAmulet, kTask_FieldReturn)
			
		end
	
	end
	
end
