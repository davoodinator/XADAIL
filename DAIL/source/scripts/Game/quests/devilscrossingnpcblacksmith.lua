/*
	
	GRIM DAWN
	scripts/quests/devilscrossing.lua
	
	For more information, visit us at http://www.grimdawn.com
	
*/

gd.quests.devilsCrossingNPCBlacksmith = {}

--
-- Smith (crafting) spawn control
--
-- The Smith is acquired by settling a dispute between a master and an apprentice. Only one joins the player.
-- The Smith transitions to town where his smithing area swaps and he becomes the crafting NPC.
--

local masterSmithId = 0
local apprenticeSmithId= 0
local townSmithId = 0
local refugeeOneId = 0
local refugeeTwoId = 0
local refugeeThreeId = 0
local smithAreaId = 0
local masterHostileSpawned = false
local masterPortal = false

--
-- B18 Hotfix Blacksmith Quest Fix Script
--
local hotfixTriggered = false

function gd.quests.devilsCrossingNPCBlacksmith.B18HotfixGlobalMP()
	
	if not hotfixTriggered then
		hotfixTriggered = true

		local player = Game.GetLocalPlayer()
		local kQuest_Smith = 0x9B5CC600
		local kTask_Master = 0xBDC84400
		local kTask_Hostile = 0xE301DC00
		local kTask_Apprentice = 0x634E9B80
		local questTaskState = player:GetQuestTaskState(kQuest_Smith, kTask_Master)
		local questTaskState02 = player:GetQuestTaskState(kQuest_Smith, kTask_Hostile)
		local questTaskState03 = player:GetQuestTaskState(kQuest_Smith, kTask_Apprentice)
		
		if (questTaskState == QuestState.InProgress) && (player:HasToken("BLACKSMITH_MASTER") == false) then
			player:GiveToken("BLACKSMITH_MASTER")
			player:RemoveToken("BLACKSMITH_SPAWNED")
			
		elseif (questTaskState != QuestState.InProgress) && (player:HasToken("BLACKSMITH_MASTER") == true) then
			player:GrantQuest(0x9B5CC600, 0xBDC84400)
			
		elseif (questTaskState02 == QuestState.InProgress) && (player:HasToken("BLACKSMITH_MASTERHOSTILE") == false) then
			player:GiveToken("BLACKSMITH_MASTERHOSTILE")
			player:RemoveToken("BLACKSMITH_SPAWNED")
			
		elseif (questTaskState02 != QuestState.InProgress) && (player:HasToken("BLACKSMITH_MASTERHOSTILE") == true) then
			player:GrantQuest(0x9B5CC600, 0xE301DC00)
		
		elseif (questTaskState03 != QuestState.InProgress) && (player:HasToken("BLACKSMITH_APPRENTICE") == true) then
			player:GrantQuest(0x9B5CC600, 0x634E9B80)
				
		end
		
		-- B30 Hotfix for Burrwitch and The Warden
		local kQuestBurrwitch = 0x70691B80
		local kTaskBurrwitch01 = 0x59EB8E00
		local kTaskBurrwitch02 = 0x140EB160
		local kTaskBurrwitch03 = 0x77C29580
		local kTaskBurrwitch04 = 0xF6C5D400
		
		local questTaskStateBurrwitch01 = player:GetQuestTaskState(kQuestBurrwitch, kTaskBurrwitch01)
		local questTaskStateBurrwitch02 = player:GetQuestTaskState(kQuestBurrwitch, kTaskBurrwitch02)
		local questTaskStateBurrwitch03 = player:GetQuestTaskState(kQuestBurrwitch, kTaskBurrwitch03)
		local questTaskStateBurrwitch04 = player:GetQuestTaskState(kQuestBurrwitch, kTaskBurrwitch04)
		
		if (questTaskStateBurrwitch01 == QuestState.Complete && questTaskStateBurrwitch02 != QuestState.InProgress && questTaskStateBurrwitch02 != QuestState.Complete && questTaskStateBurrwitch04 != QuestState.InProgress && questTaskStateBurrwitch04 != QuestState.Complete) then
			player:GrantQuest(0x70691B80, 0x140EB160)
			
		elseif (questTaskStateBurrwitch01 == QuestState.Complete && questTaskStateBurrwitch02 == QuestState.Complete && questTaskStateBurrwitch03 != QuestState.InProgress && questTaskStateBurrwitch03 != QuestState.Complete && questTaskStateBurrwitch04 != QuestState.InProgress && questTaskStateBurrwitch04 != QuestState.Complete) then
			player:GrantQuest(0x70691B80, 0x77C29580)
			
		end
		
		local kQuestWarden = 0xD631D200
		local kTaskWarden01 = 0x44EB9400
		local kTaskWarden02 = 0xAE906500
		local kTaskWarden03 = 0x89D09200
		local kTaskWarden04 = 0xDC054F00
		local kTaskWarden05 = 0x65B6A800
		
		local questTaskStateWarden01 = player:GetQuestTaskState(kQuestWarden, kTaskWarden01)
		local questTaskStateWarden02 = player:GetQuestTaskState(kQuestWarden, kTaskWarden02)
		local questTaskStateWarden03 = player:GetQuestTaskState(kQuestWarden, kTaskWarden03)
		local questTaskStateWarden04 = player:GetQuestTaskState(kQuestWarden, kTaskWarden03)
		local questTaskStateWarden05 = player:GetQuestTaskState(kQuestWarden, kTaskWarden03)
		
		if (questTaskStateWarden01 == QuestState.Complete && questTaskStateWarden02 != QuestState.InProgress && questTaskStateWarden02 != QuestState.Complete && questTaskStateWarden05 != QuestState.InProgress && questTaskStateWarden05 != QuestState.Complete) then
			player:GrantQuest(0xD631D200, 0xAE906500)
			
		elseif (questTaskStateWarden01 == QuestState.Complete && questTaskStateWarden02 == QuestState.Complete && questTaskStateWarden03 != QuestState.InProgress && questTaskStateWarden03 != QuestState.Complete && questTaskStateWarden05 != QuestState.InProgress && questTaskStateWarden05 != QuestState.Complete) then
			player:GrantQuest(0xD631D200, 0x89D09200)
		
		elseif (questTaskStateWarden01 == QuestState.Complete && questTaskStateWarden02 == QuestState.Complete && questTaskStateWarden03 == QuestState.Complete && questTaskStateWarden04 != QuestState.InProgress && questTaskStateWarden04 != QuestState.Complete && questTaskStateWarden05 != QuestState.InProgress && questTaskStateWarden05 != QuestState.Complete) then
			player:GrantQuest(0xD631D200, 0xDC054F00)
			
		end
	
	end

