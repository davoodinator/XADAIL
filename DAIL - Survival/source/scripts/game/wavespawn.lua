/*
	
	GRIM DAWN
	
	For more information, visit us at http://www.grimdawn.com
		
*/

gd.wavespawn = {}
local DebugMode = 0 -- 1 add; 2 remove;
local BossWave = 0
local randomWave = 0
local waveNumber = 0
local spawnPointId = 0
local coords = nil
local chestId = 0
local chestCoords = 0
local shrineId = 0
local shrineCoords = 0
local doorId = 0
local doorCoords = 0
local invisibleWallId = 0
local chestPointCoords = 0
local chestPointId = 0
local shrinePointId = 0
local shrinePointCoords = 0
local spawnProxy = 0
local entityId = 0
local isUpdating = 0
local bossAlive = 0
local waveInProcess = 0
local monsterId = {}
local monstersTotal = 0
local waveTime = 0
local Task_Trial = {}
local Quest_CompleteTrials = 0xD8A2C400
Task_Trial[1] = 0xA600A800
Task_Trial[2] = 0xF9494F00
Task_Trial[3] = 0xCC87B400
Task_Trial[4] = 0x43621F00
Task_Trial[5] = 0x4ACA5200
Task_Trial[6] = 0x75260580
Task_Trial[7] = 0x5B91DA80
Task_Trial[8] = 0x4603BB00
Task_Trial[9] = 0x821C1200
Task_Trial[10] = 0x6F480980
Task_Trial[11] = 0x2F629080
Task_Trial[12] = 0xC455B900
Task_Trial[13] = 0x1C0B2000
Task_Trial[14] = 0x550B5E00
Task_Trial[15] = 0xD719C100
Task_Trial[16] = 0x4D575E80
function gd.wavespawn.Init()
		gd.wavespawn.unlockDoor()
		gd.wavespawn.updateQuest()
		gd.wavespawn.ApplyTokens()
end

function gd.wavespawn.ApplyTokens()
local player = Game.GetLocalPlayer()
	
	if (player:HasToken("DISMANTLING_UNLOCKED") == false) then
		player:GiveToken("DISMANTLING_UNLOCKED")
	end
	
	if (player:HasToken("FACTIONS_SET_FIX3") == false) then
		player:GrantQuest(0x8F577200, 0xB6143900)
		player:GetQuestTaskState(0x8F577200, 0xB6143900)
		player:GiveToken("FACTIONS_SET_FIX3")
	end
	
	if (player:HasToken("ASCEND_0") == false) then
		player:GiveToken("ASCEND_0")
	end
	
	if (player:HasToken("STARTING_ITEMS") == false) then
		player:GiveToken("STARTING_ITEMS")
		player:GiveItem("records/items/misc/potions/potion_energya01.dbr", 5, false)
		player:GiveItem("records/items/misc/potions/potion_healtha01.dbr", 5, false)
		player:AdjustMoney(1000)
	end
	if (DebugMode == 1) then
		player:GiveToken("WAVE_45")
		player:GiveToken("DEBUG")
		player:GiveLevels(84)
		player:GiveSkillPoints(100)
		player:AdjustMoney(10000000)
	elseif (DebugMode == 2) then
		player:RemoveToken("DEBUG")
		player:RemoveToken("WAVE_45")
	elseif (DebugMode == 3) then
		player:RemoveToken("WAVE_45")
		player:GiveToken("WAVE_44")
		player:GiveToken("DEBUG")
	end
	
	
end

function gd.wavespawn.updateQuest()
local player = Game.GetLocalPlayer()
local i = 1
	while i <= table.getn(Task_Trial) do
		local quest_state = player:GetQuestTaskState(Quest_CompleteTrials, Task_Trial[i])
		if (quest_state != QuestState.Complete) then
			player:GrantQuest(Quest_CompleteTrials, Task_Trial[i])
		end
		quest_state = player:GetQuestTaskState(Quest_CompleteTrials, Task_Trial[i])
		if (quest_state != QuestState.Complete) then break end
		i=i+1
	end
end

function gd.wavespawn.GetWaveProcess()
	return waveInProcess, nil
end

function gd.wavespawn.SetWaveNumber(n)
	waveNumber = n-1
	UI.Notify("tagWaveToSpawn"..tostring(waveNumber+1))
end

function gd.wavespawn.creatureSpawnPointCoords(objectId)
gd.wavespawn.Init()
	spawnPointId = Entity.Get(objectId)
	coords = spawnPointId:GetCoords()
end

function gd.wavespawn.regChestPoint(objectId)
	chestPointId = Entity.Get(objectId)
	chestPointCoords = chestPointId:GetCoords()
