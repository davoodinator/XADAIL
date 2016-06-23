/*
	
	GRIM DAWN
	
	For more information, visit us at http://www.grimdawn.com
	
*/

gd.quests.areaCQuestTrappedAndAlone = {}

--
-- Village of rovers that locked away a demonic child. You can release the demon, causing it to take revenge on the rovers, or destroy it within the cave where it was trapped.
--

local bossCaveId = 0
local bossVillageId = 0
local spawnedBoss = false

local rover01Id = 0
local rover02Id = 0
local rover03Id = 0
local rover04Id = 0

local fire01Id = 0
local fire02Id = 0

--Toggling Demon and Rover Village states
local TrappedState = { Default = 0, HostileCave = 1, KilledCave = 2, VillageHostile = 3, VillageKilled = 4 }

--Demon in Cave
local demonCaveStateObjects = orderedTable();
	demonCaveStateObjects["AREAC_TRAPPEDANDALONE_VILLAGEKILLED"	] = { state = TrappedState.VillageKilled, dbr = nil}
	demonCaveStateObjects["AREAC_TRAPPEDANDALONE_VILLAGEHOSTILE"	] = { state = TrappedState.VillageHostile, dbr = nil}
	demonCaveStateObjects["AREAC_TRAPPEDANDALONE_CAVEKILLED"	] = { state = TrappedState.KilledCave, dbr = nil}
	demonCaveStateObjects["AREAC_TRAPPEDANDALONE_CAVEHOSTILE"	] = { state = TrappedState.HostileCave, dbr = "records/creatures/enemies/boss&quest/chthonianfiend_trappedandalone_01.dbr"}
	demonCaveStateObjects[""					 	] = { state = TrappedState.Default, dbr = "records/creatures/npcs/questnpcs/gdareac/npc_kalista_01.dbr"}

local function CharacterCreateArgs()

	return 0, Entity.Get(bossCaveId):GetCoords().origin
	
end

function gd.quests.areaCQuestTrappedAndAlone.demonCaveOnAddToWorld(objectId)
	
	if Server then
		if (not spawnedBoss) then
			bossCaveId = objectId
		
			local userdata = {};
			local didWork, newState = TokenStateBasedObjectSwap(objectId, userdata, demonCaveStateObjects, Character, CharacterCreateArgs)
		
			Shared.setUserdata(objectId, userdata);
		
			--Don't respawn Demon next time. If spawned as hostile, will be saved into the world
			if (newState == TrappedState.HostileCave) then
				spawnedBoss = true
				
			end
		
		end
		
	end
	
end

gd.quests.areaCQuestTrappedAndAlone.demonCaveOnDestroy = ClearObjectUserdata


function gd.quests.areaCQuestTrappedAndAlone.hostileSwitch()

	if Server then
		if not spawnedBoss then
			local bossCave = Entity.Get(bossCaveId)
			
			if bossCave != nil then
				local coords = bossCave:GetCoords()
				local rift = Entity.Create("records/fx/ui/riftgatepersonalopen_fxpak.dbr")
			
				if (rift != nil) then
					rift:NetworkEnable()
					rift:SetCoords(coords)
					
				end
				
			end
			
			local didWork, newState = UpdateObjectSwap(bossCaveId, demonCaveStateObjects, Character, CharacterCreateArgs)
	
			-- Don't respawn Demon next time. If spawned as hostile, will be saved into the world
			if (newState == TrappedState.HostileCave) then
				spawnedBoss = true
			
			end
		
		end
	
	end

end

--Demon in Village
local demonVillageStateObjects = orderedTable();
	demonVillageStateObjects["AREAC_TRAPPEDANDALONE_VILLAGEKILLED"	] = { state = TrappedState.VillageKilled, dbr = nil}
	demonVillageStateObjects["AREAC_TRAPPEDANDALONE_VILLAGEHOSTILE"	] = { state = TrappedState.VillageHostile, dbr = "records/creatures/enemies/boss&quest/chthonianfiend_trappedandalone_01.dbr"}
	demonVillageStateObjects["AREAC_TRAPPEDANDALONE_CAVEKILLED"	] = { state = TrappedState.KilledCave, dbr = nil}
	demonVillageStateObjects["AREAC_TRAPPEDANDALONE_CAVEHOSTILE"	] = { state = TrappedState.HostileCave, dbr = nil}
	demonVillageStateObjects[""					 	] = { state = TrappedState.Default, dbr = nil }

