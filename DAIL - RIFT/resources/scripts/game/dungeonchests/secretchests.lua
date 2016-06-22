/*
	
	GRIM DAWN
	
	For more information, visit us at http://www.grimdawn.com
	
*/

gd.dungeonChests.secretChests = {}

--
-- Controls for Secret Area Chests. Chests spawn with better loot initially, then a lesser version spawns on subsequent visits
-- Each chest should only be placed once, one per intended secret area
--

-- Secret Chest State
local ChestState = { Default = 0, Looted = 1 }

-- Secret Chest A01
local secretChestA01StateObjects = orderedTable()
	secretChestA01StateObjects["SECRETCHEST_A01"	] = { state = ChestState.Looted, dbr = "records/items/lootchests/b01_chestmetal01.dbr"}
	secretChestA01StateObjects[""					 	] = { state = ChestState.Default, dbr = "records/items/lootchests/secretchests/secretchest_a01.dbr"}

local secretChestA01Spawned = false

function gd.dungeonChests.secretChests.secretA01OnAddToWorld(objectId)

	if Server then
		local player = Game.GetLocalPlayer()
		if (not secretChestA01Spawned && player:GetLevel() > 2) then
			secretChestA01Spawned = true
			
			local userdata = {}
			TokenStateBasedObjectSwap(objectId, userdata, secretChestA01StateObjects)
			
			Shared.setUserdata(objectId, userdata)
		
		end
			
	end
	
end

gd.dungeonChests.secretChests.secretA01OnDestroy = ClearObjectUserdata

function gd.dungeonChests.secretChests.secretA01ChestFound()

	GiveTokenToLocalPlayer("SECRETCHEST_A01")
	
end


-- Secret Chest A02
local secretChestA02StateObjects = orderedTable()
	secretChestA02StateObjects["SECRETCHEST_A02"	] = { state = ChestState.Looted, dbr = "records/items/lootchests/b01_chestcorpse01.dbr"}
	secretChestA02StateObjects[""					 	] = { state = ChestState.Default, dbr = "records/items/lootchests/secretchests/secretchest_a02.dbr"}

local secretChestA02Spawned = false

function gd.dungeonChests.secretChests.secretA02OnAddToWorld(objectId)

	if Server then
		local player = Game.GetLocalPlayer()
		if (not secretChestA02Spawned && player:GetLevel() > 2) then
			secretChestA02Spawned = true
			
			local userdata = {}
			TokenStateBasedObjectSwap(objectId, userdata, secretChestA02StateObjects)
			
			Shared.setUserdata(objectId, userdata)
		
		end
			
	end
	
end

gd.dungeonChests.secretChests.secretA02OnDestroy = ClearObjectUserdata

function gd.dungeonChests.secretChests.secretA02ChestFound()

	GiveTokenToLocalPlayer("SECRETCHEST_A02")
	
end


-- Secret Chest A03
local secretChestA03StateObjects = orderedTable()
	secretChestA03StateObjects["SECRETCHEST_A03"	] = { state = ChestState.Looted, dbr = "records/items/lootchests/b01_chestcorpse01.dbr"}
	secretChestA03StateObjects[""					 	] = { state = ChestState.Default, dbr = "records/items/lootchests/secretchests/secretchest_a03.dbr"}

local secretChestA03Spawned = false

function gd.dungeonChests.secretChests.secretA03OnAddToWorld(objectId)

	if Server then
		local player = Game.GetLocalPlayer()
		if (not secretChestA03Spawned && player:GetLevel() > 2) then
			secretChestA03Spawned = true
			
			local userdata = {}
			TokenStateBasedObjectSwap(objectId, userdata, secretChestA03StateObjects)
			
			Shared.setUserdata(objectId, userdata)
		
		end
			
	end
	
end

gd.dungeonChests.secretChests.secretA03OnDestroy = ClearObjectUserdata

function gd.dungeonChests.secretChests.secretA03ChestFound()

	GiveTokenToLocalPlayer("SECRETCHEST_A03")
	
end


-- Secret Chest A04
local secretChestA04StateObjects = orderedTable()
	secretChestA04StateObjects["SECRETCHEST_A04"	] = { state = ChestState.Looted, dbr = "records/items/lootchests/b01_chestmetal01.dbr"}
	secretChestA04StateObjects[""					 	] = { state = ChestState.Default, dbr = "records/items/lootchests/secretchests/secretchest_a04.dbr"}

local secretChestA04Spawned = false

function gd.dungeonChests.secretChests.secretA04OnAddToWorld(objectId)

	if Server then
		local player = Game.GetLocalPlayer()
		if (not secretChestA04Spawned && player:GetLevel() > 2) then
			secretChestA04Spawned = true
			
			local userdata = {}
			TokenStateBasedObjectSwap(objectId, userdata, secretChestA04StateObjects)
			
			Shared.setUserdata(objectId, userdata)
		
		end
			
	end
	
end

gd.dungeonChests.secretChests.secretA04OnDestroy = ClearObjectUserdata

function gd.dungeonChests.secretChests.secretA04ChestFound()

	GiveTokenToLocalPlayer("SECRETCHEST_A04")
	
end


-- Secret Chest A05
local secretChestA05StateObjects = orderedTable()
	secretChestA05StateObjects["SECRETCHEST_A05"	] = { state = ChestState.Looted, dbr = "records/items/lootchests/b01_chestmetal01.dbr"}
	secretChestA05StateObjects[""					 	] = { state = ChestState.Default, dbr = "records/items/lootchests/secretchests/secretchest_a05.dbr"}

local secretChestA05Spawned = false

function gd.dungeonChests.secretChests.secretA05OnAddToWorld(objectId)

	if Server then
		local player = Game.GetLocalPlayer()
		if (not secretChestA05Spawned && player:GetLevel() > 2) then
			secretChestA05Spawned = true
			
			local userdata = {}
			TokenStateBasedObjectSwap(objectId, userdata, secretChestA05StateObjects)
			
			Shared.setUserdata(objectId, userdata)
		
		end
			
	end
	
end

gd.dungeonChests.secretChests.secretA05OnDestroy = ClearObjectUserdata

function gd.dungeonChests.secretChests.secretA05ChestFound()

	GiveTokenToLocalPlayer("SECRETCHEST_A05")
	
end


-- Secret Chest A06
local secretChestA06StateObjects = orderedTable()
	secretChestA06StateObjects["SECRETCHEST_A06"	] = { state = ChestState.Looted, dbr = "records/items/lootchests/b01_chestcocoon01.dbr"}
	secretChestA06StateObjects[""					 	] = { state = ChestState.Default, dbr = "records/items/lootchests/secretchests/secretchest_a06.dbr"}

local secretChestA06Spawned = false

function gd.dungeonChests.secretChests.secretA06OnAddToWorld(objectId)

	if Server then
		local player = Game.GetLocalPlayer()
		if (not secretChestA06Spawned && player:GetLevel() > 2) then
			secretChestA06Spawned = true
			
			local userdata = {}
			TokenStateBasedObjectSwap(objectId, userdata, secretChestA06StateObjects)
			
			Shared.setUserdata(objectId, userdata)
		
		end
			
	end
	
end

gd.dungeonChests.secretChests.secretA06OnDestroy = ClearObjectUserdata

function gd.dungeonChests.secretChests.secretA06ChestFound()

	GiveTokenToLocalPlayer("SECRETCHEST_A06")
	
end


-- Secret Chest A07
local secretChestA07StateObjects = orderedTable()
	secretChestA07StateObjects["SECRETCHEST_A07"	] = { state = ChestState.Looted, dbr = "records/items/lootchests/b01_chestmetal01.dbr"}
	secretChestA07StateObjects[""					 	] = { state = ChestState.Default, dbr = "records/items/lootchests/secretchests/secretchest_a07.dbr"}

local secretChestA07Spawned = false

function gd.dungeonChests.secretChests.secretA07OnAddToWorld(objectId)

	if Server then
		local player = Game.GetLocalPlayer()
		if (not secretChestA07Spawned && player:GetLevel() > 2) then
			secretChestA07Spawned = true
			
			local userdata = {}
			TokenStateBasedObjectSwap(objectId, userdata, secretChestA07StateObjects)
			
			Shared.setUserdata(objectId, userdata)
		
		end
			
	end
	
end

gd.dungeonChests.secretChests.secretA07OnDestroy = ClearObjectUserdata

function gd.dungeonChests.secretChests.secretA07ChestFound()

	GiveTokenToLocalPlayer("SECRETCHEST_A07")
	
end


-- Secret Chest A08
local secretChestA08StateObjects = orderedTable()
	secretChestA08StateObjects["SECRETCHEST_A08"	] = { state = ChestState.Looted, dbr = "records/items/lootchests/b01_chestmetal01.dbr"}
	secretChestA08StateObjects[""					 	] = { state = ChestState.Default, dbr = "records/items/lootchests/secretchests/secretchest_a08.dbr"}

local secretChestA08Spawned = false

function gd.dungeonChests.secretChests.secretA08OnAddToWorld(objectId)

	if Server then
		local player = Game.GetLocalPlayer()
		if (not secretChestA08Spawned && player:GetLevel() > 2) then
			secretChestA08Spawned = true
			
			local userdata = {}
			TokenStateBasedObjectSwap(objectId, userdata, secretChestA08StateObjects)
			
			Shared.setUserdata(objectId, userdata)
		
		end
			
	end
	
