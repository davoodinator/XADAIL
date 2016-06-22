/*
	
	GRIM DAWN
	
	For more information, visit us at http://www.grimdawn.com
	
*/

gd.quests.homesteadQuestLostElder = {}

local elderChestSpawned = false

--
-- The lost elder starts as a dialogue NPC and swaps to a corpse on subsequent discoveries after he is encountered for the quest
local ElderState = { Dying = 0, Found = 1, Dead=2 }

local elderStateObjects = orderedTable()
	elderStateObjects["ELDER_DEAD"	] = { state = ElderState.Dead,  dbr = "records/items/lootchests/questchests/questchest_rovereldercorpsechest_01.dbr"}
	elderStateObjects["ELDER_FOUND"	] = { state = ElderState.Found,  dbr = "records/items/lootchests/questchests/questchest_rovereldercorpsechest_01.dbr"}
	elderStateObjects[""					 	] = { state = ElderState.Dying, dbr = "records/creatures/npcs/questnpcs/gdareab/npc_roverelder_01.dbr"}

function gd.quests.homesteadQuestLostElder.elderOnAddToWorld(objectId)
	
	if Server then
		if (not elderChestSpawned) then
			userdata = {}
			local didWork, newState = TokenStateBasedObjectSwap(objectId, userdata, elderStateObjects)
			Shared.setUserdata(objectId, userdata)

			-- Don't respawn the elder if he became a chest object
			if (newState == ElderState.Found || newState == ElderState.Dead) then
				elderChestSpawned = true
				
			end
		
		end
		
	end
	
end

gd.quests.homesteadQuestLostElder.elderOnDestroy = ClearObjectUserdata

local elderFoundMP = false

function gd.quests.homesteadQuestLostElder.elderFoundGlobalMP()

	if not elderFoundMP then
		elderFoundMP = true
		local player = Game.GetLocalPlayer()
		
		local kQuest_Elder = 0x93AE8A00
		local kTask_Talisman = 0xA7CEBA00

		local questTaskState = player:GetQuestTaskState(kQuest_Elder, kTask_Talisman)
		
		if (player != nil && (questTaskState == QuestState.InProgress && player:HasToken("ELDER_FOUND") == false && player:HasToken("ELDER_DEAD") == false)) then
			GiveTokenToLocalPlayer("ELDER_FOUND")
			player:GiveItem("records/storyelements/questitems/sq_lostelder_talisman.dbr", 1, false)
			
		end
	
	end

end

function gd.quests.homesteadQuestLostElder.keptTalismanGlobalMP()

	local player = Game.GetLocalPlayer()

	local kQuest_Elder = 0x93AE8A00
	local kTask_Talisman = 0xA7CEBA00

	local questTaskState = player:GetQuestTaskState(kQuest_Elder, kTask_Talisman)
	
	if (player != nil && (questTaskState == QuestState.InProgress)) then
		player:GiveToken("HS_KEPTTALISMAN")

	end
	
end

function gd.quests.homesteadQuestLostElder.keptTalismanReturnGlobalMP()

	local player = Game.GetLocalPlayer()

	local kQuest_Elder = 0x93AE8A00
	local kTask_Talisman = 0xF503B800

	local questTaskState = player:GetQuestTaskState(kQuest_Elder, kTask_Talisman)
	
	if (player != nil && (questTaskState == QuestState.InProgress)) then
		player:GiveToken("HS_KEPTTALISMAN")

	end
	
end