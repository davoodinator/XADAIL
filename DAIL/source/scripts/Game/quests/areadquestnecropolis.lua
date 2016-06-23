/*
	
	GRIM DAWN
	
	For more information, visit us at http://www.grimdawn.com
	
*/

gd.quests.areaDQuestNecropolis = {}



--
-- Necropolis Riftgate
-- Controls the unlocking of the Necropolis Riftgate
--
local necropolisRiftgate = nil
local necropolisWaveObjectId = 0
local necropolisWaveEventStarted = false
local necropolisWaveEventKey = "NECROPOLIS_RIFTGATEWAVEEVENT"

function gd.quests.areaDQuestNecropolis.waveEventOnAddToWorld(objectId)

	if Server then
		necropolisWaveObjectId = objectId
		WaveEvent_OnAddToWorld(objectId, necropolisWaveEventKey)
	
	end

end

function gd.quests.areaDQuestNecropolis.waveEventOnRemoveFromWorld(objectId)

	if Server then
		WaveEvent_OnRemoveFromWorld(objectId)
	
	end
	
end

-- end of riftgate event
local necropolisRiftgateEventEndedMP = false

function gd.quests.areaDQuestNecropolis.endEventMP()
	
	if not necropolisRiftgateEventEndedMP then
		necropolisRiftgateEventEndedMP = true
		GiveTokenToLocalPlayer("NECROPOLIS_RIFTGATE_SECURED")

		if necropolisRiftgate != nil then
			necropolisRiftgate:SetLocked(false)
			
		end
		
	end
	
end

function gd.quests.areaDQuestNecropolis.endWaveEvent(objectId)
	-- Give Token credit to all players and unlock the riftgate
	QuestGlobalEvent("necropolisRiftgateEndEvent")
	
end

local waveParameters = { }
	waveParameters.waves = {"records/proxies/boss&quest/questproxy_aread_necropolisriftgate_wave1.dbr", "records/proxies/boss&quest/questproxy_aread_necropolisriftgate_wave2.dbr", "records/proxies/boss&quest/questproxy_aread_necropolisriftgate_wave3.dbr"}
	waveParameters.endCallback = gd.quests.areaDQuestNecropolis.endWaveEvent
	waveParameters.key = necropolisWaveEventKey

function gd.quests.areaDQuestNecropolis.startWaveEventMP()

	if Server then
		if (not necropolisWaveEventStarted) then
			necropolisWaveEventStarted = true
			WaveEvent_Start(necropolisWaveObjectId, waveParameters)
		
		end
		
	end

end
	
function gd.quests.areaDQuestNecropolis.startWaveEvent(triggererId)

	local player = Player.Get(triggererId)
	
	if (player:HasToken("NECROPOLIS_RIFTGATE_SECURED") == false) then
		
		if (player:GetLevel() > 10) then
	
			if (player:HasToken("NECROPOLIS_RIFTGATEFOUND") == false) then
				GiveTokenIfPlayer(triggererId, "NECROPOLIS_RIFTGATEFOUND")
				UI.Notify("tagNotification_AreaD_NecropolisRiftgate")
			end
		
			QuestEvent("necropolisRiftgateWaveEvent")
			
		end
	
	end
	

end

function gd.quests.areaDQuestNecropolis.enterNecropolis(triggererId)

	GiveTokenIfPlayer(triggererId, "NECROPOLIS_ENTERED")

end

function gd.quests.areaDQuestNecropolis.riftgateOnAddToWorld(objectId)

	-- This function is run locally on all clients to set the variable and unlock the gate. Riftgates are not spawned by the server
	local player = Game.GetLocalPlayer()
	necropolisRiftgate = Riftgate.Get(objectId)

	if player:HasToken("NECROPOLIS_RIFTGATE_SECURED") then
		necropolisRiftgate:SetLocked(false)
	
	end

end

--
-- Necropolis Base NPCs
--
local guard01Id = 0
local guard02Id = 0
local guard03Id = 0
local guard04Id = 0

local GuardSpawned01 = false
local GuardSpawned02 = false
local GuardSpawned03 = false
local GuardSpawned04 = false

local NecropolisState = { Default = 0, Spawned = 1 }

local function GuardCharacterCreateArgs()

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
	
	return maxLevel, nil
	
end

local Guard01StateObjects = orderedTable();
	Guard01StateObjects["NECROPOLIS_BASE"] = { state = NecropolisState.Spawned, dbr = "records/creatures/npcs/guard/guard_blacklegion_melee01.dbr" }
	Guard01StateObjects[""] 			= { state = NecropolisState.Default, dbr = nil }

