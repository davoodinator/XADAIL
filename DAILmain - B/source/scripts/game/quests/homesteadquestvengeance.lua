/*
	
	GRIM DAWN

	For more information, visit us at http://www.grimdawn.com
	
*/

gd.quests.homesteadQuestVengeance = {}

--
-- Vengeance swaps between several hostile states depending on conversation choices
--

local drewId = 0
local spawnedDrew = false
local isaiahId = 0
local spawnedIsaiah = false
local daughterId = 0
local spawnedDaughter = false


--Toggling Vengeance Quest State
local VengeanceState = { Intro = 0, TookMoney = 1, Trust = 2, IsaiahHostile = 3, IsaiahDead = 4, JosephineHostile = 5, JosephineDead = 6, Homestead = 7 }

--Drew Spawn State
local drewStateObjects = orderedTable()
	drewStateObjects["VENGEANCE_HOMESTEADSPAWN"	] = { state = VengeanceState.Homestead, dbr = "records/items/lootchests/breakables/a01_bonepilehuman_01_break.dbr"}
	drewStateObjects["VENGEANCE_DAUGHTERDEAD"	] = { state = VengeanceState.JosephineDead, dbr = "records/items/lootchests/breakables/a01_bonepilehuman_01_break.dbr"}
	drewStateObjects["VENGEANCE_DAUGHTERHOSTILE"	] = { state = VengeanceState.JosephineHostile, dbr = "records/items/lootchests/breakables/a01_bonepilehuman_01_break.dbr"}
	drewStateObjects["VENGEANCE_DEAD"	] = { state = VengeanceState.IsaiahDead, dbr = "records/items/lootchests/breakables/a01_bonepilehuman_01_break.dbr"}
	drewStateObjects["VENGEANCE_HOSTILE"	] = { state = VengeanceState.IsaiahHostile, dbr = "records/items/lootchests/breakables/a01_bonepilehuman_01_break.dbr"}
	drewStateObjects["VENGEANCE_TOOKMONEY"	] = { state = VengeanceState.TookMoney, dbr = "records/items/lootchests/breakables/a01_bonepilehuman_01_break.dbr"}
	drewStateObjects["VENGEANCE_TRUST"	] = { state = VengeanceState.Trust, dbr = "records/items/lootchests/breakables/a01_bonepilehuman_01_break.dbr"}
	drewStateObjects[""					 	] = { state = VengeanceState.Intro, dbr = "records/creatures/npcs/questnpcs/gdareab/npc_drewlarkin_01.dbr" }
	

function gd.quests.homesteadQuestVengeance.drewOnAddToWorld(objectId)

	if Server then
		if (not spawnedDrew) then
			drewId = objectId
			
			local userdata = {}
			local didWork, newState = TokenStateBasedObjectSwap(objectId, userdata, drewStateObjects)
			
			Shared.setUserdata(objectId, userdata)
			
			-- Don't respawn drew next time. If spawned as chest, will be saved into the world
			if (newState != VengeanceState.Intro) then
				spawnedDrew = true
				
			end
		
		end
			
	end
	
end

gd.quests.homesteadQuestVengeance.drewOnDestroy = ClearObjectUserdata


--Isaiah Swapping
local isaiahStateObjects = orderedTable()
	isaiahStateObjects["VENGEANCE_HOMESTEADSPAWN"	] = { state = VengeanceState.Homestead, dbr = nil }
	isaiahStateObjects["VENGEANCE_DAUGHTERDEAD"	] = { state = VengeanceState.JosephineDead, dbr = nil }
	isaiahStateObjects["VENGEANCE_DAUGHTERHOSTILE"	] = { state = VengeanceState.JosephineHostile, dbr = nil }
	isaiahStateObjects["VENGEANCE_DEAD"	] = { state = VengeanceState.IsaiahDead, dbr = nil }	
	isaiahStateObjects["VENGEANCE_HOSTILE"	] = { state = VengeanceState.IsaiahHostile, dbr = "records/creatures/enemies/boss&quest/vengeance_isaiahreddan_01.dbr" }
	isaiahStateObjects["VENGEANCE_TOOKMONEY"	] = { state = VengeanceState.TookMoney, dbr = nil }
	isaiahStateObjects["VENGEANCE_TRUST"	] = { state = VengeanceState.Trust, dbr = nil }
	isaiahStateObjects[""					 	] = { state = VengeanceState.Intro, dbr = "records/creatures/npcs/questnpcs/gdareab/npc_isaiahreddan_01.dbr" }