end


--Town Blacksmith
local TownSmithState = { World = 0, Apprentice = 1, Master = 2, ServiceApprentice = 3, ServiceMaster = 4 }

local townBlacksmithStateObjects = orderedTable();
	townBlacksmithStateObjects["BLACKSMITH_SERVICEMASTER"	] = { state = TownSmithState.ServiceMaster,  dbr = "records/creatures/npcs/merchants/blacksmitha01.dbr"};
	townBlacksmithStateObjects["BLACKSMITH_SERVICEAPPRENTICE"	] = { state = TownSmithState.ServiceApprentice,  dbr = "records/creatures/npcs/merchants/blacksmitha02.dbr"};
	townBlacksmithStateObjects["BLACKSMITH_MASTER"	] = { state = TownSmithState.Master,  dbr = "records/creatures/npcs/questnpcs/npc_smithmaster_02.dbr"};
	townBlacksmithStateObjects["BLACKSMITH_APPRENTICE"	] = { state = TownSmithState.Apprentice,  dbr = "records/creatures/npcs/questnpcs/npc_smithapprentice_02.dbr"};
	townBlacksmithStateObjects[""					 	] = { state = TownSmithState.World, dbr = nil };
	
function gd.quests.devilsCrossingNPCBlacksmith.townBlacksmithOnAddToWorld(objectId)

	if Server then

		QuestGlobalEvent("blacksmithHotfixToken")
		-- B25 hotfix for players who had their Devil's Crossing bounties reset
		QuestGlobalEvent("devilsCrossingBountyHotfix")
		
		townSmithId = objectId

		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, townBlacksmithStateObjects);
		Shared.setUserdata(objectId, userdata);
		
	end
	
