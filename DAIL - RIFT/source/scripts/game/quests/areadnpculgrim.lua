/*
	
	GRIM DAWN
	
	For more information, visit us at http://www.grimdawn.com
	
*/

gd.quests.areaDNPCUlgrim = {}

--
-- Ulgrim movement in Act 4
--
-- Ulgrim starts off in the Legion Fort
-- Then moves to Necropolis
-- He finishes at the final boss
--

local ulgrimFortId = 0
local ulgrimNecropolisId = 0

local UlgrimState = { Default = 0, Fort = 1, Necropolis = 2, Boss = 3, Finished = 4 }

-- Ulgrim in Fort
local fortUlgrimStateObjects = orderedTable();
	fortUlgrimStateObjects["ULGRIM_FINISHED"] = { state = UlgrimState.Finished,  dbr = nil }
	fortUlgrimStateObjects["ULGRIM_BOSS"] = { state = UlgrimState.Boss,  dbr = nil }
	fortUlgrimStateObjects["ULGRIM_NECROPOLIS"] = { state = UlgrimState.Necropolis,  dbr = nil }
	fortUlgrimStateObjects["ULGRIM_AREAD"] = { state = UlgrimState.Fort,  dbr = "records/creatures/npcs/questnpcs/gdaread/npc_ulgrim_05.dbr" }
	fortUlgrimStateObjects[""]			= { state = UlgrimState.Default,  dbr = nil }
	
function gd.quests.areaDNPCUlgrim.fortUlgrimOnAddToWorld(objectId)

	if Server then
	
		ulgrimFortId = objectId;
		
		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, fortUlgrimStateObjects);
		Shared.setUserdata(objectId, userdata);
		
	end
	
end

gd.quests.areaDNPCUlgrim.fortUlgrimOnDestroy = ClearObjectUserdata

-- Ulgrim in Necropolis
local necropolisUlgrimStateObjects = orderedTable();
	necropolisUlgrimStateObjects["ULGRIM_FINISHED"] = { state = UlgrimState.Finished,  dbr = nil }
	necropolisUlgrimStateObjects["ULGRIM_BOSS"] = { state = UlgrimState.Boss,  dbr = nil }
	necropolisUlgrimStateObjects["ULGRIM_NECROPOLIS"] = { state = UlgrimState.Necropolis,  dbr = "records/creatures/npcs/questnpcs/gdaread/npc_ulgrim_06.dbr" }
	necropolisUlgrimStateObjects[""]			= { state = UlgrimState.Default,  dbr = nil }
	
function gd.quests.areaDNPCUlgrim.necropolisUlgrimOnAddToWorld(objectId)

	if Server then
		QuestGlobalEvent("b28Hotfix")
	
		ulgrimNecropolisId = objectId;
		
		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, necropolisUlgrimStateObjects);
		Shared.setUserdata(objectId, userdata);
		
	end
	
end

gd.quests.areaDNPCUlgrim.necropolisUlgrimOnDestroy = ClearObjectUserdata

-- Called by quest, teleports Ulgrim to Act 4
local ulgrimAreaDPortal = false

function gd.quests.areaDNPCUlgrim.areaDPortal()

	if Server then
		local player = Game.GetLocalPlayer()
		
		if player:HasToken("AREAD_BASE") == false && player:HasToken("ULGRIM_AREAD") && ulgrimAreaDPortal == false then
			ulgrimAreaDPortal = true

			local ulgrimFort = Entity.Get(ulgrimFortId)
		
			if (ulgrimFort != nil) then
		
				local coords = ulgrimFort:GetCoords()	
				local rift = Entity.Create("records/fx/ui/riftgatepersonalopen_fxpak.dbr")
			
				if (rift != nil) then
					rift:NetworkEnable()
					rift:SetCoords(coords)
				end
			
				UpdateObjectSwap(ulgrimFortId, fortUlgrimStateObjects)
			
			end
		
		end
		
	end
	
end

-- Called by quest, teleports Ulgrim to Necropolis from Fort
local ulgrimNecropolisPortal = false

function gd.quests.areaDNPCUlgrim.necropolisPortal()

	if Server then
		local player = Game.GetLocalPlayer()
		
		if player:HasToken("ULGRIM_NECROPOLIS") && ulgrimNecropolisPortal == false then
			ulgrimNecropolisPortal = true

			local ulgrimFort = Entity.Get(ulgrimFortId)
			local ulgrimNecropolis = Entity.Get(ulgrimNecropolisId)
		
			if (ulgrimFort != nil) then
		
				local coords = ulgrimFort:GetCoords()	
				local rift = Entity.Create("records/fx/ui/riftgatepersonalopen_fxpak.dbr")
			
				if (rift != nil) then
					rift:NetworkEnable()
					rift:SetCoords(coords)
				end
			
				UpdateObjectSwap(ulgrimFortId, fortUlgrimStateObjects)
			
			end
			
			if (ulgrimNecropolis != nil) then
		
				coords = ulgrimNecropolis:GetCoords()	
				rift = Entity.Create("records/fx/ui/riftgatepersonalopen_fxpak.dbr")
			
				if (rift != nil) then
					rift:NetworkEnable()
					rift:SetCoords(coords)
				end
			
				UpdateObjectSwap(ulgrimNecropolisId, necropolisUlgrimStateObjects)
			
			end
		
		end
		
	end
	
end


-- Called by quest, teleports Ulgrim to Boss from Necropolis
local ulgrimBossPortal = false

function gd.quests.areaDNPCUlgrim.bossPortal()

	if Server then
		local player = Game.GetLocalPlayer()
		
		gd.quests.areaDQuestBaneOfCairn.unlockBossCryptDoor()
		
		if player:HasToken("ULGRIM_BOSS") && ulgrimBossPortal == false then
			ulgrimBossPortal = true

			local ulgrimNecropolis = Entity.Get(ulgrimNecropolisId)
		
			if (ulgrimNecropolis != nil) then
		
				local coords = ulgrimNecropolis:GetCoords()	
				local rift = Entity.Create("records/fx/ui/riftgatepersonalopen_fxpak.dbr")
			
				if (rift != nil) then
					rift:NetworkEnable()
					rift:SetCoords(coords)
				end
			
				UpdateObjectSwap(ulgrimNecropolisId, necropolisUlgrimStateObjects)
			
			end
		
		end
		
	end
	
end

