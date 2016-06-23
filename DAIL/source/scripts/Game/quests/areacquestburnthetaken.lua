/*
	
	GRIM DAWN
	
	For more information, visit us at http://www.grimdawn.com
	
*/

gd.quests.areaCQuestBurnTheTaken = {}


--
-- Three NPCs wish to burn a woman at the stake, accusing her of being a Taken
-- Two final quest states, two intermediate states
--


local witchId = 0
local monsterId = 0
local man01Id = 0
local man02Id = 0
local woman01Id = 0
local fireId = 0

local spawnedMan01 = false
local spawnedMan02 = false
local spawnedWoman01 = false

--Toggle Event States
local BurnTheTakenState = { Default = 0, Hostile = 1, Burn = 2, BurnFinished = 3, Free = 4, FreeFinished = 5 }

local function CharacterCreateArgs()

	return 0, Entity.Get(monsterId):GetCoords().origin
	
end

--Man 1
local man01StateObjects = orderedTable();
	man01StateObjects["AREAC_BURNTHETAKEN_FREEFINISH"	] = { state = BurnTheTakenState.FreeFinished, dbr = nil}
	man01StateObjects["AREAC_BURNTHETAKEN_FREE"	] = { state = BurnTheTakenState.Free, dbr = nil}
	man01StateObjects["AREAC_BURNTHETAKEN_BURNFINISH"	] = { state = BurnTheTakenState.BurnFinished, dbr = nil}
	man01StateObjects["AREAC_BURNTHETAKEN_BURN"	] = { state = BurnTheTakenState.Burn, dbr = "records/creatures/npcs/questnpcs/gdareac/npc_nathaniel_01.dbr"}
	man01StateObjects["AREAC_BURNTHETAKEN_HOSTILE"	] = { state = BurnTheTakenState.Hostile, dbr = "records/creatures/enemies/boss&quest/burnthetaken_nathaniel_01.dbr"}
	man01StateObjects[""					 	] = { state = BurnTheTakenState.Default, dbr = "records/creatures/npcs/questnpcs/gdareac/npc_nathaniel_01.dbr"}

function gd.quests.areaCQuestBurnTheTaken.man01OnAddToWorld(objectId)
	
	if Server then
		if (not spawnedMan01) then
			man01Id = objectId
			monsterId = objectId
		
			local userdata = {};
			local didWork, newState = TokenStateBasedObjectSwap(objectId, userdata, man01StateObjects, Character, CharacterCreateArgs)
		
			Shared.setUserdata(objectId, userdata);
		
			--Don't respawn Man01 next time. If spawned as hostile, will be saved into the world
			if (newState == BurnTheTakenState.Hostile) then
				spawnedMan01 = true
				
			end
		
		end
		
	end
	
end

gd.quests.areaCQuestBurnTheTaken.man01OnDestroy = ClearObjectUserdata

--Woman 1
local woman01StateObjects = orderedTable();
	woman01StateObjects["AREAC_BURNTHETAKEN_FREEFINISH"	] = { state = BurnTheTakenState.FreeFinished, dbr = nil}
	woman01StateObjects["AREAC_BURNTHETAKEN_FREE"	] = { state = BurnTheTakenState.Free, dbr = nil}
	woman01StateObjects["AREAC_BURNTHETAKEN_BURNFINISH"	] = { state = BurnTheTakenState.BurnFinished, dbr = nil}
	woman01StateObjects["AREAC_BURNTHETAKEN_BURN"	] = { state = BurnTheTakenState.Burn, dbr = "records/creatures/npcs/flavornpcs/gdareac/npc_burnthetaken_female_01.dbr"}
	woman01StateObjects["AREAC_BURNTHETAKEN_HOSTILE"	] = { state = BurnTheTakenState.Hostile, dbr = "records/creatures/enemies/boss&quest/burnthetaken_female_01.dbr"}
	woman01StateObjects[""					 	] = { state = BurnTheTakenState.Default, dbr = "records/creatures/npcs/flavornpcs/gdareac/npc_burnthetaken_female_01.dbr"}

