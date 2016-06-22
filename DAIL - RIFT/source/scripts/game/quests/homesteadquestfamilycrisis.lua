/*
	
	GRIM DAWN
	
	For more information, visit us at http://www.grimdawn.com
	
*/

gd.quests.homesteadQuestFamilyCrisis = {}

--
-- Skinner family starts friendly but goes hostile with incorrect conversation selection
-- Can be saved and ported to town
--

local skinnerId = 0
local skinnerTownId = 0
local wifeId = 0
local wifeTownId = 0
local daughterId = 0
local daughterTownId = 0
local targetId = 0
local fireId = 0

local SkinnerState = { Unstable = 0, Rescued = 1, Hostile = 2 }

--Rescued Skinner
local rescuedSkinnerStateObjects = orderedTable();
	rescuedSkinnerStateObjects["SKINNER_RESCUED"	] = { state = SkinnerState.Rescued,  dbr = "records/creatures/npcs/questnpcs/gdareab/npc_stephenskinner_02.dbr"}
	rescuedSkinnerStateObjects["SKINNER_HOSTILE"	] = { state = SkinnerState.Hostile, dbr = nil }
	rescuedSkinnerStateObjects[""					 	] = { state = SkinnerState.Unstable, dbr = nil }

function gd.quests.homesteadQuestFamilyCrisis.rescuedSkinnerOnAddToWorld(objectId)

	if Server then
		skinnerTownId = objectId
	
		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, rescuedSkinnerStateObjects);
		Shared.setUserdata(objectId, userdata);
		
	end
	
end

gd.quests.homesteadQuestFamilyCrisis.rescuedSkinnerOnDestroy = ClearObjectUserdata

--Skinner Fire
local skinnerFireStateObjects = orderedTable();
	skinnerFireStateObjects["SKINNER_RESCUED"	] = { state = SkinnerState.Rescued,  dbr = nil }
	skinnerFireStateObjects["SKINNER_HOSTILE"	] = { state = SkinnerState.Hostile, dbr = "records/fx/ambient/fx_firebonfire01.dbr"}
	skinnerFireStateObjects[""					 	] = { state = SkinnerState.Unstable, dbr = nil }

function gd.quests.homesteadQuestFamilyCrisis.skinnerFireOnAddToWorld(objectId)

	if Server then
		fireId = objectId
	
		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, skinnerFireStateObjects);
		Shared.setUserdata(objectId, userdata);
	
	end
	
end

gd.quests.homesteadQuestFamilyCrisis.skinnerFireOnDestroy = ClearObjectUserdata
	
--Unstable Skinner
local unstableSkinnerStateObjects = orderedTable();
	unstableSkinnerStateObjects["SKINNER_RESCUED"	] = { state = SkinnerState.Rescued,  dbr = nil }
	unstableSkinnerStateObjects["SKINNER_HOSTILE"	] = { state = SkinnerState.Hostile, dbr = nil }
	unstableSkinnerStateObjects[""					 	] = { state = SkinnerState.Unstable, dbr = "records/creatures/npcs/questnpcs/gdareab/npc_stephenskinner_01.dbr"}

function gd.quests.homesteadQuestFamilyCrisis.unstableSkinnerOnAddToWorld(objectId)

	if Server then
		skinnerId = objectId
	
		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, unstableSkinnerStateObjects)
		Shared.setUserdata(objectId, userdata);
	
	end
	
end

gd.quests.homesteadQuestFamilyCrisis.unstableSkinnerOnDestroy = ClearObjectUserdata

--Wife
local rescuedWifeStateObjects = orderedTable();
	rescuedWifeStateObjects["SKINNER_RESCUED"	] = { state = SkinnerState.Rescued,  dbr = "records/creatures/npcs/flavornpcs/homestead/npc_elizabethskinner_02.dbr"}
	rescuedWifeStateObjects["SKINNER_HOSTILE"	] = { state = SkinnerState.Hostile, dbr = nil }
	rescuedWifeStateObjects[""					 	] = { state = SkinnerState.Unstable, dbr = nil }

function gd.quests.homesteadQuestFamilyCrisis.rescuedWifeOnAddToWorld(objectId)

	if Server then
		wifeTownId = objectId
	
		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, rescuedWifeStateObjects);
		Shared.setUserdata(objectId, userdata);
	
	end
	
end

gd.quests.homesteadQuestFamilyCrisis.rescuedWifeOnDestroy = ClearObjectUserdata

