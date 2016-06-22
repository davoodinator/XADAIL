/*
	
	GRIM DAWN

	For more information, visit us at http://www.grimdawn.com
	
*/

gd.quests.devilsCrossingQuestAethercrystals = {}

--
-- Kasparov aether crystal collection quest
--
-- Kasparov plays an effect the first time the player reaches a certain point in his 
-- conversation after the player has turned in the aethercrystal collection quest.
--

local kasparovId = 0
local kasparovEffect = false
local kasparovDynamite = false

function gd.quests.devilsCrossingQuestAethercrystals.kasparovOnAddToWorld(objectId)

	if Server then
	
		kasparovId = objectId
		
	end
	
end

function gd.quests.devilsCrossingQuestAethercrystals.kasparovTriesDeviceMP()
	
	GiveTokenToLocalPlayer("DC_KASPAROV_CRYSTALS")
	
end

function gd.quests.devilsCrossingQuestAethercrystals.kasparovTriesDevice()

	if Server then
	
		-- Only show the effect once
		if (not kasparovEffect) then

			local kasparov = Entity.Get(kasparovId)

			if (kasparov != nil) then
			
				local coords = kasparov:GetCoords()
				local pfx = Entity.Create("records/fx/skillclass05/arcaneblast1_radius_fxpak01.dbr")
				
				if (pfx != nil) then
					pfx:NetworkEnable()
					pfx:SetCoords(coords)
					kasparovEffect = true
				end
				
			end
			
		end
		
	end

end


function gd.quests.devilsCrossingQuestAethercrystals.kasparovTriesDynamiteMP()
	
	GiveTokenToLocalPlayer("DC_KASPAROV_DYNAMITE")
	
end

function gd.quests.devilsCrossingQuestAethercrystals.kasparovTriesDynamite()

	if Server then
	
		-- Only show the effect once
		if (not kasparovDynamite) then

			local kasparov = Entity.Get(kasparovId)

			if (kasparov != nil) then
			
				local coords = kasparov:GetCoords()
				local pfx = Entity.Create("records/fx/skillsother/attackradius/detonate_fxpak01.dbr")
				
				if (pfx != nil) then
					pfx:NetworkEnable()
					pfx:SetCoords(coords)
					kasparovDynamite = true
				end
				
			end
			
		end
		
	end

end