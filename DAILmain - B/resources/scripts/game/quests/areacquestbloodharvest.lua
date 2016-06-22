/*
	
	GRIM DAWN
	
	For more information, visit us at http://www.grimdawn.com
	
*/

gd.quests.areaCQuestBloodHarvest = {}


-- Cultist Summoner Killed
local bossDoor01 = 0
local bossDoor01Open = false
local bossDoor02 = 0
local bossDoor02Open = false
local bossDoor03 = 0
local bossDoor03Open = false
local bossDoor04 = 0
local bossDoor04Open = false
local bossChestId = 0
local bossDead = false

function gd.quests.areaCQuestBloodHarvest.bossDoor01OnAddToWorld(objectId)
	if Server then
		bossDoor01 = objectId
		
		if bossDead && not bossDoor01Open then
			bossDoor01Open = true
			local door = Door.Get(objectId)
			
			door:Open()
			door:SetLocked(false)
		
		end
		
	end
	
end

function gd.quests.areaCQuestBloodHarvest.bossDoor02OnAddToWorld(objectId)
	if Server then
		bossDoor02 = objectId
		
		if bossDead && not bossDoor02Open then
			bossDoor02Open = true
			local door = Door.Get(objectId)
			
			door:Open()
			door:SetLocked(false)
		
		end
		
	end
	
end

function gd.quests.areaCQuestBloodHarvest.bossDoor03OnAddToWorld(objectId)
	if Server then
		bossDoor03 = objectId
		
		if bossDead && not bossDoor03Open then
			bossDoor03Open = true
			local door = Door.Get(objectId)
			
			door:Open()
			door:SetLocked(false)
		
		end
		
	end
	
end

function gd.quests.areaCQuestBloodHarvest.bossDoor04OnAddToWorld(objectId)
	if Server then
		bossDoor04 = objectId
		
		if bossDead && not bossDoor04Open then
			bossDoor04Open = true
			local door = Door.Get(objectId)
			
			door:Open()
			door:SetLocked(false)
		
		end
		
	end
	
end


function gd.quests.areaCQuestBloodHarvest.cultistSummonerKilled()

	GiveTokenToLocalPlayer("AREAC_CULTISTSUMMONER_KILLED")
	
	if Server then
		bossDead = true
		
		local player = Game.GetLocalPlayer()
		local chest = Chest.Get(bossChestId);
		
		-- Unlock chest if present
		if (chest ~= nil) then
			chest:SetLocked(false)
		end
		
		-- Unlock doors
		local door01 = Door.Get(bossDoor01)	
		local door02 = Door.Get(bossDoor02)
		local door03 = Door.Get(bossDoor03)
		local door04 = Door.Get(bossDoor04)
	
		if door01 ~= nil then
			door01:Open()
			
		
		end
	
		if door02 ~= nil then
			door02:Open()
		
		end
		
		if door03 ~= nil then
			door03:Open()
		
		end
		
		if door04 ~= nil then
			door04:Open()
		
		end
		
	end
	
end



function gd.quests.areaCQuestBloodHarvest.bossChestOnAddToWorld(objectId)
	
	if Server then
		local chestEntity = Entity.Get(objectId)
		bossChestId = objectId
		player = Game.GetLocalPlayer()
	
		if (player != nil) && (chestEntity:IsReloaded() == false) && (player:AnyoneHasToken("DUNGEONCHEST_CULTISTSUMMONER")) then
			print "Destroying Chest"
			chestEntity:Destroy()
			
		end
		
	end
	
end

function gd.quests.areaCQuestBloodHarvest.bossChestFound()

	GiveTokenToLocalPlayer("DUNGEONCHEST_CULTISTSUMMONER")
	
end


--
-- Prisoners for the Blood Harvest, including Lisandra, a quest NPC
--

local prisonerIds = {0, 0, 0}
local prisonerStateObjects = { }
local rescuedIds = {0, 0, 0}
local rescuedStateObjects = { }

local BloodHarvestState = { Default = 0, Rescued = 1 }

--Lisandra Rescued
local lisandraRescuedStateObjects = orderedTable();
	lisandraRescuedStateObjects["AREAC_BLOODHARVEST_RESCUED"	] = { state = BloodHarvestState.Rescued, dbr = "records/creatures/npcs/questnpcs/gdareac/npc_lisandra_02.dbr" }
	lisandraRescuedStateObjects[""					 	] = { state = BloodHarvestState.Default, dbr = nil }

