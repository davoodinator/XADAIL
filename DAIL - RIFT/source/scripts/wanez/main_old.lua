/**
 * TODO:s
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

--gd.wa = {}
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
local portals = {}

local bossCount = 1

local modeId = 0
local mapTier = 0
local mapId = 0
local dgaLayoutId = 0
local difMul = 1

local enableSpawnTrigger = false
local portalUses = 0

-- created monster are stored by area
local monsterStorage = {["Instance"]={},["Counter"]=0}
local monsterStorage2 = {["Instance"]={},["Counter"]=0}
local monsterStorage3 = {["Instance"]={},["Counter"]=0}
local containerStorage = {["Instance"]={},["Counter"]=0}
-- stored several special map data: starting locations, lock/unlock chests/doors, ...
local specialAreaData = {}
local aDGALayouts = {}

-- often used for Specials
local currentLayoutID = 0
local nextLayoutID = 0

local prevLayout = {}
local layoutCounter = {}

local blockCreation = {["Portal"]=false,["MonsterLoc"]={}}


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
	if(specialAreaData[mapId][dgaLayoutId] == nil) then
		specialAreaData[mapId][dgaLayoutId] = {}
	end
	if(argSubKey ~= nil) then
		if(specialAreaData[mapId][dgaLayoutId][argSubKey] == nil) then
			specialAreaData[mapId][dgaLayoutId][argSubKey] = {}
		end
	end
end

local function saveMonster(objInstance)
	if(monsterStorage["Counter"] < 1000) then
		monsterStorage["Counter"] = monsterStorage["Counter"] + 1
		monsterStorage["Instance"][monsterStorage["Counter"]] = objInstance
	elseif(monsterStorage2["Counter"] < 1000) then
		monsterStorage2["Counter"] = monsterStorage2["Counter"] + 1
		monsterStorage2["Instance"][monsterStorage2["Counter"]] = objInstance
	elseif(monsterStorage3["Counter"] < 1000) then
		monsterStorage3["Counter"] = monsterStorage3["Counter"] + 1
		monsterStorage3["Instance"][monsterStorage3["Counter"]] = objInstance
	end
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

	if(championChance <= math.floor(waChampionChance * waDifMulSpawnChance[difMul]) && championChance ~= 0) then
		-- CHAMPION (Magic Packs)
		local championTotal = table.getn(monsterPackPools[randPool]["Champion"])
		local randChampionCount = random(math.ceil(waChampionCount[1] * waDifMulSpawnNum[difMul]),math.floor(waChampionCount[2] * waDifMulSpawnNum[difMul]))
		--local randChampionCount = random(math.ceil(waChampionCount[1]),math.floor(waChampionCount[2]))
		for i=1,randChampionCount
		do
			local randChampion = random(1,championTotal)
			
			createMonster(monsterPackPools[randPool]["Champion"][randChampion],waChampionLevelOffset,proxyCoords)
		end
	else
		-- COMMON
		local commonTotal = table.getn(monsterPackPools[randPool]["Common"])
		local randCommonCount = random(math.ceil(waCommonCount[1] * waDifMulSpawnNum[difMul]),math.floor(waCommonCount[2] * waDifMulSpawnNum[difMul]))
		--local randCommonCount = random(math.ceil(waCommonCount[1]),math.floor(waCommonCount[2]))
		for i=1,randCommonCount
		do
			local randCommon = random(1,commonTotal)
			
			createMonster(monsterPackPools[randPool]["Common"][randCommon],waCommonLevelOffset,proxyCoords)
		end
		
		-- HERO
		if(Game.GetAveragePlayerLevel() >= waHeroMinPlayerLvl) then
			local heroTotal = table.getn(monsterPackPools[randPool]["Hero"])
			local randHeroCount = random(math.ceil(waHeroCount[1] * waDifMulSpawnNum[difMul]),math.floor(waHeroCount[2] * waDifMulSpawnNum[difMul]))
			--local randHeroCount = random(waHeroCount[difMul][1],waHeroCount[difMul][2])
			for i=1,randHeroCount
			do
				local rollHeroChance = random(1,100)
				--rollHeroChance = math.floor(rollHeroChance * waDifMulSpawnChance[difMul])
				if(rollHeroChance <= math.floor(waHeroChance * waDifMulSpawnChance[difMul])) then
					local randHero = random(1,heroTotal)
					
					createMonster(monsterPackPools[randPool]["Hero"][randHero],waHeroLevelOffset,proxyCoords)
				end
			end
		end
	end
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
			--if(monsterStorage["Instance"][i] != nil) then
				monsterStorage["Instance"][i]:Destroy()
			--end
			
		end
		monsterStorage["Instance"] = {}
		monsterStorage["Counter"] = 0
	end
	if(monsterStorage2["Counter"] > 0) then
		for i=1,monsterStorage2["Counter"]
		do
			monsterStorage2["Instance"][i]:Destroy()
		end
		monsterStorage2["Instance"] = {}
		monsterStorage2["Counter"] = 0
	end
	if(monsterStorage3["Counter"] > 0) then
		for i=1,monsterStorage3["Counter"]
		do
			monsterStorage3["Instance"][i]:Destroy()
		end
		monsterStorage3["Instance"] = {}
		monsterStorage3["Counter"] = 0
	end
end
-- Layout
local function getDGALayoutID()
	if(prevLayout[mapId] == nil) then
		prevLayout[mapId] = 0
	end

	local randLayoutId = 1
	local useLayoutId = 1

	if(layoutCount[mapId] > 1) then
		randLayoutId = random(1,layoutCount[mapId])
		--useLayoutId = randLayoutId

		if(prevLayout[mapId] != 0) then
		local whileLayoutId = 0
			while (whileLayoutId == 0) do
				if(randLayoutId != prevLayout[mapId]) then
					whileLayoutId = randLayoutId
				else
					randLayoutId = random(1,layoutCount[mapId])
				end
			end
			useLayoutId = whileLayoutId
		end
	end
	prevLayout[mapId] = useLayoutId
	--dgaLayoutId = useLayoutId
	return useLayoutId
end
-- create array with available layouts for that particular DGA
local function regDGALayouts(argDGAIndex)
	--local defaultLayoutId = 1
	if(aDGALayouts[argDGAIndex] == nil) then
		aDGALayouts[argDGAIndex] = {["Counter"]=0,["Layouts"]={},["usedCounter"]=0,["prevLayoutID"]=0}
	end
	aDGALayouts[argDGAIndex]["Counter"] = aDGALayouts[argDGAIndex]["Counter"] + 1
	aDGALayouts[argDGAIndex]["Layouts"][aDGALayouts[argDGAIndex]["Counter"]] = false

	-- return LayoutID to set portal array
	return aDGALayouts[argDGAIndex]["Counter"]
end

/*
 * CONTAINER
 * - Chests, Breakables
 */
