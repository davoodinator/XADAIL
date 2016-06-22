/*
	
	GRIM DAWN
	
	For more information, visit us at http://www.grimdawn.com
	
*/

gd.nemesis = {}

-- Grim Dawn Nemesis Bosses
local aetherialNemesisDBRs = { "records/creatures/enemies/nemesis/nemesis_aetherial_01.dbr", "records/creatures/enemies/nemesis/nemesis_aetherial_01.dbr", "records/creatures/enemies/nemesis/nemesis_aetherial_01.dbr" }
local chthonianNemesisDBRs = { "records/creatures/enemies/nemesis/nemesis_chthonian_02.dbr", "records/creatures/enemies/nemesis/nemesis_chthonian_02.dbr", "records/creatures/enemies/nemesis/nemesis_chthonian_02.dbr" }
local kymonChosenNemesisDBRs = { "records/creatures/enemies/nemesis/nemesis_kymon_02.dbr", "records/creatures/enemies/nemesis/nemesis_kymon_02.dbr" }
local orderDeathVigilNemesisDBRs = { "records/creatures/enemies/nemesis/nemesis_orderdeathsvigil_01.dbr", "records/creatures/enemies/nemesis/nemesis_orderdeathsvigil_01.dbr" }
local outlawNemesisDBRs = { "records/creatures/enemies/nemesis/nemesis_outlaw_01.dbr", "records/creatures/enemies/nemesis/nemesis_outlaw_01.dbr", "records/creatures/enemies/nemesis/nemesis_outlaw_01.dbr" }
local undeadNemesisDBRs = { "records/creatures/enemies/nemesis/nemesis_undead_02a.dbr", "records/creatures/enemies/nemesis/nemesis_undead_02a.dbr", "records/creatures/enemies/nemesis/nemesis_undead_02a.dbr" }
local aetherialSpawned = false
local chthonianSpawned = false
local kymonChosenSpawned = false
local orderDeathVigilSpawned = false
local outlawSpawned = false
local undeadSpawned = false
local monsterId = 0

local aetherialKilled = false
local chthonianKilled = false
local kymonChosenKilled = false
local orderDeathVigilKilled = false
local outlawKilled = false
local undeadKilled = false

local aetherialChestDestroyed = false
local chthonianChestDestroyed = false
local kymonChosenChestDestroyed = false
local orderDeathVigilChestDestroyed = false
local outlawChestDestroyed = false
local undeadChestDestroyed = false

local function CharacterCreateArgs()

	local averageLevel = Game.GetAveragePlayerLevel()
	local monsterLevel = 0
	local minLevel = 0
	local maxLevel = 0

	if (Game.GetGameDifficulty() == Game.Difficulty.Normal) then
		minLevel = 40
		maxLevel = 55
	elseif (Game.GetGameDifficulty() == Game.Difficulty.Epic) then
		minLevel = 55
		maxLevel = 70
	else
		minLevel = 65
		maxLevel = 200
	end
	
	if (averageLevel < minLevel) then
		monsterLevel = ((minLevel+(minLevel/50))+4)
	elseif (averageLevel > maxLevel) then
		monsterLevel = ((maxLevel+(maxLevel/50))+4)
	else
		monsterLevel = ((averageLevel+(averageLevel/50))+4)

	end

	return monsterLevel, nil
	
end

function gd.nemesis.aetherialNemesisOnAddToWorld(objectId)

	if Server then
		local player = Game.GetLocalPlayer()
		if (player:GetFaction("AETHERIALS") == -20000 && aetherialSpawned == false && aetherialChestDestroyed == false) then
			aetherialSpawned = true
			monsterId = objectId
			local totalNemesis = table.getn(aetherialNemesisDBRs)
			local coords = Entity.Get(objectId):GetCoords()
			
			math.randomseed(Time.Now())
			local randomizer = random(1,totalNemesis)
			
			local spawn = Character.Create (aetherialNemesisDBRs[randomizer], CharacterCreateArgs())
			spawn:SetCoords(coords)
		
		end
	
	end
	
end

function gd.nemesis.chthonianNemesisOnAddToWorld(objectId)

	if Server then
		local player = Game.GetLocalPlayer()
		if (player:GetFaction("CTHONIANS") == -20000 && chthonianSpawned == false && chthonianChestDestroyed == false) then
			chthonianSpawned = true
			monsterId = objectId
			local totalNemesis = table.getn(chthonianNemesisDBRs)
			local coords = Entity.Get(objectId):GetCoords()
			
			math.randomseed(Time.Now())
			local randomizer = random(1,totalNemesis)
			
			local spawn = Character.Create (chthonianNemesisDBRs[randomizer], CharacterCreateArgs())
			spawn:SetCoords(coords)
		
		end
	
	end
	
