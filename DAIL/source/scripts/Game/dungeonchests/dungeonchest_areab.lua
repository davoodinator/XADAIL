/*
	
	GRIM DAWN
	
	For more information, visit us at http://www.grimdawn.com
	
*/

gd.dungeonChests.areaB = {}

--
-- Old Arkovia Wasp Nest oneshot world chest 
--

-- Called when chest opened
function gd.dungeonChests.areaB.waspNestChestFound()

	GiveTokenIfPlayer(Game.GetLocalPlayer():GetId(), "DUNGEONCHEST_WASPNEST")
	
end

function gd.dungeonChests.areaB.waspNestChestOnAddToWorld(objectId)

	if Server then
		local chestEntity = Entity.Get(objectId)
		local player = Game.GetLocalPlayer()
	
		-- Destroy chest if this is the initial load and the player has the open token from a previous session
		if (player != nil) && (chestEntity:IsReloaded() == false) && (player:AnyoneHasToken("DUNGEONCHEST_WASPNEST")) then
			chestEntity:Destroy()
		end
	
	end
	
end


--
-- Arkovian Foothills Cave oneshot world chest 
--

-- Called when chest opened
function gd.dungeonChests.areaB.caveFoothillsChestFound()

	GiveTokenIfPlayer(Game.GetLocalPlayer():GetId(), "DUNGEONCHEST_CAVEFOOTHILLS")
	
end

function gd.dungeonChests.areaB.caveFoothillsChestOnAddToWorld(objectId)

	if Server then
		local chestEntity = Entity.Get(objectId)
		local player = Game.GetLocalPlayer()
		
		-- Destroy chest if this is the initial load and the player has the open token from a previous session
		if (player != nil) && (chestEntity:IsReloaded() == false) && (player:AnyoneHasToken("DUNGEONCHEST_CAVEFOOTHILLS")) then
			chestEntity:Destroy()
		end
	
	end
	
end


--
-- Broken Hills Ruins oneshot world chest 
--

-- Called when chest opened
function gd.dungeonChests.areaB.ruinsBrokenHillsChestFound()

	GiveTokenIfPlayer(Game.GetLocalPlayer():GetId(), "DUNGEONCHEST_RUINSBROKENHILLS")
	
end

function gd.dungeonChests.areaB.ruinsBrokenHillsChestOnAddToWorld(objectId)

	if Server then
		local chestEntity = Entity.Get(objectId)
		local player = Game.GetLocalPlayer()
		
		-- Destroy chest if this is the initial load and the player has the open token from a previous session
		if (player != nil) && (chestEntity:IsReloaded() == false) && (player:AnyoneHasToken("DUNGEONCHEST_RUINSBROKENHILLS")) then
			chestEntity:Destroy()
		end
	
	end
	
end

--
-- Flooded Passage Ruins oneshot world chest 
--

-- Called when chest opened
function gd.dungeonChests.areaB.ruinsFloodedPassageChestFound()

	GiveTokenIfPlayer(Game.GetLocalPlayer():GetId(), "DUNGEONCHEST_RUINSFLOODEDPASSAGE")
	
end

function gd.dungeonChests.areaB.ruinsRuinsFloodedPassageChestOnAddToWorld(objectId)

	if Server then
		local chestEntity = Entity.Get(objectId)
		local player = Game.GetLocalPlayer()
		
		-- Destroy chest if this is the initial load and the player has the open token from a previous session
		if (player != nil) && (chestEntity:IsReloaded() == false) && (player:AnyoneHasToken("DUNGEONCHEST_RUINSFLOODEDPASSAGE")) then
			chestEntity:Destroy()
		end
	
	end
	
end
