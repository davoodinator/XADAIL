/*
	
	GRIM DAWN
	
	For more information, visit us at http://www.grimdawn.com
	
*/

gd.quests.homesteadQuestPayingTribute = {}

--
-- Village begins in friendly state but can change to a hostile (Silas) and destroyed states based on player action during quest
--

local silasId = 0
local spawnedSilas = false




local boyTrappedId = 0
local boyTownId = 0
local girlTrappedId = 0
local girlTownId = 0
local aliciaDyingId = 0
local villageAliciaId= 0
local villageVillagerOneId= 0
local villageVillagerTwoId= 0
local villageChildBoyId= 0
local villageChildGirlId= 0
local villageCorpsePileId= 0
local villageFireId= 0

--Toggling Fishing Village between living and destroyed
local FishingVillageState = { Living = 0, Hostile = 1, Killed = 2, Destroyed = 3, ChildrenRescued = 4, Bribed = 5, Fled = 6 }

--Silas
local villageSilasStateObjects = orderedTable();
	villageSilasStateObjects["SILAS_FLED"	] = { state = FishingVillageState.Fled, dbr = nil}
	villageSilasStateObjects["SILAS_BRIBED"	] = { state = FishingVillageState.Bribed, dbr = nil}
	villageSilasStateObjects["SILAS_CHILDRENRESCUED"	] = { state = FishingVillageState.ChildrenRescued, dbr = nil}
	villageSilasStateObjects["SILAS_DESTROYED"	] = { state = FishingVillageState.Destroyed, dbr = nil}
	villageSilasStateObjects["SILAS_KILLED"	] = { state = FishingVillageState.Killed, dbr = nil}
	villageSilasStateObjects["SILAS_HOSTILE"	] = { state = FishingVillageState.Hostile, dbr = "records/creatures/enemies/boss&quest/payingtribute_silas_01.dbr"}
	villageSilasStateObjects[""					 	] = { state = FishingVillageState.Living, dbr = "records/creatures/npcs/questnpcs/gdareab/npc_silas_01.dbr"}

local function CharacterCreateArgs()

	return 0, Entity.Get(silasId):GetCoords().origin
	
end

function gd.quests.homesteadQuestPayingTribute.villageSilasOnAddToWorld(objectId)
	
	if Server then
		if (not spawnedSilas) then
			silasId = objectId
		
			local userdata = {};
			local didWork, newState = TokenStateBasedObjectSwap(objectId, userdata, villageSilasStateObjects, Character, CharacterCreateArgs)
		
			Shared.setUserdata(objectId, userdata);
		
			--Don't respawn Silas next time. If spawned as hostile, will be saved into the world
			if (newState == FishingVillageState.Hostile) then
				spawnedSilas = true
				
			end
		
		end
		
	end
	
end

gd.quests.homesteadQuestPayingTribute.villageSilasOnDestroy = ClearObjectUserdata

function gd.quests.homesteadQuestPayingTribute.hostileSwitchGlobalMP()

	local player = Game.GetLocalPlayer()

	local kQuest_PayingTribute = 0xE6A00600
	local kTask_Return = 0xCC4D9900

	local questTaskState = player:GetQuestTaskState(kQuest_PayingTribute, kTask_Return)
	
	if (player != nil && (questTaskState == QuestState.Complete)) then
		player:GiveToken("SILAS_HOSTILE")

	end

end

function gd.quests.homesteadQuestPayingTribute.hostileSwitch()

	if Server then
		if not spawnedSilas then
			QuestGlobalEvent("payingTributeSilasHostileSwapToken")
		
			local didWork, newState = UpdateObjectSwap(silasId, villageSilasStateObjects, Character, CharacterCreateArgs)
	
			-- Don't respawn Silas next time. If spawned as hostile, will be saved into the world
			if (newState == FishingVillageState.Hostile) then
				spawnedSilas = true
			
			end
		
		end
	
	end

end



function gd.quests.homesteadQuestPayingTribute.SilasFlee()
	
	if Server then
		local silasActive = Entity.Get(silasId)
	
		if silasActive != nil then
			UpdateObjectSwap(silasId, villageSilasStateObjects)
			
		end
	
	end
	
end