end

gd.dungeonChests.secretChests.secretA08OnDestroy = ClearObjectUserdata

function gd.dungeonChests.secretChests.secretA08ChestFound()

	GiveTokenToLocalPlayer("SECRETCHEST_A08")
	
end


-- Secret Chest A09
local secretChestA09StateObjects = orderedTable()
	secretChestA09StateObjects["SECRETCHEST_A09"	] = { state = ChestState.Looted, dbr = "records/items/lootchests/b01_chestmetal01.dbr"}
	secretChestA09StateObjects[""					 	] = { state = ChestState.Default, dbr = "records/items/lootchests/secretchests/secretchest_a09.dbr"}

local secretChestA09Spawned = false

function gd.dungeonChests.secretChests.secretA09OnAddToWorld(objectId)

	if Server then
		local player = Game.GetLocalPlayer()
		if (not secretChestA09Spawned && player:GetLevel() > 2) then
			secretChestA09Spawned = true
			
			local userdata = {}
			TokenStateBasedObjectSwap(objectId, userdata, secretChestA09StateObjects)
			
			Shared.setUserdata(objectId, userdata)
		
		end
			
	end
	
end

gd.dungeonChests.secretChests.secretA09OnDestroy = ClearObjectUserdata

function gd.dungeonChests.secretChests.secretA09ChestFound()

	GiveTokenToLocalPlayer("SECRETCHEST_A09")
	
end

-- Secret Chest A10
local secretChestA10StateObjects = orderedTable()
	secretChestA10StateObjects["SECRETCHEST_A10"	] = { state = ChestState.Looted, dbr = "records/items/lootchests/b01_chestmetal01.dbr"}
	secretChestA10StateObjects[""					 	] = { state = ChestState.Default, dbr = "records/items/lootchests/secretchests/secretchest_a10.dbr"}

local secretChestA10Spawned = false

function gd.dungeonChests.secretChests.secretA10OnAddToWorld(objectId)

	if Server then
		local player = Game.GetLocalPlayer()
		if (not secretChestA10Spawned && player:GetLevel() > 2) then
			secretChestA10Spawned = true
			
			local userdata = {}
			TokenStateBasedObjectSwap(objectId, userdata, secretChestA10StateObjects)
			
			Shared.setUserdata(objectId, userdata)
		
		end
			
	end
	
end

gd.dungeonChests.secretChests.secretA10OnDestroy = ClearObjectUserdata

function gd.dungeonChests.secretChests.secretA10ChestFound()

	GiveTokenToLocalPlayer("SECRETCHEST_A10")
	
end


-- Secret Chest B01
local secretChestB01StateObjects = orderedTable()
	secretChestB01StateObjects["SECRETCHEST_B01"	] = { state = ChestState.Looted, dbr = "records/items/lootchests/b01_chestcorpse01.dbr"}
	secretChestB01StateObjects[""					 	] = { state = ChestState.Default, dbr = "records/items/lootchests/secretchests/secretchest_b01.dbr"}

local secretChestB01Spawned = false

function gd.dungeonChests.secretChests.secretB01OnAddToWorld(objectId)

	if Server then
		local player = Game.GetLocalPlayer()
		if (not secretChestB01Spawned && player:GetLevel() > 2) then
			secretChestB01Spawned = true
			
			local userdata = {}
			TokenStateBasedObjectSwap(objectId, userdata, secretChestB01StateObjects)
			
			Shared.setUserdata(objectId, userdata)
		
		end
			
	end
	
end

gd.dungeonChests.secretChests.secretB01OnDestroy = ClearObjectUserdata

function gd.dungeonChests.secretChests.secretB01ChestFound()

	GiveTokenToLocalPlayer("SECRETCHEST_B01")
	
end


-- Secret Chest B02
local secretChestB02StateObjects = orderedTable()
	secretChestB02StateObjects["SECRETCHEST_B02"	] = { state = ChestState.Looted, dbr = "records/items/lootchests/b01_chestcorpse01.dbr"}
	secretChestB02StateObjects[""					 	] = { state = ChestState.Default, dbr = "records/items/lootchests/secretchests/secretchest_b02.dbr"}

local secretChestB02Spawned = false

function gd.dungeonChests.secretChests.secretB02OnAddToWorld(objectId)

	if Server then
		local player = Game.GetLocalPlayer()
		if (not secretChestB02Spawned && player:GetLevel() > 2) then
			secretChestB02Spawned = true
			
			local userdata = {}
			TokenStateBasedObjectSwap(objectId, userdata, secretChestB02StateObjects)
			
			Shared.setUserdata(objectId, userdata)
		
		end
			
	end
	
end

gd.dungeonChests.secretChests.secretB02OnDestroy = ClearObjectUserdata

function gd.dungeonChests.secretChests.secretB02ChestFound()

	GiveTokenToLocalPlayer("SECRETCHEST_B02")
	
end


-- Secret Chest B03
local secretChestB03StateObjects = orderedTable()
	secretChestB03StateObjects["SECRETCHEST_B03"	] = { state = ChestState.Looted, dbr = "records/items/lootchests/b01_chestmetal01.dbr"}
	secretChestB03StateObjects[""					 	] = { state = ChestState.Default, dbr = "records/items/lootchests/secretchests/secretchest_b03.dbr"}

local secretChestB03Spawned = false

function gd.dungeonChests.secretChests.secretB03OnAddToWorld(objectId)

	if Server then
		local player = Game.GetLocalPlayer()
		if (not secretChestB03Spawned && player:GetLevel() > 2) then
			secretChestB03Spawned = true
			
			local userdata = {}
			TokenStateBasedObjectSwap(objectId, userdata, secretChestB03StateObjects)
			
			Shared.setUserdata(objectId, userdata)
		
		end
			
	end
	
end

gd.dungeonChests.secretChests.secretB03OnDestroy = ClearObjectUserdata

function gd.dungeonChests.secretChests.secretB03ChestFound()

	GiveTokenToLocalPlayer("SECRETCHEST_B03")
	
end


-- Secret Chest B04
local secretChestB04StateObjects = orderedTable()
	secretChestB04StateObjects["SECRETCHEST_B04"	] = { state = ChestState.Looted, dbr = "records/items/lootchests/b01_chestmetal01.dbr"}
	secretChestB04StateObjects[""					 	] = { state = ChestState.Default, dbr = "records/items/lootchests/secretchests/secretchest_b04.dbr"}

local secretChestB04Spawned = false

function gd.dungeonChests.secretChests.secretB04OnAddToWorld(objectId)

	if Server then
		local player = Game.GetLocalPlayer()
		if (not secretChestB04Spawned && player:GetLevel() > 2) then
			secretChestB04Spawned = true
			
			local userdata = {}
			TokenStateBasedObjectSwap(objectId, userdata, secretChestB04StateObjects)
			
			Shared.setUserdata(objectId, userdata)
		
		end
			
	end
	
end

gd.dungeonChests.secretChests.secretB04OnDestroy = ClearObjectUserdata

function gd.dungeonChests.secretChests.secretB04ChestFound()

	GiveTokenToLocalPlayer("SECRETCHEST_B04")
	
end


-- Secret Chest B05
local secretChestB05StateObjects = orderedTable()
	secretChestB05StateObjects["SECRETCHEST_B05"	] = { state = ChestState.Looted, dbr = "records/items/lootchests/b01_chestcorpse01.dbr"}
	secretChestB05StateObjects[""					 	] = { state = ChestState.Default, dbr = "records/items/lootchests/secretchests/secretchest_b05.dbr"}

local secretChestB05Spawned = false

function gd.dungeonChests.secretChests.secretB05OnAddToWorld(objectId)

	if Server then
		local player = Game.GetLocalPlayer()
		if (not secretChestB05Spawned && player:GetLevel() > 2) then
			secretChestB05Spawned = true
			
			local userdata = {}
			TokenStateBasedObjectSwap(objectId, userdata, secretChestB05StateObjects)
			
			Shared.setUserdata(objectId, userdata)
		
		end
			
	end
	
end

gd.dungeonChests.secretChests.secretB05OnDestroy = ClearObjectUserdata

function gd.dungeonChests.secretChests.secretB05ChestFound()

	GiveTokenToLocalPlayer("SECRETCHEST_B05")
	
end


-- Secret Chest B06
local secretChestB06StateObjects = orderedTable()
	secretChestB06StateObjects["SECRETCHEST_B06"	] = { state = ChestState.Looted, dbr = "records/items/lootchests/b01_chestmetal01.dbr"}
	secretChestB06StateObjects[""					 	] = { state = ChestState.Default, dbr = "records/items/lootchests/secretchests/secretchest_b06.dbr"}

local secretChestB06Spawned = false

function gd.dungeonChests.secretChests.secretB06OnAddToWorld(objectId)

	if Server then
		local player = Game.GetLocalPlayer()
		if (not secretChestB06Spawned && player:GetLevel() > 2) then
			secretChestB06Spawned = true
			
			local userdata = {}
			TokenStateBasedObjectSwap(objectId, userdata, secretChestB06StateObjects)
			
			Shared.setUserdata(objectId, userdata)
		
		end
			
	end
	
