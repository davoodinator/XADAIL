/*
	
	GRIM DAWN
	
	For more information, visit us at http://www.grimdawn.com
	
*/

gd.homesteadRepairs = {}

--
--Controls for Lost Armaments and Lumber for the Legion quests
--

--
--Cannons
--
local cannons01Id = 0
local cannons02Id = 0
local cannonsWorldId = 0
local cannonsObjectId = 0

local CannonState = { Default = 0, Claimed = 1 }

local cannons01TableStateObjects = orderedTable()
	cannons01TableStateObjects["AREAC_CANNONSCLAIMED"	] = { state = CannonState.Claimed,  dbr = "records/storyelements/questassets/hs_cannonarea01_after.dbr"}
	cannons01TableStateObjects[""					 	] = { state = CannonState.Default, dbr = "records/storyelements/questassets/hs_cannonarea01_before.dbr"}


function gd.homesteadRepairs.cannons01OnAddToWorld(objectId)

	if Server then
	
		cannons01Id = objectId

		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, cannons01TableStateObjects)
		Shared.setUserdata(objectId, userdata)
		
	end
	
end

gd.homesteadRepairs.cannons01OnDestroy = ClearObjectUserdata

local cannons02TableStateObjects = orderedTable()
	cannons02TableStateObjects["AREAC_CANNONSCLAIMED"	] = { state = CannonState.Claimed,  dbr = "records/storyelements/questassets/hs_cannonarea02_after.dbr"}
	cannons02TableStateObjects[""					 	] = { state = CannonState.Default, dbr = "records/storyelements/questassets/hs_cannonarea02_before.dbr"}


function gd.homesteadRepairs.cannons02OnAddToWorld(objectId)

	if Server then
	
		cannons02Id = objectId

		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, cannons02TableStateObjects)
		Shared.setUserdata(objectId, userdata)
		
	end
	
end

gd.homesteadRepairs.cannons02OnDestroy = ClearObjectUserdata

local cannonsWorldTableStateObjects = orderedTable()
	cannonsWorldTableStateObjects["AREAC_CANNONSCLAIMED"	] = { state = CannonState.Claimed,  dbr = "records/storyelements/questassets/hs_cannonworld01_after.dbr"}
	cannonsWorldTableStateObjects[""					 	] = { state = CannonState.Default, dbr = "records/creatures/npcs/questnpcs/interactiveobjects/npc_lostarmaments_cannon.dbr" }


function gd.homesteadRepairs.cannonsWorldOnAddToWorld(objectId)

	if Server then
	
		cannonsWorldId = objectId

		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, cannonsWorldTableStateObjects)
		Shared.setUserdata(objectId, userdata)
		
	end
	
end

function gd.homesteadRepairs.cannonsWorldOnRemoveFromWorld(objectId)

	if Server then
	
		cannonsWorldId = 0
		
	end
	
end

gd.homesteadRepairs.cannonsWorldOnDestroy = ClearObjectUserdata

--Token for claiming the cannons in multiplayer
function gd.homesteadRepairs.cannonsClaimedGlobalMP()

	GiveTokenToLocalPlayer("AREAC_CANNONSFOUND")

end

-- Swap in cannons on quest completion
local cannonSwap = false

function gd.homesteadRepairs.cannons()
	
	if Server then
		local player = Game.GetLocalPlayer()
		
		if (player:HasToken("AREAC_CANNONSCLAIMED") && cannonSwap == false) then
			cannonSwap = true
			
			local cannon01 = Entity.Get(cannons01Id)
			local cannon02 = Entity.Get(cannons02Id)
		
			if (cannon01 != nil) then
				local coords = cannon01:GetCoords()
				local pfx = Entity.Create("records/fx/general/genericrepair_fxpak01.dbr")
			
				if (pfx != nil) then
					pfx:NetworkEnable()
					pfx:SetCoords(coords)
					
				end
				
				UpdateObjectSwap(cannons01Id, cannons01TableStateObjects)
			
			end
			
			if (cannon02 != nil) then
				local coords02 = cannon02:GetCoords()
				local pfx02 = Entity.Create("records/fx/general/genericrepair_fxpak01.dbr")
			
				if (pfx02 != nil) then
					pfx02:NetworkEnable()
					pfx02:SetCoords(coords02)
					
				end
				
				UpdateObjectSwap(cannons02Id, cannons02TableStateObjects)
			
			end
				
			UpdateObjectSwap(cannonsWorldId, cannonsWorldTableStateObjects)
			
		end
	
	end

end

-- Checks if the player has slain the Herald of Flame this session
local heraldSlain = false

function gd.homesteadRepairs.bossCheck()

	local test = false
	
	if heraldSlain then
		test = true
	
	end
	
	return test

end

function gd.homesteadRepairs.heraldOfFlameKilled()
	
	GiveTokenToLocalPlayer("AREAC_HERALDSLAIN")
	
	if not heraldSlain then
		heraldSlain = true
		
	end

end


--
-- Lumber mill and housing area
--
local housingBaseId = 0
local housingTopId = 0
local cannonsWorldId = 0

local LumberMillState = { Default = 0, Claimed = 1 }

local housingBaseTableStateObjects = orderedTable()
	housingBaseTableStateObjects["AREAC_LUMBERMILLCLAIMED"	] = { state = LumberMillState.Claimed,  dbr = "records/storyelements/questassets/hs_housingarea01_after_base.dbr"}
	housingBaseTableStateObjects[""					 	] = { state = LumberMillState.Default, dbr = "records/storyelements/questassets/hs_housingarea01_before.dbr"}