end

function gd.nemesis.kymonNemesisOnAddToWorld(objectId)

	if Server then
		local player = Game.GetLocalPlayer()
		if (player:GetFaction("USER8") == -20000 && kymonChosenSpawned == false && kymonChosenChestDestroyed == false) then
			kymonChosenSpawned = true
			monsterId = objectId
			local totalNemesis = table.getn(kymonChosenNemesisDBRs)
			local coords = Entity.Get(objectId):GetCoords()
			
			math.randomseed(Time.Now())
			local randomizer = random(1,totalNemesis)
			
			local spawn = Character.Create (kymonChosenNemesisDBRs[randomizer], CharacterCreateArgs())
			spawn:SetCoords(coords)
		
		end
	
	end
	
end

function gd.nemesis.orderDeathVigilNemesisOnAddToWorld(objectId)

	if Server then
		local player = Game.GetLocalPlayer()
		if (player:GetFaction("USER5") == -20000 && orderDeathVigilSpawned == false && orderDeathVigilChestDestroyed == false) then
			orderDeathVigilSpawned = true
			monsterId = objectId
			local totalNemesis = table.getn(orderDeathVigilNemesisDBRs)
			local coords = Entity.Get(objectId):GetCoords()
			
			math.randomseed(Time.Now())
			local randomizer = random(1,totalNemesis)
			
			local spawn = Character.Create (orderDeathVigilNemesisDBRs[randomizer], CharacterCreateArgs())
			spawn:SetCoords(coords)
		
		end
	
	end
	
end

function gd.nemesis.outlawNemesisOnAddToWorld(objectId)

	if Server then
		local player = Game.GetLocalPlayer()
		if (player:GetFaction("OUTLAWS") == -20000 && outlawSpawned == false && outlawChestDestroyed == false) then
			outlawSpawned = true
			monsterId = objectId
			local totalNemesis = table.getn(outlawNemesisDBRs)
			local coords = Entity.Get(objectId):GetCoords()
			
			math.randomseed(Time.Now())
			local randomizer = random(1,totalNemesis)
			
			local spawn = Character.Create (outlawNemesisDBRs[randomizer], CharacterCreateArgs())
			spawn:SetCoords(coords)
		
		end
	
	end
	
end

function gd.nemesis.undeadNemesisOnAddToWorld(objectId)

	if Server then
		local player = Game.GetLocalPlayer()
		if (player:GetFaction("USER6") == -20000 && undeadSpawned == false && undeadChestDestroyed == false) then
			undeadSpawned = true
			monsterId = objectId
			local totalNemesis = table.getn(undeadNemesisDBRs)
			local coords = Entity.Get(objectId):GetCoords()
			
			math.randomseed(Time.Now())
			local randomizer = random(1,totalNemesis)
			
			local spawn = Character.Create (undeadNemesisDBRs[randomizer], CharacterCreateArgs())
			spawn:SetCoords(coords)
		
		end
	
	end
	
end



-- Chests
local aetherialChestId = 0
local chthonianChestId = 0
local kymonChosenChestId = 0
local orderDeathVigilChestId = 0
local outlawChestId = 0
local undeadChestId = 0

function gd.nemesis.aetherialChestOnAddToWorld(objectId)
	
	if Server then	
		aetherialChestId = objectId
		local chestEntity = Entity.Get(objectId)
		local player = Game.GetLocalPlayer()
	
		-- Destroy chest if this is the initial load and the player does not meet the faction requirements to spawn the Nemesis
		if (player != nil) && (chestEntity:IsReloaded() == false) && (player:GetFaction("AETHERIALS") > -20000) then
			chestEntity:Destroy()
			aetherialChestDestroyed = true
		elseif aetherialKilled then
			local chest = Chest.Get(objectId)
			chest:SetLocked(false)
		
		end
	
	end
	
end

function gd.nemesis.chthonianChestOnAddToWorld(objectId)
	
	if Server then	
		chthonianChestId = objectId
		local chestEntity = Entity.Get(objectId)
		local player = Game.GetLocalPlayer()
	
		-- Destroy chest if this is the initial load and the player does not meet the faction requirements to spawn the Nemesis
		if (player != nil) && (chestEntity:IsReloaded() == false) && (player:GetFaction("CTHONIANS") > -20000) then
			chestEntity:Destroy()
			chthonianChestDestroyed = true
		elseif chthonianKilled then
			local chest = Chest.Get(objectId)
			chest:SetLocked(false)
		
		end
	
	end
	