end

gd.dungeonChests.secretChests.secretB06OnDestroy = ClearObjectUserdata

function gd.dungeonChests.secretChests.secretB06ChestFound()

	GiveTokenToLocalPlayer("SECRETCHEST_B06")
	
end


-- Secret Chest B07
local secretChestB07StateObjects = orderedTable()
	secretChestB07StateObjects["SECRETCHEST_B07"	] = { state = ChestState.Looted, dbr = "records/items/lootchests/b01_chestmetal01.dbr"}
	secretChestB07StateObjects[""					 	] = { state = ChestState.Default, dbr = "records/items/lootchests/secretchests/secretchest_b07.dbr"}

local secretChestB07Spawned = false

function gd.dungeonChests.secretChests.secretB07OnAddToWorld(objectId)

	if Server then
		local player = Game.GetLocalPlayer()
		if (not secretChestB07Spawned && player:GetLevel() > 2) then
			secretChestB07Spawned = true
			
			local userdata = {}
			TokenStateBasedObjectSwap(objectId, userdata, secretChestB07StateObjects)
			
			Shared.setUserdata(objectId, userdata)
		
		end
			
	end
	
end

gd.dungeonChests.secretChests.secretB07OnDestroy = ClearObjectUserdata

function gd.dungeonChests.secretChests.secretB07ChestFound()

	GiveTokenToLocalPlayer("SECRETCHEST_B07")
	
end


-- Secret Chest B08
local secretChestB08StateObjects = orderedTable()
	secretChestB08StateObjects["SECRETCHEST_B08"	] = { state = ChestState.Looted, dbr = "records/items/lootchests/b01_chestmetal01.dbr"}
	secretChestB08StateObjects[""					 	] = { state = ChestState.Default, dbr = "records/items/lootchests/secretchests/secretchest_b08.dbr"}

local secretChestB08Spawned = false

function gd.dungeonChests.secretChests.secretB08OnAddToWorld(objectId)

	if Server then
		local player = Game.GetLocalPlayer()
		if (not secretChestB08Spawned && player:GetLevel() > 2) then
			secretChestB08Spawned = true
			
			local userdata = {}
			TokenStateBasedObjectSwap(objectId, userdata, secretChestB08StateObjects)
			
			Shared.setUserdata(objectId, userdata)
		
		end
			
	end
	
end

gd.dungeonChests.secretChests.secretB08OnDestroy = ClearObjectUserdata

function gd.dungeonChests.secretChests.secretB08ChestFound()

	GiveTokenToLocalPlayer("SECRETCHEST_B08")
	
end


-- Secret Chest B09
local secretChestB09StateObjects = orderedTable()
	secretChestB09StateObjects["SECRETCHEST_B09"	] = { state = ChestState.Looted, dbr = "records/items/lootchests/b01_chestmetal01.dbr"}
	secretChestB09StateObjects[""					 	] = { state = ChestState.Default, dbr = "records/items/lootchests/secretchests/secretchest_b09.dbr"}

local secretChestB09Spawned = false

function gd.dungeonChests.secretChests.secretB09OnAddToWorld(objectId)

	if Server then
		local player = Game.GetLocalPlayer()
		if (not secretChestB09Spawned && player:GetLevel() > 2) then
			secretChestB09Spawned = true
			
			local userdata = {}
			TokenStateBasedObjectSwap(objectId, userdata, secretChestB09StateObjects)
			
			Shared.setUserdata(objectId, userdata)
		
		end
			
	end
	
end

gd.dungeonChests.secretChests.secretB09OnDestroy = ClearObjectUserdata

function gd.dungeonChests.secretChests.secretB09ChestFound()

	GiveTokenToLocalPlayer("SECRETCHEST_B09")
	
end


-- Secret Chest B10
local secretChestB10StateObjects = orderedTable()
	secretChestB10StateObjects["SECRETCHEST_B10"	] = { state = ChestState.Looted, dbr = "records/items/lootchests/b01_chestmetal01.dbr"}
	secretChestB10StateObjects[""					 	] = { state = ChestState.Default, dbr = "records/items/lootchests/secretchests/secretchest_b10.dbr"}

local secretChestB10Spawned = false

function gd.dungeonChests.secretChests.secretB10OnAddToWorld(objectId)

	if Server then
		local player = Game.GetLocalPlayer()
		if (not secretChestB10Spawned && player:GetLevel() > 2) then
			secretChestB10Spawned = true
			
			local userdata = {}
			TokenStateBasedObjectSwap(objectId, userdata, secretChestB10StateObjects)
			
			Shared.setUserdata(objectId, userdata)
		
		end
			
	end
	
end

gd.dungeonChests.secretChests.secretB10OnDestroy = ClearObjectUserdata

function gd.dungeonChests.secretChests.secretB10ChestFound()

	GiveTokenToLocalPlayer("SECRETCHEST_B10")
	
end


-- Secret Chest B11
local secretChestB11StateObjects = orderedTable()
	secretChestB11StateObjects["SECRETCHEST_B11"	] = { state = ChestState.Looted, dbr = "records/items/lootchests/b01_chestmetal01.dbr"}
	secretChestB11StateObjects[""					 	] = { state = ChestState.Default, dbr = "records/items/lootchests/secretchests/secretchest_b11.dbr"}

local secretChestB11Spawned = false

function gd.dungeonChests.secretChests.secretB11OnAddToWorld(objectId)

	if Server then
		local player = Game.GetLocalPlayer()
		if (not secretChestB11Spawned && player:GetLevel() > 2) then
			secretChestB11Spawned = true
			
			local userdata = {}
			TokenStateBasedObjectSwap(objectId, userdata, secretChestB11StateObjects)
			
			Shared.setUserdata(objectId, userdata)
		
		end
			
	end
	
end

gd.dungeonChests.secretChests.secretB11OnDestroy = ClearObjectUserdata

function gd.dungeonChests.secretChests.secretB11ChestFound()

	GiveTokenToLocalPlayer("SECRETCHEST_B11")
	
end


-- Secret Chest B12
local secretChestB12StateObjects = orderedTable()
	secretChestB12StateObjects["SECRETCHEST_B12"	] = { state = ChestState.Looted, dbr = "records/items/lootchests/b01_chestmetal01.dbr"}
	secretChestB12StateObjects[""					 	] = { state = ChestState.Default, dbr = "records/items/lootchests/secretchests/secretchest_b12.dbr"}

local secretChestB12Spawned = false

function gd.dungeonChests.secretChests.secretB12OnAddToWorld(objectId)

	if Server then
		local player = Game.GetLocalPlayer()
		if (not secretChestB12Spawned && player:GetLevel() > 2) then
			secretChestB12Spawned = true
			
			local userdata = {}
			TokenStateBasedObjectSwap(objectId, userdata, secretChestB12StateObjects)
			
			Shared.setUserdata(objectId, userdata)
		
		end
			
	end
	
end

gd.dungeonChests.secretChests.secretB12OnDestroy = ClearObjectUserdata

function gd.dungeonChests.secretChests.secretB12ChestFound()

	GiveTokenToLocalPlayer("SECRETCHEST_B12")
	
end


-- Secret Chest B13
local secretChestB13StateObjects = orderedTable()
	secretChestB13StateObjects["SECRETCHEST_B13"	] = { state = ChestState.Looted, dbr = "records/items/lootchests/b01_chestmetal01.dbr"}
	secretChestB13StateObjects[""					 	] = { state = ChestState.Default, dbr = "records/items/lootchests/secretchests/secretchest_b13.dbr"}

local secretChestB13Spawned = false

function gd.dungeonChests.secretChests.secretB13OnAddToWorld(objectId)

	if Server then
		local player = Game.GetLocalPlayer()
		if (not secretChestB13Spawned && player:GetLevel() > 2) then
			secretChestB13Spawned = true
			
			local userdata = {}
			TokenStateBasedObjectSwap(objectId, userdata, secretChestB13StateObjects)
			
			Shared.setUserdata(objectId, userdata)
		
		end
			
	end
	
end

gd.dungeonChests.secretChests.secretB13OnDestroy = ClearObjectUserdata

function gd.dungeonChests.secretChests.secretB13ChestFound()

	GiveTokenToLocalPlayer("SECRETCHEST_B13")
	
end


-- Secret Chest B14
local secretChestB14StateObjects = orderedTable()
	secretChestB14StateObjects["SECRETCHEST_B14"	] = { state = ChestState.Looted, dbr = "records/items/lootchests/b01_chestmetal01.dbr"}
	secretChestB14StateObjects[""					 	] = { state = ChestState.Default, dbr = "records/items/lootchests/secretchests/secretchest_b14.dbr"}

local secretChestB14Spawned = false

function gd.dungeonChests.secretChests.secretB14OnAddToWorld(objectId)

	if Server then
		local player = Game.GetLocalPlayer()
		if (not secretChestB14Spawned && player:GetLevel() > 2) then
			secretChestB14Spawned = true
			
			local userdata = {}
			TokenStateBasedObjectSwap(objectId, userdata, secretChestB14StateObjects)
			
			Shared.setUserdata(objectId, userdata)
		
		end
			
	end
	
