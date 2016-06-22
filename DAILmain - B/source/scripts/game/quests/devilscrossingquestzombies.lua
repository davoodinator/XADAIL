/*
	
	GRIM DAWN
	
	For more information, visit us at http://www.grimdawn.com
	
*/

gd.quests.devilsCrossingQuestZombies = {}


--
-- Something for Nothing Zombies
--
function gd.quests.devilsCrossingQuestZombies.zombie01Killed()

	local player = Game.GetLocalPlayer()
	
	if (not player:HasToken("DC_SOMETHINGFORNOTHING_ALLKILLED")) then
		if (player != nil) then
			player:GiveToken("DC_SOMETHINGFORNOTHING01_KILLED")
			
		end
		
		if (player:HasToken("DC_SOMETHINGFORNOTHING01_KILLED") && player:HasToken("DC_SOMETHINGFORNOTHING02_KILLED") && player:HasToken("DC_SOMETHINGFORNOTHING03_KILLED")) then
			player:GiveToken("DC_SOMETHINGFORNOTHING_ALLKILLED")
			
		end
		
	end

end

function gd.quests.devilsCrossingQuestZombies.zombie02Killed()

	local player = Game.GetLocalPlayer()
	
	if (not player:HasToken("DC_SOMETHINGFORNOTHING_ALLKILLED")) then
		if (player != nil) then
			player:GiveToken("DC_SOMETHINGFORNOTHING02_KILLED")
			
		end
		
		if (player:HasToken("DC_SOMETHINGFORNOTHING01_KILLED") && player:HasToken("DC_SOMETHINGFORNOTHING02_KILLED") && player:HasToken("DC_SOMETHINGFORNOTHING03_KILLED")) then
			player:GiveToken("DC_SOMETHINGFORNOTHING_ALLKILLED")
			
		end
		
	end

end

function gd.quests.devilsCrossingQuestZombies.zombie03Killed()

	local player = Game.GetLocalPlayer()
	
	if (not player:HasToken("DC_SOMETHINGFORNOTHING_ALLKILLED")) then
		if (player != nil) then
			player:GiveToken("DC_SOMETHINGFORNOTHING03_KILLED")
			
		end
		
		if (player:HasToken("DC_SOMETHINGFORNOTHING01_KILLED") && player:HasToken("DC_SOMETHINGFORNOTHING02_KILLED") && player:HasToken("DC_SOMETHINGFORNOTHING03_KILLED")) then
			player:GiveToken("DC_SOMETHINGFORNOTHING_ALLKILLED")
			
		end
		
	end

end


--
-- Flesh and Iron Zombies
--
function gd.quests.devilsCrossingQuestZombies.mutant01Killed()

	local player = Game.GetLocalPlayer()
	
	if (not player:HasToken("DC_FLESHANDIRON_ALLKILLED")) then
		if (player != nil) then
			player:GiveToken("DC_FLESHANDIRON01_KILLED")
			
		end
		
		if (player:HasToken("DC_FLESHANDIRON01_KILLED") && player:HasToken("DC_FLESHANDIRON02_KILLED")) then
			player:GiveToken("DC_FLESHANDIRON_ALLKILLED")
			
		end
		
	end

end

function gd.quests.devilsCrossingQuestZombies.mutant02Killed()

	local player = Game.GetLocalPlayer()
	
	if (not player:HasToken("DC_FLESHANDIRON_ALLKILLED")) then
		if (player != nil) then
			player:GiveToken("DC_FLESHANDIRON02_KILLED")
			
		end
		
		if (player:HasToken("DC_FLESHANDIRON01_KILLED") && player:HasToken("DC_FLESHANDIRON02_KILLED")) then
			player:GiveToken("DC_FLESHANDIRON_ALLKILLED")
			
		end
		
	end

end

