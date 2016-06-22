/*
	
	GRIM DAWN
	
	For more information, visit us at http://www.grimdawn.com
	
*/

gd.quests.areaDNPCClone = {}

--
-- Clone boss encounter, starts as a dialogue NPC
--
local bossCloneId = 0
local spawnedBoss = false
local exitShortcut = 0
local lootChestId = 0
local lootChest02Id = 0

local BossCloneState = { Default = 0, Hostile = 1 }


function gd.quests.areaDNPCClone.bossKilled()
	
	GiveTokenToLocalPlayer("CLONE_SLAIN")
	
	if Server then
		local door = Door.Get(exitShortcut)
		local lootChest = Chest.Get(lootChestId);
		local lootChest02 = Chest.Get(lootChest02Id);
		
		-- Unlock Loot Chests
		if (lootChest ~= nil) then
			lootChest:SetLocked(false)
		end
		
		if (lootChest02 ~= nil) then
			lootChest02:SetLocked(false)
		end
		
		-- Unlock Shortcut out
		if door ~= nil then
			door:SetLocked(false)
			door:Open()
			
		end
	
	end
	
end

function gd.quests.areaDNPCClone.exitShortcutOnAddToWorld(objectId)
	
	if Server then
		exitShortcut = objectId
		
	end
	
end

function gd.quests.areaDNPCClone.lootChestOnAddToWorld(objectId)
	
	if Server then
		lootChestId = objectId
		
	end
	
end

function gd.quests.areaDNPCClone.lootChest02OnAddToWorld(objectId)
	
	if Server then
		lootChest02Id = objectId
		
	end
	
end

--Boss Clone swapping
local bossCloneStateObjects = orderedTable()
	bossCloneStateObjects["CLONE_SLAIN"	] = { state = BossCloneState.Hostile, dbr = "records/creatures/enemies/special/clone_a01.dbr" }
	bossCloneStateObjects[""					 	] = { state = BossCloneState.Default, dbr = "records/creatures/npcs/questnpcs/interactiveobjects/npc_endofareaplaceholder_05.dbr" }

local function CharacterCreateArgs()

	local averageLevel = Game.GetAveragePlayerLevel()
	local monsterLevel = 0
	local minLevel = 85
	local maxLevel = 200

	
	if (averageLevel < minLevel) then
		monsterLevel = ((minLevel+(minLevel/50))+4)
	elseif (averageLevel > maxLevel) then
		monsterLevel = ((maxLevel+(maxLevel/50))+4)
	else
		monsterLevel = ((averageLevel+(averageLevel/50))+4)

	end

	return monsterLevel, nil
	
end

function gd.quests.areaDNPCClone.bossCloneOnAddToWorld(objectId)
	
	if Server then
		if (not spawnedBoss) then
			bossCloneId = objectId
	
			local userdata = {}
			local didWork, newState = TokenStateBasedObjectSwap(objectId, userdata, bossCloneStateObjects, Character, CharacterCreateArgs)
	
			Shared.setUserdata(objectId, userdata)
	
			-- Don't respawn Clone next time. If spawned as hostile, will be saved into the world
			if (newState == BossCloneState.Hostile) then
				spawnedBoss = true
				
			end
			
		end
	
	end
	
end

gd.quests.areaDNPCClone.bossCloneOnDestroy = ClearObjectUserdata

function gd.quests.areaDNPCClone.hostileSwitch()
	
	if Server then
		if not spawnedBoss then
			spawnedBoss = true

			local MPOverrideDbr = "records/creatures/enemies/special/clone_a01.dbr"
			local MPOverrideState = true

			UpdateObjectSwap(bossCloneId, bossCloneStateObjects, Character, CharacterCreateArgs, MPOverrideState, MPOverrideDbr)

		end
	
	end

end



-- Dialogue Clones along the path to final one, despawned on dialogue or crossing trigger volume. Do not respawn once final clone is killed
local clonePortal= { false, false, false, false }
local cloneId = { 0, 0, 0, 0 }

local CloneState = { Default = 0, Despawned = 1 }

local clone01StateObjects = orderedTable()
	clone01StateObjects["CLONE_SLAIN"	] = { state = CloneState.Despawned, dbr = nil }
	clone01StateObjects[""					 	] = { state = CloneState.Default, dbr = "records/creatures/npcs/questnpcs/interactiveobjects/npc_endofareaplaceholder_01.dbr" }


function gd.quests.areaDNPCClone.clone01OnAddToWorld(objectId)
	
	if Server then
		if (clonePortal[1] == false) then
			cloneId[1] = objectId
	
			local userdata = {}
			local didWork, newState = TokenStateBasedObjectSwap(objectId, userdata, clone01StateObjects, Character, CharacterCreateArgs)
	
			Shared.setUserdata(objectId, userdata)
			
		end
	
	end
	