end

function gd.wavespawn.regShrinePoint(objectId)
	shrinePointId = Entity.Get(objectId)
	shrinePointCoords = shrinePointId:GetCoords()
end

function gd.wavespawn.ClearTokens()
local player = Game.GetLocalPlayer()

player:RemoveToken("BOSS_WARDEN_KILLED")
player:RemoveToken("BOSS_DARIUS_KILLED")
player:RemoveToken("BOSS_BLOODFEAST_KILLED")
player:RemoveToken("BOSS_RAVNA_KILLED")
player:RemoveToken("BOSS_OBELISK_KILLED")
player:RemoveToken("BOSS_ZEALOT_KILLED")
player:RemoveToken("BOSS_LOGHORREAN_KILLED")
local i = 1
	while (i <= 100) do
		player:RemoveToken("SHRINE_"..tostring(i))
		player:RemoveToken("WAVE_"..tostring(i))
		i=i+1
	end
waveNumber = 0
player:RemoveToken("GOD_ALKAMOS_KILLED")
player:RemoveToken("GOD_DEPRAVITIE_KILLED")
player:RemoveToken("GOD_ZAULKAHN_KILLED")
player:RemoveToken("GOD_URZOG_KILLED")
player:RemoveToken("GOD_SABRINA_KILLED")
player:RemoveToken("GOD_ARIA_KILLED")
player:RemoveToken("GOD_BEANIES_KILLED")
player:RemoveToken("GOD_HARUN_KILLED")
player:RemoveToken("GOD_MOGDROGEN_KILLED")
player:RemoveToken("GOD_RAZNAR_KILLED")

player:RemoveToken("WEAPON_LOW")
player:RemoveToken("WEAPON_MID")
end

function gd.wavespawn.warningWavespawn()
if (waveInProcess == 1) then return end
	waveNumber = waveNumber+1
	waveTime = 0
	gd.wavespawn.fillArea()
	UI.Notify("tagWave"..tostring(waveNumber))
	if (chestId != 0) then gd.wavespawn.removeChest() end
	if (shrineId != 0) then gd.wavespawn.removeShrine() end
	gd.wavespawn.lockDoor()
	if (isUpdating == 0) then gd.wavespawn.regUpdate(entityId) end
end

function gd.wavespawn.fillArea()
--ASCEND
local player = Game.GetLocalPlayer()
	local i = 0
	while i <= 100 do
		if player:HasToken("ASCEND_"..tostring(i)) then
			i=i+1
		else break end			
	end
	
	if i > 2 then i = 2 end -- temp limit
	i=i-1
	if i > 0 then
		spawnProxy = Proxy.Create("records/proxies/ascend_"..tostring(i).."/proxy_wave"..tostring(waveNumber)..".dbr")
		if (spawnProxy == nil) then
			spawnProxy = Proxy.Create("records/proxies/ascend_"..tostring(i).."/proxy_wave"..tostring(waveNumber)..".dbr")
			UI.Notify("tagNoMoreWaves")
			gd.wavespawn.ClearTokens()
		end
		spawnProxy:SetCoords(coords)
		waveInProcess = 1
		gd.wavespawn.ApplyTokens()
		return
	end
	--ASCEND
	
	spawnProxy = Proxy.Create("records/proxies/proxy_wave"..tostring(waveNumber)..".dbr")
	if (spawnProxy == nil) then
		spawnProxy = Proxy.Create("records/proxies/proxy_wave"..tostring(waveNumber)..".dbr")
		UI.Notify("tagNoMoreWaves")
		gd.wavespawn.ClearTokens()
	end
	spawnProxy:SetCoords(coords)
	waveInProcess = 1
	gd.wavespawn.ApplyTokens()
end

function gd.wavespawn.randomWarningWavespawn()
if (waveInProcess == 1) then return end
	waveTime = 0
	gd.wavespawn.randomFillArea()
	UI.Notify("tagWaveRandom")
	if (chestId != 0) then gd.wavespawn.removeChest() end
	if (shrineId != 0) then gd.wavespawn.removeShrine() end
	gd.wavespawn.lockDoor()
	if (isUpdating == 0) then gd.wavespawn.regUpdate(entityId) end
	randomWave = 1
end

function gd.wavespawn.randomFillArea()
math.randomseed(Time.Now())
local i = random(1,7)
		spawnProxy = Proxy.Create("records/proxies/proxy_wave_random"..tostring(i)..".dbr")
		spawnProxy:SetCoords(coords)
		waveInProcess = 1
end

