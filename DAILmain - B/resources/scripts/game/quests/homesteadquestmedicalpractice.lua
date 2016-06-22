/*
	
	GRIM DAWN
	
	For more information, visit us at http://www.grimdawn.com
	
*/

gd.quests.homesteadQuestMedicalPractice = {}

--
-- rovers begin in injured state and swap to guard, vendor and npc, respectively

local roverGuardId = 0
local spawnedRoverGuard = false

local MedicalState = { Injured = 0, Healed = 1 }

--Guard
local roverGuardStateObjects = orderedTable();
	roverGuardStateObjects["OA_ROVERS_HEALED"	] = { state = MedicalState.Healed, dbr = "records/creatures/npcs/guard/roverguard_rangeda01.dbr"}
	roverGuardStateObjects[""					 	] = { state = MedicalState.Injured, dbr =  nil}

local function CharacterCreateArgs()

	return 0, Entity.Get(roverGuardId):GetCoords().origin
	
end

function gd.quests.homesteadQuestMedicalPractice.roverGuardOnAddToWorld(objectId)
	if Server then
		if (not spawnedRoverGuard) then
			roverGuardId = objectId
		
			local userdata = {};
			local didWork, newState = TokenStateBasedObjectSwap(objectId, userdata, roverGuardStateObjects, Character, CharacterCreateArgs)
		
			Shared.setUserdata(objectId, userdata);
		
			--Don't respawn guard next time. If spawned as guard, will be saved into world
			if (newState == MedicalState.Healed) then
				spawnedRoverGuard = true
				
			end
			
		end
	
	end
	
end

gd.quests.homesteadQuestMedicalPractice.roverGuardOnDestroy = ClearObjectUserdata


--Guard Injured
local roverGuardInjuredStateObjects = orderedTable();
	roverGuardInjuredStateObjects["OA_ROVERS_HEALED"	] = { state = MedicalState.Healed, dbr = nil }
	roverGuardInjuredStateObjects[""					 	] = { state = MedicalState.Injured, dbr = "records/creatures/npcs/flavornpcs/homestead/npc_injuredrover_01.dbr"}

function gd.quests.homesteadQuestMedicalPractice.roverGuardInjuredOnAddToWorld(objectId)
	
	if Server then
		QuestGlobalEvent("roverBountyHotfix")
		
		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, roverGuardInjuredStateObjects);
		Shared.setUserdata(objectId, userdata);
	
	end
	
end

gd.quests.homesteadQuestMedicalPractice.roverGuardInjuredOnDestroy = ClearObjectUserdata


--Vendor
local roverVendorStateObjects = orderedTable();
	roverVendorStateObjects["OA_ROVERS_HEALED"	] = { state = MedicalState.Healed, dbr = "records/creatures/npcs/merchants/merchantt01.dbr"}
	roverVendorStateObjects[""					 	] = { state = MedicalState.Injured, dbr = nil }

function gd.quests.homesteadQuestMedicalPractice.roverVendorOnAddToWorld(objectId)

	if Server then
		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, roverVendorStateObjects);
		Shared.setUserdata(objectId, userdata);
	
	end
	
end

gd.quests.homesteadQuestMedicalPractice.roverVendorOnDestroy = ClearObjectUserdata


--Vendor Injured
local roverVendorInjuredStateObjects = orderedTable();
	roverVendorInjuredStateObjects["OA_ROVERS_HEALED"	] = { state = MedicalState.Healed, dbr = nil }
	roverVendorInjuredStateObjects[""					 	] = { state = MedicalState.Injured, dbr = "records/creatures/npcs/flavornpcs/homestead/npc_injuredrover_02.dbr"}

function gd.quests.homesteadQuestMedicalPractice.roverVendorInjuredOnAddToWorld(objectId)
	
	if Server then
		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, roverVendorInjuredStateObjects);
		Shared.setUserdata(objectId, userdata);
	
	end
	
end

gd.quests.homesteadQuestMedicalPractice.roverVendorInjuredOnDestroy = ClearObjectUserdata


--Hiram
local roverHiramStateObjects = orderedTable();
	roverHiramStateObjects["OA_ROVERS_HEALED"	] = { state = MedicalState.Healed, dbr = "records/creatures/npcs/questnpcs/gdareab/npc_hiram_02.dbr"}
	roverHiramStateObjects[""					 	] = { state = MedicalState.Injured, dbr = nil }

function gd.quests.homesteadQuestMedicalPractice.roverHiramOnAddToWorld(objectId)
	
	if Server then
		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, roverHiramStateObjects);
		Shared.setUserdata(objectId, userdata);
	
	end
	
end

gd.quests.homesteadQuestMedicalPractice.roverHiramOnDestroy = ClearObjectUserdata


--Hiram Injured
local roverHiramInjuredStateObjects = orderedTable();
	roverHiramInjuredStateObjects["OA_ROVERS_HEALED"	] = { state = MedicalState.Healed, dbr = nil }
	roverHiramInjuredStateObjects[""					 	] = { state = MedicalState.Injured, dbr = "records/creatures/npcs/questnpcs/gdareab/npc_hiram_01.dbr"}

function gd.quests.homesteadQuestMedicalPractice.roverHiramInjuredOnAddToWorld(objectId)
	
	if Server then
		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, roverHiramInjuredStateObjects);
		Shared.setUserdata(objectId, userdata);
	
	end
	
end

gd.quests.homesteadQuestMedicalPractice.roverHiramInjuredOnDestroy = ClearObjectUserdata