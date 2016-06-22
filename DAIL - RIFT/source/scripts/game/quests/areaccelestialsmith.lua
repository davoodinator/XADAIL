/*
	
	GRIM DAWN
	
	For more information, visit us at http://www.grimdawn.com
	
*/

gd.quests.areaCCelestialSmith = {}

--
-- Special Smith that only spawns on Elite/Ultimate difficulty
--

function gd.quests.areaCCelestialSmith.smithOnAddToWorld(objectId)

	if Server then
		if (Game.GetGameDifficulty() == Game.Difficulty.Epic || Game.GetGameDifficulty() == Game.Difficulty.Legendary) then
			local coords = Entity.Get(objectId):GetCoords()
			local spawn = Entity.Create("records/creatures/npcs/merchants/blacksmithb02.dbr")
			spawn:SetCoords(coords)
		end
	
	end
	
end