end

gd.quests.devilsCrossingNPCBlacksmith.townBlacksmithOnDestroy = ClearObjectUserdata


--Master Blacksmith
--Master blacksmith can be persuaded to join DC, or forced to give up his hammer, or killed.
local MasterSmithState = { NotSpawned = 0, Spawned = 1, Hostile = 2, Apprentice = 3, Master = 4, ServiceApprentice = 5, ServiceMaster = 6 }

local masterBlacksmithStateObjects = orderedTable();
	masterBlacksmithStateObjects["BLACKSMITH_SERVICEMASTER"	] = { state = MasterSmithState.ServiceMaster,  dbr = nil };
	masterBlacksmithStateObjects["BLACKSMITH_SERVICEAPPRENTICE"	] = { state = MasterSmithState.ServiceApprentice,  dbr = nil };
	masterBlacksmithStateObjects["BLACKSMITH_MASTER"	] = { state = MasterSmithState.Master,  dbr = nil };
	masterBlacksmithStateObjects["BLACKSMITH_APPRENTICE"	] = { state = MasterSmithState.Apprentice,  dbr = nil };
	masterBlacksmithStateObjects["BLACKSMITH_MASTERHOSTILE"	] = { state = MasterSmithState.Hostile,  dbr = "records/creatures/enemies/boss&quest/blacksmith_master_01.dbr" }
	masterBlacksmithStateObjects["BLACKSMITH_SPAWNED"	] = { state = MasterSmithState.Spawned, dbr = "records/creatures/npcs/questnpcs/npc_smithmaster_01.dbr"};
	masterBlacksmithStateObjects[""					 	] = { state = MasterSmithState.NotSpawned, dbr = nil };

local function CharacterCreateArgs()

	return 0, Entity.Get(masterSmithId):GetCoords().origin
	
end

function gd.quests.devilsCrossingNPCBlacksmith.masterBlacksmithOnAddToWorld(objectId)

	if Server then
		if (masterHostileSpawned == false && masterPortal == false) then

			QuestGlobalEvent("blacksmithHotfixToken")
			
			masterSmithId = objectId
	
			local userdata = {}
			local didWork, newState = TokenStateBasedObjectSwap(objectId, userdata, masterBlacksmithStateObjects, Character, CharacterCreateArgs)
	
			Shared.setUserdata(objectId, userdata)
	
			-- Don't respawn the Master next time. If spawned as hostile, will be saved into the world
			if (newState == MasterSmithState.Hostile) then
				masterHostileSpawned = true
			end
		end
		
	end
	
end

gd.quests.devilsCrossingNPCBlacksmith.masterBlacksmithOnDestroy = ClearObjectUserdata

-- Called by conversation, switches Master to hostile

function gd.quests.devilsCrossingNPCBlacksmith.hostileSwitch()

	if Server then
		local player = Game.GetLocalPlayer()
		
		if player:HasToken("BLACKSMITH_MASTERHOSTILE") && not masterHostileSpawned then
			
			local didWork, newState = UpdateObjectSwap(masterSmithId, masterBlacksmithStateObjects, Character, CharacterCreateArgs)
	
			-- Don't respawn the Master next time. If spawned as hostile, will be saved into the world
			if (newState == MasterSmithState.Hostile) then
				masterHostileSpawned = true
			
			end
	
		end
		
	end
	
