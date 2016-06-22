/*
	
	GRIM DAWN
	
	For more information, visit us at http://www.grimdawn.com
	
*/

gd.quests.devilsCrossingWitchGodShrines = {}

--
-- Witch God Shrines
-- The witch god shrines are scattered across the world in hidden locations. They must be uncovered in sequence, leading up to a hidden dungeon at the end.
--
--

-- Start Quest
function gd.quests.devilsCrossingWitchGodShrines.lootDreegStone(looterId, itemId)

	if looterId == Game.GetLocalPlayer():GetId() then
		local kQuest = 0x06793B70
		local kTask  = 0x144F3240
		local player = Player.Get(looterId)
		
		local questState = player:GetQuestState(kQuest)

		if ((player != nil) && (questState == QuestState.Available)) then
			player:GrantQuest(kQuest, kTask)
			
		end
	
	end
	
end


-- Doors
local shrine02DoorId = 0
local shrine03DoorId = 0
local templeDoorId = 0
local bossDoorId = 0
local bossDoor02Id = 0

local bossDead = false
local bossDoor02Open = false

local shrine02Opened = false
local shrine03Opened = false


function gd.quests.devilsCrossingWitchGodShrines.shrine02DoorOnAddToWorld(objectId)
	
	if Server then
		shrine02DoorId = objectId
		local door = Door.Get(objectId)
		
		local player = Game.GetLocalPlayer()
		
		if player:HasToken("WITCHGODS_SHRINE02_UNLOCKED") then
			door:Open()
			shrine02Opened = true
		end
		
	end
	
end

function gd.quests.devilsCrossingWitchGodShrines.shrine03DoorOnAddToWorld(objectId)
	
	if Server then
		shrine03DoorId = objectId
		local door = Door.Get(objectId)
		
		local player = Game.GetLocalPlayer()
		
		if player:HasToken("WITCHGODS_SHRINE03_UNLOCKED") then
			door:Open()
			shrine03Opened = true
		end
		
	end
	
end

-- UG Door
local caveEntranceId = 0
local caveOpen = false

function gd.quests.devilsCrossingWitchGodShrines.shrine03CaveEntranceOnAddToWorld(objectId)

	if Server then
	
		caveEntranceId = objectId;
		
		local door = Door.Get(objectId)
		local player = Game.GetLocalPlayer()

		if (caveOpen) then
			door:SetLocked(false)
			door:Open()
		end
		
	end
		
end

function gd.quests.devilsCrossingWitchGodShrines.templeDoorOnAddToWorld(objectId)
	
	if Server then
		templeDoorId = objectId
		
	end
	
end

function gd.quests.devilsCrossingWitchGodShrines.bossDoorOnAddToWorld(objectId)
	
	if Server then
		bossDoorId = objectId
		
	end
	
end

function gd.quests.devilsCrossingWitchGodShrines.bossDoor02OnAddToWorld(objectId)
	
	if Server then
		bossDoor02Id = objectId

		if bossDead && not bossDoor02Open then
			bossDoor02Open = true
			local door = Door.Get(objectId)
			
			door:Open()
			door:SetLocked(false)
		
		end
		
	end
	
end

-- Temple Guardian Boss
local bossId = 0
local bossCoords = nil

function gd.quests.devilsCrossingWitchGodShrines.bossOnAddToWorld(objectId)

	if Server then
		bossId = objectId
		bossCoords = Entity.Get(objectId):GetCoords()
	
	end

end

function gd.quests.devilsCrossingWitchGodShrines.bossLeaveRoom()

	if Server then
		-- Teleport boss back to spawn point if he is somehow kited out of boss room
		local bossEntity = Character.Get(bossId)
		local coords = bossEntity:GetCoords()
		local rift = Entity.Create("records/fx/ui/riftgatepersonalopen_fxpak.dbr")

		if (rift != nil) then
			rift:NetworkEnable()
			rift:SetCoords(coords)
		end
		
		bossEntity:SetCoords(bossCoords)
	
	end


end

