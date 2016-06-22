/*
	
	GRIM DAWN
	
	For more information, visit us at http://www.grimdawn.com
	
*/

gd.quests.areaDQuestTrueThreat = {}

-- Boss Door Control
local bossDoorEnter = 0
local bossDoorExit = 0

function gd.quests.areaDQuestTrueThreat.bossDoorEnterOnAddToWorld(objectId)
	
	if Server then
		bossDoorEnter = objectId
		
	end
	
end

function gd.quests.areaDQuestTrueThreat.bossDoorExitOnAddToWorld(objectId)

	if Server then
		bossDoorExit = objectId

	end
	
end

function gd.quests.areaDQuestTrueThreat.bossKilled()
	
	GiveTokenToLocalPlayer("IKONCOMMANDER_SLAIN")
	
	if Server then
		local door01 = Door.Get(bossDoorEnter)	
		local door02 = Door.Get(bossDoorExit)
	
		if door01 ~= nil then
			door01:Open()
		
		end
	
		if door02 ~= nil then
			door02:Open()
		
		end
		
	end

end

-- Fort Ikon shortcut gate
local fortIkonShortcutId = 0

function gd.quests.areaDQuestTrueThreat.fortIkonShortcutOnAddToWorld(objectId)
	
	if Server then
		fortIkonShortcutId = objectId
		local door = Door.Get(objectId)
		local player = Game.GetLocalPlayer()
		
		if player:HasToken("AREAD_FORTDUNGEON_OPEN") then
			door:Open()
		
		end

		
	end
	
end

-- Dungeon Entrance
local dungeonDoor = 0

function gd.quests.areaDQuestTrueThreat.bossDungeonOnAddToWorld(objectId)
	
	if Server then
		dungeonDoor = objectId
		local door = Door.Get(objectId)
		local player = Game.GetLocalPlayer()
		
		if player:HasToken("AREAD_FORTDUNGEON_OPEN") then
			door:SetLocked(false)
			door:Open()
		
		end
		
	end
	
end

function gd.quests.areaDQuestTrueThreat.bossDungeonUnlock()
	
	if Server then
		local door = Door.Get(dungeonDoor)	
		local door02 = Door.Get(fortIkonShortcutId)
	
		if door ~= nil then
			door:SetLocked(false)
			door:Open()
		
		end

		if door02 ~= nil then
			door02:Open()
		
		end
		
	end

end


--
-- Front Gate Barricade
--
local BlockadeState = { Active = 0, Destroyed = 1}

local blockadeId = 0
local spawnedBlockade = false

-- Blockade
local blockadeStateObjects = orderedTable();
	blockadeStateObjects["FORTIKON_BLOCKADECLEARED"]	= { state = BlockadeState.Destroyed,  dbr = nil }
	blockadeStateObjects[""] 								= { state = BlockadeState.Active, dbr = "records/storyelements/questassets/debriswall_fortikon_break.dbr" }

function gd.quests.areaDQuestTrueThreat.blockadeOnAddToWorld(objectId)

	if Server then
		if (not spawnedBlockade) then

			local userdata = {};
			TokenStateBasedObjectSwap(objectId, userdata, blockadeStateObjects);
			Shared.setUserdata(objectId, userdata);
		
			spawnedBlockade = true
		
		end
		
	end
	
end

function gd.quests.areaDQuestTrueThreat.blockadeAvatarOnAddToWorld(objectId)

	if Server then
		blockadeId = objectId
		
	end
	
end

gd.quests.areaDQuestTrueThreat.blockadeOnDestroy = ClearObjectUserdata
	
-- Detonation Site
local detonationSiteStateObjects = orderedTable();
	detonationSiteStateObjects["FORTIKON_BLOCKADECLEARED"]	= { state = BlockadeState.Destroyed,  dbr = nil }
	detonationSiteStateObjects[""] 								= { state = BlockadeState.Active, dbr = "records/creatures/npcs/questnpcs/interactiveobjects/npc_detonationsite_fortikon.dbr" }

function gd.quests.areaDQuestTrueThreat.detonationSiteOnAddToWorld(objectId)

	if Server then
		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, detonationSiteStateObjects);
		Shared.setUserdata(objectId, userdata);
		
	end
	
end

gd.quests.areaDQuestTrueThreat.detonationSiteOnDestroy = ClearObjectUserdata

-- Destroy Blockade
function gd.quests.areaDQuestTrueThreat.blockadeDestroyGlobalMP()

GiveTokenToLocalPlayer("FORTIKON_BLOCKADECLEARED")

end

function gd.quests.areaDQuestTrueThreat.blockadeDestroy()

	if Server then
		if blockadeId != 0 then
			local blockade = Destructible.Get(blockadeId)
			local coords = blockade:GetCoords()
			blockade:Destroy(Vec(0,1,0), 1000, false)
			blockadeId = 0
		
			local pfx = Entity.Create("records/fx/skillsother/attackradius/detonatemassive_fxpak01.dbr")
			if pfx != nil then
				pfx:NetworkEnable()
				pfx:SetCoords(coords)
				
			end
			
		end
	
		QuestGlobalEvent("detonationFortIkonToken")
	
	end
	