function gd.quests.areaCQuestBurnTheTaken.woman01OnAddToWorld(objectId)
	
	if Server then
		if (not spawnedWoman01) then
			woman01Id = objectId
			monsterId = objectId
		
			local userdata = {};
			local didWork, newState = TokenStateBasedObjectSwap(objectId, userdata, woman01StateObjects, Character, CharacterCreateArgs)
		
			Shared.setUserdata(objectId, userdata);
		
			--Don't respawn Woman01 next time. If spawned as hostile, will be saved into the world
			if (newState == BurnTheTakenState.Hostile) then
				spawnedWoman01 = true
				
			end
		
		end
		
	end
	
end

gd.quests.areaCQuestBurnTheTaken.woman01OnDestroy = ClearObjectUserdata

--Man 2
local man02StateObjects = orderedTable();
	man02StateObjects["AREAC_BURNTHETAKEN_FREEFINISH"	] = { state = BurnTheTakenState.FreeFinished, dbr = nil}
	man02StateObjects["AREAC_BURNTHETAKEN_FREE"	] = { state = BurnTheTakenState.Free, dbr = nil}
	man02StateObjects["AREAC_BURNTHETAKEN_BURNFINISH"	] = { state = BurnTheTakenState.BurnFinished, dbr = nil}
	man02StateObjects["AREAC_BURNTHETAKEN_BURN"	] = { state = BurnTheTakenState.Burn, dbr = "records/creatures/npcs/flavornpcs/gdareac/npc_burnthetaken_male_01.dbr"}
	man02StateObjects["AREAC_BURNTHETAKEN_HOSTILE"	] = { state = BurnTheTakenState.Hostile, dbr = "records/creatures/enemies/boss&quest/burnthetaken_male_01.dbr"}
	man02StateObjects[""					 	] = { state = BurnTheTakenState.Default, dbr = "records/creatures/npcs/flavornpcs/gdareac/npc_burnthetaken_male_01.dbr"}

function gd.quests.areaCQuestBurnTheTaken.man02OnAddToWorld(objectId)
	
	if Server then
		if (not spawnedMan02) then
			man02Id = objectId
			monsterId = objectId
		
			local userdata = {};
			local didWork, newState = TokenStateBasedObjectSwap(objectId, userdata, man02StateObjects, Character, CharacterCreateArgs)
		
			Shared.setUserdata(objectId, userdata);
		
			--Don't respawn Man02 next time. If spawned as hostile, will be saved into the world
			if (newState == BurnTheTakenState.Hostile) then
				spawnedMan02 = true
				
			end
		
		end
		
	end
	
end

gd.quests.areaCQuestBurnTheTaken.man02OnDestroy = ClearObjectUserdata

-- Swap the men to hostile
function gd.quests.areaCQuestBurnTheTaken.hostileSwitch()

	if Server then
		if not spawnedMan01 && not spawnedMan02 && not spawnedWoman01 then

			local didWork01, newState01 = UpdateObjectSwap(man01Id, man01StateObjects, Character, CharacterCreateArgs)
			local didWork02, newState02 = UpdateObjectSwap(woman01Id, woman01StateObjects, Character, CharacterCreateArgs)
			local didWork03, newState03 = UpdateObjectSwap(man02Id, man02StateObjects, Character, CharacterCreateArgs)
	
			-- Don't respawn npcs next time. If spawned as hostile, will be saved into the world
			if (newState01 == BurnTheTakenState.Hostile) then
				spawnedMan01 = true
			
			end
			
			if (newState02 == BurnTheTakenState.Hostile) then
				spawnedWoman01 = true
			
			end
			
			if (newState03 == BurnTheTakenState.Hostile) then
				spawnedMan02 = true
			
			end
		
		end
	
	end

end


