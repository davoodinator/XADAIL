/*
	
	GRIM DAWN
	
	For more information, visit us at http://www.grimdawn.com
	
*/

--
-- Elsa movement
--
-- Elsa begins in a small camp in AreaB, but transitions to Act 3
-- triggered by volume entry
--

gd.quests.homesteadNPCElsa = {}

local elsaCampId = 0
local elsaAreaCId = 0

local ElsaState = { Camp = 0, AreaC = 1 }

--Elsa in camp
local elsaCampStateObjects = orderedTable()
	elsaCampStateObjects["ELSA_ACT3"	] = { state = ElsaState.AreaC,  dbr = nil }
	elsaCampStateObjects[""					 	] = { state = ElsaState.Camp, dbr = "records/creatures/npcs/questnpcs/gdareab/npc_elsa_01.dbr"}

function gd.quests.homesteadNPCElsa.elsaCampOnAddToWorld(objectId)
	
	if Server then
		elsaCampId = objectId

		local userdata = {}
		TokenStateBasedObjectSwap(objectId, userdata, elsaCampStateObjects)
		Shared.setUserdata(objectId, userdata)
	
	end
	
end

gd.quests.homesteadNPCElsa.elsaCampOnDestroy = ClearObjectUserdata


--Elsa in Act 3. She can go hostile in this area for a quest, if player chooses to
local elsaAreaCStateObjects = orderedTable()
	elsaAreaCStateObjects["ELSA_ACT3"	] = { state = ElsaState.AreaC,  dbr = "records/creatures/npcs/questnpcs/gdareac/npc_elsa_02.dbr"}
	elsaAreaCStateObjects[""					 	] = { state = ElsaState.Camp, dbr = nil }
	
function gd.quests.homesteadNPCElsa.elsaAreaCOnAddToWorld(objectId)
	if Server then
		elsaAreaCId = objectId

		local userdata = {}
		local didWork, newState = TokenStateBasedObjectSwap(objectId, userdata, elsaAreaCStateObjects)

		Shared.setUserdata(objectId, userdata)
	
	end
	
end

gd.quests.homesteadNPCElsa.elsaAreaCOnDestroy = ClearObjectUserdata

-- Elsa swap to Act 3 from camp when trigger volume crossed
local elsaSwap = false

function gd.quests.homesteadNPCElsa.triggerElsaSwapGlobalMP()

	GiveTokenToLocalPlayer("ELSA_ACT3")
	
end

function gd.quests.homesteadNPCElsa.elsaSwap()

	if Server then
		if not elsaSwap then
			elsaSwap = true
			local player = Game.GetLocalPlayer()
	
			if (player:HasToken("ELSA_ACT3") == false) then
				GiveTokenToLocalPlayer("ELSA_ACT3")
				UpdateObjectSwap(elsaCampId, elsaCampStateObjects)
				UpdateObjectSwap(elsaAreaCId, elsaAreaCStateObjects)
				
			end
		
		end
	
	end

end

function gd.quests.homesteadNPCElsa.triggerElsaSwap(triggererId)

	QuestEvent("triggerElsaSwap")
	QuestGlobalEvent("triggerElsaSwapToken")
	
end

--
-- Give out the token for finding Elsa
--
local elsaFoundToken = false

function gd.quests.homesteadNPCElsa.elsaFoundTokenGlobalMP()
	
	local player = Game.GetLocalPlayer()
			
	if (elsaFoundToken == false && player:HasToken("ELSA_FOUND") == false) then
		elsaFoundToken = true

		local questId = 0x0DB402C0
		local taskId= 0xA5229F00

		local questTaskState = player:GetQuestTaskState(questId, taskId)
	
		if (questTaskState == QuestState.Complete) then
			player:GiveToken("ELSA_FOUND")

		end
	
	end
	
end
