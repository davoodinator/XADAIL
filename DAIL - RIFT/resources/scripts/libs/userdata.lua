/*
	
	GRIM DAWN
	scripts/libs/userdata.lua
	
	For more information visit us at http://www.grimdawn.com
	
*/

Shared.userdata = {}
Shared.persistentUserdata = {}

-- Access userdata associated with an object id
function Shared.getUserdata(objectId)

	return Shared.userdata[objectId]

end

-- Associate userdata with an object id
function Shared.setUserdata(objectId, userdata)

	Shared.userdata[objectId] = userdata
	
end

-- Persist userdata
function Shared.persistUserdata(objectId, key)

	Shared.persistentUserdata[key] = Shared.userdata[objectId]
	Shared.userdata[objectId] = nil

end

-- Restore userdata
function Shared.restoreUserdata(objectId, key)

	Shared.userdata[objectId] = Shared.persistentUserdata[key]
	Shared.persistentUserdata[key] = nil
	
end