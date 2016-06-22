/*
	
	GRIM DAWN
	scripts/quests/_MPQuestControl.lua
	
	For more information, visit us at http://www.grimdawn.com
	
*/

gd.MPQuestControl = {}

--
-- MP Control for bestowing quests to all players.
-- Triggered by Conversations
--


--
-- Act 1 Main Quests
--

-- Waking to Misery
local wakingToMiseryQuest = false
local wakingToMiseryBurialCaveQuest = false

function gd.MPQuestControl.bestowWakingToMiseryQuestGlobalMP()

	if not wakingToMiseryQuest then
		wakingToMiseryQuest = true
		local player = Game.GetLocalPlayer()
		
		local questId = 0x2B43AF80
		local taskId = 0x92A0C700

		local questTaskState = player:GetQuestTaskState(questId, taskId)
		
		-- Begins first task of Waking to Misery, check if player has not already progressed in this quest
		if (questTaskState != QuestState.InProgress && questTaskState != QuestState.Complete && player:HasToken("DC_REANIMATOR_KILLED") == false) then
			player:GrantQuest(0x2B43AF80, 0xB0371500)
		elseif (questTaskState == QuestState.InProgress || questTaskState == QuestState.Complete) then
			-- completes first task if the quest is already started
			player:CompleteQuest(0x2B43AF80, 0xB0371500)
		end
		
	end

end

function gd.MPQuestControl.bestowWakingToMiseryBurialCaveQuestGlobalMP()

	if not wakingToMiseryBurialCaveQuest then
		wakingToMiseryBurialCaveQuest = true
		local player = Game.GetLocalPlayer()
		
		-- Begins Second Task of Waking to Misery, check if player has not already progressed in this quest
		if (player:HasToken("DC_REANIMATOR_KILLED") == false) then
			player:GrantQuest(0x2B43AF80, 0x92A0C700)

		end

	end

end

-- Helping Out
local helpingOutQuest = false

function gd.MPQuestControl.bestowHelpingOutQuestGlobalMP()

	if not helpingOutQuest then
		helpingOutQuest = true
		local player = Game.GetLocalPlayer()
		
		local questId = 0x2B43AF80
		local taskId = 0x3F73DEC0

		local questTaskState = player:GetQuestTaskState(questId, taskId)
		
		-- Begins first task of Helping Out, check if player has completed Waking to Misery
		if (questTaskState == QuestState.Complete) then
			player:GrantQuest(0x81ECEA00, 0x83710300)

		end

	end

end

-- Pocket Portal
local pocketPortalQuest = false

function gd.MPQuestControl.bestowPocketPortalQuestGlobalMP()

	if not pocketPortalQuest then
		pocketPortalQuest = true
		local player = Game.GetLocalPlayer()
		
		local questId = 0x81ECEA00
		local taskId = 0x83710300

		local questTaskState = player:GetQuestTaskState(questId, taskId)
		
		-- Begins first task of Kasparov's Experiment, check if player is on Helping Out
		if (questTaskState == QuestState.InProgress) then
			player:GrantQuest(0x17616920, 0x36524D40)
		end

	end

end

-- Waterpump
local waterpumpQuest = false
local vilothQuest = false

function gd.MPQuestControl.bestowWaterpumpQuestGlobalMP()

	if not waterpumpQuest then
		waterpumpQuest = true
		local player = Game.GetLocalPlayer()
		
		local questId = 0x81ECEA00
		local taskId = 0x83710300

		local questTaskState = player:GetQuestTaskState(questId, taskId)
		
		-- Begins first task of And Not a Drop to Drink, check if player is on Helping Out
		if (questTaskState == QuestState.InProgress) then
			player:GrantQuest(0x332CA100, 0xB6FA8A00)
		end

	end

end

function gd.MPQuestControl.bestowVilothQuestGlobalMP()

	if not vilothQuest then
		vilothQuest = true
		local player = Game.GetLocalPlayer()
		
		local questId = 0x332CA100
		local taskId = 0xB6FA8A00

		local questTaskState = player:GetQuestTaskState(questId, taskId)
		
		-- Begins Second Task of And Not a Drop to Drink, check if player has done the first task
		if (questTaskState == QuestState.Complete) then
			player:GrantQuest(0x332CA100, 0x509FED00)
		end

	end

end

-- Burrwitch
local burrwitchQuest = false
local burrwitchReturnQuest = false

function gd.MPQuestControl.bestowBurrwitchQuestGlobalMP()

	if not burrwitchQuest then
		burrwitchQuest = true
		local player = Game.GetLocalPlayer()
		
		local questId = 0x81ECEA00
		local taskId = 0xB319EA00

		local questTaskState = player:GetQuestTaskState(questId, taskId)
		
		-- Begins first task of Securing Burrwitch, check if player has completed Helping Out
		if (questTaskState == QuestState.Complete) then
			player:GrantQuest(0x70691B80, 0x59EB8E00)

		end

	end

end

function gd.MPQuestControl.bestowBurrwitchReturnQuestGlobalMP()

	if not burrwitchReturnQuest then
		burrwitchReturnQuest = true
		local player = Game.GetLocalPlayer()
		
		local questId = 0x81ECEA00
		local taskId = 0xB319EA00
		
		local questState = player:GetQuestState(questId)
		local questTaskState = player:GetQuestTaskState(questId, taskId)
		
		-- Begins reversible-credit task of Securing Burrwitch, check if player has completed Helping Out and is not already on this quest
		if (questTaskState == QuestState.Complete && questState != QuestState.InProgress) then
			player:GrantQuest(0x70691B80, 0xF6C5D400)

		end

	end

end

-- Warden
local wardenQuest = false
local wardenReturnQuest = false

function gd.MPQuestControl.bestowWardenQuestGlobalMP()

	if not wardenQuest then
		wardenQuest = true
		local player = Game.GetLocalPlayer()
		
		local questId01 = 0x70691B80
		local taskId01 = 0x77C29580
		local questId02 = 0x70691B80
		local taskId02 = 0xF6C5D400
		local questId03 = 0xD631D200
		local taskId03 = 0x65B6A800

		local questTaskState01 = player:GetQuestTaskState(questId01, taskId01)
		local questTaskState02 = player:GetQuestTaskState(questId02, taskId02)
		local questState = player:GetQuestState(questId03)
		local questTaskState03 = player:GetQuestTaskState(questId02, taskId03)


		-- Begins first task of The Warden, check if player has completed Securing Burrwitch and is not already on this quest
		if (questState != QuestState.InProgress && questTaskState03 != QuestState.Complete && (questTaskState01 == QuestState.Complete || questTaskState02 == QuestState.Complete)) then
			player:GrantQuest(0xD631D200, 0x44EB9400)

		end

	end

end

function gd.MPQuestControl.bestowWardenReturnQuestGlobalMP()

	if not wardenReturnQuest then
		wardenReturnQuest = true
		local player = Game.GetLocalPlayer()
		
		local questId01 = 0x70691B80
		local taskId01 = 0x77C29580
		local questId02 = 0x70691B80
		local taskId02 = 0xF6C5D400
		local questId03 = 0xD631D200.
		local taskId03 = 0x44EB9400

		local questTaskState01 = player:GetQuestTaskState(questId01, taskId01)
		local questTaskState02 = player:GetQuestTaskState(questId02, taskId02)
		local questState = player:GetQuestState(questId03)
		local questTaskState03 = player:GetQuestTaskState(questId02, taskId03)

		-- Begins reversible-credit task of The Warden, check if player has completed Securing Burrwitch and is not already on this quest
		if (questState != QuestState.InProgress && questTaskState03 != QuestState.Complete && (questTaskState01 == QuestState.Complete || questTaskState02 == QuestState.Complete)) then
			player:GrantQuest(0xD631D200, 0x65B6A800)

		end

	end

end

-- Prison Entry
local prisonEntryQuest = false

function gd.MPQuestControl.bestowPrisonEntryQuestGlobalMP()

	if not prisonEntryQuest then
		prisonEntryQuest = true
		local player = Game.GetLocalPlayer()
		
		local questId = 0x2B43AF80
		local taskId = 0x3F73DEC0
		
		local questTaskState = player:GetQuestTaskState(questId, taskId)
	
		-- Begins first task of Welcome to Devil's Crossing, checks if player has completed Waking to Misery or has 200 faction with Survivors
		if (questTaskState == QuestState.Complete || player:GetFaction("SURVIVORS") >= 200) then
			player:GrantQuest(0xCFDEE000, 0x315577C0)

		end

	end

end

-- Spirit Guide
local spiritGuideQuest = false

function gd.MPQuestControl.bestowSpiritGuideQuestGlobalMP()

	if not spiritGuideQuest then
		spiritGuideQuest = true
		local player = Game.GetLocalPlayer()
	
		-- Begins first task of Spirit Guide, this quest has no prerequisites
		player:GrantQuest(0x32CF5640, 0x315577C0)

	end

end


--
-- Act 1 Side Quests
--

-- Merchant
local merchantQuest = false
local merchantFoundQuest = false

function gd.MPQuestControl.bestowMerchantQuestGlobalMP()

	if not merchantQuest then
		merchantQuest = true
		local player = Game.GetLocalPlayer()
		
		local questId = 0xCA968200
		local taskId = 0xB2392A00
		local taskId02 = 0xAFA1A800

		local questTaskState = player:GetQuestTaskState(questId, taskId)
		local questTaskState02 = player:GetQuestTaskState(questId, taskId02)

		local questTaskState = player:GetQuestTaskState(questId, taskId)
		
		-- Begins first task of The Lost Caravan, checks if player is not already on this quest
		if (questTaskState != QuestState.InProgress && questTaskState != QuestState.Complete && questTaskState02 != QuestState.InProgress && questTaskState02 != QuestState.Complete) then
			player:GrantQuest(0xCA968200, 0x5F267080)
		end
	
	end

end

function gd.MPQuestControl.bestowMerchantFoundQuestGlobalMP()

	if not merchantFoundQuest then
		merchantFoundQuest = true
		local player = Game.GetLocalPlayer()
		
		local questId = 0xCA968200
		local taskId = 0xB2392A00
		local taskId02 = 0xAFA1A800

		local questTaskState = player:GetQuestTaskState(questId, taskId)
		local questTaskState02 = player:GetQuestTaskState(questId, taskId02)
		
		-- Checks if player is already on first task, completes it if so. Otherwise, checks if player is eligible for second task.
		if (questTaskState == QuestState.InProgress) then
			player:CompleteQuest(0xCA968200, 0x5F267080)
		elseif (questTaskState02 != QuestState.InProgress && questTaskState02 != QuestState.Complete) then
			player:GrantQuest(0xCA968200, 0xAFA1A800)
		end
	
	end

end

-- Inventor
local inventorQuest = false
local InventorReturnQuest = false

function gd.MPQuestControl.bestowInventorQuestGlobalMP()

	if not inventorQuest then
		inventorQuest = true
		local player = Game.GetLocalPlayer()
		
		local questId01 = 0x17616920
		local taskId01 = 0x36524D40
		local questId02 = 0xA6E46100
		local taskId02 = 0xE51E6900
		local taskId03 = 0xF1B40300

		local questTaskState01 = player:GetQuestTaskState(questId01, taskId01)
		local questTaskState02 = player:GetQuestTaskState(questId02, taskId02)
		local questTaskState03 = player:GetQuestTaskState(questId02, taskId03)
		
		-- Begins first task of The Inventor's Apprentice, checks if player is not already on this quest
		if (questTaskState02 != QuestState.InProgress && questTaskState02 != QuestState.Complete) then
			player:GrantQuest(0xA6E46100, 0xF1B40300)
		elseif (questTaskState03 == QuestState.InProgress) && (questTaskState02 == QuestState.InProgress || questTaskState02 == QuestState.Complete) then
			-- If player is already on the second task, instead complete task one
			player:CompleteQuest(0xA6E46100, 0xF1B40300)
		end

	end

end

function gd.MPQuestControl.bestowInventorReturnQuestGlobalMP()

	if not InventorReturnQuest then
		InventorReturnQuest = true
		local player = Game.GetLocalPlayer()
		
		local questId01 = 0x17616920
		local taskId01 = 0x36524D40
		local questId02 = 0xA6E46100
		local taskId02 = 0xE51E6900
		local taskId03 = 0xF1B40300

		local questTaskState01 = player:GetQuestTaskState(questId01, taskId01)
		local questTaskState02 = player:GetQuestTaskState(questId02, taskId02)
		local questTaskState03 = player:GetQuestTaskState(questId02, taskId03)
		
		-- Begins second task of Inventor's Apprentice. If player is already on the first task, then it is completed.
		if (questTaskState02 != QuestState.InProgress && questTaskState02 != QuestState.Complete) then
			player:GrantQuest(0xA6E46100, 0xE51E6900)
			
			if (questTaskState03 == QuestState.InProgress) then
				player:CompleteQuest(0xA6E46100, 0xF1B40300)
			
			end
		
		end
		
		-- Completes the second task, progressing the quest
		player:CompleteQuest(0xA6E46100, 0xE51E6900)

	end

end

-- Dismantling
local dismantlingQuest = false

function gd.MPQuestControl.bestowDismantlingQuestGlobalMP()

	if not dismantlingQuest then
		dismantlingQuest = true
		local player = Game.GetLocalPlayer()
		
		local questId = 0xA6E46100
		local taskId = 0x61337E00

		local questTaskState = player:GetQuestTaskState(questId, taskId)
		
		-- Begins first task of Dangerous Curiosity, checks if player has completed The Inventor's Apprentice, has completed Pocket Portal and has at least 5000 reputation with Survivors
		if (questTaskState == QuestState.Complete && player:HasToken("DC_HELPED_KASPAROV") && player:GetFaction("SURVIVORS") >= 5000) then
			player:GrantQuest(0x730F0A80, 0xE0798E00)

		end

	end

end

-- Cook
local cookQuest = false

function gd.MPQuestControl.bestowCookQuestGlobalMP()

	if not cookQuest then
		cookQuest = true
		local player = Game.GetLocalPlayer()
		
		-- Begins first task of The Ironclad Chef
		player:GrantQuest(0x7BADA600, 0xC567E500)
	
	end

end

-- Hart's Amulet
local hartAmuletQuest = false

function gd.MPQuestControl.bestowHartsAmuletQuestGlobalMP()

	if not hartAmuletQuest then
		hartAmuletQuest = true
		local player = Game.GetLocalPlayer()
		
		local questId = 0x39C1FF00
		
		local questState = player:GetQuestState(questId)
		
		-- Begins first task of A Sister's Gift, checks if player is not already on this quest
		if (questState != QuestState.InProgress && questState != QuestState.Complete) then
			player:GrantQuest(0x39C1FF00, 0xEF53A500)
		end

	end

end

-- Something for Nothing
local somethingForNothingQuest = false

function gd.MPQuestControl.bestowSomethingForNothingQuestGlobalMP()

	if not somethingForNothingQuest then
		somethingForNothingQuest = true
		local player = Game.GetLocalPlayer()
		
		-- Begins first task of Something for Nothing, checks if player has 50 faction with Survivors
		if (player:GetFaction("SURVIVORS") >= 50) then
			player:GrantQuest(0x08932C00, 0x23908A00)
		end
	
	end

end

-- Flesh and Iron
local fleshAndIronQuest = false

function gd.MPQuestControl.bestowFleshAndIronQuestGlobalMP()

	if not fleshAndIronQuest then
		fleshAndIronQuest = true
		local player = Game.GetLocalPlayer()
		
		local questId = 0x08932C00
		local taskId = 0x1C159A60

		local questTaskState = player:GetQuestTaskState(questId, taskId)
		
		-- Begins first task of Flesh and Iron, checks if player has completed Something for Nothing
		if (questTaskState == QuestState.Complete) then
			player:GrantQuest(0x5E4F0F00, 0xD0334000)
		end
	
	end

end

