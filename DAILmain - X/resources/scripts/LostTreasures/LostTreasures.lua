--Lost Treasures MOD scripts
--credit : okami29 at http://www.grimdawn.com/forums/showthread.php?t=42534
ltreasures = {}
print("LostTreasures loaded")

local ltguardDBRs = { "records/treasures/creatures/enemies/hero/guardian01_boar_h06.dbr", "records/treasures/creatures/enemies/hero/guardian02_chthoniandevourer_h05.dbr", "records/treasures/creatures/enemies/hero/guardian03_fleshhulk_h04.dbr","records/treasures/creatures/enemies/hero/guardian04_trollhalfcorrupted_h05.dbr",'records/treasures/creatures/enemies/hero/guardian06_bonerat_melee_h06.dbr','records/treasures/creatures/enemies/hero/guardian07_chthoniandreadguard_h05.dbr','records/treasures/creatures/enemies/hero/guardian08_chthonianfiend_h05.dbr','records/treasures/creatures/enemies/hero/guardian09_chthonianleech_h05.dbr','records/treasures/creatures/enemies/hero/guardian10_dermapteran_h05.dbr','records/treasures/creatures/enemies/hero/guardian11_dranghoul_warrior_h07.dbr','records/treasures/creatures/enemies/hero/guardian12_gazer_h06.dbr','records/treasures/creatures/enemies/hero/guardian13_ghost_h06.dbr','records/treasures/creatures/enemies/hero/guardian14_golemrock_h06.dbr','records/treasures/creatures/enemies/hero/guardian15_harpy_h06.dbr','records/treasures/creatures/enemies/hero/guardian16_human_h04.dbr','records/treasures/creatures/enemies/hero/guardian17_obsidiandefiler_h05.dbr','records/treasures/creatures/enemies/hero/guardian18_skeletalgolem_h05.dbr','records/treasures/creatures/enemies/hero/guardian19_spider_h06.dbr','records/treasures/creatures/enemies/hero/guardian20_waspgiant_h07.dbr' }
local ltspawnbonus = { 1,2,3,4,5,6,7,8,9,10,11,12,13,18,23,34,48,73,98 }
local ltnotificationkills = { 'tagT_onkill1','tagT_onkill2','tagT_onkill3','tagT_onkill4','tagT_onkill5','tagT_onkill6','tagT_onkill7','tagT_onkill8','tagT_onkill9','tagT_onkill10','tagT_onkill11','tagT_onkill12','tagT_onkill13','tagT_onkill14','tagT_onkill15','tagT_onkill16','tagT_onkill17','tagT_onkill18','tagT_onkill19','tagT_onkill20','tagT_onkill21','tagT_onkill22','tagT_onkill23','tagT_onkill24','tagT_onkill25' }
local totalGuards = table.getn(ltguardDBRs)
local spawnedltguardU = 0
local killedltguard = 0

local function CharacterCreateArgs()

	local averageLevel = Game.GetAveragePlayerLevel()
	local monsterLevel = 100
	monsterLevel = ((averageLevel+(averageLevel/50))+4)
	if monsterLevel < 85 then monsterLevel = 89 end
	return monsterLevel, nil
	
end

function ltreasures.summon(objectId)
	local newCreature = Entity.Create(objectId);
	local playerCoords = Game.GetLocalPlayer():GetCoords();
	newCreature:SetCoords(playerCoords);
end

function ltreasures.ononeshotremoved(objectId,place)
	print ("ltreasures.ononeshotdestroyed : ",objectId,"place : ",place,"Initial spawnedltguardU=",spawnedltguardU)	
	local coords = Entity.Get(objectId):GetCoords()
	local player = Game.GetLocalPlayer()
	print("ok table and coords =",coords)
	math.randomseed(Time.Now());
	if Game.GetGameDifficulty() >= Game.Difficulty.Legendary then
		print("Difficulty is Ultimate")
		math.randomseed(Time.Now());
		local randomizer = random(1,totalGuards);
		print("randomizer",randomizer,"killedltguard=",killedltguard)
		local spawn = Character.Create (ltguardDBRs[randomizer], CharacterCreateArgs())
		spawn:SetCoords(coords)
		print("Coords x MAJOR",coords.xAxis.x)
	end
