/*
	
	GRIM DAWN
	
	For more information, visit us at http://www.grimdawn.com
	
*/

gd.quests.areaCFactionSelection = {}



local emissaryChosenId = 0
local kymonEmissaryHomesteadId = 0
local orderEmissaryBaseId = 0
local orderEmissaryHomesteadId = 0
local kymonEmissarySpawned = false
local orderEmissarySpawned = false

local EmissaryState = { Default = 0, Homestead = 1, Zealots = 2, Necros = 3 }

-- Selected Emissary spawns in their building
local emissaryChosenStateObject = orderedTable()
	emissaryChosenStateObject["AREAC_NECROS_CHOSEN"	] = { state = EmissaryState.Necros,  dbr = "records/creatures/npcs/questnpcs/gdareac/npc_orderemissary_02.dbr"}
	emissaryChosenStateObject["AREAC_ZEALOTS_CHOSEN"	] = { state = EmissaryState.Zealots,  dbr = "records/creatures/npcs/questnpcs/gdareac/npc_kymonemissary_02.dbr"}
	emissaryChosenStateObject["AREAC_EMISSARY_SPAWN"	] = { state = EmissaryState.Homestead,  dbr = nil }
	emissaryChosenStateObject[""					 	] = { state = EmissaryState.Default, dbr = nil }

function gd.quests.areaCFactionSelection.emissaryChosenOnAddToWorld(objectId)

	if Server then
	
		emissaryChosenId = objectId

		local userdata = {}
		TokenStateBasedObjectSwap(objectId, userdata, emissaryChosenStateObject)
		Shared.setUserdata(objectId, userdata)
		
	end
	
end

gd.quests.areaCFactionSelection.emissaryChosenOnDestroy = ClearObjectUserdata

-- Kymon Emissary
local kymonEmissaryHomesteadStateObject = orderedTable()
	kymonEmissaryHomesteadStateObject["AREAC_NECROS_CHOSEN"	] = { state = EmissaryState.Necros,  dbr = nil }
	kymonEmissaryHomesteadStateObject["AREAC_ZEALOTS_CHOSEN"	] = { state = EmissaryState.Zealots,  dbr = nil }
	kymonEmissaryHomesteadStateObject["AREAC_EMISSARY_SPAWN"	] = { state = EmissaryState.Homestead,  dbr = "records/creatures/npcs/questnpcs/gdareac/npc_kymonemissary_01.dbr"}
	kymonEmissaryHomesteadStateObject[""					 	] = { state = EmissaryState.Default, dbr = nil }

function gd.quests.areaCFactionSelection.kymonEmissaryHomesteadOnAddToWorld(objectId)

	if Server then
	
		kymonEmissaryHomesteadId = objectId

		local userdata = {}
		TokenStateBasedObjectSwap(objectId, userdata, kymonEmissaryHomesteadStateObject)
		Shared.setUserdata(objectId, userdata)
		
	end
	
end

gd.quests.areaCFactionSelection.kymonEmissaryHomesteadOnDestroy = ClearObjectUserdata


-- Order Emissary
local orderEmissaryHomesteadStateObject = orderedTable()
	orderEmissaryHomesteadStateObject["AREAC_NECROS_CHOSEN"	] = { state = EmissaryState.Necros,  dbr = nil }
	orderEmissaryHomesteadStateObject["AREAC_ZEALOTS_CHOSEN"	] = { state = EmissaryState.Zealots,  dbr = nil }
	orderEmissaryHomesteadStateObject["AREAC_EMISSARY_SPAWN"	] = { state = EmissaryState.Homestead,  dbr = "records/creatures/npcs/questnpcs/gdareac/npc_orderemissary_01.dbr"}
	orderEmissaryHomesteadStateObject[""					 	] = { state = EmissaryState.Default, dbr = nil }

