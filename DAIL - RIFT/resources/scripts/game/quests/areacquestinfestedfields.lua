/*
	
	GRIM DAWN
	
	For more information, visit us at http://www.grimdawn.com
	
*/

gd.quests.areaCQuestInfestedFields = {}

--
-- Scripts for Infested Fields and Culling the Swarm
--

--
-- Clearing out the infested fields
--

-- Spawns
local swarmId = 0

local spawnedInfestation01 = false
local spawnedInfestation02 = false
local spawnedInfestation03 = false
local spawnedInfestation04 = false
local spawnedInfestation05 = false
local spawnedInfestation06 = false

local InfestationState = { Default = 0, Clear = 1 }

-- Dermapterans
local infestationStateObjects = orderedTable()
	infestationStateObjects["AREAC_DERMAPTERAN_INFESTATION_CLEARED"	] = { state = InfestationState.Clear,  dbr = nil }
	infestationStateObjects[""					 	] = { state = InfestationState.Default, dbr = "records/proxies/boss&quest/questproxy_areac_dermapteraninfestation.dbr"}

local function CreateArgs()

	return Entity.Get(swarmId):GetCoords().origin
	
end

function gd.quests.areaCQuestInfestedFields.infestation01OnAddToWorld(objectId)

		if (not spawnedInfestation01) then
			swarmId = objectId
			
			local userdata = {}
			local didWork, newState = TokenStateBasedObjectSwap(objectId, userdata, infestationStateObjects, Proxy, CreateArgs)
			Shared.setUserdata(objectId, userdata)
			
			-- Don't respawn Dermapterans next time. If spawned, saved into world
			if (newState == InfestationState.Default) then
				spawnedInfestation01 = true
				
			end
		
		end
	
end

gd.quests.areaCQuestInfestedFields.infestation01OnDestroy = ClearObjectUserdata

function gd.quests.areaCQuestInfestedFields.infestation02OnAddToWorld(objectId)

		if (not spawnedInfestation02) then
			swarmId = objectId
			local userdata = {}
			local didWork, newState = TokenStateBasedObjectSwap(objectId, userdata, infestationStateObjects, Proxy, CreateArgs)
			Shared.setUserdata(objectId, userdata)
			
			-- Don't respawn Dermapterans next time. If spawned, saved into world
			if (newState == InfestationState.Default) then
				spawnedInfestation02 = true
				
			end
		
		end
	
end

gd.quests.areaCQuestInfestedFields.infestation02OnDestroy = ClearObjectUserdata

function gd.quests.areaCQuestInfestedFields.infestation03OnAddToWorld(objectId)

		if (not spawnedInfestation03) then
			swarmId = objectId
			local userdata = {}
			local didWork, newState = TokenStateBasedObjectSwap(objectId, userdata, infestationStateObjects, Proxy, CreateArgs)
			Shared.setUserdata(objectId, userdata)
			
			-- Don't respawn Dermapterans next time. If spawned, saved into world
			if (newState == InfestationState.Default) then
				spawnedInfestation03 = true
				
			end
		
		end
	
end

gd.quests.areaCQuestInfestedFields.infestation03OnDestroy = ClearObjectUserdata

function gd.quests.areaCQuestInfestedFields.infestation04OnAddToWorld(objectId)

		if (not spawnedInfestation04) then
			swarmId = objectId
			local userdata = {}
			local didWork, newState = TokenStateBasedObjectSwap(objectId, userdata, infestationStateObjects, Proxy, CreateArgs)
			Shared.setUserdata(objectId, userdata)
			
			-- Don't respawn Dermapterans next time. If spawned, saved into world
			if (newState == InfestationState.Default) then
				spawnedInfestation04 = true
				
			end
		
		end
	
end

gd.quests.areaCQuestInfestedFields.infestation04OnDestroy = ClearObjectUserdata

function gd.quests.areaCQuestInfestedFields.infestation05OnAddToWorld(objectId)

		if (not spawnedInfestation05) then
			swarmId = objectId
			local userdata = {}
			local didWork, newState = TokenStateBasedObjectSwap(objectId, userdata, infestationStateObjects, Proxy, CreateArgs)
			Shared.setUserdata(objectId, userdata)
			
			-- Don't respawn Dermapterans next time. If spawned, saved into world
			if (newState == InfestationState.Default) then
				spawnedInfestation05 = true
				
			end
		
		end
	