function gd.wavespawn.regUpdate(objectId)
	entityId = objectId
	Script.RegisterForUpdate(entityId, "gd.wavespawn.Proxy_Update", 1000)
	isUpdating = 1
end

function gd.wavespawn.Proxy_Update(objectId)
local player = Game.GetLocalPlayer()
waveTime = waveTime+1
	if (spawnProxy:AllKilled()) && (bossAlive == 0) && spawnProxy != 0 then
		Script.UnregisterForUpdate(objectId, "gd.wavespawn.Proxy_Update")
		spawnProxy:Destroy()
		spawnProxy = 0
		gd.wavespawn.unlockDoor()
		player:GiveToken("WAVE_"..tostring(waveNumber))
		gd.wavespawn.updateQuest()
		UI.Notify("tagClear")
		isUpdating = 0
		waveInProcess = 0
		monstersTotal = 0
		gd.wavespawn.timeReward()
		waveTime = 0
		if (randomWave != 1) then gd.wavespawn.spawnShrine() end
		randomWave = 0
		BossWave = 0
	end
end

function gd.wavespawn.CreateEffect(coords)
	local pfx = Entity.Create("records/fx/ui/riftgatepersonalopen_fxpak.dbr")
	if pfx != nil then
		pfx:NetworkEnable()
		pfx:SetCoords(coords)	
	end	
end

function gd.wavespawn.timeReward()
local player = Game.GetLocalPlayer()
local avgLevel = Game.GetAveragePlayerLevel()
local rank = 0
	if (waveTime <= 300) then
		UI.Notify("tagWaveTime"..tostring(waveTime))
	else
		UI.Notify("tagWaveTimeMany")
	end
	
	if (randomWave != 1) then
		local i = 0 --Checking time record
		while (i <= 300) do
			if (player:HasToken("WAVE_"..tostring(waveNumber).."TIME-"..tostring(i))) then
				UI.Notify("tagWAVE_"..tostring(waveNumber).."_TIME-"..tostring(i))
				break
			end
			i=i+1
		end
		if (waveTime <= 300) then
			player:GiveToken("WAVE_"..tostring(waveNumber).."TIME-"..tostring(waveTime))
		end
	end
	
	if (BossWave == 0) then
		if (waveTime <= 45) then
			rank = 8
		elseif (waveTime > 45 && waveTime <= 70) then
			rank = 7
		elseif (waveTime > 70 && waveTime <= 80) then
			rank = 6
		elseif (waveTime > 80 && waveTime <= 90) then
			rank = 5
		elseif (waveTime > 90 && waveTime <= 100) then
			rank = 4
		elseif (waveTime > 100 && waveTime <= 110) then
			rank = 3
		elseif (waveTime > 110 && waveTime <= 120) then
			rank = 2
		elseif (waveTime > 120) then
			rank = 1
		end
	elseif (BossWave == 1) then
		if (waveTime <= 90) then
			rank = 8
		elseif (waveTime > 90 && waveTime <= 140) then
			rank = 7
		elseif (waveTime > 140 && waveTime <= 160) then
			rank = 6
		elseif (waveTime > 160 && waveTime <= 180) then
			rank = 5
		elseif (waveTime > 180 && waveTime <= 200) then
			rank = 4
		elseif (waveTime > 200 && waveTime <= 220) then
			rank = 3
		elseif (waveTime > 220 && waveTime <= 240) then
			rank = 2
		elseif (waveTime > 240) then
			rank = 1
		end
	end
	
	local multiplier = 0
	if (Game.GetGameDifficulty() == Game.Difficulty.Normal) then
		multiplier = 1
	elseif (Game.GetGameDifficulty() == Game.Difficulty.Epic) then
		multiplier = 3
	elseif (Game.GetGameDifficulty() == Game.Difficulty.Legendary) then
		multiplier = 5
	end
	UI.Notify("tagRank"..tostring(rank))
	local money = ((50*(rank/2)*waveNumber*avgLevel)/6)*multiplier
	local experience = ((75+(avgLevel*2))*(rank/2)*waveNumber)*multiplier
	
	player:AdjustMoney(money)
	player:GiveExperience(experience)
end

function gd.wavespawn.heroDeath()
if (waveTime == 0) then return end
if (chestId != 0) then return end
	local chestDBR = "records/items/lootchests/chest_t0.dbr"
	local chest = Chest.Create(chestDBR)
	chest:SetCoords(chestPointCoords)
end

function gd.wavespawn.spawnShrine()
local player = Game.GetLocalPlayer()
	if( math.mod( waveNumber, 2 ) == 0 ) then
		if (player:HasToken("SHRINE_"..tostring(waveNumber)) == false) then
			local shrine = Shrine.Create("records/interactive/void_devotionshrine.dbr")
			shrine:SetCoords(shrinePointCoords)
		end
	end
