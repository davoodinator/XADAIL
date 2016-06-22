/*
	
	GRIM DAWN
	scripts/quests/devilscrossing.lua
	
	For more information, visit us at http://www.grimdawn.com
	
*/

gd.quests.devilsCrossingWightmireRiftgate = {}

--
-- Wightmire Riftgate
-- Controls the unlocking of the Wightmire Riftgate
--
local wightmireRiftgate = nil
local wightmireWaveObjectId = 0
local wightmireWaveEventStarted = false
local wightmireWaveEventKey = "WIGHTMIRE_RIFTGATEWAVEEVENT"

function gd.quests.devilsCrossingWightmireRiftgate.waveEventOnAddToWorld(objectId)

	if Server then
		wightmireWaveObjectId = objectId
		WaveEvent_OnAddToWorld(objectId, wightmireWaveEventKey)
	
	end

end

function gd.quests.devilsCrossingWightmireRiftgate.waveEventOnRemoveFromWorld(objectId)

	if Server then
		WaveEvent_OnRemoveFromWorld(objectId)
	
	end
	
end

-- end of riftgate event
local wightmireRiftgateEventEndedMP = false

function gd.quests.devilsCrossingWightmireRiftgate.endEventMP()
	
	if not wightmireRiftgateEventEndedMP then
		wightmireRiftgateEventEndedMP = true
		GiveTokenToLocalPlayer("WIGHTMIRE_RIFTGATE_SECURED")

		if wightmireRiftgate != nil then
			wightmireRiftgate:SetLocked(false)
			
		end
		
	end
	
end

function gd.quests.devilsCrossingWightmireRiftgate.endWaveEvent(objectId)
	-- Give Token credit to all players and unlock the riftgate
	QuestGlobalEvent("wightmireRiftgateEndEvent")
	
end

local waveParameters = { }
	waveParameters.waves = {"records/proxies/boss&quest/proxy_wightmireriftgate_wave1.dbr", "records/proxies/boss&quest/proxy_wightmireriftgate_wave2.dbr", "records/proxies/boss&quest/proxy_wightmireriftgate_wave3.dbr"}
	waveParameters.endCallback = gd.quests.devilsCrossingWightmireRiftgate.endWaveEvent
	waveParameters.key = wightmireWaveEventKey

function gd.quests.devilsCrossingWightmireRiftgate.startWaveEventMP()

	if Server then
		if (not wightmireWaveEventStarted) then
			wightmireWaveEventStarted = true
			WaveEvent_Start(wightmireWaveObjectId, waveParameters)
		
		end
		
	end

end
	
function gd.quests.devilsCrossingWightmireRiftgate.startWaveEvent(triggererId)

	local player = Player.Get(triggererId)
	
	if (player:HasToken("WIGHTMIRE_RIFTGATE_SECURED") == false) then
		
		if (player:GetLevel() > 2) then
	
			if (player:HasToken("WIGHTMIRE_RIFTGATEFOUND") == false) then
				GiveTokenIfPlayer(triggererId, "WIGHTMIRE_RIFTGATEFOUND")
				UI.Notify("tagNotification_WightmireRiftgate")
			end
		
			QuestEvent("wightmireRiftgateWaveEvent")
			
		end
	
	end
	

end

function gd.quests.devilsCrossingWightmireRiftgate.riftgateOnAddToWorld(objectId)

	-- This function is run locally on all clients to set the variable and unlock the gate. Riftgates are not spawned by the server
	local player = Game.GetLocalPlayer()
	wightmireRiftgate = Riftgate.Get(objectId)

	if player:HasToken("WIGHTMIRE_RIFTGATE_SECURED") then
		wightmireRiftgate:SetLocked(false)
	
	end

end
