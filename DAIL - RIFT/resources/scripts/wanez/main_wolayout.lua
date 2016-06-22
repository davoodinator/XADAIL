/**
 * TODO:
 * - Special Dungeon Support (Multiple Bosses)
 * - Endless Dungeon Support
 * - Chests/Breakables
 *
 *
 * Thanks to PrincessLuna for providing a solution to despawn monsters
 * 
 *
 * @author: WareBare
 * @version: 0.0.1
 * 
 * Updated: 05/19/2016 
 */

gd.map = {}
Script.Load("scripts/wanez/pools.lua")
Script.Load("scripts/wanez/settings.lua")

local hideCoords = 0
local showCoords = 0

local poolSize = 0

-- Location Matrix (Positioning inside .map, does not spawn or create monsters)
local monsterLocations = {}
-- Creation Matrix (Proxy Creation to actually spawn monsters)
local proxyRatio = {true,true} -- random spawn: true; inhabitant spawn: false

local doors = {}

local bossCount = 1

local mapTier = 0
local mapId = 0
local dgaLayoutId = 0

local enableSpawnTrigger = false
local portalUses = 0

-- created monster are stored by area
local monsterStorage = {["Instance"]={},["Counter"]=0}
-- stored several special map data: starting locations, lock/unlock chests/doors, ...
local specialAreaData = {}
local aDGALayouts = {}


/**
 * calculate monster level
 * @param int monsterOffset
 * @return int monsterLevel, nil
 */
local function setMonsterLevel(monsterOffset)
	local monsterLevel = Game.GetAveragePlayerLevel() + mapTier + monsterOffset
	return monsterLevel, nil
end
local function prepMatrix_AreaData(argSubKey)
	if(specialAreaData[mapId] == nil) then
		specialAreaData[mapId] = {}
	end
	if(argSubKey ~= nil) then
		if(specialAreaData[mapId][argSubKey] == nil) then
			specialAreaData[mapId][argSubKey] = {}
		end
	end
end

local function saveMonster(objInstance)
	--if(monsterStorage == nil) then
		--monsterStorage = {["Instance"]={},["Counter"]=0}
	--end
	monsterStorage["Counter"] = monsterStorage["Counter"] + 1
	monsterStorage["Instance"][monsterStorage["Counter"]] = objInstance
/*
	if(monsterStorage[mapId] == nil) then
		monsterStorage[mapId] = {["Instance"]={},["Counter"]=0}
	end
	monsterStorage[mapId]["Counter"] = monsterStorage[mapId]["Counter"] + 1
	monsterStorage[mapId]["Instance"][monsterStorage[mapId]["Counter"]] = objInstance
*/
end

local function createMonster(argFile,argOffset,argCoords)
	local newMonster = Character.Create(argFile,setMonsterLevel(argOffset))
			
	newMonster:SetCoords(argCoords)
	saveMonster(newMonster)
end
-- create common, champion and hero monsters for pack proxies (using settings.lua)
local function createMonsterPack(proxyCoords)
	local randPool = random(1,poolSize)
	
	local championChance = 0
	if(Game.GetAveragePlayerLevel() >= waChampionMinPlayerLvl) then
		championChance = random(1,100)
	end

	if(championChance <= waChampionChance && championChance ~= 0) then
		-- CHAMPION (Magic Packs)
		local championTotal = table.getn(monsterPackPools[randPool]["Champion"])
		local randChampionCount = random(waChampionCount[1],waChampionCount[2])
		for i=1,randChampionCount
		do
			local randChampion = random(1,championTotal)
			
			createMonster(monsterPackPools[randPool]["Champion"][randChampion],waChampionLevelOffset,proxyCoords)
		end
	else
		-- COMMON
		local commonTotal = table.getn(monsterPackPools[randPool]["Common"])
		local randCommonCount = random(waCommonCount[1],waCommonCount[2])
		for i=1,randCommonCount
		do
			local randCommon = random(1,commonTotal)
			
			createMonster(monsterPackPools[randPool]["Common"][randCommon],waCommonLevelOffset,proxyCoords)
		end
		
		-- HERO
		if(Game.GetAveragePlayerLevel() >= waHeroMinPlayerLvl) then
			local heroTotal = table.getn(monsterPackPools[randPool]["Hero"])
			local randHeroCount = random(waHeroCount[1],waHeroCount[2])
			for i=1,randHeroCount
			do
				local rollHeroChance = random(1,100)
				if(rollHeroChance <= waHeroChance) then
					local randHero = random(1,heroTotal)
					
					createMonster(monsterPackPools[randPool]["Hero"][randHero],waHeroLevelOffset,proxyCoords)
				end
			end
		end
	end
	--return newProxy
end
-- TODO: multiple boss spawns
local function createMonsterBoss(proxyCoords)
	local bossId = 0
	if(useBossOnMap[mapId] ~= nil) then
		bossId = useBossOnMap[mapId][random(1,table.getn(useBossOnMap[mapId]))]
	else
		bossId = random(1,table.getn(monsterBossPools))
	end
	createMonster(monsterBossPools[bossId],waBossLevelOffset,proxyCoords)
end