local function CharacterVillageCreateArgs()

	return 0, Entity.Get(bossVillageId):GetCoords().origin
	
end

function gd.quests.areaCQuestTrappedAndAlone.demonVillageOnAddToWorld(objectId)
	
	if Server then
		if (not spawnedBoss) then
			bossVillageId = objectId
		
			local userdata = {};
			local didWork, newState = TokenStateBasedObjectSwap(objectId, userdata, demonVillageStateObjects, Character, CharacterVillageCreateArgs)
		
			Shared.setUserdata(objectId, userdata);
		
			--Don't respawn Demon next time. If spawned as hostile, will be saved into the world
			if (newState == TrappedState.VillageHostile) then
				spawnedBoss = true
				
			end
		
		end
		
	end
	
end

gd.quests.areaCQuestTrappedAndAlone.demonVillageOnDestroy = ClearObjectUserdata


--Rover 1
local rover01StateObjects = orderedTable();
	rover01StateObjects["AREAC_TRAPPEDANDALONE_VILLAGEKILLED"	] = { state = TrappedState.VillageKilled, dbr = "records/level art/carnage/corpse_human_burned_02.dbr"}
	rover01StateObjects["AREAC_TRAPPEDANDALONE_VILLAGEHOSTILE"	] = { state = TrappedState.VillageHostile, dbr = "records/level art/carnage/corpse_human_burned_02.dbr"}
	rover01StateObjects["AREAC_TRAPPEDANDALONE_CAVEKILLED"	] = { state = TrappedState.KilledCave, dbr = "records/creatures/npcs/flavornpcs/gdareac/npc_trappedandalone_male_01.dbr"}
	rover01StateObjects["AREAC_TRAPPEDANDALONE_CAVEHOSTILE"	] = { state = TrappedState.HostileCave, dbr = "records/creatures/npcs/flavornpcs/gdareac/npc_trappedandalone_male_01.dbr"}
	rover01StateObjects[""					 	] = { state = TrappedState.Default, dbr = "records/creatures/npcs/flavornpcs/gdareac/npc_trappedandalone_male_01.dbr"}

function gd.quests.areaCQuestTrappedAndAlone.rover01OnAddToWorld(objectId)
	
	if Server then
		rover01Id= objectId

		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, rover01StateObjects);
		Shared.setUserdata(objectId, userdata);
	
	end
	
end

gd.quests.areaCQuestTrappedAndAlone.rover01OnDestroy = ClearObjectUserdata


--Rover 2
local rover02StateObjects = orderedTable();
	rover02StateObjects["AREAC_TRAPPEDANDALONE_VILLAGEKILLED"	] = { state = TrappedState.VillageKilled, dbr = "records/level art/carnage/corpse_human_burned_01.dbr"}
	rover02StateObjects["AREAC_TRAPPEDANDALONE_VILLAGEHOSTILE"	] = { state = TrappedState.VillageHostile, dbr = "records/level art/carnage/corpse_human_burned_01.dbr"}
	rover02StateObjects["AREAC_TRAPPEDANDALONE_CAVEKILLED"	] = { state = TrappedState.KilledCave, dbr = "records/creatures/npcs/flavornpcs/gdareac/npc_trappedandalone_male_02.dbr"}
	rover02StateObjects["AREAC_TRAPPEDANDALONE_CAVEHOSTILE"	] = { state = TrappedState.HostileCave, dbr = "records/creatures/npcs/flavornpcs/gdareac/npc_trappedandalone_male_02.dbr"}
	rover02StateObjects[""					 	] = { state = TrappedState.Default, dbr = "records/creatures/npcs/flavornpcs/gdareac/npc_trappedandalone_male_02.dbr"}

