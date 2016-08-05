--[[
onDie Events for Enemies
]]--
--
local function giveSoul(argEnemyClassId)
    local chances = { -- TODO: add it to settings
        {3,6,15}, -- 1: Common
        {3,6,15},-- 2: Champion
        {10,20,50},-- 3: Hero
        {5,10,25},-- 4: MiniBoss
        {33,66,100},-- 5: Boss
        {33,66,100},-- 6: Nemesis
        {5,10,20},-- 7: RaidBoss
        {5,10,50},-- 8: Souleater
        {33,66,100},-- 9: AetherCrystal
        {33,66,100}-- 10: AetherObelisk
        --10,25,75
    }
    local chanceMultiplier = (wanez.dga.Settings:getTier() > 0) and wanez.dga.Settings:getTier() / 10 or 0
    local curChance = chances[argEnemyClassId][wanez.DifficultyID] + chanceMultiplier * chances[argEnemyClassId][wanez.DifficultyID]
    local itemCount = wanez.dga.Data.Rewards:mathDupeChance(curChance)
    if(itemCount > 0)then
        local DBR = wanez.dga._Data.Items.Souls[1][wanez.DifficultyID][argEnemyClassId][1]
        Game.GetLocalPlayer():GiveItem(DBR,itemCount,false)
    end
end
--
local function genericOnDie(enemyClassID,argObjectId)
    --UI.Notify("01")
    local callGenLoot = {true,true,true,true,true,true,true,false,false,false}
    local callSpecial = {true,true,true,true,true,true,true,true,false,false}
    local callGiveSoul = {true,true,true,true,true,true,true,true,true,false}
    local callSummonContainer = {false,false,false,true,true,true,true,true,false,false}
    local callGiveBountyPM = {false,false,true,true,false,true,false,false,false,false}
    --UI.Notify("02")
    if(callGenLoot[enemyClassID])then
        wanez.dga.Data.Entities[enemyClassID]:genLoot(argObjectId)
    end
    if(callSpecial[enemyClassID])then
        wanez.dga.Data.Rewards:giveCredit("onDie",enemyClassID,argObjectId)
    end
    if(callGiveSoul[enemyClassID])then
        giveSoul(enemyClassID)
    end
    if(callSummonContainer[enemyClassID])then
        wanez.dga.Areas[dgaAreaType]:onDieSpawnContainer(enemyClassID,argObjectId)
    end
    if(callGiveBountyPM[enemyClassID])then
        --bountyGiveTokenPM(enemyClassID)
        wanez.dga.bounties.giveTokenPM(enemyClassID)
    end
    --UI.Notify("03")
    wanez.dga.Data.Rewards:addKill()
    --UI.Notify("04")
end
--
function wanez.dga.dieCommon(argObjectId)
	local enemyClassID = 1
    genericOnDie(enemyClassID,argObjectId)
end
--
function wanez.dga.dieChampion(argObjectId)
	local enemyClassID = 2
    genericOnDie(enemyClassID,argObjectId)
end
--
function wanez.dga.dieHero(argObjectId)
	local enemyClassID = 3
    genericOnDie(enemyClassID,argObjectId)

    -- OMEGA MOD
    if(wanez.RNG({1,100},25) and wanez.DifficultyID == 3)then
       omega.scripts.spawnomegaboss();
    end
end
--
function wanez.dga.dieMiniBoss(argObjectId)
	local enemyClassID = 4
    genericOnDie(enemyClassID,argObjectId)
    --local player = Game.GetLocalPlayer()
    --if(player:HasToken("BOUNTY_TASK_PM_01"))then player:RemoveToken("BOUNTY_TASK_PM_01");end;
    --genericOnDie(enemyClassID,argObjectId)

    -- OMEGA MOD
    if(wanez.DifficultyID == 3)then
        omega.scripts.spawnomegaboss();
    end
end
--
function wanez.dga.dieBoss(argObjectId)
	local enemyClassID = 5
    genericOnDie(enemyClassID,argObjectId)

    -- Endless
    if(wanez.dga.Areas[dgaAreaType]:getAreaTypeID() == 2 and wanez.dga.Settings:getAreaID() ~= 101 and wanez.dga.Settings:getAreaID() ~= 102)then
        local scrollDBR = 'mod_wanez/items/dga/scroll_portal_dga01.dbr'
        local _player = Game.GetLocalPlayer()
        if not(_player:HasItem(scrollDBR,1,true))then
            _player:GiveItem(scrollDBR,1,true)
        end
    end
end
--
function wanez.dga.dieNemesis(argObjectId)
	local enemyClassID = 6
    genericOnDie(enemyClassID,argObjectId)
end
--
function wanez.dga.dieRaidBoss(argObjectId)
    local enemyClassID = 7
    genericOnDie(enemyClassID,argObjectId)
end
--
function wanez.dga.dieSouleater(argObjectId)
    local enemyClassID = 8
    genericOnDie(enemyClassID,argObjectId)
end
--
function wanez.dga.dieAetherCrystal(argObjectId)
    --UI.Notify("aether died")
    local enemyClassID = 9
    genericOnDie(enemyClassID,argObjectId)
    --
    local enemyLoc = Character.Get(argObjectId):GetCoords()

    local baseDropChance = {40,60,85}
    if(wanez.RNG({1,100},baseDropChance[wanez.DifficultyID]))then
        wanez.dga.Data.Entities[9]:dropLoot(wanez.dga._Data.Items.Global.Aether[1][wanez.DifficultyID][1][1],1,enemyLoc)
    end

    -- create New Monsters
    local playerLoc = Game.GetLocalPlayer():GetCoords()
    local baseSpawnChance = {33,66,100}
    if(wanez.RNG({1,100},baseSpawnChance[wanez.DifficultyID]))then
        wanez.dga.Areas[dgaAreaType]:createEntity(wanez._Data.OnDie.AetherialCrystal.Hero[wanez.RNG({1,table.getn(wanez._Data.OnDie.AetherialCrystal.Hero)})],enemyLoc,wanez.dga.Areas[dgaAreaType]:getEnemyLevel(wanez._Settings.Enemies.LevelOffset[wanez.data.Enemies.Classification[3]]));
        wanez.dga.Areas[dgaAreaType]:createEntity(wanez._Data.OnDie.AetherialCrystal.Hero[wanez.RNG({1,table.getn(wanez._Data.OnDie.AetherialCrystal.Hero)})],playerLoc,wanez.dga.Areas[dgaAreaType]:getEnemyLevel(wanez._Settings.Enemies.LevelOffset[wanez.data.Enemies.Classification[3]]));
    end
end