function gd.homesteadRepairs.housingBaseOnAddToWorld(objectId)

	if Server then
	
		housingBaseId = objectId

		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, housingBaseTableStateObjects)
		Shared.setUserdata(objectId, userdata)
		
	end
	
end

gd.homesteadRepairs.housingBaseOnDestroy = ClearObjectUserdata

local housingTopTableStateObjects = orderedTable()
	housingTopTableStateObjects["AREAC_LUMBERMILLCLAIMED"	] = { state = CannonState.Claimed,  dbr = "records/storyelements/questassets/hs_housingarea01_after_top.dbr"}
	housingTopTableStateObjects[""					 	] = { state = CannonState.Default, dbr = nil }


function gd.homesteadRepairs.housingTopOnAddToWorld(objectId)

	if Server then
	
		housingTopId = objectId

		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, housingTopTableStateObjects)
		Shared.setUserdata(objectId, userdata)
		
	end
	
end

gd.homesteadRepairs.housingTopOnDestroy = ClearObjectUserdata


-- Swap in housing area on quest completion
local housingSwap = false

function gd.homesteadRepairs.housingArea()
	
	if Server then
		local player = Game.GetLocalPlayer()
		
		if (player:HasToken("AREAC_LUMBERMILLCLAIMED") && housingSwap == false) then
			housingSwap = true
			local housing = Entity.Get(housingBaseId)

			UpdateObjectSwap(housingBaseId, housingBaseTableStateObjects)
			UpdateObjectSwap(housingTopId, housingTopTableStateObjects)
			
			if (housing != nil) then
				local coords = housing:GetCoords()
				local pfx = Entity.Create("records/fx/general/bridgerepair_fxpak01.dbr")
			
				if (pfx != nil) then
					pfx:NetworkEnable()
					pfx:SetCoords(coords)
					
				end
			
			end
			
		end
	
	end

end



-- Chthonians
local swarmId = 0

local spawnedInfestation01 = false
local spawnedInfestation02 = false

local InfestationState = { Default = 0, Clear = 1 }

local infestationStateObjects = orderedTable()
	infestationStateObjects["AREAC_LUMBERMILL_CLEARED"	] = { state = InfestationState.Clear,  dbr = nil }
	infestationStateObjects[""					 	] = { state = InfestationState.Default, dbr = "records/proxies/boss&quest/questproxy_areac_chthonianinfestation.dbr"}

local function CreateArgs()

	return Entity.Get(swarmId):GetCoords().origin
	
end

function gd.homesteadRepairs.infestation01OnAddToWorld(objectId)

		if (not spawnedInfestation01) then
			swarmId = objectId
			
			local userdata = {}
			local didWork, newState = TokenStateBasedObjectSwap(objectId, userdata, infestationStateObjects, Proxy, CreateArgs)
			Shared.setUserdata(objectId, userdata)
			
			-- Don't respawn Chthonians next time. If spawned, saved into world
			if (newState == InfestationState.Default) then
				spawnedInfestation01 = true
				
			end
		
		end
	
end

gd.homesteadRepairs.infestation01OnDestroy = ClearObjectUserdata

function gd.homesteadRepairs.infestation02OnAddToWorld(objectId)

		if (not spawnedInfestation02) then
			swarmId = objectId
			local userdata = {}
			local didWork, newState = TokenStateBasedObjectSwap(objectId, userdata, infestationStateObjects, Proxy, CreateArgs)
			Shared.setUserdata(objectId, userdata)
			
			-- Don't respawn Chthonians next time. If spawned, saved into world
			if (newState == InfestationState.Default) then
				spawnedInfestation02 = true
				
			end
		
		end
	
end

gd.homesteadRepairs.infestation02OnDestroy = ClearObjectUserdata


--Black Legion Guards
local guardSpawned01 = false
local guardSpawned02 = false

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

local guardStateObjects = orderedTable();
	guardStateObjects["AREAC_LUMBERMILLCLAIMED"] = { state = InfestationState.Clear,  dbr = "records/creatures/npcs/guard/guard_blacklegion_melee01.dbr" }
	guardStateObjects[""] 			= { state = InfestationState.Default, dbr = nil }

function gd.homesteadRepairs.guard01OnAddToWorld(objectId)

	if Server then
	
		if (not guardSpawned01) then
			
			local userdata = {}
			local didWork, newState = TokenStateBasedObjectSwap(objectId, userdata, guardStateObjects, Character, GuardCharacterCreateArgs)
			
			Shared.setUserdata(objectId, userdata)
			
			if (newState == InfestationState.Clear) then
				guardSpawned01 = true
			end
			
		end
		
	end
	
end

gd.homesteadRepairs.guard01OnOnDestroy = ClearObjectUserdata

function gd.homesteadRepairs.guard02OnAddToWorld(objectId)

	if Server then
	
		if (not guardSpawned02) then
			
			local userdata = {}
			local didWork, newState = TokenStateBasedObjectSwap(objectId, userdata, guardStateObjects, Character, GuardCharacterCreateArgs)
			
			Shared.setUserdata(objectId, userdata)
			
			if (newState == InfestationState.Clear) then
				guardSpawned02 = true
			end
			
		end
		
	end
	
end

gd.homesteadRepairs.guard02OnOnDestroy = ClearObjectUserdata

--
-- Item grants a quest
--

function gd.homesteadRepairs.lootDiary(looterId, itemId)

	if looterId == Game.GetLocalPlayer():GetId() then
		local kQuest = 0x1CE68AC0
		local kTask  = 0x639E4B80
		local player = Player.Get(looterId)
		
		local questState = player:GetQuestState(kQuest)

		if ((player != nil) && (questState == QuestState.Available)) then
			player:GrantQuest(kQuest, kTask)
			
		end
	
	end
	
end