function gd.quests.areaCQuestTrappedAndAlone.rover02OnAddToWorld(objectId)
	
	if Server then
		rover02Id= objectId

		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, rover02StateObjects);
		Shared.setUserdata(objectId, userdata);
	
	end
	
end

gd.quests.areaCQuestTrappedAndAlone.rover02OnDestroy = ClearObjectUserdata

--Rover 3
local rover03StateObjects = orderedTable();
	rover03StateObjects["AREAC_TRAPPEDANDALONE_VILLAGEKILLED"	] = { state = TrappedState.VillageKilled, dbr = "records/level art/carnage/corpse_human_burned_02.dbr"}
	rover03StateObjects["AREAC_TRAPPEDANDALONE_VILLAGEHOSTILE"	] = { state = TrappedState.VillageHostile, dbr = "records/level art/carnage/corpse_human_burned_02.dbr"}
	rover03StateObjects["AREAC_TRAPPEDANDALONE_CAVEKILLED"	] = { state = TrappedState.KilledCave, dbr = "records/creatures/npcs/flavornpcs/gdareac/npc_trappedandalone_female_01.dbr"}
	rover03StateObjects["AREAC_TRAPPEDANDALONE_CAVEHOSTILE"	] = { state = TrappedState.HostileCave, dbr = "records/creatures/npcs/flavornpcs/gdareac/npc_trappedandalone_female_01.dbr"}
	rover03StateObjects[""					 	] = { state = TrappedState.Default, dbr = "records/creatures/npcs/flavornpcs/gdareac/npc_trappedandalone_female_01.dbr"}

function gd.quests.areaCQuestTrappedAndAlone.rover03OnAddToWorld(objectId)
	
	if Server then
		rover03Id= objectId

		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, rover03StateObjects);
		Shared.setUserdata(objectId, userdata);
	
	end
	
end

gd.quests.areaCQuestTrappedAndAlone.rover03OnDestroy = ClearObjectUserdata

--Rover 4
local rover04StateObjects = orderedTable();
	rover04StateObjects["AREAC_TRAPPEDANDALONE_VILLAGEKILLED"	] = { state = TrappedState.VillageKilled, dbr = "records/level art/carnage/corpse_human_burned_03.dbr"}
	rover04StateObjects["AREAC_TRAPPEDANDALONE_VILLAGEHOSTILE"	] = { state = TrappedState.VillageHostile, dbr = "records/level art/carnage/corpse_human_burned_03.dbr"}
	rover04StateObjects["AREAC_TRAPPEDANDALONE_CAVEKILLED"	] = { state = TrappedState.KilledCave, dbr = "records/creatures/npcs/flavornpcs/gdareac/npc_trappedandalone_female_02.dbr"}
	rover04StateObjects["AREAC_TRAPPEDANDALONE_CAVEHOSTILE"	] = { state = TrappedState.HostileCave, dbr = "records/creatures/npcs/flavornpcs/gdareac/npc_trappedandalone_female_02.dbr"}
	rover04StateObjects[""					 	] = { state = TrappedState.Default, dbr = "records/creatures/npcs/flavornpcs/gdareac/npc_trappedandalone_female_02.dbr"}

function gd.quests.areaCQuestTrappedAndAlone.rover04OnAddToWorld(objectId)
	
	if Server then
		rover04Id= objectId

		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, rover04StateObjects);
		Shared.setUserdata(objectId, userdata);
	
	end
	
end

gd.quests.areaCQuestTrappedAndAlone.rover04OnDestroy = ClearObjectUserdata