-- remove remaining monster (called before new ones are created)
local function removeMonsters()
	if(monsterStorage["Counter"] > 0) then
		for i=1,monsterStorage["Counter"]
		do
			monsterStorage["Instance"][i]:Destroy()
		end
		monsterStorage["Instance"] = {}
		monsterStorage["Counter"] = 0
	end
/*
	if(monsterStorage[mapId] ~= nil) then
		for i=1,monsterStorage[mapId]["Counter"]
		do
			monsterStorage[mapId]["Instance"][i]:Destroy()
		end
		monsterStorage[mapId]["Instance"] = {}
		monsterStorage[mapId]["Counter"] = 0
	end
*/
end

-- fn call - onEnter Trigger
function gd.map.spawnMonsters()
	--if Server then
		if(enableSpawnTrigger == true) then
			
			enableSpawnTrigger = false
			-- set poolSize
			poolSize = table.getn(monsterPackPools)
			

			-- PACKS (SPAWN) [Common, Champion, Heroes]
			for i=1,monsterLocations[mapId]["Packs"]["Counter"]
			do
				-- TODO: Inherited Monster Spawns
				createMonsterPack(monsterLocations[mapId]["Packs"]["Loc"][i])
			end
			
			-- BOSS (SPAWN) TODO: multiple different bosses
			for i=1,monsterLocations[mapId]["Boss"]["Counter"]
			do
				createMonsterBoss(monsterLocations[mapId]["Boss"]["Loc"][i])
			end

		-- TODO: Special Encounters [Nemesis, ...]
		end
	--end
end

-- use proxies set with MapEditor to get monster spawn coords
local function setMonsterLocations(objectId,proxyType)
	
	monsterLocations[mapId][proxyType]["Counter"] = monsterLocations[mapId][proxyType]["Counter"] + 1
	monsterLocations[mapId][proxyType]["Loc"][monsterLocations[mapId][proxyType]["Counter"]] = Proxy.Get(objectId):GetCoords()
end
local function prepMonsterLoc(argDGAId)
	if(monsterLocations[argDGAId] == nil) then
		monsterLocations[argDGAId] = {
		["Boss"] = {["Counter"]=0,["Loc"]={}},
		["Packs"] = {["Counter"]=0,["Loc"]={}}
		}
	end
	--if(monsterLocations[argDGAId][proxyType] == nil) then
	--	monsterLocations[argDGAId][proxyType] = {["Counter"]=0,["Loc"]={}}
	--end
end


function gd.map.regPacksOnAddToWorld(objectId)
	setMonsterLocations(objectId,"Packs")
end
function gd.map.regBossOnAddToWorld(objectId)
	setMonsterLocations(objectId,"Boss")
end
-- get coords for portal
function gd.map.showOnAddToWorld(objectId)
	local visibleObj = Entity.Get(objectId)
	showCoords = visibleObj:GetCoords()
end

-- ENDLESS
function gd.map.setStartEndless001OnAddToWorld(objectId)
	prepMatrix_AreaData("Loc")
	specialAreaData[mapId]["Loc"]["Start"] = Entity.Get(objectId):GetCoords()
end
function gd.map.portToStartEndlessOnInteract(objectId)
	--local portal = Door.Get(objectId)
	--local player = Game.GetLocalPlayer()
	enableSpawnTrigger = true
	mapTier = mapTier + 1
	Game.GetLocalPlayer():SetCoords(specialAreaData[mapId]["Loc"]["Start"])
	
end

-- PORTAL
local function setPortalData(objectId,portalIndex)
	if(doors[portalIndex] == nil) then
		doors[portalIndex] = {}
	end
	doors[portalIndex]["ID"] = objectId
	doors[portalIndex]["Loc"] = Door.Get(objectId):GetCoords()
	prepMonsterLoc(portalIndex)
end
-- PORTAL EVENTS
local function portalHide()
	--if Server then
		if(doors[mapId] ~= nil) then
			local door = Door.Get(doors[mapId]["ID"])
			door:SetLocked(true)
			door:SetCoords(doors[mapId]["Loc"])
		end
	--end
end
local function portalInteraction(objectId)
	if(portalUses == 1) then
		portalHide()
	end
	portalUses = portalUses - 1
	
end
local function portalShow(portalIndex)
	local door = Door.Get(doors[portalIndex]["ID"])
	door:SetLocked(false)
	door:SetCoords(showCoords)
end
-- used to determine monsterlevel
function gd.map.setTier(argTier)
	mapTier = argTier
	portalHide()
end
-- area
function gd.map.setArea(argId)
	mapId = argId
	removeMonsters()
	portalUses = Game.GetNumPlayers()
	enableSpawnTrigger = true
	portalShow(mapId)
end
function gd.map.portalOnInteract(objectId)portalInteraction(objectId)end
-- ID: 1
function gd.map.portalMap001OnAddToWorld(objectId)setPortalData(objectId,1)end
-- ID: 2
function gd.map.portalMap002OnAddToWorld(objectId)setPortalData(objectId,2)end
-- ID: 10 000
function gd.map.portalSpecial001OnAddToWorld(objectId)setPortalData(objectId,10000)end
