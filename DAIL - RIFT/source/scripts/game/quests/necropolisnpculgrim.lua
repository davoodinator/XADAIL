/*
	
	GRIM DAWN
	
	For more information, visit us at http://www.grimdawn.com
	
*/

gd.quests.necropolisNPCUlgrim = {}

--
-- Ulgrim movement in Act 3
--
-- Ulgrim starts off in the wilderness and can be rescued by the player, at 
-- which point he sets up in a cook area in the prison in devil's crossing.
-- Later he is transported to act 3 regardless of player's earlier intervention.
--

-- b24 hotfix for players who lost quest progress
-- B26 fix for players stuck on Culling the Swarm quest
-- backup bestowal of Emissary spawn token
function gd.quests.necropolisNPCUlgrim.B24HotfixGlobalMP()

	local player = Game.GetLocalPlayer()
	local kQuest = 0xB74DBA00
	local kTask = 0xA117EC00
	local questTaskState = player:GetQuestTaskState(kQuest, kTask)
		
	if (questTaskState != QuestState.InProgress) && (player:HasToken("ULGRIM_HOMESTEAD") == true && (player:HasToken("AREAC_HOMESTEADDOORS_OPEN") == false )) then
		player:GrantQuest(0xB74DBA00, 0xA117EC00)
	
	end
	
	-- B26 fix for players stuck on Culling the Swarm quest
	local kQuestSwarm = 0x1E20C0C0
	local kTaskSwarm = 0xF84AF600
	local questTaskStateSwarm = player:GetQuestTaskState(kQuestSwarm, kTaskSwarm)
	
	if (player:HasToken("AREAC_DERMAPTERANQUEENDOOR_UNLOCKED") && questTaskStateSwarm == QuestState.InProgress) then
		player:CompleteQuest(0x1E20C0C0, 0xF84AF600)
		
	end
	
	-- B26 backup emissary spawn token in case it was somehow missed
	if (player:HasToken("AREAC_AETHERIALABOMINATION_KILLED") && player:HasToken("AREAC_EMISSARY_SPAWN") == false) then
		GiveTokenToLocalPlayer("AREAC_EMISSARY_SPAWN")
	
	end
		
	--B26 hotfix 2, fix for characters that played with an outdated Localization
	if (player:HasToken("CREED_AREAD") && player:HasToken("AREAD_FORTDUNGEON_OPEN") == false) then
		player:GrantQuest(0x55B89100, 0xC8296600)
	
	end
	
	-- B27 hotfix for missing Allies from the Ashes (no longer necessary)
	-- if (player:HasToken("AREAC_CULTISTDOORS_OPEN")) then
		-- player:GrantQuest(0xDF0DCC00, 0x02B5F500)
	
	-- B29 fix for Allies from the Ashes (if player has the choice token but somehow is still on the quest
	local kQuestAllies = 0xDF0DCC00
	local kTaskAllies = 0x02B5F500
	local questTaskStateAllies = player:GetQuestTaskState(kQuestAllies, kTaskAllies)
	
	if (questTaskStateAllies == QuestState.InProgress && (player:HasToken("AREAC_NECROS_CHOSEN") || player:HasToken("AREAC_ZEALOTS_CHOSEN"))) then
		player:CompleteQuest(0xDF0DCC00, 0x02B5F500)
	
	end
	
	--B30 hotfix for missing Blood Harvest or Reaping What you Sow
	local kQuestBloodHarvest = 0x0140404A
	local kTaskBloodHarvest01 = 0x213CBB00
	local kTaskBloodHarvest02 = 0x526E5480
	local kTaskBloodHarvest03 = 0x5976AC00
	
	local questTaskStateBloodHarvest01 = player:GetQuestTaskState(kQuestBloodHarvest, kTaskBloodHarvest01)
	local questTaskStateBloodHarvest02 = player:GetQuestTaskState(kQuestBloodHarvest, kTaskBloodHarvest02)
	local questTaskStateBloodHarvest03 = player:GetQuestTaskState(kQuestBloodHarvest, kTaskBloodHarvest03)
	
	if (questTaskStateBloodHarvest01 == QuestState.Complete && questTaskStateBloodHarvest02 != QuestState.InProgress && questTaskStateBloodHarvest02 != QuestState.Complete) then
		player:GrantQuest(0x0140404A, 0x526E5480)
		
	elseif (questTaskStateBloodHarvest01 == QuestState.Complete && questTaskStateBloodHarvest02 == QuestState.Complete && questTaskStateBloodHarvest03 != QuestState.InProgress && questTaskStateBloodHarvest03 != QuestState.Complete) then
		player:GrantQuest(0x0140404A, 0x5976AC00)
		
	end
	
	local kQuestReaping = 0x1A1369C0
	local kTaskReaping01 = 0xF0803200
	local kTaskReaping02 = 0xA534B400
	
	local questTaskStateReaping01 = player:GetQuestTaskState(kQuestReaping, kTaskReaping01)
	local questTaskStateReaping02 = player:GetQuestTaskState(kQuestReaping, kTaskReaping02)
	
	if (questTaskStateReaping01 == QuestState.Complete && questTaskStateReaping02 != QuestState.InProgress && questTaskStateReaping02 != QuestState.Complete) then
		player:GrantQuest(0x1A1369C0, 0xA534B400)
		
	end
	
	
end

-- B31 Hotfix 4, Resumes Road to Homestead if it somehow gets interrupted
local b31UlgrimFix = false

function gd.quests.necropolisNPCUlgrim.B31HotfixGlobalMP()

	if not b31UlgrimFix then
		b31UlgrimFix = true
		
		local player = Game.GetLocalPlayer()
		
		local kQuest = 0xB74DBA00
		local kTask01 = 0x226722C0
		local kTask02 = 0xA117EC00
		local questTaskState01 = player:GetQuestTaskState(kQuest, kTask01)
		local questTaskState02 = player:GetQuestTaskState(kQuest, kTask02)
			
		if (questTaskState01 == QuestState.Complete && questTaskState02 != QuestState.Complete && questTaskState02 != QuestState.InProgress) then
			player:GrantQuest(0xB74DBA00, 0xA117EC00)
		
		end
	
	end	
	
end


local ulgrimSmugglerPassId = 0
local ulgrimHomesteadId = 0
local refugeeSmugglerPassIds = {0, 0, 0, 0, 0, 0}
local refugeeSmugglerPassStateObjects = { }
local refugeeHomesteadIds = {0, 0, 0, 0, 0, 0}
local refugeeHomesteadStateObjects = { }

local UlgrimState = { SmugglersPass = 0, Homestead = 1, Necropolis = 2 }

-- Ulgrim in Smuggler's Pass
local smugglersPassUlgrimStateObjects = orderedTable();
	smugglersPassUlgrimStateObjects["ULGRIM_AREAD"] = { state = UlgrimState.Necropolis,  dbr = nil }
	smugglersPassUlgrimStateObjects["ULGRIM_HOMESTEAD"] = { state = UlgrimState.Homestead,  dbr = nil }
	smugglersPassUlgrimStateObjects[""]			= { state = UlgrimState.SmugglersPass,  dbr = "records/creatures/npcs/questnpcs/gdareac/npc_ulgrim_03.dbr" }
	
function gd.quests.necropolisNPCUlgrim.smugglersPassUlgrimOnAddToWorld(objectId)

	if Server then
	
		ulgrimSmugglerPassId = objectId;
		
		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, smugglersPassUlgrimStateObjects);
		Shared.setUserdata(objectId, userdata);
		
	end
	