function gd.quests.areaDQuestNecropolis.Guard01OnAddToWorld(objectId)

	if Server then
	
		if (not GuardSpawned01) then
			guard01Id = objectId
			
			local userdata = {}
			local didWork, newState = TokenStateBasedObjectSwap(objectId, userdata, Guard01StateObjects, Character, GuardCharacterCreateArgs)

			Shared.setUserdata(objectId, userdata)
			
			-- Don't respawn the guard if spawned
			if (newState == NecropolisState.Spawned) then
				GuardSpawned01 = true
				
			end
			

			
		end
		
	end
	
end

gd.quests.areaDQuestNecropolis.Guard01OnDestroy = ClearObjectUserdata


local Guard02StateObjects = orderedTable();
	Guard02StateObjects["NECROPOLIS_BASE"] = { state = NecropolisState.Spawned, dbr = "records/creatures/npcs/guard/guard_blacklegion_ranged_female01.dbr" }
	Guard02StateObjects[""] 			= { state = NecropolisState.Default, dbr = nil }

function gd.quests.areaDQuestNecropolis.Guard02OnAddToWorld(objectId)

	if Server then
	
		if (not GuardSpawned02) then
			guard02Id = objectId
			
			local userdata = {}
			local didWork, newState = TokenStateBasedObjectSwap(objectId, userdata, Guard02StateObjects, Character, GuardCharacterCreateArgs)
			
			-- Don't respawn the guard if spawned
			if (newState == NecropolisState.Spawned) then
				GuardSpawned02 = true
				
			end			
			Shared.setUserdata(objectId, userdata)
			
		end
		
	end
	
end

gd.quests.areaDQuestNecropolis.Guard02OnDestroy = ClearObjectUserdata


local Guard03StateObjects = orderedTable();
	Guard03StateObjects["NECROPOLIS_BASE"] = { state = NecropolisState.Spawned, dbr = "records/creatures/npcs/guard/guard_blacklegion_ranged01.dbr" }
	Guard03StateObjects[""] 			= { state = NecropolisState.Default, dbr = nil }
	
function gd.quests.areaDQuestNecropolis.Guard03OnAddToWorld(objectId)

	if Server then
	
		if (not GuardSpawned03) then
			guard03Id = objectId
			
			local userdata = {}
			local didWork, newState = TokenStateBasedObjectSwap(objectId, userdata, Guard03StateObjects, Character, GuardCharacterCreateArgs)

			Shared.setUserdata(objectId, userdata)
			
			-- Don't respawn the guard if spawned
			if (newState == NecropolisState.Spawned) then
				GuardSpawned03 = true
				
			end
			

			
		end
		
	end
	
end

gd.quests.areaDQuestNecropolis.Guard03OnDestroy = ClearObjectUserdata

local Guard04StateObjects = orderedTable();
	Guard04StateObjects["NECROPOLIS_BASE"] = { state = NecropolisState.Spawned, dbr = "records/creatures/npcs/guard/guard_blacklegion_ranged01.dbr" }
	Guard04StateObjects[""] 			= { state = NecropolisState.Default, dbr = nil }

function gd.quests.areaDQuestNecropolis.Guard04OnAddToWorld(objectId)

	if Server then
	
		if (not GuardSpawned04) then
			guard04Id = objectId
			
			local userdata = {}
			local didWork, newState = TokenStateBasedObjectSwap(objectId, userdata, Guard04StateObjects, Character, GuardCharacterCreateArgs)

			Shared.setUserdata(objectId, userdata)
			
			-- Don't respawn the guard if spawned
			if (newState == NecropolisState.Spawned) then
				GuardSpawned04 = true
				
			end
			

			
		end
		
	end
	
end

gd.quests.areaDQuestNecropolis.Guard04OnDestroy = ClearObjectUserdata




-- Called by quest, teleports NPCs into Necropolis base
local necropolisPortal = false

