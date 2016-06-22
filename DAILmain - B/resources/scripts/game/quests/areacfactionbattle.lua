/*
	
	GRIM DAWN
	
	For more information, visit us at http://www.grimdawn.com
	
*/

gd.areaCFactionBattle = {}

--
-- The Boss is spawned based on which faction Host supported
--


-- Boss Door Control and Kill Credit
local bossDoor01Id = 0
local bossDoor02Id = 0
local entranceId = 0

function gd.areaCFactionBattle.necroBossKilled()

	local player = Game.GetLocalPlayer()

	if player:HasToken("AREAC_ZEALOTS_CHOSEN") then
		GiveTokenToLocalPlayer("NECRO_MALKADARR_SLAIN")
	end
	
	-- Unlock doors
	if Server then
		local door01 = Door.Get(bossDoor01Id)	
		local door02 = Door.Get(bossDoor02Id)
	
		if door01 ~= nil then
			door01:Open()
		
		end
		
		if door02 ~= nil then
			door02:Open()
		
		end
	
	end
	
end

function gd.areaCFactionBattle.zealotBossKilled()

	local player = Game.GetLocalPlayer()

	if player:HasToken("AREAC_NECROS_CHOSEN") then
		GiveTokenToLocalPlayer("ZEALOT_CHAMPION_SLAIN")
	end
	
	-- Unlock doors
	if Server then
		local door01 = Door.Get(bossDoor01Id)	
		local door02 = Door.Get(bossDoor02Id)
	
		if door01 ~= nil then
			door01:Open()
		
		end
		
		if door02 ~= nil then
			door02:Open()
		
		end
	
	end
	
end

function gd.areaCFactionBattle.bossDoor01OnAddToWorld(objectId)
	if Server then
		bossDoor01Id = objectId
		local player = Game.GetLocalPlayer()
		
		if player:ServerHasToken("FACTION_BATTLENECRO") == false && player:ServerHasToken("FACTION_BATTLEZEALOT") == false then
			local door = Door.Get(objectId)	
			door:Open()
		
		end

	end

end

function gd.areaCFactionBattle.bossDoor02OnAddToWorld(objectId)
	if Server then
		bossDoor02Id = objectId
		local player = Game.GetLocalPlayer()
		
		if player:ServerHasToken("FACTION_BATTLENECRO") == false && player:ServerHasToken("FACTION_BATTLEZEALOT") == false then
			local door = Door.Get(objectId)
			door:SetLocked(false)
			door:Open()
		
		end

	end

end



-- Boss Spawn Control
local bossId = 0
local spawnedBoss = false

local BossState = { Default = 0, Necro = 1, Zealot = 2 }

local bossStateObjects = orderedTable()
	bossStateObjects["FACTION_BATTLEZEALOT"	] = { state = BossState.Zealot, dbr = "records/creatures/enemies/faction/necro_boss02.dbr"}
	bossStateObjects["FACTION_BATTLENECRO"	] = { state = BossState.Necro, dbr = "records/creatures/enemies/faction/zealot_boss02.dbr"}
	bossStateObjects[""					 	] = { state = BossState.Default, dbr = nil }

local function CharacterCreateArgs()

	return 0, Entity.Get(bossId):GetCoords().origin
	
end

function gd.areaCFactionBattle.bossOnAddToWorld(objectId)
	if Server then
		if (not spawnedBoss) then
			QuestGlobalEvent("factionResetToken")
			
			bossId = objectId
	
			local userdata = {}
			local didWork, newState = TokenStateBasedObjectSwap(objectId, userdata, bossStateObjects, Character, CharacterCreateArgs)
	
			Shared.setUserdata(objectId, userdata)
	
			-- Don't respawn the Boss next time. If spawned as hostile, will be saved into the world
			if (newState == BossState.Necro || newState == BossState.Zealot) then
				spawnedBoss = true
				
			end
			
		end
	
	end
	
end

gd.areaCFactionBattle.bossOnDestroy = ClearObjectUserdata

function gd.areaCFactionBattle.factionBattleBegin()
	if Server then
		local player = Game.GetLocalPlayer()
		
		if (player:HasToken("FACTION_BATTLENECRO") || player:HasToken("FACTION_BATTLEZEALOT")) && not spawnedBoss then
			local entity = Entity.Get(bossId)
			
			if entity != nil then
				local didWork, newState = UpdateObjectSwap(bossId, bossStateObjects, Character, CharacterCreateArgs)
		
				-- Don't respawn the Boss next time
				if (newState == BossState.Necro || newState == BossState.Zealot) then
					spawnedBoss = true
					
				end
			
			end
			
		end
	
	end

end


-- Secret Door leading to Ghoul Level
-- Door control
local ghoulDoorId = 0
local leverId = 0
local secretOpened = false

function gd.areaCFactionBattle.dungeonDoorOnAddToWorld(objectId)

	if Server then
		ghoulDoorId = objectId;
		
	end
		
end

function gd.areaCFactionBattle.openDungeon()

	if Server && not secretOpened then
		secretOpened = true
		local door = Door.Get(ghoulDoorId)
		
		UI.Notify("tagNotification_AreaD_KymonSecret")
		
		if ((door != nil) && (door:IsLocked())) then
			door:SetLocked(false)
			door:Open()
			
		end
	
	end
	
end


-- UG Door
function gd.areaCFactionBattle.entranceOnAddToWorld(objectId)

	if Server then
	
		entranceId = objectId;
		
		local door = Door.Get(objectId)
		local player = Game.GetLocalPlayer()

		if (player:ServerHasToken("AREAC_NECROS_CHOSEN") || player:ServerHasToken("AREAC_ZEALOTS_CHOSEN")) then
			-- Host already unlocked this door
			door:SetLocked(false)
			door:Open()
		end
		
	end
		
end

-- Entrance to Tomb of Archon Barthollem
-- Unlock door if player clicks it and host is eligible
function gd.areaCFactionBattle.doorOnInteract(objectId, userId)

	local player = Player.Get(userId)
	local door = Door.Get(objectId)
	
	-- unlock door if the host has chosen a faction
	if ((door != nil) && (door:IsLocked())) then
		if (player:ServerHasToken("AREAC_NECROS_CHOSEN") || player:ServerHasToken("AREAC_ZEALOTS_CHOSEN")) then
			door:SetLocked(false)
			door:Open()
			
		end
		
	end
	
end
