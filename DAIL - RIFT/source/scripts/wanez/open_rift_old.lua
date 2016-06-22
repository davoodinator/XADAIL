/*
 * This Script makes a Rift available for the player to use, it will teleport the player to a map
 *  with newly created monsters and a boss at the end.
 *
 * TODO:
 * - Kill/Destroy Remaining monsters on leaving Map or opening a new one
 * - Prepare next Map Pool
 * - MapTier management
 * - More Dynamic for more features
 *
 *
 * Thanks to PrincessLuna for providing a solution to despawn monsters
 */

gd.map = {}

local hideCoords = 0
local showCoords = 0
local playerSpawn = 0


-- Location Matrix (Positioning inside .map, does not spawn or create monsters)
local spawnsMatrixExtension = {["Locations"]={},["Counts"]=1}
local spawns = {
	["0100"]={["Locations"]={},["Counts"]=0},
	["0101"]={["Locations"]={},["Counts"]=0},
	["0200"]={["Locations"]={},["Counts"]=0},
	["0201"]={["Locations"]={},["Counts"]=0}
}
-- Creation Matrix (Proxy Creation to actually spawn monsters)
local mapProxies = {}
local proxyRatio = {true,true} -- random spawn: true; inhabitant spawn: false

local door01 = 0
local doors = {
	["01"]={},
	["02"]={}
}

local bossCount = 1
local bossFileSuffix = {"","a","b","c","d","e","f","g"}

local mapTier = "00"
local mapArea = "00"

local killMatrix = {}
local dumpLoc = 0
local createdProxies = {
	["0101"] = {},
	["0201"] = {}
}

local monsterId = {
	["01"] = {["ID"]={},["Counter"]=0},
	["02"] = {["ID"]={},["Counter"]=0},
	["0200"] = {["ID"]={},["Counter"]=0}
}
--local aProxyTypes = {
--	[1]={}
--}

-- LOCAL FN
local function setPortalData(objectId,portalIndex)
	doors[portalIndex]["ID"] = objectId
	doors[portalIndex]["Loc"]= Door.Get(objectId):GetCoords()
end
local function portalHide(objectId,portalIndex)
	if Server then
		local door = Door.Get(objectId)
		door:SetLocked(true)
		door:SetCoords(doors[portalIndex]["Loc"])
	end
end
local function portalShow(portalIndex)
	local door = Door.Get(doors[portalIndex]["ID"])
	door:SetLocked(false)
	
	door:SetCoords(showCoords)
end

local function CharacterCreateArgs()

	local averageLevel = Game.GetAveragePlayerLevel()
	local monsterLevel = 0
	local maxLevel = 0

	if (Game.GetGameDifficulty() == Game.Difficulty.Normal) then
		maxLevel = 60
	elseif (Game.GetGameDifficulty() == Game.Difficulty.Epic) then
		maxLevel = 75
	else
		maxLevel = 200
	end
	
	if (averageLevel > maxLevel) then
		monsterLevel = ((maxLevel+(maxLevel/50))+2)
	else
		monsterLevel = ((averageLevel+(averageLevel/50))+3)

	end
	monsterLevel = averageLevel + 10
	return monsterLevel, nil
	
end
local function createMonster(fileName)
	local newProxy = Proxy.Create("mod_wanez/proxies/map/script/".. fileName ..".dbr")
	--local newProxy = Character.Create("mod_wanez/creatures/enemies/zombie_a01.dbr",CharacterCreateArgs())
	return newProxy
end

local function levelUpMonster(objectId)
	local monsterInstance = Character.Get(objectId)

	--monsterInstance:Destroy()

	return monsterInstance
end
function gd.map.regMonster(objectId)
	local indexPacks = mapArea
	monsterId[indexPacks]["Counter"] = monsterId[indexPacks]["Counter"]+1
	monsterId[indexPacks]["ID"][monsterId[indexPacks]["Counter"]] = Character.Get(objectId)
end

-- GLOBAL FN
function gd.map.showOnAddToWorld(objectId)
	local visibleObj = Entity.Get(objectId)
	showCoords = visibleObj:GetCoords()
	--playerSpawn = Game.GetLocalPlayer():GetCoords()
end

function gd.map.setTier(argTier)
	mapTier = argTier
end

function gd.map.setArea(argArea)
	mapArea = argArea
	portalShow(mapArea)