--Alicia
local villageAliciaStateObjects = orderedTable();
	villageAliciaStateObjects["SILAS_FLED"	] = { state = FishingVillageState.Fled, dbr = "records/creatures/npcs/questnpcs/gdareab/npc_alicia_01.dbr"}
	villageAliciaStateObjects["SILAS_BRIBED"	] = { state = FishingVillageState.Bribed, dbr = "records/creatures/npcs/questnpcs/gdareab/npc_alicia_01.dbr"}
	villageAliciaStateObjects["SILAS_CHILDRENRESCUED"	] = { state = FishingVillageState.ChildrenRescued, dbr = nil}
	villageAliciaStateObjects["SILAS_DESTROYED"	] = { state = FishingVillageState.Destroyed, dbr = nil}
	villageAliciaStateObjects["SILAS_KILLED"	] = { state = FishingVillageState.Killed, dbr = "records/creatures/npcs/questnpcs/gdareab/npc_alicia_01.dbr"}
	villageAliciaStateObjects["SILAS_HOSTILE"	] = { state = FishingVillageState.Hostile, dbr = "records/creatures/npcs/questnpcs/gdareab/npc_alicia_01.dbr"}
	villageAliciaStateObjects[""					 	] = { state = FishingVillageState.Living, dbr = "records/creatures/npcs/questnpcs/gdareab/npc_alicia_01.dbr"}

function gd.quests.homesteadQuestPayingTribute.villageAliciaOnAddToWorld(objectId)

	if Server then
		villageAliciaId= objectId

		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, villageAliciaStateObjects);
		Shared.setUserdata(objectId, userdata);
	
	end
	
end

gd.quests.homesteadQuestPayingTribute.villageAliciaOnDestroy = ClearObjectUserdata


--Villager 1
local villageVillagerOneStateObjects = orderedTable();
	villageVillagerOneStateObjects["SILAS_FLED"	] = { state = FishingVillageState.Fled, dbr = "records/creatures/npcs/flavornpcs/homestead/npc_fishingvillage_villager_01.dbr"}
	villageVillagerOneStateObjects["SILAS_BRIBED"	] = { state = FishingVillageState.Bribed, dbr = "records/creatures/npcs/flavornpcs/homestead/npc_fishingvillage_villager_01.dbr"}
	villageVillagerOneStateObjects["SILAS_CHILDRENRESCUED"	] = { state = FishingVillageState.ChildrenRescued, dbr = "records/level art/carnage/corpse_human_lying_03.dbr"}
	villageVillagerOneStateObjects["SILAS_DESTROYED"	] = { state = FishingVillageState.Destroyed, dbr = "records/level art/carnage/corpse_human_lying_03.dbr"}
	villageVillagerOneStateObjects["SILAS_KILLED"	] = { state = FishingVillageState.Killed, dbr = "records/creatures/npcs/flavornpcs/homestead/npc_fishingvillage_villager_01.dbr"}
	villageVillagerOneStateObjects["SILAS_HOSTILE"	] = { state = FishingVillageState.Hostile, dbr = "records/creatures/npcs/flavornpcs/homestead/npc_fishingvillage_villager_01.dbr"}
	villageVillagerOneStateObjects[""					 	] = { state = FishingVillageState.Living, dbr = "records/creatures/npcs/flavornpcs/homestead/npc_fishingvillage_villager_01.dbr"}

function gd.quests.homesteadQuestPayingTribute.villageVillagerOneOnAddToWorld(objectId)
	
	if Server then
		villageVillagerOneId= objectId

		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, villageVillagerOneStateObjects);
		Shared.setUserdata(objectId, userdata);
	
	end
	
end

gd.quests.homesteadQuestPayingTribute.villageVillagerOneOnDestroy = ClearObjectUserdata


