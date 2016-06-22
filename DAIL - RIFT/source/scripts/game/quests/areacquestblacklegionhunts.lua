/*
	
	GRIM DAWN
	
	For more information, visit us at http://www.grimdawn.com
	
*/

gd.quests.areaCQuestBlackLegionHunts = {}

function gd.quests.areaCQuestBlackLegionHunts.manticoreKilled()

	GiveTokenToLocalPlayer("AREAC_PRIDEJAGGEDWASTE_KILLED")
	
end

function gd.quests.areaCQuestBlackLegionHunts.thornedHorrorKilled()

	GiveTokenToLocalPlayer("AREAC_HUNTINGTHEHUNTER_KILLED")
	
end

function gd.quests.areaCQuestBlackLegionHunts.spiderKilled()

	GiveTokenToLocalPlayer("AREAC_GLOOMWEAVER_KILLED")
	
end

-- Tyrant's Hold
local bossDoor01Id = 0

function gd.quests.areaCQuestBlackLegionHunts.dranghoulKilled()

	GiveTokenToLocalPlayer("AREAC_GROBLETYRANT_KILLED")
	
	-- spawn faction emissaries in Homestead
	if Server then		
		-- Reopen doors to boss area
		local door01 = Door.Get(bossDoor01Id)
	
		if door01 != nil then
			door01:Open()
		end
		
	end
	
end


-- Boss Door
function gd.quests.areaCQuestBlackLegionHunts.bossDoor01OnAddToWorld(objectId)
	
	if Server then
		bossDoor01Id = objectId
		
	end
	
end