--Fire 1
local fireStateObjects = orderedTable();
	fireStateObjects["AREAC_TRAPPEDANDALONE_VILLAGEKILLED"	] = { state = TrappedState.VillageKilled, dbr = "records/fx/ambient/fx_firebonfire01.dbr"}
	fireStateObjects["AREAC_TRAPPEDANDALONE_VILLAGEHOSTILE"	] = { state = TrappedState.VillageHostile, dbr = "records/fx/ambient/fx_firebonfire01.dbr"}
	fireStateObjects["AREAC_TRAPPEDANDALONE_CAVEKILLED"	] = { state = TrappedState.KilledCave, dbr = nil}
	fireStateObjects["AREAC_TRAPPEDANDALONE_CAVEHOSTILE"	] = { state = TrappedState.HostileCave, dbr = nil}
	fireStateObjects[""					 	] = { state = TrappedState.Default, dbr = nil}

function gd.quests.areaCQuestTrappedAndAlone.fire01OnAddToWorld(objectId)
	
	if Server then
		fire01Id= objectId

		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, fireStateObjects);
		Shared.setUserdata(objectId, userdata);
	
	end
	
end

gd.quests.areaCQuestTrappedAndAlone.fire01OnDestroy = ClearObjectUserdata

--Fire 2
function gd.quests.areaCQuestTrappedAndAlone.fire02OnAddToWorld(objectId)
	
	if Server then
		fire02Id= objectId

		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, fireStateObjects);
		Shared.setUserdata(objectId, userdata);
	
	end
	
end

gd.quests.areaCQuestTrappedAndAlone.fire02OnDestroy = ClearObjectUserdata


--Triggered by conversation. Swaps the village to destroyed state and spawns the demon
local villageSwapped = false

function gd.quests.areaCQuestTrappedAndAlone.villageSwap()
	
	if Server && not villageSwapped then
		villageSwapped = true
		
		local rover01 = Entity.Get(rover01Id)
		local rover02 = Entity.Get(rover02Id)
		local rover03 = Entity.Get(rover03Id)
		local rover04 = Entity.Get(rover04Id)
		local fire01 = Entity.Get(fire01Id)
		local fire02 = Entity.Get(fire02Id)
		local bossVillage = Entity.Get(bossVillageId)
		local bossCave = Entity.Get(bossCaveId)
		
		if rover01 != nil then		
			UpdateObjectSwap(rover01Id, rover01StateObjects)
		end
		
		if rover02 != nil then		
			UpdateObjectSwap(rover02Id, rover02StateObjects)
		end
		
		if rover03 != nil then		
			UpdateObjectSwap(rover03Id, rover03StateObjects)
		end
		
		if rover04 != nil then		
			UpdateObjectSwap(rover04Id, rover04StateObjects)
		end

		if fire01 != nil then		
			UpdateObjectSwap(fire01Id, fireStateObjects)
		end
		
		if fire02 != nil then		
			UpdateObjectSwap(fire02Id, fireStateObjects)
		end
		
		if bossCave != nil then
			local coords = bossCave:GetCoords()
			local rift = Entity.Create("records/fx/ui/riftgatepersonalopen_fxpak.dbr")
		
			if (rift != nil) then
				rift:NetworkEnable()
				rift:SetCoords(coords)
			end
			
			UpdateObjectSwap(bossCaveId, demonCaveStateObjects)
		
		end
		
		if not spawnedBoss then
		
			local didWork, newState = UpdateObjectSwap(bossVillageId, demonVillageStateObjects, Character, CharacterVillageCreateArgs)
	
			-- Don't respawn Demon next time. If spawned as hostile, will be saved into the world
			if (newState == TrappedState.VillageHostile) then
				spawnedBoss = true
			
			end
		
		end
	
	end
	
end


-- Called by trigger, quest is waiting on a token to progress
function gd.quests.areaCQuestTrappedAndAlone.returnToVillageGlobalMP()
	local player = Game.GetLocalPlayer()
	local kQuest = 0x867DFE00
	local kTask = 0x0703C760
	local questTaskState = player:GetQuestTaskState(kQuest, kTask)
		
	if (player != nil) && (questTaskState == QuestState.InProgress) then
		GiveTokenToLocalPlayer("AREAC_TRAPPEDANDALONE_VILLAGERETURN")
	end