-- Save Created Containers to remove later
local function saveContainer(objInstance)
	containerStorage["Counter"] = containerStorage["Counter"] + 1
	containerStorage["Instance"][containerStorage["Counter"]] = objInstance
end
local function removeContainer()
	if(containerStorage["Counter"] > 0 ) then
		for i=1,containerStorage["Counter"]
		do
			containerStorage["Instance"][i]:Destroy()
		end
		containerStorage["Instance"] = {}
		containerStorage["Counter"] = 0
	end
end
-- Create Container
local function createContainer(proxyCoords,argDBR)
	local chestDBR = argDBR

	-- Common||Rare Container
	if(argDBR == nil) then
		local rngSpawnContainer = random(1,100)
		if(rngSpawnContainer <= math.floor(waRareChestChance * waDifMulChestChance[difMul]))then
			local randChest = random(1,table.getn(waContainerPool[mapId]["Rare"]))
			chestDBR = waContainerPool[mapId]["Rare"][randChest]
		elseif(rngSpawnContainer <= math.floor(waCommonChestChance * waDifMulChestChance[difMul]))then
			local randChest = random(1,table.getn(waContainerPool[mapId]["Common"]))
			chestDBR = waContainerPool[mapId]["Common"][randChest]
		end
		
	end
	-- if DBR is set, create Container
	if(chestDBR != nil) then
		local newContainer = Entity.Create(chestDBR)
		newContainer:SetCoords(proxyCoords)
		saveContainer(newContainer)
	end