end

gd.quests.necropolisNPCUlgrim.smugglersPassUlgrimOnDestroy = ClearObjectUserdata

-- Ulgrim in Homestead
local homesteadUlgrimStateObjects = orderedTable();
	homesteadUlgrimStateObjects["ULGRIM_AREAD"] = { state = UlgrimState.Necropolis,  dbr = nil }
	homesteadUlgrimStateObjects["ULGRIM_HOMESTEAD"] = { state = UlgrimState.Homestead,  dbr = "records/creatures/npcs/questnpcs/gdareac/npc_ulgrim_04.dbr" }
	homesteadUlgrimStateObjects[""] 			= { state = UlgrimState.SmugglersPass, dbr = nil }
	
function gd.quests.necropolisNPCUlgrim.homesteadUlgrimOnAddToWorld(objectId)

	if Server then
		
		QuestGlobalEvent("ulgrimHotfixToken")
		-- B25 hotfix for players who had their Homestead bounties reset
		QuestGlobalEvent("homesteadBountyHotfix")
		-- B31 hotfix for players who had Road to Homestead reset
		QuestGlobalEvent("b31RoadToHomesteadHotfix")
	
		ulgrimHomesteadId = objectId;
		
		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, homesteadUlgrimStateObjects);
		Shared.setUserdata(objectId, userdata);
		
	end
	
