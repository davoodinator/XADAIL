/*
	
	GRIM DAWN
	
	For more information, visit us at http://www.grimdawn.com
	
*/

gd.quests.areaCQuestHiddenWealth = {}

--
-- Hidden Wealth Blockade
--
-- There is a collapsed wall into a small cave that has a one-shot chest. Only revealed if player finds the map.
--


local BlockadeState = { Hidden = 0, Active = 1, Destroyed = 2}

local blockadeId = 0
local detonationSiteId = 0
local spawnedBlockade = false
local hiddenChestId = 0

-- Blockade

local blockadeStateObjects = orderedTable();
	blockadeStateObjects["HIDDENWEALTH_BLOCKADECLEARED"]	= { state = BlockadeState.Destroyed,  dbr = nil }
	blockadeStateObjects[""] 								= { state = BlockadeState.Hidden, dbr = "records/storyelements/questassets/debriswall_hiddenwealth_break.dbr" }

function gd.quests.areaCQuestHiddenWealth.blockadeOnAddToWorld(objectId)

	if Server then
	
		if (not spawnedBlockade) then

			local userdata = {};
			TokenStateBasedObjectSwap(objectId, userdata, blockadeStateObjects);
			Shared.setUserdata(objectId, userdata);
			
			spawnedBlockade = true
			
		end
		
	end
	
end

function gd.quests.areaCQuestHiddenWealth.blockadeAvatarOnAddToWorld(objectId)

	if Server then
	
		blockadeId = objectId
		
	end
	
end

gd.quests.areaCQuestHiddenWealth.blockadeOnDestroy = ClearObjectUserdata
	
-- Detonation Site
local detonationSiteStateObjects = orderedTable();
	detonationSiteStateObjects["HIDDENWEALTH_BLOCKADECLEARED"]	= { state = BlockadeState.Destroyed,  dbr = nil }
	detonationSiteStateObjects["HIDDENWEALTH_REVEALED"] 	= { state = BlockadeState.Active, dbr = "records/creatures/npcs/questnpcs/interactiveobjects/npc_detonationsite_hiddenwealth.dbr" }
	detonationSiteStateObjects[""] 								= { state = BlockadeState.Hidden, dbr = nil }

function gd.quests.areaCQuestHiddenWealth.detonationSiteOnAddToWorld(objectId)

	if Server then
		detonationSiteId = objectId
	
		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, detonationSiteStateObjects);
		Shared.setUserdata(objectId, userdata);
		
	end
	
end

gd.quests.areaCQuestHiddenWealth.detonationSiteOnDestroy = ClearObjectUserdata

-- Destroy Blockade
function gd.quests.areaCQuestHiddenWealth.blockadeDestroyGlobalMP()
	
	GiveTokenToLocalPlayer("HIDDENWEALTH_BLOCKADECLEARED")

end

function gd.quests.areaCQuestHiddenWealth.blockadeDestroy()

	if Server then
	
		if blockadeId != 0 then
			local Blockade = Destructible.Get(blockadeId)
			local coords = Blockade:GetCoords()
			Blockade:Destroy(Vec(0,1,0), 1000, false)
			blockadeId = 0
			
			local pfx = Entity.Create("records/fx/skillsother/attackradius/detonatelarge_fxpak01.dbr")
			if pfx != nil then
				pfx:NetworkEnable()
				pfx:SetCoords(coords)
			end
		end
				
		-- Unlock chest
		local chest = Chest.Get(hiddenChestId);
		if (chest != nil) then
			chest:SetLocked(false)
		end
		
		-- give token for unblocking the barricade
		QuestGlobalEvent("hiddenWealthToken")
		
	end
	
end

-- Corpse which drops the map
local corpseSpawned = false

local corpseStateObjects = orderedTable()
	corpseStateObjects["HIDDENWEALTH_BLOCKADECLEARED"]	= { state = BlockadeState.Destroyed,  dbr = nil }
	corpseStateObjects["HIDDENWEALTH_REVEALED"] 	= { state = BlockadeState.Active, dbr = nil }
	corpseStateObjects[""					 	] = { state = BlockadeState.Hidden, dbr = "records/items/lootchests/questchests/questchest_areachiddenwealth_mapchest.dbr"}

function gd.quests.areaCQuestHiddenWealth.corpseOnAddToWorld(objectId)
	
	if Server then
		if (not corpseSpawned) then
			userdata = {}
			local didWork, newState = TokenStateBasedObjectSwap(objectId, userdata, corpseStateObjects)
			Shared.setUserdata(objectId, userdata)

			-- Don't respawn the corpse if spawned
			if (newState == BlockadeState.Hidden) then
				corpseSpawned = true
				
			end
		
		end
		
	end
	
end

gd.quests.areaCQuestHiddenWealth.corpseOnDestroy = ClearObjectUserdata


-- Loot treasure map and spawn in detonation site
function gd.quests.areaCQuestHiddenWealth.spawnDetonationSite()

	if Server then
		local detonationSite = Entity.Get(detonationSiteId)
		
		if detonationSite != nil then
			UpdateObjectSwap(detonationSiteId, detonationSiteStateObjects)
		
		end
		
	end


end

function gd.quests.areaCQuestHiddenWealth.lootMap(looterId, itemId)

	if looterId == Game.GetLocalPlayer():GetId() then
		local kQuest = 0x0863C400
		local kTask  = 0xCDD85D00
		local player = Player.Get(looterId)
		
		local questState = player:GetQuestState(kQuest)

		if ((player != nil) && (questState == QuestState.Available)) then
			player:GrantQuest(kQuest, kTask)
			
		end
	
	end
	
end


--
-- Hidden Wealth quest oneshot world chest 
--

-- Called when chest opened
function gd.quests.areaCQuestHiddenWealth.hiddenWealthChestFound()

	GiveTokenIfPlayer(Game.GetLocalPlayer():GetId(), "DUNGEONCHEST_HIDDENWEALTH")
	
end

function gd.quests.areaCQuestHiddenWealth.hiddenWealthChestOnAddToWorld(objectId)

	if Server then
		hiddenChestId = objectId
		local chestEntity = Entity.Get(objectId)
		local chest = Chest.Get(objectId)
		local player = Game.GetLocalPlayer()
	
		-- Destroy chest if this is the initial load and the player has the open token from a previous session
		if (player != nil) && (chestEntity:IsReloaded() == false) && (player:ServerHasToken("DUNGEONCHEST_HIDDENWEALTH")) then
			chestEntity:Destroy()
		elseif (player:HasToken("HIDDENWEALTH_BLOCKADECLEARED") && chest != nil) then
			chest:SetLocked(false)
		end
	
	end
	
end
