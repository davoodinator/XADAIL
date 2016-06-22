/*
	
	GRIM DAWN
	
	For more information, visit us at http://www.grimdawn.com
	
*/

gd.quests.devilsCrossingNPCMerchant = {}

--
-- Luther Graves (Inventor) movement
--
-- Luther Graves starts off in the wilderness and can be rescued by the player, at 
-- which point he moves into one of the buildings in devil's crossing. After
-- a second conversation with the player he sets up as a merchant.
--

local rescuedMerchantId = 0
local captiveMerchantId = 0
local merchantAreaId = 0

local MerchantState = { Captured = 0, Rescued = 1, Service = 2 }

-- Luther Graves in devil's crossing
local rescuedMerchantStateObjects = orderedTable();
	rescuedMerchantStateObjects["MERCHANT_SERVICE"] = { state = MerchantState.Service,  dbr = "records/creatures/npcs/merchants/merchanta02.dbr" };
	rescuedMerchantStateObjects["MERCHANT_RESCUED"] = { state = MerchantState.Rescued,  dbr = "records/creatures/npcs/questnpcs/npc_rescuedmerchant.dbr" };
	rescuedMerchantStateObjects[""] 				= { state = MerchantState.Captured, dbr = nil };
	
function gd.quests.devilsCrossingNPCMerchant.rescuedMerchantOnAddToWorld(objectId)

	if Server then
		gd.quests.devilsCrossingNPCMerchant.merchantQuestFix()
	
		rescuedMerchantId = objectId
		
		local userdata = {}
		TokenStateBasedObjectSwap(objectId, userdata, rescuedMerchantStateObjects)
		Shared.setUserdata(objectId, userdata)
		
	end
	
end

gd.quests.devilsCrossingNPCMerchant.rescuedMerchantOnDestroy = ClearObjectUserdata

-- Luther Graves in the wilderness
local captiveMerchantStateObjects = orderedTable();
	captiveMerchantStateObjects["MERCHANT_SERVICE"] = { state = MerchantState.Service,  dbr = nil };
	captiveMerchantStateObjects["MERCHANT_RESCUED"] = { state = MerchantState.Rescued,  dbr = nil };
	captiveMerchantStateObjects[""] 				= { state = MerchantState.Captured, dbr = "records/creatures/npcs/questnpcs/npc_caravanmerchant.dbr" };

function gd.quests.devilsCrossingNPCMerchant.captiveMerchantOnAddToWorld(objectId)

	if Server then
	
		captiveMerchantId = objectId

		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, captiveMerchantStateObjects);
		Shared.setUserdata(objectId, userdata);
		
	end
	
end

gd.quests.devilsCrossingNPCMerchant.captiveMerchantOnDestroy = ClearObjectUserdata

-- Merchant area in devil's crossing
local merchantAreaStateObjects = orderedTable();
	merchantAreaStateObjects["MERCHANT_SERVICE"]	= { state = MerchantState.Service,  dbr = "records/storyelements/questassets/dc_merchantarea.dbr"};
	merchantAreaStateObjects["MERCHANT_RESCUED"] 	= { state = MerchantState.Rescued,  dbr = "records/storyelements/questassets/dc_merchantarea.dbr"};
	merchantAreaStateObjects[""] 					= { state = MerchantState.Captured, dbr = "records/storyelements/questassets/dc_merchantarea_wrecked.dbr" };

function gd.quests.devilsCrossingNPCMerchant.merchantAreaOnAddToWorld(objectId)

	if Server then
	
		merchantAreaId = objectId

		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, merchantAreaStateObjects);
		Shared.setUserdata(objectId, userdata);
		
	end
	
end

function gd.quests.devilsCrossingNPCMerchant.merchantAreaOnRemoveFromWorld(objectId)

	if Server then
	
		merchantAreaId = 0
		
	end
	
end

gd.quests.devilsCrossingNPCMerchant.merchantAreaOnDestroy = ClearObjectUserdata

-- Called by conversation, teleports the merchant from the wilderness to devil's crossing and sets up the merchant area
local merchantPortal = false
local merchantPortalMP = false