local function IsaiahCreateArgs()

	return 0, Entity.Get(isaiahId):GetCoords().origin
	
end

function gd.quests.homesteadQuestVengeance.isaiahOnAddToWorld(objectId)
	if Server then
		if (not spawnedIsaiah) then
			isaiahId = objectId
		
			local userdata = {}
			local didWork, newState = TokenStateBasedObjectSwap(objectId, userdata, isaiahStateObjects, Character, IsaiahCreateArgs)
		
			Shared.setUserdata(objectId, userdata)
		
			-- Don't respawn isaiah next time. If spawned as hostile, will be saved into the world
			if (newState == VengeanceState.Hostile) then
				spawnedIsaiah = true
				
			end
			
		end
	
	end
	
end

gd.quests.homesteadQuestVengeance.isaiahOnDestroy = ClearObjectUserdata

local isaiahHostileSwap = false

function gd.quests.homesteadQuestVengeance.isaiahHostileSwitch()

	if Server then
		if not spawnedIsaiah then	
			spawnedIsaiah = true
			
			local player = Game.GetLocalPlayer()
			local MPOverrideDbr = nil
			local MPOverrideState = false

			if (player:HasToken("VENGEANCE_HOSTILE") == false) then
				MPOverrideDbr = "records/creatures/enemies/boss&quest/vengeance_isaiahreddan_01.dbr"
				MPOverrideState = true
				
			end
			
			local didWork, newState = UpdateObjectSwap(isaiahId, isaiahStateObjects, Character, CharacterCreateArgs, MPOverrideState, MPOverrideDbr)
		
		end
	
	end

end

function gd.quests.homesteadQuestVengeance.isaiahKilled()

	local player = Game.GetLocalPlayer()
	
	if (player != nil && player:HasToken("VENGEANCE_HOSTILE")) then
		player:GiveToken("VENGEANCE_DEAD")
		player:RemoveToken("VENGEANCE_HOSTILE")
	
	end
	
end


--Josephine Swapping
local josephineStateObjects = orderedTable()
	josephineStateObjects["VENGEANCE_HOMESTEADSPAWN"	] = { state = VengeanceState.Homestead, dbr = nil }
	josephineStateObjects["VENGEANCE_DAUGHTERDEAD"	] = { state = VengeanceState.JosephineDead, dbr = nil }
	josephineStateObjects["VENGEANCE_DAUGHTERHOSTILE"	] = { state = VengeanceState.JosephineHostile, dbr = "records/creatures/enemies/boss&quest/vengeance_josephinereddan_01.dbr" }
	josephineStateObjects["VENGEANCE_DEAD"	] = { state = VengeanceState.IsaiahDead, dbr = "records/creatures/npcs/questnpcs/gdareab/npc_josephinereddan_01.dbr" }
	josephineStateObjects["VENGEANCE_HOSTILE"	] = { state = VengeanceState.IsaiahHostile, dbr = nil }
	josephineStateObjects["VENGEANCE_TOOKMONEY"	] = { state = VengeanceState.TookMoney, dbr = nil }
	josephineStateObjects["VENGEANCE_TRUST"	] = { state = VengeanceState.Trust, dbr = nil }
	josephineStateObjects[""					 	] = { state = VengeanceState.Intro, dbr = nil }

local function JosephineCreateArgs()

	return 0, Entity.Get(daughterId):GetCoords().origin
	
end

function gd.quests.homesteadQuestVengeance.josephineOnAddToWorld(objectId)

	if Server then
		if (not spawnedDaughter) then
			daughterId = objectId
		
			local userdata = {}
			local didWork, newState = TokenStateBasedObjectSwap(objectId, userdata, josephineStateObjects, Character, JosephineCreateArgs)
		
			Shared.setUserdata(objectId, userdata)
		
			-- Don't respawn Josephine next time. If spawned as hostile, will be saved into the world
			if (newState == VengeanceState.JosephineHostile) then
				spawnedDaughter = true
				
			end
		
		end
		
	end
	
end

gd.quests.homesteadQuestVengeance.josephineOnDestroy = ClearObjectUserdata