function gd.quests.areaCFactionSelection.orderEmissaryHomesteadOnAddToWorld(objectId)

	if Server then
	
		orderEmissaryHomesteadId = objectId

		local userdata = {}
		TokenStateBasedObjectSwap(objectId, userdata, orderEmissaryHomesteadStateObject)
		Shared.setUserdata(objectId, userdata)
		
	end
	
end

gd.quests.areaCFactionSelection.orderEmissaryHomesteadOnDestroy = ClearObjectUserdata



-- Spawn in emissaries when aetherial abomination is killed
local emissarySpawn = false

function gd.quests.areaCFactionSelection.spawnFactionSelectionGlobalMP()
	local player = Game.GetLocalPlayer()

	if (player:HasToken("AREAC_EMISSARY_SPAWN") == false) then
		GiveTokenToLocalPlayer("AREAC_EMISSARY_SPAWN")
	
	end

end

function gd.quests.areaCFactionSelection.spawnFactionSelection()

	if Server then
		local player = Game.GetLocalPlayer()
		
		if ((player:HasToken("AREAC_EMISSARY_SPAWN") == false) && not emissarySpawn) then
			emissarySpawn = true
			GiveTokenToLocalPlayer("AREAC_EMISSARY_SPAWN")
			
			local emissary01 = Entity.Get(kymonEmissaryHomesteadId)
			local emissary02 = Entity.Get(orderEmissaryHomesteadId)
			
			if (emissary01 != nil) then
				UpdateObjectSwap(kymonEmissaryHomesteadId, kymonEmissaryHomesteadStateObject)
					
			end
			
			if (emissary02 != nil) then
				UpdateObjectSwap(orderEmissaryHomesteadId, orderEmissaryHomesteadStateObject)
					
			end
		
		end
		
		QuestGlobalEvent("alliesFromTheAshesSpawnToken")
	
	end

end

--Despawn Emissaries from Phase 1 if they are still around
local despawnEmissaries = false

function gd.quests.areaCFactionSelection.despawnEmissaries()

	if Server then
		local player = Game.GetLocalPlayer()
		
		if not despawnEmissaries then
			despawnEmissaries = true
		
			UpdateObjectSwap(kymonEmissaryHomesteadId, kymonEmissaryHomesteadStateObject)
			UpdateObjectSwap(orderEmissaryHomesteadId, orderEmissaryHomesteadStateObject)

		end
		
	end
	
end


-- Give out Faction Selection Tokens
function gd.quests.areaCFactionSelection.choseKymonGlobalMP()

	local player = Game.GetLocalPlayer()
	
	if player:HasToken("AREAC_NECROS_CHOSEN") == false && player:HasToken("AREAC_ZEALOTS_CHOSEN") == false then
		player:GiveToken("AREAC_ZEALOTS_CHOSEN")	
	
	end

end

function gd.quests.areaCFactionSelection.choseOrderGlobalMP()

	local player = Game.GetLocalPlayer()
	
	if player:HasToken("AREAC_NECROS_CHOSEN") == false && player:HasToken("AREAC_ZEALOTS_CHOSEN") == false then
		player:GiveToken("AREAC_NECROS_CHOSEN")	
	
	end

end



--
-- Faction Champion
-- Spawns faction's champion in Necropolis
--
local championNecropolisId = 0

local factionChampionStateObjects = orderedTable()
	factionChampionStateObjects["NECRO_MALKADARR_AREAD"	] = { state = EmissaryState.Necros, dbr = "records/creatures/npcs/questnpcs/gdaread/npc_necro_malkadarr_02.dbr" }
	factionChampionStateObjects["ZEALOT_CHAMPION_AREAD"	] = { state = EmissaryState.Zealots, dbr = "records/creatures/npcs/questnpcs/gdaread/npc_zealot_champion_02.dbr" }
	factionChampionStateObjects[""					 	] = { state = EmissaryState.Default, dbr = nil }