end

--Area D Blacksmith
local areaDBlacksmithStateObjects = orderedTable();
	areaDBlacksmithStateObjects["BLACKSMITH_MASTERDEAD"					 	] = { state = MasterSmithState.Hostile, dbr = nil };
	areaDBlacksmithStateObjects["BLACKSMITH_SERVICEAPPRENTICE"	] = { state = MasterSmithState.ServiceApprentice,  dbr = "records/creatures/npcs/questnpcs/gdaread/npc_smithmaster_03.dbr"};
	areaDBlacksmithStateObjects["BLACKSMITH_APPRENTICE"	] = { state = MasterSmithState.Apprentice,  dbr = "records/creatures/npcs/questnpcs/gdaread/npc_smithmaster_03.dbr"};
	areaDBlacksmithStateObjects[""					 	] = { state = MasterSmithState.NotSpawned, dbr = nil };
	
function gd.quests.devilsCrossingNPCBlacksmith.areaDBlacksmithOnAddToWorld(objectId)

	if Server then
		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, areaDBlacksmithStateObjects);
		Shared.setUserdata(objectId, userdata);
		
	end
	
end

gd.quests.devilsCrossingNPCBlacksmith.areaDBlacksmithOnDestroy = ClearObjectUserdata


--Apprentice Blacksmith
--Apprentice Blacksmith will only join DC after he acquires his master's hammer and only after he had some time to help the refugees in his camp.
local apprenticeBlacksmithStateObjects = orderedTable();
	apprenticeBlacksmithStateObjects["BLACKSMITH_SERVICEMASTER"	] = { state = MasterSmithState.ServiceMaster,  dbr = "records/creatures/npcs/questnpcs/npc_smithapprentice_01.dbr"};
	apprenticeBlacksmithStateObjects["BLACKSMITH_SERVICEAPPRENTICE"	] = { state = MasterSmithState.ServiceApprentice,  dbr = nil };
	apprenticeBlacksmithStateObjects["BLACKSMITH_MASTER"	] = { state = MasterSmithState.Master,  dbr = "records/creatures/npcs/questnpcs/npc_smithapprentice_01.dbr"};
	apprenticeBlacksmithStateObjects["BLACKSMITH_APPRENTICE"	] = { state = MasterSmithState.Apprentice,  dbr = nil };
	apprenticeBlacksmithStateObjects["BLACKSMITH_MASTERHOSTILE"	] = { state = MasterSmithState.Hostile,  dbr = "records/creatures/npcs/questnpcs/npc_smithapprentice_01.dbr"};
	apprenticeBlacksmithStateObjects["BLACKSMITH_SPAWNED"	] = { state = MasterSmithState.Spawned,  dbr = "records/creatures/npcs/questnpcs/npc_smithapprentice_01.dbr"};
	apprenticeBlacksmithStateObjects[""					 	] = { state = MasterSmithState.NotSpawned, dbr = "records/creatures/npcs/questnpcs/npc_smithapprentice_01.dbr"};

function gd.quests.devilsCrossingNPCBlacksmith.apprenticeBlacksmithOnAddToWorld(objectId)

	if Server then
		
		apprenticeSmithId = objectId
		
		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, apprenticeBlacksmithStateObjects);
		Shared.setUserdata(objectId, userdata);
		
	end
	
end

gd.quests.devilsCrossingNPCBlacksmith.apprenticeBlacksmithOnDestroy = ClearObjectUserdata