end

local clone02StateObjects = orderedTable()
	clone02StateObjects["CLONE_SLAIN"	] = { state = CloneState.Despawned, dbr = nil }
	clone02StateObjects[""					 	] = { state = CloneState.Default, dbr = "records/creatures/npcs/questnpcs/interactiveobjects/npc_endofareaplaceholder_02.dbr" }

function gd.quests.areaDNPCClone.clone02OnAddToWorld(objectId)
	
	if Server then
		if (clonePortal[2] == false) then
			cloneId[2] = objectId
	
			local userdata = {}
			local didWork, newState = TokenStateBasedObjectSwap(objectId, userdata, clone02StateObjects, Character, CharacterCreateArgs)
	
			Shared.setUserdata(objectId, userdata)
			
		end
	
	end
	
end

local clone03StateObjects = orderedTable()
	clone03StateObjects["CLONE_SLAIN"	] = { state = CloneState.Despawned, dbr = nil }
	clone03StateObjects[""					 	] = { state = CloneState.Default, dbr = "records/creatures/npcs/questnpcs/interactiveobjects/npc_endofareaplaceholder_03.dbr" }

function gd.quests.areaDNPCClone.clone03OnAddToWorld(objectId)
	
	if Server then
		if (clonePortal[3] == false) then
			cloneId[3] = objectId
	
			local userdata = {}
			local didWork, newState = TokenStateBasedObjectSwap(objectId, userdata, clone03StateObjects, Character, CharacterCreateArgs)
	
			Shared.setUserdata(objectId, userdata)
			
		end
	
	end
	
end

local clone04StateObjects = orderedTable()
	clone04StateObjects["CLONE_SLAIN"	] = { state = CloneState.Despawned, dbr = nil }
	clone04StateObjects[""					 	] = { state = CloneState.Default, dbr = "records/creatures/npcs/questnpcs/interactiveobjects/npc_endofareaplaceholder_04.dbr" }

function gd.quests.areaDNPCClone.clone04OnAddToWorld(objectId)
	
	if Server then
		if (clonePortal[4] == false) then
			cloneId[4] = objectId

			local userdata = {}
			local didWork, newState = TokenStateBasedObjectSwap(objectId, userdata, clone04StateObjects, Character, CharacterCreateArgs)
	
			Shared.setUserdata(objectId, userdata)
			
		end
	
	end
	
end

gd.quests.areaDNPCClone.cloneOnDestroy = ClearObjectUserdata

function gd.quests.areaDNPCClone.clone01Portal()

	if Server then
		if clonePortal[1] == false then
			clonePortal[1] = true

			local clone = Entity.Get(cloneId[1])
			local MPOverrideDbr = nil
			local MPOverrideState = true
		
			if (clone != nil) then
				local coords = clone:GetCoords()	
				local rift = Entity.Create("records/fx/ui/riftgatepersonalopen_fxpak.dbr")
			
				if (rift != nil) then
					rift:NetworkEnable()
					rift:SetCoords(coords)
				end
			
				UpdateObjectSwap(cloneId[1], clone01StateObjects, nil, nil, MPOverrideState, MPOverrideDbr)
			
			end
		
		end
		
	end
	
end

function gd.quests.areaDNPCClone.clone02Portal()

	if Server then
		if clonePortal[2] == false then
			clonePortal[2] = true

			local clone = Entity.Get(cloneId[2])
			local MPOverrideDbr = nil
			local MPOverrideState = true
		
			if (clone != nil) then
				local coords = clone:GetCoords()	
				local rift = Entity.Create("records/fx/ui/riftgatepersonalopen_fxpak.dbr")
			
				if (rift != nil) then
					rift:NetworkEnable()
					rift:SetCoords(coords)
				end
			
				UpdateObjectSwap(cloneId[2], clone02StateObjects, nil, nil, MPOverrideState, MPOverrideDbr)
			
			end
		
		end
		
	end
	
end

function gd.quests.areaDNPCClone.clone03Portal()

	if Server then
		if clonePortal[3] == false then
			clonePortal[3] = true

			local clone = Entity.Get(cloneId[3])
			local MPOverrideDbr = nil
			local MPOverrideState = true
		
			if (clone != nil) then
				local coords = clone:GetCoords()	
				local rift = Entity.Create("records/fx/ui/riftgatepersonalopen_fxpak.dbr")
			
				if (rift != nil) then
					rift:NetworkEnable()
					rift:SetCoords(coords)
				end
			
				UpdateObjectSwap(cloneId[3], clone03StateObjects, nil, nil, MPOverrideState, MPOverrideDbr)
			
			end
		
		end
		
	end
	