--Villager 2
local villageVillagerTwoStateObjects = orderedTable();
	villageVillagerTwoStateObjects["SILAS_FLED"	] = { state = FishingVillageState.Fled, dbr = "records/creatures/npcs/flavornpcs/homestead/npc_fishingvillage_villager_02.dbr"}
	villageVillagerTwoStateObjects["SILAS_BRIBED"	] = { state = FishingVillageState.Bribed, dbr = "records/creatures/npcs/flavornpcs/homestead/npc_fishingvillage_villager_02.dbr"}
	villageVillagerTwoStateObjects["SILAS_CHILDRENRESCUED"	] = { state = FishingVillageState.ChildrenRescued, dbr = "records/level art/carnage/corpse_human_burned_01.dbr"}
	villageVillagerTwoStateObjects["SILAS_DESTROYED"	] = { state = FishingVillageState.Destroyed, dbr = "records/level art/carnage/corpse_human_burned_01.dbr"}
	villageVillagerTwoStateObjects["SILAS_KILLED"	] = { state = FishingVillageState.Killed, dbr = "records/creatures/npcs/flavornpcs/homestead/npc_fishingvillage_villager_02.dbr"}
	villageVillagerTwoStateObjects["SILAS_HOSTILE"	] = { state = FishingVillageState.Hostile, dbr = "records/creatures/npcs/flavornpcs/homestead/npc_fishingvillage_villager_02.dbr"}
	villageVillagerTwoStateObjects[""					 	] = { state = FishingVillageState.Living, dbr = "records/creatures/npcs/flavornpcs/homestead/npc_fishingvillage_villager_02.dbr"}

function gd.quests.homesteadQuestPayingTribute.villageVillagerTwoOnAddToWorld(objectId)
	
	if Server then
		villageVillagerTwoId= objectId

		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, villageVillagerTwoStateObjects);
		Shared.setUserdata(objectId, userdata);
	
	end
	
end

gd.quests.homesteadQuestPayingTribute.villageVillagerTwoOnDestroy = ClearObjectUserdata


--Village Corpse
local villageVillagerCorpseStateObjects = orderedTable();
	villageVillagerCorpseStateObjects["SILAS_FLED"	] = { state = FishingVillageState.Fled, dbr = nil}
	villageVillagerCorpseStateObjects["SILAS_BRIBED"	] = { state = FishingVillageState.Bribed, dbr = nil}
	villageVillagerCorpseStateObjects["SILAS_CHILDRENRESCUED"	] = { state = FishingVillageState.ChildrenRescued, dbr = "records/level art/carnage/corpse_human_burned_03.dbr"}
	villageVillagerCorpseStateObjects["SILAS_DESTROYED"	] = { state = FishingVillageState.Destroyed, dbr = "records/creatures/npcs/questnpcs/gdareab/npc_alicia_02.dbr"}
	villageVillagerCorpseStateObjects["SILAS_KILLED"	] = { state = FishingVillageState.Killed, dbr = nil}
	villageVillagerCorpseStateObjects["SILAS_HOSTILE"	] = { state = FishingVillageState.Hostile, dbr = nil}
	villageVillagerCorpseStateObjects[""					 	] = { state = FishingVillageState.Living, dbr = nil}

function gd.quests.homesteadQuestPayingTribute.villageVillagerCorpseOnAddToWorld(objectId)
	
	if Server then
		aliciaDyingId = objectId

		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, villageVillagerCorpseStateObjects);
		Shared.setUserdata(objectId, userdata);
	
	end
	
end

gd.quests.homesteadQuestPayingTribute.villageVillagerCorpseOnDestroy = ClearObjectUserdata


--Village Fire
local villageFireStateObjects = orderedTable();
	villageFireStateObjects["SILAS_FLED"	] = { state = FishingVillageState.Fled, dbr = nil}
	villageFireStateObjects["SILAS_BRIBED"	] = { state = FishingVillageState.Bribed, dbr = nil}
	villageFireStateObjects["SILAS_CHILDRENRESCUED"	] = { state = FishingVillageState.ChildrenRescued, dbr = "records/fx/ambient/fx_firebonfire01.dbr"}
	villageFireStateObjects["SILAS_DESTROYED"	] = { state = FishingVillageState.Destroyed, dbr = "records/fx/ambient/fx_firebonfire01.dbr"}
	villageFireStateObjects["SILAS_KILLED"	] = { state = FishingVillageState.Killed, dbr = nil}
	villageFireStateObjects["SILAS_HOSTILE"	] = { state = FishingVillageState.Hostile, dbr = nil}
	villageFireStateObjects[""					 	] = { state = FishingVillageState.Living, dbr = nil}

function gd.quests.homesteadQuestPayingTribute.villageFireOnAddToWorld(objectId)
	
	if Server then
		villageFireId= objectId

		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, villageFireStateObjects);
		Shared.setUserdata(objectId, userdata);
	
	end
	
end

gd.quests.homesteadQuestPayingTribute.villageFireOnDestroy = ClearObjectUserdata