function gd.quests.areaCFactionSelection.championOnAddToWorld(objectId)

	if Server then
		local player = Game.GetLocalPlayer()
		
		if (player:HasToken("NECROPOLIS_BASE")) then
			if (player:HasToken("ZEALOT_CHAMPION_AREAD") == false && player:HasToken("NECRO_MALKADARR_AREAD") == false && player:GetFaction("USER8") >= 5000 && player:HasToken("ZEALOT_BATTLE_FINISHED")) then
				GiveTokenToLocalPlayer("ZEALOT_CHAMPION_AREAD")
				gd.quests.areaCQuestZealots.swapChampion()
				
			elseif (player:HasToken("ZEALOT_CHAMPION_AREAD") == false && player:HasToken("NECRO_MALKADARR_AREAD") == false && player:GetFaction("USER5") >= 5000 && player:HasToken("NECRO_RITUAL_FINISHED")) then
				GiveTokenToLocalPlayer("NECRO_MALKADARR_AREAD")
				gd.quests.areaCQuestNecros.swapMalkadarr()
			
			end
		
		end
		
		championNecropolisId = objectId
		local userdata = {}
		
		TokenStateBasedObjectSwap(objectId, userdata, factionChampionStateObjects)
		
		Shared.setUserdata(objectId, userdata)
		
		end

end

gd.quests.areaCFactionSelection.championOnDestroy = ClearObjectUserdata


--
--Faction Decorations
--Swaps in various Faction banners and areas based on selection and reputation
--


--Faction Merchant, spawns an extra copy in Homestead at 5000 rep
local factionMerchantStateObjects = orderedTable()
	factionMerchantStateObjects["AREAC_HOMESTEADNECROVENDOR"	] = { state = EmissaryState.Necros, dbr = "records/creatures/npcs/merchants/merchantfaction_orderdeathsvigil_02.dbr" }
	factionMerchantStateObjects["AREAC_HOMESTEADZEALOTVENDOR"	] = { state = EmissaryState.Zealots, dbr = "records/creatures/npcs/merchants/merchantfaction_kymonchosen_01.dbr" }
	factionMerchantStateObjects[""					 	] = { state = EmissaryState.Default, dbr = nil }

function gd.quests.areaCFactionSelection.merchantOnAddToWorld(objectId)

	if Server then
		local player = Game.GetLocalPlayer()
		if (player:HasToken("AREAC_HOMESTEADZEALOTVENDOR") == false && player:HasToken("AREAC_HOMESTEADNECROVENDOR") == false && player:GetFaction("USER8") >= 5000 && player:HasToken("AREAC_ZEALOTS_CHOSEN")) then
			GiveTokenToLocalPlayer("AREAC_HOMESTEADZEALOTVENDOR")
			
		elseif (player:HasToken("AREAC_HOMESTEADZEALOTVENDOR") == false && player:HasToken("AREAC_HOMESTEADNECROVENDOR") == false && player:GetFaction("USER5") >= 5000 && player:HasToken("AREAC_NECROS_CHOSEN")) then
			GiveTokenToLocalPlayer("AREAC_HOMESTEADNECROVENDOR")
		
		end
		
		local userdata = {}
		TokenStateBasedObjectSwap(objectId, userdata, factionMerchantStateObjects)
		
		Shared.setUserdata(objectId, userdata)

	end
	
end

gd.quests.areaCFactionSelection.merchantOnDestroy = ClearObjectUserdata


local merchantAreaStateObjects = orderedTable()
	merchantAreaStateObjects["AREAC_HOMESTEADNECROVENDOR"	] = { state = EmissaryState.Necros, dbr = "records/storyelements/questassets/hs_factionmerchantarea01_necromancer.dbr" }
	merchantAreaStateObjects["AREAC_HOMESTEADZEALOTVENDOR"	] = { state = EmissaryState.Zealots, dbr = "records/storyelements/questassets/hs_factionmerchantarea01_kymon.dbr" }
	merchantAreaStateObjects[""] 				= { state = EmissaryState.Default, dbr = "records/storyelements/questassets/hs_factionmerchantarea01_before.dbr" }