end

gd.quests.necropolisNPCUlgrim.homesteadUlgrimOnDestroy = ClearObjectUserdata


-- Refugees in Smuggler's Pass
local smugglersPassRefugeeOneStateObjects = orderedTable();
	smugglersPassRefugeeOneStateObjects["ULGRIM_HOMESTEAD"] = { state = UlgrimState.Homestead,  dbr = nil }
	smugglersPassRefugeeOneStateObjects[""]			= { state = UlgrimState.SmugglersPass,  dbr = "records/creatures/npcs/questnpcs/gdareac/npc_refugee_collin_01.dbr" }
	
function gd.quests.necropolisNPCUlgrim.smugglersPassRefugeeOneOnAddToWorld(objectId)

	if Server then
	
		refugeeSmugglerPassIds[1] = objectId;
		refugeeSmugglerPassStateObjects[1] = smugglersPassRefugeeOneStateObjects
		
		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, smugglersPassRefugeeOneStateObjects);
		Shared.setUserdata(objectId, userdata);
		
	end
	
end

gd.quests.necropolisNPCUlgrim.smugglersPassRefugeeOneOnDestroy = ClearObjectUserdata


local smugglersPassRefugeeTwoStateObjects = orderedTable();
	smugglersPassRefugeeTwoStateObjects["ULGRIM_HOMESTEAD"] = { state = UlgrimState.Homestead,  dbr = nil }
	smugglersPassRefugeeTwoStateObjects[""]			= { state = UlgrimState.SmugglersPass,  dbr = "records/creatures/npcs/flavornpcs/gdareac/npc_smugglerpassrefugee_01.dbr" }
	
function gd.quests.necropolisNPCUlgrim.smugglersPassRefugeeTwoOnAddToWorld(objectId)

	if Server then
	
		refugeeSmugglerPassIds[2] = objectId;
		refugeeSmugglerPassStateObjects[2] = smugglersPassRefugeeTwoStateObjects
		
		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, smugglersPassRefugeeTwoStateObjects);
		Shared.setUserdata(objectId, userdata);
		
	end
	
end

gd.quests.necropolisNPCUlgrim.smugglersPassRefugeeTwoOnDestroy = ClearObjectUserdata


local smugglersPassRefugeeThreeStateObjects = orderedTable();
	smugglersPassRefugeeThreeStateObjects["ULGRIM_HOMESTEAD"] = { state = UlgrimState.Homestead,  dbr = nil }
	smugglersPassRefugeeThreeStateObjects[""]			= { state = UlgrimState.SmugglersPass,  dbr = "records/creatures/npcs/flavornpcs/gdareac/npc_smugglerpassrefugee_02f.dbr" }
	
function gd.quests.necropolisNPCUlgrim.smugglersPassRefugeeThreeOnAddToWorld(objectId)

	if Server then
	
		refugeeSmugglerPassIds[3] = objectId;
		refugeeSmugglerPassStateObjects[3] = smugglersPassRefugeeThreeStateObjects
		
		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, smugglersPassRefugeeThreeStateObjects);
		Shared.setUserdata(objectId, userdata);
		
	end
	
end

gd.quests.necropolisNPCUlgrim.smugglersPassRefugeeThreeOnDestroy = ClearObjectUserdata


local smugglersPassRefugeeFourStateObjects = orderedTable();
	smugglersPassRefugeeFourStateObjects["ULGRIM_HOMESTEAD"] = { state = UlgrimState.Homestead,  dbr = nil }
	smugglersPassRefugeeFourStateObjects[""]				= { state = UlgrimState.SmugglersPass,  dbr = "records/creatures/npcs/flavornpcs/gdareac/npc_smugglerpassrefugee_03f.dbr" }
	
function gd.quests.necropolisNPCUlgrim.smugglersPassRefugeeFourOnAddToWorld(objectId)

	if Server then
	
		refugeeSmugglerPassIds[4] = objectId;
		refugeeSmugglerPassStateObjects[4] = smugglersPassRefugeeFourStateObjects
		
		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, smugglersPassRefugeeFourStateObjects);
		Shared.setUserdata(objectId, userdata);
		
	end
	
end

gd.quests.necropolisNPCUlgrim.smugglersPassRefugeeFourOnDestroy = ClearObjectUserdata