-- Blacksmith Area
local blacksmithAreaStateObjects = orderedTable();
	blacksmithAreaStateObjects["BLACKSMITH_SERVICEMASTER"	] = { state = TownSmithState.ServiceMaster,  dbr = "records/storyelements/questassets/dc_blacksmitharea.dbr"};
	blacksmithAreaStateObjects["BLACKSMITH_SERVICEAPPRENTICE"	] = { state = TownSmithState.ServiceApprentice,  dbr = "records/storyelements/questassets/dc_blacksmitharea.dbr"};
	blacksmithAreaStateObjects["BLACKSMITH_MASTER"	] = { state = TownSmithState.Master,  dbr = "records/storyelements/questassets/dc_blacksmitharea.dbr"};
	blacksmithAreaStateObjects["BLACKSMITH_APPRENTICE"	] = { state = TownSmithState.Apprentice,  dbr = "records/storyelements/questassets/dc_blacksmitharea.dbr"};
	blacksmithAreaStateObjects[""					 	] = { state = TownSmithState.World, dbr = "records/storyelements/questassets/dc_blacksmitharea_wrecked.dbr" };

function gd.quests.devilsCrossingNPCBlacksmith.blacksmithAreaOnAddToWorld(objectId)

	if Server then
		
		QuestGlobalEvent("blacksmithHotfixToken")
	
		smithAreaId = objectId
		
		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, blacksmithAreaStateObjects);
		Shared.setUserdata(objectId, userdata);
		
	end
	
end

function gd.quests.devilsCrossingNPCBlacksmith.blacksmithAreaOnRemoveFromWorld(objectId)

	if Server then
	
		smithAreaId = 0
		
	end
	
end

gd.quests.devilsCrossingNPCBlacksmith.blacksmithAreaOnDestroy = ClearObjectUserdata


--Refugees
local refugeeGuardSpawned = false 

local RefugeeState = { World = 0, Apprentice = 1, ServiceApprentice = 2 }

local refugeeOneStateObjects = orderedTable();
	refugeeOneStateObjects["BLACKSMITH_SERVICEAPPRENTICE"	] = { state = RefugeeState.ServiceApprentice,  dbr = "records/creatures/npcs/flavornpcs/devilscrossing/npc_refugee_female01b.dbr"}
	refugeeOneStateObjects["BLACKSMITH_APPRENTICE"	] = { state = RefugeeState.Apprentice,  dbr = "records/creatures/npcs/flavornpcs/devilscrossing/npc_refugee_female01b.dbr"}
	refugeeOneStateObjects[""					 	] = { state = RefugeeState.World, dbr = "records/creatures/npcs/flavornpcs/devilscrossing/npc_refugee_female01a.dbr"}

function gd.quests.devilsCrossingNPCBlacksmith.refugeeOneOnAddToWorld(objectId)

	if Server then
		
		refugeeOneId = objectId
		
		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, refugeeOneStateObjects);
		Shared.setUserdata(objectId, userdata);
		
	end
	
end

gd.quests.devilsCrossingNPCBlacksmith.refugeeOneOnDestroy = ClearObjectUserdata

local refugeeTwoStateObjects = orderedTable();
	refugeeTwoStateObjects["BLACKSMITH_SERVICEAPPRENTICE"	] = { state = RefugeeState.ServiceApprentice,  dbr = "records/creatures/npcs/flavornpcs/devilscrossing/npc_refugee_male01b.dbr"}
	refugeeTwoStateObjects["BLACKSMITH_APPRENTICE"	] = { state = RefugeeState.Apprentice,  dbr = "records/creatures/npcs/flavornpcs/devilscrossing/npc_refugee_male01b.dbr"}
	refugeeTwoStateObjects[""					 	] = { state = RefugeeState.World, dbr = "records/creatures/npcs/flavornpcs/devilscrossing/npc_refugee_male01a.dbr"}

function gd.quests.devilsCrossingNPCBlacksmith.refugeeTwoOnAddToWorld(objectId)

	if Server then

		refugeeTwoId = objectId
		
		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, refugeeTwoStateObjects);
		Shared.setUserdata(objectId, userdata);
		
	end
	
end

gd.quests.devilsCrossingNPCBlacksmith.refugeeTwoOnDestroy = ClearObjectUserdata