--Village Corpse Pile
local villageVillagerCorpsePileStateObjects = orderedTable();
	villageVillagerCorpsePileStateObjects["SILAS_FLED"	] = { state = FishingVillageState.Fled, dbr = nil}
	villageVillagerCorpsePileStateObjects["SILAS_BRIBED"	] = { state = FishingVillageState.Bribed, dbr = nil}
	villageVillagerCorpsePileStateObjects["SILAS_CHILDRENRESCUED"	] = { state = FishingVillageState.ChildrenRescued, dbr = "records/level art/carnage/corpsepile_burned1a.dbr"}
	villageVillagerCorpsePileStateObjects["SILAS_DESTROYED"	] = { state = FishingVillageState.Destroyed, dbr = "records/level art/carnage/corpsepile_burned1a.dbr"}
	villageVillagerCorpsePileStateObjects["SILAS_KILLED"	] = { state = FishingVillageState.Killed, dbr = nil}
	villageVillagerCorpsePileStateObjects["SILAS_HOSTILE"	] = { state = FishingVillageState.Hostile, dbr = nil}
	villageVillagerCorpsePileStateObjects[""					 	] = { state = FishingVillageState.Living, dbr = nil}

function gd.quests.homesteadQuestPayingTribute.villageVillagerCorpsePileOnAddToWorld(objectId)
	
	if Server then
		villageCorpsePileId= objectId

		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, villageVillagerCorpsePileStateObjects);
		Shared.setUserdata(objectId, userdata);
	
	end
	
end

gd.quests.homesteadQuestPayingTribute.villageVillagerCorpsePileOnDestroy = ClearObjectUserdata


--Child Boy in Village
-- Starts in village, swaps to trapped state if village destroyed, swaps to town state if rescued
local villageChildBoyStateObjects = orderedTable();
	villageChildBoyStateObjects["SILAS_FLED"	] = { state = FishingVillageState.Fled, dbr = "records/creatures/npcs/flavornpcs/homestead/npc_fishingvillage_child_boy_01.dbr"}
	villageChildBoyStateObjects["SILAS_BRIBED"	] = { state = FishingVillageState.Bribed, dbr = "records/creatures/npcs/flavornpcs/homestead/npc_fishingvillage_child_boy_01.dbr"}
	villageChildBoyStateObjects["SILAS_CHILDRENRESCUED"	] = { state = FishingVillageState.ChildrenRescued, dbr = nil}
	villageChildBoyStateObjects["SILAS_DESTROYED"	] = { state = FishingVillageState.Destroyed, dbr = nil}
	villageChildBoyStateObjects["SILAS_KILLED"	] = { state = FishingVillageState.Killed, dbr = "records/creatures/npcs/flavornpcs/homestead/npc_fishingvillage_child_boy_01.dbr"}
	villageChildBoyStateObjects["SILAS_HOSTILE"	] = { state = FishingVillageState.Hostile, dbr = "records/creatures/npcs/flavornpcs/homestead/npc_fishingvillage_child_boy_01.dbr"}
	villageChildBoyStateObjects[""					 	] = { state = FishingVillageState.Living, dbr = "records/creatures/npcs/flavornpcs/homestead/npc_fishingvillage_child_boy_01.dbr"}

function gd.quests.homesteadQuestPayingTribute.villageChildBoyOnAddToWorld(objectId)
	
	if Server then
		villageChildBoyId= objectId

		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, villageChildBoyStateObjects);
		Shared.setUserdata(objectId, userdata);
	
	end
	
end

gd.quests.homesteadQuestPayingTribute.villageChildBoyOnDestroy = ClearObjectUserdata

--Child Boy in Town
local townChildBoyStateObjects = orderedTable();
	townChildBoyStateObjects["SILAS_FLED"	] = { state = FishingVillageState.Fled, dbr = nil}
	townChildBoyStateObjects["SILAS_BRIBED"	] = { state = FishingVillageState.Bribed, dbr = nil}
	townChildBoyStateObjects["SILAS_CHILDRENRESCUED"	] = { state = FishingVillageState.ChildrenRescued, dbr = "records/creatures/npcs/flavornpcs/homestead/npc_fishingvillage_child_boy_02.dbr"}
	townChildBoyStateObjects["SILAS_DESTROYED"	] = { state = FishingVillageState.Destroyed, dbr = nil}
	townChildBoyStateObjects["SILAS_KILLED"	] = { state = FishingVillageState.Killed, dbr = nil}
	townChildBoyStateObjects["SILAS_HOSTILE"	] = { state = FishingVillageState.Hostile, dbr = nil}
	townChildBoyStateObjects[""					 	] = { state = FishingVillageState.Living, dbr = nil}

