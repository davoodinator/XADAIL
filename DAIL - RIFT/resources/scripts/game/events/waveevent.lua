/*
	
	GRIM DAWN
	scripts/main.lua
	
	Scripting entrypoint.
	
	For more information visit us at http://www.grimdawn.com
	
*/

--
-- Proxy based Wave Event!
--
-- 'objectId' is the id of the ScriptEntity responsible for the event
-- 'params' is a table containing the following values
--     'waves'          - an array of proxy dbrs to spawn
--     'token'          - token to give at the end of the event [optional]
--     'updateCallback' - function called on each wave update   [optional]
--     'endCallback'    - function call at the end of the event [optional]
--     'updatePeriod'   - time between updates in milliseconds  [optional, default=1000ms]
--		'key'				- the Unique Key string used to restore userdata in case the event is unloaded before it has concluded

-- Start a wave event
function WaveEvent_Start(objectId, params)

	local entity = Entity.Get(objectId)

	local userdata = Shared.getUserdata(objectid)
	
	if (userdata == nil) then
		userdata = {}
		Shared.setUserdata(objectId, userdata)
	end
	
	userdata.waveEvent = {}
	
	-- Setup waveEvent table in object userdata
	local waveEvent = userdata.waveEvent
	
	waveEvent.coords = entity:GetCoords()
	waveEvent.waveIndex = 0
	waveEvent.proxy = nil
	waveEvent.waves = params.waves
	waveEvent.numWaves = table.getn(params.waves)
	waveEvent.updateCallback = params.updateCallback or nil
	waveEvent.endCallback = params.endCallback or WaveEvent_DefaultEndCallback
	waveEvent.token = params.token or nil
	waveEvent.key = params.key
	waveEvent.updatePeriod = params.updatePeriod or 1000
	waveEvent.running = true
	
	-- Start receiving updates
	Script.RegisterForUpdate(objectId, "WaveEvent_Update", waveEvent.updatePeriod)
		
	-- Fire user start callback
	if (params.startCallback ~= nil) then
		params.startCallback(objectId)
	end
		
	-- Spawn first wave
	WaveEvent_SpawnNext(objectId)
		
end

-- Spawn the next wave of monsters
function WaveEvent_SpawnNext(objectId)

	local waveEvent = Shared.getUserdata(objectId).waveEvent
	
	-- Spawn next proxy
	waveEvent.waveIndex = waveEvent.waveIndex + 1
	waveEvent.proxy = Proxy.Create(waveEvent.waves[waveEvent.waveIndex], waveEvent.coords.origin)
	waveEvent.proxy:SetCoords(waveEvent.coords)
	
end

-- End the wave event
function WaveEvent_End(objectId)

	local waveEvent = Shared.getUserdata(objectId).waveEvent
	waveEvent.running = false

	-- Stop receiving updates
	Script.UnregisterForUpdate(objectId, "WaveEvent_Update")

	-- Fire user end callback
	if (waveEvent.endCallback ~= nil) then
		waveEvent.endCallback(objectId)
	end
end

-- Update the wave event
function WaveEvent_Update(objectId)

	local waveEvent = Shared.getUserdata(objectId).waveEvent
	
	-- Fire user update callback
	if (waveEvent.updateCallback ~= nil) then
		waveEvent.updateCallback(objectId)
	end
	
	-- Spawn next wave or end the event if the current wave has been killed
	if (waveEvent.proxy:AllKilled()) then
	
		if (waveEvent.waveIndex < waveEvent.numWaves) then
			WaveEvent_SpawnNext(objectId)
		else
			WaveEvent_End(objectId)
		end
	
	end
	
end

-- Default end callback, called when the wave event ends
function WaveEvent_DefaultEndCallback(objectId)

	local waveEvent = Shared.getUserdata(objectId).waveEvent
	
	-- Give end token if set
	if (waveEvent.token ~= nil) then
		GiveTokenToLocalPlayer(waveEvent.token)
	end

end

-- Used to restore userdata in case the event is unloaded partway through
function WaveEvent_OnAddToWorld(objectId, key)

	Shared.restoreUserdata(objectId, key)
	
	local userdata = Shared.getUserdata(objectId)
	
	if (userdata != nil) then
		if (userdata.waveEvent.running) then
			Script.RegisterForUpdate(objectId, "WaveEvent_Update", userdata.waveEvent.updatePeriod)
			
		end
		
	end
	
end

function WaveEvent_OnRemoveFromWorld(objectId)

	local userdata = Shared.getUserdata(objectId)

	if (userdata != nil) then
		
		if (userdata.waveEvent.running) then
			Script.UnregisterForUpdate(objectId, "WaveEvent_Update")
			Shared.persistUserdata(objectId, userdata.waveEvent.key)
			
		else
			Shared.setUserdata(objectId, nil)
			
		end
		
	end
	
end