function gd.quests.homesteadQuestVengeance.josephineHostileSwitch()

	if Server then
		if not spawnedDaughter then
			spawnedDaughter = true
			
			local player = Game.GetLocalPlayer()
			
			QuestGlobalEvent("vengeanceDaughterHostileSwitchToken")
			
			local MPOverrideDbr = nil
			local MPOverrideState = false

			if (player:HasToken("VENGEANCE_DAUGHTERHOSTILE") == false) then
				MPOverrideDbr = "records/creatures/enemies/boss&quest/vengeance_josephinereddan_01.dbr"
				MPOverrideState = true
				
			end
			
			local didWork, newState = UpdateObjectSwap(daughterId, josephineStateObjects, Character, CharacterCreateArgs, MPOverrideState, MPOverrideDbr)
		
		end
	
	end

end

function gd.quests.homesteadQuestVengeance.josephineKilled()

	local player = Game.GetLocalPlayer()
	
	if (player != nil && (player:HasToken("VENGEANCE_DAUGHTERHOSTILE") || player:HasToken("VENGEANCE_DEAD"))) then
		GiveTokenToLocalPlayer("VENGEANCE_DAUGHTERDEAD")
			
		if (player:HasToken("VENGEANCE_DAUGHTERHOSTILE")) then
			player:RemoveToken("VENGEANCE_DAUGHTERHOSTILE")
				
		end

		if (player:HasToken("VENGEANCE_DEAD")) then
			player:RemoveToken("VENGEANCE_DEAD")
				
		end
		
	end
	
end

--Isaiah Cart
local isaiahCartStateObjects = orderedTable()
	isaiahCartStateObjects["VENGEANCE_DAUGHTERDEAD"	] = { state = VengeanceState.JosephineDead, dbr = "records/level art/outpost/cart_flat_loaded_01.dbr" }
	isaiahCartStateObjects["VENGEANCE_DAUGHTERHOSTILE"	] = { state = VengeanceState.JosephineHostile, dbr = "records/level art/outpost/cart_flat_loaded_01.dbr" }
	isaiahCartStateObjects["VENGEANCE_DEAD"	] = { state = VengeanceState.IsaiahDead, dbr = "records/level art/outpost/cart_flat_loaded_01.dbr" }
	isaiahCartStateObjects["VENGEANCE_HOSTILE"	] = { state = VengeanceState.IsaiahHostile, dbr = "records/level art/outpost/cart_flat_loaded_01.dbr" }
	isaiahCartStateObjects["VENGEANCE_TOOKMONEY"	] = { state = VengeanceState.TookMoney, dbr = "records/level art/outpost/cart_flat_destroyed.dbr" }
	isaiahCartStateObjects["VENGEANCE_TRUST"	] = { state = VengeanceState.Trust, dbr = "records/level art/outpost/cart_flat_destroyed.dbr" }
	isaiahCartStateObjects[""					 	] = { state = VengeanceState.Intro, dbr = "records/level art/outpost/cart_flat_loaded_01.dbr" }

function gd.quests.homesteadQuestVengeance.isaiahCartOnAddToWorld(objectId)
	
	if Server then
		local userdata = {}
		TokenStateBasedObjectSwap(objectId, userdata, isaiahCartStateObjects)
		Shared.setUserdata(objectId, userdata)
	
	end
	
end

gd.quests.homesteadQuestVengeance.isaiahCartOnDestroy = ClearObjectUserdata

--Swap drew out after Isaiah is reached
local drewSwitch = false

function gd.quests.homesteadQuestVengeance.drewSwap()
	
	if Server then
		if not drewSwitch then
			drewSwitch = true
			spawnedDrew = true
			
			UpdateObjectSwap(drewId, drewStateObjects)
		
		end
	
	end

end

--
-- Give out Tokens in MP
--
function gd.quests.homesteadQuestVengeance.tookMoneyGlobalMP()

	local player = Game.GetLocalPlayer()

	local kQuest_Vengeance = 0x09892AB0
	local kTask_Choice = 0x0C5003D0

	local questTaskState = player:GetQuestTaskState(kQuest_Vengeance, kTask_Choice)
	
	if (player != nil && questTaskState == QuestState.InProgress) then
		player:GiveToken("VENGEANCE_TOOKMONEY")

	end

end

function gd.quests.homesteadQuestVengeance.hostileSwitchGlobalMP()

	local player = Game.GetLocalPlayer()

	local kQuest_Vengeance = 0x09892AB0
	local kTask_Choice = 0x0C5003D0

	local questTaskState = player:GetQuestTaskState(kQuest_Vengeance, kTask_Choice)
	
	if (player != nil && questTaskState == QuestState.InProgress) then
		player:GiveToken("VENGEANCE_HOSTILE")

	end

