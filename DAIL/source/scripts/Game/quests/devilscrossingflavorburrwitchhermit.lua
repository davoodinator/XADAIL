/*
	
	GRIM DAWN
	
	For more information, visit us at http://www.grimdawn.com
	
*/

gd.quests.devilsCrossingFlavorBurrwitchHermit = {}

--
-- Crazy Hermit hiding out in Burrwitch where the Aetherials would be least likely to check
-- Most dialogue options trigger him to go hostile
--

local hermitId = 0
local hermitSpawned = false

local HermitState = { Default = 0, Hostile = 1, Dead = 2 }

local hermitStateObjects = orderedTable();
	hermitStateObjects["DC_HERMIT_DEAD"] = { state = HermitState.Dead, dbr = nil }
	hermitStateObjects["DC_HERMIT_HOSTILE"] = { state = HermitState.Hostile, dbr = "records/creatures/enemies/boss&quest/burrwitchhermit_hostile.dbr" }
	hermitStateObjects[""	                    ] = { state = HermitState.Default,  dbr = "records/creatures/npcs/flavornpcs/devilscrossing/npc_burrwitchhermit_01.dbr"}

local function GetHermitMaxLevel()

	local maxLevel = 0

	if (Game.GetGameDifficulty() == Game.Difficulty.Normal) then
		maxLevel = 25
	elseif (Game.GetGameDifficulty() == Game.Difficulty.Epic) then
		maxLevel = 60
	else
		maxLevel = 80
	end
	
	if (Game.GetAveragePlayerLevel() < maxLevel) then
		maxLevel = 0
	end
	
	return maxLevel
	
end
		
local function CharacterCreateArgs()

	return GetHermitMaxLevel(), nil
	
end
	
	
function gd.quests.devilsCrossingFlavorBurrwitchHermit.hermitOnAddToWorld(objectId)

	if Server then
	
		if (not hermitSpawned) then

			hermitId = objectId

			-- Create peaceful or active Hermit
			local userdata = {}
			local didWork, newState = TokenStateBasedObjectSwap(objectId, userdata, hermitStateObjects, Character, CharacterCreateArgs)
			
			Shared.setUserdata(objectId, userdata)

			-- Don't respawn hermit next time if spawned as hostile, he will be saved into the world
			if (newState == HermitState.Hostile) then
				hermitSpawned = true
			end
			
		end
		
	end
	
end

gd.quests.devilsCrossingFlavorBurrwitchHermit.hermitOnDestroy = ClearObjectUserdata

function gd.quests.devilsCrossingFlavorBurrwitchHermit.hermitKilled()

	local player = Game.GetLocalPlayer()
	
	if (player != nil && player:HasToken("DC_HERMIT_HOSTILE")) then
		player:GiveToken("DC_HERMIT_DEAD")
		player:RemoveToken("DC_HERMIT_HOSTILE")

	end

end


--Triggered by conversation hostile swap.
function gd.quests.devilsCrossingFlavorBurrwitchHermit.hostileSwitchGlobalMP()

	local player = Game.GetLocalPlayer()
	
	if (player != nil && player:HasToken("DC_HERMIT_DEAD") == false) then
		player:GiveToken("DC_HERMIT_HOSTILE")
		
	end

end

function gd.quests.devilsCrossingFlavorBurrwitchHermit.hostileSwitch()

	if Server then
		if not hermitSpawned then
			hermitSpawned = true

			-- Update hermit
			GiveTokenToLocalPlayer("DC_HERMIT_HOSTILE")
			
			local didWork, newState = UpdateObjectSwap(hermitId, hermitStateObjects, Character, CharacterCreateArgs)

			QuestGlobalEvent("burrwitchHermitHostileSwapToken")
		
		end
	
	end
	
end
