/*
	
	GRIM DAWN
	
	For more information, visit us at http://www.grimdawn.com
	
*/

gd.dungeonChests.areaA = {}

--
-- Spider Lab oneshot world chest 
--

-- Called when chest opened
function gd.dungeonChests.areaA.labSpidersChestFound()

	GiveTokenIfPlayer(Game.GetLocalPlayer():GetId(), "DUNGEONCHEST_LABSPIDER")
	
end

function gd.dungeonChests.areaA.labSpidersChestOnAddToWorld(objectId)
	
	if Server then	
		local chestEntity = Entity.Get(objectId)
		local player = Game.GetLocalPlayer()
	
		-- Destroy chest if this is the initial load and the player has the open token from a previous session
		if (player != nil) && (chestEntity:IsReloaded() == false) && (player:AnyoneHasToken("DUNGEONCHEST_LABSPIDER")) then
			chestEntity:Destroy()
		end
	
	end
	
end

--
-- Hallowed Hill oneshot world chest
--

-- Called when chest opened
function gd.dungeonChests.areaA.hallowedHillChestFound()

	GiveTokenIfPlayer(Game.GetLocalPlayer():GetId(), "DUNGEONCHEST_HALLOWEDHILL")
	
end

function gd.dungeonChests.areaA.hallowedHillChestOnAddToWorld(objectId)

	if Server then
		local chestEntity = Entity.Get(objectId)
		local player = Game.GetLocalPlayer()
	
		-- Destroy chest if this is the initial load and the player has the open token from a previous session
		if (player != nil) && (chestEntity:IsReloaded() == false) && (player:AnyoneHasToken("DUNGEONCHEST_HALLOWEDHILL")) then
			chestEntity:Destroy()
		end
	
	end
	
end

--
-- Burrwitch Burial Cave oneshot world chest
--

-- Called when chest opened
function gd.dungeonChests.areaA.burrwitchBurialCaveChestFound()

	GiveTokenIfPlayer(Game.GetLocalPlayer():GetId(), "DUNGEONCHEST_MINEROVER")
	
end

function gd.dungeonChests.areaA.burrwitchBurialCaveChestOnAddToWorld(objectId)

	if Server then
		local chestEntity = Entity.Get(objectId)
		local player = Game.GetLocalPlayer()
	
		-- Destroy chest if this is the initial load and the player has the open token from a previous session
		if (player != nil) && (chestEntity:IsReloaded() == false) && (player:AnyoneHasToken("DUNGEONCHEST_MINEROVER")) then
			chestEntity:Destroy()
		end
	
	end
	
end

--
-- Burrwitch village oneshot world chest
--

-- Called when chest opened
function gd.dungeonChests.areaA.burrwitchVillageChestFound()

	GiveTokenIfPlayer(Game.GetLocalPlayer():GetId(), "DUNGEONCHEST_BURRWITCHVILLAGE")
	
end

function gd.dungeonChests.areaA.burrwitchVillageChestOnAddToWorld(objectId)

	if Server then
		local chestEntity = Entity.Get(objectId)
		local player = Game.GetLocalPlayer()
	
		-- Destroy chest if this is the initial load and the player has the open token from a previous session
		if (player != nil) && (chestEntity:IsReloaded() == false) && (player:AnyoneHasToken("DUNGEONCHEST_BURRWITCHVILLAGE")) then
			chestEntity:Destroy()
		end
	
	end
	
end

--
-- Depraved Sanctuary oneshot world chest
--

-- Called when chest opened
function gd.dungeonChests.areaA.depravedSanctuaryChestFound()

	GiveTokenIfPlayer(Game.GetLocalPlayer():GetId(), "DUNGEONCHEST_DEPRAVEDSANCTUARY")
	
end

function gd.dungeonChests.areaA.depravedSanctuaryChestOnAddToWorld(objectId)

	if Server then
		local chestEntity = Entity.Get(objectId)
		local player = Game.GetLocalPlayer()
	
		-- Destroy chest if this is the initial load and the player has the open token from a previous session
		if (player != nil) && (chestEntity:IsReloaded() == false) && (player:AnyoneHasToken("DUNGEONCHEST_DEPRAVEDSANCTUARY")) then
			chestEntity:Destroy()
		end
	
	end
	
end


--
-- Lower Crossing Rat Den oneshot world chest
--

-- Called when chest opened
function gd.dungeonChests.areaA.lowerCrossingRatDenChestFound()

	GiveTokenIfPlayer(Game.GetLocalPlayer():GetId(), "DUNGEONCHEST_LOWERCROSSINGRATDEN")
	
end

function gd.dungeonChests.areaA.lowerCrossingRatDenChestOnAddToWorld(objectId)

	if Server then
		local chestEntity = Entity.Get(objectId)
		local player = Game.GetLocalPlayer()
	
		-- Destroy chest if this is the initial load and the player has the open token from a previous session
		if (player != nil) && (chestEntity:IsReloaded() == false) && (player:AnyoneHasToken("DUNGEONCHEST_LOWERCROSSINGRATDEN")) then
			chestEntity:Destroy()
		end
	
	end
	
end


--
-- Burrwitch Rat Den oneshot world chest
--

-- Called when chest opened
function gd.dungeonChests.areaA.burrwitchRatDenChestFound()

	GiveTokenIfPlayer(Game.GetLocalPlayer():GetId(), "DUNGEONCHEST_BURRWITCHRATDEN")
	
end

function gd.dungeonChests.areaA.burrwitchRatDenChestOnAddToWorld(objectId)

	if Server then
		local chestEntity = Entity.Get(objectId)
		local player = Game.GetLocalPlayer()
	
		-- Destroy chest if this is the initial load and the player has the open token from a previous session
		if (player != nil) && (chestEntity:IsReloaded() == false) && (player:AnyoneHasToken("DUNGEONCHEST_BURRWITCHRATDEN")) then
			chestEntity:Destroy()
		end
	
	end
	
end