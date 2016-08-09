/*
	
	GRIM DAWN
	scripts/quests/devilsCrossing.lua
	
	For more information, visit us at http://www.grimdawn.com
	
*/

gd.quests.devilsCrossing = {}

--
-- Intro potion chest
--
-- A chest containing potions which spawns at the end of the wightmire bridge
-- in devil's crossing if the player hasn't yet opened it in any playthrough.
--

local potionChestSpawned = false

local IntroPotionState = { Potions = 0, Nothing = 1 }

local introPotionStateObjects = orderedTable()
--	introPotionStateObjects["DC_INTRO_POTIONS"] = { state = IntroPotionState.Nothing, dbr = nil }
	introPotionStateObjects[""]					= { state = IntroPotionState.Potions, dbr = "records/items/lootchests/questchests/questchest_intropotionchest.dbr" }

function gd.quests.devilsCrossing.introPotionChestOnAddToWorld(objectId)

	if Server then

		-- Spawn the chest on the first load only, it will be saved into the world for this session if spawned
		if (not potionChestSpawned) then
		
			local userdata = {}
			TokenStateBasedObjectSwap(objectId, userdata, introPotionStateObjects)
			Shared.setUserdata(objectId, userdata)
		
			potionChestSpawned = true
		
		end
	
	end

end

gd.quests.devilsCrossing.introPotionChestOnDestroy = ClearObjectUserdata

-- Called when trigger entered
function gd.quests.devilsCrossing.introPotionsFound(triggererId)

	if Server then
		-- Prevent chest from spawning on next session
		GiveTokenIfPlayer(triggererId, "DC_INTRO_POTIONS");
	
	end
	
end

--
-- Devil's Crossing prison gate
--
-- The prison gate opens when the player enters a nearby trigger 
-- after killing Kyzogg the Reanimator and talked to John Bourbon.
--

local prisonGateId = 0
local prisonGateOpen = false

function gd.quests.devilsCrossing.prisonGateDoorOnAddToWorld(objectId)

	if Server then
	
		prisonGateId = objectId
		
	end

end

-- Called when trigger entered
function gd.quests.devilsCrossing.prisonGateDoorOpen(triggererId)

	if not prisonGateOpen then
	
		local player = Player.Get(triggererId)
		
		-- Open door if player has token
		if (player != nil && (player:HasToken("DC_PRISON_GUARD") || player:ServerHasToken("DC_PRISON_GUARD"))) then
			QuestEvent("prisonGateEntry")
		end
		
	end
	
	QuestEvent("smithTeleportApprentice")

end

function gd.quests.devilsCrossing.prisonGateEntry()

	if Server then
		if not prisonGateOpen then
			local door = Door.Get(prisonGateId)
			door:Open()
			
			prisonGateOpen = true
		end
		
	end

end

-- Called by conversation with the prison gate guard
function gd.quests.devilsCrossing.giveGateToken()

	if Server then
	
		GiveTokenIfPlayer(Game.GetLocalPlayer():GetId(), "DC_PRISON_GUARD")
		
	end

end