end

--local function showEndlessPortal()
--	portalUses = 1
	--nextLayoutID = getDGALayoutID
--	nextLayoutID = 1
	-- TODO
--	local door = doors[mapId][nextLayoutID]["Instance"]
--	door:SetLocked(false)
--	door:SetCoords(specialAreaData[mapId][dgaLayoutId]["Loc"]["End"])
--end
local function getNewTier()
	local newTier = mapTier
	-- 0 (unchanged)
	-- 1 (increase)
	if(modeId == 1) then
		newTier = mapTier + 1
	-- 2 (random01)
	elseif(modeId == 2) then
		local tierAdjust = 0
		local rollTierChance = random(1,100)
		if(rollTierChance <= 30) then
			tierAdjust = -1
		elseif(rollTierChance >= 50) then
			tierAdjust = 1
		end
		newTier = mapTier + tierAdjust
	-- 3
	elseif(modeId == 3) then
		-- TODO
	end
	return newTier
end
local function mapEndlessStartup()
	mapTier = getNewTier()
	--portalUses = Game.GetNumPlayers()
	--showEndlessPortal()
end

-- argSituation - portal interaction or spawn trigger
local function specialSpawnSwitch(argSituation)
	if(mapId >= 100) then
		if(argSituation == "Trigger") then
			if(mapId == 100 || mapId == 101) then
				removeMonsters()
				removeContainer()
			end
		elseif(argSituation == "PortalInteraction") then
			--mapTier = getNewTier()
			--if(nextLayoutID != 0) then
			--	dgaLayoutId = nextLayoutID
			--end
			--if(portalUses == 1) then
			enableSpawnTrigger = true
			prevLayout[mapId] = dgaLayoutId
			--end
			--portalUses = portalUses - 1
		elseif(argSituation == "AfterCreation")then
			mapEndlessStartup()
		end
	end
end
-- fn call - onEnter Trigger
function gd.map.spawnMonsters()
	if(enableSpawnTrigger == true) then
		blockCreation["MonsterLoc"][mapId][dgaLayoutId] = true
		enableSpawnTrigger = false

		specialSpawnSwitch("Trigger")

		-- TODO: Container (Special)
		local specialContainerNumber = table.getn(waContainerPool[mapId]["Special"])
		local doSpecialContainer = {}
		for i=1,specialContainerNumber
		do
			--
			local endWhile = false
			while endWhile == false
			do
				local randomContainerLoc = random(1,monsterLocations[mapId][dgaLayoutId]["Packs"]["Counter"])
				if(doSpecialContainer[randomContainerLoc] == nil) then
					doSpecialContainer[randomContainerLoc] = waContainerPool[mapId]["Special"][i]
					endWhile = true
				end
			end
		end

		-- PACKS (SPAWN) [Common, Champion, Heroes] [Container: Common, Rare, Special]
		for i=1,monsterLocations[mapId][dgaLayoutId]["Packs"]["Counter"]
		do
			-- TODO: Inherited Monster Spawns
			createMonsterPack(monsterLocations[mapId][dgaLayoutId]["Packs"]["Loc"][i])
			-- Create Container (Common, Rare, Special)
			createContainer(monsterLocations[mapId][dgaLayoutId]["Packs"]["Loc"][i],doSpecialContainer[i])
		end
		
		-- BOSS (SPAWN) TODO: multiple different bosses
		for i=1,monsterLocations[mapId][dgaLayoutId]["Boss"]["Counter"]
		do
			-- Create Boss Monster
			createMonsterBoss(monsterLocations[mapId][dgaLayoutId]["Boss"]["Loc"][i])
			-- Roll Boss-Container
			if(table.getn(waContainerPool[mapId]["Boss"]) > 0) then
				createContainer(monsterLocations[mapId][dgaLayoutId]["Boss"]["Loc"][i],waContainerPool[mapId]["Boss"][random(1,table.getn(waContainerPool[mapId]["Boss"]))])
			end
		end
		-- TODO: Specials
		--specialSpawnSwitch()

		UI.Notify("DEV: Counter: "..monsterStorage["Counter"] .. " | LayoutID: " .. dgaLayoutId)
		--UI.Notify("tagWaEventNewMonsters")
		specialSpawnSwitch("AfterCreation")
		--UI.Notify("LayoutID: "..dgaLayoutId .. " | NextLayoutID: " .. nextLayoutID)

		-- TODO: Container (Chests, Breakables)

		-- TODO: Special Trigger ([Un-]Lock Doors, etc.)

		-- TODO: Special Encounters [Nemesis, ...]

		--UI.Notify("LayoutID: " .. dgaLayoutId)
	end