end

gd.quests.areaCQuestInfestedFields.infestation05OnDestroy = ClearObjectUserdata

function gd.quests.areaCQuestInfestedFields.infestation06OnAddToWorld(objectId)

		if (not spawnedInfestation06) then
			swarmId = objectId
			local userdata = {}
			local didWork, newState = TokenStateBasedObjectSwap(objectId, userdata, infestationStateObjects, Proxy, CreateArgs)
			Shared.setUserdata(objectId, userdata)
			
			-- Don't respawn Dermapterans next time. If spawned, saved into world
			if (newState == InfestationState.Default) then
				spawnedInfestation06 = true
				
			end
		
		end
	
end

gd.quests.areaCQuestInfestedFields.infestation06OnDestroy = ClearObjectUserdata

-- Farmers in fields
local infestationFarmer01AreaStateObjects = orderedTable()
	infestationFarmer01AreaStateObjects["AREAC_DERMAPTERAN_INFESTATION_CLAIMED"	] = { state = InfestationState.Clear,  dbr = "records/creatures/npcs/flavornpcs/gdareac/npc_infestedfield_farmer_field01.dbr"}
	infestationFarmer01AreaStateObjects[""					 	] = { state = InfestationState.Default, dbr = nil }

function gd.quests.areaCQuestInfestedFields.infestationFarmer01AreaOnAddToWorld(objectId)

		if (not spawnedInfestation01) then
			local userdata = {}
			TokenStateBasedObjectSwap(objectId, userdata, infestationFarmer01AreaStateObjects)
			Shared.setUserdata(objectId, userdata)
		
		end
	
end

gd.quests.areaCQuestInfestedFields.infestationFarmer01AreaOnDestroy = ClearObjectUserdata


local infestationFarmer02AreaStateObjects = orderedTable()
	infestationFarmer02AreaStateObjects["AREAC_DERMAPTERAN_INFESTATION_CLAIMED"	] = { state = InfestationState.Clear,  dbr = "records/creatures/npcs/flavornpcs/gdareac/npc_infestedfield_farmer_field02.dbr"}
	infestationFarmer02AreaStateObjects[""					 	] = { state = InfestationState.Default, dbr = nil }

function gd.quests.areaCQuestInfestedFields.infestationFarmer02AreaOnAddToWorld(objectId)

		if (not spawnedInfestation02) then
			local userdata = {}
			TokenStateBasedObjectSwap(objectId, userdata, infestationFarmer02AreaStateObjects)
			Shared.setUserdata(objectId, userdata)
		
		end
	
end

gd.quests.areaCQuestInfestedFields.infestationFarmer02AreaOnDestroy = ClearObjectUserdata


local infestationFarmer03AreaStateObjects = orderedTable()
	infestationFarmer03AreaStateObjects["AREAC_DERMAPTERAN_INFESTATION_CLAIMED"	] = { state = InfestationState.Clear,  dbr = "records/creatures/npcs/flavornpcs/gdareac/npc_infestedfield_farmer_field03.dbr"}
	infestationFarmer03AreaStateObjects[""					 	] = { state = InfestationState.Default, dbr = nil }
	
local infestationFarmer04AreaStateObjects = orderedTable()
	infestationFarmer04AreaStateObjects["AREAC_DERMAPTERAN_INFESTATION_CLAIMED"	] = { state = InfestationState.Clear,  dbr = "records/creatures/npcs/flavornpcs/gdareac/npc_infestedfield_farmer_field04.dbr"}
	infestationFarmer04AreaStateObjects[""					 	] = { state = InfestationState.Default, dbr = nil }

function gd.quests.areaCQuestInfestedFields.infestationFarmer03AreaOnAddToWorld(objectId)

		if (not spawnedInfestation01) then
			local userdata = {}
			TokenStateBasedObjectSwap(objectId, userdata, infestationFarmer03AreaStateObjects)
			Shared.setUserdata(objectId, userdata)
		
		end
	
