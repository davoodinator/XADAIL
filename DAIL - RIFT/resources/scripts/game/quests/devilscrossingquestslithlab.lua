/*
	
	GRIM DAWN
	
	For more information, visit us at http://www.grimdawn.com
	
*/

gd.quests.devilsCrossingQuestSlithLab = {}


local bossId = 0
local bossCoords = nil

function gd.quests.devilsCrossingQuestSlithLab.bossOnAddToWorld(objectId)

	if Server then
		bossId = objectId
		bossCoords = Entity.Get(objectId):GetCoords()
	
	end

end

function gd.quests.devilsCrossingQuestSlithLab.bossLeaveRoom()

	if Server then
		-- Teleport boss back to spawn point if he is somehow kited out of boss room
		local bossEntity = Character.Get(bossId)
		local coords = bossEntity:GetCoords()
		local rift = Entity.Create("records/fx/ui/riftgatepersonalopen_fxpak.dbr")

		if (rift != nil) then
			rift:NetworkEnable()
			rift:SetCoords(coords)
		end
		
		bossEntity:SetCoords(bossCoords)
	
	end


end

-- Boss Door Control
local bossDoorEnter = 0
local bossDoorExit = 0

function gd.quests.devilsCrossingQuestSlithLab.bossDoorEnterOnAddToWorld(objectId)
	
	if Server then
		bossDoorEnter = objectId
		
	end
	
end

function gd.quests.devilsCrossingQuestSlithLab.bossDoorExitOnAddToWorld(objectId)

	if Server then
		bossDoorExit = objectId

	end
	
end

function gd.quests.devilsCrossingQuestSlithLab.bossDoorOpen()
	
	if Server then
		local door01 = Door.Get(bossDoorEnter)	
		local door02 = Door.Get(bossDoorExit)
	
		if door01 ~= nil then
			door01:Open()
		
		end
	
		if door02 ~= nil then
			door02:Open()
		
		end
		
	end

end


-- Lab Door Control
local labDoorId = 0
local labDoorQuestActive = false

function gd.quests.devilsCrossingQuestSlithLab.cellarDoorOnAddToWorld(objectId)

	if Server then
	
		labDoorId = objectId;
		
		local door = Door.Get(objectId)
		local player = Game.GetLocalPlayer()

		-- unlocks door if Server has required reputation or if player in session accepted the required quest
		if (player:GetFaction("SURVIVORS") >= 10000 || labDoorQuestActive) then
			-- Player already unlocked this door
			door:SetLocked(false)
		end
		
	end
		
end

function gd.quests.devilsCrossingQuestSlithLab.openDoor()

	-- If door is loaded and player accepts the quest to open it
	if Server then
		local door = Door.Get(labDoorId)
		labDoorQuestActive = true
			
		if ((door != nil) && (door:IsLocked())) then
			door:SetLocked(false)
			door:Open()
			
		end
		
	end
	
end

function gd.quests.devilsCrossingQuestSlithLab.cellarDoorOnInteract(objectId, userId)

	local player = Player.Get(userId)
	local door = Door.Get(objectId)
	
	-- unlock door if player has the required reputation
	if ((door != nil) && (door:IsLocked())) then
		if (player:GetFaction("SURVIVORS") >= 10000) then
			door:SetLocked(false)
			door:Open()
				
		end
		
	end
	
end


-- Dialogue Tokens
function gd.quests.devilsCrossingQuestSlithLab.gaveNotesGlobalMP()

GiveTokenToLocalPlayer("GD_SLITHNOTES_KASPAROV")

end

function gd.quests.devilsCrossingQuestSlithLab.keptNotesGlobalMP()

GiveTokenToLocalPlayer("GD_SLITHNOTES_KEPT")

end