end

function gd.quests.areaDNPCClone.clone04Portal()

	if Server then
		if clonePortal[4] == false then
			clonePortal[4] = true

			local clone = Entity.Get(cloneId[4])
			local MPOverrideDbr = nil
			local MPOverrideState = true
		
			if (clone != nil) then
				local coords = clone:GetCoords()	
				local rift = Entity.Create("records/fx/ui/riftgatepersonalopen_fxpak.dbr")
			
				if (rift != nil) then
					rift:NetworkEnable()
					rift:SetCoords(coords)
				end
			
				UpdateObjectSwap(cloneId[4], clone04StateObjects, nil, nil, MPOverrideState, MPOverrideDbr)
			
			end
		
		end
		
	end
	
end


-- Trigger Volumes if player skips the npc and walks past, despawns the NPC
function gd.quests.areaDNPCClone.clone01Triggered(triggererId)

	QuestEvent("clone01Portal")
	
end

function gd.quests.areaDNPCClone.clone02Triggered(triggererId)

	QuestEvent("clone02Portal")
	
end

function gd.quests.areaDNPCClone.clone03Triggered(triggererId)

	QuestEvent("clone03Portal")
	
end

function gd.quests.areaDNPCClone.clone04Triggered(triggererId)

	QuestEvent("clone04Portal")
	
end


-- Spawn Control for NPC at Ritual Site
local ritualNPCId = 0
local ritualRevealed = false

local RitualNPCState = { Default = 0, Spawned = 1, Finished = 2 }

local ritualNPCStateObjects = orderedTable()
	ritualNPCStateObjects["SECRET_OPEN"	] = { state = RitualNPCState.Finished, dbr = nil }
	ritualNPCStateObjects["SECRET_REVEALED"	] = { state = RitualNPCState.Spawned, dbr = "records/creatures/npcs/questnpcs/interactiveobjects/npc_secretritual_01.dbr" }
	ritualNPCStateObjects[""					 	] = { state = RitualNPCState.Default, dbr = nil }


function gd.quests.areaDNPCClone.ritualNPCOnAddToWorld(objectId)
	
	if Server then
		if Game.GetGameDifficulty() == Game.Difficulty.Legendary then
			ritualNPCId = objectId

			local userdata = {}
			TokenStateBasedObjectSwap(objectId, userdata, ritualNPCStateObjects)

			Shared.setUserdata(objectId, userdata)
		
		end
	
	end
	
end

gd.quests.areaDNPCClone.ritualNPCOnDestroy = ClearObjectUserdata


function gd.quests.areaDNPCClone.ritualFound(triggererId)

	QuestEvent("secretRitualReveal")
	
end

function gd.quests.areaDNPCClone.revealRitual()
	
	if Server then
		if Game.GetGameDifficulty() == Game.Difficulty.Legendary then
			local player = Game.GetLocalPlayer()
			
			if (player:HasToken("SECRET_REVEALED") == false && ritualRevealed == false) then
			
				if (player:HasItem("records/storyelements/questitems/secretritual_01.dbr", 1, false) && player:HasItem("records/storyelements/questitems/secretritual_02.dbr", 1, false) && player:HasItem("records/storyelements/questitems/secretritual_03.dbr", 1, false) && player:HasItem("records/items/gearweapons/swords1h/d010_sword.dbr", 1, false)) then
					ritualRevealed = true
					GiveTokenToLocalPlayer("SECRET_REVEALED")
					
					local npc = Entity.Get(ritualNPCId)
					
					if npc != nil then
						local coords = npc:GetCoords()
						local rift = Entity.Create("records/fx/ui/riftgateghostlyopen_fx02pak.dbr")
					
						if (rift != nil) then
							rift:NetworkEnable()
							rift:SetCoords(coords)
						
						end
						
						UpdateObjectSwap(ritualNPCId, ritualNPCStateObjects)
				
					end

				end

			end
		
		end
	
	end

end


-- Dungeon Entrance Control
local entranceRift = 0
local dungeonOpen = false

function gd.quests.areaDNPCClone.entranceRiftOnAddToWorld(objectId)
	
	if Server then
		entranceRift = objectId
		
		local player = Game.GetLocalPlayer()
		
		if (Game.GetGameDifficulty() == Game.Difficulty.Legendary && (player:HasToken("SECRET_OPEN") || dungeonOpen)) then
			local door = Door.Get(objectId)
		
			if door ~= nil then
				door:SetLocked(false)
				door:Open()

			end
		
		end
		
	end
	
end