function gd.quests.areaCFactionSelection.merchantAreaOnAddToWorld(objectId)

	if Server then
		local player = Game.GetLocalPlayer()
		if (player:HasToken("AREAC_HOMESTEADZEALOTVENDOR") == false && player:HasToken("AREAC_HOMESTEADNECROVENDOR") == false && player:GetFaction("USER8") >= 5000 && player:HasToken("AREAC_ZEALOTS_CHOSEN")) then
			GiveTokenToLocalPlayer("AREAC_HOMESTEADZEALOTVENDOR")
			
		elseif (player:HasToken("AREAC_HOMESTEADZEALOTVENDOR") == false && player:HasToken("AREAC_HOMESTEADNECROVENDOR") == false && player:GetFaction("USER5") >= 5000 && player:HasToken("AREAC_NECROS_CHOSEN")) then
			GiveTokenToLocalPlayer("AREAC_HOMESTEADNECROVENDOR")
		
		end

		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, merchantAreaStateObjects)
		Shared.setUserdata(objectId, userdata)
		
	end
	
end

gd.quests.areaCFactionSelection.merchantAreaOnDestroy = ClearObjectUserdata


-- Basic Faction setup after selection
local factionAreaBaseId = 0
local factionAreaTopId = 0
local factionAreaTableId = 0
local factionAreaBannersId = 0

local factionAreaBaseStateObjects = orderedTable()
	factionAreaBaseStateObjects["AREAC_NECROS_CHOSEN"	] = { state = EmissaryState.Necros,  dbr = "records/storyelements/questassets/hs_factionarea01_after_base.dbr"}
	factionAreaBaseStateObjects["AREAC_ZEALOTS_CHOSEN"	] = { state = EmissaryState.Zealots,  dbr = "records/storyelements/questassets/hs_factionarea01_after_base.dbr"}
	factionAreaBaseStateObjects[""					 	] = { state = EmissaryState.Default, dbr = "records/storyelements/questassets/hs_factionarea01_before.dbr" }


function gd.quests.areaCFactionSelection.factionAreaBaseOnAddToWorld(objectId)

	if Server then
	
		factionAreaBaseId = objectId

		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, factionAreaBaseStateObjects)
		Shared.setUserdata(objectId, userdata)
		
	end
	
end

gd.quests.areaCFactionSelection.factionAreaBaseOnDestroy = ClearObjectUserdata


local factionAreaTopStateObjects = orderedTable()
	factionAreaTopStateObjects["AREAC_NECROS_CHOSEN"	] = { state = EmissaryState.Necros,  dbr = "records/storyelements/questassets/hs_factionarea01_after_top.dbr"}
	factionAreaTopStateObjects["AREAC_ZEALOTS_CHOSEN"	] = { state = EmissaryState.Zealots,  dbr = "records/storyelements/questassets/hs_factionarea01_after_top.dbr"}
	factionAreaTopStateObjects[""					 	] = { state = EmissaryState.Default, dbr = nil }


function gd.quests.areaCFactionSelection.factionAreaTopOnAddToWorld(objectId)

	if Server then
	
		factionAreaTopId = objectId

		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, factionAreaTopStateObjects)
		Shared.setUserdata(objectId, userdata)
		
	end
	
end

gd.quests.areaCFactionSelection.factionAreaTopOnDestroy = ClearObjectUserdata


local factionAreaTableStateObjects = orderedTable()
	factionAreaTableStateObjects["AREAC_NECROS_CHOSEN"	] = { state = EmissaryState.Necros,  dbr = "records/storyelements/questassets/hs_factiontableplanning01_necromancer.dbr"}
	factionAreaTableStateObjects["AREAC_ZEALOTS_CHOSEN"	] = { state = EmissaryState.Zealots,  dbr = "records/storyelements/questassets/hs_factiontableplanning01_kymon.dbr"}
	factionAreaTableStateObjects[""					 	] = { state = EmissaryState.Default, dbr = nil }