local captiveWifeStateObjects = orderedTable();
	captiveWifeStateObjects["SKINNER_RESCUED"	] = { state = SkinnerState.Rescued,  dbr = nil }
	captiveWifeStateObjects["SKINNER_HOSTILE"	] = { state = SkinnerState.Hostile, dbr = "records/level art/carnage/corpse_human_burned_02.dbr"}
	captiveWifeStateObjects[""					 	] = { state = SkinnerState.Unstable, dbr = "records/creatures/npcs/flavornpcs/homestead/npc_elizabethskinner_01.dbr"}

function gd.quests.homesteadQuestFamilyCrisis.captiveWifeOnAddToWorld(objectId)

	if Server then
		wifeId = objectId
	
		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, captiveWifeStateObjects);
		Shared.setUserdata(objectId, userdata);
	
	end
	
end

gd.quests.homesteadQuestFamilyCrisis.captiveWifeOnDestroy = ClearObjectUserdata

--Daughter
local rescuedDaughterStateObjects = orderedTable();
	rescuedDaughterStateObjects["SKINNER_RESCUED"	] = { state = SkinnerState.Rescued,  dbr = "records/creatures/npcs/flavornpcs/homestead/npc_milahskinner_02.dbr"}
	rescuedDaughterStateObjects["SKINNER_HOSTILE"	] = { state = SkinnerState.Hostile, dbr = nil }
	rescuedDaughterStateObjects[""					 	] = { state = SkinnerState.Unstable, dbr = nil }

function gd.quests.homesteadQuestFamilyCrisis.rescuedDaughterOnAddToWorld(objectId)

	if Server then
		daughterTownId = objectId
	
		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, rescuedDaughterStateObjects);
		Shared.setUserdata(objectId, userdata);
	
	end
	
end

gd.quests.homesteadQuestFamilyCrisis.rescuedDaughterOnDestroy = ClearObjectUserdata

local captiveDaughterStateObjects = orderedTable();
	captiveDaughterStateObjects["SKINNER_RESCUED"	] = { state = SkinnerState.Rescued,  dbr = nil }
	captiveDaughterStateObjects["SKINNER_HOSTILE"	] = { state = SkinnerState.Hostile, dbr = "records/storyelements/questassets/corpse_human_burned_small.dbr" }
	captiveDaughterStateObjects[""					 	] = { state = SkinnerState.Unstable, dbr = "records/creatures/npcs/flavornpcs/homestead/npc_milahskinner_01.dbr"}

function gd.quests.homesteadQuestFamilyCrisis.captiveDaughterOnAddToWorld(objectId)

	if Server then
		daughterId = objectId
	
		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, captiveDaughterStateObjects);
		Shared.setUserdata(objectId, userdata);
	
	end
	
end

gd.quests.homesteadQuestFamilyCrisis.captiveDaughterOnDestroy = ClearObjectUserdata

--Skinner Target
local skinnerTargetStateObjects = orderedTable();
	skinnerTargetStateObjects["SKINNER_RESCUED"	] = { state = SkinnerState.Rescued,  dbr = nil }
	skinnerTargetStateObjects["SKINNER_HOSTILE"	] = { state = SkinnerState.Hostile, dbr = "records/creatures/enemies/boss&quest/familycrisis_woodentarget_01.dbr"}
	skinnerTargetStateObjects[""					 	] = { state = SkinnerState.Unstable, dbr = nil }

function gd.quests.homesteadQuestFamilyCrisis.skinnerTargetOnAddToWorld(objectId)

	if Server then
		targetId = objectId
	
		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, skinnerTargetStateObjects);
		Shared.setUserdata(objectId, userdata);
	
	end
	
end

gd.quests.homesteadQuestFamilyCrisis.skinnerTargetOnDestroy = ClearObjectUserdata

-- Triggered by conversation. Swaps npcs in world to npcs in town
local skinnerPortal = false