end

function gd.wavespawn.useShrine()
local player = Game.GetLocalPlayer()
	player:GiveToken("SHRINE_"..tostring(waveNumber))	
	math.randomseed(Time.Now())
	/*
	local i = random(1,100)
		if (i >= 75) then
			UI.Notify("tagAttributePointAwardedc")
			player:GiveItem("records/items/misc/essence_power.dbr", 1, true)
			return
		end
		
		if (i >= 50) then
			UI.Notify("tagSkillPointAwardedc")
			player:GiveItem("records/items/misc/essence_skill.dbr", 1, true)
		end
		*/
end

function gd.wavespawn.onSpawnChest(objectId)
	chestId = Chest.Get(objectId)
	chestCoords = chestId:GetCoords()
	local pfx = Entity.Create("records/fx/whiteflash01.dbr")
	if pfx != nil then
		pfx:NetworkEnable()
		pfx:SetCoords(chestCoords)
	end
end

function gd.wavespawn.removeChest()
if (chestId == 0) then return end
	local pfx = Entity.Create("records/fx/whiteflash01.dbr")
	if pfx != nil then
		pfx:NetworkEnable()
		pfx:SetCoords(chestCoords)
	end
	chestId:Destroy()
	chestId = 0
end

function gd.wavespawn.onDoorSpawn(objectId)
	doorId = Door.Get(objectId)
	doorCoords = doorId:GetCoords()
end

function gd.wavespawn.unlockDoor()
if (doorId == 0) then return end
	doorId:SetLocked(false)
	doorId:Open()
		if (invisibleWallId != 0) then	
			invisibleWallId:Destroy()
			invisibleWallId = 0	
		end	
end

function gd.wavespawn.lockDoor()
	doorId:SetLocked(true)
	doorId:Close()
	invisibleWallId = Destructible.Create("records/level art/doorsinterior/invisible_wall.dbr")
	invisibleWallId:SetCoords(doorCoords)
	doorId:SetCoords(doorCoords)
end

function gd.wavespawn.onSpawnShrine(objectId)
	shrineId = Shrine.Get(objectId)
	shrineCoords = shrineId:GetCoords()
	local pfx = Entity.Create("records/fx/whiteflash01.dbr")
	if pfx != nil then
		pfx:NetworkEnable()
		pfx:SetCoords(shrineCoords)
	end
end

function gd.wavespawn.removeShrine()
if (shrineId == 0) then return end
	local pfx = Entity.Create("records/fx/whiteflash01.dbr")
	if pfx != nil then
		pfx:NetworkEnable()
		pfx:SetCoords(shrineCoords)
	end
	shrineId:Destroy()
	shrineId = 0
end

function gd.wavespawn.resetWaves()
	Script.UnregisterForUpdate(entityId, "gd.wavespawn.Proxy_Update")
	if (spawnProxy != 0) then spawnProxy:Destroy() end	
	isUpdating = 0
	waveNumber = 0
	bossAlive = 0
	waveInProcess = 0
	waveTime = 0
	randomWave = 0
	gd.wavespawn.unlockDoor()
	if (chestId != 0) then gd.wavespawn.removeChest() end
	if (shrineId != 0) then gd.wavespawn.removeShrine() end
	UI.Notify("tagClearing")
	local i = 1
	while (i <= monstersTotal) do
		local monCoords = monsterId[i]:GetCoords()
		gd.wavespawn.CreateEffect(monCoords)
		monsterId[i]:Destroy()
		monsterId[i]:Kill()
		i = i+1
	end
	monstersTotal = 0
end

function gd.wavespawn.setBossAlive(objectId)
	bossAlive = 1
	BossWave = 1
	gd.wavespawn.regMonster(objectId)
end