end

gd.dungeonChests.secretChests.secretB14OnDestroy = ClearObjectUserdata

function gd.dungeonChests.secretChests.secretB14ChestFound()

	GiveTokenToLocalPlayer("SECRETCHEST_B14")
	
end


-- Secret Chest B15
local secretChestB15StateObjects = orderedTable()
	secretChestB15StateObjects["SECRETCHEST_B15"	] = { state = ChestState.Looted, dbr = "records/items/lootchests/b01_chestmetal01.dbr"}
	secretChestB15StateObjects[""					 	] = { state = ChestState.Default, dbr = "records/items/lootchests/secretchests/secretchest_b15.dbr"}

local secretChestB15Spawned = false

function gd.dungeonChests.secretChests.secretB15OnAddToWorld(objectId)

	if Server then
		local player = Game.GetLocalPlayer()
		if (not secretChestB15Spawned && player:GetLevel() > 2) then
			secretChestB15Spawned = true
			
			local userdata = {}
			TokenStateBasedObjectSwap(objectId, userdata, secretChestB15StateObjects)
			
			Shared.setUserdata(objectId, userdata)
		
		end
			
	end
	
end

gd.dungeonChests.secretChests.secretB15OnDestroy = ClearObjectUserdata

function gd.dungeonChests.secretChests.secretB15ChestFound()

	GiveTokenToLocalPlayer("SECRETCHEST_B15")
	
end


-- Secret Chest B16
local secretChestB16StateObjects = orderedTable()
	secretChestB16StateObjects["SECRETCHEST_B16"	] = { state = ChestState.Looted, dbr = "records/items/lootchests/b01_chestmetal01.dbr"}
	secretChestB16StateObjects[""					 	] = { state = ChestState.Default, dbr = "records/items/lootchests/secretchests/secretchest_b16.dbr"}

local secretChestB16Spawned = false

function gd.dungeonChests.secretChests.secretB16OnAddToWorld(objectId)

	if Server then
		local player = Game.GetLocalPlayer()
		if (not secretChestB16Spawned && player:GetLevel() > 2) then
			secretChestB16Spawned = true
			
			local userdata = {}
			TokenStateBasedObjectSwap(objectId, userdata, secretChestB16StateObjects)
			
			Shared.setUserdata(objectId, userdata)
		
		end
			
	end
	
end

gd.dungeonChests.secretChests.secretB16OnDestroy = ClearObjectUserdata

function gd.dungeonChests.secretChests.secretB16ChestFound()

	GiveTokenToLocalPlayer("SECRETCHEST_B16")
	
end


-- Secret Chest B17
local secretChestB17StateObjects = orderedTable()
	secretChestB17StateObjects["SECRETCHEST_B17"	] = { state = ChestState.Looted, dbr = "records/items/lootchests/b01_chestmetal01.dbr"}
	secretChestB17StateObjects[""					 	] = { state = ChestState.Default, dbr = "records/items/lootchests/secretchests/secretchest_b17.dbr"}

local secretChestB17Spawned = false

function gd.dungeonChests.secretChests.secretB17OnAddToWorld(objectId)

	if Server then
		local player = Game.GetLocalPlayer()
		if (not secretChestB17Spawned && player:GetLevel() > 2) then
			secretChestB17Spawned = true
			
			local userdata = {}
			TokenStateBasedObjectSwap(objectId, userdata, secretChestB17StateObjects)
			
			Shared.setUserdata(objectId, userdata)
		
		end
			
	end
	
end

gd.dungeonChests.secretChests.secretB17OnDestroy = ClearObjectUserdata

function gd.dungeonChests.secretChests.secretB17ChestFound()

	GiveTokenToLocalPlayer("SECRETCHEST_B17")
	
end


-- Secret Chest B18
local secretChestB18StateObjects = orderedTable()
	secretChestB18StateObjects["SECRETCHEST_B18"	] = { state = ChestState.Looted, dbr = "records/items/lootchests/b01_chestcorpse01.dbr"}
	secretChestB18StateObjects[""					 	] = { state = ChestState.Default, dbr = "records/items/lootchests/secretchests/secretchest_b18.dbr"}

local secretChestB18Spawned = false

function gd.dungeonChests.secretChests.secretB18OnAddToWorld(objectId)

	if Server then
		local player = Game.GetLocalPlayer()
		if (not secretChestB18Spawned && player:GetLevel() > 2) then
			secretChestB18Spawned = true
			
			local userdata = {}
			TokenStateBasedObjectSwap(objectId, userdata, secretChestB18StateObjects)
			
			Shared.setUserdata(objectId, userdata)
		
		end
			
	end
	
end

gd.dungeonChests.secretChests.secretB18OnDestroy = ClearObjectUserdata

function gd.dungeonChests.secretChests.secretB18ChestFound()

	GiveTokenToLocalPlayer("SECRETCHEST_B18")
	
end


-- Secret Chest B19
local secretChestB19StateObjects = orderedTable()
	secretChestB19StateObjects["SECRETCHEST_B19"	] = { state = ChestState.Looted, dbr = "records/items/lootchests/b01_chestmetal01.dbr"}
	secretChestB19StateObjects[""					 	] = { state = ChestState.Default, dbr = "records/items/lootchests/secretchests/secretchest_b19.dbr"}

local secretChestB19Spawned = false

function gd.dungeonChests.secretChests.secretB19OnAddToWorld(objectId)

	if Server then
		local player = Game.GetLocalPlayer()
		if (not secretChestB19Spawned && player:GetLevel() > 2) then
			secretChestB19Spawned = true
			
			local userdata = {}
			TokenStateBasedObjectSwap(objectId, userdata, secretChestB19StateObjects)
			
			Shared.setUserdata(objectId, userdata)
		
		end
			
	end
	
end

gd.dungeonChests.secretChests.secretB19OnDestroy = ClearObjectUserdata

function gd.dungeonChests.secretChests.secretB19ChestFound()

	GiveTokenToLocalPlayer("SECRETCHEST_B19")
	
end


-- Secret Chest B20
local secretChestB20StateObjects = orderedTable()
	secretChestB20StateObjects["SECRETCHEST_B20"	] = { state = ChestState.Looted, dbr = "records/items/lootchests/b01_chestmetal01.dbr"}
	secretChestB20StateObjects[""					 	] = { state = ChestState.Default, dbr = "records/items/lootchests/secretchests/secretchest_b20.dbr"}

local secretChestB20Spawned = false

function gd.dungeonChests.secretChests.secretB20OnAddToWorld(objectId)

	if Server then
		local player = Game.GetLocalPlayer()
		if (not secretChestB20Spawned && player:GetLevel() > 2) then
			secretChestB20Spawned = true
			
			local userdata = {}
			TokenStateBasedObjectSwap(objectId, userdata, secretChestB20StateObjects)
			
			Shared.setUserdata(objectId, userdata)
		
		end
			
	end
	
end

gd.dungeonChests.secretChests.secretB20OnDestroy = ClearObjectUserdata

function gd.dungeonChests.secretChests.secretB20ChestFound()

	GiveTokenToLocalPlayer("SECRETCHEST_B20")
	
end


-- Secret Chest B21
local secretChestB21StateObjects = orderedTable()
	secretChestB21StateObjects["SECRETCHEST_B21"	] = { state = ChestState.Looted, dbr = "records/items/lootchests/b01_chestmetal01.dbr"}
	secretChestB21StateObjects[""					 	] = { state = ChestState.Default, dbr = "records/items/lootchests/secretchests/secretchest_b21.dbr"}

local secretChestB21Spawned = false

function gd.dungeonChests.secretChests.secretB21OnAddToWorld(objectId)

	if Server then
		local player = Game.GetLocalPlayer()
		if (not secretChestB21Spawned && player:GetLevel() > 2) then
			secretChestB21Spawned = true
			
			local userdata = {}
			TokenStateBasedObjectSwap(objectId, userdata, secretChestB21StateObjects)
			
			Shared.setUserdata(objectId, userdata)
		
		end
			
	end
	
end

gd.dungeonChests.secretChests.secretB21OnDestroy = ClearObjectUserdata

function gd.dungeonChests.secretChests.secretB21ChestFound()

	GiveTokenToLocalPlayer("SECRETCHEST_B21")
	
end


-- Secret Chest C01
local secretChestC01StateObjects = orderedTable()
	secretChestC01StateObjects["SECRETCHEST_C01"	] = { state = ChestState.Looted, dbr = "records/items/lootchests/b01_chestmetal01.dbr"}
	secretChestC01StateObjects[""					 	] = { state = ChestState.Default, dbr = "records/items/lootchests/secretchests/secretchest_c01.dbr"}

local secretChestC01Spawned = false

function gd.dungeonChests.secretChests.secretC01OnAddToWorld(objectId)

	if Server then
		local player = Game.GetLocalPlayer()
		if (not secretChestC01Spawned && player:GetLevel() > 2) then
			secretChestC01Spawned = true
			
			local userdata = {}
			TokenStateBasedObjectSwap(objectId, userdata, secretChestC01StateObjects)
			
			Shared.setUserdata(objectId, userdata)
		
		end
			
	end
	