end


function ltreasures.ondieguardian(objectId)
		local coords = Entity.Get(objectId):GetCoords()
		print("ondieguardian coords=",coords)
		killedltguard = killedltguard+1
		UI.Notify(ltnotificationkills[killedltguard])
		math.randomseed(Time.Now());
		local randomizer01 = random(1,100);
		local randomizerbonus = randomizer01 + ltspawnbonus[killedltguard]
		print("randomizer01 =",randomizer01,"randomizernonus=",randomizerbonus,"spawnedltguardU=",spawnedltguardU)
		if randomizerbonus > 98 and spawnedltguardU < 3 then
			local ultimateguardian = Entity.Create('records/treasures/creatures/enemies/boss&quest/treasures_guardian_ultimate.dbr')
			ultimateguardian:SetCoords(coords);
			--ltreasures.summon('records/treasures/creatures/enemies/boss&quest/treasures_guardian_ultimate.dbr')
			spawnedltguardU = spawnedltguardU +1
		print("spawnedltguardU=",spawnedltguardU)
		end
end

function ltreasures.ondrop(objectId)
	print("ondrop",objectId)
	local newCreature = Entity.Create('records/treasures/fx/skillsother/treasures_fx_lootbeam.dbr');
	local coords = Entity.Get(objectId):GetCoords()
	newCreature:SetCoords(coords);
	UI.Notify('tagT_ondrop');
end
function ltreasures.ondropdestroy(objectId)
	print("ondropdestroy",objectId)
	Entity.Get(objectId):Destroy()
	print("Destroying shoulder")
end
--------------START Call on destoyed One shot---------
function ltreasures.ononeshotremoved1(objectId)
ltreasures.ononeshotremoved(objectId,1)
end
function ltreasures.ononeshotremoved2(objectId)
ltreasures.ononeshotremoved(objectId,2)
end
function ltreasures.ononeshotremoved3(objectId)
ltreasures.ononeshotremoved(objectId,3)
end
function ltreasures.ononeshotremoved4(objectId)
ltreasures.ononeshotremoved(objectId,4)
end
function ltreasures.ononeshotremoved5(objectId)
ltreasures.ononeshotremoved(objectId,5)
end
function ltreasures.ononeshotremoved6(objectId)
ltreasures.ononeshotremoved(objectId,6)
end
function ltreasures.ononeshotremoved7(objectId)
ltreasures.ononeshotremoved(objectId,7)
end
function ltreasures.ononeshotremoved8(objectId)
ltreasures.ononeshotremoved(objectId,8)
end
function ltreasures.ononeshotremoved9(objectId)
ltreasures.ononeshotremoved(objectId,9)
end
function ltreasures.ononeshotremoved10(objectId)
ltreasures.ononeshotremoved(objectId,10)
end
function ltreasures.ononeshotremoved11(objectId)
ltreasures.ononeshotremoved(objectId,11)
end
function ltreasures.ononeshotremoved12(objectId)
ltreasures.ononeshotremoved(objectId,12)
end
function ltreasures.ononeshotremoved13(objectId)
ltreasures.ononeshotremoved(objectId,13)
end
function ltreasures.ononeshotremoved14(objectId)
ltreasures.ononeshotremoved(objectId,14)
end
function ltreasures.ononeshotremoved15(objectId)
ltreasures.ononeshotremoved(objectId,15)
end
function ltreasures.ononeshotremoved16(objectId)
ltreasures.ononeshotremoved(objectId,16)
end
function ltreasures.ononeshotremoved17(objectId)
ltreasures.ononeshotremoved(objectId,17)
end
function ltreasures.ononeshotremoved18(objectId)
ltreasures.ononeshotremoved(objectId,18)
end
function ltreasures.ononeshotremoved19(objectId)
ltreasures.ononeshotremoved(objectId,19)
end
function ltreasures.ononeshotremoved20(objectId)
ltreasures.ononeshotremoved(objectId,20)
end
function ltreasures.ononeshotremoved21(objectId)
ltreasures.ononeshotremoved(objectId,21)
end
function ltreasures.ononeshotremoved22(objectId)
ltreasures.ononeshotremoved(objectId,22)
end

--------------END Call on destoyed One shot---------