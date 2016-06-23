--[[
onDie Events for Enemies
]]--
--
local function giveSoul(argEnemyClassId)
    local chances = {33,66,100} -- TODO: add it to settings
    local randDropChance = wanez.RNG({},chances[wanez.DifficultyID])
    if(wanez.RNG({},chances[wanez.DifficultyID]))then
        local DBR = wanez.dga._Data.Items.Souls[1][wanez.DifficultyID][argEnemyClassId][1]
        Game.GetLocalPlayer():GiveItem(DBR,1,false)
    end
end
-- 
local function genericOnDie(enemyClassID,argObjectId)
    local callGenLoot = {true,true,true,false,true,true}
    local callSpecial = {true,true,true,true,true,true}
    local callGiveSoul = {false,true,true,false,true,true}
    if(callGenLoot[enemyClassID])then
        wanez.dga.Data.Entities[enemyClassID]:genLoot(argObjectId)
    end
    if(callSpecial[enemyClassID])then
        wanez.dga.Data.Rewards:giveCredit("onDie",enemyClassID,argObjectId)
    end
    if(callGiveSoul[enemyClassID])then
        giveSoul(enemyClassID)
    end
end
--
function wanez.dga.dieCommon(argObjectId)
	local enemyClassID = 1
    genericOnDie(enemyClassID,argObjectId)
	--wanez.dga.Data.Entities[enemyClassID]:genLoot(argObjectId)
    --giveSoul(enemyClassID)
	--fnSpecialCredit(enemyClassID,argObjectId)
end
--
function wanez.dga.dieChampion(argObjectId)
	local enemyClassID = 2
    genericOnDie(enemyClassID,argObjectId)
	--wanez.dga.Data.Entities[enemyClassID]:genLoot(argObjectId)
    --giveSoul(enemyClassID)
	--fnSpecialCredit(enemyClassID,argObjectId)
end
--
function wanez.dga.dieHero(argObjectId)
	local enemyClassID = 3
    genericOnDie(enemyClassID,argObjectId)
	--wanez.dga.Data.Entities[enemyClassID]:genLoot(argObjectId)
    --giveSoul(enemyClassID)
	--fnSpecialCredit(enemyClassID,argObjectId)
end
--
function wanez.dga.dieBoss(argObjectId)
	local enemyClassID = 5
    genericOnDie(enemyClassID,argObjectId)
	--wanezCompleteQuestTask("Repeatable",1)
	--wanez.dga.Data.Entities[enemyClassID]:genLoot(argObjectId)
    --giveSoul(enemyClassID)
	--fnSpecialCredit(enemyClassID,argObjectId)
    --[[
	if(dgaSettings.SpecialID == 1)then
		--removeEntities()
		dgaSettings.BlockRespawn = true
		local calcChance = waDGAUberComponents[1][2] * (dgaSettings.Tier + 1)
		math.randomseed(Time.Now())
		local randUberChance = random(1,100)
		if(randUberChance <= calcChance)then
			local enemyLoc = Character.Get(argObjectId):GetCoords()
			local newItem = Entity.Create(waDGAUberComponents[1][1])
			newItem:SetCoords(enemyLoc)
		end
		dgaSettings.SpecialCredit = 0
		UI.Notify("tagWaSpecialBossDeafeated")
	end
    ]]--
end
--
function wanez.dga.dieNemesis(argObjectId)
	local enemyClassID = 6
    genericOnDie(enemyClassID,argObjectId)
	--wanez.dga.Data.Entities[enemyClassID]:genLoot(argObjectId)
    --giveSoul(enemyClassID)
	--fnSpecialCredit(enemyClassID,argObjectId)
	--wanezCompleteQuestTask(1)
end