-- The Seamstress
local fabricQuest = false

function gd.MPQuestControl.bestowFabricQuestGlobalMP()

	if not fabricQuest then
		fabricQuest = true
		local player = Game.GetLocalPlayer()
		
		-- Begins first task of The Seamstress, checks if player has 1500 faction with Survivors
		if (player:GetFaction("SURVIVORS") >= 1500) then
			player:GrantQuest(0xCC9E4B00, 0xAC591B00)
		end
	
	end

end

-- Rover Rescue
local roverRescueQuest = false

function gd.MPQuestControl.bestowRoverRescueQuestGlobalMP()

	if not roverRescueQuest then
		roverRescueQuest = true
		local player = Game.GetLocalPlayer()
		
		-- Begins first task of Rover Rescue
		player:GrantQuest(0xCE0BC900, 0x67CD0680)
	
	end

end


-- Smith
local smithQuest = false
local smithKillQuest = false
local smithDeliverQuest = false
local smithMasterQuest = false

function gd.MPQuestControl.bestowSmithQuestGlobalMP()

	if not smithQuest then
		smithQuest = true
		local player = Game.GetLocalPlayer()
		
		-- Begins first task of A Tale of Two Smiths
		player:GrantQuest(0x9B5CC600, 0xE7AF4400)
	
	end

end

function gd.MPQuestControl.bestowSmithKillQuestGlobalMP()

	if not smithKillQuest then
		smithKillQuest = true
		local player = Game.GetLocalPlayer()
		
		local questId = 0x9B5CC600
		local taskId = 0xE7AF4400

		local questTaskState = player:GetQuestTaskState(questId, taskId)
		
		-- Begins kill step of A Tale of Two Smiths, checks if player is on the first task
		if (questTaskState == QuestState.InProgress) then
			player:GrantQuest(0x9B5CC600, 0xE301DC00)
		end
	
	end

end

function gd.MPQuestControl.bestowSmithDeliverQuestGlobalMP()

	if not smithDeliverQuest then
		smithDeliverQuest = true
		local player = Game.GetLocalPlayer()
		
		local questId = 0x9B5CC600
		local taskId = 0xE7AF4400

		local questTaskState = player:GetQuestTaskState(questId, taskId)
		
		-- Begins deliver step of A Tale of Two Smiths, checks if player is on the first task
		if (questTaskState == QuestState.InProgress) then
			player:GrantQuest(0x9B5CC600, 0x8F083300)
		end
	
	end

end

function gd.MPQuestControl.bestowSmithMasterQuestGlobalMP()

	if not smithMasterQuest then
		smithMasterQuest = true
		local player = Game.GetLocalPlayer()
		
		local questId = 0x9B5CC600
		local taskId = 0xE7AF4400

		local questTaskState = player:GetQuestTaskState(questId, taskId)
		
		-- Begins master-selected step of A Tale of Two Smiths, checks if player is on the first task
		if (questTaskState == QuestState.InProgress) then
			player:GrantQuest(0x9B5CC600, 0xBDC84400)
		end
	
	end

end

-- Slith Necklaces
local slithNecklacesQuest = false

function gd.MPQuestControl.bestowSlithNecklacesQuestGlobalMP()

	if not slithNecklacesQuest then
		slithNecklacesQuest = true
		local player = Game.GetLocalPlayer()
		
		-- Begins first task of That Good Old Slith Charm
		player:GrantQuest(0xC3FEED00, 0x80561300)
	
	end

end

-- Sacrifice
local sacrificeQuest = false

function gd.MPQuestControl.bestowSacrificeQuestGlobalMP()

	if not sacrificeQuest then
		sacrificeQuest = true
		local player = Game.GetLocalPlayer()
		
		-- Begins first task of A Sacrifice
		player:GrantQuest(0xE5CF3800, 0x876E1C00)
	
	end

end

-- Lost Journal
local LostJournalKillQuest = false

function gd.MPQuestControl.bestowLostJournalKillQuestGlobalMP()

	if not LostJournalKillQuest then
		LostJournalKillQuest = true
		local player = Game.GetLocalPlayer()
		
		local questId = 0x63541000
		local taskId = 0xC2B2B800

		local questTaskState = player:GetQuestTaskState(questId, taskId)
		
		-- Begins kill step of Lost Journal, checks if player is on the first task
		if (questTaskState == QuestState.InProgress) then
			player:GrantQuest(0x63541000, 0x55330980)

		end

	end

end

-- Slith Lab
--questId 0x2EB02E00
--taskId1 0x841B1100
local slithLabQuest = false

function gd.MPQuestControl.bestowSlithLabQuestGlobalMP()

	if not slithLabQuest then
		slithLabQuest = true
		local player = Game.GetLocalPlayer()
		
		local questId = 0x730F0A80
		local taskId = 0xE0798E00
		
		local questTaskState = player:GetQuestTaskState(questId, taskId)
	
		-- Begins first task of Origin of the Slith, checks if player has completed Dismantling and has 10000 Devil's Crossing reputation
		if (questTaskState == QuestState.Complete && player:GetFaction("SURVIVORS") >= 10000) then
			player:GrantQuest(0x2EB02E00, 0x841B1100)

		end

	end

end

-- Lost Survivor
--questId 0x2993C4C0
--taskId1 0x3CC5C340 turn-in
local lostSurvivorQuest = false

function gd.MPQuestControl.bestowLostSurvivorQuestGlobalMP()

	if not lostSurvivorQuest then
		lostSurvivorQuest = true
		local player = Game.GetLocalPlayer()
	
		-- Begins first task of Lost Survivor
		player:GrantQuest(0x2993C4C0, 0x3CC5C340)

	end

end



--
-- Act 2 Main Quests
--

-- Murderers and Worse
local murderersAndWorseQuest = false
local murderersAndWorseBridgeNotRepairedQuest = false
local murderersAndWorseBridgeRepairedQuest = false
local murderersAndWorseEdmundKilledQuest = false

function gd.MPQuestControl.bestowMurderersAndWorseQuestGlobalMP()

	if not murderersAndWorseQuest then
		murderersAndWorseQuest = true
		local player = Game.GetLocalPlayer()
		
		local questId01 = 0xD631D200
		local taskId01 = 0xDC054F00
		local questId02 = 0xD631D200
		local taskId02 = 0x65B6A800
		
		local questTaskState01 = player:GetQuestTaskState(questId01, taskId01)
		local questTaskState02 = player:GetQuestTaskState(questId02, taskId02)
		
		-- Begins first task of Murderers and Worse, checks if player has completed The Warden and is not already on the quest
		if (questTaskState01 == QuestState.Complete || questTaskState02 == QuestState.Complete) then
			player:GrantQuest(0x0DB402C0, 0xA5229F00)

		end

	end

end

function gd.MPQuestControl.bestowMurderersAndWorseBridgeNotRepairedQuestGlobalMP()

	if not murderersAndWorseBridgeNotRepairedQuest then
		murderersAndWorseBridgeNotRepairedQuest = true
		local player = Game.GetLocalPlayer()
		
		local questId01 = 0xD631D200
		local taskId01 = 0xDC054F00
		local questId02 = 0xD631D200
		local taskId02 = 0x65B6A800
		local questId03 = 0x0DB402C0

		local questTaskState01 = player:GetQuestTaskState(questId01, taskId01)
		local questTaskState02 = player:GetQuestTaskState(questId02, taskId02)
		local questState = player:GetQuestState(questId03)
		
		-- Begins first task of Murderers and Worse, checks if player has completed The Warden and is not already on the quest
		if ((questTaskState01 == QuestState.Complete || questTaskState02 == QuestState.Complete) && questState != QuestState.InProgress && questState != QuestState.Complete) then
			player:GrantQuest(0x0DB402C0, 0x84155E00)

		end

	end

end

function gd.MPQuestControl.bestowMurderersAndWorseBridgeRepairedQuestGlobalMP()

	if not murderersAndWorseBridgeRepairedQuest then
		murderersAndWorseBridgeRepairedQuest = true
		local player = Game.GetLocalPlayer()
		
		local questId01 = 0xD631D200
		local taskId01 = 0xDC054F00
		local questId02 = 0xD631D200
		local taskId02 = 0x65B6A800
		local questId03 = 0x0DB402C0

		local questTaskState01 = player:GetQuestTaskState(questId01, taskId01)
		local questTaskState02 = player:GetQuestTaskState(questId02, taskId02)
		local questState = player:GetQuestState(questId03)
		
		-- Begins first task of Murderers and Worse, checks if player has completed The Warden and is not already on the quest
		if ((questTaskState01 == QuestState.Complete || questTaskState02 == QuestState.Complete) && questState != QuestState.InProgress && questState != QuestState.Complete) then
			player:GrantQuest(0x0DB402C0, 0x33876740)

		end

	end

end

function gd.MPQuestControl.bestowMurderersAndWorseEdmundKilledQuestGlobalMP()

	if not murderersAndWorseEdmundKilledQuest then
		murderersAndWorseEdmundKilledQuest = true
		local player = Game.GetLocalPlayer()
		
		local questId01 = 0xD631D200
		local taskId01 = 0xDC054F00
		local questId02 = 0xD631D200
		local taskId02 = 0x65B6A800
		local questId03 = 0x0DB402C0
		local taskId03 = 0x65B6A800

		local questTaskState01 = player:GetQuestTaskState(questId01, taskId01)
		local questTaskState02 = player:GetQuestTaskState(questId02, taskId02)
		local questState = player:GetQuestState(questId03)
		local questTaskState03 = player:GetQuestTaskState(questId03, taskId03)
		
		-- Begins first task of Murderers and Worse, checks if player has completed The Warden and is not already on the quest
		if ((questTaskState01 == QuestState.Complete || questTaskState02 == QuestState.Complete) && questState != QuestState.InProgress && questState != QuestState.Complete) then
			player:GrantQuest(0x0DB402C0, 0xFE915A00)

		end

	end

end

-- Remove the Head
local removeTheHeadQuest = false
local removeTheHeadReturnQuest = false

function gd.MPQuestControl.bestowRemoveTheHeadQuestGlobalMP()

	if not removeTheHeadQuest then
		removeTheHeadQuest = true
		local player = Game.GetLocalPlayer()
		
		local questId = 0x0DB402C0
		local taskId = 0xFE915A00
		local questId2 = 0x554DB080
		local taskId2 = 0xB0CDAD00

		local questTaskState = player:GetQuestTaskState(questId, taskId)
		local questTaskState02 = player:GetQuestTaskState(questId2, taskId2)
		
		-- Begins first task of Remove the Head, checks if player has completed Murderers and Worse and is not already on the quest
		if (questTaskState == QuestState.Complete && questTaskState02 != QuestState.Complete && questTaskState02 != QuestState.InProgress) then
			player:GrantQuest(0x554DB080, 0x5F79AE00)

		end

	end

end

function gd.MPQuestControl.bestowRemoveTheHeadReturnQuestGlobalMP()

	if not removeTheHeadReturnQuest then
		removeTheHeadReturnQuest = true
		local player = Game.GetLocalPlayer()
		
		local questId = 0x0DB402C0
		local taskId = 0xFE915A00
		local questId2 = 0x554DB080
		local taskId2 = 0x5F79AE00

		local questTaskState = player:GetQuestTaskState(questId, taskId)
		local questTaskState02 = player:GetQuestTaskState(questId2, taskId2)
		
		-- Begins turn-in task of Remove the Head, checks if player has completed Murderers and Worse, has killed Cronley and is not already on the quest
		if (questTaskState == QuestState.Complete && player:HasToken("CRONLEY_SLAIN") && questTaskState02 != QuestState.Complete && questTaskState02 != QuestState.InProgress) then
			player:GrantQuest(0x554DB080, 0xB0CDAD00)
			player:GrantQuest(0xC92E7200, 0x082DD820)

		end

	end

end

-- We Need Food
local weNeedFoodQuest = false
local weNeedFoodFindHomesteadQuest = false
local weNeedFoodDouglassQuest = false

function gd.MPQuestControl.bestowWeNeedFoodQuestGlobalMP()

	if not weNeedFoodQuest then
		weNeedFoodQuest = true
		local player = Game.GetLocalPlayer()
		
		local questId = 0x554DB080
		local taskId = 0xB0CDAD00

		local questTaskState = player:GetQuestTaskState(questId, taskId)
		
		-- Begins first task of We Need Food, checks if player has completed An Old Threat
		if (questTaskState == QuestState.Complete) then
			player:GrantQuest(0xB561CE00, 0x06BCD4E8)

		end

	end

end

function gd.MPQuestControl.bestowWeNeedFoodFindHomesteadQuestGlobalMP()

	if not weNeedFoodFindHomesteadQuest then
		weNeedFoodFindHomesteadQuest = true
		local player = Game.GetLocalPlayer()
		
		local questId = 0xB561CE00
		local taskId = 0x06BCD4E8

		local questTaskState = player:GetQuestTaskState(questId, taskId)
		
		-- Begins second task of We Need Food, checks if player is on the first task
		if (questTaskState == QuestState.InProgress) then
			player:GrantQuest(0xB561CE00, 0xBDE28200)

		end

	end

end

function gd.MPQuestControl.bestowWeNeedFoodDouglassQuestGlobalMP()

	if not weNeedFoodDouglassQuest then
		weNeedFoodDouglassQuest = true
		local player = Game.GetLocalPlayer()
		
		local questId = 0xB561CE00
		local taskId = 0x06BCD4E8

		local questTaskState = player:GetQuestTaskState(questId, taskId)
		
		-- Begins final task of We Need Food, checks if player is on the first task
		if (questTaskState == QuestState.InProgress) then
			player:GrantQuest(0xB561CE00, 0x30250AC0)
		end

	end

end


--
-- Act 2 Side Quests
--

-- Find Elsa
local findElsaReturnQuest = false

function gd.MPQuestControl.bestowFindElsaReturnQuestGlobalMP()
	
	if not findElsaReturnQuest then
		findElsaReturnQuest = true
		local player = Game.GetLocalPlayer()
		
		local questId01 = 0x0DB402C0
		local taskId01 = 0xFE915A00
		local questId02 = 0x56F9E480

		local questTaskState01 = player:GetQuestTaskState(questId01, taskId01)
		local questState = player:GetQuestState(questId02)

		-- Begins first task of Find Elsa, check if player has completed Murderers and Worse, is not on the Elsa Quest and has found Elsa
		if (questTaskState01 == QuestState.Complete && questState != QuestState.InProgress && questState != QuestState.Complete && player:HasToken("ELSA_FOUND")) then
			player:GrantQuest(0x56F9E480, 0x3C52CFC0)

		end
	
	end

end

-- Clearing the Way
local clearingTheWayQuest = false
local clearingTheWayReturnQuest = false

function gd.MPQuestControl.bestowClearingTheWayQuestGlobalMP()

	if not clearingTheWayQuest then
		clearingTheWayQuest = true
		local player = Game.GetLocalPlayer()
		
		local questId = 0x33D57D80
		local taskId = 0x8E454000
		
		local questState = player:GetQuestState(questId)
		local questTaskState = player:GetQuestTaskState(questId, taskId)
		
		-- Begins first task of Clearing the Way, checks if player is not already on this quest and has not completed it before
		if (questState != QuestState.InProgress && questTaskState != QuestState.Complete) then
			player:GrantQuest(0x33D57D80, 0x051BCE20)
		end

	end

end

function gd.MPQuestControl.bestowClearingTheWayReturnQuestGlobalMP()

	if not clearingTheWayReturnQuest then
		clearingTheWayReturnQuest = true
		local player = Game.GetLocalPlayer()
		
		local questId = 0x33D57D80
		local taskId = 0x8E454000
		
		local questState = player:GetQuestState(questId)
		local questTaskState = player:GetQuestTaskState(questId, taskId)
		
		-- Begins first task of Clearing the Way, checks if player is not already on this quest and has not completed it before
		if (questState != QuestState.InProgress && questTaskState != QuestState.Complete) then
			player:GrantQuest(0x33D57D80, 0x8E454000)
		end

	end