end

gd.quests.areaCQuestInfestedFields.infestationFarmer03AreaOnDestroy = ClearObjectUserdata


function gd.quests.areaCQuestInfestedFields.infestationFarmer04AreaOnAddToWorld(objectId)

		if (not spawnedInfestation03) then
			local userdata = {}
			TokenStateBasedObjectSwap(objectId, userdata, infestationFarmer04AreaStateObjects)
			Shared.setUserdata(objectId, userdata)
		
		end
	
end

gd.quests.areaCQuestInfestedFields.infestationFarmer04AreaOnDestroy = ClearObjectUserdata


function gd.quests.areaCQuestInfestedFields.infestationFarmer05AreaOnAddToWorld(objectId)

		if (not spawnedInfestation03) then
			local userdata = {}
			TokenStateBasedObjectSwap(objectId, userdata, infestationFarmer04AreaStateObjects)
			Shared.setUserdata(objectId, userdata)
		
		end
	
end

gd.quests.areaCQuestInfestedFields.infestationFarmer05AreaOnDestroy = ClearObjectUserdata


function gd.quests.areaCQuestInfestedFields.infestationFarmer06AreaOnAddToWorld(objectId)

		if (not spawnedInfestation04) then
			local userdata = {}
			TokenStateBasedObjectSwap(objectId, userdata, infestationFarmer03AreaStateObjects)
			Shared.setUserdata(objectId, userdata)
		
		end
	
end

gd.quests.areaCQuestInfestedFields.infestationFarmer06AreaOnDestroy = ClearObjectUserdata


function gd.quests.areaCQuestInfestedFields.infestationFarmer07AreaOnAddToWorld(objectId)

		if (not spawnedInfestation04) then
			local userdata = {}
			TokenStateBasedObjectSwap(objectId, userdata, infestationFarmer03AreaStateObjects)
			Shared.setUserdata(objectId, userdata)
		
		end
	
end

gd.quests.areaCQuestInfestedFields.infestationFarmer07AreaOnDestroy = ClearObjectUserdata


function gd.quests.areaCQuestInfestedFields.infestationFarmer08AreaOnAddToWorld(objectId)

		if (not spawnedInfestation04) then
			local userdata = {}
			TokenStateBasedObjectSwap(objectId, userdata, infestationFarmer03AreaStateObjects)
			Shared.setUserdata(objectId, userdata)
		
		end
	
end

gd.quests.areaCQuestInfestedFields.infestationFarmer08AreaOnDestroy = ClearObjectUserdata

function gd.quests.areaCQuestInfestedFields.infestationFarmer09AreaOnAddToWorld(objectId)

		if (not spawnedInfestation04) then
			local userdata = {}
			TokenStateBasedObjectSwap(objectId, userdata, infestationFarmer04AreaStateObjects)
			Shared.setUserdata(objectId, userdata)
		
		end
	
end

gd.quests.areaCQuestInfestedFields.infestationFarmer09AreaOnDestroy = ClearObjectUserdata

function gd.quests.areaCQuestInfestedFields.infestationFarmer10AreaOnAddToWorld(objectId)

		if (not spawnedInfestation04) then
			local userdata = {}
			TokenStateBasedObjectSwap(objectId, userdata, infestationFarmer03AreaStateObjects)
			Shared.setUserdata(objectId, userdata)
		
		end
	
end

gd.quests.areaCQuestInfestedFields.infestationFarmer10AreaOnDestroy = ClearObjectUserdata

-- Farmers in town
local infestationFarmer01TownStateObjects = orderedTable()
	infestationFarmer01TownStateObjects["AREAC_DERMAPTERAN_INFESTATION_CLAIMED"	] = { state = InfestationState.Clear,  dbr = nil }
	infestationFarmer01TownStateObjects[""					 	] = { state = InfestationState.Default, dbr = "records/creatures/npcs/flavornpcs/gdareac/npc_infestedfield_farmer_01.dbr"}

function gd.quests.areaCQuestInfestedFields.infestationFarmer01TownOnAddToWorld(objectId)

		local userdata = {}
		TokenStateBasedObjectSwap(objectId, userdata, infestationFarmer01TownStateObjects)
		Shared.setUserdata(objectId, userdata)
	