function gd.quests.devilsCrossingWitchGodShrines.bossKilled()

	GiveTokenToLocalPlayer("WITCHGODS_GUARDIANKILLED")

	if Server then		
		local door = Door.Get(bossDoorId)
		local door02 = Door.Get(bossDoor02Id)
		
		bossDead = true
	
		if door != nil then
			door:Open()
		end
	
		if door02 != nil then
			door02:Open()
			door:SetLocked(false)
		end
		
	end
	
end


--
-- Unlock access to the second shrine
--
local shrine02UnlockedMP = false

function gd.quests.devilsCrossingWitchGodShrines.door02OpenGlobalMP()

	if not shrine02UnlockedMP then
		shrine02UnlockedMP = true
		
		local player = Game.GetLocalPlayer()
		local questId = 0x06793B70
		local taskId = 0x144F3240

		local questTaskState = player:GetQuestTaskState(questId, taskId)
		
		if (questTaskState == QuestState.InProgress && player:HasItem("records/items/questitems/shrinemarker_dreeg.dbr", 1, false)) then
			GiveTokenToLocalPlayer("WITCHGODS_SHRINE02_UNLOCKED")
		
		end
	
	end

end


function gd.quests.devilsCrossingWitchGodShrines.door02Open()

	if Server then
		local player = Game.GetLocalPlayer()
		local questId = 0x06793B70
		local taskId = 0x144F3240
		
		local questTaskState = player:GetQuestTaskState(questId, taskId)
		
		if (not shrine02Opened && (player:HasToken("WITCHGODS_SHRINE02_UNLOCKED") || (questTaskState == QuestState.InProgress && player:HasItem("records/items/questitems/shrinemarker_dreeg.dbr", 1, false)))) then
			GiveTokenToLocalPlayer("WITCHGODS_SHRINE02_UNLOCKED")
			
			shrine02Opened = true

			local door = Door.Get(shrine02DoorId)
			
			if (door != nil) then
				door:Open()
		
			end
			
			UI.Notify("tagNotification_WitchGods_Shrine02")
			
		end
		
	end
	
end

function gd.quests.devilsCrossingWitchGodShrines.triggerDoor02(triggererId)
	
	QuestEvent("witchGodShrine02Open")
	QuestGlobalEvent("witchGodShrine02UnlockToken")
	
end

--
-- Unlock access to the third shrine
--
local shrine03UnlockedMP = false

function gd.quests.devilsCrossingWitchGodShrines.door03OpenGlobalMP()

	if not shrine03UnlockedMP then
		shrine03UnlockedMP = true
		
		local player = Game.GetLocalPlayer()
		local questId = 0x06793B70
		local taskId = 0x02FEC5C8

		local questTaskState = player:GetQuestTaskState(questId, taskId)
		
		if (questTaskState == QuestState.InProgress && player:HasItem("records/items/questitems/shrinemarker_solael.dbr", 1, false)) then
			GiveTokenToLocalPlayer("WITCHGODS_SHRINE03_UNLOCKED")
		
		end
	
	end

end


function gd.quests.devilsCrossingWitchGodShrines.door03Open()

	if Server then
		local player = Game.GetLocalPlayer()
		local questId = 0x06793B70
		local taskId = 0x02FEC5C8
		
		local questTaskState = player:GetQuestTaskState(questId, taskId)
		
		if (not shrine03Opened && (player:HasToken("WITCHGODS_SHRINE03_UNLOCKED") || (questTaskState == QuestState.InProgress && player:HasItem("records/items/questitems/shrinemarker_solael.dbr", 1, false)))) then
			GiveTokenToLocalPlayer("WITCHGODS_SHRINE03_UNLOCKED")
			
			shrine03Opened = true
			
			local door = Door.Get(shrine03DoorId)
			
			if (door != nil) then
				door:Open()
		
			end
			
			UI.Notify("tagNotification_WitchGods_Shrine03")
			
		end
		
	end
	
end

function gd.quests.devilsCrossingWitchGodShrines.triggerDoor03(triggererId)
	
	QuestEvent("witchGodShrine03Open")
	QuestGlobalEvent("witchGodShrine03UnlockToken")
	
end