end

-- Lost Elder
local lostElderQuest = false

function gd.MPQuestControl.bestowLostElderQuestGlobalMP()

	if not lostElderQuest then
		lostElderQuest = true
		local player = Game.GetLocalPlayer()
		
		local questId = 0x93AE8A00
		local taskId = 0xF503B800
		
		local questState = player:GetQuestState(questId)
		local questTaskState = player:GetQuestTaskState(questId, taskId)
		
		-- Begins first task of Lost Elder, checks if player is not already on this quest and has not completed it before
		if (questState != QuestState.InProgress && questTaskState != QuestState.Complete) then
			player:GrantQuest(0x93AE8A00, 0xA7CEBA00)
		end

	end

end

-- Disarming the Enemy
local disarmingTheEnemyQuest = false
local disarmingTheEnemyReturnQuest = false

function gd.MPQuestControl.bestowDisarmingTheEnemyQuestGlobalMP()

	if not disarmingTheEnemyQuest then
		disarmingTheEnemyQuest = true
		local player = Game.GetLocalPlayer()
		
		local questId = 0xC92E7200
		local taskId = 0x082DD820
		local questId02 = 0x68425D80
		local taskId02 = 0x1C5AA340

		local questTaskState = player:GetQuestTaskState(questId, taskId)
		local questTaskState02 = player:GetQuestTaskState(questId02, taskId02)
		
		-- Begins first task of Disarming the Enemy, checks if player has completed The Warrior Among Rovers and is not already on the quest.
		if (questTaskState == QuestState.Complete && questTaskState02 != QuestState.InProgress && questTaskState02 != QuestState.Complete) then
			player:GrantQuest(0x68425D80, 0xDD08B400)
		end
	
	end

end

function gd.MPQuestControl.bestowDisarmingTheEnemyReturnQuestGlobalMP()

	if not disarmingTheEnemyQuest then
		disarmingTheEnemyQuest = true
		local player = Game.GetLocalPlayer()
		
		local questId = 0xC92E7200
		local taskId = 0x082DD820
		local questId02 = 0x68425D80
		local taskId02 = 0xDD08B400

		local questTaskState = player:GetQuestTaskState(questId, taskId)
		local questTaskState02 = player:GetQuestTaskState(questId02, taskId02)
		
		-- Begins first task of Disarming the Enemy, checks if player has completed The Warrior Among Rovers, is not already on the quest and has the token for destroying the forges.
		if (questTaskState == QuestState.Complete && questTaskState02 != QuestState.InProgress && questTaskState02 != QuestState.Complete && player:HasToken("OUTLAW_FORGES_DESTROYED")) then
			player:GrantQuest(0x68425D80, 0x1C5AA340)
		end
	
	end

end

-- A Life for an Eye
local lifeForAnEyeQuest = false
local lifeForAnEyeReturnQuest = false

function gd.MPQuestControl.bestowLifeForAnEyeQuestGlobalMP()

	if not lifeForAnEyeQuest then
		lifeForAnEyeQuest = true
		local player = Game.GetLocalPlayer()
		
		local questId = 0x68425D80
		local taskId = 0x1C5AA340
		local questId02 = 0x10C36380
		local taskId02 = 0xA0B58800

		local questTaskState = player:GetQuestTaskState(questId, taskId)
		local questTaskState02 = player:GetQuestTaskState(questId02, taskId02)
		
		-- Begins first task of Life for an Eye, checks if player has completed Disarming the Enemy and is not already on the quest
		if (questTaskState == QuestState.Complete && questTaskState02 != QuestState.InProgress && questTaskState02 != QuestState.Complete) then
			player:GrantQuest(0x10C36380, 0x8BBAFB00)
		end
	
	end

end

function gd.MPQuestControl.bestowLifeForAnEyeReturnQuestGlobalMP()

	if not lifeForAnEyeReturnQuest then
		lifeForAnEyeReturnQuest = true
		local player = Game.GetLocalPlayer()
		
		local questId = 0x68425D80
		local taskId = 0x1C5AA340
		local questId02 = 0x10C36380
		local taskId02 = 0x8BBAFB00
		
		local questTaskState = player:GetQuestTaskState(questId, taskId)
		local questTaskState02 = player:GetQuestTaskState(questId02, taskId02)
		
		-- Begins second task of Life for an Eye, checks if player has completed Disarming the Enemy and has MONEYBAGS_SLAIN token
		if (questTaskState == QuestState.Complete && questTaskState02 != QuestState.InProgress && player:HasToken("MONEYBAGS_SLAIN")) then
			player:GrantQuest(0x10C36380, 0xA0B58800)
		end
	
	end

end

-- Family Crisis
local familyCrisisQuest = false

function gd.MPQuestControl.bestowFamilyCrisisQuestGlobalMP()
	
	if not familyCrisisQuest then
		familyCrisisQuest = true
		local player = Game.GetLocalPlayer()
		
		-- Begins first task of Family Crisis, checks if player has not previously triggered the hostile ending
		if (player:HasToken("SKINNER_HOSTILE") == false) then
			player:GrantQuest(0xB1129C00, 0x3CC5C340)
		
		end
	
	end

end

-- A Royal Remedy
local royalRemedyQuest = false

function gd.MPQuestControl.bestowRoyalRemedyQuestGlobalMP()

	if not royalRemedyQuest then
		royalRemedyQuest = true
		local player = Game.GetLocalPlayer()
	
		-- Begins first task of A Royal Remedy, checks if player has 1500 faction with Rovers
		if (player:GetFaction("USER0") >= 1500) then
			player:GrantQuest(0x06E88BC8, 0x8D317E00)

		end

	end

end

-- Merciful End
local mercifulEndQuest = false
local mercifulEndReturnQuest = false

function gd.MPQuestControl.bestowMercifulEndQuestGlobalMP()

	if not mercifulEndQuest then
		mercifulEndQuest = true
		local player = Game.GetLocalPlayer()
		
		local questId = 0x55F96B00
		local taskId = 0x2E57FAC0

		local questTaskState = player:GetQuestTaskState(questId, taskId)
		
		-- Begins first task of Merciful End, checks if player is not already on the quest
		if (questTaskState != QuestState.InProgress && questTaskState != QuestState.Complete) then
			player:GrantQuest(0x55F96B00, 0x69D11980)
		end
	
	end

end

function gd.MPQuestControl.bestowMercifulEndReturnQuestGlobalMP()

	if not mercifulEndReturnQuest then
		mercifulEndReturnQuest = true
		local player = Game.GetLocalPlayer()
		
		-- Begins second task of Merciful End, checks if player has HS_LUTRA_KILLED token
		if (player:HasToken("HS_LUTRA_KILLED")) then
			player:GrantQuest(0x55F96B00, 0x2E57FAC0)
		end
	
	end

end

-- Troll Rampage
local trollRampageQuest = false

function gd.MPQuestControl.bestowTrollRampageQuestGlobalMP()
	
	if not trollRampageQuest then
		trollRampageQuest = true
		local player = Game.GetLocalPlayer()
		
		-- Begins first task of Troll Rampage
		player:GrantQuest(0x49053200, 0xF4076700)
	
	end

end

-- Paying Tribute
local payingTributeQuest = false
local payingTributeSilasFledQuest = false
local payingTributeTurnInQuest = false
local payingTributeBribeQuest = false
local payingTributeKillQuest = false

function gd.MPQuestControl.bestowPayingTributeQuestGlobalMP()
	
	if not payingTributeQuest then
		payingTributeQuest = true
		local player = Game.GetLocalPlayer()
		
		-- Begins first task of Paying Tribute
		player:GrantQuest(0xE6A00600, 0x13FF67C0)
	
	end

end

function gd.MPQuestControl.bestowPayingTributeSilasFledQuestGlobalMP()
	
	if not payingTributeSilasFledQuest then
		payingTributeSilasFledQuest = true
		local player = Game.GetLocalPlayer()
		
		-- Begins first task of Paying Tribute, checks if player has SILAS_FLED token
		if (player:HasToken("SILAS_FLED")) then
			player:GrantQuest(0xE6A00600, 0xDD9D6700)
			
			-- Clean up any quest states the player may still be on that do not involve a turn-in
			player:CompleteQuest(0xE6A00600, 0x13FF67C0)
			player:CompleteQuest(0xE6A00600, 0xC5379800)
		
		end
	
	end

end

function gd.MPQuestControl.bestowPayingTributeTurnInQuestGlobalMP()
	
	if not payingTributeTurnInQuest then
		payingTributeTurnInQuest = true
		local player = Game.GetLocalPlayer()
		
		local questId = 0xE6A00600
		local taskId = 0x13FF67C0

		local questTaskState = player:GetQuestTaskState(questId, taskId)
		
		-- Begins return task of Paying Tribute, checks if player is on the first task
		if (questTaskState == QuestState.InProgress) then
			player:GrantQuest(0xE6A00600, 0xCC4D9900)

		end
	
	end

end

function gd.MPQuestControl.bestowPayingTributeBribeTurnInQuestGlobalMP()
	
	if not payingTributeBribeQuest then
		payingTributeBribeQuest = true
		local player = Game.GetLocalPlayer()
		
		local questId = 0xE6A00600
		local taskId = 0x13FF67C0

		local questTaskState = player:GetQuestTaskState(questId, taskId)
		
		-- Begins bribe task of Paying Tribute, checks if player is on the first task
		if (questTaskState == QuestState.InProgress) then
			player:GrantQuest(0xE6A00600, 0x4C8C7A00)

		end
	
	end

end

function gd.MPQuestControl.bestowPayingTributeKillQuestGlobalMP()
	
	if not payingTributeKillQuest then
		payingTributeKillQuest = true
		local player = Game.GetLocalPlayer()
		
		local questId = 0xE6A00600
		local taskId = 0x13FF67C0

		local questTaskState = player:GetQuestTaskState(questId, taskId)
		
		-- Begins kill task of Paying Tribute, checks if player is on the first task
		if (questTaskState == QuestState.InProgress) then
			player:GrantQuest(0xE6A00600, 0xC5379800)

		end
	
	end

end


-- Rescue Children
local rescueChildrenQuest = false

function gd.MPQuestControl.bestowRescueChildrenQuestGlobalMP()
	
	if not rescueChildrenQuest then
		rescueChildrenQuest = true
		local player = Game.GetLocalPlayer()
	
		-- Completes the Silas Killed task if player is still on it, then begins first task of For the Children.
		-- Otherwise, begins first task of For the Children, checks if player has destroyed the fishing village.
		local questId = 0xE6A00600
		local taskId = 0x3EE76D80

		local questTaskState = player:GetQuestTaskState(questId, taskId)
		
		if (questTaskState == QuestState.InProgress) then
			player:CompleteQuest(0xE6A00600, 0x3EE76D80)
			player:GrantQuest(0x23B8A440, 0x2F267180)
		
		elseif player:HasToken("SILAS_DESTROYED") then
			player:GrantQuest(0x23B8A440, 0x2F267180)
		
		end
	
	end

end

-- Vengeance
local vengeanceQuest = false

function gd.MPQuestControl.bestowVengeanceQuestGlobalMP()
	
	if not vengeanceQuest then
		vengeanceQuest = true
		local player = Game.GetLocalPlayer()
		
		-- Begins first task of Vengeance
		player:GrantQuest(0x09892AB0, 0x0C5003D0)
	
	end

end

-- Old Scars
local oldScarsQuest = false
local oldScarsReturnQuest = false

function gd.MPQuestControl.bestowOldScarsQuestGlobalMP()

	if not oldScarsQuest then
		oldScarsQuest = true
		local player = Game.GetLocalPlayer()
		
		local questId = 0x44646C80
		local taskId = 0x295C2D00

		local questTaskState = player:GetQuestTaskState(questId, taskId)
		
		-- Begins first task of Old Scars, checks if player is not already on the quest
		if (questTaskState != QuestState.InProgress && questTaskState != QuestState.Complete) then
			player:GrantQuest(0x44646C80, 0x1D08BFA0)
		end
	
	end

end

function gd.MPQuestControl.bestowOldScarsReturnQuestGlobalMP()

	if not oldScarsReturnQuest then
		oldScarsReturnQuest = true
		local player = Game.GetLocalPlayer()
		
		-- Begins second task of Old Scars, checks if player has HS_OLIGARCH_ALLKILLED token
		if (player:HasToken("HS_OLIGARCH_ALLKILLED")) then
			player:GrantQuest(0x44646C80, 0x295C2D00)
		end
	
	end

end

-- Descent into Torment
local descentIntoTormentQuest = false
local descentIntoTormentReturnQuest = false

function gd.MPQuestControl.bestowDescentIntoTormentQuestGlobalMP()

	if not descentIntoTormentQuest then
		descentIntoTormentQuest = true
		local player = Game.GetLocalPlayer()
		
		local questId = 0x44646C80
		local taskId = 0x295C2D00
		local questId02 = 0x19EEB280
		local taskId02 = 0x60EE9500

		local questTaskState = player:GetQuestTaskState(questId, taskId)
		local questTaskState02 = player:GetQuestTaskState(questId02, taskId02)
		
		-- Begins first task of Descent into Torment, checks if player has completed Old Scars and is not already on the quest
		if (questTaskState == QuestState.Complete && questTaskState02 != QuestState.InProgress && questTaskState02 != QuestState.Complete) then
			player:GrantQuest(0x19EEB280, 0x860B8F00)
		end
	
	end

end

function gd.MPQuestControl.bestowDescentIntoTormentReturnQuestGlobalMP()

	if not descentIntoTormentReturnQuest then
		descentIntoTormentReturnQuest = true
		local player = Game.GetLocalPlayer()
		
		local questId = 0x44646C80
		local taskId = 0x295C2D00

		local questTaskState = player:GetQuestTaskState(questId, taskId)
		
		-- Begins second task of Descent into Torment, checks if player has completed Old Scars and has HS_GRANDPRIEST_KILLED token
		if (questTaskState == QuestState.Complete && player:HasToken("HS_GRANDPRIEST_KILLED")) then
			player:GrantQuest(0x19EEB280, 0x60EE9500)
		end
	
	end

end


-- Cronley's Secret
local cronleySecretDestroyQuest = false
local cronleySecretKeepQuest = false

function gd.MPQuestControl.bestowCronleySecretDestroyQuestGlobalMP()

	if not cronleySecretDestroyQuest then
		cronleySecretDestroyQuest = true
		local player = Game.GetLocalPlayer()
		
		local questId = 0x21797640
		local taskId = 0xAD43FF00
		local taskId02 = 0x4B0F6900

		local questTaskState = player:GetQuestTaskState(questId, taskId)
		local questTaskState02 = player:GetQuestTaskState(questId, taskId02)
		
		-- Begins destroy version of Cronley's Secret, checks if player has completed the other version
		if (questTaskState != QuestState.Complete && questTaskState02 != QuestState.InProgress && questTaskState02 != QuestState.Complete) then
			player:GrantQuest(0x21797640, 0xAD43FF00)
		end
	
	end

end

function gd.MPQuestControl.bestowCronleySecretKeepQuestGlobalMP()

	if not cronleySecretKeepQuest then
		cronleySecretKeepQuest = true
		local player = Game.GetLocalPlayer()
		
		local questId = 0x21797640
		local taskId = 0x4B0F6900
		local taskId02 = 0xAD43FF00

		local questTaskState = player:GetQuestTaskState(questId, taskId)
		local questTaskState02 = player:GetQuestTaskState(questId, taskId02)
		
		-- Begins keep version of Cronley's Secret, checks if player has completed the other version
		if (questTaskState != QuestState.Complete && questTaskState02 != QuestState.InProgress && questTaskState02 != QuestState.Complete) then
			player:GrantQuest(0x21797640, 0x4B0F6900)
		end
	
	end