end

function gd.quests.homesteadQuestVengeance.daughterHostileSwitchGlobalMP()

	local player = Game.GetLocalPlayer()
	
	if player:HasToken("VENGEANCE_DEAD") then
		GiveTokenToLocalPlayer("VENGEANCE_DAUGHTERHOSTILE")
		player:RemoveToken("VENGEANCE_DEAD")
	
	end

end

function gd.quests.homesteadQuestVengeance.trustGlobalMP()

	local player = Game.GetLocalPlayer()

	local kQuest_Vengeance = 0x09892AB0
	local kTask_Choice = 0x0C5003D0

	local questTaskState = player:GetQuestTaskState(kQuest_Vengeance, kTask_Choice)
	
	if (player != nil && questTaskState == QuestState.InProgress) then
		player:GiveToken("VENGEANCE_TRUST")

	end

end



--
-- Follow-up with Isaiah and Josephine in Homestead, dependent upon the quest's resolution
--
local isaiahHomesteadId = 0
local spawnedIsaiahHomestead = false
local daughterHomesteadId = 0
local spawnedDaughterHomestead = false

--Toggling Homestead Follow-up Quest State
local HomesteadState = { Intro = 0, Spawn = 1, NoTrust = 2, Trust = 3 }

-- Isaiah in Homestead

local isaiahHomesteadStateObjects = orderedTable()
	isaiahHomesteadStateObjects["VENGEANCE_VENDORTRUST"	] = { state = HomesteadState.Trust, dbr = "records/creatures/npcs/merchants/merchanta03.dbr" }	
	isaiahHomesteadStateObjects["VENGEANCE_VENDORNOTRUST"	] = { state = HomesteadState.NoTrust, dbr = "records/creatures/npcs/merchants/merchanta03b.dbr" }
	isaiahHomesteadStateObjects["VENGEANCE_HOMESTEADSPAWN"	] = { state = HomesteadState.Spawn, dbr = "records/creatures/npcs/questnpcs/gdareac/npc_isaiahreddan_02.dbr" }
	isaiahHomesteadStateObjects[""					 	] = { state = HomesteadState.Intro, dbr = nil }

function gd.quests.homesteadQuestVengeance.isaiahHomesteadOnAddToWorld(objectId)

	if Server then
		isaiahHomesteadId = objectId
		
		local userdata = {}
		local didWork, newState = TokenStateBasedObjectSwap(objectId, userdata, isaiahHomesteadStateObjects)
		
		Shared.setUserdata(objectId, userdata)
			
	end
	
end

gd.quests.homesteadQuestVengeance.isaiahHomesteadOnDestroy = ClearObjectUserdata

-- Daughter in Homestead
local daughterHomesteadStateObjects = orderedTable()
	daughterHomesteadStateObjects["VENGEANCE_HOMESTEADSPAWN"	] = { state = HomesteadState.Spawn, dbr = "records/creatures/npcs/flavornpcs/gdareac/npc_josephinereddan_01.dbr" }
	daughterHomesteadStateObjects[""					 	] = { state = HomesteadState.Intro, dbr = nil }

function gd.quests.homesteadQuestVengeance.daughterHomesteadOnAddToWorld(objectId)

	if Server then
		daughterHomesteadId = objectId
		
		local userdata = {}
		local didWork, newState = TokenStateBasedObjectSwap(objectId, userdata, daughterHomesteadStateObjects)
		
		Shared.setUserdata(objectId, userdata)
			
	end
	
end

gd.quests.homesteadQuestVengeance.daughterHomesteadOnDestroy = ClearObjectUserdata


-- Isaiah's Vendor area in Homestead
local isaiahMerchantAreaId = 0

local merchantAreaStateObjects = orderedTable()
	merchantAreaStateObjects["VENGEANCE_HOMESTEADSPAWN"] 	= { state = HomesteadState.Spawn,  dbr = "records/storyelements/questassets/hs_merchantarea01_after.dbr"}
	merchantAreaStateObjects[""] 				= { state = HomesteadState.Intro, dbr = "records/storyelements/questassets/hs_merchantarea01_before.dbr" }