end

gd.dungeonChests.secretChests.secretC01OnDestroy = ClearObjectUserdata

function gd.dungeonChests.secretChests.secretC01ChestFound()

	GiveTokenToLocalPlayer("SECRETCHEST_C01")
	
end


-- Secret Chest C02
local secretChestC02StateObjects = orderedTable()
	secretChestC02StateObjects["SECRETCHEST_C02"	] = { state = ChestState.Looted, dbr = "records/items/lootchests/b01_chestmetal01.dbr"}
	secretChestC02StateObjects[""					 	] = { state = ChestState.Default, dbr = "records/items/lootchests/secretchests/secretchest_c02.dbr"}

local secretChestC02Spawned = false

function gd.dungeonChests.secretChests.secretC02OnAddToWorld(objectId)

	if Server then
		local player = Game.GetLocalPlayer()
		if (not secretChestC02Spawned && player:GetLevel() > 2) then
			secretChestC02Spawned = true
			
			local userdata = {}
			TokenStateBasedObjectSwap(objectId, userdata, secretChestC02StateObjects)
			
			Shared.setUserdata(objectId, userdata)
		
		end
			
	end
	
end

gd.dungeonChests.secretChests.secretC02OnDestroy = ClearObjectUserdata

function gd.dungeonChests.secretChests.secretC02ChestFound()

	GiveTokenToLocalPlayer("SECRETCHEST_C02")
	
end


-- Secret Chest C03
local secretChestC03StateObjects = orderedTable()
	secretChestC03StateObjects["SECRETCHEST_C03"	] = { state = ChestState.Looted, dbr = "records/items/lootchests/b01_chestmetal01.dbr"}
	secretChestC03StateObjects[""					 	] = { state = ChestState.Default, dbr = "records/items/lootchests/secretchests/secretchest_c03.dbr"}

local secretChestC03Spawned = false

function gd.dungeonChests.secretChests.secretC03OnAddToWorld(objectId)

	if Server then
		local player = Game.GetLocalPlayer()
		if (not secretChestC03Spawned && player:GetLevel() > 2) then
			secretChestC03Spawned = true
			
			local userdata = {}
			TokenStateBasedObjectSwap(objectId, userdata, secretChestC03StateObjects)
			
			Shared.setUserdata(objectId, userdata)
		
		end
			
	end
	
end

gd.dungeonChests.secretChests.secretC03OnDestroy = ClearObjectUserdata

function gd.dungeonChests.secretChests.secretC03ChestFound()

	GiveTokenToLocalPlayer("SECRETCHEST_C03")
	
end


-- Secret Chest C04
local secretChestC04StateObjects = orderedTable()
	secretChestC04StateObjects["SECRETCHEST_C04"	] = { state = ChestState.Looted, dbr = "records/items/lootchests/b01_chestcorpse01.dbr"}
	secretChestC04StateObjects[""					 	] = { state = ChestState.Default, dbr = "records/items/lootchests/secretchests/secretchest_c04.dbr"}

local secretChestC04Spawned = false

function gd.dungeonChests.secretChests.secretC04OnAddToWorld(objectId)

	if Server then
		local player = Game.GetLocalPlayer()
		if (not secretChestC04Spawned && player:GetLevel() > 2) then
			secretChestC04Spawned = true
			
			local userdata = {}
			TokenStateBasedObjectSwap(objectId, userdata, secretChestC04StateObjects)
			
			Shared.setUserdata(objectId, userdata)
		
		end
			
	end
	
end

gd.dungeonChests.secretChests.secretC04OnDestroy = ClearObjectUserdata

function gd.dungeonChests.secretChests.secretC04ChestFound()

	GiveTokenToLocalPlayer("SECRETCHEST_C04")
	
end


-- Secret Chest C05
local secretChestC05StateObjects = orderedTable()
	secretChestC05StateObjects["SECRETCHEST_C05"	] = { state = ChestState.Looted, dbr = "records/items/lootchests/b01_chestmetal01.dbr"}
	secretChestC05StateObjects[""					 	] = { state = ChestState.Default, dbr = "records/items/lootchests/secretchests/secretchest_c05.dbr"}

local secretChestC05Spawned = false

function gd.dungeonChests.secretChests.secretC05OnAddToWorld(objectId)

	if Server then
		local player = Game.GetLocalPlayer()
		if (not secretChestC05Spawned && player:GetLevel() > 2) then
			secretChestC05Spawned = true
			
			local userdata = {}
			TokenStateBasedObjectSwap(objectId, userdata, secretChestC05StateObjects)
			
			Shared.setUserdata(objectId, userdata)
		
		end
			
	end
	
end

gd.dungeonChests.secretChests.secretC05OnDestroy = ClearObjectUserdata

function gd.dungeonChests.secretChests.secretC05ChestFound()

	GiveTokenToLocalPlayer("SECRETCHEST_C05")
	
end


-- Secret Chest C06
local secretChestC06StateObjects = orderedTable()
	secretChestC06StateObjects["SECRETCHEST_C06"	] = { state = ChestState.Looted, dbr = "records/items/lootchests/b01_chestmetal01.dbr"}
	secretChestC06StateObjects[""					 	] = { state = ChestState.Default, dbr = "records/items/lootchests/secretchests/secretchest_c06.dbr"}

local secretChestC06Spawned = false

function gd.dungeonChests.secretChests.secretC06OnAddToWorld(objectId)

	if Server then
		local player = Game.GetLocalPlayer()
		if (not secretChestC06Spawned && player:GetLevel() > 2) then
			secretChestC06Spawned = true
			
			local userdata = {}
			TokenStateBasedObjectSwap(objectId, userdata, secretChestC06StateObjects)
			
			Shared.setUserdata(objectId, userdata)
		
		end
			
	end
	
end

gd.dungeonChests.secretChests.secretC06OnDestroy = ClearObjectUserdata

function gd.dungeonChests.secretChests.secretC06ChestFound()

	GiveTokenToLocalPlayer("SECRETCHEST_C06")
	
end


-- Secret Chest C07
local secretChestC07StateObjects = orderedTable()
	secretChestC07StateObjects["SECRETCHEST_C07"	] = { state = ChestState.Looted, dbr = "records/items/lootchests/b01_chestmetal01.dbr"}
	secretChestC07StateObjects[""					 	] = { state = ChestState.Default, dbr = "records/items/lootchests/secretchests/secretchest_c07.dbr"}

local secretChestC07Spawned = false

function gd.dungeonChests.secretChests.secretC07OnAddToWorld(objectId)

	if Server then
		local player = Game.GetLocalPlayer()
		if (not secretChestC07Spawned && player:GetLevel() > 2) then
			secretChestC07Spawned = true
			
			local userdata = {}
			TokenStateBasedObjectSwap(objectId, userdata, secretChestC07StateObjects)
			
			Shared.setUserdata(objectId, userdata)
		
		end
		
	end
	
end

gd.dungeonChests.secretChests.secretC07OnDestroy = ClearObjectUserdata

function gd.dungeonChests.secretChests.secretC07ChestFound()

	GiveTokenToLocalPlayer("SECRETCHEST_C07")
	
end


-- Secret Chest C08
local secretChestC08StateObjects = orderedTable()
	secretChestC08StateObjects["SECRETCHEST_C08"	] = { state = ChestState.Looted, dbr = "records/items/lootchests/b01_chestmetal01.dbr"}
	secretChestC08StateObjects[""					 	] = { state = ChestState.Default, dbr = "records/items/lootchests/secretchests/secretchest_c08.dbr"}

local secretChestC08Spawned = false

function gd.dungeonChests.secretChests.secretC08OnAddToWorld(objectId)

	if Server then
		local player = Game.GetLocalPlayer()
		if (not secretChestC08Spawned && player:GetLevel() > 2) then
			secretChestC08Spawned = true
			
			local userdata = {}
			TokenStateBasedObjectSwap(objectId, userdata, secretChestC08StateObjects)
			
			Shared.setUserdata(objectId, userdata)
		
		end
		
	end
	
end

gd.dungeonChests.secretChests.secretC08OnDestroy = ClearObjectUserdata

function gd.dungeonChests.secretChests.secretC08ChestFound()

	GiveTokenToLocalPlayer("SECRETCHEST_C08")
	
end


-- Secret Chest C09
local secretChestC09StateObjects = orderedTable()
	secretChestC09StateObjects["SECRETCHEST_C09"	] = { state = ChestState.Looted, dbr = "records/items/lootchests/b01_chestmetal01.dbr"}
	secretChestC09StateObjects[""					 	] = { state = ChestState.Default, dbr = "records/items/lootchests/secretchests/secretchest_c09.dbr"}

local secretChestC09Spawned = false

function gd.dungeonChests.secretChests.secretC09OnAddToWorld(objectId)

	if Server then
		local player = Game.GetLocalPlayer()
		if (not secretChestC09Spawned && player:GetLevel() > 2) then
			secretChestC09Spawned = true
			
			local userdata = {}
			TokenStateBasedObjectSwap(objectId, userdata, secretChestC09StateObjects)
			
			Shared.setUserdata(objectId, userdata)
		
		end
			
	end
	
end