end

-- Rover Legacy
--questId 0x5BF24780 
--taskId1 0x7F4AF980 collect parts for shrine and repair it
--taskId3 0x1348AB80 defeat chthonic spawns
--taskId3 0x86FB1800 turn-in
local roverLegacyQuest = false

function gd.MPQuestControl.bestowRoverLegacyQuestGlobalMP()

	if not roverLegacyQuest then
		roverLegacyQuest = true
		local player = Game.GetLocalPlayer()
	
		-- Begins the appropriate task of Rover Legacy, checks if player has 10000 faction with Rovers
		if (player:GetFaction("USER0") >= 10000) then
			if player:HasToken("MOGDROGENSHRINE_CLEANSED") then
				player:GrantQuest(0x5BF24780, 0x86FB1800)
				
			elseif player:HasToken("MOGDROGENSHRINE_REPAIRED") then
				player:GrantQuest(0x5BF24780, 0x1348AB80)
				
			else
				player:GrantQuest(0x5BF24780, 0x7F4AF980)
				
			end
			
		end

	end

end



--
-- Act 3 Main Quests
--

-- Road to Homestead
local roadToHomesteadQuest = false
local roadToHomesteadReturnQuest = false

function gd.MPQuestControl.bestowRoadToHomesteadQuestGlobalMP()

	if not roadToHomesteadQuest then
		roadToHomesteadQuest = true
		local player = Game.GetLocalPlayer()
		
		local questId = 0xB74DBA00
		local taskId = 0x226722C0
		
		local questTaskState = player:GetQuestTaskState(questId, taskId)
		
		-- Begins first task of Road To Homestead, checks that the quest is not already in progress
		if (questTaskState != QuestState.Complete && questTaskState != QuestState.InProgress) then
			player:GrantQuest(0xB74DBA00, 0x50043F00)

		end

	end

end

function gd.MPQuestControl.bestowRoadToHomesteadReturnQuestGlobalMP()

	if not roadToHomesteadReturnQuest then
		roadToHomesteadReturnQuest = true
		local player = Game.GetLocalPlayer()
		
		local questId = 0xB74DBA00
		local taskId = 0x50043F00

		local questTaskState = player:GetQuestTaskState(questId, taskId)
		local questTaskState02 = player:GetQuestTaskState(questId02, taskId02)
		
		-- Begins third task of Road To Homestead, checks that the quest is not already in progress and if they have secured the riftgate in Homestead
		if (questTaskState != QuestState.InProgress && player:HasToken("AREAC_HOMESTEAD_PORTAL_CLEARED")) then
			player:GrantQuest(0xB74DBA00, 0x226722C0)

		end

	end

end


-- Farmer's Plight
local farmersPlightQuest = false

function gd.MPQuestControl.bestowFarmersPlightQuestGlobalMP()

	if not farmersPlightQuest then
		farmersPlightQuest = true
		local player = Game.GetLocalPlayer()
		
		local questId = 0xB74DBA00
		local taskId = 0xA117EC00
		
		local questTaskState = player:GetQuestTaskState(questId, taskId)
		
		-- Begins first task of Farmer's Plight, checks if player has completed Road to Homestead
		if (questTaskState == QuestState.Complete) then
			player:GrantQuest(0xFDCD4500, 0xAF5FAC00)

		end

	end

end

-- Aetherial Farm
--questId 0x40F6C900
--taskId1 0x0A0746F0 kill stuff
--taskId2 0x63C1B880 turn-in
local aetherialFarmQuest = false
local aetherialFarmReturnQuest = false

function gd.MPQuestControl.bestowAetherialFarmQuestGlobalMP()

	if not aetherialFarmQuest then
		aetherialFarmQuest = true
		local player = Game.GetLocalPlayer()
		
		local questId = 0xFDCD4500
		local taskId = 0xAF5FAC00
		local questId02 = 0x40F6C900
		local taskId02 = 0x63C1B880
		
		local questTaskState = player:GetQuestTaskState(questId, taskId)
		local questTaskState02 = player:GetQuestTaskState(questId02, taskId02)
		
		-- Begins first task of Aetherial Farm, checks if player has completed Farmer's Plight and that the quest is not already in progress
		if (questTaskState == QuestState.Complete && questTaskState02 != QuestState.Complete && questTaskState02 != QuestState.InProgress) then
			player:GrantQuest(0x40F6C900, 0x0A0746F0)

		end

	end

end

function gd.MPQuestControl.bestowAetherialFarmReturnQuestGlobalMP()

	if not aetherialFarmReturnQuest then
		aetherialFarmReturnQuest = true
		local player = Game.GetLocalPlayer()
		
		local questId = 0xFDCD4500
		local taskId = 0xAF5FAC00
		local questId02 = 0x40F6C900
		local taskId02 = 0x0A0746F0

		local questTaskState = player:GetQuestTaskState(questId, taskId)
		local questTaskState02 = player:GetQuestTaskState(questId02, taskId02)
		
		-- Begins second task of Aetherial Farm, checks if player has completed Farmer's Plight, if the quest is not already in progress and if already killed the abomination
		if (questTaskState == QuestState.Complete && questTaskState02 != QuestState.InProgress && player:HasToken("AREAC_AETHERIALABOMINATION_KILLED")) then
			player:GrantQuest(0x40F6C900, 0x63C1B880)

		end

	end

end

-- Infested Fields
--questId 0xB211F700
--taskId1 0xB9632D00 kill stuff
--taskId2 0xA66FA600 turn-in
local infestedFieldsQuest = false
local infestedFieldsReturnQuest = false

function gd.MPQuestControl.bestowInfestedFieldsQuestGlobalMP()

	if not infestedFieldsQuest then
		infestedFieldsQuest = true
		local player = Game.GetLocalPlayer()
		
		local questId = 0xB211F700
		local taskId = 0xA66FA600
		local questId02 = 0xB74DBA00
		local taskId02 = 0xA117EC00
		
		local questTaskState = player:GetQuestTaskState(questId, taskId)
		local questTaskState02 = player:GetQuestTaskState(questId02, taskId02)
		
		-- Begins first task of Infested Fields, checks if the quest is not already in progress and if player has completed Road to Homestead
		if (questTaskState != QuestState.Complete && questTaskState != QuestState.InProgress && questTaskState02 == QuestState.Complete) then
			player:GrantQuest(0xB211F700, 0xB9632D00)

		end

	end

end

function gd.MPQuestControl.bestowInfestedFieldsReturnQuestGlobalMP()

	if not infestedFieldsReturnQuest then
		infestedFieldsReturnQuest = true
		local player = Game.GetLocalPlayer()
		
		local questId = 0xB211F700
		local taskId = 0xB9632D00
		local questId02 = 0xB74DBA00
		local taskId02 = 0xA117EC00

		local questTaskState = player:GetQuestTaskState(questId, taskId)
		local questTaskState02 = player:GetQuestTaskState(questId02, taskId02)
		
		-- Begins second task of Infested Fields, checks if the quest is not already in progress, if player has cleared the fields and if player has completed Road to Homestead
		if (questTaskState != QuestState.InProgress && player:HasToken("AREAC_DERMAPTERAN_INFESTATION01_RETURN") && player:HasToken("AREAC_DERMAPTERAN_INFESTATION02_RETURN") && questTaskState02 == QuestState.Complete) then
			player:GrantQuest(0xB211F700, 0xA66FA600)
			
			--Bestow tokens for clearing the fields, retroactive tokens cleared in quest
			player:GiveToken("AREAC_DERMAPTERAN_INFESTATION01_CLEARED")
			player:GiveToken("AREAC_DERMAPTERAN_INFESTATION02_CLEARED")

		end

	end

end


-- Culling the Swarm
--questId 0x1E20C0C0
--taskId1 0xF84AF600 open door
--taskId2 0xC5D7EA00 kill stuff
--taskId3 0x6E217480 turn-in
local cullingTheSwarmQuest = false
local cullingTheSwarmReturnQuest = false

function gd.MPQuestControl.bestowCullingTheSwarmQuestGlobalMP()

	if not cullingTheSwarmQuest then
		cullingTheSwarmQuest = true
		local player = Game.GetLocalPlayer()
		
		local questId = 0xB211F700
		local taskId = 0xA66FA600
		local questId02 = 0x1E20C0C0
		local taskId02 = 0x6E217480
		local taskId03 = 0xC5D7EA00
		
		local questTaskState = player:GetQuestTaskState(questId, taskId)
		local questTaskState02 = player:GetQuestTaskState(questId02, taskId02)
		local questTaskState03 = player:GetQuestTaskState(questId02, taskId03)
		
		-- Begins first task of Culling the Swarm, checks if player has completed Infested Fields and that the quest is not already in progress
		if (questTaskState == QuestState.Complete && questTaskState02 != QuestState.Complete && questTaskState02 != QuestState.InProgress && questTaskState03 != QuestState.InProgress) then
			player:GrantQuest(0x1E20C0C0, 0xF84AF600)

		end

	end

end

function gd.MPQuestControl.bestowCullingTheSwarmReturnQuestGlobalMP()

	if not cullingTheSwarmReturnQuest then
		cullingTheSwarmReturnQuest = true
		local player = Game.GetLocalPlayer()
		
		local questId = 0xB211F700
		local taskId = 0xA66FA600
		local questId02 = 0x1E20C0C0
		local taskId02 = 0xF84AF600
		local taskId03 = 0xC5D7EA00

		local questTaskState = player:GetQuestTaskState(questId, taskId)
		local questTaskState02 = player:GetQuestTaskState(questId02, taskId02)
		local questTaskState03 = player:GetQuestTaskState(questId02, taskId03)
		
		-- Begins third task of Culling the Swarm, checks if player has completed Infested Fields, if the quest is not already in progress and if already killed the dermapteran queen
		if (questTaskState == QuestState.Complete && questTaskState02 != QuestState.InProgress && questTaskState03 != QuestState.InProgress && player:HasToken("AREAC_DERMAPTERANQUEEN_KILLED")) then
			player:GrantQuest(0x1E20C0C0, 0x6E217480)

		end

	end

end


-- Allies Among the Ashes
--questId 0xDF0DCC00
--taskId1 0x02B5F500 turn-in
local alliesAmongTheAshesQuest = false

function gd.MPQuestControl.bestowAlliesAmongTheAshesQuestGlobalMP()

	if not alliesAmongTheAshesQuest then
		alliesAmongTheAshesQuest = true
		local player = Game.GetLocalPlayer()
		
		local questId = 0x40F6C900
		local taskId = 0x63C1B880
		
		local questTaskState = player:GetQuestTaskState(questId, taskId)
		
		-- Begins first task of Allies Among the Ashes, checks if player has completed Aetherial Farm
		if (questTaskState == QuestState.Complete) then
			player:GrantQuest(0xDF0DCC00, 0x02B5F500)
			
			QuestEvent("homesteadOpenCultDoors")
			GiveTokenToLocalPlayer("AREAC_CULTISTDOORS_OPEN")

		end

	end

end

-- North Gates
--questId 0x76FDFD80
--taskId1 0x1D1CFB60 turn-in
local homesteadGatesNorthQuest = false

function gd.MPQuestControl.bestowHomesteadGatesNorthQuestGlobalMP()

	if not homesteadGatesNorthQuest then
		homesteadGatesNorthQuest = true
		local player = Game.GetLocalPlayer()
		
		local questId = 0x40F6C900
		local taskId = 0x63C1B880
		
		local questTaskState = player:GetQuestTaskState(questId, taskId)
		
		-- Begins first task of Allies Among the Ashes, checks if player has completed Aetherial Farm and does not have the gates north open yet
		if (questTaskState == QuestState.Complete && player:HasToken("AREAC_CULTISTDOORS_OPEN") == false && player:HasToken("AREAC_NECROS_CHOSEN") == false && player:HasToken("AREAC_ZEALOTS_CHOSEN") == false) then
			player:GrantQuest(0x76FDFD80, 0x1D1CFB60)

		end

	end

end

-- Blood Harvest
--questId 0x0140404A
--taskId1 0x213CBB00 find prisoners
--taskId2 0x526E5480 rescue prisoners
--taskId3 0x5976AC00 turn-in
local bloodHarvestQuest = false
local bloodHarvestReturnQuest = false

function gd.MPQuestControl.bestowBloodHarvestQuestGlobalMP()

	if not bloodHarvestQuest then
		bloodHarvestQuest = true
		local player = Game.GetLocalPlayer()
		
		local questId = 0x40F6C900
		local taskId = 0x63C1B880
		local questId02 = 0x0140404A
		local taskId02 = 0x5976AC00
		
		local questTaskState = player:GetQuestTaskState(questId, taskId)
		local questTaskState02 = player:GetQuestTaskState(questId02, taskId02)
		
		-- Begins first task of Blood Harvest, checks if player has completed Aetherial Farm and that the quest is not already in progress
		if (questTaskState == QuestState.Complete && questTaskState02 != QuestState.Complete && questTaskState02 != QuestState.InProgress) then
			player:GrantQuest(0x0140404A, 0x213CBB00)

		end

	end

end

function gd.MPQuestControl.bestowBloodHarvestReturnQuestGlobalMP()

	if not bloodHarvestReturnQuest then
		bloodHarvestReturnQuest = true
		local player = Game.GetLocalPlayer()
		
		local questId = 0x40F6C900
		local taskId = 0x63C1B880
		local questId02 = 0x0140404A
		local taskId02 = 0x213CBB00
		local questId03 = 0x0140404A
		local taskId03 = 0x526E5480

		local questTaskState = player:GetQuestTaskState(questId, taskId)
		local questTaskState02 = player:GetQuestTaskState(questId02, taskId02)
		local questTaskState03 = player:GetQuestTaskState(questId03, taskId03)
		
		-- Begins second task of Blood Harvest, checks if player has completed Aetherial Farm, if the quest is not already in progress and if prisoners rescued
		if (questTaskState == QuestState.Complete && questTaskState02 != QuestState.InProgress && questTaskState03 != QuestState.InProgress && player:HasToken("AREAC_BLOODHARVEST_RESCUED")) then
			player:GrantQuest(0x0140404A, 0x5976AC00)

		end

	end

end

-- Reaping What You Sow
--questId 0x1A1369C0
--taskId1 0xF0803200 kill stuff
--taskId2 0xA534B400 turn-in
local reapingWhatYouSowQuest = false
local reapingWhatYouSowReturnQuest = false

function gd.MPQuestControl.bestowReapingWhatYouSowQuestGlobalMP()

	if not reapingWhatYouSowQuest then
		reapingWhatYouSowQuest = true
		local player = Game.GetLocalPlayer()
		
		local questId = 0x0140404A
		local taskId = 0x5976AC00
		local questId02 = 0x1A1369C0
		local taskId02 = 0xA534B400
		
		local questTaskState = player:GetQuestTaskState(questId, taskId)
		local questTaskState02 = player:GetQuestTaskState(questId02, taskId02)
		
		-- Begins first task of Reaping what you Sow, checks if player has completed Blood Harvest and that the quest is not already in progress
		if (questTaskState == QuestState.Complete && questTaskState02 != QuestState.Complete && questTaskState02 != QuestState.InProgress) then
			player:GrantQuest(0x1A1369C0, 0xF0803200)

		end

	end

end

function gd.MPQuestControl.bestowReapingWhatYouSowReturnQuestGlobalMP()

	if not reapingWhatYouSowReturnQuest then
		reapingWhatYouSowReturnQuest = true
		local player = Game.GetLocalPlayer()
		
		local questId = 0x0140404A
		local taskId = 0x5976AC00
		local questId02 = 0x1A1369C0
		local taskId02 = 0xF0803200

		local questTaskState = player:GetQuestTaskState(questId, taskId)
		local questTaskState02 = player:GetQuestTaskState(questId02, taskId02)
		
		-- Begins second task of Reaping what you Sow, checks if player has completed Blood Harvest, if the quest is not already in progress and if already killed the cultist leader
		if (questTaskState == QuestState.Complete && questTaskState02 != QuestState.InProgress && player:HasToken("AREAC_CULTISTSUMMONER_KILLED")) then
			player:GrantQuest(0x1A1369C0, 0xA534B400)

		end

	end