end

function gd.nemesis.kymonChosenChestOnAddToWorld(objectId)
	
	if Server then	
		kymonChosenChestId = objectId
		local chestEntity = Entity.Get(objectId)
		local player = Game.GetLocalPlayer()
	
		-- Destroy chest if this is the initial load and the player does not meet the faction requirements to spawn the Nemesis
		if (player != nil) && (chestEntity:IsReloaded() == false) && (player:GetFaction("USER8") > -20000) then
			chestEntity:Destroy()
			kymonChosenChestDestroyed = true
		elseif kymonChosenKilled then
			local chest = Chest.Get(objectId)
			chest:SetLocked(false)
		
		end
	
	end
	
end

function gd.nemesis.orderDeathVigilChestOnAddToWorld(objectId)
	
	if Server then	
		orderDeathVigilChestId = objectId
		local chestEntity = Entity.Get(objectId)
		local player = Game.GetLocalPlayer()
	
		-- Destroy chest if this is the initial load and the player does not meet the faction requirements to spawn the Nemesis
		if (player != nil) && (chestEntity:IsReloaded() == false) && (player:GetFaction("USER5") > -20000) then
			chestEntity:Destroy()
			orderDeathVigilChestDestroyed = true
		elseif orderDeathVigilKilled then
			local chest = Chest.Get(objectId)
			chest:SetLocked(false)
		
		end
	
	end
	
end

function gd.nemesis.outlawChestOnAddToWorld(objectId)
	
	if Server then	
		outlawChestId = objectId
		local chestEntity = Entity.Get(objectId)
		local player = Game.GetLocalPlayer()
	
		-- Destroy chest if this is the initial load and the player does not meet the faction requirements to spawn the Nemesis
		if (player != nil) && (chestEntity:IsReloaded() == false) && (player:GetFaction("OUTLAWS") > -20000) then
			chestEntity:Destroy()
			outlawChestDestroyed = true
		elseif outlawKilled then
			local chest = Chest.Get(objectId)
			chest:SetLocked(false)
		
		end
	
	end
	
end

function gd.nemesis.undeadChestOnAddToWorld(objectId)
	
	if Server then	
		undeadChestId = objectId
		local chestEntity = Entity.Get(objectId)
		local player = Game.GetLocalPlayer()
	
		-- Destroy chest if this is the initial load and the player does not meet the faction requirements to spawn the Nemesis
		if (player != nil) && (chestEntity:IsReloaded() == false) && (player:GetFaction("USER6") > -20000) then
			chestEntity:Destroy()
			undeadChestDestroyed = true
		elseif undeadKilled then
			local chest = Chest.Get(objectId)
			chest:SetLocked(false)
		
		end
	
	end
	
end

function gd.nemesis.aetherialNemesisKilled()
	
	if Server then
		local chest = Chest.Get(aetherialChestId);
		
		aetherialKilled = true
		
		-- Unlock chest if present
		if (chest != nil) then
			chest:SetLocked(false)
		end
		
	end
	
end

function gd.nemesis.chthonianNemesisKilled()
	
	if Server then
		local chest = Chest.Get(chthonianChestId);
		
		chthonianKilled = true
		
		-- Unlock chest if present
		if (chest != nil) then
			chest:SetLocked(false)
		end
		
	end
	
end

function gd.nemesis.kymonChosenNemesisKilled()
	
	if Server then
		local chest = Chest.Get(kymonChosenChestId);
		
		kymonChosenKilled = true
		
		-- Unlock chest if present
		if (chest != nil) then
			chest:SetLocked(false)
		end
		
	end
	
end

function gd.nemesis.orderDeathVigilNemesisKilled()
	
	if Server then
		local chest = Chest.Get(orderDeathVigilChestId);
		
		orderDeathVigilKilled = true
		
		-- Unlock chest if present
		if (chest != nil) then
			chest:SetLocked(false)
		end
		
	end
	
end

function gd.nemesis.outlawNemesisKilled()
	
	if Server then
		local chest = Chest.Get(outlawChestId);
		
		outlawKilled = true
		
		-- Unlock chest if present
		if (chest != nil) then
			chest:SetLocked(false)
		end
		
	end
	
end

function gd.nemesis.undeadNemesisKilled()
	
	if Server then
		local chest = Chest.Get(undeadChestId);
		
		undeadKilled = true
		
		-- Unlock chest if present
		if (chest != nil) then
			chest:SetLocked(false)
		end
		
	end
	
end