local smugglersPassRefugeeFiveStateObjects = orderedTable();
	smugglersPassRefugeeFiveStateObjects["ULGRIM_HOMESTEAD"] = { state = UlgrimState.Homestead,  dbr = nil }
	smugglersPassRefugeeFiveStateObjects[""]			= { state = UlgrimState.SmugglersPass,  dbr = "records/creatures/npcs/flavornpcs/gdareac/npc_smugglerpassrefugee_04.dbr" }
	
function gd.quests.necropolisNPCUlgrim.smugglersPassRefugeeFiveOnAddToWorld(objectId)

	if Server then
	
		refugeeSmugglerPassIds[5] = objectId;
		refugeeSmugglerPassStateObjects[5] = smugglersPassRefugeeFiveStateObjects
		
		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, smugglersPassRefugeeFiveStateObjects);
		Shared.setUserdata(objectId, userdata);
		
	end
	
end

gd.quests.necropolisNPCUlgrim.smugglersPassRefugeeFiveOnDestroy = ClearObjectUserdata


local smugglersPassRefugeeSixStateObjects = orderedTable();
	smugglersPassRefugeeSixStateObjects["ULGRIM_HOMESTEAD"] = { state = UlgrimState.Homestead,  dbr = nil }
	smugglersPassRefugeeSixStateObjects[""]			= { state = UlgrimState.SmugglersPass,  dbr = "records/creatures/npcs/flavornpcs/gdareac/npc_smugglerpassrefugee_05c.dbr" }
	
function gd.quests.necropolisNPCUlgrim.smugglersPassRefugeeSixOnAddToWorld(objectId)

	if Server then
	
		refugeeSmugglerPassIds[6] = objectId;
		refugeeSmugglerPassStateObjects[6] = smugglersPassRefugeeSixStateObjects
		
		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, smugglersPassRefugeeSixStateObjects);
		Shared.setUserdata(objectId, userdata);
		
	end
	
end

gd.quests.necropolisNPCUlgrim.smugglersPassRefugeeSixOnDestroy = ClearObjectUserdata


-- Refugees in Homestead
local homesteadRefugeeOneStateObjects = orderedTable();
	homesteadRefugeeOneStateObjects["ULGRIM_HOMESTEAD"] = { state = UlgrimState.Homestead,  dbr = "records/creatures/npcs/questnpcs/gdareac/npc_refugee_collin_02.dbr" }
	homesteadRefugeeOneStateObjects[""] 			= { state = UlgrimState.SmugglersPass, dbr = nil }
	
function gd.quests.necropolisNPCUlgrim.homesteadRefugeeOneOnAddToWorld(objectId)

	if Server then
	
		refugeeHomesteadIds[1] = objectId;
		refugeeHomesteadStateObjects[1] = homesteadRefugeeOneStateObjects
		
		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, homesteadRefugeeOneStateObjects);
		Shared.setUserdata(objectId, userdata);
		
	end
	
end

gd.quests.necropolisNPCUlgrim.homesteadRefugeeOneOnDestroy = ClearObjectUserdata


local homesteadRefugeeTwoStateObjects = orderedTable();
	homesteadRefugeeTwoStateObjects["ULGRIM_HOMESTEAD"] = { state = UlgrimState.Homestead,  dbr = "records/creatures/npcs/flavornpcs/gdareac/npc_smugglerpassrefugee_01hs.dbr" }
	homesteadRefugeeTwoStateObjects[""] 			= { state = UlgrimState.SmugglersPass, dbr = nil }
	
function gd.quests.necropolisNPCUlgrim.homesteadRefugeeTwoOnAddToWorld(objectId)

	if Server then
	
		refugeeHomesteadIds[2] = objectId;
		refugeeHomesteadStateObjects[2] = homesteadRefugeeTwoStateObjects
		
		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, homesteadRefugeeTwoStateObjects);
		Shared.setUserdata(objectId, userdata);
		
	end
	
end

gd.quests.necropolisNPCUlgrim.homesteadRefugeeTwoOnDestroy = ClearObjectUserdata


local homesteadRefugeeThreeStateObjects = orderedTable();
	homesteadRefugeeThreeStateObjects["ULGRIM_HOMESTEAD"] = { state = UlgrimState.Homestead,  dbr = "records/creatures/npcs/flavornpcs/gdareac/npc_smugglerpassrefugee_02fhs.dbr" }
	homesteadRefugeeThreeStateObjects[""] 			= { state = UlgrimState.SmugglersPass, dbr = nil }
	
