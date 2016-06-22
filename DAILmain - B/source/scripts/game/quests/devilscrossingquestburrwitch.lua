/*
	
	GRIM DAWN
	
	For more information, visit us at http://www.grimdawn.com
	
*/

gd.quests.devilsCrossingQuestBurrwitch = {}

local waveDbr = {"records/proxies/boss&quest/questproxy_waveevent_burrwitchrift_wave01.dbr", "records/proxies/boss&quest/questproxy_waveevent_burrwitchrift_wave02.dbr", "records/proxies/boss&quest/questproxy_waveevent_burrwitchrift_wave03.dbr"}

local currentWave = 0
local waveProxy = nil

local levelLimitLocation = nil
local coords = nil
local waveEventStarted = false
local waveEventEnded = false
local burrwitchRiftgate = nil
local heroKilled = false


local function CreateProxyArgs()

	return levelLimitLocation
	
end

local function spawnWave()
	currentWave = currentWave + 1
	
	if (waveDbr[currentWave] != nil) then
		waveProxy = Proxy.Create(waveDbr[currentWave], CreateProxyArgs())
		waveProxy:SetCoords(coords)
		
	end
	
end


-- End the Burrwith Event
local burrwitchEventEndedMP = false

function gd.quests.devilsCrossingQuestBurrwitch.endEventMP()
	
	if not burrwitchEventEndedMP then
		burrwitchEventEndedMP = true
		GiveTokenToLocalPlayer("BURRWITCH_PORTAL_CLEARED")
		GiveTokenToLocalPlayer("BURRWITCH_PORTAL_FOUND")
		
		Script.Event("EV_BURRWITCH");
		
		if burrwitchRiftgate != nil then
			burrwitchRiftgate:SetLocked(false)
			
		end
		
	end
	
end

local function endEvent()
	waveEventEnded = true

	-- Give Token credit to all players and unlock the gate
	QuestGlobalEvent("burrwitchRiftEndEvent")

end

function gd.quests.devilsCrossingQuestBurrwitch.heroKilled()
	
	if Server then
		heroKilled = true
		
	end

end

function gd.quests.devilsCrossingQuestBurrwitch.waveEventOnAddToWorld(objectId)
	
	if Server then
		local entity = Entity.Get(objectId)
		coords = entity:GetCoords()

		Shared.setUserdata(objectId, userdata)

	
		if (entity != nil) then
			levelLimitLocation = coords.origin
		end

		Script.RegisterForUpdate(objectId, "gd.quests.devilsCrossingQuestBurrwitch.updateStatus", 1000)
		
	end

end

function gd.quests.devilsCrossingQuestBurrwitch.waveEventOnRemoveFromWorld(objectId)

	if Server then
	
		Shared.setUserdata(objectId, nil)
		Script.UnregisterForUpdate(objectId, "gd.quests.devilsCrossingQuestBurrwitch.updateStatus")

	end
	
end


function gd.quests.devilsCrossingQuestBurrwitch.startEvent()

	if Server then
		if (waveEventStarted == false) then
			waveEventStarted = true
			spawnWave()
			
		end
		
	end

end

function gd.quests.devilsCrossingQuestBurrwitch.triggerEvent(triggererId)

	local player = Player.Get(triggererId)
	local questId = 0x70691B80
	local taskId = 0x59EB8E00
	local taskId2 = 0x140EB160
	
	local questTaskState = player:GetQuestTaskState(questId, taskId)
	local questTaskState2 = player:GetQuestTaskState(questId, taskId2)

	if (player:HasToken("BURRWITCH_PORTAL_CLEARED") == false) then
		
		if (player:GetLevel() > 7 || questTaskState == QuestState.InProgress || questTaskState2 == QuestState.InProgress) then
	
			if (player:HasToken("BURRWITCH_PORTAL_FOUND") == false) then
				GiveTokenIfPlayer(triggererId, "BURRWITCH_PORTAL_FOUND")
				UI.Notify("tagNotification_BurrwitchRiftgateEvent")
			end
		
			QuestEvent("burrwitchRiftStartEvent")
			
		end
	
	end
		
end


function gd.quests.devilsCrossingQuestBurrwitch.updateStatus()
	if Server then
	
		if (not waveEventEnded) then
			local totalWaves = table.getn(waveDbr)
			if waveProxy != nil && waveProxy:AllKilled() == true then
				if currentWave < totalWaves then
					spawnWave()
					
				else
					if (heroKilled == true) then
						endEvent()
			
					end
			
				end
				
			end
			
		end
	
	end
	
end



--
-- Burrwitch portal
-- Controls the unlocking of the Burrwitch Village Riftgate

function gd.quests.devilsCrossingQuestBurrwitch.burrwitchRiftgateOnAddToWorld(objectId)

	-- This function is run locally on all clients to set the variable and unlock the gate. Riftgates are not spawned by the server
	local player = Game.GetLocalPlayer()
	burrwitchRiftgate = Riftgate.Get(objectId)

	if player:HasToken("BURRWITCH_PORTAL_CLEARED") then
		burrwitchRiftgate:SetLocked(false)
	
	end

end


--
-- Flooded passage golem barrier
--
-- A destructable barrier blocks progress until the golem is killed at which point is is destroyed.
--

local rockwallId = 0

function gd.quests.devilsCrossingQuestBurrwitch.rockwallOnAddToWorld(objectId)
	
	if Server then
		rockwallId = objectId
		
	end
	
end

function gd.quests.devilsCrossingQuestBurrwitch.golemKilled()

	if Server then
		if (rockwallId != 0) then
	
			rockwall = Destructible.Get(rockwallId)
		
			rockwall:Destroy(Vec(0, 1, 0), 500, false)
			rockwallId = 0
			
		end
		
	end
	
end