--
-- Created by IntelliJ IDEA.
-- User: WareBare
-- Date: 7/13/2016
-- Time: 9:24 PM
-- To change this template use File | Settings | File Templates.
--


-- NPC
function wanez.dga.npcHasSpecial()
    return wanez.dga.Areas[dgaAreaType]:npcHasSpecial()
end
local function npcCheckConvID(argConvId)
    return wanez.dga.Areas[dgaAreaType]:npcHasConv(argConvId)
end
function wanez.dga.npcCheckConvID_001()
    return npcCheckConvID(1)
end
function wanez.dga.npcCheckConvID_002()
    return npcCheckConvID(2)
end
function wanez.dga.npcCheckConvID_003()
    return npcCheckConvID(3)
end
function wanez.dga.npcCheckConvID_004()
    return npcCheckConvID(4)
end
local _npcSoulEater = false
function wanez.dga.npcSetLocalVar001(argObjectId)
    --if(_npcSoulEater == false)then _npcSoulEater = Character.Get(argObjectId);end;
    _npcSoulEater = Character.Get(argObjectId)
    --UI.Notify("Triggered")
end
local function randNpcDespawn()
    _npcSoulEater:Destroy()
    _npcSoulEater = false
end
function wanez.dga.npcDespawn(argChance)
    randNpcDespawn()
end
function wanez.dga.npcSpawnSouleater(argIsEater)

    argIsEater = argIsEater or false
    local isSpawn = argIsEater or wanez.RNG({},20)
    local spawnTableId = argIsEater and 2 or 1
    local spawnTable = wanez._Data.Enemies.Souleater[spawnTableId]
    -- createEntity = function(self,argDBR,argLoc,argEnemyLevel)
    if(isSpawn)then
        local _npc = Game.GetLocalPlayer()
        local randEnemy = wanez.RNG({1,table.getn(spawnTable)})-- wanez._Settings.Enemies.LevelOffset['SoulEater']
        wanez.dga.Areas[dgaAreaType]:createEntity(spawnTable[randEnemy],_npc:GetCoords(),wanez.dga.Areas[dgaAreaType].EnemyLevels["SoulEater"])
    end
    randNpcDespawn()
    --wanez._Data.Enemies.Souleater
end