function gd.quests.homesteadQuestPayingTribute.townChildBoyOnAddToWorld(objectId)
	
	if Server then
		boyTownId = objectId
	
		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, townChildBoyStateObjects);
		Shared.setUserdata(objectId, userdata);
	
	end
	
end

gd.quests.homesteadQuestPayingTribute.townChildBoyOnDestroy = ClearObjectUserdata

--Child Boy Trapped
local trappedChildBoyStateObjects = orderedTable();
	trappedChildBoyStateObjects["SILAS_FLED"	] = { state = FishingVillageState.Fled, dbr = nil}
	trappedChildBoyStateObjects["SILAS_BRIBED"	] = { state = FishingVillageState.Bribed, dbr = nil}
	trappedChildBoyStateObjects["SILAS_CHILDRENRESCUED"	] = { state = FishingVillageState.ChildrenRescued, dbr = nil}
	trappedChildBoyStateObjects["SILAS_DESTROYED"	] = { state = FishingVillageState.Destroyed, dbr = "records/creatures/npcs/questnpcs/gdareab/npc_fishingvillage_child_boy.dbr"}
	trappedChildBoyStateObjects["SILAS_KILLED"	] = { state = FishingVillageState.Killed, dbr = "records/creatures/npcs/questnpcs/gdareab/npc_fishingvillage_child_boy.dbr"}
	trappedChildBoyStateObjects["SILAS_HOSTILE"	] = { state = FishingVillageState.Hostile, dbr = nil}
	trappedChildBoyStateObjects[""					 	] = { state = FishingVillageState.Living, dbr = nil}

function gd.quests.homesteadQuestPayingTribute.trappedChildBoyOnAddToWorld(objectId)
	
	if Server then
		boyTrappedId = objectId
	
		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, trappedChildBoyStateObjects);
		Shared.setUserdata(objectId, userdata);
	
	end
	
end

gd.quests.homesteadQuestPayingTribute.trappedChildBoyOnDestroy = ClearObjectUserdata


--Child Girl in Village
-- Starts in village, swaps to trapped state if village destroyed, swaps to town state if rescued
local villageChildGirlStateObjects = orderedTable();
	villageChildGirlStateObjects["SILAS_FLED"	] = { state = FishingVillageState.Fled, dbr = "records/creatures/npcs/flavornpcs/homestead/npc_fishingvillage_child_girl_01.dbr"}
	villageChildGirlStateObjects["SILAS_BRIBED"	] = { state = FishingVillageState.Bribed, dbr = "records/creatures/npcs/flavornpcs/homestead/npc_fishingvillage_child_girl_01.dbr"}
	villageChildGirlStateObjects["SILAS_CHILDRENRESCUED"	] = { state = FishingVillageState.ChildrenRescued, dbr = nil}
	villageChildGirlStateObjects["SILAS_DESTROYED"	] = { state = FishingVillageState.Destroyed, dbr = nil}
	villageChildGirlStateObjects["SILAS_KILLED"	] = { state = FishingVillageState.Killed, dbr = "records/creatures/npcs/flavornpcs/homestead/npc_fishingvillage_child_girl_01.dbr"}
	villageChildGirlStateObjects["SILAS_HOSTILE"	] = { state = FishingVillageState.Hostile, dbr = "records/creatures/npcs/flavornpcs/homestead/npc_fishingvillage_child_girl_01.dbr"}
	villageChildGirlStateObjects[""					 	] = { state = FishingVillageState.Living, dbr = "records/creatures/npcs/flavornpcs/homestead/npc_fishingvillage_child_girl_01.dbr"}

function gd.quests.homesteadQuestPayingTribute.villageChildGirlOnAddToWorld(objectId)
	
	if Server then
		villageChildGirlId= objectId
	
		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, villageChildGirlStateObjects);
		Shared.setUserdata(objectId, userdata);
	
	end
	
end

gd.quests.homesteadQuestPayingTribute.villageChildGirlOnDestroy = ClearObjectUserdata