end

--
-- Retroactive credit for slaying Cultists for Cultist Activity
--
local cultistsSlain = 0

function gd.quests.areaDQuestTrueThreat.cultistKilledGlobalMP()

	GiveTokenToLocalPlayer("AREAD_CULTISTACTIVITY")

end

function gd.quests.areaDQuestTrueThreat.cultistKilled()
	local player = Game.GetLocalPlayer()
	
	cultistsSlain = cultistsSlain + 1
	
	if (cultistsSlain >= 5 && player:ServerHasToken("AREAD_CULTISTACTIVITY") == false) then
		QuestGlobalEvent("cultistActivityAllKilled")
	
	end

end



--
-- Fort Ikon Riftgate
-- Controls the unlocking of the Fort Ikon Riftgate
--
local fortRiftgate = nil
local fortWaveObjectId = 0
local fortWaveEventStarted = false
local fortWaveEventKey = "FORTIKON_RIFTGATEWAVEEVENT"

function gd.quests.areaDQuestTrueThreat.waveEventOnAddToWorld(objectId)

	if Server then
		fortWaveObjectId = objectId
		WaveEvent_OnAddToWorld(objectId, fortWaveEventKey)
	
	end

end

function gd.quests.areaDQuestTrueThreat.waveEventOnRemoveFromWorld(objectId)

	if Server then
		WaveEvent_OnRemoveFromWorld(objectId)
	
	end
	
end

-- end of riftgate event
local fortRiftgateEventEndedMP = false

function gd.quests.areaDQuestTrueThreat.endEventMP()
	
	if not fortRiftgateEventEndedMP then
		fortRiftgateEventEndedMP = true
		GiveTokenToLocalPlayer("FORTIKON_RIFTGATE_SECURED")

		if fortRiftgate != nil then
			fortRiftgate:SetLocked(false)
			
		end
		
	end
	
end

function gd.quests.areaDQuestTrueThreat.endWaveEvent(objectId)
	-- Give Token credit to all players and unlock the riftgate
	QuestGlobalEvent("fortIkonRiftgateEndEvent")
	
end

local waveParameters = { }
	waveParameters.waves = {"records/proxies/boss&quest/questproxy_aread_fortikonriftgate_wave1.dbr", "records/proxies/boss&quest/questproxy_aread_fortikonriftgate_wave2.dbr", "records/proxies/boss&quest/questproxy_aread_fortikonriftgate_wave3.dbr"}
	waveParameters.endCallback = gd.quests.areaDQuestTrueThreat.endWaveEvent
	waveParameters.key = fortWaveEventKey

function gd.quests.areaDQuestTrueThreat.startWaveEventMP()

	if Server then
		if (not fortWaveEventStarted) then
			fortWaveEventStarted = true
			WaveEvent_Start(fortWaveObjectId, waveParameters)
		
		end
		
	end

end
	
function gd.quests.areaDQuestTrueThreat.startWaveEvent(triggererId)

	local player = Player.Get(triggererId)
	
	if (player:HasToken("FORTIKON_RIFTGATE_SECURED") == false) then
		
		if (player:GetLevel() > 10) then
	
			if (player:HasToken("FORTIKON_RIFTGATEFOUND") == false) then
				GiveTokenIfPlayer(triggererId, "FORTIKON_RIFTGATEFOUND")
				UI.Notify("tagNotification_AreaD_FortIkonRiftgate")
			end
		
			QuestEvent("fortIkonRiftgateWaveEvent")
			
		end
	
	end
	

end

function gd.quests.areaDQuestTrueThreat.riftgateOnAddToWorld(objectId)

	-- This function is run locally on all clients to set the variable and unlock the gate. Riftgates are not spawned by the server
	local player = Game.GetLocalPlayer()
	fortRiftgate = Riftgate.Get(objectId)

	if player:HasToken("FORTIKON_RIFTGATE_SECURED") then
		fortRiftgate:SetLocked(false)
	
	end

end


--
-- Injured Soldier
--
local SoldierState = { Default = 0, Hidden = 1}

local injuredSoldierStateObjects = orderedTable();
	injuredSoldierStateObjects["FORTIKON_RIFTGATE_SECURED"]	= { state = SoldierState.Hidden,  dbr = nil }
	injuredSoldierStateObjects[""] 								= { state = SoldierState.Default, dbr = "records/creatures/npcs/flavornpcs/gdaread/npc_injuredsoldier_01.dbr" }

function gd.quests.areaDQuestTrueThreat.injuredSoldierOnAddToWorld(objectId)

	if Server then
		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, injuredSoldierStateObjects);
		Shared.setUserdata(objectId, userdata);
		
	end
	
end

gd.quests.areaDQuestTrueThreat.injuredSoldierOnDestroy = ClearObjectUserdata


