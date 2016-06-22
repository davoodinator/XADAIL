/*
	
	GRIM DAWN
	scripts/quests/devilscrossing.lua
	
	For more information, visit us at http://www.grimdawn.com
	
*/

gd.quests.devilsCrossingQuestRestoreDC = {}

--
-- Canopy / Blanket replacement in Devil's Crossing
--
local canopy01Id = 0
local canopy02Id = 0
local canopy03Id = 0


local DCState = { Destroyed = 0, Repaired = 1 }

local cellOneStateObjects = orderedTable()
	cellOneStateObjects["DC_REPAIRS_FABRIC"] = { state = DCState.Repaired,  dbr = "records/storyelements/questassets/dc_cellonearea.dbr" };
	cellOneStateObjects[""]					   = { state = DCState.Destroyed, dbr = "records/storyelements/questassets/dc_cellonearea_wrecked.dbr" };

function gd.quests.devilsCrossingQuestRestoreDC.cellOneOnAddToWorld(objectId)

	if Server then
		canopy01Id = objectId
		
		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, cellOneStateObjects);
	
		Shared.setUserdata(objectId, userdata);
		
	end
	
end

gd.quests.devilsCrossingQuestRestoreDC.cellOneOnDestroy = ClearObjectUserdata


local cellTwoStateObjects = orderedTable()
	cellTwoStateObjects["DC_REPAIRS_FABRIC"] = { state = DCState.Repaired,  dbr = "records/storyelements/questassets/dc_celltwoarea.dbr" };
	cellTwoStateObjects[""]					   = { state = DCState.Destroyed, dbr = "records/storyelements/questassets/dc_celltwoarea_wrecked.dbr" };

function gd.quests.devilsCrossingQuestRestoreDC.cellTwoOnAddToWorld(objectId)

	if Server then
		canopy02Id = objectId
		
		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, cellTwoStateObjects);
	
		Shared.setUserdata(objectId, userdata);
		
	end
	
end

gd.quests.devilsCrossingQuestRestoreDC.cellTwoOnDestroy = ClearObjectUserdata


local cellThreeStateObjects = orderedTable()
	cellThreeStateObjects["DC_REPAIRS_FABRIC"] = { state = DCState.Repaired,  dbr = "records/storyelements/questassets/dc_cellthreearea.dbr" };
	cellThreeStateObjects[""]					   = { state = DCState.Destroyed, dbr = "records/storyelements/questassets/dc_cellthreearea_wrecked.dbr" };

function gd.quests.devilsCrossingQuestRestoreDC.cellThreeOnAddToWorld(objectId)

	if Server then
		canopy03Id = objectId
		
		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, cellThreeStateObjects);
	
		Shared.setUserdata(objectId, userdata);
		
	end
	
end

gd.quests.devilsCrossingQuestRestoreDC.cellThreeOnDestroy = ClearObjectUserdata

local restoreDC = false

function gd.quests.devilsCrossingQuestRestoreDC.restoreCanopies()

	if Server then
		local player = Game.GetLocalPlayer()
		
		if (player:HasToken("DC_REPAIRS_FABRIC") && restoreDC == false) then
			restoreDC = true
			
			local canopy01 = Entity.Get(canopy01Id)
			local canopy02 = Entity.Get(canopy02Id)
			local canopy03 = Entity.Get(canopy03Id)

			if (canopy01 != nil) then
				local coords01 = canopy01:GetCoords()
				local pfx01 = Entity.Create("records/fx/general/genericrepair_fxpak01.dbr")
			
				if (pfx01 != nil) then
					pfx01:NetworkEnable()
					pfx01:SetCoords(coords01)
					
				end
		
				UpdateObjectSwap(canopy01Id, cellOneStateObjects)
			
			end
			
			if (canopy02 != nil) then
				local coords02 = canopy02:GetCoords()
				local pfx02 = Entity.Create("records/fx/general/bridgerepair_fxpak01.dbr")
			
				if (pfx02 != nil) then
					pfx02:NetworkEnable()
					pfx02:SetCoords(coords02)
					
				end
		
				UpdateObjectSwap(canopy02Id, cellTwoStateObjects)
			
			end
			
			if (canopy03 != nil) then
				local coords03 = canopy03:GetCoords()
				local pfx03 = Entity.Create("records/fx/general/genericrepair_fxpak01.dbr")
			
				if (pfx03 != nil) then
					pfx03:NetworkEnable()
					pfx03:SetCoords(coords03)
					
				end
		
				UpdateObjectSwap(canopy03Id, cellThreeStateObjects)
			
			end
		
		end
		
	end

end