--Child Girl in Town
local townChildGirlStateObjects = orderedTable();
	townChildGirlStateObjects["SILAS_FLED"	] = { state = FishingVillageState.Fled, dbr = nil}
	townChildGirlStateObjects["SILAS_BRIBED"	] = { state = FishingVillageState.Bribed, dbr = nil}
	townChildGirlStateObjects["SILAS_CHILDRENRESCUED"	] = { state = FishingVillageState.ChildrenRescued, dbr = "records/creatures/npcs/flavornpcs/homestead/npc_fishingvillage_child_girl_02.dbr"}
	townChildGirlStateObjects["SILAS_DESTROYED"	] = { state = FishingVillageState.Destroyed, dbr = nil}
	townChildGirlStateObjects["SILAS_KILLED"	] = { state = FishingVillageState.Killed, dbr = nil}
	townChildGirlStateObjects["SILAS_HOSTILE"	] = { state = FishingVillageState.Hostile, dbr = nil}
	townChildGirlStateObjects[""					 	] = { state = FishingVillageState.Living, dbr = nil}

function gd.quests.homesteadQuestPayingTribute.townChildGirlOnAddToWorld(objectId)
	
	if Server then
		girlTownId = objectId
	
		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, townChildGirlStateObjects);
		Shared.setUserdata(objectId, userdata);
	
	end
	
end

gd.quests.homesteadQuestPayingTribute.townChildGirlOnDestroy = ClearObjectUserdata

--Child Girl Trapped
local trappedChildGirlStateObjects = orderedTable();
	trappedChildGirlStateObjects["SILAS_FLED"	] = { state = FishingVillageState.Fled, dbr = nil}
	trappedChildGirlStateObjects["SILAS_BRIBED"	] = { state = FishingVillageState.Bribed, dbr = nil}
	trappedChildGirlStateObjects["SILAS_CHILDRENRESCUED"	] = { state = FishingVillageState.ChildrenRescued, dbr = nil}
	trappedChildGirlStateObjects["SILAS_DESTROYED"	] = { state = FishingVillageState.Destroyed, dbr = "records/creatures/npcs/questnpcs/gdareab/npc_fishingvillage_child_girl.dbr"}
	trappedChildGirlStateObjects["SILAS_KILLED"	] = { state = FishingVillageState.Killed, dbr = "records/creatures/npcs/questnpcs/gdareab/npc_fishingvillage_child_girl.dbr"}
	trappedChildGirlStateObjects["SILAS_HOSTILE"	] = { state = FishingVillageState.Hostile, dbr = nil}
	trappedChildGirlStateObjects[""					 	] = { state = FishingVillageState.Living, dbr = nil}

function gd.quests.homesteadQuestPayingTribute.trappedChildGirlOnAddToWorld(objectId)
	
	if Server then
		girlTrappedId = objectId
	
		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, trappedChildGirlStateObjects);
		Shared.setUserdata(objectId, userdata);
	
	end
	
end

gd.quests.homesteadQuestPayingTribute.trappedChildGirlOnDestroy = ClearObjectUserdata

--Triggered by conversations. Swaps trapped children with ones in town
local childRescue = false

function gd.quests.homesteadQuestPayingTribute.childrenRescue()

	if Server then
		local player = Game.GetLocalPlayer()
		
		if player:HasToken("SILAS_CHILDRENRESCUED") && not childRescue then
			childRescue = true

			local boyActive = Entity.Get(boyTrappedId)
			local boyDestination = Entity.Get(boyTownId)
			local girlActive = Entity.Get(girlTrappedId)
			local girlDestination = Entity.Get(girlTownId)
			local aliciaDying = Entity.Get(aliciaDyingId)
	
			if boyActive != nil then
				local boyCoords = boyActive:GetCoords();
				local boyRiftStart = Entity.Create("records/fx/ui/riftgatepersonalopen_fxpak.dbr")
		
				if boyRiftStart != nil then
					boyRiftStart:NetworkEnable()
					boyRiftStart:SetCoords(boyCoords)
				end
		
				UpdateObjectSwap(boyTrappedId, trappedChildBoyStateObjects)
			end
		
			if boyDestination != nil then
				local boyDestinationCoords = boyDestination:GetCoords()
				local boyRiftEnd = Entity.Create("records/fx/ui/riftgatepersonalopen_fxpak.dbr")

				if boyRiftEnd != nil then
					boyRiftEnd:NetworkEnable()
					boyRiftEnd:SetCoords(boyDestinationCoords)
				end
		
				UpdateObjectSwap(boyTownId, townChildBoyStateObjects)

			end
	
			if girlActive != nil then
				local girlCoords = girlActive:GetCoords();
				local girlRiftStart = Entity.Create("records/fx/ui/riftgatepersonalopen_fxpak.dbr")
		
				if girlRiftStart != nil then
					girlRiftStart:NetworkEnable()
					girlRiftStart:SetCoords(girlCoords)
				end
		
				UpdateObjectSwap(girlTrappedId, trappedChildGirlStateObjects)
			end

			if girlDestination != nil then
				local girlDestinationCoords = girlDestination:GetCoords()
				local girlRiftEnd = Entity.Create("records/fx/ui/riftgatepersonalopen_fxpak.dbr")

				if girlRiftEnd != nil then
					girlRiftEnd:NetworkEnable()
					girlRiftEnd:SetCoords(girlDestinationCoords)
				end
		
				UpdateObjectSwap(girlTownId, townChildGirlStateObjects)
			end	

			if aliciaDying != nil then		
				UpdateObjectSwap(aliciaDyingId, villageVillagerCorpseStateObjects)
			end
			
		end
	
	end

