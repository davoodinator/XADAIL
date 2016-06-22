/*
	
	GRIM DAWN
	
	For more information, visit us at http://www.grimdawn.com
	
*/

gd.quests.areaCQuestLegionPriority = {}

-- Boss Killed
function gd.quests.areaCQuestLegionPriority.bossKilled()

	GiveTokenToLocalPlayer("LEGIONPRIORITY_BOSSKILLED")
	
end

-- UG Door
local entranceId = 0
local questActive = false

function gd.quests.areaCQuestLegionPriority.entranceOnAddToWorld(objectId)

	if Server then
	
		entranceId = objectId;
		
		local door = Door.Get(objectId)
		local player = Game.GetLocalPlayer()
		
		local questId01 = 0x650A5F80
		local taskId01 = 0xBC5D4600
		
		local questTaskState01 = player:GetQuestTaskState(questId01, taskId01)

		if (player:GetFaction("USER7") >= 10000 || questActive || questTaskState01 == QuestState.Complete|| questTaskState01 == QuestState.InProgress) then
			-- Player already unlocked this door
			door:SetLocked(false)
			door:Open()
		end
		
	end
		
end

-- Unlock Door through quest
function gd.quests.areaCQuestLegionPriority.openDungeon()

	if Server then
		local door = Door.Get(entranceId)
		questActive = true
			
		if ((door != nil) && (door:IsLocked())) then
			door:SetLocked(false)
			door:Open()
			
		end
	
	end
	
end

-- Unlock door if player eligible for it clicks it
function gd.quests.areaCQuestLegionPriority.doorOnInteract(objectId, userId)

	local player = Player.Get(userId)
	local door = Door.Get(objectId)
	
	-- unlock door if player has the required reputation
	if ((door != nil) && (door:IsLocked())) then
		if (player:GetFaction("USER7") >= 10000) then
			door:SetLocked(false)
			door:Open()
			
		end
		
	end
	
end

