/*
	
	GRIM DAWN
	
	For more information, visit us at http://www.grimdawn.com
	
*/

gd.quests.homesteadStepsOfTormentBosses = {}


local doorBossA01 = 0
local doorBossA02 = 0
local doorBossB01 = 0
local doorBossB02 = 0
local doorPermaLocked = false
local doorLockedWarning = false
local doorBossDead = false



-- Steps of Torment Floor 3 Boss and Door. Gives retroactive kill credit for boss.
local doorFloor3 = 0

function gd.quests.homesteadStepsOfTormentBosses.doorFloor3OnAddToWorld(objectId)

	if Server then
		doorFloor3 = objectId
	
	end
	
end

function gd.quests.homesteadStepsOfTormentBosses.grandPriestKilled()

	GiveTokenToLocalPlayer("HS_GRANDPRIEST_KILLED")
	
	doorBossDead = true
	
	if Server then
		local door = Door.Get(doorFloor3)
	
		if door != nil then
			door:Open()
		
		end
	
	end

end



-- No Riftgate region warning trigger
function gd.quests.homesteadStepsOfTormentBosses.warningNoRiftgates(triggererId)

	local player = Player.Get(triggererId)

	if (player != nil) && (player:HasToken("WARNING_STEPSOFTORMENT") == false) then
		UI.Notify("tagNotification_WarningRiftgateDisabled")
		GiveTokenIfPlayer(triggererId, "WARNING_STEPSOFTORMENT")
	end
	
end


-- Steps of Torment boss door initialization
function gd.quests.homesteadStepsOfTormentBosses.doorBossA01OnAddToWorld(objectId)
	
	if Server then
		doorBossA01 = objectId
	
	end
	
end

function gd.quests.homesteadStepsOfTormentBosses.doorBossA02OnAddToWorld(objectId)
	
	if Server then
		doorBossA02 = objectId
	
	end
	
end

function gd.quests.homesteadStepsOfTormentBosses.doorBossB01OnAddToWorld(objectId)
	
	if Server then
		doorBossB01 = objectId
	
	end
	
end

function gd.quests.homesteadStepsOfTormentBosses.doorBossB02OnAddToWorld(objectId)
	
	if Server then
		doorBossB02 = objectId
	
	end
	
end


function gd.quests.homesteadStepsOfTormentBosses.Boss1DoorOpen()
	
	if Server then
		local door01 = Door.Get(doorBossA01)
		local door02 = Door.Get(doorBossA02)
	
		if door01 != nil then
			door01:Open()
		
		end
	
		if door02 != nil then
			door02:Open()
		
		end
	
	end

end

function gd.quests.homesteadStepsOfTormentBosses.Boss2Killed()

	GiveTokenToLocalPlayer("HS_STEPSOFTORMENT_CLEARED")
	
	if Server then	
		local door01 = Door.Get(doorBossB01)
		local door02 = Door.Get(doorBossB02)
	
		if door01 != nil then
			door01:Open()
		
		end
	
		if door02 != nil then
			door02:Open()
		
		end
	
	end

end

--
-- Steps of Torment Entry door control
--

function gd.quests.homesteadStepsOfTormentBosses.epicDoorOnInteractGlobalMP()

	doorPermaLocked = true

end

function gd.quests.homesteadStepsOfTormentBosses.epicDoorOnInteract(objectId, userId)
	
	local player = Player.Get(userId)
	local door = Door.Get(objectId)
		
	if (door != nil) then
		
--		if player:HasItem("records/items/crafting/materials/craft_skeletonkey.dbr", 1, false) && doorPermaLocked == false && doorBossDead == true then
		if player:HasItem("records/items/crafting/materials/craft_skeletonkey.dbr", 1, false) then
		
			-- Mark the door as locked permanently for all players
--			doorPermaLocked = true
			QuestGlobalEvent("stepsOfTormentEpicDoor")
			
			-- Consume key to unlock door		
			door:Open()
			player:TakeItem("records/items/crafting/materials/craft_skeletonkey.dbr", 1, false)
			
			UI.Notify("tagNotification_WarningGatesOfAnguish")
				
--		elseif player:HasItem("records/items/crafting/materials/craft_skeletonkey.dbr", 1, false) && doorLockedWarning == false && doorBossDead == true then
--			doorLockedWarning = true
--			UI.Notify("tagNotification_WarningGatesOfAnguishLocked")
		
		end
			
	end
	
end

--
-- Exit Shortcut Control
-- Only opens after main chest is opened
-- 
local shortcutId = 0
local shortcutOpen = false

function gd.quests.homesteadStepsOfTormentBosses.unlockShortcut()

	UI.Notify("tagNotificationStepsOfTormentShortcut")
	
	if Server then
		shortcutOpen = true
		
		local door = Door.Get(shortcutId)
		
		-- Unlock Shortcut
		if door != nil then
			door:SetLocked(false)
			door:Open()
		end
		
	
	end
	
end

function gd.quests.homesteadStepsOfTormentBosses.exitShortcutOnAddToWorld(objectId)
	
	if Server then
		shortcutId = objectId
		
		if shortcutOpen then
			local door = Door.Get(objectId)
			
			if (door:IsLocked()) then
				door:SetLocked(false)
				door:Open()
				
			end
		
		end
		
	end
	
end


