/*
	
	GRIM DAWN
	
	For more information, visit us at http://www.grimdawn.com
	
*/

gd.quests.devilsCrossingQuestSacrifice = {}

--
-- Isaac is discovered in a cultist cellar where he was in the process of being sacrificed. Before he dies, he tells you where he had hidden a valuable stash
--

local SacrificeState = { Dying = 0, Found = 1 }

local sacrificeStateObjects = orderedTable()
	sacrificeStateObjects["ISAAC_FOUND"	] = { state = SacrificeState.Found,  dbr = "records/items/lootchests/breakables/a01_bonepilehuman_01_break.dbr"}
	sacrificeStateObjects[""					 	] = { state = SacrificeState.Dying, dbr = "records/creatures/npcs/questnpcs/npc_isaac_01.dbr"}

function gd.quests.devilsCrossingQuestSacrifice.sacrificeOnAddToWorld(objectId)

	if Server then
		local userdata = {}
		TokenStateBasedObjectSwap(objectId, userdata, sacrificeStateObjects)
		Shared.setUserdata(objectId, userdata)
	
	end
	
end

gd.quests.devilsCrossingQuestSacrifice.isaacOnDestroy = ClearObjectUserdata

function gd.quests.devilsCrossingQuestSacrifice.sacrificeChestOnAddToWorld(objectId)

	if Server then
		sacrificeChestEntity = Entity.Get(objectId)
		player = Game.GetLocalPlayer()
	
		if (player != nil) && (sacrificeChestEntity:IsReloaded() == false) && (player:HasToken("DUNGEONCHEST_SACRIFICE")) then
			print "Destroying Chest"
			sacrificeChestEntity:Destroy()
			
		end
	
	end
	
end

function gd.quests.devilsCrossingQuestSacrifice.sacrificeChestFoundGlobalMP()

	GiveTokenToLocalPlayer("DUNGEONCHEST_SACRIFICE")

end

function gd.quests.devilsCrossingQuestSacrifice.sacrificeChestFound()

		QuestGlobalEvent("sacrificeChestToken")
	
end