function gd.quests.devilsCrossingWitchGodShrines.shrine03CaveUnlock()

	if Server then

		local door = Door.Get(caveEntranceId)
		caveOpen = true
			
		if ((door != nil) && (door:IsLocked())) then
			door:SetLocked(false)
			door:Open()
			
		end
	
	end
	
end

function gd.quests.devilsCrossingWitchGodShrines.triggerCaveEntrance03(triggererId)
	
	QuestEvent("witchGodShrine03UnlockCave")
	
end

--
-- Unlock access to Temple
--

function gd.quests.devilsCrossingWitchGodShrines.templeDoorGlobalMP()

	local player = Game.GetLocalPlayer()
	local questId = 0x06793B70
	local taskId = 0x5ACB3180

	local questTaskState = player:GetQuestTaskState(questId, taskId)
	
	if ((questTaskState == QuestState.InProgress || questTaskState == QuestState.Complete) && (player:HasItem("records/items/questitems/shrinemarker_dreeg.dbr", 1, false) && player:HasItem("records/items/questitems/shrinemarker_solael.dbr", 1, false) && player:HasItem("records/items/questitems/shrinemarker_bysmiel.dbr", 1, false))) then
		GiveTokenToLocalPlayer("WITCHGODS_TEMPLE_UNLOCKED")
	
	end

end

-- Opens the final temple door when player with first stone clicks it
function gd.quests.devilsCrossingWitchGodShrines.templeDoorOnInteract(objectId, userId)

	local player = Player.Get(userId)
	local questId = 0x06793B70
	local taskId = 0x5ACB3180

	local questTaskState = player:GetQuestTaskState(questId, taskId)
	
	local door = Door.Get(objectId)
		
	if ((door != nil) && (door:IsLocked())) then
		if (player:HasToken("WITCHGODS_TEMPLE_UNLOCKED") || ((questTaskState == QuestState.InProgress || questTaskState == QuestState.Complete) && (player:HasItem("records/items/questitems/shrinemarker_dreeg.dbr", 1, false) && player:HasItem("records/items/questitems/shrinemarker_solael.dbr", 1, false) && player:HasItem("records/items/questitems/shrinemarker_bysmiel.dbr", 1, false)))) then
			door:Open()

			QuestGlobalEvent("witchGodTempleUnlockToken")
			
		end
		
	end
	
end


--Secret Door control
-- Door control
local secretBossRoomDoorId = 0
local secretOpened = false

function gd.quests.devilsCrossingWitchGodShrines.secretBossRoomDoorOnAddToWorld(objectId)
	
	if Server then
		secretBossRoomDoorId = objectId
		
	end
	
end


function gd.quests.devilsCrossingWitchGodShrines.openSecret()

	if Server && not secretOpened then
		secretOpened = true
		local door = Door.Get(secretBossRoomDoorId)
		
		UI.Notify("tagNotification_WitchGods_Secret")
		
		if ((door != nil) && (door:IsLocked())) then
			door:SetLocked(false)
			door:Open()
			
		end
	
	end
	
end

-- Secret Boss
function gd.quests.devilsCrossingWitchGodShrines.secretBossKilled()

	GiveTokenToLocalPlayer("WITCHGODS_SECRETBOSSKILLED")
	
end


-- Quest Complete FX
local questCompleteFX = false
local attendantId = 0

function gd.quests.devilsCrossingWitchGodShrines.attendantOnAddToWorld(objectId)

	if Server then
	
		attendantId = objectId
		
	end
	
end

function gd.quests.devilsCrossingWitchGodShrines.questCompleteFX()

	if Server then
	
		-- Only show the effect once
		if (not questCompleteFX) then

			local attendant = Entity.Get(attendantId)

			if (attendant != nil) then
			
				local coords = attendant:GetCoords()
				local pfx = Entity.Create("records/fx/skillsdevotion/abomination_vileeruption_radius_fxpak01.dbr")
				
				if (pfx != nil) then
					pfx:NetworkEnable()
					pfx:SetCoords(coords)
					questCompleteFX = true
				end
				
			end
			
		end
		
	end

end



