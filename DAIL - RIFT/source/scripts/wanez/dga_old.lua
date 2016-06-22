/**
 * 
 *
 * @author WareBare
 * @version v0.2.0
 * 
 * Updated: 05/26/2016
 */

local hideoutData = {}
local portals = {}




-- Hideout Floor to get DGA-Portal Coords
function wanez.dga.showPortalEnterOnAddToWorld(objectId)
	if(hideoutData["PortalLoc"] == nil)then
		hideoutData["PortalLoc"] = 0
	end
	hideoutData["PortalLoc"] = Entity.Get(objectId):GetCoords()

	--difMul = getDifficulty()
	--poolSize = table.getn(monsterPackPools)
	UI.Notify("tagWaWelcomeDGA")
end
