/*
	
	GRIM DAWN
	
	For more information, visit us at http://www.grimdawn.com
	
*/

gd.dungeonChests.areaC = {}

--
-- Jagged Waste cave oneshot world chest 
--

-- Called when chest opened
function gd.dungeonChests.areaC.jaggedWasteChestFound()

	GiveTokenIfPlayer(Game.GetLocalPlayer():GetId(), "DUNGEONCHEST_JAGGEDWASTE")
	
end

function gd.dungeonChests.areaC.jaggedWasteChestOnAddToWorld(objectId)

	if Server then
		local chestEntity = Entity.Get(objectId)
		local player = Game.GetLocalPlayer()
	
		-- Destroy chest if this is the initial load and the player has the open token from a previous session
		if (player != nil) && (chestEntity:IsReloaded() == false) && (player:AnyoneHasToken("DUNGEONCHEST_JAGGEDWASTE")) then
			chestEntity:Destroy()
		end
	
	end
	
end

--
-- Dermapteran oneshot world chest 
--

-- Called when chest opened
function gd.dungeonChests.areaC.dermapteranChestFound()

	GiveTokenIfPlayer(Game.GetLocalPlayer():GetId(), "DUNGEONCHEST_DERMAPTERAN")
	
end

function gd.dungeonChests.areaC.dermapteranChestOnAddToWorld(objectId)

	if Server then
		local chestEntity = Entity.Get(objectId)
		local player = Game.GetLocalPlayer()
	
		-- Destroy chest if this is the initial load and the player has the open token from a previous session
		if (player != nil) && (chestEntity:IsReloaded() == false) && (player:AnyoneHasToken("DUNGEONCHEST_DERMAPTERAN")) then
			chestEntity:Destroy()
		end
	
	end
	
end

--
-- Homestead Conflagration oneshot world chest 
--

-- Called when chest opened
function gd.dungeonChests.areaC.homesteadConflagrationChestFound()

	GiveTokenIfPlayer(Game.GetLocalPlayer():GetId(), "DUNGEONCHEST_HOMESTEADCONFLAGRATION")
	
end

function gd.dungeonChests.areaC.homesteadConflagrationOnAddToWorld(objectId)

	if Server then
		local chestEntity = Entity.Get(objectId)
		local player = Game.GetLocalPlayer()
	
		-- Destroy chest if this is the initial load and the player has the open token from a previous session
		if (player != nil) && (chestEntity:IsReloaded() == false) && (player:AnyoneHasToken("DUNGEONCHEST_HOMESTEADCONFLAGRATION")) then
			chestEntity:Destroy()
		end
	
	end
	
end