function gd.quests.necropolisNPCUlgrim.homesteadRefugeeThreeOnAddToWorld(objectId)

	if Server then
	
		refugeeHomesteadIds[3] = objectId;
		refugeeHomesteadStateObjects[3] = homesteadRefugeeThreeStateObjects
		
		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, homesteadRefugeeThreeStateObjects);
		Shared.setUserdata(objectId, userdata);
		
	end
	
end

gd.quests.necropolisNPCUlgrim.homesteadRefugeeThreeOnDestroy = ClearObjectUserdata


local homesteadRefugeeFourStateObjects = orderedTable();
	homesteadRefugeeFourStateObjects["ULGRIM_HOMESTEAD"] = { state = UlgrimState.Homestead,  dbr = "records/creatures/npcs/flavornpcs/gdareac/npc_smugglerpassrefugee_03fhs.dbr" }
	homesteadRefugeeFourStateObjects[""] 			= { state = UlgrimState.SmugglersPass, dbr = nil }
	
function gd.quests.necropolisNPCUlgrim.homesteadRefugeeFourOnAddToWorld(objectId)

	if Server then
	
		refugeeHomesteadIds[4] = objectId;
		refugeeHomesteadStateObjects[4] = homesteadRefugeeFourStateObjects
		
		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, homesteadRefugeeFourStateObjects);
		Shared.setUserdata(objectId, userdata);
		
	end
	
end

gd.quests.necropolisNPCUlgrim.homesteadRefugeeFourOnDestroy = ClearObjectUserdata


local homesteadRefugeeFiveStateObjects = orderedTable();
	homesteadRefugeeFiveStateObjects["ULGRIM_HOMESTEAD"] = { state = UlgrimState.Homestead,  dbr = "records/creatures/npcs/flavornpcs/gdareac/npc_smugglerpassrefugee_04hs.dbr" }
	homesteadRefugeeFiveStateObjects[""] 			= { state = UlgrimState.SmugglersPass, dbr = nil }
	
function gd.quests.necropolisNPCUlgrim.homesteadRefugeeFiveOnAddToWorld(objectId)

	if Server then
	
		refugeeHomesteadIds[5] = objectId;
		refugeeHomesteadStateObjects[5] = homesteadRefugeeFiveStateObjects
		
		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, homesteadRefugeeFiveStateObjects);
		Shared.setUserdata(objectId, userdata);
		
	end
	
end

gd.quests.necropolisNPCUlgrim.homesteadRefugeeFiveOnDestroy = ClearObjectUserdata


local homesteadRefugeeSixStateObjects = orderedTable();
	homesteadRefugeeSixStateObjects["ULGRIM_HOMESTEAD"] = { state = UlgrimState.Homestead,  dbr = "records/creatures/npcs/flavornpcs/gdareac/npc_smugglerpassrefugee_05chs.dbr" }
	homesteadRefugeeSixStateObjects[""] 			= { state = UlgrimState.SmugglersPass, dbr = nil }
	
function gd.quests.necropolisNPCUlgrim.homesteadRefugeeSixOnAddToWorld(objectId)

	if Server then
	
		refugeeHomesteadIds[6] = objectId;
		refugeeHomesteadStateObjects[6] = homesteadRefugeeSixStateObjects
		
		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, homesteadRefugeeSixStateObjects);
		Shared.setUserdata(objectId, userdata);
		
	end
	
end

gd.quests.necropolisNPCUlgrim.homesteadRefugeeSixOnDestroy = ClearObjectUserdata



-- Called by conversation, teleports Ulgrim and the Refugees from Smuggler's Pass to Homestead
local smugglersPassPortal = false

