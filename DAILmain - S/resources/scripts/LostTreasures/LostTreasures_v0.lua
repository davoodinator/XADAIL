--Lost Treasures MOD scripts
--credit : okami29 at http://www.grimdawn.com/forums/showthread.php?t=42534
ltreasures = {}
print("LostTreasures loaded")

local ltguardDBRs = { "records/treasures/creatures/enemies/boss&quest/treasures_guardian01.dbr", "records/treasures/creatures/enemies/boss&quest/treasures_guardian01.dbr", "records/treasures/creatures/enemies/boss&quest/treasures_guardian01.dbr" }
local ltMinorDBRs = { "records/treasures/creatures/enemies/hero/minor_boar_h06.dbr", "records/treasures/creatures/enemies/hero/minor_chthoniandevourer_h05.dbr", "records/treasures/creatures/enemies/hero/minor_fleshhulk_h04.dbr","records/treasures/creatures/enemies/hero/minor_trollhalfcorrupted_h05.dbr" }
local placeofspawning = 0
local totalGuardsMinor = table.getn(ltMinorDBRs)
local spawnedltguard = false
local ltmajorkilled = false
local function CharacterCreateArgs()

	local averageLevel = Game.GetAveragePlayerLevel()
	local monsterLevel = 100
	monsterLevel = ((averageLevel+(averageLevel/50))+4)
	return monsterLevel, nil
	
end

function ltreasures.summon(objectId)
	local newCreature = Entity.Create(objectId);
	local playerCoords = Game.GetLocalPlayer():GetCoords();
	newCreature:SetCoords(playerCoords);
end
function randomizeexclusion2(maxentries,exclude1,exclude2)
    local r = math.random(1,maxentries,exclude1,exclude2);
    if (r == exclude1 or r == exclude2) then 
        return randomizeexclusion2(maxentries,exclude1,exclude2);
    end
    return r;
end
function randomizeexclusion(maxentries,exclude1)
    local r = math.random(1,maxentries,exclude1);
    if r == exclude1 then 
        return randomizeexclusion(maxentries,exclude1);
    end
    return r;
end

function ltreasures.ononeshotremoved(objectId,place)
	print ("ltreasures.ononeshotdestroyed : ",objectId,"place : ",place,"Initial spawnedltguard=",spawnedltguard)	
	local t={'LTREASURES_SPAWN_1','LTREASURES_SPAWN_2','LTREASURES_SPAWN_3','LTREASURES_SPAWN_4','LTREASURES_SPAWN_5','LTREASURES_SPAWN_6','LTREASURES_SPAWN_7','LTREASURES_SPAWN_8','LTREASURES_SPAWN_9','LTREASURES_SPAWN_10','LTREASURES_SPAWN_11','LTREASURES_SPAWN_12','LTREASURES_SPAWN_13','LTREASURES_SPAWN_14','LTREASURES_SPAWN_15','LTREASURES_SPAWN_16','LTREASURES_SPAWN_17','LTREASURES_SPAWN_18','LTREASURES_SPAWN_19','LTREASURES_SPAWN_20'}
	local coords = Entity.Get(objectId):GetCoords()
	local player = Game.GetLocalPlayer()
	print("ok table and coords =",coords)
	if Game.GetGameDifficulty() >= Game.Difficulty.Legendary then
		print("Difficulty is Ultimate")
		if player:HasToken(t[place]) then
			ltreasures.spawnminor(coords,place)
		else
		print("No token")
			if spawnedltguard == true then
				ltreasures.spawnminor(coords,place)
			else
				ltreasures.spawnmajor(coords,place)
			end
		end
	end
end

function ltreasures.spawnminor(chestcoords,place)
---This will spawn a random MINOR guardian that can drop recipes but has VERY LOW chance (10 times less) to drop a treasure item
	print("spawn MINOR begins=",spawnedltguard)
	math.randomseed(Time.Now())
	local randomizerMinor = random(1,totalGuardsMinor)
	local spawnMinor = Character.Create (ltMinorDBRs[randomizerMinor], CharacterCreateArgs())
	spawnMinor:SetCoords(chestcoords)
	print("Coords x MINOR",chestcoords.xAxis.x)
end
function ltreasures.spawnmajor(chestcoords,place)
	---This will spawn a Minor or a Major Guard
		print("Spawn MAJOR begins",spawnedltguard)
		local totalGuards = table.getn(ltguardDBRs)
		math.randomseed(Time.Now())
		local randomizer0 = random(1,totalGuards)
		if randomizer0 >= 1 then
			math.randomseed(Time.Now())
			local randomizer = random(1,totalGuards)
			print("randomizer",randomizer)
			local spawn = Character.Create (ltguardDBRs[randomizer], CharacterCreateArgs())
			spawn:SetCoords(chestcoords)
			print("Coords x MAJOR",chestcoords.xAxis.x)
			spawnedltguard = true
			placeofspawning = place
			print("placeofspawning number =",placeofspawning," spawnedltguard after summon Major =",spawnedltguard)
		else
			math.randomseed(Time.Now())
			local randomizerMinor = random(1,totalGuardsMinor)
			print("randomizerMinor",randomizerMinor)
			local spawnMinor = Character.Create (ltMinorDBRs[randomizerMinor], CharacterCreateArgs())
			spawnMinor:SetCoords(chestcoords)
		end
