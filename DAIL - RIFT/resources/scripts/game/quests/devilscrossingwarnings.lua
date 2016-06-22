/*
	
	GRIM DAWN
	
	For more information, visit us at http://www.grimdawn.com
	
*/

gd.quests.devilsCrossingWarnings = {}

--
-- Display UI notification warnings to the player when they enter a high level area at too low a level
--

-- Called by trigger, warn low level players about Gutworm
function gd.quests.devilsCrossingWarnings.warningGutworm(triggererId)

	local player = Player.Get(triggererId)

	if (player != nil) && (player:GetLevel() < 23) && (player:HasToken("WARNING_GUTWORM") == false) then
		UI.Notify("tagNotification_WarningToughArea")
		GiveTokenIfPlayer(triggererId, "WARNING_GUTWORM")
			
	end
	
end

-- Called by trigger, warn low level players about cultist sanctuary
function gd.quests.devilsCrossingWarnings.warningSanctuary(triggererId)

	local player = Player.Get(triggererId)

	if (player != nil) && (player:GetLevel() < 23) && (player:HasToken("WARNING_SANCTUARY") == false) then
		UI.Notify("tagNotification_WarningToughArea")
		GiveTokenIfPlayer(triggererId, "WARNING_SANCTUARY")
			
	end
	
end