function gd.quests.necropolisNPCUlgrim.smugglersPassPortal()

	if Server then
		local player = Game.GetLocalPlayer()
		
		if player:HasToken("ULGRIM_HOMESTEAD") && smugglersPassPortal == false then
			smugglersPassPortal = true
			
			local ulgrimSmugglerPass = Entity.Get(ulgrimSmugglerPassId)
			local ulgrimHomestead = Entity.Get(ulgrimHomesteadId)
			local refugees = { }			
			local refugeeTotal = table.getn(refugeeSmugglerPassIds)
			local rescuedRefugeeTotal = table.getn(refugeeHomesteadIds)
	
			if (ulgrimSmugglerPass != nil) then
		
				local coords = ulgrimSmugglerPass:GetCoords()
				local riftStart = Entity.Create("records/fx/ui/riftgatepersonalopen_fxpak.dbr")
			
				if (riftStart != nil) then
					riftStart:NetworkEnable()
					riftStart:SetCoords(coords)
				end
			
				UpdateObjectSwap(ulgrimSmugglerPassId, smugglersPassUlgrimStateObjects)
			
			end
		
			if (ulgrimHomestead != nil) then
		
				local coords = ulgrimHomestead:GetCoords()	
				local riftEnd = Entity.Create("records/fx/ui/riftgatepersonalopen_fxpak.dbr")
			
				if (riftEnd != nil) then
					riftEnd:NetworkEnable()
					riftEnd:SetCoords(coords)
				end
			
				UpdateObjectSwap(ulgrimHomesteadId, homesteadUlgrimStateObjects)
			
			end
		
			for id = 1, refugeeTotal do
				refugees[id] = Entity.Get(refugeeSmugglerPassIds[id])
				
				if (refugees[id] != nil) then
					coords = refugees[id]:GetCoords()
					riftStart = Entity.Create("records/fx/ui/riftgatepersonalopen_fxpak.dbr")
			
					if (riftStart != nil) then
						riftStart:NetworkEnable()
						riftStart:SetCoords(coords)
					end
			
					UpdateObjectSwap(refugeeSmugglerPassIds[id], refugeeSmugglerPassStateObjects[id])
					
				end
			
			end

			for id = 1, rescuedRefugeeTotal do
				refugees[id] = Entity.Get(refugeeHomesteadIds[id])
				
				if (refugees[id] != nil) then
					coords = refugees[id]:GetCoords()
					riftEnd = Entity.Create("records/fx/ui/riftgatepersonalopen_fxpak.dbr")
			
					if (riftEnd != nil) then
						riftEnd:NetworkEnable()
						riftEnd:SetCoords(coords)
					end
			
					UpdateObjectSwap(refugeeHomesteadIds[id], refugeeHomesteadStateObjects[id])
				
				end
			
			end
		
		end
		
	end
	
end

-- Called by trigger volume, teleports Ulgrim out of Homestead to Area D
local ulgrimAreaDPortal = false

function gd.quests.necropolisNPCUlgrim.areaDPortal()

	if Server then
		local player = Game.GetLocalPlayer()
		
		if player:HasToken("AREAD_BASE") == false && player:HasToken("ULGRIM_AREAD") && ulgrimAreaDPortal == false then
			ulgrimAreaDPortal = true

			local ulgrimHomestead = Entity.Get(ulgrimHomesteadId)
		
			if (ulgrimHomestead != nil) then
		
				local coords = ulgrimHomestead:GetCoords()	
				local rift = Entity.Create("records/fx/ui/riftgatepersonalopen_fxpak.dbr")
			
				if (rift != nil) then
					rift:NetworkEnable()
					rift:SetCoords(coords)
				end
			
				UpdateObjectSwap(ulgrimHomesteadId, homesteadUlgrimStateObjects)
			
			end
		
		end
		
	end
	
end


-- Script call for Too Late for Rescue Quest
local spawnedRemains = false

local RemainsState = { Default = 0, Looted = 1 }

--Remains Spawn State
local remainsStateObjects = orderedTable()
	remainsStateObjects["AREAC_DEADREFUGEE_FOUND"	] = { state = RemainsState.Looted, dbr = "records/items/lootchests/breakables/a01_bonepilehuman_01_break.dbr"}
	remainsStateObjects[""					 	] = { state = RemainsState.Default, dbr = "records/items/lootchests/questchests/questchest_areacrefugeecorpsechest_01.dbr"}
	

function gd.quests.necropolisNPCUlgrim.remainsOnAddToWorld(objectId)

	if Server then
		if (not spawnedRemains) then
			spawnedRemains = true
			
			local userdata = {}
			local didWork, newState = TokenStateBasedObjectSwap(objectId, userdata, remainsStateObjects)
			
			Shared.setUserdata(objectId, userdata)
		
		end
			
	end
	
end

gd.quests.necropolisNPCUlgrim.remainsOnDestroy = ClearObjectUserdata

function gd.quests.necropolisNPCUlgrim.refugeeRemainsFound()
	local player = Game.GetLocalPlayer()
	
	local questId = 0x06970E10
	local taskId = 0x30E45AC0

	local questTaskState = player:GetQuestTaskState(questId, taskId)

	if (questTaskState == QuestState.InProgress) then
		UI.Notify("tagNotification_AreaC_RefugeeRemainsFound")
		
	end

	GiveTokenToLocalPlayer("AREAC_DEADREFUGEE_FOUND")
	
end

