/*
	
	GRIM DAWN
	
	For more information, visit us at http://www.grimdawn.com
	
*/

gd.quests.areaCQuestZealots = {}


-- Cultist Captains
function gd.quests.areaCQuestZealots.captain01Killed()

	GiveTokenToLocalPlayer("AREAC_CULTISTCAPTAIN01_KILLED")
	
end

function gd.quests.areaCQuestZealots.captain02Killed()

	GiveTokenToLocalPlayer("AREAC_CULTISTCAPTAIN02_KILLED")
	
end

-- Void Boss
function gd.quests.areaCQuestZealots.voidBossKilled()

	GiveTokenToLocalPlayer("AREAC_CHTHONICVOIDBOSS_KILLED")
	
end

-- Necro Boss
function gd.quests.areaCQuestZealots.necroBossKilled()

	GiveTokenToLocalPlayer("AREAC_NECROCAPTAIN_KILLED")
	
end


--
-- Zealot Champion
--
local championId = 0

local Champion = { Default = 0, Regular = 1, Finished = 2 }

local championStateObjects = orderedTable()
	championStateObjects["ZEALOT_CHAMPION_AREAD"]	= { state = Champion.Finished,  dbr = nil }
	championStateObjects["ZEALOT_CHAMPION_SPAWN"]	= { state = Champion.Regular,  dbr = "records/creatures/npcs/questnpcs/gdareac/npc_zealot_champion_01.dbr" }
	championStateObjects[""]					= { state = Champion.Default,   dbr = nil }
	
function gd.quests.areaCQuestZealots.championOnAddToWorld(objectId)
	
	if Server then
	
		QuestGlobalEvent("kymonChosenBountyReset")
		QuestGlobalEvent("factionResetToken")
		
		championId = objectId

		local userdata = {}
		TokenStateBasedObjectSwap(objectId, userdata, championStateObjects)
		Shared.setUserdata(objectId, userdata)
		
	end
	
end

gd.quests.areaCQuestZealots.championOnDestroy = ClearObjectUserdata

-- spawn Champion in base
local championSpawned = false

function gd.quests.areaCQuestZealots.spawnChampion()

	if Server then
		local player = Game.GetLocalPlayer()
	
		if not championSpawned && player:HasToken("ZEALOT_CHAMPION_SPAWN") then
			championSpawned = true
			local champion = Entity.Get(championId)
		
			if (champion != nil) then
				local coords = champion:GetCoords()
				local teleportStart = Entity.Create("records/fx/ui/riftgateghostlyopen_fx02pak.dbr")
			
				if (teleportStart != nil) then
					teleportStart:NetworkEnable()
					teleportStart:SetCoords(coords)
				
				end
		
				UpdateObjectSwap(championId, championStateObjects)
			
			end
		
		end
	
	end

end

-- teleport Champion to Necropolis
local championMoveToNecropolis = false

function gd.quests.areaCQuestZealots.swapChampion()

	if Server then
		local player = Game.GetLocalPlayer()
	
		if not championMoveToNecropolis && player:HasToken("ZEALOT_CHAMPION_AREAD") then
			championMoveToNecropolis = true
			local champion = Entity.Get(championId)
		
			if (champion != nil) then
				local coords = champion:GetCoords()
				local teleportStart = Entity.Create("records/fx/ui/riftgateghostlyopen_fx02pak.dbr")
			
				if (teleportStart != nil) then
					teleportStart:NetworkEnable()
					teleportStart:SetCoords(coords)
				
				end
		
				UpdateObjectSwap(championId, championStateObjects)
			
			end
		
		end
	
	end

end

--
-- Kymon's Secret
-- Unlocks access to an extra boss
--

-- Door control
local dungeonDoorId = 0
local dungeonLeverId = 0
local secretOpened = false

function gd.quests.areaCQuestZealots.dungeonDoorOnAddToWorld(objectId)

	if Server then
	
		dungeonDoorId = objectId
		
	end
		
end

function gd.quests.areaCQuestZealots.dungeonLeverOnAddToWorld(objectId)

	if Server then
	
		dungeonLeverId = objectId;
		
		local lever = Lever.Get(objectId)
		local player = Game.GetLocalPlayer()

		if (player:AnyoneHasToken("ZEALOT_FINALQUEST")) then
			-- Unlocks the lever for use, otherwise cannot be used to unlock door
			lever:SetLocked(false)
		end
		
	end
		
end

function gd.quests.areaCQuestZealots.unlockLever()

	if Server then
		local lever = Lever.Get(dungeonLeverId)
		
		if ((lever != nil) && (lever:IsLocked())) then
			lever:SetLocked(false)
			
		end
	
	end
	
end

function gd.quests.areaCQuestZealots.openDungeon()

	if Server && not secretOpened then
		secretOpened = true
		local door = Door.Get(dungeonDoorId)
		
		UI.Notify("tagNotification_AreaD_KymonSecret")
		
		if ((door != nil) && (door:IsLocked())) then
			door:SetLocked(false)
			door:Open()
			
		end
	
	end
	
end


-- Study Door Control
local studyDoorId = 0

function gd.quests.areaCQuestZealots.studyDoorOnAddToWorld(objectId)

	if Server then
	
		studyDoorId = objectId;
		
		local door = Door.Get(objectId)
		local player = Game.GetLocalPlayer()

		if (player:HasToken("ZEALOT_FINALQUEST_FINISHED")) then
			-- Player already unlocked this door
			door:SetLocked(false)
			door:Open()
		end
		
	end
		
end

function gd.quests.areaCQuestZealots.openStudy()

	if Server then
		local door = Door.Get(studyDoorId)
			
		if ((door != nil) && (door:IsLocked())) then
			door:SetLocked(false)
			door:Open()
			
		end
	
	end
	
end

