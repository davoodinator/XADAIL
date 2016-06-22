/*
	
	GRIM DAWN
	
	For more information, visit us at http://www.grimdawn.com
	
*/

--
-- Mornay movement
--
-- Mornay begins in the off-state, transitions to Bourbon's office.
-- quest dialogue can cause Mornay to transition to a corpse in an AreaC zone
--

gd.quests.homesteadNPCMornay = {}

local mornayOfficeId = 0
local mornayCorpseId = 0
local spawnedCorpse = false

local MornayState = { Absent = 0, Town = 1, Dead = 2, Looted = 3 }

--Mornay in town
local mornayStateObjects = orderedTable()
	mornayStateObjects["MORNAY_LOOTED"	] = { state = MornayState.Looted,  dbr = nil }
	mornayStateObjects["MORNAY_DEAD"	] = { state = MornayState.Dead,  dbr = nil }
	mornayStateObjects["MORNAY_TOWN"	] = { state = MornayState.Town,  dbr = "records/creatures/npcs/questnpcs/gdareab/npc_mornay_01.dbr"}
	mornayStateObjects[""					 	] = { state = MornayState.Absent, dbr = nil }

function gd.quests.homesteadNPCMornay.mornayOnAddToWorld(objectId)

	if Server then
	
		mornayOfficeId = objectId

		local userdata = {}
		TokenStateBasedObjectSwap(objectId, userdata, mornayStateObjects)
		Shared.setUserdata(objectId, userdata)
		
		QuestGlobalEvent("weNeedFoodAct3Fix")
		
	end
	
end

function gd.quests.homesteadNPCMornay.mornayOnRemoveFromWorld(objectId)

	if Server then
	
		mornayOfficeId = 0
		
	end
	
end

gd.quests.homesteadNPCMornay.mornayOnDestroy = ClearObjectUserdata



--Mornay in world as corpse
local mornayCorpseStateObjects = orderedTable()
	mornayCorpseStateObjects["MORNAY_LOOTED"	] = { state = MornayState.Looted,  dbr = nil }
	mornayCorpseStateObjects["MORNAY_DEAD"	] = { state = MornayState.Dead,  dbr = "Records/Items/LootChests/QuestChests/QuestChest_MornayCorpseChest.dbr"}
	mornayCorpseStateObjects["MORNAY_TOWN"	] = { state = MornayState.Town,  dbr = nil }
	mornayCorpseStateObjects[""					 	] = { state = MornayState.Absent, dbr = nil }

function gd.quests.homesteadNPCMornay.mornayCorpseOnAddToWorld(objectId)

	if Server then
	
		if (not spawnedCorpse) then
			mornayCorpseId = objectId

			local userdata = {}
			local didWork, newState = TokenStateBasedObjectSwap(objectId, userdata, mornayCorpseStateObjects)
			Shared.setUserdata(objectId, userdata)
			
			-- Don't respawn Mornay's corpse next time. If spawned as chest, saved into world
			if (newState == MornayState.Dead) then
				spawnedCorpse = true
				
			end
			
		end
		
	end
	
end

gd.quests.homesteadNPCMornay.mornayCorpseOnDestroy = ClearObjectUserdata

-- Token exchange when Mornay's corpse is looted so that it never spawns again
function gd.quests.homesteadNPCMornay.mornayCorpseFound()

	if Server then
	
		GiveTokenIfPlayer(Game.GetLocalPlayer():GetId(), "MORNAY_LOOTED")
		
		if Game.GetLocalPlayer():HasToken("MORNAY_DEAD") then
			Game.GetLocalPlayer():RemoveToken("MORNAY_DEAD")
			
		end
		
	end
	
end

-- Mornay spawn in town for the first time
local mornaySpawn = false

function gd.quests.homesteadNPCMornay.mornaySwapGlobalMP()
	local player = Game.GetLocalPlayer()

	if ((player:HasToken("MORNAY_LOOTED") == false) && (player:HasToken("MORNAY_DEAD") == false) && (player:HasToken("MORNAY_TOWN") == false)) then
		GiveTokenToLocalPlayer("MORNAY_TOWN")
	
	end

end

function gd.quests.homesteadNPCMornay.mornaySwap()

	if Server then
		local player = Game.GetLocalPlayer()
		
		if ((player:HasToken("MORNAY_LOOTED") == false) && (player:HasToken("MORNAY_DEAD") == false) && (player:HasToken("MORNAY_TOWN") == false)) && not mornaySpawn then
			mornaySpawn = true
			GiveTokenToLocalPlayer("MORNAY_TOWN")
			
			local mornay = Entity.Get(mornayOfficeId)
			
			if (mornay != nil) then
				UpdateObjectSwap(mornayOfficeId, mornayStateObjects)
					
			end
		
		end
		
		QuestGlobalEvent("mornaySpawnToken")
	
	end

end



--
-- Fix for We Need Food Quest if it resets
--

function gd.quests.homesteadNPCMornay.Act3FixGlobalMP()
	
	local player = Game.GetLocalPlayer()
	local kQuest_WeNeedFood = 0xB561CE00
	local kTask_WNF01 = 0x06BCD4E8
	local kTask_WNF02 = 0xBDE28200
	local kQuest_RemoveTheHead = 0x554DB080
	local kTask_RTH01 = 0xB0CDAD00
	local kTask_RTH02 = 0x5F79AE00
	local questTaskState = player:GetQuestTaskState(kQuest_WeNeedFood, kTask_WNF01)
	local questTaskState02 = player:GetQuestTaskState(kQuest_WeNeedFood, kTask_WNF02)
	local questTaskState03 = player:GetQuestTaskState(kQuest_RemoveTheHead, kTask_RTH01)
	
	if (questTaskState == QuestState.Complete) then
		player:GrantQuest(0xB561CE00, 0xBDE28200)
	elseif (questTaskState03 == QuestState.Complete) && (player:HasToken("MORNAY_DEAD") == false) then
		player:GrantQuest(0xB561CE00, 0x06BCD4E8)
	
	end
	
	local kQuest_MurderersAndWorse = 0x0DB402C0
	local kTask_MAW01 = 0xA5229F00
	local kTask_MAW02 = 0xFE915A00
	local questTaskState04 = player:GetQuestTaskState(kQuest_MurderersAndWorse, kTask_MAW01)
	
	
	if (questTaskState04 == QuestState.Complete) then
	
		if (player:HasToken("EDMUND_DEAD")) then
			player:GrantQuest(0x0DB402C0, 0xFE915A00)
		elseif (player:HasToken("GD_FARMLANDBRIDGE_REPAIRED")) then
			player:GrantQuest(0x0DB402C0, 0x33876740)
		else
			player:GrantQuest(0x0DB402C0, 0x84155E00)
		end
	
	end
	
	-- B26 Hotfix 4 for reset An Old Threat and Find Elsa
	local questTaskState05 = player:GetQuestTaskState(kQuest_MurderersAndWorse, kTask_MAW02)
	local questTaskState06 = player:GetQuestTaskState(kQuest_RemoveTheHead, kTask_RTH02)
	
	-- resumes An Old Threat if it was reset for the player
	if (questTaskState05 == QuestState.Complete && questTaskState06 != QuestState.InProgress && questTaskState06 != QuestState.Complete) then
		if (player:HasToken("CRONLEY_SLAIN")) then
			player:GrantQuest(0x554DB080, 0xB0CDAD00)
			player:GrantQuest(0x56F9E480, 0x301718C0)
			
		else
			player:GrantQuest(0x554DB080, 0x5F79AE00)
			
		end
	
	end
		
end