function gd.quests.areaCFactionSelection.factionAreaTableOnAddToWorld(objectId)

	if Server then
	
		factionAreaTableId = objectId

		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, factionAreaTableStateObjects)
		Shared.setUserdata(objectId, userdata)
		
	end
	
end

gd.quests.areaCFactionSelection.factionAreaTableOnDestroy = ClearObjectUserdata


local factionAreaBannersStateObjects = orderedTable()
	factionAreaBannersStateObjects["AREAC_NECROS_CHOSEN"	] = { state = EmissaryState.Necros,  dbr = "records/storyelements/questassets/hs_factionareabanners01_necromancer.dbr"}
	factionAreaBannersStateObjects["AREAC_ZEALOTS_CHOSEN"	] = { state = EmissaryState.Zealots,  dbr = "records/storyelements/questassets/hs_factionareabanners01_kymon.dbr"}
	factionAreaBannersStateObjects[""					 	] = { state = EmissaryState.Default, dbr = nil }


function gd.quests.areaCFactionSelection.factionAreaBannersOnAddToWorld(objectId)

	if Server then
	
		factionAreaBannersId = objectId

		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, factionAreaBannersStateObjects)
		Shared.setUserdata(objectId, userdata)
		
	end
	
end

gd.quests.areaCFactionSelection.factionAreaBannersOnDestroy = ClearObjectUserdata

-- update Homestead with basic faction selection
local factionSwap = false
function gd.quests.areaCFactionSelection.homesteadFactionSwap()
	
	if Server then
		local player = Game.GetLocalPlayer()
		
		QuestEvent("homesteadOpenCultDoors")
		
		if ((player:HasToken("AREAC_ZEALOTS_CHOSEN") || player:HasToken("AREAC_NECROS_CHOSEN")) && factionSwap == false) then
			factionSwap = true
			local factionArea = Entity.Get(factionAreaBaseId)
			
			UpdateObjectSwap(factionAreaBaseId, factionAreaBaseStateObjects)
			UpdateObjectSwap(factionAreaTopId, factionAreaTopStateObjects)
			UpdateObjectSwap(factionAreaTableId, factionAreaTableStateObjects)
			UpdateObjectSwap(factionAreaBannersId, factionAreaBannersStateObjects)
			
			if (factionArea != nil) then
				local coords = factionArea:GetCoords()
				local pfx = Entity.Create("records/fx/general/genericrepair_fxpak01.dbr")
			
				if (pfx != nil) then
					pfx:NetworkEnable()
					pfx:SetCoords(coords)
					
				end
			
			end

		end
	
	end

end

-- Reset the player's faction status if they choose to on a higher difficulty
local factionReset = false
local factionResetTokens = false

function gd.quests.areaCFactionSelection.factionReset()

	if not factionReset then
		local player = Game.GetLocalPlayer()
		
		if ((player:HasToken("AREAC_ZEALOTS_CHOSEN") && player:GetFaction("USER5") > 0) || (player:HasToken("AREAC_NECROS_CHOSEN") && player:GetFaction("USER8") > 0)) then
			factionReset = true
			player:SetFaction("USER5", 0)
			player:SetFaction("USER8", 0)			
			
		end

	end

end