gd.dungeonChests.secretChests.secretC09OnDestroy = ClearObjectUserdata

function gd.dungeonChests.secretChests.secretC09ChestFound()

	GiveTokenToLocalPlayer("SECRETCHEST_C09")
	
end


-- Secret Chest C10
local secretChestC10StateObjects = orderedTable()
	secretChestC10StateObjects["SECRETCHEST_C10"	] = { state = ChestState.Looted, dbr = "records/items/lootchests/b01_chestmetal01.dbr"}
	secretChestC10StateObjects[""					 	] = { state = ChestState.Default, dbr = "records/items/lootchests/secretchests/secretchest_c10.dbr"}

local secretChestC10Spawned = false

function gd.dungeonChests.secretChests.secretC10OnAddToWorld(objectId)

	if Server then
		local player = Game.GetLocalPlayer()
		if (not secretChestC10Spawned && player:GetLevel() > 2) then
			secretChestC10Spawned = true
			
			local userdata = {}
			TokenStateBasedObjectSwap(objectId, userdata, secretChestC10StateObjects)
			
			Shared.setUserdata(objectId, userdata)
		
		end
			
	end
	
end

gd.dungeonChests.secretChests.secretC10OnDestroy = ClearObjectUserdata

function gd.dungeonChests.secretChests.secretC10ChestFound()

	GiveTokenToLocalPlayer("SECRETCHEST_C10")
	
end


-- Secret Chest C11
local secretChestC11StateObjects = orderedTable()
	secretChestC11StateObjects["SECRETCHEST_C11"	] = { state = ChestState.Looted, dbr = "records/items/lootchests/b01_chestmetal01.dbr"}
	secretChestC11StateObjects[""					 	] = { state = ChestState.Default, dbr = "records/items/lootchests/secretchests/secretchest_c11.dbr"}

local secretChestC11Spawned = false

function gd.dungeonChests.secretChests.secretC11OnAddToWorld(objectId)

	if Server then
		local player = Game.GetLocalPlayer()
		if (not secretChestC11Spawned && player:GetLevel() > 2) then
			secretChestC11Spawned = true
			
			local userdata = {}
			TokenStateBasedObjectSwap(objectId, userdata, secretChestC11StateObjects)
			
			Shared.setUserdata(objectId, userdata)
		
		end
			
	end
	
end

gd.dungeonChests.secretChests.secretC11OnDestroy = ClearObjectUserdata

function gd.dungeonChests.secretChests.secretC11ChestFound()

	GiveTokenToLocalPlayer("SECRETCHEST_C11")
	
end


-- Secret Chest C12
local secretChestC12StateObjects = orderedTable()
	secretChestC12StateObjects["SECRETCHEST_C12"	] = { state = ChestState.Looted, dbr = "records/items/lootchests/b01_chestmetal01.dbr"}
	secretChestC12StateObjects[""					 	] = { state = ChestState.Default, dbr = "records/items/lootchests/secretchests/secretchest_c12.dbr"}

local secretChestC12Spawned = false

function gd.dungeonChests.secretChests.secretC12OnAddToWorld(objectId)

	if Server then
		local player = Game.GetLocalPlayer()
		if (not secretChestC12Spawned && player:GetLevel() > 2) then
			secretChestC12Spawned = true
			
			local userdata = {}
			TokenStateBasedObjectSwap(objectId, userdata, secretChestC12StateObjects)
			
			Shared.setUserdata(objectId, userdata)
		
		end
			
	end
	
end

gd.dungeonChests.secretChests.secretC12OnDestroy = ClearObjectUserdata

function gd.dungeonChests.secretChests.secretC12ChestFound()

	GiveTokenToLocalPlayer("SECRETCHEST_C12")
	
end


-- Secret Chest C13
local secretChestC13StateObjects = orderedTable()
	secretChestC13StateObjects["SECRETCHEST_C13"	] = { state = ChestState.Looted, dbr = "records/items/lootchests/b01_chestmetal01.dbr"}
	secretChestC13StateObjects[""					 	] = { state = ChestState.Default, dbr = "records/items/lootchests/secretchests/secretchest_c13.dbr"}

local secretChestC13Spawned = false

function gd.dungeonChests.secretChests.secretC13OnAddToWorld(objectId)

	if Server then
		local player = Game.GetLocalPlayer()
		if (not secretChestC13Spawned && player:GetLevel() > 2) then
			secretChestC13Spawned = true
			
			local userdata = {}
			TokenStateBasedObjectSwap(objectId, userdata, secretChestC13StateObjects)
			
			Shared.setUserdata(objectId, userdata)
		
		end
			
	end
	
end

gd.dungeonChests.secretChests.secretC13OnDestroy = ClearObjectUserdata

function gd.dungeonChests.secretChests.secretC13ChestFound()

	GiveTokenToLocalPlayer("SECRETCHEST_C13")
	
end


-- Secret Chest D01
local secretChestD01StateObjects = orderedTable()
	secretChestD01StateObjects["SECRETCHEST_D01"	] = { state = ChestState.Looted, dbr = "records/items/lootchests/b01_chestmetal01.dbr"}
	secretChestD01StateObjects[""					 	] = { state = ChestState.Default, dbr = "records/items/lootchests/secretchests/secretchest_d01.dbr"}

local secretChestD01Spawned = false

function gd.dungeonChests.secretChests.secretD01OnAddToWorld(objectId)

	if Server then
		local player = Game.GetLocalPlayer()
		if (not secretChestD01Spawned && player:GetLevel() > 2) then
			secretChestD01Spawned = true
			
			local userdata = {}
			TokenStateBasedObjectSwap(objectId, userdata, secretChestD01StateObjects)
			
			Shared.setUserdata(objectId, userdata)
		
		end
			
	end
	
end

gd.dungeonChests.secretChests.secretD01OnDestroy = ClearObjectUserdata

function gd.dungeonChests.secretChests.secretD01ChestFound()

	GiveTokenToLocalPlayer("SECRETCHEST_D01")
	
end


-- Secret Chest D02
local secretChestD02StateObjects = orderedTable()
	secretChestD02StateObjects["SECRETCHEST_D02"	] = { state = ChestState.Looted, dbr = "records/items/lootchests/b01_chestmetal01.dbr"}
	secretChestD02StateObjects[""					 	] = { state = ChestState.Default, dbr = "records/items/lootchests/secretchests/secretchest_d02.dbr"}

local secretChestD02Spawned = false

function gd.dungeonChests.secretChests.secretD02OnAddToWorld(objectId)

	if Server then
		local player = Game.GetLocalPlayer()
		if (not secretChestD02Spawned && player:GetLevel() > 2) then
			secretChestD02Spawned = true
			
			local userdata = {}
			TokenStateBasedObjectSwap(objectId, userdata, secretChestD02StateObjects)
			
			Shared.setUserdata(objectId, userdata)
		
		end
			
	end
	
end

gd.dungeonChests.secretChests.secretD02OnDestroy = ClearObjectUserdata

function gd.dungeonChests.secretChests.secretD02ChestFound()

	GiveTokenToLocalPlayer("SECRETCHEST_D02")
	
end


-- Secret Chest D03
local secretChestD03StateObjects = orderedTable()
	secretChestD03StateObjects["SECRETCHEST_D03"	] = { state = ChestState.Looted, dbr = "records/items/lootchests/b01_chestmetal01.dbr"}
	secretChestD03StateObjects[""					 	] = { state = ChestState.Default, dbr = "records/items/lootchests/secretchests/secretchest_d03.dbr"}

local secretChestD03Spawned = false

function gd.dungeonChests.secretChests.secretD03OnAddToWorld(objectId)

	if Server then
		local player = Game.GetLocalPlayer()
		if (not secretChestD03Spawned && player:GetLevel() > 2) then
			secretChestD03Spawned = true
			
			local userdata = {}
			TokenStateBasedObjectSwap(objectId, userdata, secretChestD03StateObjects)
			
			Shared.setUserdata(objectId, userdata)
		
		end
			
	end
	
end

gd.dungeonChests.secretChests.secretD03OnDestroy = ClearObjectUserdata

function gd.dungeonChests.secretChests.secretD03ChestFound()

	GiveTokenToLocalPlayer("SECRETCHEST_D03")
	
end


-- Secret Chest D04
local secretChestD04StateObjects = orderedTable()
	secretChestD04StateObjects["SECRETCHEST_D04"	] = { state = ChestState.Looted, dbr = "records/items/lootchests/b01_chestmetal01.dbr"}
	secretChestD04StateObjects[""					 	] = { state = ChestState.Default, dbr = "records/items/lootchests/secretchests/secretchest_d04.dbr"}

local secretChestD04Spawned = false

function gd.dungeonChests.secretChests.secretD04OnAddToWorld(objectId)

	if Server then
		local player = Game.GetLocalPlayer()
		if (not secretChestD04Spawned && player:GetLevel() > 2) then
			secretChestD04Spawned = true
			
			local userdata = {}
			TokenStateBasedObjectSwap(objectId, userdata, secretChestD04StateObjects)
			
			Shared.setUserdata(objectId, userdata)
		
		end
			
	end
	
end

gd.dungeonChests.secretChests.secretD04OnDestroy = ClearObjectUserdata