end

gd.quests.areaCQuestInfestedFields.infestationFarmer01TownOnDestroy = ClearObjectUserdata


local infestationFarmer02TownStateObjects = orderedTable()
	infestationFarmer02TownStateObjects["AREAC_DERMAPTERAN_INFESTATION_CLAIMED"	] = { state = InfestationState.Clear,  dbr = nil }
	infestationFarmer02TownStateObjects[""					 	] = { state = InfestationState.Default, dbr = "records/creatures/npcs/flavornpcs/gdareac/npc_infestedfield_farmer_02.dbr"}

function gd.quests.areaCQuestInfestedFields.infestationFarmer02TownOnAddToWorld(objectId)

		local userdata = {}
		TokenStateBasedObjectSwap(objectId, userdata, infestationFarmer02TownStateObjects)
		Shared.setUserdata(objectId, userdata)
	
end

gd.quests.areaCQuestInfestedFields.infestationFarmer02TownOnDestroy = ClearObjectUserdata


--Black Legion Guards
local guardSpawned01A = false
local guardSpawned02A = false
local guardSpawned01B = false
local guardSpawned02B = false

local function GetGuardMaxLevel()

	local maxLevel = 0
	local playerLevel = Game.GetAveragePlayerLevel()

	if (Game.GetGameDifficulty() == Game.Difficulty.Normal) then
		maxLevel = 50
	elseif (Game.GetGameDifficulty() == Game.Difficulty.Epic) then
		maxLevel = 75
	else
		maxLevel = 100
	end
	
	if (playerLevel < maxLevel) then
		if playerLevel < 35 then
			maxLevel = 35
			
		else
			maxLevel = 0
		
		end
		
	end
	
	return maxLevel
	
end


local function GuardCharacterCreateArgs()

	return GetGuardMaxLevel(), nil
	
end

local guard01AStateObjects = orderedTable();
	guard01AStateObjects["AREAC_DERMAPTERAN_INFESTATION_CLAIMED"] = { state = InfestationState.Clear,  dbr = "records/creatures/npcs/guard/guard_blacklegion_melee01.dbr" }
	guard01AStateObjects[""] 			= { state = InfestationState.Default, dbr = nil }

function gd.quests.areaCQuestInfestedFields.guard01AOnAddToWorld(objectId)

	if Server then
	
		if (not guardSpawned01A) then
			
			local userdata = {}
			local didWork, newState = TokenStateBasedObjectSwap(objectId, userdata, guard01AStateObjects, Character, GuardCharacterCreateArgs)
			
			Shared.setUserdata(objectId, userdata)
			
			if (newState == InfestationState.Clear) then
				guardSpawned01A = true
			end
			
		end
		
	end
	
end

gd.quests.areaCQuestInfestedFields.guard01AOnOnDestroy = ClearObjectUserdata

local guard02AStateObjects = orderedTable();
	guard02AStateObjects["AREAC_DERMAPTERAN_INFESTATION_CLAIMED"] = { state = InfestationState.Clear,  dbr = "records/creatures/npcs/guard/guard_blacklegion_melee01.dbr" }
	guard02AStateObjects[""] 			= { state = InfestationState.Default, dbr = nil }

function gd.quests.areaCQuestInfestedFields.guard02AOnAddToWorld(objectId)

	if Server then
	
		if (not guardSpawned02A) then
			
			local userdata = {}
			local didWork, newState = TokenStateBasedObjectSwap(objectId, userdata, guard02AStateObjects, Character, GuardCharacterCreateArgs)
			
			Shared.setUserdata(objectId, userdata)
			
			if (newState == InfestationState.Clear) then
				guardSpawned02A = true
			end
			
		end
		
	end
	
end

gd.quests.areaCQuestInfestedFields.guard02AOnOnDestroy = ClearObjectUserdata

local guard01BStateObjects = orderedTable();
	guard01BStateObjects["AREAC_DERMAPTERAN_INFESTATION_CLAIMED"] = { state = InfestationState.Clear,  dbr = "records/creatures/npcs/guard/guard_blacklegion_melee_female01.dbr" }
	guard01BStateObjects[""] 			= { state = InfestationState.Default, dbr = nil }

