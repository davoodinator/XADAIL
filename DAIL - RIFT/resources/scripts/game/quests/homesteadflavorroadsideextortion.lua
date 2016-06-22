/*
	
	GRIM DAWN
	
	For more information, visit us at http://www.grimdawn.com
	
*/

gd.quests.homesteadFlavorRoadsideExtortion = {}

--
-- Helen and Julius start as dialogue npcs and swap to hostile if player does not cooperate
-- Can be saved and sent to DC through the correct dialogue options
--

local helenId = 0
local helenTownId = 0
local juliusId = 0
local juliusTownId = 0

--Toggles state of extortionists based on dialogue choices
local ExtortionState = { Saved = 0, Hostile = 1, Fooled = 2, Active = 3 }

--Helen Saved
local extortionHelenSavedStateObjects = orderedTable();
	extortionHelenSavedStateObjects["EXTORTION_SAVED"   ] = { state = ExtortionState.Saved,  dbr = "records/creatures/npcs/flavornpcs/homestead/npc_helenfletcher_02.dbr"}
	extortionHelenSavedStateObjects["EXTORTION_HOSTILE"] = { state = ExtortionState.Hostile, dbr = nil }
	extortionHelenSavedStateObjects["EXTORTION_FOOLED"] = { state = ExtortionState.Fooled, dbr = nil }
	extortionHelenSavedStateObjects[""	                    ] = { state = ExtortionState.Active,  dbr =  nil}
	
function gd.quests.homesteadFlavorRoadsideExtortion.extortionHelenSavedOnAddToWorld(objectId)
	
	if Server then
		helenTownId = objectId

		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, extortionHelenSavedStateObjects);
		Shared.setUserdata(objectId, userdata)
	
	end
	
end

gd.quests.homesteadFlavorRoadsideExtortion.extortionHelenSavedOnDestroy = ClearObjectUserdata


--Helen Active
local extortionHelenActiveStateObjects = orderedTable();
	extortionHelenActiveStateObjects["EXTORTION_SAVED"   ] = { state = ExtortionState.Saved,  dbr = nil }
	extortionHelenActiveStateObjects["EXTORTION_HOSTILE"] = { state = ExtortionState.Hostile, dbr = nil }
	extortionHelenActiveStateObjects["EXTORTION_FOOLED"] = { state = ExtortionState.Fooled, dbr = nil }
	extortionHelenActiveStateObjects[""	                    ] = { state = ExtortionState.Active,  dbr = "records/creatures/npcs/flavornpcs/homestead/npc_helenfletcher_01.dbr"}

function gd.quests.homesteadFlavorRoadsideExtortion.extortionHelenActiveOnAddToWorld(objectId)
	if Server then
		helenId = objectId
	
		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, extortionHelenActiveStateObjects);
		Shared.setUserdata(objectId, userdata)
	
	end
	
end

gd.quests.homesteadFlavorRoadsideExtortion.extortionHelenActiveOnDestroy = ClearObjectUserdata


--Julius Saved
local extortionJuliusSavedStateObjects = orderedTable();
	extortionJuliusSavedStateObjects["EXTORTION_SAVED"   ] = { state = ExtortionState.Saved,  dbr = "records/creatures/npcs/flavornpcs/homestead/npc_juliuscole_02.dbr"}
	extortionJuliusSavedStateObjects["EXTORTION_HOSTILE"] = { state = ExtortionState.Hostile, dbr = nil }
	extortionJuliusSavedStateObjects["EXTORTION_FOOLED"] = { state = ExtortionState.Fooled, dbr = nil }
	extortionJuliusSavedStateObjects[""	                    ] = { state = ExtortionState.Active,  dbr =  nil}
	
function gd.quests.homesteadFlavorRoadsideExtortion.extortionJuliusSavedOnAddToWorld(objectId)
	if Server then
		juliusTownId = objectId
	
		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, extortionJuliusSavedStateObjects);
		Shared.setUserdata(objectId, userdata);
	
	end
	
end

gd.quests.homesteadFlavorRoadsideExtortion.extortionJuliusSavedOnDestroy = ClearObjectUserdata


--Julius Active
local extortionJuliusActiveStateObjects = orderedTable();
	extortionJuliusActiveStateObjects["EXTORTION_SAVED"   ] = { state = ExtortionState.Saved,  dbr = nil }
	extortionJuliusActiveStateObjects["EXTORTION_HOSTILE"] = { state = ExtortionState.Hostile, dbr = nil }
	extortionJuliusActiveStateObjects["EXTORTION_FOOLED"] = { state = ExtortionState.Fooled, dbr = nil }
	extortionJuliusActiveStateObjects[""	                    ] = { state = ExtortionState.Active,  dbr = "records/creatures/npcs/flavornpcs/homestead/npc_juliuscole_01.dbr"}

function gd.quests.homesteadFlavorRoadsideExtortion.extortionJuliusActiveOnAddToWorld(objectId)
	if Server then
		juliusId = objectId
	
		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, extortionJuliusActiveStateObjects);
		Shared.setUserdata(objectId, userdata);
	
	end
	
end

gd.quests.homesteadFlavorRoadsideExtortion.extortionJuliusActiveOnDestroy = ClearObjectUserdata