function gd.dungeonChests.secretChests.secretD04ChestFound()

	GiveTokenToLocalPlayer("SECRETCHEST_D04")
	
end


-- Secret Chest D05
local secretChestD05StateObjects = orderedTable()
	secretChestD05StateObjects["SECRETCHEST_D05"	] = { state = ChestState.Looted, dbr = "records/items/lootchests/b01_chestmetal01.dbr"}
	secretChestD05StateObjects[""					 	] = { state = ChestState.Default, dbr = "records/items/lootchests/secretchests/secretchest_d05.dbr"}

local secretChestD05Spawned = false

function gd.dungeonChests.secretChests.secretD05OnAddToWorld(objectId)

	if Server then
		local player = Game.GetLocalPlayer()
		if (not secretChestD05Spawned && player:GetLevel() > 2) then
			secretChestD05Spawned = true
			
			local userdata = {}
			TokenStateBasedObjectSwap(objectId, userdata, secretChestD05StateObjects)
			
			Shared.setUserdata(objectId, userdata)
		
		end
			
	end
	
end

gd.dungeonChests.secretChests.secretD05OnDestroy = ClearObjectUserdata

function gd.dungeonChests.secretChests.secretD05ChestFound()

	GiveTokenToLocalPlayer("SECRETCHEST_D05")
	
end


-- Secret Chest D06
local secretChestD06StateObjects = orderedTable()
	secretChestD06StateObjects["SECRETCHEST_D06"	] = { state = ChestState.Looted, dbr = "records/items/lootchests/b01_obsidianshards01.dbr"}
	secretChestD06StateObjects[""					 	] = { state = ChestState.Default, dbr = "records/items/lootchests/secretchests/secretchest_d06.dbr"}

local secretChestD06Spawned = false

function gd.dungeonChests.secretChests.secretD06OnAddToWorld(objectId)

	if Server then
		local player = Game.GetLocalPlayer()
		if (not secretChestD06Spawned && player:GetLevel() > 2) then
			secretChestD06Spawned = true
			
			local userdata = {}
			TokenStateBasedObjectSwap(objectId, userdata, secretChestD06StateObjects)
			
			Shared.setUserdata(objectId, userdata)
		
		end
			
	end
	
end

gd.dungeonChests.secretChests.secretD06OnDestroy = ClearObjectUserdata

function gd.dungeonChests.secretChests.secretD06ChestFound()

	GiveTokenToLocalPlayer("SECRETCHEST_D06")
	
end


-- Secret Chest D07
local secretChestD07StateObjects = orderedTable()
	secretChestD07StateObjects["SECRETCHEST_D07"	] = { state = ChestState.Looted, dbr = "records/items/lootchests/b01_obsidianshards01.dbr"}
	secretChestD07StateObjects[""					 	] = { state = ChestState.Default, dbr = "records/items/lootchests/secretchests/secretchest_d07.dbr"}

local secretChestD07Spawned = false

function gd.dungeonChests.secretChests.secretD07OnAddToWorld(objectId)

	if Server then
		local player = Game.GetLocalPlayer()
		if (not secretChestD07Spawned && player:GetLevel() > 2) then
			secretChestD07Spawned = true
			
			local userdata = {}
			TokenStateBasedObjectSwap(objectId, userdata, secretChestD07StateObjects)
			
			Shared.setUserdata(objectId, userdata)
		
		end
			
	end
	
end

gd.dungeonChests.secretChests.secretD07OnDestroy = ClearObjectUserdata

function gd.dungeonChests.secretChests.secretD07ChestFound()

	GiveTokenToLocalPlayer("SECRETCHEST_D07")
	
end


-- Secret Chest D08
local secretChestD08StateObjects = orderedTable()
	secretChestD08StateObjects["SECRETCHEST_D08"	] = { state = ChestState.Looted, dbr = "records/items/lootchests/b01_obsidianshards01.dbr"}
	secretChestD08StateObjects[""					 	] = { state = ChestState.Default, dbr = "records/items/lootchests/secretchests/secretchest_d08.dbr"}

local secretChestD08Spawned = false

function gd.dungeonChests.secretChests.secretD08OnAddToWorld(objectId)

	if Server then
		local player = Game.GetLocalPlayer()
		if (not secretChestD08Spawned && player:GetLevel() > 2) then
			secretChestD08Spawned = true
			
			local userdata = {}
			TokenStateBasedObjectSwap(objectId, userdata, secretChestD08StateObjects)
			
			Shared.setUserdata(objectId, userdata)
		
		end
			
	end
	
end

gd.dungeonChests.secretChests.secretD08OnDestroy = ClearObjectUserdata

function gd.dungeonChests.secretChests.secretD08ChestFound()

	GiveTokenToLocalPlayer("SECRETCHEST_D08")
	
end


-- Secret Chest D09
local secretChestD09StateObjects = orderedTable()
	secretChestD09StateObjects["SECRETCHEST_D09"	] = { state = ChestState.Looted, dbr = "records/items/lootchests/b01_obsidianshards01.dbr"}
	secretChestD09StateObjects[""					 	] = { state = ChestState.Default, dbr = "records/items/lootchests/secretchests/secretchest_d09.dbr"}

local secretChestD09Spawned = false

function gd.dungeonChests.secretChests.secretD09OnAddToWorld(objectId)

	if Server then
		local player = Game.GetLocalPlayer()
		if (not secretChestD09Spawned && player:GetLevel() > 2) then
			secretChestD09Spawned = true
			
			local userdata = {}
			TokenStateBasedObjectSwap(objectId, userdata, secretChestD09StateObjects)
			
			Shared.setUserdata(objectId, userdata)
		
		end
			
	end
	
end

gd.dungeonChests.secretChests.secretD09OnDestroy = ClearObjectUserdata

function gd.dungeonChests.secretChests.secretD09ChestFound()

	GiveTokenToLocalPlayer("SECRETCHEST_D09")
	
end


-- Secret Chest D10
local secretChestD10StateObjects = orderedTable()
	secretChestD10StateObjects["SECRETCHEST_D10"	] = { state = ChestState.Looted, dbr = "records/items/lootchests/b01_chestmetal01.dbr"}
	secretChestD10StateObjects[""					 	] = { state = ChestState.Default, dbr = "records/items/lootchests/secretchests/secretchest_d10.dbr"}

local secretChestD10Spawned = false

function gd.dungeonChests.secretChests.secretD10OnAddToWorld(objectId)

	if Server then
		local player = Game.GetLocalPlayer()
		if (not secretChestD10Spawned && player:GetLevel() > 2) then
			secretChestD10Spawned = true
			
			local userdata = {}
			TokenStateBasedObjectSwap(objectId, userdata, secretChestD10StateObjects)
			
			Shared.setUserdata(objectId, userdata)
		
		end
			
	end
	
end

gd.dungeonChests.secretChests.secretD10OnDestroy = ClearObjectUserdata

function gd.dungeonChests.secretChests.secretD10ChestFound()

	GiveTokenToLocalPlayer("SECRETCHEST_D10")
	
end


-- Secret Chest D11
local secretChestD11StateObjects = orderedTable()
	secretChestD11StateObjects["SECRETCHEST_D11"	] = { state = ChestState.Looted, dbr = "records/items/lootchests/b01_chestmetal01.dbr"}
	secretChestD11StateObjects[""					 	] = { state = ChestState.Default, dbr = "records/items/lootchests/secretchests/secretchest_d11.dbr"}

local secretChestD11Spawned = false

function gd.dungeonChests.secretChests.secretD11OnAddToWorld(objectId)

	if Server then
		local player = Game.GetLocalPlayer()
		if (not secretChestD11Spawned && player:GetLevel() > 2) then
			secretChestD11Spawned = true
			
			local userdata = {}
			TokenStateBasedObjectSwap(objectId, userdata, secretChestD11StateObjects)
			
			Shared.setUserdata(objectId, userdata)
		
		end
			
	end
	
end

gd.dungeonChests.secretChests.secretD11OnDestroy = ClearObjectUserdata

function gd.dungeonChests.secretChests.secretD11ChestFound()

	GiveTokenToLocalPlayer("SECRETCHEST_D11")
	
end


-- Secret Chest D12
local secretChestD12StateObjects = orderedTable()
	secretChestD12StateObjects["SECRETCHEST_D12"	] = { state = ChestState.Looted, dbr = "records/items/lootchests/b01_chestmetal01.dbr"}
	secretChestD12StateObjects[""					 	] = { state = ChestState.Default, dbr = "records/items/lootchests/secretchests/secretchest_d12.dbr"}

local secretChestD12Spawned = false

function gd.dungeonChests.secretChests.secretD12OnAddToWorld(objectId)

	if Server then
		local player = Game.GetLocalPlayer()
		if (not secretChestD12Spawned && player:GetLevel() > 2) then
			secretChestD12Spawned = true
			
			local userdata = {}
			TokenStateBasedObjectSwap(objectId, userdata, secretChestD12StateObjects)
			
			Shared.setUserdata(objectId, userdata)
		
		end
			
	end
	
end

gd.dungeonChests.secretChests.secretD12OnDestroy = ClearObjectUserdata

function gd.dungeonChests.secretChests.secretD12ChestFound()

	GiveTokenToLocalPlayer("SECRETCHEST_D12")
	