function gd.quests.areaCQuestInfestedFields.guard01BOnAddToWorld(objectId)

	if Server then
	
		if (not guardSpawned01B) then
			
			local userdata = {}
			local didWork, newState = TokenStateBasedObjectSwap(objectId, userdata, guard01BStateObjects, Character, GuardCharacterCreateArgs)
			
			Shared.setUserdata(objectId, userdata)
			
			if (newState == InfestationState.Clear) then
				guardSpawned01B = true
			end
			
		end
		
	end
	
end

gd.quests.areaCQuestInfestedFields.guard01BOnOnDestroy = ClearObjectUserdata

local guard02BStateObjects = orderedTable();
	guard02BStateObjects["AREAC_DERMAPTERAN_INFESTATION_CLAIMED"] = { state = InfestationState.Clear,  dbr = "records/creatures/npcs/guard/guard_blacklegion_melee01.dbr" }
	guard02BStateObjects[""] 			= { state = InfestationState.Default, dbr = nil }

function gd.quests.areaCQuestInfestedFields.guard02BOnAddToWorld(objectId)

	if Server then
	
		if (not guardSpawned02B) then
			
			local userdata = {}
			local didWork, newState = TokenStateBasedObjectSwap(objectId, userdata, guard02BStateObjects, Character, GuardCharacterCreateArgs)
			
			Shared.setUserdata(objectId, userdata)
			
			if (newState == InfestationState.Clear) then
				guardSpawned02B = true
			end
			
		end
		
	end
	
end

gd.quests.areaCQuestInfestedFields.guard02BOnOnDestroy = ClearObjectUserdata



--
-- Culling the Swarm
--

-- Hive Queen Killed
function gd.quests.areaCQuestInfestedFields.queenKilled()

	GiveTokenToLocalPlayer("AREAC_DERMAPTERANQUEEN_KILLED")
	
end

-- Hive Queen Door
local queenDoorId = 0

function gd.quests.areaCQuestInfestedFields.queenDoorOnAddToWorld(objectId)

	if Server then
	
		queenDoorId = objectId;
		
		local door = Door.Get(objectId)
		local player = Game.GetLocalPlayer()

		if (player:HasToken("AREAC_DERMAPTERANQUEENDOOR_UNLOCKED")) then
			-- Player already unlocked this door
			door:SetLocked(false)
		end
		
	end
		
end

function gd.quests.areaCQuestInfestedFields.queenDoorOnInteract(objectId, userId)

	local player = Player.Get(userId)
	local door = Door.Get(objectId)
		
	if ((door != nil) && (door:IsLocked())) then
		if (player:HasItem("records/items/questitems/quest_dermapteranpheromone_01.dbr", 1, false) && player:HasItem("records/items/questitems/quest_dermapteranpheromone_02.dbr", 1, false)) then
			door:SetLocked(false)
			door:Open()

			GiveTokenToLocalPlayer("AREAC_DERMAPTERANQUEENDOOR_UNLOCKED")
			
			if (player:HasItem("records/items/questitems/quest_dermapteranpheromone_01.dbr", 1, false)) then
				player:TakeItem("records/items/questitems/quest_dermapteranpheromone_01.dbr", 1, false)
			end
			
			if (player:HasItem("records/items/questitems/quest_dermapteranpheromone_02.dbr", 1, false)) then
				player:TakeItem("records/items/questitems/quest_dermapteranpheromone_02.dbr", 1, false)
			end
				
		end
		
	end
	
end

-- Cook Area in Homestead
local chefId = 0
local cookAreaId = 0
local cookAreaSwitch = false

local CookAreaState = { Default = 0, Spawn = 1 }

local chefStateObjects = orderedTable();
	chefStateObjects["AREAC_COOKAREA"] = { state = CookAreaState.Spawn,  dbr = "records/creatures/npcs/flavornpcs/gdareac/npc_homestead_chef_01.dbr" }
	chefStateObjects[""] 			= { state = CookAreaState.Default, dbr = nil }