end

-- The Inquisitor
--questId 0x4AF35D00
--taskId1 0xAF605B00 turn-in
local theInquisitorQuest = false

function gd.MPQuestControl.bestowTheInquisitorQuestGlobalMP()

	if not theInquisitorQuest then
		theInquisitorQuest = true
		local player = Game.GetLocalPlayer()
		
		local questId = 0x1A1369C0
		local taskId = 0xA534B400
		
		local questTaskState = player:GetQuestTaskState(questId, taskId)
		
		-- Begins first task of The Inquisitor, checks if player has completed Reaping What You Sow
		if (questTaskState == QuestState.Complete) then
			player:GrantQuest(0x4AF35D00, 0xAF605B00)

		end

	end

end

-- Making a Deal
--questId 0x7072E600
--taskId1 0x876A2A00 turn-in
local makingADealQuest = false

function gd.MPQuestControl.bestowCullingTheSwarmQuestGlobalMP()

	if not makingADealQuest then
		makingADealQuest = true
		local player = Game.GetLocalPlayer()
		
		local questId = 0x1E20C0C0
		local taskId = 0x6E217480
		local questId02 = 0xB561CE00
		local taskId02 = 0x30250AC0
		
		local questTaskState = player:GetQuestTaskState(questId, taskId)
		local questTaskState02 = player:GetQuestTaskState(questId02, taskId02)
		
		-- Begins first task of Making a Deal, checks if player has completed Culling the Swarm, has completed We Need Food and has enough faction status, 10000
		if (questTaskState == QuestState.Complete && questTaskState02 == QuestState.Complete && player:GetFaction("USER2") >= 10000) then
			player:GrantQuest(0x7072E600, 0x876A2A00)

		end

	end

end


--
-- Act 3 Side Quests
--

-- Too Late for Rescue
local tooLateForRescueQuest = false
local tooLateForRescueReturnQuest = false

function gd.MPQuestControl.bestowTooLateForRescueQuestGlobalMP()

	if not tooLateForRescueQuest then
		tooLateForRescueQuest = true
		local player = Game.GetLocalPlayer()
		
		local questId = 0x06970E10
		local taskId = 0xA71C4000

		local questTaskState = player:GetQuestTaskState(questId, taskId)
		
		-- Begins first task of Too Late for Rescue, checks if player has not already done it
		if (questTaskState != QuestState.Complete && questTaskState != QuestState.InProgress) then
			player:GrantQuest(0x06970E10, 0x30E45AC0)
		end

	end

end

function gd.MPQuestControl.bestowTooLateForRescueReturnQuestGlobalMP()

	if not tooLateForRescueReturnQuest then
		tooLateForRescueReturnQuest = true
		local player = Game.GetLocalPlayer()
		
		local questId = 0x06970E10
		local taskId = 0x30E45AC0

		local questTaskState = player:GetQuestTaskState(questId, taskId)
		
		-- Begins second task of Too Late for Rescue, checks if player has AREAC_DEADREFUGEE_FOUND token and if quests is not already in progress
		if (questTaskState != QuestState.InProgress && player:HasToken("AREAC_DEADREFUGEE_FOUND")) then
			player:GrantQuest(0x06970E10, 0xA71C4000)
		end
	
	end

end


-- Manticore Venom
local manticoreVenomQuest = false

function gd.MPQuestControl.bestowManticoreVenomQuestGlobalMP()

	if not manticoreVenomQuest then
		manticoreVenomQuest = true
		local player = Game.GetLocalPlayer()
		
		-- Begins first task of Manticore Venom
		player:GrantQuest(0x8F568300, 0x789F4100)

	end

end


-- Hunting the Hunter
local huntingTheHunterQuest = false
local huntingTheHunterReturnQuest = false

function gd.MPQuestControl.bestowHuntingTheHunterQuestGlobalMP()

	if not huntingTheHunterQuest then
		huntingTheHunterQuest = true
		local player = Game.GetLocalPlayer()
		
		local questId = 0x8F568300
		local taskId = 0x789F4100
		local questId02 = 0x1F608A60
		local taskId02 = 0xB3453B00

		local questTaskState = player:GetQuestTaskState(questId, taskId)
		local questTaskState02 = player:GetQuestTaskState(questId02, taskId02)
		
		-- Begins first task of Hunting the Hunter, checks if player has done Manticore Venom and has not already done the quest
		if (questTaskState == QuestState.Complete && questTaskState02 != QuestState.InProgress && questTaskState02 != QuestState.Complete) then
			player:GrantQuest(0x1F608A60, 0xFB204C00)
		end

	end

end

function gd.MPQuestControl.bestowHuntingTheHunterReturnQuestGlobalMP()

	if not huntingTheHunterReturnQuest then
		huntingTheHunterReturnQuest = true
		local player = Game.GetLocalPlayer()
		
		local questId = 0x8F568300
		local taskId = 0x789F4100
		local questId02 = 0x1F608A60
		local taskId02 = 0xFB204C00

		local questTaskState = player:GetQuestTaskState(questId, taskId)
		local questTaskState02 = player:GetQuestTaskState(questId02, taskId02)
		
		-- Begins second task of Hunting the Hunter, checks if player has done Manticore Venom, has quest is not in progress and if player has AREAC_HUNTINGTHEHUNTER_KILLED token
		if (questTaskState == QuestState.Complete && questTaskState02 != QuestState.InProgress && player:HasToken("AREAC_HUNTINGTHEHUNTER_KILLED")) then
			player:GrantQuest(0x1F608A60, 0xB3453B00)
		end
	
	end

end


-- Pride of the Jagged Waste
local prideOfTheJaggedWasteQuest = false
local prideOfTheJaggedWasteReturnQuest = false

function gd.MPQuestControl.bestowPrideOfJaggedWasteQuestGlobalMP()

	if not prideOfTheJaggedWasteQuest then
		prideOfTheJaggedWasteQuest = true
		local player = Game.GetLocalPlayer()
		
		local questId = 0x3262C940
		local taskId = 0xE5C89F00

		local questTaskState = player:GetQuestTaskState(questId, taskId)
		
		-- Begins first task of Pride of Jagged Waste, checks if player has not already done the quest
		if (questTaskState != QuestState.InProgress && questTaskState != QuestState.Complete) then
			player:GrantQuest(0x3262C940, 0xF382F100)
		end

	end

end

function gd.MPQuestControl.bestowPrideOfJaggedWasteReturnQuestGlobalMP()

	if not prideOfTheJaggedWasteReturnQuest then
		prideOfTheJaggedWasteReturnQuest = true
		local player = Game.GetLocalPlayer()
		
		local questId = 0x3262C940
		local taskId = 0xF382F100

		local questTaskState = player:GetQuestTaskState(questId, taskId)
		
		-- Begins second task of Pride of Jagged Waste, checks if quest is not in progress and if player has AREAC_PRIDEJAGGEDWASTE_KILLED token
		if (questTaskState != QuestState.InProgress && player:HasToken("AREAC_PRIDEJAGGEDWASTE_KILLED")) then
			player:GrantQuest(0x3262C940, 0xE5C89F00)
		end
	
	end

end


-- Gloomweaver
local gloomweaverQuest = false
local gloomweaverReturnQuest = false

function gd.MPQuestControl.bestowGloomweaverQuestGlobalMP()

	if not gloomweaverQuest then
		gloomweaverQuest = true
		local player = Game.GetLocalPlayer()
		
		local questId = 0x3262C940
		local taskId = 0xE5C89F00
		local questId02 = 0x70525200
		local taskId02 = 0xC3E26200

		local questTaskState = player:GetQuestTaskState(questId, taskId)
		local questTaskState02 = player:GetQuestTaskState(questId02, taskId02)
		
		-- Begins first task of Gloomweaver, checks if player has done Pride of Jagged Waste and has not already done the quest
		if (questTaskState == QuestState.Complete && questTaskState02 != QuestState.InProgress && questTaskState02 != QuestState.Complete) then
			player:GrantQuest(0x70525200, 0x2C949780)
		end

	end

end

function gd.MPQuestControl.bestowGloomweaverReturnQuestGlobalMP()

	if not gloomweaverReturnQuest then
		gloomweaverReturnQuest = true
		local player = Game.GetLocalPlayer()
		
		local questId = 0x3262C940
		local taskId = 0xE5C89F00
		local questId02 = 0x70525200
		local taskId02 = 0x2C949780

		local questTaskState = player:GetQuestTaskState(questId, taskId)
		local questTaskState02 = player:GetQuestTaskState(questId02, taskId02)
		
		-- Begins second task of Gloomweaver, checks if player has done Pride of Jagged Waste, quest is not in progress and if player has AREAC_GLOOMWEAVER_KILLED token
		if (questTaskState == QuestState.Complete && questTaskState02 != QuestState.InProgress && player:HasToken("AREAC_GLOOMWEAVER_KILLED")) then
			player:GrantQuest(0x70525200, 0xC3E26200)
		end
	
	end

end


-- The Groble Tyrant
local grobleTyrantQuest = false
local grobleTyrantReturnQuest = false

function gd.MPQuestControl.bestowGrobleTyrantQuestGlobalMP()

	if not grobleTyrantQuest then
		grobleTyrantQuest = true
		local player = Game.GetLocalPlayer()
		
		local questId = 0x70525200
		local taskId = 0xC3E26200
		local questId02 = 0x39874B00
		local taskId02 = 0x7B891E00

		local questTaskState = player:GetQuestTaskState(questId, taskId)
		local questTaskState02 = player:GetQuestTaskState(questId02, taskId02)
		
		-- Begins first task of Groble Tyrant, checks if player has done Gloomweaver and has not already done the quest
		if (questTaskState == QuestState.Complete && questTaskState02 != QuestState.InProgress && questTaskState02 != QuestState.Complete) then
			player:GrantQuest(0x39874B00, 0xE148F000)
		end

	end

end

function gd.MPQuestControl.bestowGrobleTyrantReturnQuestGlobalMP()

	if not grobleTyrantReturnQuest then
		grobleTyrantReturnQuest = true
		local player = Game.GetLocalPlayer()
		
		local questId = 0x70525200
		local taskId = 0xC3E26200
		local questId02 = 0x39874B00
		local taskId02 = 0xE148F000

		local questTaskState = player:GetQuestTaskState(questId, taskId)
		local questTaskState02 = player:GetQuestTaskState(questId02, taskId02)
		
		-- Begins second task of Groble Tyrant, checks if player has done Gloomweaver, quest is not in progress and if player has AREAC_GROBLETYRANT_KILLED token
		if (questTaskState == QuestState.Complete && questTaskState02 != QuestState.InProgress && player:HasToken("AREAC_GROBLETYRANT_KILLED")) then
			player:GrantQuest(0x39874B00, 0x7B891E00)
		end
	
	end

end


-- A Familiar Face
local familiarFaceQuest = false

function gd.MPQuestControl.bestowFamiliarFaceQuestGlobalMP()
	
	if not familiarFaceQuest then
		familiarFaceQuest = true
		local player = Game.GetLocalPlayer()

		-- Begins first task of A Familiar Face, if player has resolved Vengeance in a way that triggers these NPCs to spawn in Act 3
		if (player:HasToken("VENGEANCE_TRUST") || player:HasToken("VENGEANCE_TOOKMONEY")) then
			GiveTokenToLocalPlayer("VENGEANCE_HOMESTEADSPAWN")
			player:GrantQuest(0x137D3420, 0x0C5003D0)
			
		end
	
	end

end


-- Man In Need
local manInNeedQuest = false
local manInNeedReturnQuest = false

function gd.MPQuestControl.bestowManInNeedQuestGlobalMP()

	if not manInNeedQuest then
		manInNeedQuest = true
		local player = Game.GetLocalPlayer()
		
		local questId = 0x7B920580
		
		local questState = player:GetQuestState(questId)
		
		-- Begins first task of Man In Need, checks if player is not already on this quest
		if (questState != QuestState.InProgress && questState != QuestState.Complete) then
			player:GrantQuest(0x7B920580, 0xAF9D9700)
		end

	end

end

function gd.MPQuestControl.bestowManInNeedReturnQuestGlobalMP()

	if not manInNeedQuest then
		manInNeedQuest = true
		local player = Game.GetLocalPlayer()
		
		local questId = 0x7B920580
		local taskId = 0xAF9D9700
		
		local questState = player:GetQuestState(questId)
		local questTaskState = player:GetQuestTaskState(questId, taskId)
		
		-- Begins second task of Man In Need, checks if player is not already on this quest
		if (questState != QuestState.InProgress && questState != QuestState.Complete) then
			player:GrantQuest(0x7B920580, 0x932A7F00)
		elseif questTaskState == QuestState.InProgress then
			-- Completes first task if player is already on it
			player:CompleteQuest(0x7B920580, 0xAF9D9700)
		end

	end

end

--Trapped and Alone
--questId 0x867DFE00 
--taskId1 0x643F9380 kill in crypt
--taskId2 0x0703C760 return to village after releasing
--taskId3 0x89F41A00 kill in village
local trappedAndAloneCryptKillQuest = false
local trappedAndAloneVillageKillQuest = false

function gd.MPQuestControl.bestowTrappedAndAloneCryptKillQuestGlobalMP()

	if not trappedAndAloneCryptKillQuest then
		trappedAndAloneCryptKillQuest = true
		local player = Game.GetLocalPlayer()
		
		local questId = 0x867DFE00
		local taskId = 0x0703C760
		local taskId02 = 0x89F41A00

		local questTaskState = player:GetQuestTaskState(questId, taskId)
		local questTaskState02 = player:GetQuestTaskState(questId, taskId02)
		
		-- Begins crypt kill version of Trapped and Alone, checks if player is not on other part of quest
		if (questTaskState != QuestState.InProgress && questTaskState02 != QuestState.InProgress && questTaskState02 != QuestState.Complete) then
			player:GrantQuest(0x867DFE00, 0x643F9380)
		end

	end

end

function gd.MPQuestControl.bestowTrappedAndAloneVillageKillQuestGlobalMP()

	if not trappedAndAloneVillageKillQuest then
		trappedAndAloneVillageKillQuest = true
		local player = Game.GetLocalPlayer()
		
		local questId = 0x867DFE00
		local taskId = 0x643F9380

		local questTaskState = player:GetQuestTaskState(questId, taskId)
		
		-- Begins village kill version of Trapped and Alone, checks if player is not on other part of the quest
		if (questTaskState != QuestState.InProgress && questTaskState != QuestState.Complete) then
			player:GrantQuest(0x867DFE00, 0x0703C760)
		end
	
	end

end

--Burn the Taken
--questId 0x06C09E60
--taskId1 0x45E36F00 speak to witch
--taskId2 0xDBB3F600 speak to Nathaniel
--taskId3 0xD4B64A00 kill stuff
--taskid4 0x4FDDB400 freed witch
--taskid5 0x0BD272C0 burned witch
local burnTheTakenQuest = false
local burnTheTakenFreeWitch = false
local burnTheTakenHostileWitch = false
local burnTheTakenBurnWitch = false

function gd.MPQuestControl.bestowBurnTheTakenQuestGlobalMP()

	if not burnTheTakenQuest then
		burnTheTakenQuest = true
		local player = Game.GetLocalPlayer()
		
		local questId = 0x06C09E60
		local taskId = 0xD4B64A00
		local taskId02 = 0x4FDDB400
		local taskId03 = 0x0BD272C0

		local questTaskState = player:GetQuestTaskState(questId, taskId)
		local questTaskState02 = player:GetQuestTaskState(questId, taskId02)
		local questTaskState03 = player:GetQuestTaskState(questId, taskId03)
		
		-- Begins first task of Burn the Taken, checks if quest is not in progress and not previously completed
		if (questTaskState != QuestState.InProgress && questTaskState02 != QuestState.InProgress && questTaskState02 != QuestState.Complete && questTaskState03 != QuestState.InProgress && questTaskState03 != QuestState.Complete) then
			player:GrantQuest(0x06C09E60, 0x45E36F00)
		end

	end