--Triggered by conversation. Hostile Swap: non-standard hostile swap as the NPCs do not remain hostile on subsequent playthroughs. One-shot hostile NPCs that never spawn again.
local extortionHostileSwap = false

function gd.quests.homesteadFlavorRoadsideExtortion.hostileSwitchGlobalMP()

	local player = Game.GetLocalPlayer()
	
	if (player != nil && player:HasToken("EXTORTION_HOSTILE") == false && player:HasToken("EXTORTION_SAVED") == false) then
		player:GiveToken("EXTORTION_HOSTILE")
		
		if player:HasToken("EXTORTION_FOOLED") then
			player:RemoveToken("EXTORTION_FOOLED")
		
		end

	end

end

function gd.quests.homesteadFlavorRoadsideExtortion.hostileSwitch()

	if Server then
		if not extortionHostileSwap then
			extortionHostileSwap = true
			local helenCoords = Entity.Get(helenId):GetCoords()
			local juliusCoords = Entity.Get(juliusId):GetCoords()
	
			QuestGlobalEvent("extortionHostileSwapToken")
			
			UpdateObjectSwap(helenId, extortionHelenActiveStateObjects)
			UpdateObjectSwap(juliusId, extortionJuliusActiveStateObjects)

			local helenHostile = Character.Create("records/creatures/enemies/boss&quest/roadsideextortion_helenfletcher_01.dbr", 0, helenCoords.origin)
			if helenHostile != nil then
				helenHostile:SetCoords(helenCoords)
				
			end

			local juliusHostile = Character.Create("records/creatures/enemies/boss&quest/roadsideextortion_juliuscole_01.dbr", 0, juliusCoords.origin)
			if juliusHostile != nil then
				juliusHostile:SetCoords(juliusCoords)
				
			end
		
		end
	
	end

end

--Triggered by conversations. Swaps npcs in world with npcs in town.
local  extortionPortal = false

function gd.quests.homesteadFlavorRoadsideExtortion.fooledGlobalMP()

	local player = Game.GetLocalPlayer()
	
	if (player != nil && player:HasToken("EXTORTION_HOSTILE") == false && player:HasToken("EXTORTION_SAVED") == false && player:HasToken("EXTORTION_FOOLED") == false) then
		player:GiveToken("EXTORTION_FOOLED")

	end

end

function gd.quests.homesteadFlavorRoadsideExtortion.PortalGlobalMP()

	local player = Game.GetLocalPlayer()
	
	if (player != nil && player:HasToken("EXTORTION_HOSTILE") == false && player:HasToken("EXTORTION_SAVED") == false) then
		player:GiveToken("EXTORTION_SAVED")
		player:RemoveToken("EXTORTION_FOOLED")

	end

end

function gd.quests.homesteadFlavorRoadsideExtortion.Portal()

	if Server then
		if not extortionPortal then
			extortionPortal = true
			local helenActive = Entity.Get(helenId)
			local helenSavedDestination = Entity.Get(helenTownId)
			local juliusActive = Entity.Get(juliusId)
			local juliusSavedDestination = Entity.Get(juliusTownId)
			
			QuestGlobalEvent("extortionPortalToken")
	
			if helenActive != nil then
				local helenCoords = helenActive:GetCoords();
				local helenRiftStart = Entity.Create("records/fx/ui/riftgatepersonalopen_fxpak.dbr")
		
				if helenRiftStart != nil then
					helenRiftStart:NetworkEnable()
					helenRiftStart:SetCoords(helenCoords)
					
				end
		
				UpdateObjectSwap(helenId, extortionHelenActiveStateObjects)
			end
		
			if helenSavedDestination != nil then
				local helenDestinationCoords = helenSavedDestination:GetCoords()
				local helenRiftEnd = Entity.Create("records/fx/ui/riftgatepersonalopen_fxpak.dbr")

				if helenRiftEnd != nil then
					helenRiftEnd:NetworkEnable()
					helenRiftEnd:SetCoords(helenDestinationCoords)
					
				end
		
				UpdateObjectSwap(helenTownId, extortionHelenSavedStateObjects)

			end
	
			if juliusActive != nil then
				local juliusCoords = juliusActive:GetCoords();
				local juliusRiftStart = Entity.Create("records/fx/ui/riftgatepersonalopen_fxpak.dbr")
		
				if juliusRiftStart != nil then
					juliusRiftStart:NetworkEnable()
					juliusRiftStart:SetCoords(juliusCoords)
					
				end
		
				UpdateObjectSwap(juliusId, extortionJuliusActiveStateObjects)
			end
		
			if juliusSavedDestination != nil then
				local juliusDestinationCoords = juliusSavedDestination:GetCoords()
				local juliusRiftEnd = Entity.Create("records/fx/ui/riftgatepersonalopen_fxpak.dbr")

				if juliusRiftEnd != nil then
					juliusRiftEnd:NetworkEnable()
					juliusRiftEnd:SetCoords(juliusDestinationCoords)
				end
		
				UpdateObjectSwap(juliusTownId, extortionJuliusSavedStateObjects)
				
			end
			
		end
		
	end
	
end