function gd.quests.areaCQuestInfestedFields.chefOnAddToWorld(objectId)

	if Server then
	
		chefId = objectId;
		
		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, chefStateObjects);
		Shared.setUserdata(objectId, userdata);
		
	end
	
end

gd.quests.areaCQuestInfestedFields.chefOnDestroy = ClearObjectUserdata


local cookAreaStateObjects = orderedTable()
	cookAreaStateObjects["AREAC_COOKAREA"] 	= { state = CookAreaState.Spawn,  dbr = "records/storyelements/questassets/hs_cookarea01_after.dbr"}
	cookAreaStateObjects[""] 				= { state = CookAreaState.Default, dbr = "records/storyelements/questassets/hs_cookarea01_before.dbr" }

function gd.quests.areaCQuestInfestedFields.cookAreaOnAddToWorld(objectId)

	if Server then
	
		cookAreaId = objectId

		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, cookAreaStateObjects)
		Shared.setUserdata(objectId, userdata)
		
	end
	
end

gd.quests.areaCQuestInfestedFields.cookAreaOnDestroy = ClearObjectUserdata

--swap in Cook Area after Dermapteran questline is complete
function gd.quests.areaCQuestInfestedFields.cookAreaSwap()

	if Server then
		local player = Game.GetLocalPlayer()
		
		if (not cookAreaSwitch) && player:HasToken("AREAC_COOKAREA") then
			cookAreaSwitch = true
			local cookArea = Entity.Get(cookAreaId)

			UpdateObjectSwap(chefId, chefStateObjects)
			UpdateObjectSwap(cookAreaId, cookAreaStateObjects)
			
			if (cookArea != nil) then
				local coords = cookArea:GetCoords()
				local pfx = Entity.Create("records/fx/general/bridgerepair_fxpak01.dbr")
			
				if (pfx != nil) then
					pfx:NetworkEnable()
					pfx:SetCoords(coords)
					
				end
			
			end
		
		end
	
	end

end

-- Checks if the player has used the Rations dialogue in Homestead
local hasEaten = false

function gd.quests.areaCQuestInfestedFields.foodCheck()

	local test = false
	
	if not hasEaten then
		test = true
	
	end
	
	return test

end

function gd.quests.areaCQuestInfestedFields.giveFood()
	
	if not hasEaten then
		hasEaten = true
		
	end

end




--
-- Daila's sword only appears on Ultimate difficulty
--
local spawnedUrns = false

local UrnState = { Default = 0, Spawned = 1, Looted = 2 }

local urnStateObjects = orderedTable()
	urnStateObjects["AREAD_DAILASWORD_LOOTED"	] = { state = UrnState.Looted, dbr = nil }
	urnStateObjects["AREAD_DAILASWORD"	] = { state = UrnState.Spawned,  dbr = "records/items/lootchests/questchests/questchest_aread_dailasword_break.dbr"}
	urnStateObjects[""					 	] = { state = UrnState.Default, dbr = nil }

function gd.quests.areaCQuestInfestedFields.urnOnAddToWorld(objectId)

	if Server then
	
		if (not spawnedUrns && Game.GetGameDifficulty() == Game.Difficulty.Legendary) then
			corpseId = objectId

			local userdata = {}
			local didWork, newState = TokenStateBasedObjectSwap(objectId, userdata, urnStateObjects)
			Shared.setUserdata(objectId, userdata)
			
			-- Don't respawn urns next time. If spawned as chest, saved into world
			if (newState == UrnState.Spawned) then
				spawnedUrns = true
				
			end
			
		end
		
	end
	
end

gd.quests.areaCQuestInfestedFields.urnOnDestroy = ClearObjectUserdata

function gd.quests.areaCQuestInfestedFields.urnDestroyedGlobalMP()
	local player = Game.GetLocalPlayer()

	if (player:HasToken("AREAD_DAILASWORD") && player:HasToken("AREAD_DAILASWORD_LOOTED") == false) then
		GiveTokenToLocalPlayer("AREAD_DAILASWORD_LOOTED")
	
	end
	

end

function gd.quests.areaCQuestInfestedFields.urnDestroyed()

	QuestGlobalEvent("dailaSwordFound")

end