end

function gd.MPQuestControl.bestowBurnTheTakenFreeWitchQuestGlobalMP()

	if not burnTheTakenFreeWitch then
		burnTheTakenFreeWitch = true
		local player = Game.GetLocalPlayer()
		
		local questId = 0x06C09E60
		local taskId = 0x45E36F00
		local taskId02 = 0x0BD272C0

		local questTaskState = player:GetQuestTaskState(questId, taskId)
		local questTaskState02 = player:GetQuestTaskState(questId, taskId02)
		
		-- Begins the Free Witch scenario of Burn the Taken, completes task 01 if player is still on it, checks if player is not on the Burn Witch scenario
		if (questTaskState02 != QuestState.InProgress && questTaskState02 != QuestState.Complete) then
			player:GrantQuest(0x06C09E60, 0xDBB3F600)
			
			if (questTaskState == QuestState.InProgress) then
				player:CompleteQuest(0x06C09E60, 0x45E36F00)
			
			end
			
		end
	
	end

end

function gd.MPQuestControl.bestowBurnTheTakenHostileQuestGlobalMP()

	if not burnTheTakenHostileWitch then
		burnTheTakenHostileWitch = true
		local player = Game.GetLocalPlayer()
		
		local questId = 0x06C09E60
		local taskId = 0x45E36F00
		local taskId02 = 0x0BD272C0
		local taskId03 = 0xDBB3F600

		local questTaskState = player:GetQuestTaskState(questId, taskId)
		local questTaskState02 = player:GetQuestTaskState(questId, taskId02)
		local questTaskState03 = player:GetQuestTaskState(questId, taskId03)
		
		-- Begins the Hostile scenario of Burn the Taken, completes task 01 and 02 if player is still on it, checks if player is not on the Burn Witch scenario
		if (questTaskState02 != QuestState.InProgress && questTaskState02 != QuestState.Complete) then
			player:GrantQuest(0x06C09E60, 0xD4B64A00)
			
			if (questTaskState == QuestState.InProgress) then
				player:CompleteQuest(0x06C09E60, 0x45E36F00)
			
			end
			
			if (questTaskState03 == QuestState.InProgress) then
				player:CompleteQuest(0x06C09E60, 0xDBB3F600)
			
			end
			
		end
	
	end

end

function gd.MPQuestControl.bestowBurnTheTakenBurnWitchQuestGlobalMP()

	if not burnTheTakenBurnWitch then
		burnTheTakenBurnWitch = true
		local player = Game.GetLocalPlayer()
		
		local questId = 0x06C09E60
		local taskId = 0x45E36F00
		local taskId02 = 0xD4B64A00
		local taskId03 = 0x4FDDB400
		local taskId04 = 0xDBB3F600

		local questTaskState = player:GetQuestTaskState(questId, taskId)
		local questTaskState02 = player:GetQuestTaskState(questId, taskId02)
		local questTaskState03 = player:GetQuestTaskState(questId, taskId03)
		local questTaskState04 = player:GetQuestTaskState(questId, taskId04)
		
		-- Begins the Burn Witch scenario of Burn the Taken, completes task 01 or 02 if player is still on it, checks if player is not on the Free Witch scenario
		if (questTaskState02 != QuestState.InProgress && questTaskState03 != QuestState.InProgress && questTaskState03 != QuestState.Complete) then
			player:GrantQuest(0x06C09E60, 0x0BD272C0)
			
			if (questTaskState == QuestState.InProgress) then
				player:CompleteQuest(0x06C09E60, 0x45E36F00)
			
			end
			
			if (questTaskState04 == QuestState.InProgress) then
				player:CompleteQuest(0x06C09E60, 0xDBB3F600)
			
			end
			
		end
	
	end

end

--A Final Salute
--questId 0x1E301920
--taskId1 0x990A5C00
local finaSaluteQuest = false

function gd.MPQuestControl.bestowFinalSaluteQuestGlobalMP()

	if not finaSaluteQuest then
		finaSaluteQuest = true
		local player = Game.GetLocalPlayer()
		
		local questId = 0x40F6C900
		local taskId = 0x63C1B880
	
		local questTaskState = player:GetQuestTaskState(questId, taskId)
		
		-- Begins first task of A Final Salute, checks if player has completed Aetherial Farm
		if (questTaskState == QuestState.Complete) then
			player:GrantQuest(0x1E301920, 0x990A5C00)
		
		end
	
	end

end


--Lost Armaments
--questId 0xD7439B00
--taskId1 0x97877F00
--taskId2 0x40A7C480
local lostArmamentsQuest = false
local lostArmamentsReturnQuest = false

function gd.MPQuestControl.bestowLostArmamentsQuestGlobalMP()

	if not lostArmamentsQuest then
		lostArmamentsQuest = true
		local player = Game.GetLocalPlayer()
		
		local questId = 0xD7439B00
		local taskId = 0x40A7C480
		local questId02 = 0xB74DBA00
		local taskId02 = 0xA117EC00
		
		local questTaskState = player:GetQuestTaskState(questId, taskId)
		local questTaskState02 = player:GetQuestTaskState(questId02, taskId02)
		
		-- Begins first task of Lost Armaments, checks if player is not already on the quest and has completed Road to Homestead
		if (questTaskState != QuestState.Complete && questTaskState != QuestState.Inprogress && questTaskState02 == QuestState.Complete) then
			player:GrantQuest(0xD7439B00, 0x97877F00)
		
		end
	
	end

end

function gd.MPQuestControl.bestowLostArmamentsReturnQuestGlobalMP()

	if not lostArmamentsReturnQuest then
		lostArmamentsReturnQuest = true
		local player = Game.GetLocalPlayer()
		
		local questId = 0xD7439B00
		local taskId = 0x97877F00
		local questId02 = 0xB74DBA00
		local taskId02 = 0xA117EC00
	
		local questTaskState = player:GetQuestTaskState(questId, taskId)
		local questTaskState02 = player:GetQuestTaskState(questId02, taskId02)
		
		-- Begins second task of Lost Armaments, checks if player is not already on the quest and has the AREAC_CANNONSFOUND token
		if (player:HasToken("AREAC_CANNONSFOUND") && questTaskState != QuestState.Inprogress && questTaskState02 == QuestState.Complete) then
			player:GrantQuest(0xD7439B00, 0x40A7C480)
		
		end
	
	end

end


--Lumber for the Legion
--questId 0x038EC144
--taskId1 0x91325900
--taskId2 0x807D2500
local lumberForTheLegionQuest = false
local lumberForTheLegionReturnQuest = false

function gd.MPQuestControl.bestowLumberForTheLegionQuestGlobalMP()

	if not lumberForTheLegionQuest then
		lumberForTheLegionQuest = true
		local player = Game.GetLocalPlayer()
		
		local questId = 0x038EC144
		local taskId = 0x807D2500
	
		local questTaskState = player:GetQuestTaskState(questId, taskId)
		
		-- Begins first task of Lumber for the Legion, checks if player is not already on the quest
		if (questTaskState != QuestState.Complete && questTaskState != QuestState.Inprogress) then
			player:GrantQuest(0x038EC144, 0x91325900)
		
		end
	
	end

end

function gd.MPQuestControl.bestowLumberForTheLegionReturnQuestGlobalMP()

	if not lumberForTheLegionReturnQuest then
		lumberForTheLegionReturnQuest = true
		local player = Game.GetLocalPlayer()
		
		local questId = 0x038EC144
		local taskId = 0x91325900
	
		local questTaskState = player:GetQuestTaskState(questId, taskId)
		
		-- Begins second task of Lumber for the Legion, checks if player is not already on the quest and has the AREAC_LUMBERMILL_CLEARED token
		if (player:HasToken("AREAC_LUMBERMILL_CLEARED") && questTaskState != QuestState.Inprogress) then
			player:GrantQuest(0x038EC144, 0x807D2500)
		
		end
	
	end

end


--Necros Intro
--questId 0x224E5380
--taskId1 0x44512B00 turn-in
local necrosIntroQuest = false

function gd.MPQuestControl.bestowNecrosIntroQuestGlobalMP()

	if not necrosIntroQuest then
		necrosIntroQuest = true
		local player = Game.GetLocalPlayer()
		
		local questId = 0xDF0DCC00
		local taskId = 0x02B5F500
		
		local questTaskState = player:GetQuestTaskState(questId, taskId)
		
		-- Begins first task of Necros Intro, checks if player has completed Allies Among the Ashes and selected Necromancers
		if (questTaskState == QuestState.Complete && player:HasToken("AREAC_NECROS_CHOSEN")) then
			player:GrantQuest(0x224E5380, 0x44512B00)

		end

	end

end

--Necros Quest 1
--questId 0xDD14F500
--taskId1 0x8AF5C900 collect remains
local necrosQuest1 = false

function gd.MPQuestControl.bestowNecros01QuestGlobalMP()

	if not necrosQuest1 then
		necrosQuest1 = true
		local player = Game.GetLocalPlayer()
		
		local questId = 0x224E5380
		local taskId = 0x44512B00
		
		local questTaskState = player:GetQuestTaskState(questId, taskId)
		
		-- Begins first task of Necros Quest 1, checks if player has completed Necros Intro
		if (questTaskState == QuestState.Complete) then
			player:GrantQuest(0xDD14F500, 0x8AF5C900)

		end

	end

end

--Necros Quest 2
--questId 0x0E43B3D0
--taskId1 0x7ED2A780 collect sigils
local necrosQuest2 = false

function gd.MPQuestControl.bestowNecros02QuestGlobalMP()

	if not necrosQuest2 then
		necrosQuest2 = true
		local player = Game.GetLocalPlayer()
		
		local questId = 0xDD14F500
		local taskId = 0x8AF5C900
		
		local questTaskState = player:GetQuestTaskState(questId, taskId)
		
		-- Begins first task of Necros Quest 2, checks if player has completed Necros Quest 1
		if (questTaskState == QuestState.Complete) then
			player:GrantQuest(0x0E43B3D0, 0x7ED2A780)

		end

	end

end

--Necros Quest 3
--questId 0xEABF6800
--taskId1 0x8D08BF00 collect aetherial essence
local necrosQuest3 = false

function gd.MPQuestControl.bestowNecros03QuestGlobalMP()

	if not necrosQuest3 then
		necrosQuest3 = true
		local player = Game.GetLocalPlayer()
		
		local questId = 0x0E43B3D0
		local taskId = 0x7ED2A780
		
		local questTaskState = player:GetQuestTaskState(questId, taskId)
		
		-- Begins first task of Necros Quest 3, checks if player has completed Necros Quest 2
		if (questTaskState == QuestState.Complete) then
			player:GrantQuest(0xEABF6800, 0x8D08BF00)

		end

	end

end

--Necros Quest 4
--questId 0x37E63300
--taskId1 0x68136480 faction battle
--taskId2 0xEA19C400 turn-in
local necrosQuest4 = false
local necrosQuest4Return = false

function gd.MPQuestControl.bestowNecros04QuestGlobalMP()

	if not necrosQuest4 then
		necrosQuest4 = true
		local player = Game.GetLocalPlayer()
		
		local questId = 0xEABF6800
		local taskId = 0x8D08BF00
		local questId02 = 0x37E63300
		local taskId02 = 0xEA19C400
	
		local questTaskState = player:GetQuestTaskState(questId, taskId)
		local questTaskState02 = player:GetQuestTaskState(questId02, taskId02)
		
		-- Begins first task of Necros Quest 4, checks if player has completed Necros Quest 3 and is not already on the quest
		if (questTaskState == QuestState.Complete && questTaskState02 != QuestState.InProgress && questTaskState02 != QuestState.Complete) then
			player:GrantQuest(0x37E63300, 0x68136480)

		end

	end

end

function gd.MPQuestControl.bestowNecros04ReturnQuestGlobalMP()

	if not necrosQuest4 then
		necrosQuest4 = true
		local player = Game.GetLocalPlayer()
		
		local questId = 0xEABF6800
		local taskId = 0x8D08BF00
		local questId02 = 0x37E63300
		local taskId02 = 0x68136480
	
		local questTaskState = player:GetQuestTaskState(questId, taskId)
		local questTaskState02 = player:GetQuestTaskState(questId02, taskId02)
		
		local questTaskState = player:GetQuestTaskState(questId, taskId)
		
		-- Begins 2nd task of Necros Quest 4, checks if player has completed Necros Quest 3, has the ashes, has killed the boss and is not already on the quest
		if (questTaskState == QuestState.Complete && player:HasItem("records/items/questitems/quest_factiondesecratedashes.dbr", 1, false) && player:HasToken("ZEALOT_CHAMPION_SLAIN") && questTaskState02 != QuestState.InProgress && questTaskState02 != QuestState.Complete) then
			player:GrantQuest(0x37E63300, 0xEA19C400)

		end

	end

end

--Necros Quest 5
--questId 0x418E3300
--taskId1 0xC3260C00 perform ritual
--taskId2 0xDEB7F100 turn-in
local necrosQuest5 = false

function gd.MPQuestControl.bestowNecros05QuestGlobalMP()

	if not necrosQuest5 then
		necrosQuest5 = true
		local player = Game.GetLocalPlayer()
		
		local questId = 0x37E63300
		local taskId = 0xEA19C400
		
		local questTaskState = player:GetQuestTaskState(questId, taskId)
		
		-- Begins first task of Necros Quest 5, checks if player has completed Necros Quest 4 and has 5000 Necro faction
		if (questTaskState == QuestState.Complete && player:GetFaction("USER5") >= 5000) then
			player:GrantQuest(0x418E3300, 0xC3260C00)

		end

	end

end

--Necros Quest 6
--questId 0xFE10E300
--taskId1 0x06A40030 choose deployment
local necrosQuest6 = false

function gd.MPQuestControl.bestowNecros06QuestGlobalMP()

	if not necrosQuest6 then
		necrosQuest6 = true
		local player = Game.GetLocalPlayer()
		
		local questId = 0x418E3300
		local taskId = 0xDEB7F100
		
		local questTaskState = player:GetQuestTaskState(questId, taskId)
		
		-- Begins first task of Necros Quest 6, checks if player has completed Necros Quest 5 and has 10000 Necro faction
		if (questTaskState == QuestState.Complete && player:GetFaction("USER5") >= 10000) then
			player:GrantQuest(0xFE10E300, 0x06A40030)

		end

	end

end

--Necros Quest Finale
--questId 0xDF9A0B00
--taskId1 0x56FE8E00 turn-in
local necrosQuest7 = false

function gd.MPQuestControl.bestowNecros07QuestGlobalMP()

	if not necrosQuest7 then
		necrosQuest7 = true
		local player = Game.GetLocalPlayer()
		
		local questId = 0x418E3300
		local taskId = 0xDEB7F100
		
		local questTaskState = player:GetQuestTaskState(questId, taskId)
		
		-- Begins first task of Necros Quest 7, checks if player has completed Necros Quest 5 and has 10000 Necro faction
		if (questTaskState == QuestState.Complete && player:GetFaction("USER5") >= 10000) then
			player:GrantQuest(0xDF9A0B00, 0x56FE8E00)

		end

	end

end


--Zealots Intro
--questId 0x7FF3C600
--taskId1 0x5D552400 turn-in
local zealotsIntroQuest = false