-- replace player tokens if they reset their faction and load on a previous difficulty
function gd.quests.areaCFactionSelection.factionResetTokens()

	if not factionResetTokens then
		local player = Game.GetLocalPlayer()
		
		if (player:HasToken("AREAC_ZEALOTS_CHOSEN") && player:GetFaction("USER5") > 0 && player:GetFaction("USER8") < 0) then
			factionResetTokens = true
			
			local zealotQuest = 0x7FF3C600
			local zealotTask = 0x5D552400
			local questTaskState = player:GetQuestTaskState(zealotQuest, zealotTask)
			
			if (questTaskState == QuestState.Complete) then
				player:RemoveToken("AREAC_ZEALOTS_CHOSEN")
				player:GiveToken("AREAC_NECROS_CHOSEN")
				
				if (player:HasToken("FACTION_BATTLEZEALOT")) then
					player:RemoveToken("FACTION_BATTLEZEALOT")
					player:GiveToken("FACTION_BATTLENECRO")
					
				end
				
				if (player:HasToken("ZEALOT_CHAMPION_AREAD")) then
					player:RemoveToken("ZEALOT_CHAMPION_AREAD")
					player:GiveToken("NECRO_MALKADARR_AREAD")
					
				end
				
				if (player:HasToken("AREAC_HOMESTEADZEALOTVENDOR")) then
					player:RemoveToken("AREAC_HOMESTEADZEALOTVENDOR")
					player:GiveToken("AREAC_HOMESTEADNECROVENDOR")
					
				end
			
			end
			
		elseif (player:HasToken("AREAC_NECROS_CHOSEN") && player:GetFaction("USER8") > 0 && player:GetFaction("USER5") < 0) then
			factionResetTokens = true
			
			local necroQuest = 0x224E5380
			local necroTask = 0x44512B00
			local questTaskState = player:GetQuestTaskState(necroQuest, necroTask)
			
			if (questTaskState == QuestState.Complete) then
				player:RemoveToken("AREAC_NECROS_CHOSEN")
				player:GiveToken("AREAC_ZEALOTS_CHOSEN")
				
				if (player:HasToken("FACTION_BATTLENECRO")) then
					player:RemoveToken("FACTION_BATTLENECRO")
					player:GiveToken("FACTION_BATTLEZEALOT")
					
				end
				
				if (player:HasToken("NECRO_MALKADARR_AREAD")) then
					player:RemoveToken("NECRO_MALKADARR_AREAD")
					player:GiveToken("ZEALOT_CHAMPION_AREAD")
					
				end
				
				if (player:HasToken("AREAC_HOMESTEADNECROVENDOR")) then
					player:RemoveToken("AREAC_HOMESTEADNECROVENDOR")
					player:GiveToken("AREAC_HOMESTEADNECROVENDOR")
					
				end
			
			end
		
		end
		
	end

end

--
-- Decorations and Filler for Faction Camp
--
local factionCampBannersStateObject = orderedTable()
	factionCampBannersStateObject["AREAC_NECROS_CHOSEN"	] = { state = EmissaryState.Necros,  dbr = "records/level art/factions/kymon_banner02a.dbr"}
	factionCampBannersStateObject["AREAC_ZEALOTS_CHOSEN"	] = { state = EmissaryState.Zealots,  dbr = "records/level art/factions/necromancer_banner02a.dbr"}
	factionCampBannersStateObject[""					 	] = { state = EmissaryState.Default, dbr = "records/level art/monstercamp/cultistcamp_banner01a.dbr"}

function gd.quests.areaCFactionSelection.factionCampBannersOnAddToWorld(objectId)

	if Server then
	
		local userdata = {}
		TokenStateBasedObjectSwap(objectId, userdata, factionCampBannersStateObject)
		Shared.setUserdata(objectId, userdata)
		
	end
	
end

gd.quests.areaCFactionSelection.factionCampBannersOnDestroy = ClearObjectUserdata

local factionCampDecorationStateObject = orderedTable()
	factionCampDecorationStateObject["AREAC_NECROS_CHOSEN"	] = { state = EmissaryState.Necros,  dbr = "records/level art/decorationsinterior/fortress/fort_candelabra_tall5x01a_lit.dbr"}
	factionCampDecorationStateObject["AREAC_ZEALOTS_CHOSEN"	] = { state = EmissaryState.Zealots,  dbr = "records/level art/monstercamp/necromancer_column01a.dbr"}
	factionCampDecorationStateObject[""					 	] = { state = EmissaryState.Default, dbr = "records/level art/outpost/light_torchburning.dbr"}

function gd.quests.areaCFactionSelection.factionCampDecorationOnAddToWorld(objectId)

	if Server then
	
		local userdata = {}
		TokenStateBasedObjectSwap(objectId, userdata, factionCampDecorationStateObject)
		Shared.setUserdata(objectId, userdata)
		
	end
	
