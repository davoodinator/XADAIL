/*
	
	GRIM DAWN
	
	For more information, visit us at http://www.grimdawn.com
	
*/

gd.dungeonChests.bonusChests = {}

-- Bonus Chest State
local ChestState = { Default = 0, Looted = 1 }

-- Bonus Chest A01
local bonusChestA01StateObjects = orderedTable()
	bonusChestA01StateObjects["BONUSCHEST_A01"	] = { state = ChestState.Looted, dbr = "records/items/lootchests/b01_chestcorpse01.dbr"}
	bonusChestA01StateObjects[""					 	] = { state = ChestState.Default, dbr = "records/items/lootchests/bonuschests/bonuschest_a01.dbr"}

local bonusChestA01Spawned = false

function gd.dungeonChests.bonusChests.bonusA01OnAddToWorld(objectId)

	if Server then
		local player = Game.GetLocalPlayer()
		if (not bonusChestA01Spawned && player:GetLevel() > 2 && (Game.GetGameDifficulty() == Game.Difficulty.Normal)) then
			bonusChestA01Spawned = true
			
			local userdata = {}
			TokenStateBasedObjectSwap(objectId, userdata, bonusChestA01StateObjects)
			
			Shared.setUserdata(objectId, userdata)
		
		end
			
	end
	
end

gd.dungeonChests.bonusChests.bonusA01OnDestroy = ClearObjectUserdata

function gd.dungeonChests.bonusChests.bonusA01ChestFound()

	GiveTokenToLocalPlayer("BONUSCHEST_A01")
	
end

-- Bonus Chest A02
local bonusChestA02StateObjects = orderedTable()
	bonusChestA02StateObjects["BONUSCHEST_A02"	] = { state = ChestState.Looted, dbr = "records/items/lootchests/b01_chestmetal01.dbr"}
	bonusChestA02StateObjects[""					 	] = { state = ChestState.Default, dbr = "records/items/lootchests/bonuschests/bonuschest_a02.dbr"}

local bonusChestA02Spawned = false

function gd.dungeonChests.bonusChests.bonusA02OnAddToWorld(objectId)

	if Server then
		local player = Game.GetLocalPlayer()
		if (not bonusChestA02Spawned && player:GetLevel() > 2 && (Game.GetGameDifficulty() == Game.Difficulty.Normal)) then
			bonusChestA02Spawned = true
			
			local userdata = {}
			TokenStateBasedObjectSwap(objectId, userdata, bonusChestA02StateObjects)
			
			Shared.setUserdata(objectId, userdata)
		
		end
			
	end
	
end

gd.dungeonChests.bonusChests.bonusA02OnDestroy = ClearObjectUserdata

function gd.dungeonChests.bonusChests.bonusA02ChestFound()

	GiveTokenToLocalPlayer("BONUSCHEST_A02")
	
end

-- Bonus Chest A03
local bonusChestA03StateObjects = orderedTable()
	bonusChestA03StateObjects["BONUSCHEST_A03"	] = { state = ChestState.Looted, dbr = "records/items/lootchests/b01_chestmetal01.dbr"}
	bonusChestA03StateObjects[""					 	] = { state = ChestState.Default, dbr = "records/items/lootchests/bonuschests/bonuschest_a03.dbr"}

local bonusChestA03Spawned = false

function gd.dungeonChests.bonusChests.bonusA03OnAddToWorld(objectId)

	if Server then
		local player = Game.GetLocalPlayer()
		if (not bonusChestA03Spawned && player:GetLevel() > 2 && (Game.GetGameDifficulty() == Game.Difficulty.Normal)) then
			bonusChestA03Spawned = true
			
			local userdata = {}
			TokenStateBasedObjectSwap(objectId, userdata, bonusChestA03StateObjects)
			
			Shared.setUserdata(objectId, userdata)
		
		end
			
	end
	
end

gd.dungeonChests.bonusChests.bonusA03OnDestroy = ClearObjectUserdata