function gd.MPQuestControl.bestowZealotsIntroQuestGlobalMP()

	if not zealotsIntroQuest then
		zealotsIntroQuest = true
		local player = Game.GetLocalPlayer()
		
		local questId = 0xDF0DCC00
		local taskId = 0x02B5F500
		
		local questTaskState = player:GetQuestTaskState(questId, taskId)
		
		-- Begins first task of Necros Intro, checks if player has completed Allies Among the Ashes and selected Necromancers
		if (questTaskState == QuestState.Complete && player:HasToken("AREAC_ZEALOTS_CHOSEN")) then
			player:GrantQuest(0x7FF3C600, 0x5D552400)

		end

	end

end

--Zealots Quest 1
--questId 0x645A3980
--taskId1 0x5F68E680 collect sigils
local zealotsQuest1 = false

function gd.MPQuestControl.bestowZealots01QuestGlobalMP()

	if not zealotsQuest1 then
		zealotsQuest1 = true
		local player = Game.GetLocalPlayer()
		
		local questId = 0x7FF3C600
		local taskId = 0x5D552400
		
		local questTaskState = player:GetQuestTaskState(questId, taskId)
		
		-- Begins first task of Zealots Quest 1, checks if player has completed Zealots Intro
		if (questTaskState == QuestState.Complete) then
			player:GrantQuest(0x645A3980, 0x5F68E680)

		end

	end

end

--Zealots Quest 2
--questId 0xDFFF5100
--taskId1 0xF3000000 kill cultist captain
--taskId2 0x5497D880 turn-in
local zealotsQuest2 = false
local zealotsReturnQuest2 = false

function gd.MPQuestControl.bestowZealots02QuestGlobalMP()

	if not zealotsQuest2 then
		zealotsQuest2 = true
		local player = Game.GetLocalPlayer()
		
		local questId01 = 0x645A3980
		local taskId01 = 0x5F68E680
		local questId02 = 0xDFFF5100
		local taskid02 = 0x5497D880
		
		local questTaskState01 = player:GetQuestTaskState(questId01, taskId01)
		local questTaskState02 = player:GetQuestTaskState(questId02, taskid02)
		
		-- Begins first task of Zealots Quest 2, checks if player has completed Zealots Quest 1 and is not already on the quest
		if (questTaskState01 == QuestState.Complete && questTaskState02 != QuestState.Complete && questTaskState02 != QuestState.InProgress) then
			player:GrantQuest(0xDFFF5100, 0xF3000000)

		end

	end

end

function gd.MPQuestControl.bestowZealots02ReturnQuestGlobalMP()

	if not zealotsReturnQuest2 then
		zealotsReturnQuest2 = true
		local player = Game.GetLocalPlayer()
		
		local questId01 = 0x645A3980
		local taskId01 = 0x5F68E680
		local questId02 = 0xDFFF5100
		local taskid02 = 0xF3000000
		
		local questTaskState01 = player:GetQuestTaskState(questId01, taskId01)
		local questTaskState02 = player:GetQuestTaskState(questId02, taskid02)
		
		-- Begins 2nd task of Zealots Quest 2, checks if player has completed Zealots Quest 1, has killed the cultist captain and is not already on the quest
		if (questTaskState01 == QuestState.Complete && questTaskState02 != QuestState.Complete && questTaskState02 != QuestState.InProgress && player:HasToken("AREAC_CULTISTCAPTAIN01_KILLED")) then
			player:GrantQuest(0xDFFF5100, 0x5497D880)

		end

	end

end

--Zealots Quest 3
--questId 0x8513FA00
--taskId1 0xE2903300 kill necro captain
--taskId2 0x08E61870 turn-in
local zealotsQuest3 = false
local zealotsReturnQuest3 = false

function gd.MPQuestControl.bestowZealots03QuestGlobalMP()

	if not zealotsQuest3 then
		zealotsQuest3 = true
		local player = Game.GetLocalPlayer()
		
		local questId01 = 0xDFFF5100
		local taskId01 = 0x5497D880
		local questId02 = 0x8513FA00
		local taskid02 = 0x08E61870
		
		local questTaskState01 = player:GetQuestTaskState(questId01, taskId01)
		local questTaskState02 = player:GetQuestTaskState(questId02, taskid02)
		
		-- Begins first task of Zealots Quest 3, checks if player has completed Zealots Quest 2 and is not already on the quest
		if (questTaskState01 == QuestState.Complete && questTaskState02 != QuestState.Complete && questTaskState02 != QuestState.InProgress) then
			player:GrantQuest(0x8513FA00, 0xE2903300)

		end

	end

end

function gd.MPQuestControl.bestowZealots03ReturnQuestGlobalMP()

	if not zealotsReturnQuest3 then
		zealotsReturnQuest3 = true
		local player = Game.GetLocalPlayer()
		
		local questId01 = 0xDFFF5100
		local taskId01 = 0x5497D880
		local questId02 = 0x8513FA00
		local taskid02 = 0xE2903300
		
		local questTaskState01 = player:GetQuestTaskState(questId01, taskId01)
		local questTaskState02 = player:GetQuestTaskState(questId02, taskid02)
		
		-- Begins 2nd task of Zealots Quest 3, checks if player has completed Zealots Quest 2, has killed the necro captain and is not already on the quest
		if (questTaskState01 == QuestState.Complete && questTaskState02 != QuestState.Complete && questTaskState02 != QuestState.InProgress && player:HasToken("AREAC_NECROCAPTAIN_KILLED")) then
			player:GrantQuest(0x8513FA00, 0x08E61870)

		end

	end

end

--Zealots Quest 4
--questId 0x69240300
--taskId1 0x7F1F1E80 faction battle
--taskId2 0xBB335200 turn-in
local zealotsQuest4 = false
zealotsReturnQuest4 = false

function gd.MPQuestControl.bestowZealots04QuestGlobalMP()

	if not zealotsQuest4 then
		zealotsQuest4 = true
		local player = Game.GetLocalPlayer()
		
		local questId = 0x8513FA00
		local taskId = 0x08E61870
		local questId02 = 0x69240300
		local taskid02 = 0xBB335200
		
		local questTaskState = player:GetQuestTaskState(questId, taskId)
		local questTaskState02 = player:GetQuestTaskState(questId02, taskid02)
		
		-- Begins first task of Zealots Quest 4, checks if player has completed Zealots Quest 3 and and is not already on the quest
		if (questTaskState == QuestState.Complete && questTaskState02 != QuestState.InProgress && questTaskState02 != QuestState.Complete) then
			player:GrantQuest(0x69240300, 0x7F1F1E80)

		end

	end

end

function gd.MPQuestControl.bestowZealots04ReturnQuestGlobalMP()

	if not zealotsReturnQuest4 then
		zealotsReturnQuest4 = true
		local player = Game.GetLocalPlayer()
		
		local questId01 = 0x8513FA00
		local taskId01 = 0x08E61870
		local questId02 = 0x69240300
		local taskid02 = 0x7F1F1E80
		
		local questTaskState01 = player:GetQuestTaskState(questId01, taskId01)
		local questTaskState02 = player:GetQuestTaskState(questId02, taskid02)
		
		-- Begins 2nd task of Zealots Quest 4, checks if player has completed Zealots Quest 3, has the ashes, has killed the boss, has 5000 Zealot faction and and is not already on the quest
		if (questTaskState == QuestState.Complete && player:HasItem("records/items/questitems/quest_factionsacredashes.dbr", 1, false) && player:HasToken("NECRO_MALKADARR_SLAIN") && questTaskState02 != QuestState.InProgress && questTaskState02 != QuestState.Complete) then
			player:GrantQuest(0x69240300, 0xBB335200)

		end

	end

end


--Zealots Quest 5
--questId 0xDA527E00
--taskId1 0x8233C600 kill boss
--taskId1 0x150A5F80 turn in
local zealotsQuest5 = false

function gd.MPQuestControl.bestowZealots05QuestGlobalMP()

	if not zealotsQuest5 then
		zealotsQuest5 = true
		local player = Game.GetLocalPlayer()
		
		local questId01 = 0x69240300
		local taskId01 = 0xBB335200
		local questId02 = 0xDA527E00
		local taskid02 = 0x8233C600
		
		local questTaskState01 = player:GetQuestTaskState(questId01, taskId01)
		local questTaskState02 = player:GetQuestTaskState(questId02, taskid02)
		
		-- Begins first task of Zealots Quest 5, checks if player has completed Zealots Quest 4, has 5000 Zealot faction and is not already on the quest
		if (questTaskState01 == QuestState.Complete && player:GetFaction("USER8") >= 5000 && questTaskState02 != QuestState.Complete && questTaskState02 != QuestState.InProgress) then
			player:GrantQuest(0xDA527E00, 0x8233C600)

		end

	end

end

function gd.MPQuestControl.bestowZealots05ReturnQuestGlobalMP()

	if not zealotsReturnQuest5 then
		zealotsReturnQuest5 = true
		local player = Game.GetLocalPlayer()
		
		local questId01 = 0x69240300
		local taskId01 = 0xBB335200
		local questId02 = 0xDA527E00
		local taskid02 = 0x8233C600
		
		local questTaskState01 = player:GetQuestTaskState(questId01, taskId01)
		local questTaskState02 = player:GetQuestTaskState(questId02, taskid02)
		
		-- Begins 2nd task of Zealots Quest 5, checks if player has completed Zealots Quest 4, has killed the chthonic boss and has 5000 Zealot faction and is not already on the quest
		if (questTaskState01 == QuestState.Complete && player:GetFaction("USER8") >= 5000 && questTaskState02 != QuestState.Complete && questTaskState02 != QuestState.InProgress && player:HasToken("AREAC_CHTHONICVOIDBOSS_KILLED")) then
			player:GrantQuest(0xDA527E00, 0x150A5F80)

		end

	end

end

--Zealots Quest 6
--questId 0x2638DD40
--taskId1 0x5F3DF700 choose deployment
local zealotsQuest6 = false

function gd.MPQuestControl.bestowZealots06QuestGlobalMP()

	if not zealotsQuest6 then
		zealotsQuest6 = true
		local player = Game.GetLocalPlayer()
		
		local questId = 0xDA527E00
		local taskId = 0x150A5F80
		
		local questTaskState = player:GetQuestTaskState(questId, taskId)
		
		-- Begins first task of Zealot Quest 6, checks if player has completed Zealot Quest 5 and has 10000 Zealot faction
		if (questTaskState == QuestState.Complete && player:GetFaction("USER8") >= 10000) then
			player:GrantQuest(0x2638DD40, 0x5F3DF700)

		end

	end

end

--Zealots Quest Finale
--questId 0xEC2C9900
--taskId1 0x56FE8E00 collect item and turn-in
local zealotsQuest7 = false

function gd.MPQuestControl.bestowZealots07QuestGlobalMP()

	if not zealotsQuest7 then
		zealotsQuest7 = true
		local player = Game.GetLocalPlayer()
		
		local questId = 0xDA527E00
		local taskId = 0x150A5F80
		
		local questTaskState = player:GetQuestTaskState(questId, taskId)
		
		-- Begins first task of Zealot Quest 7, checks if player has completed Zealot Quest 5 and has 10000 Zealot faction
		if (questTaskState == QuestState.Complete && player:GetFaction("USER8") >= 10000) then
			player:GrantQuest(0xEC2C9900, 0x56FE8E00)

		end

	end

end


--
-- Act 4 Main Quests
--

-- True Threat
--questId 0x55B89100
--taskId1 0xC8296600 turn-in
local trueThreatQuest = false

function gd.MPQuestControl.bestowTrueThreatQuestGlobalMP()

	if not trueThreatQuest then
		trueThreatQuest = true
		local player = Game.GetLocalPlayer()
		
		local questId = 0x4AF35D00
		local taskId = 0xAF605B00
		
		local questTaskState = player:GetQuestTaskState(questId, taskId)
		
		-- Begins first task of True Threat, checks if player has completed The Inquisitor
		if (questTaskState == QuestState.Complete) then
			player:GrantQuest(0x55B89100, 0xC8296600)

		end

	end

end

-- Betrayal at Fort Ikon
--questId 0x29977DC0
--taskId1 0x948CE200 kill possessed commander
--taskId2 0x74489E80 unlock gates
--taskId3 0xAD50E800 turn-in
local fortIkonQuest = false
local fortIkonOpenGateQuest = false
local fortIkonReturnQuest = false

function gd.MPQuestControl.bestowFortIkonQuestGlobalMP()

	if not fortIkonQuest then
		fortIkonQuest = true
		local player = Game.GetLocalPlayer()
		
		local questId1 = 0x55B89100
		local taskId1 = 0xC8296600
		local questId2 = 0x29977DC0
		local taskId2 = 0x74489E80
		local taskId3 = 0xAD50E800
		
		local questTaskState1 = player:GetQuestTaskState(questId1, taskId1)
		local questTaskState2 = player:GetQuestTaskState(questId2, taskId2)
		local questTaskState3 = player:GetQuestTaskState(questId3, taskId3)
		
		-- Begins first task of Fort Ikon, checks if player has completed True Threat and is not already on the quest
		if (questTaskState1 == QuestState.Complete && questTaskState2 != QuestState.Complete && questTaskState2 != QuestState.InProgress && questTaskState3 != QuestState.Complete && questTaskState3 != QuestState.InProgress) then
			player:GrantQuest(0x29977DC0, 0x948CE200)
			GiveTokenToLocalPlayer("AREAC_CULTISTDOORS_OPEN")

		end

	end

end

function gd.MPQuestControl.bestowFortIkonOpenGateQuestGlobalMP()

	if not fortIkonOpenGateQuest then
		fortIkonOpenGateQuest = true
		local player = Game.GetLocalPlayer()
		
		local questId1 = 0x55B89100
		local taskId1 = 0xC8296600
		local questId2 = 0x29977DC0
		local taskId2 = 0x948CE200
		local taskId3 = 0xAD50E800
		
		local questTaskState1 = player:GetQuestTaskState(questId1, taskId1)
		local questTaskState2 = player:GetQuestTaskState(questId2, taskId2)
		local questTaskState3 = player:GetQuestTaskState(questId3, taskId3)
		
		-- Begins second task of Fort Ikon, checks if player has completed True Threat, has killed the boss and is not already on the quest
	if (player:HasToken("IKONCOMMANDER_SLAIN") && questTaskState1 == QuestState.Complete && questTaskState2 != QuestState.Complete && questTaskState2 != QuestState.InProgress && questTaskState3 != QuestState.Complete && questTaskState3 != QuestState.InProgress) then
			player:GrantQuest(0x29977DC0, 0x74489E80)
			GiveTokenToLocalPlayer("AREAD_FORTDUNGEON_OPEN")
			GiveTokenToLocalPlayer("AREAC_CULTISTDOORS_OPEN")

		end

	end

end

function gd.MPQuestControl.bestowFortIkonReturnQuestGlobalMP()

	if not fortIkonReturnQuest then
		fortIkonReturnQuest = true
		local player = Game.GetLocalPlayer()
		
		local questId1 = 0x55B89100
		local taskId1 = 0xC8296600
		local questId2 = 0x29977DC0
		local taskId2 = 0x948CE200
		local taskId3 = 0x74489E80
		
		local questTaskState1 = player:GetQuestTaskState(questId1, taskId1)
		local questTaskState2 = player:GetQuestTaskState(questId2, taskId2)
		local questTaskState3 = player:GetQuestTaskState(questId3, taskId3)
		
		-- Begins turn in task of Fort Ikon, checks if player has completed True Threat, has killed the boss, opened the gates and is not already on the quest
	if (player:HasToken("IKONCOMMANDER_SLAIN") && player:HasToken("FORTIKON_BLOCKADECLEARED") && questTaskState1 == QuestState.Complete && questTaskState2 != QuestState.Complete && questTaskState2 != QuestState.InProgress && questTaskState3 != QuestState.Complete && questTaskState3 != QuestState.InProgress) then
			player:GrantQuest(0x29977DC0, 0xAD50E800)
			GiveTokenToLocalPlayer("AREAD_FORTDUNGEON_OPEN")
			GiveTokenToLocalPlayer("AREAC_CULTISTDOORS_OPEN")

		end

	end

