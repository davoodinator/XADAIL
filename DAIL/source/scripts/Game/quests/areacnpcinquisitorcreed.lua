/*
	
	GRIM DAWN
	
	For more information, visit us at http://www.grimdawn.com
	
*/

gd.quests.areaCNPCInquisitorCreed = {}




-- b28 hotfix for players stuck on barricade
function gd.quests.areaCNPCInquisitorCreed.B28HotfixGlobalMP()

	local player = Game.GetLocalPlayer()
	local kQuest = 0x29977DC0
	local kTask = 0x948CE200
	local kTask02 = 0x74489E80
	local kTask03 = 0xAD50E800
	local questTaskState = player:GetQuestTaskState(kQuest, kTask)
	local questTaskState2 = player:GetQuestTaskState(kQuest, kTask02)
	local questTaskState3 = player:GetQuestTaskState(kQuest, kTask03)

	if (questTaskState2 == QuestState.InProgress && player:HasToken("FORTIKON_BLOCKADECLEARED") == false) then
		GiveTokenToLocalPlayer("AREAD_FORTDUNGEON_OPEN")
	
	elseif (questTaskState2 == QuestState.Complete || questTaskState3 == QuestState.Complete) && (player:HasToken("FORTIKON_BLOCKADECLEARED") == false || (player:HasToken("AREAD_FORTDUNGEON_OPEN") == false )) then
		GiveTokenToLocalPlayer("AREAD_FORTDUNGEON_OPEN")
		GiveTokenToLocalPlayer("FORTIKON_BLOCKADECLEARED")
	
	end
		
	--B26 hotfix 2, fix for characters that played with an outdated Localization
	if (player:HasToken("CREED_AREAD") && player:HasToken("AREAD_FORTDUNGEON_OPEN") == false) then
		player:GrantQuest(0x55B89100, 0xC8296600)
	
	end
	
	--B29 Hotfix 1, fix for players stuck on Blood Wagons
	local kQuestBane = 0x8BCA0200
	local kTaskBane = 0x74211E80
	local kTaskBane02 = 0x1C575F80
	local kTaskBane03 = 0xAC3CCE00

	local questBaneTaskState = player:GetQuestTaskState(kQuestBane, kTaskBane)
	local questBaneTaskState2 = player:GetQuestTaskState(kQuestBane, kTaskBane02)
	local questBaneTaskState3 = player:GetQuestTaskState(kQuestBane, kTaskBane03)
	
	if (questBaneTaskState == QuestState.InProgress || questBaneTaskState2 == QuestState.InProgress && player:HasToken("AREAD_FINALCRYPT") == false) then
		GiveTokenToLocalPlayer("AREAD_FINALCRYPT")
	
	end
	
	--B30 Hotfix 1, fix for players stuck on Bane of Cairn
	if (player:HasToken("AREAD_FINALCRYPT")) then
		if (questBaneTaskState != QuestState.InProgress && questBaneTaskState != QuestState.Complete && questBaneTaskState2 != QuestState.InProgress && questBaneTaskState2 != QuestState.Complete  && questBaneTaskState3 != QuestState.InProgress && questBaneTaskState3 != QuestState.Complete) then
			player:GrantQuest(0x8BCA0200, 0x74211E80)
	
		elseif (player:HasToken("FINALBOSS_SLAIN") && (player:HasToken("ULGRIM_BOSS") || player:HasToken("ULGRIM_FINISHED"))) then
			player:GrantQuest(0x8BCA0200, 0xAC3CCE00)

		elseif (player:HasToken("NECROPOLIS_WAGONS_ALLDESTROYED") && (player:HasToken("ULGRIM_BOSS") || player:HasToken("ULGRIM_FINISHED"))) then
			player:GrantQuest(0x8BCA0200, 0x1C575F80)
		
		end
	
	end
	
	--B31 Hotfix 2, fix for players stuck on We Need Food after completing Making a Deal
	local kQuestNeedFood = 0xB561CE00
	local kTaskNeedFood = 0x30250AC0
	local kQuestMakingDeal = 0x7072E600
	local kTaskMakingDeal = 0x876A2A00
	
	local questNeedFoodState = player:GetQuestTaskState(kQuestNeedFood, kTaskNeedFood)
	local questMakingDealState = player:GetQuestTaskState(kQuestMakingDeal, kTaskMakingDeal)
	
	if (questNeedFoodState == QuestState.InProgress && (kQuestMakingDeal == QuestState.Complete || kQuestMakingDeal == QuestState.InProgress)) then
		player:CompleteQuest(0xB561CE00, 0x30250AC0)

	end