local refugeeThreeStateObjects = orderedTable();
	refugeeThreeStateObjects["BLACKSMITH_SERVICEAPPRENTICE"	] = { state = RefugeeState.ServiceApprentice,  dbr = "records/creatures/npcs/flavornpcs/devilscrossing/npc_refugee_male02b.dbr"}
	refugeeThreeStateObjects["BLACKSMITH_APPRENTICE"	] = { state = RefugeeState.Apprentice,  dbr = "records/creatures/npcs/flavornpcs/devilscrossing/npc_refugee_male02b.dbr"}
	refugeeThreeStateObjects[""					 	] = { state = RefugeeState.World, dbr = "records/creatures/npcs/flavornpcs/devilscrossing/npc_refugee_male02a.dbr"}

function gd.quests.devilsCrossingNPCBlacksmith.refugeeThreeOnAddToWorld(objectId)

	if Server then
		if (not refugeeGuardSpawned) then
			refugeeThreeId = objectId

			local userdata = {};
			TokenStateBasedObjectSwap(objectId, userdata, refugeeThreeStateObjects);
			Shared.setUserdata(objectId, userdata);
		
			if (newState == refugeeThreeStateObjects.ServiceApprentice || newState == refugeeThreeStateObjects.Apprentice) then
				refugeeGuardSpawned = true
				
			end
		
		end
		
	end
	
end

gd.quests.devilsCrossingNPCBlacksmith.refugeeThreeOnDestroy = ClearObjectUserdata


-- Portal master smith to DC to perform swap
function gd.quests.devilsCrossingNPCBlacksmith.blacksmithPortal()

	if Server then
		local player = Game.GetLocalPlayer()
		
		if player:HasToken("BLACKSMITH_MASTER") && not masterPortal then
			local masterSmith = Entity.Get(masterSmithId)
			local townSmith = Entity.Get(townSmithId)
			masterPortal = true
		
			if masterSmith != nil then
		
				local coords = masterSmith:GetCoords();
				local rift = Entity.Create("records/fx/ui/riftgatepersonalopen_fxpak.dbr");
			
				if rift != nil then
					rift:NetworkEnable()
					rift:SetCoords(coords);
				end
			
				UpdateObjectSwap(masterSmithId, masterBlacksmithStateObjects)
			
			end
		
			if (townSmith != nil) then
		
				local coords = townSmith:GetCoords()	
				local riftEnd = Entity.Create("records/fx/ui/riftgatepersonalopen_fxpak.dbr")
			
				if (riftEnd != nil) then
					riftEnd:NetworkEnable()
					riftEnd:SetCoords(coords)
				end
			
				UpdateObjectSwap(townSmithId, townBlacksmithStateObjects)
			
			end
		
			if (smithAreaId != 0) then
				UpdateObjectSwap(smithAreaId, blacksmithAreaStateObjects)
				
			end
	
		end
	
	end
	
end


--Swaps the smith from dialogue NPC to crafting npc after quest turn-in
local blacksmithOpenShop = false

function gd.quests.devilsCrossingNPCBlacksmith.townBlacksmithOpenShop()

	if Server then
		local player = Game.GetLocalPlayer()
		
		if (player:HasToken("BLACKSMITH_SERVICEMASTER") || player:HasToken("BLACKSMITH_SERVICEAPPRENTICE")) && not blacksmithOpenShop then
			blacksmithOpenShop = true
			UpdateObjectSwap(townSmithId, townBlacksmithStateObjects)

		end
		
	end
	
end

--Spawns the Master Blacksmith on quest accept
local masterSpawned = false

function gd.quests.devilsCrossingNPCBlacksmith.spawnMasterBlacksmith()

	if Server then
		local player = Game.GetLocalPlayer()
		
		if player:HasToken("BLACKSMITH_SPAWNED") && masterSpawned == false then
			masterSpawned = true
			UpdateObjectSwap(masterSmithId, masterBlacksmithStateObjects)
		
		end
		
	end
	