end

-- The Necropolis
--questId 0x3A385F80
--taskId1 0x4B035A00 go to Necropolis
--taskId2 0xD2D5A200 secure riftgate
--taskId3 0xC8296600 turn-in
local necropolisQuest = false
local necropolisReturnQuest = false

function gd.MPQuestControl.bestowTheNecropolisQuestGlobalMP()

	if not necropolisQuest then
		necropolisQuest = true
		local player = Game.GetLocalPlayer()
		
		local questId01 = 0x29977DC0
		local taskId01 = 0xAD50E800
		local questId02 = 0x3A385F80
		local taskid02 = 0xD2D5A200
		local questId03 = 0x3A385F80
		local taskid03 = 0xC8296600
		
		local questTaskState01 = player:GetQuestTaskState(questId01, taskId01)
		local questTaskState02 = player:GetQuestTaskState(questId02, taskid02)
		local questTaskState03 = player:GetQuestTaskState(questId03, taskid03)
		
		-- Begins first task of The Necropolis, checks if player has completed Betrayal at Fort Ikon and is not already on the quest
		if (questTaskState == QuestState.Complete && questTaskState02 != QuestState.InProgress && questTaskState02 != QuestState.Complete  && questTaskState03 != QuestState.InProgress && questTaskState03 != QuestState.Complete) then
			player:GrantQuest(0x3A385F80, 0x4B035A00)

		end

	end

end

function gd.MPQuestControl.bestowTheNecropolisReturnQuestGlobalMP()

	if not necropolisReturnQuest then
		necropolisReturnQuest = true
		local player = Game.GetLocalPlayer()
		
		local questId01 = 0x29977DC0
		local taskId01 = 0xAD50E800
		local questId02 = 0x3A385F80
		local taskid02 = 0x4B035A00
		local questId03 = 0x3A385F80
		local taskid03 = 0xD2D5A200
		
		local questTaskState01 = player:GetQuestTaskState(questId01, taskId01)
		local questTaskState02 = player:GetQuestTaskState(questId02, taskid02)
		local questTaskState03 = player:GetQuestTaskState(questId03, taskid03)
		
		-- Begins first task of The Necropolis, checks if player has completed Betrayal at Fort Ikon, is not already on the quest and has secured the riftgate
		if (player:HasToken("NECROPOLIS_RIFTGATE_SECURED") && questTaskState == QuestState.Complete && questTaskState02 != QuestState.InProgress && questTaskState02 != QuestState.Complete  && questTaskState03 != QuestState.InProgress && questTaskState03 != QuestState.Complete) then
			player:GrantQuest(0x3A385F80, 0xC8296600)

		end

	end

end



--Bane of Cairn
--questId 0x8BCA0200
--taskId1 0x74211E80 destroy blood wagons
--taskId2 0x1C575F80 kill final boss
--taskId3 0xAC3CCE00 turn-in
local baneOfCairnQuest = false
local baneOfCairnKillQuest = false

function gd.MPQuestControl.bestowBaneOfCairnQuestGlobalMP()

	if not baneOfCairnQuest then
		baneOfCairnQuest = true
		local player = Game.GetLocalPlayer()
		
		local questId01 = 0x3A385F80
		local taskId01 = 0xC8296600
		local questId02 = 0x8BCA0200
		local taskid02 = 0x1C575F80
		
		local questTaskState01 = player:GetQuestTaskState(questId01, taskId01)
		local questTaskState02 = player:GetQuestTaskState(questId02, taskid02)
		
		-- Begins first task of Bane of Cairn, checks if player has completed The Necropolis and is not already on the quest
		if (questTaskState01 == QuestState.Complete && questTaskState02 != QuestState.InProgress && questTaskState02 != QuestState.Complete) then
			player:GrantQuest(0x8BCA0200, 0x74211E80)

		end

	end

end

function gd.MPQuestControl.bestowBaneOfCairnKillQuestGlobalMP()

	if not baneOfCairnKillQuest then
		baneOfCairnKillQuest = true
		local player = Game.GetLocalPlayer()
		
		local questId01 = 0x3A385F80
		local taskId01 = 0xC8296600
		local questId02 = 0x8BCA0200
		local taskid02 = 0x74211E80
		
		local questTaskState01 = player:GetQuestTaskState(questId01, taskId01)
		local questTaskState02 = player:GetQuestTaskState(questId02, taskid02)
		
		-- Begins first task of Bane of Cairn, checks if player has completed The Necropolis, is not already on the quest and has destroyed the blood wagons
		if (player:HasToken("NECROPOLIS_WAGONS_ALLDESTROYED") && questTaskState01 == QuestState.Complete && questTaskState02 != QuestState.InProgress && questTaskState02 != QuestState.Complete) then
			player:GrantQuest(0x8BCA0200, 0x1C575F80)
			GiveTokenToLocalPlayer("AREAD_FINALCRYPT")

		end

	end

end


--
-- Act 4 Side Quests
--

--Cultist Activity
--questId 0xFF709C00
--taskId1 0xAFB37500 kill cultists
--taskId2 0xE80D8B00 turn-in
local cultActivityQuest = false
local cultActivityReturnQuest = false

function gd.MPQuestControl.bestowCultActivityQuestGlobalMP()

	if not cultActivityQuest then
		cultActivityQuest = true
		local player = Game.GetLocalPlayer()
		
		local questId = 0xFF709C00
		local taskId = 0xE80D8B00
		local questId02 = 0x8CB89F00
		local taskid02 = 0x60E9C580
				
		local questTaskState = player:GetQuestTaskState(questId, taskId)
		local questTaskState02 = player:GetQuestTaskState(questId02, taskid02)
		
		-- Begins first task of Cult Activity, checks if player is not already on the quest and has done the Aetherial Witch by slaying her.
		if (questTaskState != QuestState.Complete && questTaskState != QuestState.InProgress && questTaskState02 == QuestState.Complete) then
			player:GrantQuest(0xFF709C00, 0xAFB37500)

		end

	end

end

function gd.MPQuestControl.bestowCultActivityReturnQuestGlobalMP()

	if not cultActivityReturnQuest then
		cultActivityReturnQuest = true
		local player = Game.GetLocalPlayer()
		
		local questId = 0xFF709C00
		local taskId = 0xAFB37500
		local questId02 = 0x8CB89F00
		local taskid02 = 0x60E9C580
				
		local questTaskState = player:GetQuestTaskState(questId, taskId)
		local questTaskState02 = player:GetQuestTaskState(questId02, taskid02)
		
		-- Begins 2nd task of Cult Activity, checks if player is not already on the quest, has done the Aetherial Witch by slaying her and has the retroactive credit token
		if (questTaskState != QuestState.Complete && questTaskState != QuestState.InProgress && questTaskState02 == QuestState.Complete && player:HasToken("AREAD_CULTISTACTIVITY")) then
			player:GrantQuest(0xFF709C00, 0xE80D8B00)

		end

	end

end


--Aetherial Witch
--questId 0x8CB89F00
--taskId1 0xACCCF400 speak to exile / turn-in
--taskId2 0xC3A47100 kill exile scenario
--taskId3 0x60E9C580 kill scenario turn-in
local aetherialWitchQuest = false
local aetherialWitchKillQuest = false

function gd.MPQuestControl.bestowAetherialWitchQuestGlobalMP()

	if not aetherialWitchQuest then
		aetherialWitchQuest = true
		local player = Game.GetLocalPlayer()
		
		local questId = 0x29977DC0
		local taskId = 0xAD50E800
		
		local questTaskState = player:GetQuestTaskState(questId, taskId)
		
		-- Begins first task of Aetherial Witch, checks if player has done Fort Ikon.
		if (questTaskState == QuestState.Complete) then
			player:GrantQuest(0x8CB89F00, 0xACCCF400)

		end
		
	end

end

function gd.MPQuestControl.bestowAetherialWitchKillQuestGlobalMP()

	if not aetherialWitchKillQuest then
		aetherialWitchKillQuest = true
		local player = Game.GetLocalPlayer()
		
		local questId = 0x8CB89F00
		local taskId = 0xACCCF400
		local quest02Id = 0x29977DC0
		local task02Id = 0xAD50E800
		
		local questTaskState = player:GetQuestTaskState(questId, taskId)
		local questTaskState02 = player:GetQuestTaskState(quest02Id, task02Id)
		
		-- Begins the kill scenario of the Aetherial Witch quest. Checks if player is not on the first task and has done Fort Ikon.
		if (questTaskState != QuestState.InProgress && questTaskState != QuestState.Complete && questTaskState02 == QuestState.Complete) then
			player:GrantQuest(0x8CB89F00, 0xACCCF400)
			if (player:GetFaction("USER4") <= 0) then
				GiveTokenToLocalPlayer("EXILE_HATE")
				player:GiveFaction("USER4",-1)
			
			end

		elseif (questTaskState == QuestState.InProgress && player:GetFaction("USER4") <= 0) then
			-- If player is on the quest, they receive the Token and reputation change, checks if the player has faction of 0 or lower.
			GiveTokenToLocalPlayer("EXILE_HATE")
			player:GiveFaction("USER4",-1)
		
		end
	
	end

end

--Exile Quest 1
--questId 0x7D214C00
--taskId1 0x1501C060 collect Ancient Heart, Blood of Ch'thon and Ancient Brain
local exileQuest2 = false

function gd.MPQuestControl.bestowExileQuest1QuestGlobalMP()

	if not exileQuest2 then
		exileQuest2 = true
		local player = Game.GetLocalPlayer()
		
		local questId01 = 0x8CB89F00
		local taskId01 = 0xACCCF400

		local questTaskState01 = player:GetQuestTaskState(questId01, taskId01)

		-- Begins first task of Exile Quest 1, checks if player has done Aetherial Witch and has not chosen the kill scenario
		if (questTaskState == QuestState.Complete && player:HasToken("EXILE_TRUST")) then
			player:GrantQuest(0x7D214C00, 0x1501C060)

		end
		
	end

end

--Exile Quest 2
--questId 0x4BEDF980
--taskId1 0xF4924800 collect Fang
local exileQuest2 = false

function gd.MPQuestControl.bestowExileQuest2QuestGlobalMP()

	if not exileQuest2 then
		exileQuest2 = true
		local player = Game.GetLocalPlayer()
		
		local questId01 = 0x7D214C00
		local taskId01 = 0x1501C060
		
		local questTaskState01 = player:GetQuestTaskState(questId01, taskId01)
		
		-- Begins first task of Exile Quest 2, checks if player has Exile Quest 1
		if (questTaskState01 == QuestState.Complete) then
			player:GrantQuest(0xA7AFA500, 0xFC61DE00)

		end

	end

end

--Exile Quest 3
--questId 0xAFCF1B00
--taskId1 0x45E06C80 collect Archive
local exileQuest4 = false

function gd.MPQuestControl.bestowExileQuest3QuestGlobalMP()

	if not exileQuest3 then
		exileQuest3 = true
		local player = Game.GetLocalPlayer()
		
		local questId = 0x4BEDF980
		local taskId = 0xF4924800
		
		local questTaskState = player:GetQuestTaskState(questId, taskId)
		
		-- Begins first task of Exile Quest 3, checks if player has done Exile Quest 2 and has at least 1500 reputation
		if (questTaskState == QuestState.Complete && player:GetFaction("USER4") >= 1500) then
			player:GrantQuest(0xAFCF1B00, 0x45E06C80)

		end

	end

end

--Exile Quest 4
--questId 0xDFC0AE00
--taskId1 0xE2CF8B00 collect Obsidian Shard
local exileQuest4 = false

function gd.MPQuestControl.bestowExileQuest4QuestGlobalMP()

	if not exileQuest4 then
		exileQuest4 = true
		local player = Game.GetLocalPlayer()
		
		local questId = 0xAFCF1B00
		local taskId = 0x45E06C80
		
		local questTaskState = player:GetQuestTaskState(questId, taskId)
		
		-- Begins first task of Exile Quest 4, checks if player has done Exile Quest 2 and has at least 5000 reputation
		if (questTaskState == QuestState.Complete && player:GetFaction("USER4") >= 5000) then
			player:GrantQuest(0xDFC0AE00, 0xE2CF8B00)

		end

	end

end

--Exile Quest 5
--questId 0x90EB3600
--taskId1 0x4244C780 collect Aetherial Head
local exileQuest5 = false

function gd.MPQuestControl.bestowExileQuest5QuestGlobalMP()

	if not exileQuest5 then
		exileQuest5 = true
		local player = Game.GetLocalPlayer()
		
		local questId = 0xDFC0AE00
		local taskId = 0xE2CF8B00
		
		local questTaskState = player:GetQuestTaskState(questId, taskId)
		
		-- Begins first task of Exile Quest 5, checks if player has done Exile Quest 4 and has at least 10000 reputation
		if (questTaskState == QuestState.Complete && player:GetFaction("USER4") >= 10000) then
			player:GrantQuest(0x90EB3600, 0x4244C780)

		end

	end

end

--Precious Resources
--questId 0xC6E6A300
--taskId1 0x4FC02300 turn in resources
local preciousResourcesQuest = false

function gd.MPQuestControl.bestowPreciousResourcesQuestGlobalMP()

	if not preciousResourcesQuest then
		preciousResourcesQuest = true
		local player = Game.GetLocalPlayer()
		
		local questId = 0x55B89100
		local taskId = 0xC8296600
		
		local questTaskState = player:GetQuestTaskState(questId, taskId)
		
		-- Begins first task of Precious Resources, checks if player has done True Threat
		if (questTaskState == QuestState.Complete) then
			player:GrantQuest(0xC6E6A300, 0x4FC02300)

		end
		

	end

end

--Black Legion Finale
--questId 0x650A5F80
--taskId1 0xBC5D4600 kill
--taskId2 0x20191240 turn-in
local legionPriorityQuest = false
local legionPriorityReturnQuest

function gd.MPQuestControl.bestowLegionPriorityQuestGlobalMP()

	if not legionPriorityQuest then
		legionPriorityQuest = true
		local player = Game.GetLocalPlayer()
		
		local questId = 0x1A1369C0
		local taskId = 0xA534B400
		local questId02 = 0x650A5F80
		local taskId02 = 0x20191240
		
		local questTaskState = player:GetQuestTaskState(questId, taskId)
		local questTaskState02 = player:GetQuestTaskState(questId02, taskId02)
		
		-- Begins first task of Legion Priority, checks if player has completed Reaping What you Sow, has 10000 Black Legion faction and is not already on the quest
		if (questTaskState == QuestState.Complete && player:GetFaction("USER7") >= 10000 && questTaskState02 != QuestState.InProgress && questTaskState02 != QuestState.Complete) then
			player:GrantQuest(0x650A5F80, 0xBC5D4600)

		end

	end

end

function gd.MPQuestControl.bestowLegionPriorityReturnQuestGlobalMP()

	if not legionPriorityReturnQuest then
		legionPriorityReturnQuest = true
		local player = Game.GetLocalPlayer()
		
		local questId = 0x1A1369C0
		local taskId = 0xA534B400
		local questId02 = 0x650A5F80
		local taskId02 = 0xBC5D4600
		
		local questTaskState = player:GetQuestTaskState(questId, taskId)
		local questTaskState02 = player:GetQuestTaskState(questId02, taskId02)
		
		-- Begins first task of Legion Priority, checks if player has completed Reaping What you Sow, has killed the boss, has 10000 Black Legion faction and is not already on the quest
		if (questTaskState == QuestState.Complete && player:HasToken("LEGIONPRIORITY_BOSSKILLED") && player:GetFaction("USER7") >= 10000 && questTaskState02 != QuestState.InProgress && questTaskState02 != QuestState.Complete) then
			player:GrantQuest(0x650A5F80, 0x20191240)

		end

	end

end