function gd.quests.areaCQuestBloodHarvest.lisandraRescuedOnAddToWorld(objectId)

	if Server then
		rescuedIds[1] = objectId
		rescuedStateObjects[1] = lisandraRescuedStateObjects
	
		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, lisandraRescuedStateObjects);
		Shared.setUserdata(objectId, userdata);
		
	end
	
end

gd.quests.areaCQuestBloodHarvest.lisandraRescuedOnDestroy = ClearObjectUserdata
	
--Lisandra Captive
local lisandraCaptiveStateObjects = orderedTable();
	lisandraCaptiveStateObjects["AREAC_BLOODHARVEST_RESCUED"	] = { state = BloodHarvestState.Rescued, dbr = nil }
	lisandraCaptiveStateObjects[""					 	] = { state = BloodHarvestState.Default, dbr = "records/creatures/npcs/questnpcs/gdareac/npc_lisandra_01.dbr" }

function gd.quests.areaCQuestBloodHarvest.lisandraCaptiveOnAddToWorld(objectId)

	if Server then
		prisonerIds[1] = objectId
		prisonerStateObjects[1] = lisandraCaptiveStateObjects
	
		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, lisandraCaptiveStateObjects)
		Shared.setUserdata(objectId, userdata);
	
	end
	
end

gd.quests.areaCQuestBloodHarvest.lisandraCaptiveOnDestroy = ClearObjectUserdata

--Prisoner 01 Rescued
local prisoner01RescuedStateObjects = orderedTable();
	prisoner01RescuedStateObjects["AREAC_BLOODHARVEST_RESCUED"	] = { state = BloodHarvestState.Rescued, dbr = "records/creatures/npcs/flavornpcs/gdareac/npc_bloodharvest_male_01rescued.dbr" }
	prisoner01RescuedStateObjects[""					 	] = { state = BloodHarvestState.Default, dbr = nil }

function gd.quests.areaCQuestBloodHarvest.prisoner01RescuedOnAddToWorld(objectId)

	if Server then
		rescuedIds[2] = objectId
		rescuedStateObjects[2] = prisoner01RescuedStateObjects
	
		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, prisoner01RescuedStateObjects);
		Shared.setUserdata(objectId, userdata);
	
	end
	
end

gd.quests.areaCQuestBloodHarvest.prisoner01RescuedOnDestroy = ClearObjectUserdata

--Prisoner 01 Captive
local prisoner01CaptiveStateObjects = orderedTable();
	prisoner01CaptiveStateObjects["AREAC_BLOODHARVEST_RESCUED"	] = { state = BloodHarvestState.Rescued, dbr = nil }
	prisoner01CaptiveStateObjects[""					 	] = { state = BloodHarvestState.Default, dbr = "records/creatures/npcs/flavornpcs/gdareac/npc_bloodharvest_male_01.dbr" }

function gd.quests.areaCQuestBloodHarvest.prisoner01CaptiveOnAddToWorld(objectId)

	if Server then
		prisonerIds[2] = objectId
		prisonerStateObjects[2] = prisoner01CaptiveStateObjects
	
		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, prisoner01CaptiveStateObjects);
		Shared.setUserdata(objectId, userdata);
	
	end
	
end

gd.quests.areaCQuestBloodHarvest.prisoner01CaptiveOnDestroy = ClearObjectUserdata


--Prisoner 02 Rescued
local prisoner02RescuedStateObjects = orderedTable();
	prisoner02RescuedStateObjects["AREAC_BLOODHARVEST_RESCUED"	] = { state = BloodHarvestState.Rescued, dbr = "records/creatures/npcs/flavornpcs/gdareac/npc_bloodharvest_male_02rescued.dbr" }
	prisoner02RescuedStateObjects[""					 	] = { state = BloodHarvestState.Default, dbr = nil }

function gd.quests.areaCQuestBloodHarvest.prisoner02RescuedOnAddToWorld(objectId)

	if Server then
		rescuedIds[3] = objectId
		rescuedStateObjects[3] = prisoner02RescuedStateObjects
	
		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, prisoner02RescuedStateObjects);
		Shared.setUserdata(objectId, userdata);
	
	end
	
end

gd.quests.areaCQuestBloodHarvest.prisoner02RescuedOnDestroy = ClearObjectUserdata