function gd.wavespawn.unsetBossAlive(objectId) --Boss Died
bossAlive = 0
local player = Game.GetLocalPlayer()
local boss = Character.Get(objectId)
local dbrPath = boss:GetName()
local bossName = ""
	if (dbrPath == "records/creatures/wavespawn/heroes&bosses/boss_warden02.dbr") then bossName = "WARDEN"
	elseif (dbrPath == "records/creatures/wavespawn/heroes&bosses/boss_darius.dbr") then bossName = "DARIUS"
	elseif (dbrPath == "records/creatures/wavespawn/heroes&bosses/boss_dranghoul.dbr") then bossName = "BLOODFEAST"
	elseif (dbrPath == "records/creatures/wavespawn/heroes&bosses/boss_dermapteranqueen02.dbr") then bossName = "RAVNA"
	elseif (dbrPath == "records/creatures/wavespawn/heroes&bosses/boss_aetherialobelisk02.dbr") then bossName = "OBELISK"
	elseif (dbrPath == "records/creatures/wavespawn/heroes&bosses/boss_zealot.dbr") then bossName = "ZEALOT"
	elseif (dbrPath == "records/creatures/wavespawn/heroes&bosses/boss_loghorrean_03.dbr") then bossName = "LOGHORREAN"
	end
	if (player:HasToken("BOSS_"..bossName.."_KILLED") == false) then
		chestDBR = "records/items/lootchests/chest_"..bossName..".dbr"
		if (player:HasToken("SKILLPOINT_"..bossName) == false) then
			player:GiveItem("records/items/misc/essence_skill.dbr", 1, true)
			UI.Notify("tagSkillPointAwardedc")
			player:GiveItem("records/items/misc/inventorybag.dbr", 1, false)
			player:GiveToken("SKILLPOINT_"..bossName)
		end
		player:GiveToken("BOSS_"..bossName.."_KILLED")
	else chestDBR = "records/items/lootchests/chest_t0.dbr"
	end
	local chest = Chest.Create(chestDBR)
	chest:SetCoords(chestPointCoords)
end

function gd.wavespawn.regMonster(objectId)
	monstersTotal = monstersTotal+1
	monsterId[monstersTotal] = Character.Get(objectId)
end

local function CharacterCreateArgs()
	local averageLevel = Game.GetAveragePlayerLevel()
	local monsterLevel = (averageLevel+15) --+15

	return monsterLevel, nil	
end

function gd.wavespawn.spawnGod(godName)
	local spawn = Character.Create ("records/creatures/gods/"..godName..".dbr", CharacterCreateArgs())
	spawn:SetCoords(coords)
	monstersTotal = monstersTotal+1
	monsterId[monstersTotal] = spawn
	gd.wavespawn.lockDoor()
	isUpdating = 1
	waveInProcess = 1
	randomWave = 1 --block shrine spawn just in case
	UI.Notify("tagGodSpawned")
end

function gd.wavespawn.godDeath(objectId)
local player = Game.GetLocalPlayer()
local god = Character.Get(objectId)
local dbrPath = god:GetName()
local godName = ""
	if (dbrPath == "records/creatures/gods/alkamos.dbr") then godName = "ALKAMOS"
	elseif (dbrPath == "records/creatures/gods/depravitie.dbr") then godName = "DEPRAVITIE"
	elseif (dbrPath == "records/creatures/gods/zaulkahn.dbr") then godName = "ZAULKAHN"
	elseif (dbrPath == "records/creatures/gods/urzog.dbr") then godName = "URZOG"
	elseif (dbrPath == "records/creatures/gods/sabrina.dbr") then godName = "SABRINA"
	elseif (dbrPath == "records/creatures/gods/aria.dbr") then godName = "ARIA"
	elseif (dbrPath == "records/creatures/gods/beanies.dbr") then godName = "BEANIES"
	elseif (dbrPath == "records/creatures/gods/harun_skeleton.dbr") then godName = "HARUN"
	elseif (dbrPath == "records/creatures/gods/mogdrogen.dbr") then godName = "MOGDROGEN"
	elseif (dbrPath == "records/creatures/gods/raznar.dbr") then godName = "RAZNAR"
	end
	player:GiveToken("GOD_"..godName.."_KILLED")	
	isUpdating = 0
	waveInProcess = 0
	randomWave = 0
	UI.Notify("tagGodKilled")
	gd.wavespawn.unlockDoor()
	--player:GiveExperience(115000)
end

function gd.wavespawn.giveGodItem(itemName)
	local player = Game.GetLocalPlayer()
	player:GiveItem("records/items/godly/"..itemName..".dbr", 1, true)
end

function gd.wavespawn.Ascend()
local player = Game.GetLocalPlayer()
local i = 1
	while i <= 1 do
		if player:HasToken("ASCEND_"..tostring(i)) then
			i=i+1
		else break end
	end
	if i > 1 then i = 1 end
	gd.wavespawn.ClearTokens()
	player:GiveToken("ASCEND_"..tostring(i))
	UI.Notify("tagAscend_"..tostring(i))
end

function gd.wavespawn.Descend()
local player = Game.GetLocalPlayer()
local i = 1
	while i <= 100 do
		player:RemoveToken("ASCEND_"..tostring(i))
			i=i+1
	end
	UI.Notify("tagDescend")
end