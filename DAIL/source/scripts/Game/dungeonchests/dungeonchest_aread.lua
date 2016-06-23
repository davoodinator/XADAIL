/*
	
	GRIM DAWN
	
	For more information, visit us at http://www.grimdawn.com
	
*/

gd.dungeonChests.areaD = {}

--
-- Obsidian Throne oneshot world chest 
--

-- Called when chest opened
function gd.dungeonChests.areaD.obsidianThroneChestFound()

	GiveTokenIfPlayer(Game.GetLocalPlayer():GetId(), "DUNGEONCHEST_OBSIDIANTHRONE")
	
end

function gd.dungeonChests.areaD.obsidianThroneChestOnAddToWorld(objectId)

	if Server then
		local chestEntity = Entity.Get(objectId)
		local player = Game.GetLocalPlayer()
	
		-- Destroy chest if this is the initial load and the player has the open token from a previous session
		if (player != nil) && (chestEntity:IsReloaded() == false) && (player:AnyoneHasToken("DUNGEONCHEST_OBSIDIANTHRONE")) then
			chestEntity:Destroy()
		end
	
	end
	
end

--
-- Bastion of Chaos oneshot world chest 
--

-- Called when chest opened
function gd.dungeonChests.areaD.bastionOfChaosChestFound()

	GiveTokenIfPlayer(Game.GetLocalPlayer():GetId(), "DUNGEONCHEST_BASTIONOFCHAOS")
	
end

function gd.dungeonChests.areaD.bastionOfChaosOnAddToWorld(objectId)

	if Server then
		local chestEntity = Entity.Get(objectId)
		local player = Game.GetLocalPlayer()
	
		-- Destroy chest if this is the initial load and the player has the open token from a previous session
		if (player != nil) && (chestEntity:IsReloaded() == false) && (player:AnyoneHasToken("DUNGEONCHEST_BASTIONOFCHAOS")) then
			chestEntity:Destroy()
		end
	
	end
	
end

--
-- Necropolis oneshot world chest 
--

-- Called when chest opened
function gd.dungeonChests.areaD.necropolisChestFound()

	GiveTokenIfPlayer(Game.GetLocalPlayer():GetId(), "DUNGEONCHEST_NECROPOLIS")
	
end

function gd.dungeonChests.areaD.necropolisChestOnAddToWorld(objectId)

	if Server then
		local chestEntity = Entity.Get(objectId)
		local player = Game.GetLocalPlayer()
	
		-- Destroy chest if this is the initial load and the player has the open token from a previous session
		if (player != nil) && (chestEntity:IsReloaded() == false) && (player:AnyoneHasToken("DUNGEONCHEST_NECROPOLIS")) then
			chestEntity:Destroy()
		end
	
	end
	
end