end


function ltreasures.ondieguardian(objectId)
local t={'LTREASURES_SPAWN_1','LTREASURES_SPAWN_2','LTREASURES_SPAWN_3','LTREASURES_SPAWN_4','LTREASURES_SPAWN_5','LTREASURES_SPAWN_6','LTREASURES_SPAWN_7','LTREASURES_SPAWN_8','LTREASURES_SPAWN_9','LTREASURES_SPAWN_10','LTREASURES_SPAWN_11','LTREASURES_SPAWN_12','LTREASURES_SPAWN_13','LTREASURES_SPAWN_14','LTREASURES_SPAWN_15','LTREASURES_SPAWN_16','LTREASURES_SPAWN_17','LTREASURES_SPAWN_18','LTREASURES_SPAWN_19','LTREASURES_SPAWN_20'}
			print("ondieguardian placeofspawning before token= ",placeofspawning)
			for i=1,20 do
				if placeofspawning == i then
					print("ondieguardian placeofspawning = ",i,"token given =",t[i])
					player:GiveToken(t[i])
					break
				end
			end
		ltmajorkilled = true
		ltreasures.resettoken(objectId)
end
function ltreasures.resettoken(objectId)
local t={'LTREASURES_SPAWN_1','LTREASURES_SPAWN_2','LTREASURES_SPAWN_3','LTREASURES_SPAWN_4','LTREASURES_SPAWN_5','LTREASURES_SPAWN_6','LTREASURES_SPAWN_7','LTREASURES_SPAWN_8','LTREASURES_SPAWN_9','LTREASURES_SPAWN_10','LTREASURES_SPAWN_11','LTREASURES_SPAWN_12','LTREASURES_SPAWN_13','LTREASURES_SPAWN_14','LTREASURES_SPAWN_15','LTREASURES_SPAWN_16','LTREASURES_SPAWN_17','LTREASURES_SPAWN_18','LTREASURES_SPAWN_19','LTREASURES_SPAWN_20'}
		local check = true
			for i=1,20 do
				if player:HasToken(t[i]) == false then check = false
				end
			end
		if check == true then
			print("Reset + Summon Ultimate guardian")
			for i=1,20 do
				player:RemoveToken(t[i])
			end
			ltreasures.summon('records/treasures/creatures/enemies/boss&quest/treasures_guardian_ultimate.dbr')
		end
end

function ltreasures.ondrop(objectId)
	print("ondrop",objectId)
	local newCreature = Entity.Create('records/treasures/fx/skillsother/treasures_fx_lootbeam.dbr');
	local coords = Entity.Get(objectId):GetCoords()
	newCreature:SetCoords(coords);
	UI.Notify('tagT_ondrop');
end
--------------START CLUE SYSTEM
function ltreasures.clue()
local t={'LTREASURES_SPAWN_1','LTREASURES_SPAWN_2','LTREASURES_SPAWN_3','LTREASURES_SPAWN_4','LTREASURES_SPAWN_5','LTREASURES_SPAWN_6','LTREASURES_SPAWN_7','LTREASURES_SPAWN_8','LTREASURES_SPAWN_9','LTREASURES_SPAWN_10','LTREASURES_SPAWN_11','LTREASURES_SPAWN_12','LTREASURES_SPAWN_13','LTREASURES_SPAWN_14','LTREASURES_SPAWN_15','LTREASURES_SPAWN_16','LTREASURES_SPAWN_17','LTREASURES_SPAWN_18','LTREASURES_SPAWN_19','LTREASURES_SPAWN_20'}
local t2={'tagT_place1','tagT_place2','tagT_place3','tagT_place4','tagT_place5','tagT_place6','tagT_place7','tagT_place8','tagT_place9','tagT_place10','tagT_place11','tagT_place12','tagT_place13','tagT_place14','tagT_place15','tagT_place16','tagT_place17','tagT_place18','tagT_place19','tagT_place20'}
	if ltmajorkilled == true then UI.Notify('tagT_majorkilled')
	else
		math.randomseed(Time.Now())
		local randomizer = random(1,100)
		print("randomizer CLUE number",randomizer)
		if randomizer>75 then
		--Tell the player the location of the Major guardian with notification
			UI.Notify(t2[placeofspawning])
		else
		--Tell the player one location where the Major guardian is NOT located with notification
			UI.Notify(t2[placeofspawning])
		end
	end
end

--------------END CLUE SYSTEM

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