end

function gd.quests.areaCQuestTrappedAndAlone.returnToVillage(triggererId)
	local player = Player.Get(triggererId)
	local kQuest = 0x867DFE00
	local kTask = 0x0703C760
	local questTaskState = player:GetQuestTaskState(kQuest, kTask)
		
	QuestGlobalEvent("trappedAndAloneReturnToVillageToken")

	if (player != nil) && (questTaskState == QuestState.InProgress) then
		UI.Notify("tagNotification_AreaC_TrappedAndAloneReturn")
		GiveTokenIfPlayer(triggererId, "AREAC_TRAPPEDANDALONE_VILLAGERETURN")
		
	end
	
end


--
-- Barricade
--
local BlockadeState = { Default = 0, Destroyed = 1 }

local blockadeId = 0
local detonationSiteId = 0
local spawnedBlockade = false

local blockadeStateObjects = orderedTable();
	blockadeStateObjects["TRAPPEDANDALONE_BLOCKADECLEARED"]	= { state = BlockadeState.Destroyed,  dbr = nil }
	blockadeStateObjects[""] 								= { state = BlockadeState.Default, dbr = "records/storyelements/questassets/debriswall_trappedandalone_break.dbr" }

function gd.quests.areaCQuestTrappedAndAlone.blockadeOnAddToWorld(objectId)

	if Server then
	
		if (not spawnedBlockade) then

			local userdata = {};
			TokenStateBasedObjectSwap(objectId, userdata, blockadeStateObjects);
			Shared.setUserdata(objectId, userdata);
			
			spawnedBlockade = true
			
		end
		
	end
	
end

function gd.quests.areaCQuestTrappedAndAlone.blockadeAvatarOnAddToWorld(objectId)

	if Server then
	
		blockadeId = objectId
		
	end
	
end

gd.quests.areaCQuestTrappedAndAlone.blockadeOnDestroy = ClearObjectUserdata
	
-- Detonation Site
local detonationSiteStateObjects = orderedTable();
	detonationSiteStateObjects["TRAPPEDANDALONE_BLOCKADECLEARED"]	= { state = BlockadeState.Destroyed,  dbr = nil }
	detonationSiteStateObjects[""] 								= { state = BlockadeState.Default, dbr = "records/creatures/npcs/questnpcs/interactiveobjects/npc_detonationsite_trappedandalone.dbr" }

function gd.quests.areaCQuestTrappedAndAlone.detonationSiteOnAddToWorld(objectId)

	if Server then
		detonationSiteId = objectId
	
		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, detonationSiteStateObjects);
		Shared.setUserdata(objectId, userdata);
		
	end
	
end

gd.quests.areaCQuestTrappedAndAlone.detonationSiteOnDestroy = ClearObjectUserdata

-- UG Door
local caveEntranceId = 0

function gd.quests.areaCQuestTrappedAndAlone.caveEntranceOnAddToWorld(objectId)

	if Server then
	
		caveEntranceId = objectId;
		
		local door = Door.Get(objectId)
		local player = Game.GetLocalPlayer()

		if (player:HasToken("TRAPPEDANDALONE_BLOCKADECLEARED")) then
			-- Player already unlocked this door
			door:SetLocked(false)
			door:Open()
		end
		
	end
		
end

-- Destroy Blockade
function gd.quests.areaCQuestTrappedAndAlone.blockadeDestroyGlobalMP()
	
	GiveTokenToLocalPlayer("TRAPPEDANDALONE_BLOCKADECLEARED")

end

function gd.quests.areaCQuestTrappedAndAlone.blockadeDestroy()

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
		
		GiveTokenToLocalPlayer("TRAPPEDANDALONE_BLOCKADECLEARED")
		QuestGlobalEvent("trappedAndAloneBlockadeToken")

		local door = Door.Get(caveEntranceId)
			
		if ((door != nil) && (door:IsLocked())) then
			door:SetLocked(false)
			door:Open()
			
		end
	
	end
	
end