--Witch
local witchStateObjects = orderedTable();
	witchStateObjects["AREAC_BURNTHETAKEN_FREEFINISH"	] = { state = BurnTheTakenState.FreeFinished, dbr = nil}
	witchStateObjects["AREAC_BURNTHETAKEN_FREE"	] = { state = BurnTheTakenState.Free, dbr = "records/creatures/npcs/questnpcs/gdareac/npc_rallia_03.dbr"}
	witchStateObjects["AREAC_BURNTHETAKEN_BURNFINISH"	] = { state = BurnTheTakenState.BurnFinished, dbr = "records/storyelements/questassets/burnthetaken_corpse01a.dbr"}
	witchStateObjects["AREAC_BURNTHETAKEN_BURN"	] = { state = BurnTheTakenState.Burn, dbr = "records/creatures/npcs/questnpcs/gdareac/npc_rallia_02.dbr"}
	witchStateObjects["AREAC_BURNTHETAKEN_HOSTILE"	] = { state = BurnTheTakenState.Hostile, dbr = "records/creatures/npcs/questnpcs/gdareac/npc_rallia_01.dbr"}
	witchStateObjects[""					 	] = { state = BurnTheTakenState.Default, dbr = "records/creatures/npcs/questnpcs/gdareac/npc_rallia_01.dbr"}

function gd.quests.areaCQuestBurnTheTaken.witchOnAddToWorld(objectId)

	if Server then
		witchId = objectId

		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, witchStateObjects, Character);
		Shared.setUserdata(objectId, userdata);
	
	end
	
end

gd.quests.areaCQuestBurnTheTaken.witchOnDestroy = ClearObjectUserdata


-- Fire
local fireStateObjects = orderedTable();
	fireStateObjects["AREAC_BURNTHETAKEN_BURNFINISH"	] = { state = BurnTheTakenState.BurnFinished, dbr = "records/fx/ambient/fx_firebonfire01.dbr"}
	fireStateObjects["AREAC_BURNTHETAKEN_BURN"	] = { state = BurnTheTakenState.Burn, dbr = "records/fx/ambient/fx_firebonfire01.dbr"}
	fireStateObjects[""					 	] = { state = BurnTheTakenState.Default, dbr = nil}

function gd.quests.areaCQuestBurnTheTaken.fireOnAddToWorld(objectId)
	
	if Server then
		fireId= objectId

		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, fireStateObjects, Character);
		Shared.setUserdata(objectId, userdata);
	
	end
	
end

gd.quests.areaCQuestBurnTheTaken.fireOnDestroy = ClearObjectUserdata


--Triggered by conversations. Swaps witch and fire to burn state
local burnedWitch = false

function gd.quests.areaCQuestBurnTheTaken.burnWitch()

	if Server then
		local player = Game.GetLocalPlayer()
		
		if player:HasToken("AREAC_BURNTHETAKEN_BURN") && not burnedWitch then
			burnedWitch = true

			local witch = Entity.Get(witchId)
			local fire = Entity.Get(fireId)
	
			if witch != nil then
				UpdateObjectSwap(witchId, witchStateObjects, Character)
			end
		
			if fire != nil then
				UpdateObjectSwap(fireId, fireStateObjects)
			end
			
		end
	
	end

end

--Triggered by conversations. Swaps witch to freed state
local freedWitch = false

function gd.quests.areaCQuestBurnTheTaken.freeWitch()

	if Server then
		local player = Game.GetLocalPlayer()
		
		if player:HasToken("AREAC_BURNTHETAKEN_FREE") && not freedWitch then
			freedWitch = true

			local witch = Entity.Get(witchId)
	
			if witch != nil then
				UpdateObjectSwap(witchId, witchStateObjects, Character)
			end
			
		end
	
	end

end

--Triggered by conversations. Teleports witch out.
local witchFinished = false

function gd.quests.areaCQuestBurnTheTaken.witchFinished()

	if Server then
		local player = Game.GetLocalPlayer()
		
		if player:HasToken("AREAC_BURNTHETAKEN_FREEFINISH") && not witchFinished then
			witchFinished = true

			local witch = Entity.Get(witchId)
	
			if witch != nil then
				local coords = witch:GetCoords();
				local riftStart = Entity.Create("records/fx/ui/riftgatepersonalopen_fxpak.dbr")
		
				if riftStart != nil then
					riftStart:NetworkEnable()
					riftStart:SetCoords(coords)
				end
		
				UpdateObjectSwap(witchId, witchStateObjects, Character)
			end
			
		end
	
	end

end