function gd.quests.devilsCrossingNPCMerchant.captiveMerchantPortalGlobalMP()
	
	if not merchantPortalMP then
		merchantPortalMP = true

		local player = Game.GetLocalPlayer()
		if (player:HasToken("MERCHANT_RESCUED") == false) then
			local kQuest_Merchant = 0xCA968200
			local kTask_Rescue = 0xB2392A00

			local questTaskState = player:GetQuestTaskState(kQuest_Merchant, kTask_Rescue)
					
			if (questTaskState != QuestState.InProgress && questTaskState != QuestState.Complete) then
				player:GrantQuest(kQuest_Merchant, kTask_Rescue)
			end
					
		end
	
	end
	
end

function gd.quests.devilsCrossingNPCMerchant.captiveMerchantPortal()

	if Server then
		local player = Game.GetLocalPlayer()
		
		QuestGlobalEvent("merchantRescuedToken")
		
		if player:HasToken("MERCHANT_RESCUED") && not merchantPortal then
			merchantPortal = true
			local captiveMerchant = Entity.Get(captiveMerchantId)
			local rescuedMerchant = Entity.Get(rescuedMerchantId)
		
			if (captiveMerchant != nil) then
		
				local coords = captiveMerchant:GetCoords();
				local riftStart = Entity.Create("records/fx/ui/riftgatepersonalopen_fxpak.dbr");
			
				if riftStart != nil then
					riftStart:NetworkEnable()
					riftStart:SetCoords(coords);
				end
			
				UpdateObjectSwap(captiveMerchantId, captiveMerchantStateObjects)
			
			end
		
			if (rescuedMerchant != nil) then
		
				local coords = rescuedMerchant:GetCoords()
			
				local riftEnd = Entity.Create("records/fx/ui/riftgatepersonalopen_fxpak.dbr")
			
				if (riftEnd != nil) then
					riftEnd:NetworkEnable()
					riftEnd:SetCoords(coords)
				end
			
				UpdateObjectSwap(rescuedMerchantId, rescuedMerchantStateObjects)
			
			end
			
			if (merchantAreaId != 0) then
				UpdateObjectSwap(merchantAreaId, merchantAreaStateObjects)
			end
		
		end
	
	end
	
end

-- Called by conversation, swaps Luther Graves from conversation npc to merchant
local merchantOpenShop = false

function gd.quests.devilsCrossingNPCMerchant.rescuedMerchantOpenShop()

	if Server then
		local player = Game.GetLocalPlayer()
		
		if player:HasToken("MERCHANT_SERVICE") && not merchantOpenShop then
			merchantOpenShop = true
			UpdateObjectSwap(rescuedMerchantId, rescuedMerchantStateObjects)
		
		end
		
	end
	
end

-- Updates the quest if player has already rescued the merchant and the quest was reset.
local merchantQuestFix = false

function gd.quests.devilsCrossingNPCMerchant.merchantQuestFix()

	if Server then
		if not merchantQuestFix then
			merchantQuestFix = true
			
			local player = Game.GetLocalPlayer()
			local questId01 = 0xCA968200
			local taskId01 = 0x5F267080
			local taskId02 = 0xAFA1A800
			local taskId03 = 0xB2392A00

			local questTaskState01 = player:GetQuestTaskState(questId01, taskId01)
			local questTaskState02 = player:GetQuestTaskState(questId01, taskId02)
			local questTaskState03 = player:GetQuestTaskState(questId01, taskId03)
			
			if (player:HasToken("MERCHANT_RESCUED") && (questTaskState01 == QuestState.InProgress || questTaskState02 == QuestState.InProgress)) then
				player:GiveToken("WIGHTMIRE_CARAVAN_DRIVER_FOUND")
				player:CompleteQuest(0xCA968200, 0xAFA1A800)				
				
			elseif player:HasToken("MERCHANT_RESCUED") && (questTaskState03 != QuestState.InProgress) then
				player:GrantQuest(0xCA968200, 0xB2392A00)
			
			end
			
		end
		
	end
	
end



-- Give Extortion token if player chooses to do so
function gd.quests.devilsCrossingNPCMerchant.merchantExtortedGlobalMP()

	local player = Game.GetLocalPlayer()
	
	local questId = 0xCA968200
	local taskId1 = 0xAFA1A800
	local taskId2 = 0xB2392A00
	
	local questTaskState01 = player:GetQuestTaskState(questId, taskId1)
	local questTaskState02 = player:GetQuestTaskState(questId, taskId2)
	
	if (questTaskState01 == QuestState.InProgress || questTaskState02 == QuestState.InProgress) then
		GiveTokenToLocalPlayer("MERCHANT_EXTORT")
	end

end