end

gd.quests.areaCFactionSelection.factionCampDecorationOnDestroy = ClearObjectUserdata


-- Filler Chthonian Spawns
local fillerId= 0
local filler01Spawned = false
local filler02Spawned = false
local filler03Spawned = false
local filler04Spawned = false
local filler05Spawned = false

local function FillerCreateArgs()

	return Entity.Get(fillerId):GetCoords().origin
	
end

local factionCampFiller01StateObject = orderedTable()
	factionCampFiller01StateObject["AREAC_NECROS_CHOSEN"	] = { state = EmissaryState.Necros,  dbr = nil }
	factionCampFiller01StateObject["AREAC_ZEALOTS_CHOSEN"	] = { state = EmissaryState.Zealots,  dbr = nil }
	factionCampFiller01StateObject[""					 	] = { state = EmissaryState.Default, dbr = "records/proxies/area001/chthonic_cultist_areac_t.dbr"}
	
local factionCampFiller02StateObject = orderedTable()
	factionCampFiller02StateObject["AREAC_NECROS_CHOSEN"	] = { state = EmissaryState.Necros,  dbr = nil }
	factionCampFiller02StateObject["AREAC_ZEALOTS_CHOSEN"	] = { state = EmissaryState.Zealots,  dbr = nil }
	factionCampFiller02StateObject[""					 	] = { state = EmissaryState.Default, dbr = "records/proxies/area001/chthonic_cultist_areac_n.dbr"}

function gd.quests.areaCFactionSelection.factionCampFiller01OnAddToWorld(objectId)

	if Server && not filler01Spawned then
		filler01Spawned = true
		
		fillerId = objectId
		local userdata = {}
		TokenStateBasedObjectSwap(objectId, userdata, factionCampFiller01StateObject, Proxy, FillerCreateArgs)
		Shared.setUserdata(objectId, userdata)
		
	end
	
end

gd.quests.areaCFactionSelection.factionCampFiller01OnDestroy = ClearObjectUserdata


function gd.quests.areaCFactionSelection.factionCampFiller02OnAddToWorld(objectId)

	if Server && not filler02Spawned then
		filler02Spawned = true
		
		fillerId = objectId
		local userdata = {}
		TokenStateBasedObjectSwap(objectId, userdata, factionCampFiller02StateObject, Proxy, FillerCreateArgs)
		Shared.setUserdata(objectId, userdata)
		
	end
	
end

gd.quests.areaCFactionSelection.factionCampFiller02OnDestroy = ClearObjectUserdata


function gd.quests.areaCFactionSelection.factionCampFiller03OnAddToWorld(objectId)

	if Server && not filler03Spawned then
		filler03Spawned = true
		
		fillerId = objectId
		local userdata = {}
		TokenStateBasedObjectSwap(objectId, userdata, factionCampFiller02StateObject, Proxy, FillerCreateArgs)
		Shared.setUserdata(objectId, userdata)
		
	end
	
end

gd.quests.areaCFactionSelection.factionCampFiller03OnDestroy = ClearObjectUserdata


function gd.quests.areaCFactionSelection.factionCampFiller04OnAddToWorld(objectId)

	if Server && not filler04Spawned then
		filler04Spawned = true
		
		fillerId = objectId
		local userdata = {}
		TokenStateBasedObjectSwap(objectId, userdata, factionCampFiller01StateObject, Proxy, FillerCreateArgs)
		Shared.setUserdata(objectId, userdata)
		
	end
	
end

gd.quests.areaCFactionSelection.factionCampFiller04OnDestroy = ClearObjectUserdata


function gd.quests.areaCFactionSelection.factionCampFiller05OnAddToWorld(objectId)

	if Server && not filler05Spawned then
		filler05Spawned = true
		
		fillerId = objectId
		local userdata = {}
		TokenStateBasedObjectSwap(objectId, userdata, factionCampFiller01StateObject, Proxy, FillerCreateArgs)
		Shared.setUserdata(objectId, userdata)
		
	end
	