function gd.quests.homesteadQuestFamilyCrisis.unstableSkinnerPortal()

	if Server then
		local player = Game.GetLocalPlayer()
		
		if player:HasToken("SKINNER_RESCUED") && not skinnerPortal then
			skinnerPortal = true
			local unstableSkinner = Entity.Get(skinnerId)
			local captiveWife = Entity.Get(wifeId)
			local captiveDaughter = Entity.Get(daughterId)
			local rescuedSkinnerDestination = Entity.Get(skinnerTownId)
			local rescuedWifeDestination = Entity.Get(wifeTownId)
			local rescuedDaughterDestination = Entity.Get(daughterTownId)
	
			if unstableSkinner != nil then
				local skinnerCoords = unstableSkinner:GetCoords();
				local skinnerRiftStart = Entity.Create("records/fx/ui/riftgatepersonalopen_fxpak.dbr")
		
				if skinnerRiftStart != nil then
					skinnerRiftStart:NetworkEnable()
					skinnerRiftStart:SetCoords(skinnerCoords)
				end
		
				UpdateObjectSwap(skinnerId, unstableSkinnerStateObjects)
		
			end
		
			if rescuedSkinnerDestination != nil then
				local skinnerDestinationCoords = rescuedSkinnerDestination:GetCoords()
				local skinnerRiftEnd = Entity.Create("records/fx/ui/riftgatepersonalopen_fxpak.dbr")

				if skinnerRiftEnd != nil then
					skinnerRiftEnd:NetworkEnable()
					skinnerRiftEnd:SetCoords(skinnerDestinationCoords)
				end
		
				UpdateObjectSwap(skinnerTownId, rescuedSkinnerStateObjects)
		
			end

			if captiveWife != nil then
				local wifeCoords = captiveWife:GetCoords();
				local wifeRiftStart = Entity.Create("records/fx/ui/riftgatepersonalopen_fxpak.dbr")
		
				if wifeRiftStart != nil then
					wifeRiftStart:NetworkEnable()
					wifeRiftStart:SetCoords(wifeCoords)
				end
		
				UpdateObjectSwap(wifeId, captiveWifeStateObjects)
		
			end
	
			if rescuedWifeDestination != nil then
				local wifeDestinationCoords = rescuedWifeDestination:GetCoords()
				local wifeRiftEnd = Entity.Create("records/fx/ui/riftgatepersonalopen_fxpak.dbr")
				if wifeRiftEnd != nil then
					wifeRiftEnd:NetworkEnable()
					wifeRiftEnd:SetCoords(wifeDestinationCoords)
				end
		
				UpdateObjectSwap(wifeTownId, rescuedWifeStateObjects)
	
			end

			if captiveDaughter != nil then
				local daughterCoords = captiveDaughter:GetCoords();
				local daughterRiftStart = Entity.Create("records/fx/ui/riftgatepersonalopen_fxpak.dbr")
		
				if daughterRiftStart != nil then
					daughterRiftStart:NetworkEnable()
					daughterRiftStart:SetCoords(daughterCoords)
				end
		
				UpdateObjectSwap(daughterId, captiveDaughterStateObjects)
		
			end
		
			if rescuedDaughterDestination != nil then
				local daughterDestinationCoords = rescuedDaughterDestination:GetCoords()
				local daughterRiftEnd = Entity.Create("records/fx/ui/riftgatepersonalopen_fxpak.dbr")
		
				if daughterRiftEnd != nil then
					daughterRiftEnd:NetworkEnable()
					daughterRiftEnd:SetCoords(daughterDestinationCoords)
				end
		
				UpdateObjectSwap(daughterTownId, rescuedDaughterStateObjects)
		
			end
	
		end
	
	end
	
end

--Triggered by conversation. Skinner Hostile Swap is a non-standard hostile swap. One-shot hostile npc that never spawns again
local skinnerHostileSwap = false

function gd.quests.homesteadQuestFamilyCrisis.hostileSwitchGlobalMP()

	local player = Game.GetLocalPlayer()

	if (player:HasToken("SKINNER_HOSTILE") == false && player:HasToken("SKINNER_RESCUED") == false) then
		GiveTokenToLocalPlayer("SKINNER_HOSTILE")
	
	end

end

function gd.quests.homesteadQuestFamilyCrisis.hostileSwitch()
	
	if Server then
		if not skinnerHostileSwap then
			skinnerHostileSwap = true
			
			QuestGlobalEvent("familyCrisisHostileSwapToken")
			
			local skinnerCoords = Entity.Get(skinnerId):GetCoords()
			
			UpdateObjectSwap(targetId, skinnerTargetStateObjects)
			UpdateObjectSwap(skinnerId, unstableSkinnerStateObjects)
			
	
			local skinnerHostile = Character.Create("records/creatures/enemies/boss&quest/familycrisis_stephenskinner_01.dbr", 0, skinnerCoords.origin)
			if skinnerHostile != nil then
				skinnerHostile:SetCoords(skinnerCoords)
			end
	
		end
	
	end

end

-- When Skinner's fake target is killed, his family swaps to corpses and a fire starts
local skinnerTargetDead = false

function gd.quests.homesteadQuestFamilyCrisis.targetKilled()
	
	if Server then
		if not skinnerTargetDead then
			skinnerTargetDead = true
			UpdateObjectSwap(wifeId, captiveWifeStateObjects)
			UpdateObjectSwap(daughterId, captiveDaughterStateObjects)
			UpdateObjectSwap(fireId, skinnerFireStateObjects)
		
		end
	
	end
	
end