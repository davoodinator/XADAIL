/*
	
	GRIM DAWN	
	scripts/game/questhelper.lua
	
	For more information, visit us at http://www.grimdawn.com
	
*/

--
-- Multiplayer quest helpers
--

function QuestEvent(event)

	MpScript.QuestEvent(event)
	
end

function QuestGlobalEvent(event)

	MpScript.QuestGlobalEvent(event)
	
end

function QuestEventDispatch(event)

	print(event);

	if (clientQuestTable[event] ~= nil) then
		clientQuestTable[event]();
	end
	
	if Server and (serverQuestTable[event] ~= nil) then
		serverQuestTable[event]();		
	end
	
end

--
-- Userdata helpers
--

function ClearObjectUserdata(objectId)

	Shared.setUserdata(objectId, nil)
	
end

--
-- Token helpers
--

-- Give a token to an object if it's a Player
function GiveTokenIfPlayer(id, token)

	local player = Player.Get(id)
	
	if (player ~= nil) then
		player:GiveToken(token)
	end
	
	return player
	
end

-- Give a token to the local Player
function GiveTokenToLocalPlayer(token)

	local player = Game.GetLocalPlayer()
	
	if (player != nil) then
		player:GiveToken(token)
	end
	
	return player
	
end

-- Remove a token from the local Player
function RemoveTokenFromLocalPlayer(token)

	local player = Game.GetLocalPlayer()
	
	if (player != nil) then
		player:RemoveToken(token)
	end
	
	return player
	
end

--
-- Simple token/state based object swap for use with ScriptEntity
--
-- 'id' is the id of the script entity
-- 'userdata' is a table containing the current state and object
-- 'states' is an ordered table containing a mapping of tokens (in order of precedence) to state/dbr pairs
-- 'class' is the class used to create the entity
-- 'argsfn' is a function used to pass extra arguments to the class create method
-- 'MPOverrideState' boolean determining whether the MPOVerrideDbr should be used. If true, the override is used instead of the host's current token state.
-- 'MPOverrideDbr' is a Dbr override used in the case that a client is on a quest the host is not that requires an entity state change (such as an NPC going hostile)
-- for example...
-- states =
-- {
-- 		["QUEST_COMPLETE_TOKEN"]     = { state = State.Complete,     dbr = "objects/final/state/dbr" },
--		["INTERMEDIATE_STAGE_TOKEN"] = { state = State.Intermediate, dbr = "objects/intermediate/state/dbr" }
--	    [""]						 = { state = State.Initial,	     dbr = "objects/initial/state/dbr" }
-- }
--
-- Returns 2 values
-- 1) 'didWork' (boolean) - True if a swap occurred based on changes in tokens.
-- 2) 'newState' - The new state of the object is a swap occurred, or the current state if one didn't.
--

function TokenStateBasedObjectSwap(id, userdata, states, cls, argsfn, MPOverrideState, MPOverrideDbr)

	local player    = Game.GetLocalPlayer()
	
	local didWork	= false
	local newState  = userdata.state
	local objectDBR = nil
	
	local objectClass = cls or Entity
	
	if (player ~= nil) then
	
		-- Determine desired state based on local player tokens
		for token, data in states:opairs() do
			
			if ((token == "") or (player:HasToken(token))) then
				newState = data.state
				objectDBR = data.dbr
				break
			end

		end
		
		-- Check if state needs to change
		if (newState ~= userdata.state || MPOverrideState == true) then

			userdata.state = newState
			
			local coords;
			
			-- Destroy previous object
			if (userdata.object ~= nil) then
			
				-- Use coords of previous object for new object
				coords = userdata.object:GetCoords()
				
				userdata.object:Destroy()
				userdata.object = nil
			
			else
			
				-- Use coords of calling object for new object
				coords = Entity.Get(id):GetCoords()
				
			end
			
			if (MPOverrideState == true) then
				objectDBR = MPOverrideDbr
			end
			
			-- Create new object
			if (objectDBR ~= nil) then
			
				if (argsfn == nil) then
					userdata.object = objectClass.Create(objectDBR)
				else
					userdata.object = objectClass.Create(objectDBR, argsfn())
				end
				
				userdata.object:SetCoords(coords)
				
			end
			
			didWork = true
			
		end
	
	end
	
	return didWork, newState

end

--
-- Cache objects used in a token/state based object swap table
--

function TokenStateBasedObjectCache(states)

	for token, data in states:opairs() do
		Object.Cache(data.dbr);
	end

end

function TokenStateBasedObjectRelease(states)

	for token, data in states:opairs() do
		Object.Release(data.dbr);
	end

end

--
-- Force an update of a previously setup token based object swap
--

function UpdateObjectSwap(id, states, cls, argsfn, MPOverrideState, MPOverrideDbr)

	local userdata = Shared.getUserdata(id)
	
	return TokenStateBasedObjectSwap(id, userdata, states, cls, argsfn, MPOverrideState, MPOverrideDbr)

end