end

-- When Silas killed. Spawn children in hideout and update tokens
function gd.quests.homesteadQuestPayingTribute.silasKilled()
	local player = Game.GetLocalPlayer()
	local kQuest_PayingTribute = 0xE6A00600
	local kTask_Hostile = 0xC5379800
	local kTask_KillReturn = 0x3EE76D80
	local questTaskState01 = player:GetQuestTaskState(kQuest_PayingTribute, kTask_Hostile)
	local questTaskState02 = player:GetQuestTaskState(kQuest_PayingTribute, kTask_KillReturn)
	
	local boyActive = Entity.Get(boyTrappedId)
	local girlActive = Entity.Get(girlTrappedId)

	if (player != nil && (player:HasToken("SILAS_HOSTILE"))) then
		player:RemoveToken("SILAS_HOSTILE")
		
		if (questTaskState01 == QuestState.InProgress ||questTaskState02 == QuestState.InProgress) then
			player:GiveToken("SILAS_KILLED")
		else
			player:GiveToken("SILAS_DESTROYED")
			
		end

	end

	if Server then
		if boyActive != nil then
			UpdateObjectSwap(boyTrappedId, trappedChildBoyStateObjects)
			
		end
	
		if girlActive != nil then
			UpdateObjectSwap(girlTrappedId, trappedChildGirlStateObjects)
			
		end
	
	end
	
end

--Triggered by conversation. Swaps the village to destroyed state if player meets children after killing Silas and village has not unloaded. Mostly for MP purposes and weird edge cases.
function gd.quests.homesteadQuestPayingTribute.villageSwap()
	
	if Server then
		local villageAlicia = Entity.Get(villageAliciaId)
		local villageVillagerOne = Entity.Get(villageVillagerOneId)
		local villageVillagerTwo = Entity.Get(villageVillagerTwoId)
		local villageChildBoy = Entity.Get(villageChildBoyId)
		local villageChildGirl = Entity.Get(villageChildGirlId)
		local villageCorpse = Entity.Get(aliciaDyingId)
		local villageCorpsePile = Entity.Get(villageCorpsePileId)
		local villageFire = Entity.Get(villageFireId)
		
		if villageAlicia != nil then		
			UpdateObjectSwap(villageAliciaId, villageAliciaStateObjects)
		end
		
		if villageVillagerOne != nil then		
			UpdateObjectSwap(villageVillagerOneId, villageVillagerOneStateObjects)
		end
		
		if villageVillagerTwo != nil then		
			UpdateObjectSwap(villageVillagerTwoId, villageVillagerTwoStateObjects)
		end
		
		if villageChildBoy != nil then		
			UpdateObjectSwap(villageChildBoyId, villageChildBoyStateObjects)
		end
		
		if villageChildGirl != nil then		
			UpdateObjectSwap(villageChildGirlId, villageChildGirlStateObjects)
		end
		
		if villageCorpse != nil then		
			UpdateObjectSwap(aliciaDyingId, villageVillagerCorpseStateObjects)
		end
		
		if villageCorpsePile != nil then		
			UpdateObjectSwap(villageCorpsePileId, villageVillagerCorpsePileStateObjects)
		end
		
		if villageFire != nil then		
			UpdateObjectSwap(villageFireId, villageFireStateObjects)
		end
	
	end
		
end