end

function gd.map.destroyMonster()
	local indexPacks = mapArea
	for i=1,monsterId[indexPacks]["Counter"]
	do
		monsterId[indexPacks]["ID"][i]:Destroy()
		--monsterId[indexPacks]["ID"][i]:GiveLevels(9)
	end
	monsterId[indexPacks]["ID"] = {}
	monsterId[indexPacks]["Counter"] = 0
end

-- gd.map.unlockDoor (onEnter)
function gd.map.spawnMonsters()
	if Server then
		gd.map.destroyMonster()
		--Game.GetLocalPlayer():GiveLevels(2)
		local totalRatio = table.getn(proxyRatio)

		local indexPacks = mapArea.."01"
		local indexBoss = mapArea.."00"

		-- PACKS (SPAWN)
		for i=1,spawns[indexPacks]["Counts"]
		do
			local randomizer = random(1,totalRatio)
			local boolProxy = proxyRatio[randomizer]
			local fileName = ""
			if (boolProxy == true) then
				fileName = "random"
			else
				fileName = "inh"..mapArea
			end
			--reatedProxies[indexPacks][i] = createMonster(fileName .."_".. mapTier)
			--createdProxies[indexPacks][i]:SetCoords(spawns[indexPacks]["Locations"][i])
			createMonster(fileName .."_".. mapTier):SetCoords(spawns[indexPacks]["Locations"][i])
		end
		
		-- BOSS (SPAWN)
		for i=1,spawns[indexBoss]["Counts"]
		do
			local fileName = "boss"..mapArea..bossFileSuffix[i]

			createMonster(fileName .."_".. mapTier):SetCoords(spawns[indexBoss]["Locations"][i])
		end
	end
end

-- function called inside every spawnXYOnAddToWorld(objectId)
function gd.map.setSpawn(objectId,mapIndex)
	if Server then
		spawns[mapIndex]["Locations"][spawns[mapIndex]["Counts"]] = Proxy.Get(objectId):GetCoords()
		spawns[mapIndex]["Counts"] = spawns[mapIndex]["Counts"] + 1
	end
end
local function setSpawns(objectId,proxyType)
	local spawnKey = mapArea..proxyType
	spawns[spawnKey]["Counts"] = spawns[spawnKey]["Counts"] + 1
	spawns[spawnKey]["Locations"][spawns[spawnKey]["Counts"]] = Proxy.Get(objectId):GetCoords()
end

function gd.map.portToHideout(objectId)
	Game.GetLocalPlayer():SetCoords(showCoords)
end
function gd.map.moveHomePoI(objectId)
	Object.Get(objectId):SetCoords(playerSpawn)
end
-- XX = MapArea; YY = SpawnType (00-Boss;01-Packs) !! Need to add entry to Location Matrix (spawns = {})
-- gd.map.spawnXXYYOnAddToWorld(objectId)
-- MAP 01
function gd.map.spawn0100OnAddToWorld(objectId)
	gd.map.setSpawn(objectId,"0100") -- Boss (MapArea 01)
end
function gd.map.spawn0101OnAddToWorld(objectId)
	gd.map.setSpawn(objectId,"0101") -- Pack (MapArea 01)
end
function gd.map.door01OnAddToWorld(objectId)
	setPortalData(objectId,"01") -- Portal (MapArea 01)
end
function gd.map.door01OnInteract(objectId)
	portalHide(objectId,"01")
end
-- MAP 02
function gd.map.spawn0200OnAddToWorld(objectId)
	gd.map.setSpawn(objectId,"0200") -- Boss (MapArea 02)
end
function gd.map.spawn0201OnAddToWorld(objectId)
	gd.map.setSpawn(objectId,"0201") -- Pack (MapArea 02)
end
function gd.map.door02OnAddToWorld(objectId)
	setPortalData(objectId,"02") -- Portal (MapArea 02)
end
function gd.map.door02OnInteract(objectId)
	portalHide(objectId,"02")
end

function gd.map.regBossOnAddToWorld(objectId)
	--gd.map.setSpawn(objectId,mapArea.."00") -- Boss (MapArea 01)
	setSpawns(objectId,"00")
end
function gd.map.regPacksOnAddToWorld(objectId)
	--gd.map.setSpawn(objectId,mapArea.."01") -- Boss (MapArea 01)
	setSpawns(objectId,"01")
end