function gd.dungeonChests.bonusChests.bonusA03ChestFound()

	GiveTokenToLocalPlayer("BONUSCHEST_A03")
	
end

-- Bonus Chest B01
local bonusChestB01StateObjects = orderedTable()
	bonusChestB01StateObjects["BONUSCHEST_B01"	] = { state = ChestState.Looted, dbr = "records/items/lootchests/b01_chestmetal01.dbr"}
	bonusChestB01StateObjects[""					 	] = { state = ChestState.Default, dbr = "records/items/lootchests/bonuschests/bonuschest_b01.dbr"}

local bonusChestB01Spawned = false

function gd.dungeonChests.bonusChests.bonusB01OnAddToWorld(objectId)

	if Server then
		local player = Game.GetLocalPlayer()
		if (not bonusChestB01Spawned && player:GetLevel() > 2 && (Game.GetGameDifficulty() == Game.Difficulty.Normal)) then
			bonusChestB01Spawned = true
			
			local userdata = {}
			TokenStateBasedObjectSwap(objectId, userdata, bonusChestB01StateObjects)
			
			Shared.setUserdata(objectId, userdata)
		
		end
			
	end
	
end

gd.dungeonChests.bonusChests.bonusB01OnDestroy = ClearObjectUserdata

function gd.dungeonChests.bonusChests.bonusB01ChestFound()

	GiveTokenToLocalPlayer("BONUSCHEST_B01")
	
end

-- Bonus Chest B02
local bonusChestB02StateObjects = orderedTable()
	bonusChestB02StateObjects["BONUSCHEST_B02"	] = { state = ChestState.Looted, dbr = "records/items/lootchests/b01_chestcorpse01.dbr"}
	bonusChestB02StateObjects[""					 	] = { state = ChestState.Default, dbr = "records/items/lootchests/bonuschests/bonuschest_b02.dbr"}

local bonusChestB02Spawned = false

function gd.dungeonChests.bonusChests.bonusB02OnAddToWorld(objectId)

	if Server then
		local player = Game.GetLocalPlayer()
		if (not bonusChestB02Spawned && player:GetLevel() > 2 && (Game.GetGameDifficulty() == Game.Difficulty.Normal)) then
			bonusChestB02Spawned = true
			
			local userdata = {}
			TokenStateBasedObjectSwap(objectId, userdata, bonusChestB02StateObjects)
			
			Shared.setUserdata(objectId, userdata)
		
		end
			
	end
	
end

gd.dungeonChests.bonusChests.bonusB02OnDestroy = ClearObjectUserdata

function gd.dungeonChests.bonusChests.bonusB02ChestFound()

	GiveTokenToLocalPlayer("BONUSCHEST_B02")
	
end

-- Bonus Chest B03
local bonusChestB03StateObjects = orderedTable()
	bonusChestB03StateObjects["BONUSCHEST_B03"	] = { state = ChestState.Looted, dbr = "records/items/lootchests/b01_chestcorpse01.dbr"}
	bonusChestB03StateObjects[""					 	] = { state = ChestState.Default, dbr = "records/items/lootchests/bonuschests/bonuschest_b03.dbr"}

local bonusChestB03Spawned = false

function gd.dungeonChests.bonusChests.bonusB03OnAddToWorld(objectId)

	if Server then
		local player = Game.GetLocalPlayer()
		if (not bonusChestB03Spawned && player:GetLevel() > 2 && (Game.GetGameDifficulty() == Game.Difficulty.Normal)) then
			bonusChestB03Spawned = true
			
			local userdata = {}
			TokenStateBasedObjectSwap(objectId, userdata, bonusChestB03StateObjects)
			
			Shared.setUserdata(objectId, userdata)
		
		end
			
	end
	
end

gd.dungeonChests.bonusChests.bonusB03OnDestroy = ClearObjectUserdata

function gd.dungeonChests.bonusChests.bonusB03ChestFound()

	GiveTokenToLocalPlayer("BONUSCHEST_B03")
	
end