function gd.quests.areaDQuestNecropolis.necropolisPortal()

	if Server then
		local player = Game.GetLocalPlayer()
		
		if player:HasToken("NECROPOLIS_BASE") && necropolisPortal == false then
			necropolisPortal = true

			local guard01 = Entity.Get(guard01Id)
			local guard02 = Entity.Get(guard02Id)
			local guard03 = Entity.Get(guard03Id)
			local guard04 = Entity.Get(guard04Id)
		
			if (guard01 != nil) then
		
				local coords = guard01:GetCoords()	
				local rift = Entity.Create("records/fx/ui/riftgatepersonalopen_fxpak.dbr")
			
				if (rift != nil) then
					rift:NetworkEnable()
					rift:SetCoords(coords)
				end
			
				UpdateObjectSwap(guard01Id, Guard01StateObjects)
			
			end
			
			if (guard02 != nil) then
		
				local coords = guard02:GetCoords()	
				local rift = Entity.Create("records/fx/ui/riftgatepersonalopen_fxpak.dbr")
			
				if (rift != nil) then
					rift:NetworkEnable()
					rift:SetCoords(coords)
				end
			
				UpdateObjectSwap(guard02Id, Guard02StateObjects)
			
			end
			
			if (guard03 != nil) then
		
				local coords = guard03:GetCoords()	
				local rift = Entity.Create("records/fx/ui/riftgatepersonalopen_fxpak.dbr")
			
				if (rift != nil) then
					rift:NetworkEnable()
					rift:SetCoords(coords)
				end
			
				UpdateObjectSwap(guard03Id, Guard03StateObjects)
			
			end
			
			if (guard04 != nil) then
		
				local coords = guard04:GetCoords()	
				local rift = Entity.Create("records/fx/ui/riftgatepersonalopen_fxpak.dbr")
			
				if (rift != nil) then
					rift:NetworkEnable()
					rift:SetCoords(coords)
				end
			
				UpdateObjectSwap(guard04Id, Guard04StateObjects)
			
			end
		
		end
		
	end
	
end


--
-- Necropolis Legion Spawns
-- Only spawned after Necropolis base is set up
--
local legionProxy01Spawned = false
local legionProxy02Spawned = false
local legionProxy03Spawned = false
local legionProxy04Spawned = false

function gd.quests.areaDQuestNecropolis.blackLegionProxy01OnAddToWorld(objectId)

	if Server then
		local player = Game.GetLocalPlayer()
		
		if player:HasToken("NECROPOLIS_BASE") && not legionProxy01Spawned then
			legionProxy01Spawned = true
			local entity = Entity.Get(objectId)
			local coords = entity:GetCoords()
			
			local proxy = Proxy.Create("records/proxies/area001/faction_blacklegion_n_always.dbr", coords.origin)
			
			proxy:SetCoords(coords)
			
		end
		
	end
	
end

gd.quests.areaDQuestNecropolis.blackLegionProxy01OnDestroy = ClearObjectUserdata


function gd.quests.areaDQuestNecropolis.blackLegionProxy02OnAddToWorld(objectId)

	if Server then
		local player = Game.GetLocalPlayer()
		
		if player:HasToken("NECROPOLIS_BASE") && not legionProxy02Spawned then
			legionProxy02Spawned = true
			local entity = Entity.Get(objectId)
			local coords = entity:GetCoords()
			
			local proxy = Proxy.Create("records/proxies/area001/faction_blacklegion_n_always.dbr", coords.origin)
			
			proxy:SetCoords(coords)
			
		end
		
	end
	
end

gd.quests.areaDQuestNecropolis.blackLegionProxy02OnDestroy = ClearObjectUserdata


function gd.quests.areaDQuestNecropolis.blackLegionProxy03OnAddToWorld(objectId)

	if Server then
		local player = Game.GetLocalPlayer()
		
		if player:HasToken("NECROPOLIS_BASE") && not legionProxy03Spawned then
			legionProxy03Spawned = true
			local entity = Entity.Get(objectId)
			local coords = entity:GetCoords()
			
			local proxy = Proxy.Create("records/proxies/area001/faction_blacklegion_n_ranged.dbr", coords.origin)
			
			proxy:SetCoords(coords)
			
		end
		
	end
	
end

gd.quests.areaDQuestNecropolis.blackLegionProxy03OnDestroy = ClearObjectUserdata


function gd.quests.areaDQuestNecropolis.blackLegionProxy04OnAddToWorld(objectId)

	if Server then
		local player = Game.GetLocalPlayer()
		
		if player:HasToken("NECROPOLIS_BASE") && not legionProxy04Spawned then
			legionProxy04Spawned = true
			local entity = Entity.Get(objectId)
			local coords = entity:GetCoords()
			
			local proxy = Proxy.Create("records/proxies/area001/faction_blacklegion_n_ranged.dbr", coords.origin)
			
			proxy:SetCoords(coords)
			
		end
		
	end
	
end

gd.quests.areaDQuestNecropolis.blackLegionProxy04OnDestroy = ClearObjectUserdata