--Prisoner 02 Captive
local prisoner02CaptiveStateObjects = orderedTable();
	prisoner02CaptiveStateObjects["AREAC_BLOODHARVEST_RESCUED"	] = { state = BloodHarvestState.Rescued, dbr = nil }
	prisoner02CaptiveStateObjects[""					 	] = { state = BloodHarvestState.Default, dbr = "records/creatures/npcs/flavornpcs/gdareac/npc_bloodharvest_male_02.dbr" }

function gd.quests.areaCQuestBloodHarvest.prisoner02CaptiveOnAddToWorld(objectId)

	if Server then
		prisonerIds[3] = objectId
		prisonerStateObjects[3] = prisoner02CaptiveStateObjects
	
		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, prisoner02CaptiveStateObjects);
		Shared.setUserdata(objectId, userdata);
	
	end
	
end

gd.quests.areaCQuestBloodHarvest.prisoner02CaptiveOnDestroy = ClearObjectUserdata


--Find the prisoners
function gd.quests.areaCQuestBloodHarvest.prisonersFound(triggererId)

	local player = Player.Get(triggererId)
	local kQuest = 0x0140404A
	local kTask = 0x213CBB00
	local questTaskState = player:GetQuestTaskState(kQuest, kTask)

	GiveTokenIfPlayer(triggererId, "AREAC_BLOODHARVEST_FOUND");
	
	if (player != nil) && (questTaskState == QuestState.InProgress) then
		UI.Notify("tagNotification_AreaC_BloodHarvestFound")
	end
end

-- Triggered by conversation. Swaps npcs in world to npcs in town
local bloodHarvestPortal = false

function gd.quests.areaCQuestBloodHarvest.bloodHarvestPortalGlobalMP()

	GiveTokenToLocalPlayer("AREAC_BLOODHARVEST_RESCUED")

end

function gd.quests.areaCQuestBloodHarvest.bloodHarvestPortal()

	if Server then
		local player = Game.GetLocalPlayer()
		
		GiveTokenToLocalPlayer("AREAC_BLOODHARVEST_RESCUED")
		
		QuestGlobalEvent("bloodHarvestPortalToken")
		
		if not bloodHarvestPortal then
			bloodHarvestPortal = true
			
			local prisonersTotal = table.getn(prisonerIds)
			local rescuedTotal = table.getn(rescuedIds)
		
			for id = 1, prisonersTotal do
				local NPCEntity = Entity.Get(prisonerIds[id])
				
				if (NPCEntity != nil) then
					local coords = NPCEntity:GetCoords()
					local rift = Entity.Create("records/fx/ui/riftgatepersonalopen_fxpak.dbr")
			
					if (rift != nil) then
						rift:NetworkEnable()
						rift:SetCoords(coords)
					end
			
					UpdateObjectSwap(prisonerIds[id], prisonerStateObjects[id])
					
				end
			
			end

			for id = 1, rescuedTotal do
				local NPCEntity = Entity.Get(rescuedIds[id])
				
				if (NPCEntity != nil) then
					local coords = NPCEntity:GetCoords()
					local rift = Entity.Create("records/fx/ui/riftgatepersonalopen_fxpak.dbr")
			
					if (rift != nil) then
						rift:NetworkEnable()
						rift:SetCoords(coords)
					end
			
					UpdateObjectSwap(rescuedIds[id], rescuedStateObjects[id])
				
				end
			
			end
		
		end
		
	end
	
end

-- Teleport Boss back in if he is removed from room
local bossId = 0
local bossCoords = nil

function gd.quests.areaCQuestBloodHarvest.bossOnAddToWorld(objectId)

	if Server then
		bossId = objectId
		bossCoords = Entity.Get(objectId):GetCoords()
	
	end

end

function gd.quests.areaCQuestBloodHarvest.bossLeaveRoom()

	if Server then
		-- Teleport boss back to spawn point if he is somehow kited out of boss room
		local bossEntity = Character.Get(bossId)
		local coords = bossEntity:GetCoords()
		local rift = Entity.Create("records/fx/ui/riftgatepersonalopen_fxpak.dbr")

		if (rift != nil) then
			rift:NetworkEnable()
			rift:SetCoords(coords)
		end
		
		bossEntity:SetCoords(bossCoords)
	
	end


end