function gd.quests.homesteadQuestVengeance.merchantAreaOnAddToWorld(objectId)

	if Server then
	
		isaiahMerchantAreaId = objectId

		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, merchantAreaStateObjects)
		Shared.setUserdata(objectId, userdata)
		
	end
	
end

function gd.quests.homesteadQuestVengeance.merchantAreaOnRemoveFromWorld(objectId)

	if Server then
	
		isaiahMerchantAreaId = 0
		
	end
	
end

gd.quests.homesteadQuestVengeance.merchantAreaOnDestroy = ClearObjectUserdata

--Swap npcs after Deadman's Gulch is reached
local homesteadSwitch = false

function gd.quests.homesteadQuestVengeance.homesteadSwapGlobalMP()
	local player = Game.GetLocalPlayer()
	
	if (player:HasToken("VENGEANCE_DAUGHTERDEAD") == false && player:HasToken("VENGEANCE_DAUGHTERHOSTILE") == false && player:HasToken("VENGEANCE_DEAD") == false && player:HasToken("VENGEANCE_HOSTILE") == false) then
		GiveTokenToLocalPlayer("VENGEANCE_HOMESTEADSPAWN")

	end

end

-- called in Road to Homestead script when entering trigger volume
function gd.quests.homesteadQuestVengeance.homesteadSwap()
	
	if Server then
		local player = Game.GetLocalPlayer()
		
		if (player:HasToken("VENGEANCE_DAUGHTERDEAD") == false && player:HasToken("VENGEANCE_DAUGHTERHOSTILE") == false && player:HasToken("VENGEANCE_DEAD") == false && player:HasToken("VENGEANCE_HOSTILE") == false)  && homesteadSwitch == false then
			homesteadSwitch = true
			
			GiveTokenToLocalPlayer("VENGEANCE_HOMESTEADSPAWN")
			
			QuestGlobalEvent("vengeanceHomesteadSwitchToken")
			
			local drew = Entity.Get(drewId)
			local isaiah = Entity.Get(isaiahId)
			local daughter = Entity.Get(daughterId)
			
			if drew != nil then
				UpdateObjectSwap(drewId, drewStateObjects)
			end
			
			if isaiah != nil then
				UpdateObjectSwap(isaiahId, isaiahStateObjects)
			end
			
			if daughter != nil then
				UpdateObjectSwap(daughterId, josephineStateObjects)
			end
						
			UpdateObjectSwap(isaiahHomesteadId, isaiahHomesteadStateObjects)
			UpdateObjectSwap(daughterHomesteadId, daughterHomesteadStateObjects)
			UpdateObjectSwap(isaiahMerchantAreaId, merchantAreaStateObjects)
		
		end
	
	end

end


function gd.quests.homesteadQuestVengeance.homesteadVendorSwapGlobalMP()

	local player = Game.GetLocalPlayer()

	-- Bestows vendor token based on actions in Vengeance quest
	if (player:HasToken("VENGEANCE_TRUST") || player:HasToken("VENGEANCE_JOSEPHINETRUST")) then
		GiveTokenToLocalPlayer("VENGEANCE_VENDORTRUST")
	else
		GiveTokenToLocalPlayer("VENGEANCE_VENDORNOTRUST")
	end
	
	-- Completes Vengeance quest if player is still on it
	local questId = 0x09892AB0
	local taskId = 0x0C5003D0

	local questTaskState = player:GetQuestTaskState(questId, taskId)

	if (questTaskState == QuestState.InProgress) then
		player:CompleteQuest(0x09892AB0, 0x0C5003D0)
		
	end
	
end


-- Swap Isaiah in Homestead to a vendor
local homesteadVendorSwitch = false

function gd.quests.homesteadQuestVengeance.homesteadVendorSwap()

	if Server then
		if not homesteadVendorSwitch then
			homesteadVendorSwitch = true
			
			local player = Game.GetLocalPlayer()
			
			QuestGlobalEvent("vengeanceHomesteadVendorSwitchToken")
			
			if (player:HasToken("VENGEANCE_TRUST") || player:HasToken("VENGEANCE_JOSEPHINETRUST")) then
				GiveTokenToLocalPlayer("VENGEANCE_VENDORTRUST")
			else
				GiveTokenToLocalPlayer("VENGEANCE_VENDORNOTRUST")
			end
				
			UpdateObjectSwap(isaiahHomesteadId, isaiahHomesteadStateObjects)
		
		end
	
	end

end