--
-- Necropolis Faction Spawns
-- Only spawned after Necropolis base is set up
--
local factionProxy01Spawned = false
local factionProxy02Spawned = false
local factionProxy03Spawned = false
local factionProxy04Spawned = false

function gd.quests.areaDQuestNecropolis.factionProxy01OnAddToWorld(objectId)

	if Server then
		local player = Game.GetLocalPlayer()
		
		if player:HasToken("NECROPOLIS_BASE") && not factionProxy01Spawned then
			local entity = Entity.Get(objectId)
			local coords = entity:GetCoords()
			local proxy = nil
			
			if player:GetFaction("USER5") >= 5000 then
				factionProxy01Spawned = true
				proxy = Proxy.Create("records/proxies/area001/faction_orderdeathsvigil_n_friendlyonly.dbr", coords.origin)
				proxy:SetCoords(coords)
			
			elseif player:GetFaction("USER8") >= 5000 then
				factionProxy01Spawned = true
				proxy = Proxy.Create("records/proxies/area001/faction_kymonchosen_n_friendlyonly.dbr", coords.origin)
				proxy:SetCoords(coords)
			
			end
			
		end
		
	end
	
end

gd.quests.areaDQuestNecropolis.factionProxy01OnDestroy = ClearObjectUserdata


function gd.quests.areaDQuestNecropolis.factionProxy02OnAddToWorld(objectId)

	if Server then
		local player = Game.GetLocalPlayer()
		
		if player:HasToken("NECROPOLIS_BASE") && not factionProxy02Spawned then
			local entity = Entity.Get(objectId)
			local coords = entity:GetCoords()
			local proxy = nil
			
			if player:GetFaction("USER5") >= 5000 then
				factionProxy02Spawned = true
				proxy = Proxy.Create("records/proxies/area001/faction_orderdeathsvigil_n_friendlyonly.dbr", coords.origin)
				proxy:SetCoords(coords)
			
			elseif player:GetFaction("USER8") >= 5000 then
				factionProxy02Spawned = true
				proxy = Proxy.Create("records/proxies/area001/faction_kymonchosen_n_friendlyonly.dbr", coords.origin)
				proxy:SetCoords(coords)
			
			end
			
		end
		
	end
	
end

gd.quests.areaDQuestNecropolis.factionProxy02OnDestroy = ClearObjectUserdata


function gd.quests.areaDQuestNecropolis.factionProxy03OnAddToWorld(objectId)

	if Server then
		local player = Game.GetLocalPlayer()
		
		if player:HasToken("NECROPOLIS_BASE") && not factionProxy03Spawned then
			local entity = Entity.Get(objectId)
			local coords = entity:GetCoords()
			local proxy = nil
			
			if player:GetFaction("USER5") >= 5000 then
				factionProxy03Spawned = true
				proxy = Proxy.Create("records/proxies/area001/faction_orderdeathsvigil_t_friendlyonly.dbr", coords.origin)
				proxy:SetCoords(coords)
			
			elseif player:GetFaction("USER8") >= 5000 then
				factionProxy03Spawned = true
				proxy = Proxy.Create("records/proxies/area001/faction_kymonchosen_t_friendlyonly.dbr", coords.origin)
				proxy:SetCoords(coords)
			
			end
			
		end
		
	end
	
end

gd.quests.areaDQuestNecropolis.factionProxy03OnDestroy = ClearObjectUserdata


function gd.quests.areaDQuestNecropolis.factionProxy04OnAddToWorld(objectId)

	if Server then
		local player = Game.GetLocalPlayer()
		
		if player:HasToken("NECROPOLIS_BASE") && not factionProxy04Spawned then
			local entity = Entity.Get(objectId)
			local coords = entity:GetCoords()
			local proxy = nil
			
			if player:GetFaction("USER5") >= 5000 then
				factionProxy04Spawned = true
				proxy = Proxy.Create("records/proxies/area001/faction_orderdeathsvigil_t_friendlyonly.dbr", coords.origin)
				proxy:SetCoords(coords)
			
			elseif player:GetFaction("USER8") >= 5000 then
				factionProxy04Spawned = true
				proxy = Proxy.Create("records/proxies/area001/faction_kymonchosen_t_friendlyonly.dbr", coords.origin)
				proxy:SetCoords(coords)
			
			end
			
		end
		
	end
	
end

gd.quests.areaDQuestNecropolis.factionProxy04OnDestroy = ClearObjectUserdata