end

-- use proxies set with MapEditor to get monster spawn coords
local function setMonsterLocations(objectId,proxyType)
	if(blockCreation["MonsterLoc"][mapId] == nil) then
		blockCreation["MonsterLoc"][mapId] = {}
	end
	if(blockCreation["MonsterLoc"][mapId][dgaLayoutId] == nil) then
		blockCreation["MonsterLoc"][mapId][dgaLayoutId] = false
	end
	if(blockCreation["MonsterLoc"][mapId][dgaLayoutId] == false) then
		if(monsterLocations[mapId] == nil) then
			monsterLocations[mapId] = {}
		end
		if(monsterLocations[mapId][dgaLayoutId] == nil) then
			monsterLocations[mapId][dgaLayoutId] = {}
		end
		if(monsterLocations[mapId][dgaLayoutId][proxyType] == nil) then
			monsterLocations[mapId][dgaLayoutId][proxyType] = {["Counter"]=0,["Loc"]={}}
		end
		monsterLocations[mapId][dgaLayoutId][proxyType]["Counter"] = monsterLocations[mapId][dgaLayoutId][proxyType]["Counter"] + 1
		monsterLocations[mapId][dgaLayoutId][proxyType]["Loc"][monsterLocations[mapId][dgaLayoutId][proxyType]["Counter"]] = Proxy.Get(objectId):GetCoords()
	end
	
end
local function getDifficulty()
	local retValue = 1
	if (Game.GetGameDifficulty() == Game.Difficulty.Normal) then
		retValue = 1
	elseif (Game.GetGameDifficulty() == Game.Difficulty.Epic) then
		retValue = 2
	else
		retValue = 3
	end
	return retValue
end


function gd.map.regPacksOnAddToWorld(objectId)
	setMonsterLocations(objectId,"Packs")
end
function gd.map.regBossOnAddToWorld(objectId)
	setMonsterLocations(objectId,"Boss")
end
-- get coords for portal
function gd.map.showPortalEnterOnAddToWorld(objectId)
	local visibleObj = Entity.Get(objectId)
	showCoords = visibleObj:GetCoords()

	difMul = getDifficulty()
	poolSize = table.getn(monsterPackPools)
	UI.Notify("tagWaWelcomeDGA")
end

-- ENDLESS 001 (ID - 100)
--function gd.map.setStartEndless001OnAddToWorld(objectId)
--	prepMatrix_AreaData("Loc")
--	specialAreaData[mapId][dgaLayoutId]["Loc"]["Start"] = Entity.Get(objectId):GetCoords()
--end
--function gd.map.portToStartEndlessOnInteract(objectId)
--	enableSpawnTrigger = true
--	mapTier = mapTier + 1
--end
-- 
--function gd.map.setSpecialPortalLocation01OnAddToWorld(objectId)
--	prepMatrix_AreaData("Loc")
--	specialAreaData[mapId][dgaLayoutId]["Loc"]["End"] = Entity.Get(objectId):GetCoords()
--end