end

gd.quests.areaCFactionSelection.factionCampFiller05OnDestroy = ClearObjectUserdata


--
-- Banners for Faction Fort
--
local factionFortBannersStateObject = orderedTable()
	factionFortBannersStateObject["AREAC_NECROS_CHOSEN"	] = { state = EmissaryState.Necros,  dbr = "records/level art/factions/kymon_banner01b_noanm.dbr"}
	factionFortBannersStateObject["AREAC_ZEALOTS_CHOSEN"	] = { state = EmissaryState.Zealots,  dbr = "records/level art/factions/necromancer_banner01a_noanm.dbr"}
	factionFortBannersStateObject[""					 	] = { state = EmissaryState.Default, dbr = nil }

function gd.quests.areaCFactionSelection.factionFortBannersOnAddToWorld(objectId)

	if Server then
	
		local userdata = {}
		TokenStateBasedObjectSwap(objectId, userdata, factionFortBannersStateObject)
		Shared.setUserdata(objectId, userdata)
		
	end
	
end

gd.quests.areaCFactionSelection.factionFortBannersOnDestroy = ClearObjectUserdata

-- UG Door
local entranceId = 0

function gd.quests.areaCFactionSelection.entranceOnAddToWorld(objectId)

	if Server then
	
		entranceId = objectId;
		
		local door = Door.Get(objectId)
		local player = Game.GetLocalPlayer()

		if (player:ServerHasToken("AREAC_NECROS_CHOSEN") || player:ServerHasToken("AREAC_ZEALOTS_CHOSEN")) then
			-- Host already unlocked this door
			door:SetLocked(false)
			door:Open()
		end
		
	end
		
end

-- Unlock door if player clicks it and host is eligible
function gd.quests.areaCFactionSelection.doorOnInteract(objectId, userId)

	local player = Player.Get(userId)
	local door = Door.Get(objectId)
	
	-- unlock door if the host has chosen a faction
	if ((door != nil) && (door:IsLocked())) then
		if (player:ServerHasToken("AREAC_NECROS_CHOSEN") || player:ServerHasToken("AREAC_ZEALOTS_CHOSEN")) then
			door:SetLocked(false)
			door:Open()
			
		end
		
	end
	
end


-- Teleport Champion to Necropolis
local championNecropolisPortal = false

function gd.quests.areaCFactionSelection.championNecropolisPortal()

	if Server && not championNecropolisPortal then
		championNecropolisPortal = true
		
		local player = Game.GetLocalPlayer()
		local champion = Entity.Get(championNecropolisId)
		
		if (player:HasToken("ZEALOT_CHAMPION_AREAD") == false && player:HasToken("NECRO_MALKADARR_AREAD") == false && player:GetFaction("USER8") >= 10000 && player:HasToken("ZEALOT_BATTLE_FINISHED")) then
			GiveTokenToLocalPlayer("ZEALOT_CHAMPION_AREAD")
			gd.quests.areaCQuestZealots.swapChampion()
			
		elseif (player:HasToken("ZEALOT_CHAMPION_AREAD") == false && player:HasToken("NECRO_MALKADARR_AREAD") == false && player:GetFaction("USER5") >= 10000 && player:HasToken("NECRO_RITUAL_FINISHED")) then
			GiveTokenToLocalPlayer("NECRO_MALKADARR_AREAD")
			gd.quests.areaCQuestNecros.swapMalkadarr()
		
		end

		if (champion != nil) then
			local coords = champion:GetCoords()	
			local rift = Entity.Create("records/fx/ui/riftgatepersonalopen_fxpak.dbr")
		
			if (rift != nil) then
				rift:NetworkEnable()
				rift:SetCoords(coords)
			end
		
			UpdateObjectSwap(championNecropolisId, factionChampionStateObjects)
		
		end
	
	end

end