function gd.quests.areaDNPCClone.openDungeon()

	if Server then
		local door = Door.Get(entranceRift)
		local npc = Entity.Get(ritualNPCId)
		
		GiveTokenToLocalPlayer("SECRET_OPEN")
		dungeonOpen = true
		
		-- Unlock the secret dungeon
		if door ~= nil then
			door:SetLocked(false)
			door:Open()
		end
		
		-- Despawn Ghost
		if npc != nil then
			local coords = npc:GetCoords()
			local rift = Entity.Create("records/fx/ui/riftgateghostlyopen_fx02pak.dbr")
		
			if (rift != nil) then
				rift:NetworkEnable()
				rift:SetCoords(coords)
			
			end
			
			UpdateObjectSwap(ritualNPCId, ritualNPCStateObjects)
	
		end
		
	end
	
end


-- Secret Location Controls
function gd.quests.areaDNPCClone.secretSpot01Found(triggererId)
	local player = Player.Get(triggererId)
	
	if Game.GetGameDifficulty() == Game.Difficulty.Legendary then
		if (player:HasToken("SECRET_REVEALED") == false && player:HasToken("SECRET_OPEN") == false && player:HasItem("records/storyelements/questitems/secretritual_01.dbr", 1, false) == false) then
			if (player:HasItem("records/items/gearweapons/swords1h/d010_sword.dbr", 1, false)) then
			
				if (player:IsSpaceAvailable("records/storyelements/questitems/secretritual_01.dbr")) then
					UI.Notify("tagNotification_WarningSecret01")
					player:GiveItem("records/storyelements/questitems/secretritual_01.dbr", 1, false)
				
				end
				
			end

		end
		
	end
	
end

function gd.quests.areaDNPCClone.secretSpot02Found(triggererId)
	local player = Player.Get(triggererId)
	
	if Game.GetGameDifficulty() == Game.Difficulty.Legendary then
		if (player:HasToken("SECRET_REVEALED") == false && player:HasToken("SECRET_OPEN") == false && player:HasItem("records/storyelements/questitems/secretritual_02.dbr", 1, false) == false) then
			if (player:HasItem("records/storyelements/questitems/secretritual_01.dbr", 1, false) && player:HasItem("records/items/gearweapons/swords1h/d010_sword.dbr", 1, false)) then
	
				if (player:IsSpaceAvailable("records/storyelements/questitems/secretritual_02.dbr")) then
					UI.Notify("tagNotification_WarningSecret02")
					player:GiveItem("records/storyelements/questitems/secretritual_02.dbr", 1, false)
				
				end
				
			end

		end
		
	end
	
end

function gd.quests.areaDNPCClone.secretSpot03Found(triggererId)
	local player = Player.Get(triggererId)
	
	if Game.GetGameDifficulty() == Game.Difficulty.Legendary then
		if (player:HasToken("SECRET_REVEALED") == false && player:HasToken("SECRET_OPEN") == false && player:HasItem("records/storyelements/questitems/secretritual_03.dbr", 1, false) == false) then
			if (player:HasItem("records/storyelements/questitems/secretritual_01.dbr", 1, false) && player:HasItem("records/storyelements/questitems/secretritual_02.dbr", 1, false) && player:HasItem("records/items/gearweapons/swords1h/d010_sword.dbr", 1, false)) then

				if (player:IsSpaceAvailable("records/storyelements/questitems/secretritual_03.dbr")) then
					UI.Notify("tagNotification_WarningSecret03")
					player:GiveItem("records/storyelements/questitems/secretritual_03.dbr", 1, false)
				
				end
				
			end

		end
		
	end
	
end


-- Door to Clone Level Control
local secretDoorId = 0
local secretOpened = false

function gd.quests.areaDNPCClone.secretDoorOnAddToWorld(objectId)

	if Server then
		secretDoorId = objectId;
		
		if (secretOpened) then
			local door = Door.Get(objectId)
		
			if door ~= nil then
				door:SetLocked(false)
				door:Open()

			end
		
		end
		
	end
	
end

function gd.quests.areaDNPCClone.openSecret()

	if Server && not secretOpened then
		secretOpened = true
		local door = Door.Get(secretDoorId)
		
		
		if ((door != nil) && (door:IsLocked())) then
			door:SetLocked(false)
			door:Open()
			
		end
	
	end
	
end

-- No Riftgate region warning trigger
local riftgatesWarning = false

function gd.quests.areaDNPCClone.warningNoRiftgates(triggererId)

	local player = Player.Get(triggererId)

	if (player != nil) && not riftgatesWarning then
		UI.Notify("tagNotification_WarningRiftgateDisabled")
		riftgatesWarning = true
		
	end
	
end
