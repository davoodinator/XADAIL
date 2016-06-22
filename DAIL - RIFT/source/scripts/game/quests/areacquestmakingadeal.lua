/*
	
	GRIM DAWN
	
	For more information, visit us at http://www.grimdawn.com
	
*/

gd.quests.areaCQuestMakingADeal = {}

function gd.quests.areaCQuestMakingADeal.spawnFood()

end

--
-- Spawn Food piles in DC
--
local food01Id = 0
local food02Id = 0
local foodSpawned = false

local FoodState = { Default = 0, Finished = 1 }

local foodOneStateObjects = orderedTable()
	foodOneStateObjects["DC_FOOD"] = { state = FoodState.Finished,  dbr = "records/storyelements/questassets/dc_foodpile_floor1.dbr" };
	foodOneStateObjects[""]					   = { state = FoodState.Default, dbr = "records/storyelements/questassets/dc_foodpile_floor1wrecked.dbr" };

function gd.quests.areaCQuestMakingADeal.foodOneOnAddToWorld(objectId)

	if Server then
		food01Id = objectId
		
		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, foodOneStateObjects);
	
		Shared.setUserdata(objectId, userdata);
		
	end
	
end

gd.quests.areaCQuestMakingADeal.foodOneOnDestroy = ClearObjectUserdata


local foodTwoStateObjects = orderedTable()
	foodTwoStateObjects["DC_FOOD"] = { state = FoodState.Finished,  dbr = "records/storyelements/questassets/dc_foodpile_floor2.dbr" };
	foodTwoStateObjects[""]					   = { state = FoodState.Default, dbr = "records/storyelements/questassets/dc_foodpile_floor2wrecked.dbr" };

function gd.quests.areaCQuestMakingADeal.foodTwoOnAddToWorld(objectId)

	if Server then
		food02Id = objectId
		
		local userdata = {};
		TokenStateBasedObjectSwap(objectId, userdata, foodTwoStateObjects);
	
		Shared.setUserdata(objectId, userdata);
		
	end
	
end

gd.quests.areaCQuestMakingADeal.foodTwoOnDestroy = ClearObjectUserdata


function gd.quests.areaCQuestMakingADeal.spawnFood()

	if Server then
		local player = Game.GetLocalPlayer()
		
		if (player:HasToken("DC_FOOD") && foodSpawned == false) then
			foodSpawned = true
			
			local food01 = Entity.Get(food01Id)
			local food02 = Entity.Get(food02Id)

			if (food01 != nil) then
				local coords01 = food01:GetCoords()
				local pfx01 = Entity.Create("records/fx/general/genericrepair_fxpak01.dbr")
			
				if (pfx01 != nil) then
					pfx01:NetworkEnable()
					pfx01:SetCoords(coords01)
					
				end
		
				UpdateObjectSwap(food01Id, foodOneStateObjects)
			
			end
			
			if (food02 != nil) then
				local coords02 = food02:GetCoords()
				local pfx02 = Entity.Create("records/fx/general/genericrepair_fxpak01.dbr")
			
				if (pfx02 != nil) then
					pfx02:NetworkEnable()
					pfx02:SetCoords(coords02)
					
				end
		
				UpdateObjectSwap(food02Id, foodTwoStateObjects)
			
			end
		
		end
		
	end

end