end

--Despawn Apprentice in world, if he's still around
local despawnApprentice = false

function gd.quests.devilsCrossingNPCBlacksmith.despawnApprentice()

	if Server then
		local player = Game.GetLocalPlayer()
		
		if (player:HasToken("BLACKSMITH_SERVICEAPPRENTICE") || player:HasToken("BLACKSMITH_APPRENTICE")) && not despawnApprentice then
			despawnApprentice = true
		
			local apprenticeEntity = Entity.Get(apprenticeSmithId)
			local refugeeOneEntity = Entity.Get(refugeeOneId)
			local refugeeTwoEntity = Entity.Get(refugeeTwoId)
			local refugeeThreeEntity = Entity.Get(refugeeThreeId)
		
			if (apprenticeEntity != nil) then
				UpdateObjectSwap(apprenticeSmithId, apprenticeBlacksmithStateObjects)
			end
			
			if (refugeeOneEntity != nil) then
				UpdateObjectSwap(refugeeOneId, refugeeOneStateObjects)
			end
			
			if (refugeeTwoEntity != nil) then
				UpdateObjectSwap(refugeeTwoId, refugeeTwoStateObjects)
			end
			
			if (refugeeThreeEntity != nil && not refugeeGuardSpawned) then
				refugeeGuardSpawned = true
				UpdateObjectSwap(refugeeThreeId, refugeeThreeStateObjects)
			end
			
		end
		
	end
	
end

--Teleport Apprentice to DC if player returns before he spawns by himself
local teleportApprentice = false

function gd.quests.devilsCrossingNPCBlacksmith.teleportApprentice()

	if Server then
		local player = Game.GetLocalPlayer()
		
		if (player:HasToken("BLACKSMITH_SERVICEAPPRENTICE") || player:HasToken("BLACKSMITH_APPRENTICE")) && not teleportApprentice then
			teleportApprentice = true
			
			local apprenticeEntity = Entity.Get(apprenticeSmithId)
			local refugeeOneEntity = Entity.Get(refugeeOneId)
			local refugeeTwoEntity = Entity.Get(refugeeTwoId)
			local refugeeThreeEntity = Entity.Get(refugeeThreeId)
			local smithAreaEntity = Entity.Get(smithAreaId)
			local apprenticeTownEntity = Entity.Get(townSmithId)
		
			if (apprenticeEntity != nil) then
				UpdateObjectSwap(apprenticeSmithId, apprenticeBlacksmithStateObjects)
			end
			
			if (refugeeOneEntity != nil) then
				UpdateObjectSwap(refugeeOneId, refugeeOneStateObjects)
			end
			
			if (refugeeTwoEntity != nil) then
				UpdateObjectSwap(refugeeTwoId, refugeeTwoStateObjects)
			end
			
			if (refugeeThreeEntity != nil && not refugeeGuardSpawned) then
				refugeeGuardSpawned = true
				UpdateObjectSwap(refugeeThreeId, refugeeThreeStateObjects)
			end
			
			if (smithAreaEntity != nil) then
				UpdateObjectSwap(smithAreaId, blacksmithAreaStateObjects)
			end
			
			if (apprenticeTownEntity != nil) then
				UpdateObjectSwap(townSmithId, townBlacksmithStateObjects)
			end
			
		end
		
	end
	
end


--
-- Give out the token for forcing Master
--
function gd.quests.devilsCrossingNPCBlacksmith.masterForcedTokenGlobalMP()

	local player = Game.GetLocalPlayer()

	local kQuest_Smith = 0x9B5CC600
	local kTask_Smith = 0x8F083300

	local questTaskState = player:GetQuestTaskState(kQuest_Smith, kTask_Smith)
	
	if (player != nil && questTaskState == QuestState.InProgress) then
		player:GiveToken("BLACKSMITH_FORCED")

	end

end