end


--
-- Inquisitor Creed transition from Act 3 to Act 4
--

local creedHomesteadId = 0
local creedNecropolisId = 0

local CreedState = { Homestead = 0, Necropolis = 1 }

-- Inquisitor Creed in Act 4
local necropolisCreedStateObjects = orderedTable();
	necropolisCreedStateObjects["CREED_AREAD"] = { state = CreedState.Necropolis,  dbr = "records/creatures/npcs/questnpcs/gdaread/npc_inquisitorcreed_02.dbr" }
	necropolisCreedStateObjects[""]			= { state = CreedState.Homestead, dbr = nil }
	
function gd.quests.areaCNPCInquisitorCreed.necropolisCreedOnAddToWorld(objectId)

	if Server then
		QuestGlobalEvent("blackLegionBountyReset")
		QuestGlobalEvent("b28Hotfix")
		
		creedNecropolisId = objectId;
		
		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, necropolisCreedStateObjects);
		Shared.setUserdata(objectId, userdata);
		
	end
	
end

gd.quests.areaCNPCInquisitorCreed.necropolisCreedOnDestroy = ClearObjectUserdata

-- Inquisitor Creed in Homestead
local homesteadCreedStateObjects = orderedTable();
	homesteadCreedStateObjects["CREED_AREAD"] = { state = CreedState.Necropolis,  dbr = nil }
	homesteadCreedStateObjects[""] 			= { state = CreedState.Homestead, dbr = "records/creatures/npcs/questnpcs/gdareac/npc_inquisitorcreed_01.dbr" }
	
function gd.quests.areaCNPCInquisitorCreed.homesteadCreedOnAddToWorld(objectId)

	if Server then
	
		creedHomesteadId = objectId;
		
		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, homesteadCreedStateObjects);
		Shared.setUserdata(objectId, userdata);
		
	end
	
end

gd.quests.areaCNPCInquisitorCreed.homesteadCreedOnDestroy = ClearObjectUserdata




-- Called by trigger volume, teleports Creed and Ulgrim to Act 4 if Host is on that quest
function gd.quests.areaCNPCInquisitorCreed.creedTransitionTriggered(triggererId)

	QuestEvent("creedTransition")
	QuestEvent("ulgrimHomesteadTransition")
	QuestEvent("ulgrimAreaDTransition")
	
end

local creedTransition = false

function gd.quests.areaCNPCInquisitorCreed.areaDTransition()

	if Server then
		local player = Game.GetLocalPlayer()
		
		if player:HasToken("AREAD_BASE") == false && player:HasToken("CREED_AREAD") && creedTransition == false then
			creedTransition = true
			
			local creedNecropolis = Entity.Get(creedNecropolisId)
			local creedHomestead = Entity.Get(creedHomesteadId)
	
			if (creedHomestead != nil) then
		
				local coords = creedHomestead:GetCoords()
				local riftStart = Entity.Create("records/fx/ui/riftgatepersonalopen_fxpak.dbr")
			
				if (riftStart != nil) then
					riftStart:NetworkEnable()
					riftStart:SetCoords(coords)
				end
			
				UpdateObjectSwap(creedHomesteadId, homesteadCreedStateObjects)
			
			end
		
			if (creedNecropolis != nil) then
		
				local coords = creedNecropolis:GetCoords()	
				local riftEnd = Entity.Create("records/fx/ui/riftgatepersonalopen_fxpak.dbr")
			
				if (riftEnd != nil) then
					riftEnd:NetworkEnable()
					riftEnd:SetCoords(coords)
				end
			
				UpdateObjectSwap(creedNecropolisId, necropolisCreedStateObjects)
			
			end
		
		end
		
	end
	
end



