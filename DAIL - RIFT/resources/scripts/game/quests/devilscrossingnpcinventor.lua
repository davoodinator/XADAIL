/*
	
	GRIM DAWN
	
	For more information, visit us at http://www.grimdawn.com
	
*/

gd.quests.devilsCrossingNPCInventor = {}

--
-- Darlet (Inventor) movement
--
-- Darlet starts off in the wilderness and can be rescued by the player, at 
-- which point she moves into one of the buildings in devil's crossing. After
-- a second conversation with the player she sets up as the inventor npc.
--
 
local rescuedInventorId = 0
local captiveInventorId = 0
 
local InventorState = { Captured = 0, Rescued = 1, Service = 2 }

-- Darlet in the building in devil's crossing
local rescuedInventorStateObjects = orderedTable();
	rescuedInventorStateObjects["INVENTOR_SERVICE"] = { state = InventorState.Service,  dbr = "records/creatures/npcs/merchants/inventora01.dbr" }
	rescuedInventorStateObjects["INVENTOR_RESCUED"] = { state = InventorState.Rescued,  dbr = "records/creatures/npcs/questnpcs/npc_rescuedinventor.dbr" }
	rescuedInventorStateObjects[""] 				= { state = InventorState.Captured, dbr = nil }
	
function gd.quests.devilsCrossingNPCInventor.rescuedInventorOnAddToWorld(objectId)

	if Server then
		gd.quests.devilsCrossingNPCInventor.inventorQuestFix()
		
		rescuedInventorId = objectId
	
		local userdata = {}
		TokenStateBasedObjectSwap(objectId, userdata, rescuedInventorStateObjects)
		Shared.setUserdata(objectId, userdata)
		
	end
	
end

gd.quests.devilsCrossingNPCInventor.rescuedInventorOnDestroy = ClearObjectUserdata

-- Darlet in the wilderness
local captiveInventorStateObjects = orderedTable()
	captiveInventorStateObjects["INVENTOR_SERVICE"] = { state = InventorState.Service,  dbr = nil }
	captiveInventorStateObjects["INVENTOR_RESCUED"] = { state = InventorState.Rescued,  dbr = nil }
	captiveInventorStateObjects[""] 				= { state = InventorState.Captured, dbr = "records/creatures/npcs/questnpcs/npc_captiveinventor.dbr" }

function gd.quests.devilsCrossingNPCInventor.captiveInventorOnAddToWorld(objectId)

	if Server then
	
		captiveInventorId = objectId

		local userdata = {}
		TokenStateBasedObjectSwap(objectId, userdata, captiveInventorStateObjects)
		Shared.setUserdata(objectId, userdata)
		
	end
	
end

gd.quests.devilsCrossingNPCInventor.captiveInventorOnDestroy = ClearObjectUserdata

-- Called by conversation, teleports Darlet from the wilderness to devil's crossing
local inventorPortal = false
local InventorPortalMP = false

function gd.quests.devilsCrossingNPCInventor.captiveInventorPortalGlobalMP()
	
	if not InventorPortalMP then
		InventorPortalMP = true

		local player = Game.GetLocalPlayer()
			
		if (player:HasToken("INVENTOR_RESCUED") == false) then
			local kQuest_Inventor = 0xA6E46100
			local kTask_Rescue = 0x61337E00

			local questTaskState = player:GetQuestTaskState(kQuest_Inventor, kTask_Rescue)
				
			if (questTaskState != QuestState.InProgress && questTaskState != QuestState.Complete) then
				player:GrantQuest(kQuest_Inventor, kTask_Rescue)
			end
				
		end
	
	end

end

function gd.quests.devilsCrossingNPCInventor.captiveInventorPortal()

	if Server then
		local player = Game.GetLocalPlayer()
		
		QuestGlobalEvent("apprenticeRescuedToken")
		
		if player:HasToken("INVENTOR_RESCUED") && not inventorPortal then
			inventorPortal = true
			local captiveInventor = Entity.Get(captiveInventorId)
			local rescuedInventor = Entity.Get(rescuedInventorId)

			if (captiveInventor != nil) then
		
				local coords = captiveInventor:GetCoords()
				local rift = Entity.Create("records/fx/ui/riftgatepersonalopen_fxpak.dbr")
			
				if (rift != nil) then
					rift:NetworkEnable()
					rift:SetCoords(coords)
				end
		
				UpdateObjectSwap(captiveInventorId, captiveInventorStateObjects)
			
			end
		
			if (rescuedInventor != nil) then
		
				local coords = rescuedInventor:GetCoords()
				local riftEnd = Entity.Create("records/fx/ui/riftgatepersonalopen_fxpak.dbr")
			
				if (riftEnd != nil) then
					riftEnd:NetworkEnable()
					riftEnd:SetCoords(coords)
				end
		
				UpdateObjectSwap(rescuedInventorId, rescuedInventorStateObjects)
		
			end
		
		end
	
	end
	
end

-- Called by conversation, swaps Darlet from conversation npc to inventor
local inventorOpenShop = false

function gd.quests.devilsCrossingNPCInventor.rescuedInventorOpenShop()

	if Server then
		local player = Game.GetLocalPlayer()
		
		if player:HasToken("INVENTOR_SERVICE") && not inventorOpenShop then
			inventorOpenShop = true
			UpdateObjectSwap(rescuedInventorId, rescuedInventorStateObjects)
			
		end
		
	end
	
end

-- Updates the quest if player has already rescued the inventor and the quest was reset.
local inventorQuestFix = false

function gd.quests.devilsCrossingNPCInventor.inventorQuestFix()

	if Server then
		if not inventorQuestFix then
			inventorQuestFix = true
			
			local player = Game.GetLocalPlayer()
			local questId01 = 0xA6E46100
			local taskId01 = 0xF1B40300
			local taskId02 = 0xE51E6900
			local taskId03 = 0x61337E00

			local questTaskState01 = player:GetQuestTaskState(questId01, taskId01)
			local questTaskState02 = player:GetQuestTaskState(questId01, taskId02)
			local questTaskState03 = player:GetQuestTaskState(questId01, taskId03)
			

			if (player:HasToken("INVENTOR_SERVICE") == false && player:HasToken("INVENTOR_RESCUED") && (questTaskState01 == QuestState.InProgress || questTaskState02 == QuestState.InProgress)) then
				player:GiveToken("KASPAROV_APPRENTICE_FOUND")
				player:CompleteQuest(0xA6E46100, 0xE51E6900)				
				
			elseif player:HasToken("INVENTOR_SERVICE") == false && player:HasToken("INVENTOR_RESCUED") && (questTaskState03 != QuestState.InProgress) then
				player:GrantQuest(0xA6E46100, 0x61337E00)
			
			elseif player:HasToken("INVENTOR_SERVICE") && (questTaskState03 == QuestState.InProgress) then
				player:CompleteQuest(0xA6E46100, 0x61337E00)		
			
			end
			
		end
		
	end
	
end