-- PORTAL
local function setPortalData_old(objectId,portalIndex)
	if(blockCreation["Portal"] == false) then
		if(doors[portalIndex] == nil) then
			doors[portalIndex] = {}
		end
		if(layoutCounter[portalIndex] == nil) then
			layoutCounter[portalIndex] = 0
		end
		layoutCounter[portalIndex] = layoutCounter[portalIndex] + 1
		if(doors[portalIndex][layoutCounter[portalIndex]] == nil) then
			doors[portalIndex][layoutCounter[portalIndex]] = {}
		end
		doors[portalIndex][layoutCounter[portalIndex]]["ID"] = objectId
		local portalInstance = Door.Get(objectId)
		doors[portalIndex][layoutCounter[portalIndex]]["Instance"] = portalInstance
		doors[portalIndex][layoutCounter[portalIndex]]["Loc"] = portalInstance:GetCoords()
	end
end
local function setPortalData(objectId,argMapId,argLayoutId)
	if(portals[argMapId] == nil)then
		portals[argMapId] = {}
	end
	if(portals[argMapId][argLayoutId] == nil)then
		local portalInstance = Door.Get(objectId)
		portals[argMapId][argLayoutId] = {
			["ID"] = objectId
			["Instance"] = portalInstance,
			["Loc"] = portalInstance:GetCoords()
		}
	end
end
-- PORTAL EVENTS
local function portalHide()
	if(doors[mapId][dgaLayoutId] ~= nil) then
		--local door = Door.Get(doors[mapId][dgaLayoutId]["ID"])
		local door = doors[mapId][dgaLayoutId]["Instance"]
		door:SetLocked(true)
		door:SetCoords(doors[mapId][dgaLayoutId]["Loc"])
	end
	enableSpawnTrigger = true
end
local function portalInteraction(objectId)
	if(portalUses == 1) then
		portalHide()
		--if(nextLayoutID != 0) then
		--	specialSpawnSwitch("PortalInteraction")
		--	nextLayoutID = 0
		--end
	end
	portalUses = portalUses - 1
end
local function portalShow()
	--local door = Door.Get(doors[mapId][dgaLayoutId]["ID"])
	local door = doors[mapId][dgaLayoutId]["Instance"]
	door:SetLocked(false)
	door:SetCoords(showCoords)
end
function gd.map.setMode(argMode)
	modeId = argMode
	--UI.Notify("Mode set")
end
-- used to determine monsterlevel
function gd.map.setTier(argTier)
	mapTier = argTier
	portalHide()
	blockCreation["Portal"] = true
	--UI.Notify("Tier set")
end
-- area
function gd.map.setArea(argId)
	--UI.Notify("Map set")
	mapId = argId
	--enableSpawnTrigger = true
	dgaLayoutId = getDGALayoutID()
	--currentLayoutID = dgaLayoutId
	--UI.Notify(""..dgaLayoutId)
	removeMonsters()
	removeContainer()
	portalUses = Game.GetNumPlayers()
	portalShow()
end
function gd.map.portalEndless01OnInteract(objectId)
	dgaLayoutId = 1
	specialSpawnSwitch("PortalInteraction")
end
function gd.map.portalEndless02OnInteract(objectId)
	dgaLayoutId = 2
	specialSpawnSwitch("PortalInteraction")
end
function gd.map.portalEndless03OnInteract(objectId)
	dgaLayoutId = 3
	specialSpawnSwitch("PortalInteraction")
end
function gd.map.portalEndless04OnInteract(objectId)
	dgaLayoutId = 4
	specialSpawnSwitch("PortalInteraction")
end
--
function gd.map.portalOnInteract(objectId)portalInteraction(objectId)end
-- ID: 1
function gd.map.portalBasicDGA001A00OnAddToWorld(objectId)setPortalData(objectId,1)end
-- ID: 2
function gd.map.portalBasicDGA002A00OnAddToWorld(objectId)setPortalData(objectId,2)end
-- ID: 3
function gd.map.portalBasicDGA003A00OnAddToWorld(objectId)setPortalData(objectId,3)end
-- ID: 4
function gd.map.portalBasicDGA004A00OnAddToWorld(objectId)setPortalData(objectId,4)end
-- ID: 100
function gd.map.portalEndlessDGA001A00OnAddToWorld(objectId)setPortalData(objectId,100)end
-- ID: 101
function gd.map.portalEndlessDGA002A00OnAddToWorld(objectId)setPortalData(objectId,101)end
