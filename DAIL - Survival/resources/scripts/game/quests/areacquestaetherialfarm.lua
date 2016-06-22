/*
	
	GRIM DAWN
	
	For more information, visit us at http://www.grimdawn.com
	
*/

gd.quests.areaCQuestAetherialFarm = {}


local barnDoorId = 0
local bossId = 0
local bossDoorId = 0
local spawnedBoss = false

function gd.quests.areaCQuestAetherialFarm.abominationKilled()

	GiveTokenToLocalPlayer("AREAC_AETHERIALABOMINATION_KILLED")
	
	-- spawn faction emissaries in Homestead
	if Server then		
		-- Reopen door to boss area
		local door = Door.Get(bossDoorId)
	
		if door != nil then
			door:Open()
		end
		
		-- spawn faction emissaries in Homestead
		gd.quests.areaCFactionSelection.spawnFactionSelection()
	
	end
	
end

local function CharacterCreateArgs()

	local averageLevel = Game.GetAveragePlayerLevel()
	local monsterLevel = 0
	local maxLevel = 0
	local originPoint = Entity.Get(bossId):GetCoords().origin

	--Grimmest changes 44;70;200 to 50;75;200
	if (Game.GetGameDifficulty() == Game.Difficulty.Normal) then
		maxLevel = 50
	elseif (Game.GetGameDifficulty() == Game.Difficulty.Epic) then
		maxLevel = 75
	else
		maxLevel = 200
	end
	
	if (averageLevel > maxLevel) then
		monsterLevel = ((maxLevel+(maxLevel/50))+3)
	else
		monsterLevel = ((averageLevel+(averageLevel/50))+3)

	end
	
	if monsterLevel > maxLevel then
		originPoint = nil
	
	end
	
	-- Grimmest
	originPoint = nil

	return monsterLevel, originPoint
	
end

function gd.quests.areaCQuestAetherialFarm.bossOnAddToWorld(objectId)
	
	if Server then
		bossId = objectId
	
	end
	
end

gd.quests.areaCQuestAetherialFarm.bossOnDestroy = ClearObjectUserdata


function gd.quests.areaCQuestAetherialFarm.barnDoorOnAddToWorld(objectId)
	
	if Server then
		barnDoorId = objectId
		
	end
	
end

function gd.quests.areaCQuestAetherialFarm.destroyDoor()

	if Server then
		if (barnDoorId != 0) then
	
			door = Destructible.Get(barnDoorId)
		
			door:Destroy(Vec(1, 0, 0), 12, false)
			barnDoorId = 0
			
		end
		
		if (not spawnedBoss) then
			spawnedBoss = true
			local coords = Entity.Get(bossId):GetCoords()
			local boss = Character.Create("records/creatures/enemies/boss&quest/aetherialabomination_01.dbr", CharacterCreateArgs())
			if boss != nil then
				boss:SetCoords(coords)
				
			end
		
		end
		
	end
	
end

function gd.quests.areaCQuestAetherialFarm.triggerBoss(triggererId)
	
	QuestEvent("aetherialFarmDestroyDoor")
	
end


-- Boss Door
function gd.quests.areaCQuestAetherialFarm.bossDoorOnAddToWorld(objectId)
	
	if Server then
		bossDoorId = objectId
		
	end
	
end