end


-- Secret Chest D13
local secretChestD13StateObjects = orderedTable()
	secretChestD13StateObjects["SECRETCHEST_D13"	] = { state = ChestState.Looted, dbr = "records/items/lootchests/b01_chestmetal01.dbr"}
	secretChestD13StateObjects[""					 	] = { state = ChestState.Default, dbr = "records/items/lootchests/secretchests/secretchest_d13.dbr"}

local secretChestD13Spawned = false

function gd.dungeonChests.secretChests.secretD13OnAddToWorld(objectId)

	if Server then
		local player = Game.GetLocalPlayer()
		if (not secretChestD13Spawned && player:GetLevel() > 2) then
			secretChestD13Spawned = true
			
			local userdata = {}
			TokenStateBasedObjectSwap(objectId, userdata, secretChestD13StateObjects)
			
			Shared.setUserdata(objectId, userdata)
		
		end
			
	end
	
end

gd.dungeonChests.secretChests.secretD13OnDestroy = ClearObjectUserdata

function gd.dungeonChests.secretChests.secretD13ChestFound()

	GiveTokenToLocalPlayer("SECRETCHEST_D13")
	
end


-- Secret Chest D14
local secretChestD14StateObjects = orderedTable()
	secretChestD14StateObjects["SECRETCHEST_D14"	] = { state = ChestState.Looted, dbr = "records/items/lootchests/b01_chestmetal01.dbr"}
	secretChestD14StateObjects[""					 	] = { state = ChestState.Default, dbr = "records/items/lootchests/secretchests/secretchest_d14.dbr"}

local secretChestD14Spawned = false

function gd.dungeonChests.secretChests.secretD14OnAddToWorld(objectId)

	if Server then
		local player = Game.GetLocalPlayer()
		if (not secretChestD14Spawned && player:GetLevel() > 2) then
			secretChestD14Spawned = true
			
			local userdata = {}
			TokenStateBasedObjectSwap(objectId, userdata, secretChestD14StateObjects)
			
			Shared.setUserdata(objectId, userdata)
		
		end
			
	end
	
end

gd.dungeonChests.secretChests.secretD14OnDestroy = ClearObjectUserdata

function gd.dungeonChests.secretChests.secretD14ChestFound()

	GiveTokenToLocalPlayer("SECRETCHEST_D14")
	
end


-- Secret Chest D15
local secretChestD15StateObjects = orderedTable()
	secretChestD15StateObjects["SECRETCHEST_D15"	] = { state = ChestState.Looted, dbr = "records/items/lootchests/b01_chestmetal01.dbr"}
	secretChestD15StateObjects[""					 	] = { state = ChestState.Default, dbr = "records/items/lootchests/secretchests/secretchest_d15.dbr"}

local secretChestD15Spawned = false

function gd.dungeonChests.secretChests.secretD15OnAddToWorld(objectId)

	if Server then
		local player = Game.GetLocalPlayer()
		if (not secretChestD15Spawned && player:GetLevel() > 2) then
			secretChestD15Spawned = true
			
			local userdata = {}
			TokenStateBasedObjectSwap(objectId, userdata, secretChestD15StateObjects)
			
			Shared.setUserdata(objectId, userdata)
		
		end
			
	end
	
end

gd.dungeonChests.secretChests.secretD15OnDestroy = ClearObjectUserdata

function gd.dungeonChests.secretChests.secretD15ChestFound()

	GiveTokenToLocalPlayer("SECRETCHEST_D15")
	
end


-- Secret Chest D16
local secretChestD16StateObjects = orderedTable()
	secretChestD16StateObjects["SECRETCHEST_D16"	] = { state = ChestState.Looted, dbr = "records/items/lootchests/b01_chestmetal01.dbr"}
	secretChestD16StateObjects[""					 	] = { state = ChestState.Default, dbr = "records/items/lootchests/secretchests/secretchest_d16.dbr"}

local secretChestD16Spawned = false

function gd.dungeonChests.secretChests.secretD16OnAddToWorld(objectId)

	if Server then
		local player = Game.GetLocalPlayer()
		if (not secretChestD16Spawned && player:GetLevel() > 2) then
			secretChestD16Spawned = true
			
			local userdata = {}
			TokenStateBasedObjectSwap(objectId, userdata, secretChestD16StateObjects)
			
			Shared.setUserdata(objectId, userdata)
		
		end
			
	end
	
end

gd.dungeonChests.secretChests.secretD16OnDestroy = ClearObjectUserdata

function gd.dungeonChests.secretChests.secretD16ChestFound()

	GiveTokenToLocalPlayer("SECRETCHEST_D16")
	
end


-- Secret Chest D17
local secretChestD17StateObjects = orderedTable()
	secretChestD17StateObjects["SECRETCHEST_D17"	] = { state = ChestState.Looted, dbr = "records/items/lootchests/b01_chestmetal01.dbr"}
	secretChestD17StateObjects[""					 	] = { state = ChestState.Default, dbr = "records/items/lootchests/secretchests/secretchest_d17.dbr"}

local secretChestD17Spawned = false

function gd.dungeonChests.secretChests.secretD17OnAddToWorld(objectId)

	if Server then
		local player = Game.GetLocalPlayer()
		if (not secretChestD17Spawned && player:GetLevel() > 2) then
			secretChestD17Spawned = true
			
			local userdata = {}
			TokenStateBasedObjectSwap(objectId, userdata, secretChestD17StateObjects)
			
			Shared.setUserdata(objectId, userdata)
		
		end
			
	end
	
end

gd.dungeonChests.secretChests.secretD17OnDestroy = ClearObjectUserdata

function gd.dungeonChests.secretChests.secretD17ChestFound()

	GiveTokenToLocalPlayer("SECRETCHEST_D17")
	
end


-- Secret Chest D18
local secretChestD18StateObjects = orderedTable()
	secretChestD18StateObjects["SECRETCHEST_D18"	] = { state = ChestState.Looted, dbr = "records/items/lootchests/b01_chestmetal01.dbr"}
	secretChestD18StateObjects[""					 	] = { state = ChestState.Default, dbr = "records/items/lootchests/secretchests/secretchest_d18.dbr"}

local secretChestD18Spawned = false

function gd.dungeonChests.secretChests.secretD18OnAddToWorld(objectId)

	if Server then
		local player = Game.GetLocalPlayer()
		if (not secretChestD18Spawned && player:GetLevel() > 2) then
			secretChestD18Spawned = true
			
			local userdata = {}
			TokenStateBasedObjectSwap(objectId, userdata, secretChestD18StateObjects)
			
			Shared.setUserdata(objectId, userdata)
		
		end
			
	end
	
end

gd.dungeonChests.secretChests.secretD18OnDestroy = ClearObjectUserdata

function gd.dungeonChests.secretChests.secretD18ChestFound()

	GiveTokenToLocalPlayer("SECRETCHEST_D18")
	
end


-- Secret Chest D19
local secretChestD19StateObjects = orderedTable()
	secretChestD19StateObjects["SECRETCHEST_D19"	] = { state = ChestState.Looted, dbr = "records/items/lootchests/b01_chestmetal01.dbr"}
	secretChestD19StateObjects[""					 	] = { state = ChestState.Default, dbr = "records/items/lootchests/secretchests/secretchest_d19.dbr"}

local secretChestD19Spawned = false

function gd.dungeonChests.secretChests.secretD19OnAddToWorld(objectId)

	if Server then
		local player = Game.GetLocalPlayer()
		if (not secretChestD19Spawned && player:GetLevel() > 2) then
			secretChestD19Spawned = true
			
			local userdata = {}
			TokenStateBasedObjectSwap(objectId, userdata, secretChestD19StateObjects)
			
			Shared.setUserdata(objectId, userdata)
		
		end
			
	end
	
end

gd.dungeonChests.secretChests.secretD19OnDestroy = ClearObjectUserdata

function gd.dungeonChests.secretChests.secretD19ChestFound()

	GiveTokenToLocalPlayer("SECRETCHEST_D19")
	
end


-- Secret Chest D20
local secretChestD20StateObjects = orderedTable()
	secretChestD20StateObjects["SECRETCHEST_D20"	] = { state = ChestState.Looted, dbr = "records/items/lootchests/b01_chestmetal01.dbr"}
	secretChestD20StateObjects[""					 	] = { state = ChestState.Default, dbr = "records/items/lootchests/secretchests/secretchest_d20.dbr"}

local secretChestD20Spawned = false

function gd.dungeonChests.secretChests.secretD20OnAddToWorld(objectId)

	if Server then
		local player = Game.GetLocalPlayer()
		if (not secretChestD20Spawned && player:GetLevel() > 2) then
			secretChestD20Spawned = true
			
			local userdata = {}
			TokenStateBasedObjectSwap(objectId, userdata, secretChestD20StateObjects)
			
			Shared.setUserdata(objectId, userdata)
		
		end
			
	end
	
end

gd.dungeonChests.secretChests.secretD20OnDestroy = ClearObjectUserdata

function gd.dungeonChests.secretChests.secretD20ChestFound()

	GiveTokenToLocalPlayer("SECRETCHEST_D20")
	
end

