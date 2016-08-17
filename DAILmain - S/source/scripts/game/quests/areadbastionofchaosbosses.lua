/*
	
	GRIM DAWN
	
	For more information, visit us at http://www.grimdawn.com
	
*/

gd.quests.areaDBastionOfChaosBosses = {}


local doorBossA01 = 0
local doorBossA02 = 0
local doorBossB01 = 0
local doorBossB02 = 0
local doorPermaLocked = false
local doorLockedWarning = false
local doorBossDead = false



-- Bation of Chaos Boss, unlocks access to Epic Door.
function gd.quests.areaDBastionOfChaosBosses.doorGuardianKilled()
	
	doorBossDead = true

end



-- Bastion of Chaos boss door initialization
function gd.quests.areaDBastionOfChaosBosses.doorBossA01OnAddToWorld(objectId)
	
	if Server then
		doorBossA01 = objectId
	
	end
	
end

function gd.quests.areaDBastionOfChaosBosses.doorBossA02OnAddToWorld(objectId)
	
	if Server then
		doorBossA02 = objectId
	
	end
	
end

function gd.quests.areaDBastionOfChaosBosses.doorBossB01OnAddToWorld(objectId)
	
	if Server then
		doorBossB01 = objectId
	
	end
	
end

function gd.quests.areaDBastionOfChaosBosses.doorBossB02OnAddToWorld(objectId)
	
	if Server then
		doorBossB02 = objectId
	
	end
	
end


function gd.quests.areaDBastionOfChaosBosses.Boss1Killed()
	
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

function gd.quests.areaDBastionOfChaosBosses.Boss2Killed()

	GiveTokenToLocalPlayer("AREAD_BASTIONOFCHAOS_CLEARED")
	
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
-- Bastion of Chaos Entry door control
--

function gd.quests.areaDBastionOfChaosBosses.epicDoorOnInteractGlobalMP()

	doorPermaLocked = true

end

function gd.quests.areaDBastionOfChaosBosses.epicDoorOnInteract(objectId, userId)
	
	local player = Player.Get(userId)
	local door = Door.Get(objectId)
		
	if (door != nil) then
		
--		if player:HasItem("records/items/crafting/materials/craft_skeletonkey.dbr", 1, false) && doorPermaLocked == false && doorBossDead == true then
		if player:HasItem("records/items/crafting/materials/craft_skeletonkey.dbr", 1, false) then
		
			-- Mark the door as locked permanently for all players
--			doorPermaLocked = true
			QuestGlobalEvent("bastionOfChaosEpicDoor")
			
			-- Consume key to unlock door		
			door:Open()
			player:TakeItem("records/items/crafting/materials/craft_skeletonkey.dbr", 1, false)
			
			UI.Notify("tagNotification_WarningBastionGates")
				
--		elseif player:HasItem("records/items/crafting/materials/craft_skeletonkey.dbr", 1, false) && doorLockedWarning == false && doorBossDead == true then
--			doorLockedWarning = true
--			UI.Notify("tagNotification_WarningBastionGatesLocked")
		
		end
			
	end
	
end
