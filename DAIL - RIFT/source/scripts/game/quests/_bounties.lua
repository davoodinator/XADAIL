/*
	
	GRIM DAWN
	
	For more information, visit us at http://www.grimdawn.com
	
*/

gd.bounties = {}


--
-- Reset Scripts for all Bounties in case we make quest changes that reset them
--

-- reset fix for Devil's Crossing bounties in case we make changes that reset them
local DCReset = false

function gd.bounties.devilsCrossingResetGlobalMP()

	if not DCReset then
		DCReset = true
		local player = Game.GetLocalPlayer()

		if (player:HasToken("BOUNTY_ACTIVE_DC")) then
			if (player:GetQuestState(0xB9197800) != QuestState.InProgress && player:GetQuestState(0x2D29BDC0) != QuestState.InProgress && player:GetQuestState(0x4C22CD00) != QuestState.InProgress && player:GetQuestState(0x6A2C5480) != QuestState.InProgress && player:GetQuestState(0x97163600) != QuestState.InProgress && player:GetQuestState(0xB277A000) != QuestState.InProgress && player:GetQuestState(0xDA92A300) != QuestState.InProgress && player:GetQuestState(0xD19B9600) != QuestState.InProgress && player:GetQuestState(0xF95FE200) != QuestState.InProgress && player:GetQuestState(0x05D83A30) != QuestState.InProgress) then
				if (player:GetQuestState(0x0ED8BA20) != QuestState.InProgress && player:GetQuestState(0x0F0EACF0) != QuestState.InProgress && player:GetQuestState(0x207597C0) != QuestState.InProgress && player:GetQuestState(0x2A0DEA00) != QuestState.InProgress && player:GetQuestState(0x8DCF6D00) != QuestState.InProgress && player:GetQuestState(0x50DF6780) != QuestState.InProgress && player:GetQuestState(0x21A1C300) != QuestState.InProgress && player:GetQuestState(0xF1FBFB00) != QuestState.InProgress && player:GetQuestState(0x02749A68) != QuestState.InProgress && player:GetQuestState(0x134DA780) != QuestState.InProgress) then
					player:RemoveToken("BOUNTY_ACTIVE_DC")
				
				end

			end
			
		end
			
	end

end

-- reset fix for Rover bounties in case we make changes that reset them
local roversReset = false

function gd.bounties.roverResetGlobalMP()

	if not roversReset then
		roversReset = true
		local player = Game.GetLocalPlayer()

		if (player:HasToken("BOUNTY_ACTIVE_RO")) then
			if (player:GetQuestState(0xF77FEE00) != QuestState.InProgress && player:GetQuestState(0xC80EFF00) != QuestState.InProgress && player:GetQuestState(0xD4AFDD00) != QuestState.InProgress && player:GetQuestState(0xDDD85E00) != QuestState.InProgress && player:GetQuestState(0xE5409800) != QuestState.InProgress && player:GetQuestState(0xEC289700) != QuestState.InProgress && player:GetQuestState(0xF358E800) != QuestState.InProgress && player:GetQuestState(0xFA818800) != QuestState.InProgress && player:GetQuestState(0x0151EF20) != QuestState.InProgress && player:GetQuestState(0x08AA4220) != QuestState.InProgress) then
				if (player:GetQuestState(0x0F628E00) != QuestState.InProgress && player:GetQuestState(0x168AAA60) != QuestState.InProgress && player:GetQuestState(0x1E7B52E0) != QuestState.InProgress && player:GetQuestState(0x3603F3C0) != QuestState.InProgress && player:GetQuestState(0x42AD0600) != QuestState.InProgress && player:GetQuestState(0xFED00100) != QuestState.InProgress && player:GetQuestState(0x54D58480) != QuestState.InProgress && player:GetQuestState(0x5E95D880) != QuestState.InProgress && player:GetQuestState(0x66367D80) != QuestState.InProgress && player:GetQuestState(0x6DAE9D00) != QuestState.InProgress) then
					player:RemoveToken("BOUNTY_ACTIVE_RO")
					
				end

			end
			
		end
			
	end

end

-- reset fix for Homestead bounties in case we make changes that reset them
local HSReset = false

function gd.bounties.homesteadResetGlobalMP()

	if not HSReset then
		HSReset = true
		local player = Game.GetLocalPlayer()

		if (player:HasToken("BOUNTY_ACTIVE_HS")) then
			if (player:GetQuestState(0x14A1AB20) != QuestState.InProgress && player:GetQuestState(0x43C02F80) != QuestState.InProgress && player:GetQuestState(0x4BF82380) != QuestState.InProgress && player:GetQuestState(0x5358AB80) != QuestState.InProgress && player:GetQuestState(0x5A791600) != QuestState.InProgress && player:GetQuestState(0x61B94D80) != QuestState.InProgress && player:GetQuestState(0x6819E480) != QuestState.InProgress && player:GetQuestState(0x6F11CA80) != QuestState.InProgress && player:GetQuestState(0x76126800) != QuestState.InProgress && player:GetQuestState(0x7CBACD80) != QuestState.InProgress) then
				if (player:GetQuestState(0x82F2DF00) != QuestState.InProgress && player:GetQuestState(0x8902EF00) != QuestState.InProgress && player:GetQuestState(0x9CBC0300) != QuestState.InProgress && player:GetQuestState(0x8F638600) != QuestState.InProgress && player:GetQuestState(0x965BEF00) != QuestState.InProgress && player:GetQuestState(0xA30C3000) != QuestState.InProgress && player:GetQuestState(0xA93C9000) != QuestState.InProgress && player:GetQuestState(0xB01CDE00) != QuestState.InProgress && player:GetQuestState(0xB9857C00) != QuestState.InProgress && player:GetQuestState(0xBFF57600) != QuestState.InProgress) then
					player:RemoveToken("BOUNTY_ACTIVE_HS")
				
				end

			end
			
		end
			
	end

end

-- reset fix for Black Legion bounties in case we make changes that reset them
local BLReset = false

function gd.bounties.blackLegionResetGlobalMP()

	if not BLReset then
		BLReset = true
		local player = Game.GetLocalPlayer()

		if (player:HasToken("BOUNTY_ACTIVE_BL")) then
			if (player:GetQuestState(0x6432DB00) != QuestState.InProgress && player:GetQuestState(0x131980E0) != QuestState.InProgress && player:GetQuestState(0x1C51E900) != QuestState.InProgress && player:GetQuestState(0x24A1F840) != QuestState.InProgress && player:GetQuestState(0x2C224D00) != QuestState.InProgress && player:GetQuestState(0x330ACF80) != QuestState.InProgress && player:GetQuestState(0x3B336040) != QuestState.InProgress && player:GetQuestState(0x4343D580) != QuestState.InProgress && player:GetQuestState(0x4A63BD00) != QuestState.InProgress && player:GetQuestState(0x51243E00) != QuestState.InProgress) then
				if (player:GetQuestState(0x5B849900) != QuestState.InProgress && player:GetQuestState(0x0FD8E110) != QuestState.InProgress && player:GetQuestState(0x1A712440) != QuestState.InProgress && player:GetQuestState(0x22D19D40) != QuestState.InProgress && player:GetQuestState(0x2BAA1B40) != QuestState.InProgress && player:GetQuestState(0x80E67400) != QuestState.InProgress && player:GetQuestState(0x87AEA600) != QuestState.InProgress && player:GetQuestState(0x8E1F2300) != QuestState.InProgress && player:GetQuestState(0x94B71F00) != QuestState.InProgress && player:GetQuestState(0x9B279C00) != QuestState.InProgress) then
					if (player:GetQuestState(0xA1AFB200) != QuestState.InProgress && player:GetQuestState(0xA8506500) != QuestState.InProgress && player:GetQuestState(0xAF189800) != QuestState.InProgress && player:GetQuestState(0xB548F800) != QuestState.InProgress && player:GetQuestState(0xBBC12700) != QuestState.InProgress) then
						player:RemoveToken("BOUNTY_ACTIVE_BL")
					
					end
				
				end

			end
			
		end
			
	end

end

-- reset fix for Kymon's Chosen bounties in case we make changes that reset them
local KCReset = false

function gd.bounties.kymonChosenResetGlobalMP()
	if not KCReset then
		KCReset = true
		local player = Game.GetLocalPlayer()

		if (player:HasToken("BOUNTY_ACTIVE_KC")) then
			if (player:GetQuestState(0x34A70600) != QuestState.InProgress && player:GetQuestState(0x44079980) != QuestState.InProgress && player:GetQuestState(0x4F57FF00) != QuestState.InProgress && player:GetQuestState(0x5798AB00) != QuestState.InProgress && player:GetQuestState(0x60712980) != QuestState.InProgress && player:GetQuestState(0x68A16B80) != QuestState.InProgress && player:GetQuestState(0x7249A400) != QuestState.InProgress && player:GetQuestState(0x7AE20500) != QuestState.InProgress && player:GetQuestState(0x87128F00) != QuestState.InProgress && player:GetQuestState(0x913B0200) != QuestState.InProgress) then
				if (player:GetQuestState(0x9D1B8800) != QuestState.InProgress && player:GetQuestState(0xA5744F00) != QuestState.InProgress && player:GetQuestState(0xAC6C3500) != QuestState.InProgress && player:GetQuestState(0xB40CDA00) != QuestState.InProgress && player:GetQuestState(0xBADD4100) != QuestState.InProgress && player:GetQuestState(0xC13D5500) != QuestState.InProgress && player:GetQuestState(0xC86DA600) != QuestState.InProgress && player:GetQuestState(0xCF9DF700) != QuestState.InProgress && player:GetQuestState(0xD6769300) != QuestState.InProgress && player:GetQuestState(0xDD7EE300) != QuestState.InProgress) then
					player:RemoveToken("BOUNTY_ACTIVE_KC")
				
				end

			end
			
		end
			
	end

end

-- reset fix for Order of Death's Vigil bounties in case we make changes that reset them
local ODVReset = false

function gd.bounties.orderDeathsVigilResetGlobalMP()
	if not ODVReset then
		ODVReset = true
		local player = Game.GetLocalPlayer()

		if (player:HasToken("BOUNTY_ACTIVE_ODV")) then
			if (player:GetQuestState(0xE8A74600) != QuestState.InProgress && player:GetQuestState(0x2E1E8440) != QuestState.InProgress && player:GetQuestState(0x35DE72C0) != QuestState.InProgress && player:GetQuestState(0x3E2F0540) != QuestState.InProgress && player:GetQuestState(0x44FF6C80) != QuestState.InProgress && player:GetQuestState(0x4CF7C680) != QuestState.InProgress && player:GetQuestState(0x54304C80) != QuestState.InProgress && player:GetQuestState(0x5A504300) != QuestState.InProgress && player:GetQuestState(0x60908980) != QuestState.InProgress && player:GetQuestState(0x6708B880) != QuestState.InProgress) then
				if (player:GetQuestState(0x6F216300) != QuestState.InProgress && player:GetQuestState(0x9132E400) != QuestState.InProgress && player:GetQuestState(0x84928A00) != QuestState.InProgress && player:GetQuestState(0x8AE2B700) != QuestState.InProgress && player:GetQuestState(0x7C79DF80) != QuestState.InProgress && player:GetQuestState(0x97B34700) != QuestState.InProgress && player:GetQuestState(0xA23BA400) != QuestState.InProgress && player:GetQuestState(0xA87BEB00) != QuestState.InProgress && player:GetQuestState(0xAE4C6100) != QuestState.InProgress && player:GetQuestState(0xB5444700) != QuestState.InProgress) then
					player:RemoveToken("BOUNTY_ACTIVE_ODV")
				
				end

			end
			
		end
			
	end

end

-- reset fix for The Outcast bounties in case we make changes that reset them
local ExileReset = false

function gd.bounties.exileResetGlobalMP()
	if not ExileReset then
		ExileReset = true
		local player = Game.GetLocalPlayer()

		if (player:HasToken("BOUNTY_ACTIVE_EXILE")) then
			if (player:GetQuestState(0xFF588600) != QuestState.InProgress && player:GetQuestState(0xCC8F7E00) != QuestState.InProgress && player:GetQuestState(0xD5D7CD00) != QuestState.InProgress && player:GetQuestState(0xDD680800) != QuestState.InProgress && player:GetQuestState(0xE4D04100) != QuestState.InProgress && player:GetQuestState(0xEBF8E100) != QuestState.InProgress && player:GetQuestState(0xF2E91500) != QuestState.InProgress && player:GetQuestState(0xF9D19800) != QuestState.InProgress && player:GetQuestState(0x00199002) != QuestState.InProgress && player:GetQuestState(0x06E9F704) != QuestState.InProgress) then
				if (player:GetQuestState(0x10B28000) != QuestState.InProgress && player:GetQuestState(0x176ACC00) != QuestState.InProgress && player:GetQuestState(0x1E133180) != QuestState.InProgress && player:GetQuestState(0x24AB2D40) != QuestState.InProgress && player:GetQuestState(0x2BEBE840) != QuestState.InProgress && player:GetQuestState(0x346C2E00) != QuestState.InProgress && player:GetQuestState(0x3D048F00) != QuestState.InProgress && player:GetQuestState(0x444CFB80) != QuestState.InProgress && player:GetQuestState(0x4B8D3300) != QuestState.InProgress && player:GetQuestState(0x5325A380) != QuestState.InProgress) then
					player:RemoveToken("BOUNTY_ACTIVE_EXILE")
				
				end

			end
			
		end
			
	end

end

--
-- Grim Dawn Bounties
-- Bounty Limit per faction
-- Default Bounty Cap per session is 5
--

local bountyLimit = 5
local DCBounties = 0
local ROBounties = 0
local HSBounties = 0
local BLBounties = 0
local KCBounties = 0
local ODVBounties = 0
local ExileBounties = 0

-- Devil's Crossing
function gd.bounties.DCCheck()

	local test = true
	
	if DCBounties < bountyLimit then
		test = false
	
	end
	
	return test

end

function gd.bounties.DCIncrement()
	
	DCBounties = DCBounties + 1

end

-- Rovers
function gd.bounties.ROCheck()

	local test = true
	
	if ROBounties < bountyLimit then
		test = false
	
	end
	
	return test

end

function gd.bounties.ROIncrement()
	
	ROBounties = ROBounties + 1

end

-- Homestead
function gd.bounties.HSCheck()

	local test = true
	
	if HSBounties < bountyLimit then
		test = false
	
	end
	
	return test

end

function gd.bounties.HSIncrement()
	
	HSBounties = HSBounties + 1

end

-- Black Legion
function gd.bounties.BLCheck()

	local test = true
	
	if BLBounties < bountyLimit then
		test = false
	
	end
	
	return test

end

function gd.bounties.BLIncrement()
	
	BLBounties = BLBounties + 1

end

-- Kymon's Chosen
function gd.bounties.KCCheck()

	local test = true
	
	if KCBounties < bountyLimit then
		test = false
	
	end
	
	return test

end

function gd.bounties.KCIncrement()
	
	KCBounties = KCBounties + 1

end

-- Order of Death's Vigil
function gd.bounties.ODVCheck()

	local test = true
	
	if ODVBounties < bountyLimit then
		test = false
	
	end
	
	return test

end

function gd.bounties.ODVIncrement()
	
	ODVBounties = ODVBounties + 1

end

-- The Outcast
function gd.bounties.ExileCheck()

	local test = true
	
	if ExileBounties < bountyLimit then
		test = false
	
	end
	
	return test

end

function gd.bounties.ExileIncrement()
	
	ExileBounties = ExileBounties + 1

end



--
-- Bounty Monster Spawns
-- Controls spawns active only during a bounty. Spawns if any players has the bounty active, rather than depending on host state.
--
local BountyState = { Default = 0, Spawned = 1 }

-- Bounty Monster Level Control
local monsterId = 0

local function CharacterCreateArgs()

	local averageLevel = Game.GetAveragePlayerLevel()
	local monsterLevel = 0
	local maxLevel = 0

	if (Game.GetGameDifficulty() == Game.Difficulty.Normal) then
		maxLevel = 60
	elseif (Game.GetGameDifficulty() == Game.Difficulty.Epic) then
		maxLevel = 75
	else
		maxLevel = 200
	end
	
	if (averageLevel > maxLevel) then
		monsterLevel = ((maxLevel+(maxLevel/50))+2)
	else
		monsterLevel = ((averageLevel+(averageLevel/50))+3)

	end

	return monsterLevel, nil
	
end

-- General bounty functions
gd.bounties.bountyOnDestroy = ClearObjectUserdata

-- Devil's Crossing Spawns
--Bounty 06
local DCBounty06Id = 0
local DCBounty06Spawned = false

local DCBounty06StateObjects = orderedTable()
	DCBounty06StateObjects["DC_BOUNTY06"	] = { state = BountyState.Spawned, dbr = "records/creatures/enemies/bounties/dc_bounty06.dbr"}
	DCBounty06StateObjects[""					 	] = { state = BountyState.Default, dbr = nil }

function gd.bounties.DCBounty06OnAddToWorld(objectId)
	if Server then
		if (not DCBounty06Spawned) then
			local player = Game.GetLocalPlayer()
			local MPOverrideDbr = nil
			local MPOverrideState = false

			if (player:AnyoneHasToken("DC_BOUNTY06")) then
				MPOverrideDbr = "records/creatures/enemies/bounties/dc_bounty06.dbr"
				MPOverrideState = true
				DCBounty06Spawned = true
				
			end

			monsterId = objectId
			DCBounty06Id = objectId
	
			local userdata = {}
			local didWork, newState = TokenStateBasedObjectSwap(objectId, userdata, DCBounty06StateObjects, Character, CharacterCreateArgs, MPOverrideState, MPOverrideDbr)
	
			Shared.setUserdata(objectId, userdata)
	
			-- Don't respawn the Monster next time. If spawned as hostile, will be saved into the world
			if (newState == BountyState.Spawned) then
				DCBounty06Spawned = true
				
			end
			
		end
	
	end
	
end

function gd.bounties.spawnDCBounty06()
	if Server then
		local player = Game.GetLocalPlayer()
		
		if not DCBounty06Spawned then
			local player = Game.GetLocalPlayer()
			local MPOverrideDbr = nil
			local MPOverrideState = false

			local entity = Entity.Get(DCBounty06Id)
			
			if entity != nil then
				if (player:AnyoneHasToken("DC_BOUNTY06")) then
					MPOverrideDbr = "records/creatures/enemies/bounties/dc_bounty06.dbr"
					MPOverrideState = true
					
				end
				
				monsterId = DCBounty06Id
				local didWork, newState = UpdateObjectSwap(DCBounty06Id, DCBounty06StateObjects, Character, CharacterCreateArgs, MPOverrideState, MPOverrideDbr)
		
				-- Don't respawn the Monster next time. If spawned as hostile, will be saved into the world
				DCBounty06Spawned = true
			
			end
			
		end
	
	end

end

--Bounty 07
local DCBounty07Id = 0
local DCBounty07Spawned = false

local DCBounty07StateObjects = orderedTable()
	DCBounty07StateObjects["DC_BOUNTY07"	] = { state = BountyState.Spawned, dbr = "records/creatures/enemies/bounties/dc_bounty07.dbr"}
	DCBounty07StateObjects[""					 	] = { state = BountyState.Default, dbr = nil }

function gd.bounties.DCBounty07OnAddToWorld(objectId)
	if Server then
		if (not DCBounty07Spawned) then
			local player = Game.GetLocalPlayer()
			local MPOverrideDbr = nil
			local MPOverrideState = false

			if (player:AnyoneHasToken("DC_BOUNTY07")) then
				MPOverrideDbr = "records/creatures/enemies/bounties/dc_bounty07.dbr"
				MPOverrideState = true
				DCBounty07Spawned = true
				
			end

			monsterId = objectId
			DCBounty07Id = objectId
	
			local userdata = {}
			local didWork, newState = TokenStateBasedObjectSwap(objectId, userdata, DCBounty07StateObjects, Character, CharacterCreateArgs, MPOverrideState, MPOverrideDbr)
	
			Shared.setUserdata(objectId, userdata)
	
			-- Don't respawn the Monster next time. If spawned as hostile, will be saved into the world
			if (newState == BountyState.Spawned) then
				DCBounty07Spawned = true
				
			end
			
		end
	
	end
	
end

function gd.bounties.spawnDCBounty07()
	if Server then
		local player = Game.GetLocalPlayer()
		
		if not DCBounty07Spawned then
			local player = Game.GetLocalPlayer()
			local MPOverrideDbr = nil
			local MPOverrideState = false

			local entity = Entity.Get(DCBounty07Id)
			
			if entity != nil then
				if (player:AnyoneHasToken("DC_BOUNTY07")) then
					MPOverrideDbr = "records/creatures/enemies/bounties/dc_bounty07.dbr"
					MPOverrideState = true
					
				end
				
				monsterId = DCBounty07Id
				local didWork, newState = UpdateObjectSwap(DCBounty07Id, DCBounty07StateObjects, Character, CharacterCreateArgs, MPOverrideState, MPOverrideDbr)
		
				-- Don't respawn the Monster next time. If spawned as hostile, will be saved into the world
				DCBounty07Spawned = true
			
			end
			
		end
	
	end

end

--Bounty 08
local DCBounty08Id = 0
local DCBounty08Spawned = false

local DCBounty08StateObjects = orderedTable()
	DCBounty08StateObjects["DC_BOUNTY08"	] = { state = BountyState.Spawned, dbr = "records/creatures/enemies/bounties/dc_bounty08.dbr"}
	DCBounty08StateObjects[""					 	] = { state = BountyState.Default, dbr = nil }

function gd.bounties.DCBounty08OnAddToWorld(objectId)
	if Server then
		if (not DCBounty08Spawned) then
			local player = Game.GetLocalPlayer()
			local MPOverrideDbr = nil
			local MPOverrideState = false

			if (player:AnyoneHasToken("DC_BOUNTY08")) then
				MPOverrideDbr = "records/creatures/enemies/bounties/dc_bounty08.dbr"
				MPOverrideState = true
				DCBounty08Spawned = true
				
			end

			monsterId = objectId
			DCBounty08Id = objectId
	
			local userdata = {}
			local didWork, newState = TokenStateBasedObjectSwap(objectId, userdata, DCBounty08StateObjects, Character, CharacterCreateArgs, MPOverrideState, MPOverrideDbr)
	
			Shared.setUserdata(objectId, userdata)
	
			-- Don't respawn the Monster next time. If spawned as hostile, will be saved into the world
			if (newState == BountyState.Spawned) then
				DCBounty08Spawned = true
				
			end
			
		end
	
	end
	
end

function gd.bounties.spawnDCBounty08()
	if Server then
		local player = Game.GetLocalPlayer()
		
		if not DCBounty08Spawned then
			local player = Game.GetLocalPlayer()
			local MPOverrideDbr = nil
			local MPOverrideState = false

			local entity = Entity.Get(DCBounty08Id)
			
			if entity != nil then
				if (player:AnyoneHasToken("DC_BOUNTY08")) then
					MPOverrideDbr = "records/creatures/enemies/bounties/dc_bounty08.dbr"
					MPOverrideState = true
					
				end
				
				monsterId = DCBounty08Id
				local didWork, newState = UpdateObjectSwap(DCBounty08Id, DCBounty08StateObjects, Character, CharacterCreateArgs, MPOverrideState, MPOverrideDbr)
		
				-- Don't respawn the Monster next time. If spawned as hostile, will be saved into the world
				DCBounty08Spawned = true
			
			end
			
		end
	
	end

end

--Bounty 09
local DCBounty09Id = 0
local DCBounty09Spawned = false

local DCBounty09StateObjects = orderedTable()
	DCBounty09StateObjects["DC_BOUNTY09"	] = { state = BountyState.Spawned, dbr = "records/creatures/enemies/bounties/dc_bounty09.dbr"}
	DCBounty09StateObjects[""					 	] = { state = BountyState.Default, dbr = nil }

function gd.bounties.DCBounty09OnAddToWorld(objectId)
	if Server then
		if (not DCBounty09Spawned) then
			local player = Game.GetLocalPlayer()
			local MPOverrideDbr = nil
			local MPOverrideState = false

			if (player:AnyoneHasToken("DC_BOUNTY09")) then
				MPOverrideDbr = "records/creatures/enemies/bounties/dc_bounty09.dbr"
				MPOverrideState = true
				DCBounty09Spawned = true
				
			end

			monsterId = objectId
			DCBounty09Id = objectId
	
			local userdata = {}
			local didWork, newState = TokenStateBasedObjectSwap(objectId, userdata, DCBounty09StateObjects, Character, CharacterCreateArgs, MPOverrideState, MPOverrideDbr)
	
			Shared.setUserdata(objectId, userdata)
	
			-- Don't respawn the Monster next time. If spawned as hostile, will be saved into the world
			if (newState == BountyState.Spawned) then
				DCBounty09Spawned = true
				
			end
			
		end
	
	end
	
end

function gd.bounties.spawnDCBounty09()
	if Server then
		local player = Game.GetLocalPlayer()
		
		if not DCBounty09Spawned then
			local player = Game.GetLocalPlayer()
			local MPOverrideDbr = nil
			local MPOverrideState = false

			local entity = Entity.Get(DCBounty09Id)
			
			if entity != nil then
				if (player:AnyoneHasToken("DC_BOUNTY09")) then
					MPOverrideDbr = "records/creatures/enemies/bounties/dc_bounty09.dbr"
					MPOverrideState = true
					
				end
			
				monsterId = DCBounty09Id
				local didWork, newState = UpdateObjectSwap(DCBounty09Id, DCBounty09StateObjects, Character, CharacterCreateArgs, MPOverrideState, MPOverrideDbr)
		
				-- Don't respawn the Monster next time. If spawned as hostile, will be saved into the world
				DCBounty09Spawned = true
			
			end
			
		end
	
	end

end

--Bounty 10
local DCBounty10Id = 0
local DCBounty10Spawned = false

local DCBounty10StateObjects = orderedTable()
	DCBounty10StateObjects["DC_BOUNTY10"	] = { state = BountyState.Spawned, dbr = "records/creatures/enemies/bounties/dc_bounty10.dbr"}
	DCBounty10StateObjects[""					 	] = { state = BountyState.Default, dbr = nil }

function gd.bounties.DCBounty10OnAddToWorld(objectId)
	if Server then
		if (not DCBounty10Spawned) then
			local player = Game.GetLocalPlayer()
			local MPOverrideDbr = nil
			local MPOverrideState = false

			if (player:AnyoneHasToken("DC_BOUNTY10")) then
				MPOverrideDbr = "records/creatures/enemies/bounties/dc_bounty10.dbr"
				MPOverrideState = true
				DCBounty10Spawned = true
				
			end

			monsterId = objectId
			DCBounty10Id = objectId
	
			local userdata = {}
			local didWork, newState = TokenStateBasedObjectSwap(objectId, userdata, DCBounty10StateObjects, Character, CharacterCreateArgs, MPOverrideState, MPOverrideDbr)
	
			Shared.setUserdata(objectId, userdata)
	
			-- Don't respawn the Monster next time. If spawned as hostile, will be saved into the world
			if (newState == BountyState.Spawned) then
				DCBounty10Spawned = true
				
			end
			
		end
	
	end
	
end

function gd.bounties.spawnDCBounty10()
	if Server then
		local player = Game.GetLocalPlayer()
		
		if not DCBounty10Spawned then
			local player = Game.GetLocalPlayer()
			local MPOverrideDbr = nil
			local MPOverrideState = false
			
			local entity = Entity.Get(DCBounty10Id)
			
			if entity != nil then
				if (player:AnyoneHasToken("DC_BOUNTY10")) then
					MPOverrideDbr = "records/creatures/enemies/bounties/dc_bounty10.dbr"
					MPOverrideState = true
					
				end
				
				monsterId = DCBounty10Id
				local didWork, newState = UpdateObjectSwap(DCBounty10Id, DCBounty10StateObjects, Character, CharacterCreateArgs, MPOverrideState, MPOverrideDbr)
		
				-- Don't respawn the Monster next time. If spawned as hostile, will be saved into the world
				DCBounty10Spawned = true
			
			end
			
		end
	
	end

end

--Bounty 11
local DCBounty11Id = 0
local DCBounty11Spawned = false

local DCBounty11StateObjects = orderedTable()
	DCBounty11StateObjects["DC_BOUNTY11"	] = { state = BountyState.Spawned, dbr = "records/creatures/enemies/bounties/dc_bounty11.dbr"}
	DCBounty11StateObjects[""					 	] = { state = BountyState.Default, dbr = nil }

function gd.bounties.DCBounty11OnAddToWorld(objectId)
	if Server then
		if (not DCBounty11Spawned) then
			local player = Game.GetLocalPlayer()
			local MPOverrideDbr = nil
			local MPOverrideState = false

			if (player:AnyoneHasToken("DC_BOUNTY11")) then
				MPOverrideDbr = "records/creatures/enemies/bounties/dc_bounty11.dbr"
				MPOverrideState = true
				DCBounty11Spawned = true
				
			end

			monsterId = objectId
			DCBounty11Id = objectId
	
			local userdata = {}
			local didWork, newState = TokenStateBasedObjectSwap(objectId, userdata, DCBounty11StateObjects, Character, CharacterCreateArgs, MPOverrideState, MPOverrideDbr)
	
			Shared.setUserdata(objectId, userdata)
	
			-- Don't respawn the Monster next time. If spawned as hostile, will be saved into the world
			if (newState == BountyState.Spawned) then
				DCBounty11Spawned = true
				
			end
			
		end
	
	end
	
end

function gd.bounties.spawnDCBounty11()
	if Server then
		local player = Game.GetLocalPlayer()
		
		if not DCBounty11Spawned then
			local player = Game.GetLocalPlayer()
			local MPOverrideDbr = nil
			local MPOverrideState = false
			
			local entity = Entity.Get(DCBounty11Id)
			
			if entity != nil then
				if (player:AnyoneHasToken("DC_BOUNTY11")) then
					MPOverrideDbr = "records/creatures/enemies/bounties/dc_bounty11.dbr"
					MPOverrideState = true
					
				end
				monsterId = DCBounty11Id
				local didWork, newState = UpdateObjectSwap(DCBounty11Id, DCBounty11StateObjects, Character, CharacterCreateArgs, MPOverrideState, MPOverrideDbr)
	
				-- Don't respawn the Monster next time. If spawned as hostile, will be saved into the world
				DCBounty11Spawned = true
			
			end
			
		end
	
	end

end

--Bounty 15
local DCBounty15Id = 0
local DCBounty15Spawned = false

local DCBounty15StateObjects = orderedTable()
	DCBounty15StateObjects["DC_BOUNTY15"	] = { state = BountyState.Spawned, dbr = "records/creatures/enemies/bounties/dc_bounty15.dbr"}
	DCBounty15StateObjects[""					 	] = { state = BountyState.Default, dbr = nil }

function gd.bounties.DCBounty15OnAddToWorld(objectId)
	if Server then
		if (not DCBounty15Spawned) then
			local player = Game.GetLocalPlayer()
			local MPOverrideDbr = nil
			local MPOverrideState = false

			if (player:AnyoneHasToken("DC_BOUNTY15")) then
				MPOverrideDbr = "records/creatures/enemies/bounties/dc_bounty15.dbr"
				MPOverrideState = true
				DCBounty15Spawned = true
				
			end

			monsterId = objectId
			DCBounty15Id = objectId
	
			local userdata = {}
			local didWork, newState = TokenStateBasedObjectSwap(objectId, userdata, DCBounty15StateObjects, Character, CharacterCreateArgs, MPOverrideState, MPOverrideDbr)
	
			Shared.setUserdata(objectId, userdata)
	
			-- Don't respawn the Monster next time. If spawned as hostile, will be saved into the world
			if (newState == BountyState.Spawned) then
				DCBounty15Spawned = true
				
			end
			
		end
	
	end
	
end

function gd.bounties.spawnDCBounty15()
	if Server then
		local player = Game.GetLocalPlayer()
		
		if not DCBounty15Spawned then
			local player = Game.GetLocalPlayer()
			local MPOverrideDbr = nil
			local MPOverrideState = false
			
			local entity = Entity.Get(DCBounty15Id)
			
			if entity != nil then
				if (player:AnyoneHasToken("DC_BOUNTY15")) then
					MPOverrideDbr = "records/creatures/enemies/bounties/dc_bounty15.dbr"
					MPOverrideState = true
				
				end
				
				monsterId = DCBounty15Id
				local didWork, newState = UpdateObjectSwap(DCBounty15Id, DCBounty15StateObjects, Character, CharacterCreateArgs, MPOverrideState, MPOverrideDbr)
	
				-- Don't respawn the Monster next time. If spawned as hostile, will be saved into the world
				DCBounty15Spawned = true
			
			end
			
		end
	
	end

end

--Bounty 17
local DCBounty17Id = 0
local DCBounty17Spawned = false

local DCBounty17StateObjects = orderedTable()
	DCBounty17StateObjects["DC_BOUNTY17"	] = { state = BountyState.Spawned, dbr = "records/creatures/enemies/bounties/dc_bounty17.dbr"}
	DCBounty17StateObjects[""					 	] = { state = BountyState.Default, dbr = nil }

function gd.bounties.DCBounty17OnAddToWorld(objectId)
	if Server then
		if (not DCBounty17Spawned) then
			local player = Game.GetLocalPlayer()
			local MPOverrideDbr = nil
			local MPOverrideState = false

			if (player:AnyoneHasToken("DC_BOUNTY17")) then
				MPOverrideDbr = "records/creatures/enemies/bounties/dc_bounty17.dbr"
				MPOverrideState = true
				DCBounty17Spawned = true
				
			end

			monsterId = objectId
			DCBounty17Id = objectId
	
			local userdata = {}
			local didWork, newState = TokenStateBasedObjectSwap(objectId, userdata, DCBounty17StateObjects, Character, CharacterCreateArgs, MPOverrideState, MPOverrideDbr)
	
			Shared.setUserdata(objectId, userdata)
	
			-- Don't respawn the Monster next time. If spawned as hostile, will be saved into the world
			if (newState == BountyState.Spawned) then
				DCBounty17Spawned = true
				
			end
			
		end
	
	end
	
end

function gd.bounties.spawnDCBounty17()
	if Server then
		local player = Game.GetLocalPlayer()
		
		if not DCBounty17Spawned then
			local player = Game.GetLocalPlayer()
			local MPOverrideDbr = nil
			local MPOverrideState = false
			
			local entity = Entity.Get(DCBounty17Id)
			
			if entity != nil then
				if (player:AnyoneHasToken("DC_BOUNTY17")) then
					MPOverrideDbr = "records/creatures/enemies/bounties/dc_bounty17.dbr"
					MPOverrideState = true
					
				end
				
				monsterId = DCBounty17Id
				local didWork, newState = UpdateObjectSwap(DCBounty17Id, DCBounty17StateObjects, Character, CharacterCreateArgs, MPOverrideState, MPOverrideDbr)
	
				-- Don't respawn the Monster next time. If spawned as hostile, will be saved into the world
				DCBounty17Spawned = true
			
			end
			
		end
	
	end

end

-- Boris, the Pitmaster AND Bounty 18
-- Unique boss spawn that is not always up. If a player is on this bounty, always spawns
local PitmasterId = 0
local PitmasterSpawned = false

local function PitmasterCreateArgs()

	local averageLevel = Game.GetAveragePlayerLevel()
	local monsterLevel = 0
	local maxLevel = 0

	if (Game.GetGameDifficulty() == Game.Difficulty.Normal) then
		maxLevel = 35
	elseif (Game.GetGameDifficulty() == Game.Difficulty.Epic) then
		maxLevel = 55
	else
		maxLevel = 200
	end
	
	if (averageLevel > maxLevel) then
		monsterLevel = ((maxLevel+(maxLevel/22))+3)*(0.99+(Game.GetNumPlayers()/100))
	else
		monsterLevel = ((averageLevel+(averageLevel/22))+3)*(0.99+(Game.GetNumPlayers()/100))

	end

	return monsterLevel, nil
	
end

function gd.bounties.DCBounty18OnAddToWorld(objectId)
	if Server then
		if (not PitmasterSpawned) then
			math.randomseed(Time.Now())
			local randomizer = random(1,100)
			local player = Game.GetLocalPlayer()
			
			PitmasterId = objectId

			if (randomizer <= 33 ||player:AnyoneHasToken("DC_BOUNTY18")) then
				local coords = Entity.Get(objectId):GetCoords()
				local boss = Character.Create("records/creatures/enemies/boss&quest/banditminiboss_pitmaster.dbr", PitmasterCreateArgs())
				boss:SetCoords(coords)
				
				PitmasterSpawned = true
				
			end

		end
	
	end
	
end

function gd.bounties.spawnDCBounty18()
	if Server then
		if not PitmasterSpawned then
			local entity = Entity.Get(PitmasterId)
			
			if entity != nil then
				local coords = entity:GetCoords()
				
				local boss = Character.Create("records/creatures/enemies/boss&quest/banditminiboss_pitmaster.dbr", PitmasterCreateArgs())
				boss:SetCoords(coords)
				
				PitmasterSpawned = true
			
			end
			
		end
	
	end

end


-- Rover Spawns
--Bounty 10
local ROBounty10Id = 0
local ROBounty10Spawned = false

local ROBounty10StateObjects = orderedTable()
	ROBounty10StateObjects["RO_BOUNTY10"	] = { state = BountyState.Spawned, dbr = "records/creatures/enemies/bounties/ro_bounty10.dbr"}
	ROBounty10StateObjects[""					 	] = { state = BountyState.Default, dbr = nil }

function gd.bounties.ROBounty10OnAddToWorld(objectId)
	if Server then
		if (not ROBounty10Spawned) then
			local player = Game.GetLocalPlayer()
			local MPOverrideDbr = nil
			local MPOverrideState = false

			if (player:AnyoneHasToken("RO_BOUNTY10")) then
				MPOverrideDbr = "records/creatures/enemies/bounties/ro_bounty10.dbr"
				MPOverrideState = true
				ROBounty10Spawned = true
				
			end

			monsterId = objectId
			ROBounty10Id = objectId
	
			local userdata = {}
			local didWork, newState = TokenStateBasedObjectSwap(objectId, userdata, ROBounty10StateObjects, Character, CharacterCreateArgs, MPOverrideState, MPOverrideDbr)
	
			Shared.setUserdata(objectId, userdata)
	
			-- Don't respawn the Monster next time. If spawned as hostile, will be saved into the world
			if (newState == BountyState.Spawned) then
				ROBounty10Spawned = true
				
			end
			
		end
	
	end
	
end

function gd.bounties.spawnROBounty10()
	if Server then
		local player = Game.GetLocalPlayer()
		
		if not ROBounty10Spawned then
			local player = Game.GetLocalPlayer()
			local MPOverrideDbr = nil
			local MPOverrideState = false
			
			local entity = Entity.Get(ROBounty10Id)
			
			if entity != nil then
				if (player:AnyoneHasToken("RO_BOUNTY10")) then
					MPOverrideDbr = "records/creatures/enemies/bounties/ro_bounty10.dbr"
					MPOverrideState = true
					
				end
				
				monsterId = ROBounty10Id
				local didWork, newState = UpdateObjectSwap(ROBounty10Id, ROBounty10StateObjects, Character, CharacterCreateArgs, MPOverrideState, MPOverrideDbr)
	
				-- Don't respawn the Monster next time. If spawned as hostile, will be saved into the world
				ROBounty10Spawned = true
			
			end
			
		end
	
	end

end

--Bounty 11
local ROBounty11Id = 0
local ROBounty11Spawned = false

local ROBounty11StateObjects = orderedTable()
	ROBounty11StateObjects["RO_BOUNTY11"	] = { state = BountyState.Spawned, dbr = "records/creatures/enemies/bounties/ro_bounty11.dbr"}
	ROBounty11StateObjects[""					 	] = { state = BountyState.Default, dbr = nil }

function gd.bounties.ROBounty11OnAddToWorld(objectId)
	if Server then
		if (not ROBounty11Spawned) then
			local player = Game.GetLocalPlayer()
			local MPOverrideDbr = nil
			local MPOverrideState = false

			if (player:AnyoneHasToken("RO_BOUNTY11")) then
				MPOverrideDbr = "records/creatures/enemies/bounties/ro_bounty11.dbr"
				MPOverrideState = true
				ROBounty11Spawned = true
				
			end

			monsterId = objectId
			ROBounty11Id = objectId
	
			local userdata = {}
			local didWork, newState = TokenStateBasedObjectSwap(objectId, userdata, ROBounty11StateObjects, Character, CharacterCreateArgs, MPOverrideState, MPOverrideDbr)
	
			Shared.setUserdata(objectId, userdata)
	
			-- Don't respawn the Monster next time. If spawned as hostile, will be saved into the world
			if (newState == BountyState.Spawned) then
				ROBounty11Spawned = true
				
			end
			
		end
	
	end
	
end

function gd.bounties.spawnROBounty11()
	if Server then
		local player = Game.GetLocalPlayer()
		
		if not ROBounty11Spawned then
			local player = Game.GetLocalPlayer()
			local MPOverrideDbr = nil
			local MPOverrideState = false
			
			local entity = Entity.Get(ROBounty11Id)
			
			if entity != nil then
				if (player:AnyoneHasToken("RO_BOUNTY11")) then
					MPOverrideDbr = "records/creatures/enemies/bounties/ro_bounty11.dbr"
					MPOverrideState = true
				
				end
				
				monsterId = ROBounty11Id
				local didWork, newState = UpdateObjectSwap(ROBounty11Id, ROBounty11StateObjects, Character, CharacterCreateArgs, MPOverrideState, MPOverrideDbr)
	
				-- Don't respawn the Monster next time. If spawned as hostile, will be saved into the world
				ROBounty11Spawned = true
			
			end
			
		end
	
	end

end

--Bounty 12
local ROBounty12Id = 0
local ROBounty12Spawned = false

local ROBounty12StateObjects = orderedTable()
	ROBounty12StateObjects["RO_BOUNTY12"	] = { state = BountyState.Spawned, dbr = "records/creatures/enemies/bounties/ro_bounty12.dbr"}
	ROBounty12StateObjects[""					 	] = { state = BountyState.Default, dbr = nil }

function gd.bounties.ROBounty12OnAddToWorld(objectId)
	if Server then
		if (not ROBounty12Spawned) then
			local player = Game.GetLocalPlayer()
			local MPOverrideDbr = nil
			local MPOverrideState = false

			if (player:AnyoneHasToken("RO_BOUNTY12")) then
				MPOverrideDbr = "records/creatures/enemies/bounties/ro_bounty12.dbr"
				MPOverrideState = true
				ROBounty12Spawned = true
				
			end

			monsterId = objectId
			ROBounty12Id = objectId
	
			local userdata = {}
			local didWork, newState = TokenStateBasedObjectSwap(objectId, userdata, ROBounty12StateObjects, Character, CharacterCreateArgs, MPOverrideState, MPOverrideDbr)
	
			Shared.setUserdata(objectId, userdata)
	
			-- Don't respawn the Monster next time. If spawned as hostile, will be saved into the world
			if (newState == BountyState.Spawned) then
				ROBounty12Spawned = true
				
			end
			
		end
	
	end
	
end

function gd.bounties.spawnROBounty12()
	if Server then
		local player = Game.GetLocalPlayer()
		
		if not ROBounty12Spawned then
			local player = Game.GetLocalPlayer()
			local MPOverrideDbr = nil
			local MPOverrideState = false

			local entity = Entity.Get(ROBounty12Id)
			
			if entity != nil then
				if (player:AnyoneHasToken("RO_BOUNTY12")) then
					MPOverrideDbr = "records/creatures/enemies/bounties/ro_bounty12.dbr"
					MPOverrideState = true
				
				end
				
				monsterId = ROBounty12Id
				local didWork, newState = UpdateObjectSwap(ROBounty12Id, ROBounty12StateObjects, Character, CharacterCreateArgs, MPOverrideState, MPOverrideDbr)
	
				-- Don't respawn the Monster next time. If spawned as hostile, will be saved into the world
				ROBounty12Spawned = true
			
			end
			
		end
	
	end

end


--Bounty 19
local ROBounty19Id = 0
local ROBounty19Spawned = false

local ROBounty19StateObjects = orderedTable()
	ROBounty19StateObjects["RO_BOUNTY19"	] = { state = BountyState.Spawned, dbr = "records/creatures/enemies/bounties/ro_bounty19.dbr"}
	ROBounty19StateObjects[""					 	] = { state = BountyState.Default, dbr = nil }

function gd.bounties.ROBounty19OnAddToWorld(objectId)
	if Server then
		if (not ROBounty19Spawned) then
			local player = Game.GetLocalPlayer()
			local MPOverrideDbr = nil
			local MPOverrideState = false

			if (player:AnyoneHasToken("RO_BOUNTY19")) then
				MPOverrideDbr = "records/creatures/enemies/bounties/ro_bounty19.dbr"
				MPOverrideState = true
				ROBounty19Spawned = true
				
			end

			monsterId = objectId
			ROBounty19Id = objectId
	
			local userdata = {}
			local didWork, newState = TokenStateBasedObjectSwap(objectId, userdata, ROBounty19StateObjects, Character, CharacterCreateArgs, MPOverrideState, MPOverrideDbr)
	
			Shared.setUserdata(objectId, userdata)
	
			-- Don't respawn the Monster next time. If spawned as hostile, will be saved into the world
			if (newState == BountyState.Spawned) then
				ROBounty19Spawned = true
				
			end
			
		end
	
	end
	
end

function gd.bounties.spawnROBounty19()
	if Server then
		local player = Game.GetLocalPlayer()
		
		if not ROBounty19Spawned then
			local player = Game.GetLocalPlayer()
			local MPOverrideDbr = nil
			local MPOverrideState = false

			local entity = Entity.Get(ROBounty19Id)
			
			if entity != nil then
				if (player:AnyoneHasToken("RO_BOUNTY19")) then
					MPOverrideDbr = "records/creatures/enemies/bounties/ro_bounty19.dbr"
					MPOverrideState = true
				
				end
				
				monsterId = ROBounty19Id
				local didWork, newState = UpdateObjectSwap(ROBounty19Id, ROBounty19StateObjects, Character, CharacterCreateArgs, MPOverrideState, MPOverrideDbr)
	
				-- Don't respawn the Monster next time. If spawned as hostile, will be saved into the world
				ROBounty19Spawned = true
			
			end
			
		end
	
	end

end

--Homestead Spawns
--Bounty 09
local HSBounty09Id = 0
local HSBounty09Spawned = false

local HSBounty09StateObjects = orderedTable()
	HSBounty09StateObjects["HS_BOUNTY09"	] = { state = BountyState.Spawned, dbr = "records/creatures/enemies/bounties/hs_bounty09.dbr"}
	HSBounty09StateObjects[""					 	] = { state = BountyState.Default, dbr = nil }

function gd.bounties.HSBounty09OnAddToWorld(objectId)
	if Server then
		if (not HSBounty09Spawned) then
			local player = Game.GetLocalPlayer()
			local MPOverrideDbr = nil
			local MPOverrideState = false

			if (player:AnyoneHasToken("HS_BOUNTY09")) then
				MPOverrideDbr = "records/creatures/enemies/bounties/hs_bounty09.dbr"
				MPOverrideState = true
				HSBounty09Spawned = true
				
			end

			monsterId = objectId
			HSBounty09Id = objectId
	
			local userdata = {}
			local didWork, newState = TokenStateBasedObjectSwap(objectId, userdata, HSBounty09StateObjects, Character, CharacterCreateArgs, MPOverrideState, MPOverrideDbr)
	
			Shared.setUserdata(objectId, userdata)
	
			-- Don't respawn the Monster next time. If spawned as hostile, will be saved into the world
			if (newState == BountyState.Spawned) then
				HSBounty09Spawned = true
				
			end
			
		end
	
	end
	
end

function gd.bounties.spawnHSBounty09()
	if Server then
		local player = Game.GetLocalPlayer()
		
		if not HSBounty09Spawned then
			local player = Game.GetLocalPlayer()
			local MPOverrideDbr = nil
			local MPOverrideState = false
			
			local entity = Entity.Get(HSBounty09Id)
			
			if entity != nil then
				if (player:AnyoneHasToken("HS_BOUNTY09")) then
					MPOverrideDbr = "records/creatures/enemies/bounties/hs_bounty09.dbr"
					MPOverrideState = true
					
				end
				
				monsterId = HSBounty09Id
				local didWork, newState = UpdateObjectSwap(HSBounty09Id, HSBounty09StateObjects, Character, CharacterCreateArgs, MPOverrideState, MPOverrideDbr)
	
				-- Don't respawn the Monster next time. If spawned as hostile, will be saved into the world
				HSBounty09Spawned = true
			
			end
			
		end
	
	end

end

--Bounty 10
local HSBounty10Id = 0
local HSBounty10Spawned = false

local HSBounty10StateObjects = orderedTable()
	HSBounty10StateObjects["HS_BOUNTY10"	] = { state = BountyState.Spawned, dbr = "records/creatures/enemies/bounties/hs_bounty10.dbr"}
	HSBounty10StateObjects[""					 	] = { state = BountyState.Default, dbr = nil }

function gd.bounties.HSBounty10OnAddToWorld(objectId)
	if Server then
		if (not HSBounty10Spawned) then
			local player = Game.GetLocalPlayer()
			local MPOverrideDbr = nil
			local MPOverrideState = false

			if (player:AnyoneHasToken("HS_BOUNTY10")) then
				MPOverrideDbr = "records/creatures/enemies/bounties/hs_bounty10.dbr"
				MPOverrideState = true
				HSBounty10Spawned = true
				
			end

			monsterId = objectId
			HSBounty10Id = objectId
	
			local userdata = {}
			local didWork, newState = TokenStateBasedObjectSwap(objectId, userdata, HSBounty10StateObjects, Character, CharacterCreateArgs, MPOverrideState, MPOverrideDbr)
	
			Shared.setUserdata(objectId, userdata)
	
			-- Don't respawn the Monster next time. If spawned as hostile, will be saved into the world
			if (newState == BountyState.Spawned) then
				HSBounty10Spawned = true
				
			end
			
		end
	
	end
	
end

function gd.bounties.spawnHSBounty10()
	if Server then
		local player = Game.GetLocalPlayer()
		
		if not HSBounty10Spawned then
			local player = Game.GetLocalPlayer()
			local MPOverrideDbr = nil
			local MPOverrideState = false

			local entity = Entity.Get(HSBounty10Id)
			
			if entity != nil then
				if (player:AnyoneHasToken("HS_BOUNTY10")) then
					MPOverrideDbr = "records/creatures/enemies/bounties/hs_bounty10.dbr"
					MPOverrideState = true
				
				end
				
				monsterId = HSBounty10Id
				local didWork, newState = UpdateObjectSwap(HSBounty10Id, HSBounty10StateObjects, Character, CharacterCreateArgs, MPOverrideState, MPOverrideDbr)
	
				-- Don't respawn the Monster next time. If spawned as hostile, will be saved into the world
				HSBounty10Spawned = true
			
			end
			
		end
	
	end

end

--Bounty 11
local HSBounty11Id = 0
local HSBounty11Spawned = false

local HSBounty11StateObjects = orderedTable()
	HSBounty11StateObjects["HS_BOUNTY11"	] = { state = BountyState.Spawned, dbr = "records/creatures/enemies/bounties/hs_bounty11.dbr"}
	HSBounty11StateObjects[""					 	] = { state = BountyState.Default, dbr = nil }

function gd.bounties.HSBounty11OnAddToWorld(objectId)
	if Server then
		if (not HSBounty11Spawned) then
			local player = Game.GetLocalPlayer()
			local MPOverrideDbr = nil
			local MPOverrideState = false

			if (player:AnyoneHasToken("HS_BOUNTY11")) then
				MPOverrideDbr = "records/creatures/enemies/bounties/hs_bounty11.dbr"
				MPOverrideState = true
				HSBounty11Spawned = true
				
			end

			monsterId = objectId
			HSBounty11Id = objectId
	
			local userdata = {}
			local didWork, newState = TokenStateBasedObjectSwap(objectId, userdata, HSBounty11StateObjects, Character, CharacterCreateArgs, MPOverrideState, MPOverrideDbr)
	
			Shared.setUserdata(objectId, userdata)
	
			-- Don't respawn the Monster next time. If spawned as hostile, will be saved into the world
			if (newState == BountyState.Spawned) then
				HSBounty11Spawned = true
				
			end
			
		end
	
	end
	
end

function gd.bounties.spawnHSBounty11()
	if Server then
		local player = Game.GetLocalPlayer()
		
		if not HSBounty11Spawned then
			local player = Game.GetLocalPlayer()
			local MPOverrideDbr = nil
			local MPOverrideState = false

			local entity = Entity.Get(HSBounty11Id)
			
			if entity != nil then
				if (player:AnyoneHasToken("HS_BOUNTY11")) then
					MPOverrideDbr = "records/creatures/enemies/bounties/hs_bounty11.dbr"
					MPOverrideState = true
				
				end
			
				monsterId = HSBounty11Id
				local didWork, newState = UpdateObjectSwap(HSBounty11Id, HSBounty11StateObjects, Character, CharacterCreateArgs, MPOverrideState, MPOverrideDbr)
	
				-- Don't respawn the Monster next time. If spawned as hostile, will be saved into the world
				HSBounty11Spawned = true
			
			end
			
		end
	
	end

end

--Bounty 12
local HSBounty12Id = 0
local HSBounty12Spawned = false

local HSBounty12StateObjects = orderedTable()
	HSBounty12StateObjects["HS_BOUNTY12"	] = { state = BountyState.Spawned, dbr = "records/creatures/enemies/bounties/hs_bounty12.dbr"}
	HSBounty12StateObjects[""					 	] = { state = BountyState.Default, dbr = nil }

function gd.bounties.HSBounty12OnAddToWorld(objectId)
	if Server then
		if (not HSBounty12Spawned) then
			local player = Game.GetLocalPlayer()
			local MPOverrideDbr = nil
			local MPOverrideState = false

			if (player:AnyoneHasToken("HS_BOUNTY12")) then
				MPOverrideDbr = "records/creatures/enemies/bounties/hs_bounty12.dbr"
				MPOverrideState = true
				HSBounty12Spawned = true
				
			end

			monsterId = objectId
			HSBounty12Id = objectId
	
			local userdata = {}
			local didWork, newState = TokenStateBasedObjectSwap(objectId, userdata, HSBounty12StateObjects, Character, CharacterCreateArgs, MPOverrideState, MPOverrideDbr)
	
			Shared.setUserdata(objectId, userdata)
	
			-- Don't respawn the Monster next time. If spawned as hostile, will be saved into the world
			if (newState == BountyState.Spawned) then
				HSBounty12Spawned = true
				
			end
			
		end
	
	end
	
end

function gd.bounties.spawnHSBounty12()
	if Server then
		local player = Game.GetLocalPlayer()
		
		if not HSBounty12Spawned then
			local player = Game.GetLocalPlayer()
			local MPOverrideDbr = nil
			local MPOverrideState = false

			local entity = Entity.Get(HSBounty12Id)
			
			if entity != nil then
				if (player:AnyoneHasToken("HS_BOUNTY12")) then
					MPOverrideDbr = "records/creatures/enemies/bounties/hs_bounty12.dbr"
					MPOverrideState = true
					
				end
				monsterId = HSBounty12Id
				local didWork, newState = UpdateObjectSwap(HSBounty12Id, HSBounty12StateObjects, Character, CharacterCreateArgs, MPOverrideState, MPOverrideDbr)
	
				-- Don't respawn the Monster next time. If spawned as hostile, will be saved into the world
				HSBounty12Spawned = true
			
			end
			
		end
	
	end

end

--Bounty 13
local HSBounty13Id = 0
local HSBounty13Spawned = false

local HSBounty13StateObjects = orderedTable()
	HSBounty13StateObjects["HS_BOUNTY13"	] = { state = BountyState.Spawned, dbr = "records/creatures/enemies/bounties/hs_bounty13.dbr"}
	HSBounty13StateObjects[""					 	] = { state = BountyState.Default, dbr = nil }

function gd.bounties.HSBounty13OnAddToWorld(objectId)
	if Server then
		if (not HSBounty13Spawned) then
			local player = Game.GetLocalPlayer()
			local MPOverrideDbr = nil
			local MPOverrideState = false

			if (player:AnyoneHasToken("HS_BOUNTY13")) then
				MPOverrideDbr = "records/creatures/enemies/bounties/hs_bounty13.dbr"
				MPOverrideState = true
				HSBounty13Spawned = true
				
			end

			monsterId = objectId
			HSBounty13Id = objectId
	
			local userdata = {}
			local didWork, newState = TokenStateBasedObjectSwap(objectId, userdata, HSBounty13StateObjects, Character, CharacterCreateArgs, MPOverrideState, MPOverrideDbr)
	
			Shared.setUserdata(objectId, userdata)
	
			-- Don't respawn the Monster next time. If spawned as hostile, will be saved into the world
			if (newState == BountyState.Spawned) then
				HSBounty13Spawned = true
				
			end
			
		end
	
	end
	
end

function gd.bounties.spawnHSBounty13()
	if Server then
		local player = Game.GetLocalPlayer()
		
		if not HSBounty13Spawned then
			local player = Game.GetLocalPlayer()
			local MPOverrideDbr = nil
			local MPOverrideState = false

			local entity = Entity.Get(HSBounty13Id)
			
			if entity != nil then
				if (player:AnyoneHasToken("HS_BOUNTY13")) then
					MPOverrideDbr = "records/creatures/enemies/bounties/hs_bounty13.dbr"
					MPOverrideState = true
					
				end
			
				monsterId = HSBounty13Id
				local didWork, newState = UpdateObjectSwap(HSBounty13Id, HSBounty13StateObjects, Character, CharacterCreateArgs, MPOverrideState, MPOverrideDbr)
	
				-- Don't respawn the Monster next time. If spawned as hostile, will be saved into the world
				HSBounty13Spawned = true
			
			end
			
		end
	
	end

end


--Black Legion Spawns
--Bounty 08
local BLBounty08Id = 0
local BLBounty08Spawned = false

local BLBounty08StateObjects = orderedTable()
	BLBounty08StateObjects["BL_BOUNTY08"	] = { state = BountyState.Spawned, dbr = "records/creatures/enemies/bounties/bl_bounty08.dbr"}
	BLBounty08StateObjects[""					 	] = { state = BountyState.Default, dbr = nil }

function gd.bounties.BLBounty08OnAddToWorld(objectId)
	if Server then
		if (not BLBounty08Spawned) then
			local player = Game.GetLocalPlayer()
			local MPOverrideDbr = nil
			local MPOverrideState = false

			if (player:AnyoneHasToken("BL_BOUNTY08")) then
				MPOverrideDbr = "records/creatures/enemies/bounties/bl_bounty08.dbr"
				MPOverrideState = true
				BLBounty08Spawned = true
				
			end

			monsterId = objectId
			BLBounty08Id = objectId
	
			local userdata = {}
			local didWork, newState = TokenStateBasedObjectSwap(objectId, userdata, BLBounty08StateObjects, Character, CharacterCreateArgs, MPOverrideState, MPOverrideDbr)
	
			Shared.setUserdata(objectId, userdata)
	
			-- Don't respawn the Monster next time. If spawned as hostile, will be saved into the world
			if (newState == BountyState.Spawned) then
				BLBounty08Spawned = true
				
			end
			
		end
	
	end
	
end

function gd.bounties.spawnBLBounty08()
	if Server then
		local player = Game.GetLocalPlayer()
		
		if not BLBounty08Spawned then
			local player = Game.GetLocalPlayer()
			local MPOverrideDbr = nil
			local MPOverrideState = false

			local entity = Entity.Get(BLBounty08Id)
			
			if entity != nil then
				if (player:AnyoneHasToken("BL_BOUNTY08")) then
					MPOverrideDbr = "records/creatures/enemies/bounties/bl_bounty08.dbr"
					MPOverrideState = true
					
				end
			
				monsterId = BLBounty08Id
				local didWork, newState = UpdateObjectSwap(BLBounty08Id, BLBounty08StateObjects, Character, CharacterCreateArgs, MPOverrideState, MPOverrideDbr)
	
				-- Don't respawn the Monster next time. If spawned as hostile, will be saved into the world
				BLBounty08Spawned = true
			
			end
			
		end
	
	end

end

--Bounty 09
local BLBounty09Id = 0
local BLBounty09Spawned = false

local BLBounty09StateObjects = orderedTable()
	BLBounty09StateObjects["BL_BOUNTY09"	] = { state = BountyState.Spawned, dbr = "records/creatures/enemies/bounties/bl_bounty09.dbr"}
	BLBounty09StateObjects[""					 	] = { state = BountyState.Default, dbr = nil }

function gd.bounties.BLBounty09OnAddToWorld(objectId)
	if Server then
		if (not BLBounty09Spawned) then
			local player = Game.GetLocalPlayer()
			local MPOverrideDbr = nil
			local MPOverrideState = false

			if (player:AnyoneHasToken("BL_BOUNTY09")) then
				MPOverrideDbr = "records/creatures/enemies/bounties/bl_bounty09.dbr"
				MPOverrideState = true
				BLBounty09Spawned = true
				
			end

			monsterId = objectId
			BLBounty09Id = objectId
	
			local userdata = {}
			local didWork, newState = TokenStateBasedObjectSwap(objectId, userdata, BLBounty09StateObjects, Character, CharacterCreateArgs, MPOverrideState, MPOverrideDbr)
	
			Shared.setUserdata(objectId, userdata)
	
			-- Don't respawn the Monster next time. If spawned as hostile, will be saved into the world
			if (newState == BountyState.Spawned) then
				BLBounty09Spawned = true
				
			end
			
		end
	
	end
	
end

function gd.bounties.spawnBLBounty09()
	if Server then
		local player = Game.GetLocalPlayer()
		
		if not BLBounty09Spawned then
			local player = Game.GetLocalPlayer()
			local MPOverrideDbr = nil
			local MPOverrideState = false
			
			local entity = Entity.Get(BLBounty09Id)
			
			if entity != nil then
				if (player:AnyoneHasToken("BL_BOUNTY09")) then
					MPOverrideDbr = "records/creatures/enemies/bounties/bl_bounty09.dbr"
					MPOverrideState = true
					
				end
			
				monsterId = BLBounty09Id
				local didWork, newState = UpdateObjectSwap(BLBounty09Id, BLBounty09StateObjects, Character, CharacterCreateArgs, MPOverrideState, MPOverrideDbr)
	
				-- Don't respawn the Monster next time. If spawned as hostile, will be saved into the world
				BLBounty09Spawned = true
			
			end
			
		end
	
	end

end

--Bounty 10
local BLBounty10Id = 0
local BLBounty10Spawned = false

local BLBounty10StateObjects = orderedTable()
	BLBounty10StateObjects["BL_BOUNTY10"	] = { state = BountyState.Spawned, dbr = "records/creatures/enemies/bounties/bl_bounty10.dbr"}
	BLBounty10StateObjects[""					 	] = { state = BountyState.Default, dbr = nil }

function gd.bounties.BLBounty10OnAddToWorld(objectId)
	if Server then
		if (not BLBounty10Spawned) then
			local player = Game.GetLocalPlayer()
			local MPOverrideDbr = nil
			local MPOverrideState = false

			if (player:AnyoneHasToken("BL_BOUNTY10")) then
				MPOverrideDbr = "records/creatures/enemies/bounties/bl_bounty10.dbr"
				MPOverrideState = true
				BLBounty10Spawned = true
				
			end

			monsterId = objectId
			BLBounty10Id = objectId
	
			local userdata = {}
			local didWork, newState = TokenStateBasedObjectSwap(objectId, userdata, BLBounty10StateObjects, Character, CharacterCreateArgs, MPOverrideState, MPOverrideDbr)
	
			Shared.setUserdata(objectId, userdata)
	
			-- Don't respawn the Monster next time. If spawned as hostile, will be saved into the world
			if (newState == BountyState.Spawned) then
				BLBounty10Spawned = true
				
			end
			
		end
	
	end
	
end

function gd.bounties.spawnBLBounty10()
	if Server then
		local player = Game.GetLocalPlayer()
		
		if not BLBounty10Spawned then
			local player = Game.GetLocalPlayer()
			local MPOverrideDbr = nil
			local MPOverrideState = false
			
			local entity = Entity.Get(BLBounty10Id)
			
			if entity != nil then
				if (player:AnyoneHasToken("BL_BOUNTY10")) then
					MPOverrideDbr = "records/creatures/enemies/bounties/bl_bounty10.dbr"
					MPOverrideState = true
					
				end
				
				monsterId = BLBounty10Id
				local didWork, newState = UpdateObjectSwap(BLBounty10Id, BLBounty10StateObjects, Character, CharacterCreateArgs, MPOverrideState, MPOverrideDbr)
	
				-- Don't respawn the Monster next time. If spawned as hostile, will be saved into the world
				BLBounty10Spawned = true
			
			end
			
		end
	
	end

end

--Bounty 17
local BLBounty17Id = 0
local BLBounty17Spawned = false

local BLBounty17StateObjects = orderedTable()
	BLBounty17StateObjects["BL_BOUNTY17"	] = { state = BountyState.Spawned, dbr = "records/creatures/enemies/bounties/bl_bounty17.dbr"}
	BLBounty17StateObjects[""					 	] = { state = BountyState.Default, dbr = nil }

function gd.bounties.BLBounty17OnAddToWorld(objectId)
	if Server then
		if (not BLBounty17Spawned) then
			local player = Game.GetLocalPlayer()
			local MPOverrideDbr = nil
			local MPOverrideState = false

			if (player:AnyoneHasToken("BL_BOUNTY17")) then
				MPOverrideDbr = "records/creatures/enemies/bounties/bl_bounty17.dbr"
				MPOverrideState = true
				BLBounty17Spawned = true
				
			end

			monsterId = objectId
			BLBounty17Id = objectId
	
			local userdata = {}
			local didWork, newState = TokenStateBasedObjectSwap(objectId, userdata, BLBounty17StateObjects, Character, CharacterCreateArgs, MPOverrideState, MPOverrideDbr)
	
			Shared.setUserdata(objectId, userdata)
	
			-- Don't respawn the Monster next time. If spawned as hostile, will be saved into the world
			if (newState == BountyState.Spawned) then
				BLBounty17Spawned = true
				
			end
			
		end
	
	end
	
end

function gd.bounties.spawnBLBounty17()
	if Server then
		local player = Game.GetLocalPlayer()
		
		if not BLBounty17Spawned then
			local player = Game.GetLocalPlayer()
			local MPOverrideDbr = nil
			local MPOverrideState = false
			
			local entity = Entity.Get(BLBounty17Id)
			
			if entity != nil then
				if (player:AnyoneHasToken("BL_BOUNTY17")) then
					MPOverrideDbr = "records/creatures/enemies/bounties/bl_bounty17.dbr"
					MPOverrideState = true
					
				end
			
				monsterId = BLBounty17Id
				local didWork, newState = UpdateObjectSwap(BLBounty17Id, BLBounty17StateObjects, Character, CharacterCreateArgs, MPOverrideState, MPOverrideDbr)
	
				-- Don't respawn the Monster next time. If spawned as hostile, will be saved into the world
				BLBounty17Spawned = true
			
			end
			
		end
	
	end

end

--Bounty 18
local BLBounty18Id = 0
local BLBounty18Spawned = false

local BLBounty18StateObjects = orderedTable()
	BLBounty18StateObjects["BL_BOUNTY18"	] = { state = BountyState.Spawned, dbr = "records/creatures/enemies/bounties/bl_bounty18.dbr"}
	BLBounty18StateObjects[""					 	] = { state = BountyState.Default, dbr = nil }

function gd.bounties.BLBounty18OnAddToWorld(objectId)
	if Server then
		if (not BLBounty18Spawned) then
			local player = Game.GetLocalPlayer()
			local MPOverrideDbr = nil
			local MPOverrideState = false

			if (player:AnyoneHasToken("BL_BOUNTY18")) then
				MPOverrideDbr = "records/creatures/enemies/bounties/bl_bounty18.dbr"
				MPOverrideState = true
				BLBounty18Spawned = true
				
			end

			monsterId = objectId
			BLBounty18Id = objectId
	
			local userdata = {}
			local didWork, newState = TokenStateBasedObjectSwap(objectId, userdata, BLBounty18StateObjects, Character, CharacterCreateArgs, MPOverrideState, MPOverrideDbr)
	
			Shared.setUserdata(objectId, userdata)
	
			-- Don't respawn the Monster next time. If spawned as hostile, will be saved into the world
			if (newState == BountyState.Spawned) then
				BLBounty18Spawned = true
				
			end
			
		end
	
	end
	
end

function gd.bounties.spawnBLBounty18()
	if Server then
		local player = Game.GetLocalPlayer()
		
		if not BLBounty18Spawned then
			local player = Game.GetLocalPlayer()
			local MPOverrideDbr = nil
			local MPOverrideState = false
			
			local entity = Entity.Get(BLBounty18Id)
			
			if entity != nil then
				if (player:AnyoneHasToken("BL_BOUNTY18")) then
					MPOverrideDbr = "records/creatures/enemies/bounties/bl_bounty18.dbr"
					MPOverrideState = true
					
				end
			
				monsterId = BLBounty18Id
				local didWork, newState = UpdateObjectSwap(BLBounty18Id, BLBounty18StateObjects, Character, CharacterCreateArgs, MPOverrideState, MPOverrideDbr)
	
				-- Don't respawn the Monster next time. If spawned as hostile, will be saved into the world
				BLBounty18Spawned = true
			
			end
			
		end
	
	end

end

--Bounty 19
local BLBounty19Id = 0
local BLBounty19Spawned = false

local BLBounty19StateObjects = orderedTable()
	BLBounty19StateObjects["BL_BOUNTY19"	] = { state = BountyState.Spawned, dbr = "records/creatures/enemies/bounties/bl_bounty19.dbr"}
	BLBounty19StateObjects[""					 	] = { state = BountyState.Default, dbr = nil }

function gd.bounties.BLBounty19OnAddToWorld(objectId)
	if Server then
		if (not BLBounty19Spawned) then
			local player = Game.GetLocalPlayer()
			local MPOverrideDbr = nil
			local MPOverrideState = false

			if (player:AnyoneHasToken("BL_BOUNTY19")) then
				MPOverrideDbr = "records/creatures/enemies/bounties/bl_bounty19.dbr"
				MPOverrideState = true
				BLBounty19Spawned = true
				
			end

			monsterId = objectId
			BLBounty19Id = objectId
	
			local userdata = {}
			local didWork, newState = TokenStateBasedObjectSwap(objectId, userdata, BLBounty19StateObjects, Character, CharacterCreateArgs, MPOverrideState, MPOverrideDbr)
	
			Shared.setUserdata(objectId, userdata)
	
			-- Don't respawn the Monster next time. If spawned as hostile, will be saved into the world
			if (newState == BountyState.Spawned) then
				BLBounty19Spawned = true
				
			end
			
		end
	
	end
	
end

function gd.bounties.spawnBLBounty19()
	if Server then
		local player = Game.GetLocalPlayer()
		
		if not BLBounty19Spawned then
			local player = Game.GetLocalPlayer()
			local MPOverrideDbr = nil
			local MPOverrideState = false

			local entity = Entity.Get(BLBounty19Id)
			
			if entity != nil then
				if (player:AnyoneHasToken("BL_BOUNTY19")) then
					MPOverrideDbr = "records/creatures/enemies/bounties/bl_bounty19.dbr"
					MPOverrideState = true
					
				end
			
				monsterId = BLBounty19Id
				local didWork, newState = UpdateObjectSwap(BLBounty19Id, BLBounty19StateObjects, Character, CharacterCreateArgs, MPOverrideState, MPOverrideDbr)
	
				-- Don't respawn the Monster next time. If spawned as hostile, will be saved into the world
				BLBounty19Spawned = true
			
			end
			
		end
	
	end

end

--Bounty 20
local BLBounty20Id = 0
local BLBounty20Spawned = false

local BLBounty20StateObjects = orderedTable()
	BLBounty20StateObjects["BL_BOUNTY20"	] = { state = BountyState.Spawned, dbr = "records/creatures/enemies/bounties/bl_bounty20.dbr"}
	BLBounty20StateObjects[""					 	] = { state = BountyState.Default, dbr = nil }

function gd.bounties.BLBounty20OnAddToWorld(objectId)
	if Server then
		if (not BLBounty20Spawned) then
			local player = Game.GetLocalPlayer()
			local MPOverrideDbr = nil
			local MPOverrideState = false

			if (player:AnyoneHasToken("BL_BOUNTY20")) then
				MPOverrideDbr = "records/creatures/enemies/bounties/bl_bounty20.dbr"
				MPOverrideState = true
				BLBounty20Spawned = true
				
			end

			monsterId = objectId
			BLBounty20Id = objectId
	
			local userdata = {}
			local didWork, newState = TokenStateBasedObjectSwap(objectId, userdata, BLBounty20StateObjects, Character, CharacterCreateArgs, MPOverrideState, MPOverrideDbr)
	
			Shared.setUserdata(objectId, userdata)
	
			-- Don't respawn the Monster next time. If spawned as hostile, will be saved into the world
			if (newState == BountyState.Spawned) then
				BLBounty20Spawned = true
				
			end
			
		end
	
	end
	
end

function gd.bounties.spawnBLBounty20()
	if Server then
		local player = Game.GetLocalPlayer()
		
		if not BLBounty20Spawned then
			local player = Game.GetLocalPlayer()
			local MPOverrideDbr = nil
			local MPOverrideState = false
			
			local entity = Entity.Get(BLBounty20Id)
			
			if entity != nil then
				if (player:AnyoneHasToken("BL_BOUNTY20")) then
					MPOverrideDbr = "records/creatures/enemies/bounties/bl_bounty20.dbr"
					MPOverrideState = true
					
				end
			
				monsterId = BLBounty20Id
				local didWork, newState = UpdateObjectSwap(BLBounty20Id, BLBounty20StateObjects, Character, CharacterCreateArgs, MPOverrideState, MPOverrideDbr)
	
				-- Don't respawn the Monster next time. If spawned as hostile, will be saved into the world
				BLBounty20Spawned = true
			
			end
			
		end
	
	end

end


--Kymon's Chosen Spawns
--Bounty 07
local KCBounty07Id = 0
local KCBounty07Spawned = false

local KCBounty07StateObjects = orderedTable()
	KCBounty07StateObjects["KC_BOUNTY07"	] = { state = BountyState.Spawned, dbr = "records/creatures/enemies/bounties/kc_bounty07.dbr"}
	KCBounty07StateObjects[""					 	] = { state = BountyState.Default, dbr = nil }

function gd.bounties.KCBounty07OnAddToWorld(objectId)
	if Server then
		if (not KCBounty07Spawned) then
			local player = Game.GetLocalPlayer()
			local MPOverrideDbr = nil
			local MPOverrideState = false

			if (player:AnyoneHasToken("KC_BOUNTY07") && player:ServerHasToken("AREAC_ZEALOTS_CHOSEN")) then
				MPOverrideDbr = "records/creatures/enemies/bounties/kc_bounty07.dbr"
				MPOverrideState = true
				KCBounty07Spawned = true
				
			end

			monsterId = objectId
			KCBounty07Id = objectId
	
			local userdata = {}
			local didWork, newState = TokenStateBasedObjectSwap(objectId, userdata, KCBounty07StateObjects, Character, CharacterCreateArgs, MPOverrideState, MPOverrideDbr)
	
			Shared.setUserdata(objectId, userdata)
	
			-- Don't respawn the Monster next time. If spawned as hostile, will be saved into the world
			if (newState == BountyState.Spawned) then
				KCBounty07Spawned = true
				
			end
			
		end
	
	end
	
end

function gd.bounties.spawnKCBounty07()
	if Server then
		local player = Game.GetLocalPlayer()
		
		if not KCBounty07Spawned then
			local player = Game.GetLocalPlayer()
			local MPOverrideDbr = nil
			local MPOverrideState = false
		
			local entity = Entity.Get(KCBounty07Id)
			
			if entity != nil then
				if (player:AnyoneHasToken("KC_BOUNTY07") && player:ServerHasToken("AREAC_ZEALOTS_CHOSEN")) then
					MPOverrideDbr = "records/creatures/enemies/bounties/kc_bounty07.dbr"
					MPOverrideState = true
					
				end
			
				monsterId = KCBounty07Id
				local didWork, newState = UpdateObjectSwap(KCBounty07Id, KCBounty07StateObjects, Character, CharacterCreateArgs, MPOverrideState, MPOverrideDbr)
	
				-- Don't respawn the Monster next time. If spawned as hostile, will be saved into the world
				KCBounty07Spawned = true
			
			end
			
		end
	
	end

end

--Bounty 08
local KCBounty08Id = 0
local KCBounty08Spawned = false

local KCBounty08StateObjects = orderedTable()
	KCBounty08StateObjects["KC_BOUNTY08"	] = { state = BountyState.Spawned, dbr = "records/creatures/enemies/bounties/kc_bounty08.dbr"}
	KCBounty08StateObjects[""					 	] = { state = BountyState.Default, dbr = nil }

function gd.bounties.KCBounty08OnAddToWorld(objectId)
	if Server then
		if (not KCBounty08Spawned) then
			local player = Game.GetLocalPlayer()
			local MPOverrideDbr = nil
			local MPOverrideState = false

			if (player:AnyoneHasToken("KC_BOUNTY08") && player:ServerHasToken("AREAC_ZEALOTS_CHOSEN")) then
				MPOverrideDbr = "records/creatures/enemies/bounties/kc_bounty08.dbr"
				MPOverrideState = true
				KCBounty08Spawned = true
				
			end

			monsterId = objectId
			KCBounty08Id = objectId
	
			local userdata = {}
			local didWork, newState = TokenStateBasedObjectSwap(objectId, userdata, KCBounty08StateObjects, Character, CharacterCreateArgs, MPOverrideState, MPOverrideDbr)
	
			Shared.setUserdata(objectId, userdata)
	
			-- Don't respawn the Monster next time. If spawned as hostile, will be saved into the world
			if (newState == BountyState.Spawned) then
				KCBounty08Spawned = true
				
			end
			
		end
	
	end
	
end

function gd.bounties.spawnKCBounty08()
	if Server then
		local player = Game.GetLocalPlayer()
		
		if not KCBounty08Spawned then
			local player = Game.GetLocalPlayer()
			local MPOverrideDbr = nil
			local MPOverrideState = false
		
			local entity = Entity.Get(KCBounty08Id)
			
			if entity != nil then
				if (player:AnyoneHasToken("KC_BOUNTY08") && player:ServerHasToken("AREAC_ZEALOTS_CHOSEN")) then
					MPOverrideDbr = "records/creatures/enemies/bounties/kc_bounty08.dbr"
					MPOverrideState = true
					
				end
				
				monsterId = KCBounty08Id
				local didWork, newState = UpdateObjectSwap(KCBounty08Id, KCBounty08StateObjects, Character, CharacterCreateArgs, MPOverrideState, MPOverrideDbr)

				-- Don't respawn the Monster next time. If spawned as hostile, will be saved into the world
				KCBounty08Spawned = true
			
			end
			
		end
	
	end

end

--Bounty 09
local KCBounty09Id = 0
local KCBounty09Spawned = false

local KCBounty09StateObjects = orderedTable()
	KCBounty09StateObjects["KC_BOUNTY09"	] = { state = BountyState.Spawned, dbr = "records/creatures/enemies/bounties/kc_bounty09.dbr"}
	KCBounty09StateObjects[""					 	] = { state = BountyState.Default, dbr = nil }

function gd.bounties.KCBounty09OnAddToWorld(objectId)
	if Server then
		if (not KCBounty09Spawned) then
			local player = Game.GetLocalPlayer()
			local MPOverrideDbr = nil
			local MPOverrideState = false

			if (player:AnyoneHasToken("KC_BOUNTY09")) then
				MPOverrideDbr = "records/creatures/enemies/bounties/kc_bounty09.dbr"
				MPOverrideState = true
				KCBounty09Spawned = true
				
			end

			monsterId = objectId
			KCBounty09Id = objectId
	
			local userdata = {}
			local didWork, newState = TokenStateBasedObjectSwap(objectId, userdata, KCBounty09StateObjects, Character, CharacterCreateArgs, MPOverrideState, MPOverrideDbr)
	
			Shared.setUserdata(objectId, userdata)
	
			-- Don't respawn the Monster next time. If spawned as hostile, will be saved into the world
			if (newState == BountyState.Spawned) then
				KCBounty09Spawned = true
				
			end
			
		end
	
	end
	
end

function gd.bounties.spawnKCBounty09()
	if Server then
		local player = Game.GetLocalPlayer()
		
		if not KCBounty09Spawned then
			local player = Game.GetLocalPlayer()
			local MPOverrideDbr = nil
			local MPOverrideState = false
		
			local entity = Entity.Get(KCBounty09Id)
			
			if entity != nil then
				if (player:AnyoneHasToken("KC_BOUNTY09")) then
					MPOverrideDbr = "records/creatures/enemies/bounties/kc_bounty09.dbr"
					MPOverrideState = true
					
				end
			
				monsterId = KCBounty09Id
				local didWork, newState = UpdateObjectSwap(KCBounty09Id, KCBounty09StateObjects, Character, CharacterCreateArgs, MPOverrideState, MPOverrideDbr)
	
				-- Don't respawn the Monster next time. If spawned as hostile, will be saved into the world
				KCBounty09Spawned = true
			
			end
			
		end
	
	end

end

--Bounty 10
local KCBounty10Id = 0
local KCBounty10Spawned = false

local KCBounty10StateObjects = orderedTable()
	KCBounty10StateObjects["KC_BOUNTY10"	] = { state = BountyState.Spawned, dbr = "records/creatures/enemies/bounties/kc_bounty10.dbr"}
	KCBounty10StateObjects[""					 	] = { state = BountyState.Default, dbr = nil }

function gd.bounties.KCBounty10OnAddToWorld(objectId)
	if Server then
		if (not KCBounty10Spawned) then
			local player = Game.GetLocalPlayer()
			local MPOverrideDbr = nil
			local MPOverrideState = false

			if (player:AnyoneHasToken("KC_BOUNTY10")) then
				MPOverrideDbr = "records/creatures/enemies/bounties/kc_bounty10.dbr"
				MPOverrideState = true
				KCBounty10Spawned = true
				
			end

			monsterId = objectId
			KCBounty10Id = objectId
	
			local userdata = {}
			local didWork, newState = TokenStateBasedObjectSwap(objectId, userdata, KCBounty10StateObjects, Character, CharacterCreateArgs, MPOverrideState, MPOverrideDbr)
	
			Shared.setUserdata(objectId, userdata)
	
			-- Don't respawn the Monster next time. If spawned as hostile, will be saved into the world
			if (newState == BountyState.Spawned) then
				KCBounty10Spawned = true
				
			end
			
		end
	
	end
	
end

function gd.bounties.spawnKCBounty10()
	if Server then
		local player = Game.GetLocalPlayer()
		
		if not KCBounty10Spawned then
			local player = Game.GetLocalPlayer()
			local MPOverrideDbr = nil
			local MPOverrideState = false
			
			local entity = Entity.Get(KCBounty10Id)
			
			if entity != nil then
				if (player:AnyoneHasToken("KC_BOUNTY10")) then
					MPOverrideDbr = "records/creatures/enemies/bounties/kc_bounty10.dbr"
					MPOverrideState = true
					
				end
			
				monsterId = KCBounty10Id
				local didWork, newState = UpdateObjectSwap(KCBounty10Id, KCBounty10StateObjects, Character, CharacterCreateArgs, MPOverrideState, MPOverrideDbr)
	
				-- Don't respawn the Monster next time. If spawned as hostile, will be saved into the world
				KCBounty10Spawned = true
			
			end
			
		end
	
	end

end

--Bounty 11
local KCBounty11Id = 0
local KCBounty11Spawned = false

local KCBounty11StateObjects = orderedTable()
	KCBounty11StateObjects["KC_BOUNTY11"	] = { state = BountyState.Spawned, dbr = "records/creatures/enemies/bounties/kc_bounty11.dbr"}
	KCBounty11StateObjects[""					 	] = { state = BountyState.Default, dbr = nil }

function gd.bounties.KCBounty11OnAddToWorld(objectId)
	if Server then
		if (not KCBounty11Spawned) then
			local player = Game.GetLocalPlayer()
			local MPOverrideDbr = nil
			local MPOverrideState = false

			if (player:AnyoneHasToken("KC_BOUNTY11")) then
				MPOverrideDbr = "records/creatures/enemies/bounties/kc_bounty11.dbr"
				MPOverrideState = true
				KCBounty11Spawned = true
				
			end

			monsterId = objectId
			KCBounty11Id = objectId
	
			local userdata = {}
			local didWork, newState = TokenStateBasedObjectSwap(objectId, userdata, KCBounty11StateObjects, Character, CharacterCreateArgs, MPOverrideState, MPOverrideDbr)
	
			Shared.setUserdata(objectId, userdata)
	
			-- Don't respawn the Monster next time. If spawned as hostile, will be saved into the world
			if (newState == BountyState.Spawned) then
				KCBounty11Spawned = true
				
			end
			
		end
	
	end
	
end

function gd.bounties.spawnKCBounty11()
	if Server then
		local player = Game.GetLocalPlayer()
		
		if not KCBounty11Spawned then
			local player = Game.GetLocalPlayer()
			local MPOverrideDbr = nil
			local MPOverrideState = false
			
			local entity = Entity.Get(KCBounty11Id)
			
			if entity != nil then
				if (player:AnyoneHasToken("KC_BOUNTY11")) then
					MPOverrideDbr = "records/creatures/enemies/bounties/kc_bounty11.dbr"
					MPOverrideState = true
					
				end
			
				monsterId = KCBounty11Id
				local didWork, newState = UpdateObjectSwap(KCBounty11Id, KCBounty11StateObjects, Character, CharacterCreateArgs, MPOverrideState, MPOverrideDbr)
	
				-- Don't respawn the Monster next time. If spawned as hostile, will be saved into the world
				KCBounty11Spawned = true
			
			end
			
		end
	
	end

end


--Bounty 13
local KCBounty13Id = 0
local KCBounty13Spawned = false

local KCBounty13StateObjects = orderedTable()
	KCBounty13StateObjects["KC_BOUNTY13"	] = { state = BountyState.Spawned, dbr = "records/creatures/enemies/bounties/kc_bounty13.dbr"}
	KCBounty13StateObjects[""					 	] = { state = BountyState.Default, dbr = nil }

function gd.bounties.KCBounty13OnAddToWorld(objectId)
	if Server then
		if (not KCBounty13Spawned) then
			local player = Game.GetLocalPlayer()
			local MPOverrideDbr = nil
			local MPOverrideState = false

			if (player:AnyoneHasToken("KC_BOUNTY13")) then
				MPOverrideDbr = "records/creatures/enemies/bounties/kc_bounty13.dbr"
				MPOverrideState = true
				KCBounty13Spawned = true
				
			end

			monsterId = objectId
			KCBounty13Id = objectId
	
			local userdata = {}
			local didWork, newState = TokenStateBasedObjectSwap(objectId, userdata, KCBounty13StateObjects, Character, CharacterCreateArgs, MPOverrideState, MPOverrideDbr)
	
			Shared.setUserdata(objectId, userdata)
	
			-- Don't respawn the Monster next time. If spawned as hostile, will be saved into the world
			if (newState == BountyState.Spawned) then
				KCBounty13Spawned = true
				
			end
			
		end
	
	end
	
end

function gd.bounties.spawnKCBounty13()
	if Server then
		local player = Game.GetLocalPlayer()
		
		if not KCBounty13Spawned then
			local player = Game.GetLocalPlayer()
			local MPOverrideDbr = nil
			local MPOverrideState = false
			
			local entity = Entity.Get(KCBounty13Id)
			
			if entity != nil then
				if (player:AnyoneHasToken("KC_BOUNTY13")) then
					MPOverrideDbr = "records/creatures/enemies/bounties/kc_bounty13.dbr"
					MPOverrideState = true
					
				end
			
				monsterId = KCBounty13Id
				local didWork, newState = UpdateObjectSwap(KCBounty13Id, KCBounty13StateObjects, Character, CharacterCreateArgs, MPOverrideState, MPOverrideDbr)
	
				-- Don't respawn the Monster next time. If spawned as hostile, will be saved into the world
				KCBounty13Spawned = true
			
			end
			
		end
	
	end

end

--Bounty 19
local KCBounty19Id = 0
local KCBounty19Spawned = false

local KCBounty19StateObjects = orderedTable()
	KCBounty19StateObjects["KC_BOUNTY19"	] = { state = BountyState.Spawned, dbr = "records/creatures/enemies/bounties/kc_bounty19.dbr"}
	KCBounty19StateObjects[""					 	] = { state = BountyState.Default, dbr = nil }

function gd.bounties.KCBounty19OnAddToWorld(objectId)
	if Server then
		if (not KCBounty19Spawned) then
			local player = Game.GetLocalPlayer()
			local MPOverrideDbr = nil
			local MPOverrideState = false

			if (player:AnyoneHasToken("KC_BOUNTY19")) then
				MPOverrideDbr = "records/creatures/enemies/bounties/kc_bounty19.dbr"
				MPOverrideState = true
				KCBounty19Spawned = true
				
			end

			monsterId = objectId
			KCBounty19Id = objectId
	
			local userdata = {}
			local didWork, newState = TokenStateBasedObjectSwap(objectId, userdata, KCBounty19StateObjects, Character, CharacterCreateArgs, MPOverrideState, MPOverrideDbr)
	
			Shared.setUserdata(objectId, userdata)
	
			-- Don't respawn the Monster next time. If spawned as hostile, will be saved into the world
			if (newState == BountyState.Spawned) then
				KCBounty19Spawned = true
				
			end
			
		end
	
	end
	
end

function gd.bounties.spawnKCBounty19()
	if Server then
		local player = Game.GetLocalPlayer()
		
		if not KCBounty19Spawned then
			local player = Game.GetLocalPlayer()
			local MPOverrideDbr = nil
			local MPOverrideState = false
		
			local entity = Entity.Get(KCBounty19Id)
			
			if entity != nil then
				if (player:AnyoneHasToken("KC_BOUNTY19")) then
					MPOverrideDbr = "records/creatures/enemies/bounties/kc_bounty19.dbr"
					MPOverrideState = true
					
				end
			
				monsterId = KCBounty19Id
				local didWork, newState = UpdateObjectSwap(KCBounty19Id, KCBounty19StateObjects, Character, CharacterCreateArgs, MPOverrideState, MPOverrideDbr)
	
				-- Don't respawn the Monster next time. If spawned as hostile, will be saved into the world
				KCBounty19Spawned = true
			
			end
			
		end
	
	end

end


--Order of Death's Vigil Spawns
--Bounty 06
local ODVBounty06Id = 0
local ODVBounty06Spawned = false

local ODVBounty06StateObjects = orderedTable()
	ODVBounty06StateObjects["ODV_BOUNTY06"	] = { state = BountyState.Spawned, dbr = "records/creatures/enemies/bounties/odv_bounty06.dbr"}
	ODVBounty06StateObjects[""					 	] = { state = BountyState.Default, dbr = nil }

function gd.bounties.ODVBounty06OnAddToWorld(objectId)
	if Server then
		if (not ODVBounty06Spawned) then
			local player = Game.GetLocalPlayer()
			local MPOverrideDbr = nil
			local MPOverrideState = false

			if (player:AnyoneHasToken("ODV_BOUNTY06")) then
				MPOverrideDbr = "records/creatures/enemies/bounties/odv_bounty06.dbr"
				MPOverrideState = true
				ODVBounty06Spawned = true
				
			end

			monsterId = objectId
			ODVBounty06Id = objectId
	
			local userdata = {}
			local didWork, newState = TokenStateBasedObjectSwap(objectId, userdata, ODVBounty06StateObjects, Character, CharacterCreateArgs, MPOverrideState, MPOverrideDbr)
	
			Shared.setUserdata(objectId, userdata)
	
			-- Don't respawn the Monster next time. If spawned as hostile, will be saved into the world
			if (newState == BountyState.Spawned) then
				ODVBounty06Spawned = true
				
			end
			
		end
	
	end
	
end

function gd.bounties.spawnODVBounty06()
	if Server then
		local player = Game.GetLocalPlayer()
		
		if not ODVBounty06Spawned then
			local player = Game.GetLocalPlayer()
			local MPOverrideDbr = nil
			local MPOverrideState = false
			
			local entity = Entity.Get(ODVBounty06Id)
			
			if entity != nil then
				if (player:AnyoneHasToken("ODV_BOUNTY06")) then
					MPOverrideDbr = "records/creatures/enemies/bounties/odv_bounty06.dbr"
					MPOverrideState = true
					
				end
			
				monsterId = ODVBounty06Id
				local didWork, newState = UpdateObjectSwap(ODVBounty06Id, ODVBounty06StateObjects, Character, CharacterCreateArgs, MPOverrideState, MPOverrideDbr)
	
				-- Don't respawn the Monster next time. If spawned as hostile, will be saved into the world
				ODVBounty06Spawned = true
			
			end
			
		end
	
	end

end

--Bounty 07
local ODVBounty07Id = 0
local ODVBounty07Spawned = false

local ODVBounty07StateObjects = orderedTable()
	ODVBounty07StateObjects["ODV_BOUNTY07"	] = { state = BountyState.Spawned, dbr = "records/creatures/enemies/bounties/odv_bounty07.dbr"}
	ODVBounty07StateObjects[""					 	] = { state = BountyState.Default, dbr = nil }

function gd.bounties.ODVBounty07OnAddToWorld(objectId)
	if Server then
		if (not ODVBounty07Spawned) then
			local player = Game.GetLocalPlayer()
			local MPOverrideDbr = nil
			local MPOverrideState = false

			if (player:AnyoneHasToken("ODV_BOUNTY07") && player:ServerHasToken("AREAC_NECROS_CHOSEN")) then
				MPOverrideDbr = "records/creatures/enemies/bounties/odv_bounty07.dbr"
				MPOverrideState = true
				ODVBounty07Spawned = true
				
			end

			monsterId = objectId
			ODVBounty07Id = objectId
	
			local userdata = {}
			local didWork, newState = TokenStateBasedObjectSwap(objectId, userdata, ODVBounty07StateObjects, Character, CharacterCreateArgs, MPOverrideState, MPOverrideDbr)
	
			Shared.setUserdata(objectId, userdata)
	
			-- Don't respawn the Monster next time. If spawned as hostile, will be saved into the world
			if (newState == BountyState.Spawned) then
				ODVBounty07Spawned = true
				
			end
			
		end
	
	end
	
end

function gd.bounties.spawnODVBounty07()
	if Server then
		local player = Game.GetLocalPlayer()
		
		if not ODVBounty07Spawned then
			local player = Game.GetLocalPlayer()
			local MPOverrideDbr = nil
			local MPOverrideState = false
			
			local entity = Entity.Get(ODVBounty07Id)
			
			if entity != nil then
				if (player:AnyoneHasToken("ODV_BOUNTY07") && player:ServerHasToken("AREAC_NECROS_CHOSEN")) then
					MPOverrideDbr = "records/creatures/enemies/bounties/odv_bounty07.dbr"
					MPOverrideState = true
					
				end
			
				monsterId = ODVBounty07Id
				local didWork, newState = UpdateObjectSwap(ODVBounty07Id, ODVBounty07StateObjects, Character, CharacterCreateArgs, MPOverrideState, MPOverrideDbr)
	
				-- Don't respawn the Monster next time. If spawned as hostile, will be saved into the world
				ODVBounty07Spawned = true
			
			end
			
		end
	
	end

end

--Bounty 08
local ODVBounty08Id = 0
local ODVBounty08Spawned = false

local ODVBounty08StateObjects = orderedTable()
	ODVBounty08StateObjects["ODV_BOUNTY08"	] = { state = BountyState.Spawned, dbr = "records/creatures/enemies/bounties/odv_bounty08.dbr"}
	ODVBounty08StateObjects[""					 	] = { state = BountyState.Default, dbr = nil }

function gd.bounties.ODVBounty08OnAddToWorld(objectId)
	if Server then
		if (not ODVBounty08Spawned) then
			local player = Game.GetLocalPlayer()
			local MPOverrideDbr = nil
			local MPOverrideState = false

			if (player:AnyoneHasToken("ODV_BOUNTY08") && player:ServerHasToken("AREAC_NECROS_CHOSEN")) then
				MPOverrideDbr = "records/creatures/enemies/bounties/odv_bounty08.dbr"
				MPOverrideState = true
				ODVBounty08Spawned = true
				
			end

			monsterId = objectId
			ODVBounty08Id = objectId
	
			local userdata = {}
			local didWork, newState = TokenStateBasedObjectSwap(objectId, userdata, ODVBounty08StateObjects, Character, CharacterCreateArgs, MPOverrideState, MPOverrideDbr)
	
			Shared.setUserdata(objectId, userdata)
	
			-- Don't respawn the Monster next time. If spawned as hostile, will be saved into the world
			if (newState == BountyState.Spawned) then
				ODVBounty08Spawned = true
				
			end
			
		end
	
	end
	
end

function gd.bounties.spawnODVBounty08()
	if Server then
		local player = Game.GetLocalPlayer()
		
		if not ODVBounty08Spawned then
			local player = Game.GetLocalPlayer()
			local MPOverrideDbr = nil
			local MPOverrideState = false
			
			local entity = Entity.Get(ODVBounty08Id)
			
			if entity != nil then
				if (player:AnyoneHasToken("ODV_BOUNTY08") && player:ServerHasToken("AREAC_NECROS_CHOSEN")) then
					MPOverrideDbr = "records/creatures/enemies/bounties/odv_bounty08.dbr"
					MPOverrideState = true
					
				end
			
				monsterId = ODVBounty08Id
				local didWork, newState = UpdateObjectSwap(ODVBounty08Id, ODVBounty08StateObjects, Character, CharacterCreateArgs, MPOverrideState, MPOverrideDbr)
	
				-- Don't respawn the Monster next time. If spawned as hostile, will be saved into the world
				ODVBounty08Spawned = true
			
			end
			
		end
	
	end

end

--Bounty 09
local ODVBounty09Id = 0
local ODVBounty09Spawned = false

local ODVBounty09StateObjects = orderedTable()
	ODVBounty09StateObjects["ODV_BOUNTY09"	] = { state = BountyState.Spawned, dbr = "records/creatures/enemies/bounties/odv_bounty09.dbr"}
	ODVBounty09StateObjects[""					 	] = { state = BountyState.Default, dbr = nil }

function gd.bounties.ODVBounty09OnAddToWorld(objectId)
	if Server then
		if (not ODVBounty09Spawned) then
			local player = Game.GetLocalPlayer()
			local MPOverrideDbr = nil
			local MPOverrideState = false

			if (player:AnyoneHasToken("ODV_BOUNTY09")) then
				MPOverrideDbr = "records/creatures/enemies/bounties/odv_bounty09.dbr"
				MPOverrideState = true
				ODVBounty09Spawned = true
				
			end

			monsterId = objectId
			ODVBounty09Id = objectId
	
			local userdata = {}
			local didWork, newState = TokenStateBasedObjectSwap(objectId, userdata, ODVBounty09StateObjects, Character, CharacterCreateArgs, MPOverrideState, MPOverrideDbr)
	
			Shared.setUserdata(objectId, userdata)
	
			-- Don't respawn the Monster next time. If spawned as hostile, will be saved into the world
			if (newState == BountyState.Spawned) then
				ODVBounty09Spawned = true
				
			end
			
		end
	
	end
	
end

function gd.bounties.spawnODVBounty09()
	if Server then
		local player = Game.GetLocalPlayer()
		
		if not ODVBounty09Spawned then
			local player = Game.GetLocalPlayer()
			local MPOverrideDbr = nil
			local MPOverrideState = false
			
			local entity = Entity.Get(ODVBounty09Id)
			
			if entity != nil then
				if (player:AnyoneHasToken("ODV_BOUNTY09")) then
					MPOverrideDbr = "records/creatures/enemies/bounties/odv_bounty09.dbr"
					MPOverrideState = true
					
				end
			
				monsterId = ODVBounty09Id
				local didWork, newState = UpdateObjectSwap(ODVBounty09Id, ODVBounty09StateObjects, Character, CharacterCreateArgs, MPOverrideState, MPOverrideDbr)
	
				-- Don't respawn the Monster next time. If spawned as hostile, will be saved into the world
				ODVBounty09Spawned = true
			
			end
			
		end
	
	end

end

--Bounty 10
local ODVBounty10Id = 0
local ODVBounty10Spawned = false

local ODVBounty10StateObjects = orderedTable()
	ODVBounty10StateObjects["ODV_BOUNTY10"	] = { state = BountyState.Spawned, dbr = "records/creatures/enemies/bounties/odv_bounty10.dbr"}
	ODVBounty10StateObjects[""					 	] = { state = BountyState.Default, dbr = nil }

function gd.bounties.ODVBounty10OnAddToWorld(objectId)
	if Server then
		if (not ODVBounty10Spawned) then
			local player = Game.GetLocalPlayer()
			local MPOverrideDbr = nil
			local MPOverrideState = false

			if (player:AnyoneHasToken("ODV_BOUNTY10")) then
				MPOverrideDbr = "records/creatures/enemies/bounties/odv_bounty10.dbr"
				MPOverrideState = true
				ODVBounty10Spawned = true
				
			end

			monsterId = objectId
			ODVBounty10Id = objectId
	
			local userdata = {}
			local didWork, newState = TokenStateBasedObjectSwap(objectId, userdata, ODVBounty10StateObjects, Character, CharacterCreateArgs, MPOverrideState, MPOverrideDbr)
	
			Shared.setUserdata(objectId, userdata)
	
			-- Don't respawn the Monster next time. If spawned as hostile, will be saved into the world
			if (newState == BountyState.Spawned) then
				ODVBounty10Spawned = true
				
			end
			
		end
	
	end
	
end

function gd.bounties.spawnODVBounty10()
	if Server then
		local player = Game.GetLocalPlayer()
		
		if not ODVBounty10Spawned then
			local player = Game.GetLocalPlayer()
			local MPOverrideDbr = nil
			local MPOverrideState = false
			
			local entity = Entity.Get(ODVBounty10Id)
			
			if entity != nil then
				if (player:AnyoneHasToken("ODV_BOUNTY10")) then
					MPOverrideDbr = "records/creatures/enemies/bounties/odv_bounty10.dbr"
					MPOverrideState = true
					
				end
			
				monsterId = ODVBounty10Id
				local didWork, newState = UpdateObjectSwap(ODVBounty10Id, ODVBounty10StateObjects, Character, CharacterCreateArgs, MPOverrideState, MPOverrideDbr)
	
				-- Don't respawn the Monster next time. If spawned as hostile, will be saved into the world
				ODVBounty10Spawned = true
			
			end
			
		end
	
	end

end

--Bounty 11
local ODVBounty11Id = 0
local ODVBounty11Spawned = false

local ODVBounty11StateObjects = orderedTable()
	ODVBounty11StateObjects["ODV_BOUNTY11"	] = { state = BountyState.Spawned, dbr = "records/creatures/enemies/bounties/odv_bounty11.dbr"}
	ODVBounty11StateObjects[""					 	] = { state = BountyState.Default, dbr = nil }

function gd.bounties.ODVBounty11OnAddToWorld(objectId)
	if Server then
		if (not ODVBounty11Spawned) then
			local player = Game.GetLocalPlayer()
			local MPOverrideDbr = nil
			local MPOverrideState = false

			if (player:AnyoneHasToken("ODV_BOUNTY11")) then
				MPOverrideDbr = "records/creatures/enemies/bounties/odv_bounty11.dbr"
				MPOverrideState = true
				ODVBounty11Spawned = true
				
			end

			monsterId = objectId
			ODVBounty11Id = objectId
	
			local userdata = {}
			local didWork, newState = TokenStateBasedObjectSwap(objectId, userdata, ODVBounty11StateObjects, Character, CharacterCreateArgs, MPOverrideState, MPOverrideDbr)
	
			Shared.setUserdata(objectId, userdata)
	
			-- Don't respawn the Monster next time. If spawned as hostile, will be saved into the world
			if (newState == BountyState.Spawned) then
				ODVBounty11Spawned = true
				
			end
			
		end
	
	end
	
end

function gd.bounties.spawnODVBounty11()
	if Server then
		local player = Game.GetLocalPlayer()
		
		if not ODVBounty11Spawned then
			local player = Game.GetLocalPlayer()
			local MPOverrideDbr = nil
			local MPOverrideState = false
			
			local entity = Entity.Get(ODVBounty11Id)
			
			if entity != nil then
				if (player:AnyoneHasToken("ODV_BOUNTY11")) then
					MPOverrideDbr = "records/creatures/enemies/bounties/odv_bounty11.dbr"
					MPOverrideState = true
					
				end
			
				monsterId = ODVBounty11Id
				local didWork, newState = UpdateObjectSwap(ODVBounty11Id, ODVBounty11StateObjects, Character, CharacterCreateArgs, MPOverrideState, MPOverrideDbr)
	
				-- Don't respawn the Monster next time. If spawned as hostile, will be saved into the world
				ODVBounty11Spawned = true
			
			end
			
		end
	
	end

end

--Bounty 12
local ODVBounty12Id = 0
local ODVBounty12Spawned = false

local ODVBounty12StateObjects = orderedTable()
	ODVBounty12StateObjects["ODV_BOUNTY12"	] = { state = BountyState.Spawned, dbr = "records/creatures/enemies/bounties/odv_bounty12.dbr"}
	ODVBounty12StateObjects[""					 	] = { state = BountyState.Default, dbr = nil }

function gd.bounties.ODVBounty12OnAddToWorld(objectId)
	if Server then
		if (not ODVBounty12Spawned) then
			local player = Game.GetLocalPlayer()
			local MPOverrideDbr = nil
			local MPOverrideState = false

			if (player:AnyoneHasToken("ODV_BOUNTY12")) then
				MPOverrideDbr = "records/creatures/enemies/bounties/odv_bounty12.dbr"
				MPOverrideState = true
				ODVBounty12Spawned = true
				
			end

			monsterId = objectId
			ODVBounty12Id = objectId
	
			local userdata = {}
			local didWork, newState = TokenStateBasedObjectSwap(objectId, userdata, ODVBounty12StateObjects, Character, CharacterCreateArgs, MPOverrideState, MPOverrideDbr)
	
			Shared.setUserdata(objectId, userdata)
	
			-- Don't respawn the Monster next time. If spawned as hostile, will be saved into the world
			if (newState == BountyState.Spawned) then
				ODVBounty12Spawned = true
				
			end
			
		end
	
	end
	
end

function gd.bounties.spawnODVBounty12()
	if Server then
		local player = Game.GetLocalPlayer()
		
		if not ODVBounty12Spawned then
			local player = Game.GetLocalPlayer()
			local MPOverrideDbr = nil
			local MPOverrideState = false
			
			local entity = Entity.Get(ODVBounty12Id)
			
			if entity != nil then
				if (player:AnyoneHasToken("ODV_BOUNTY12")) then
					MPOverrideDbr = "records/creatures/enemies/bounties/odv_bounty12.dbr"
					MPOverrideState = true
					
				end
			
				monsterId = ODVBounty12Id
				local didWork, newState = UpdateObjectSwap(ODVBounty12Id, ODVBounty12StateObjects, Character, CharacterCreateArgs, MPOverrideState, MPOverrideDbr)
	
				-- Don't respawn the Monster next time. If spawned as hostile, will be saved into the world
				ODVBounty12Spawned = true
			
			end
			
		end
	
	end

end


--Bounty 13
local ODVBounty13Id = 0
local ODVBounty13Spawned = false

local ODVBounty13StateObjects = orderedTable()
	ODVBounty13StateObjects["ODV_BOUNTY13"	] = { state = BountyState.Spawned, dbr = "records/creatures/enemies/bounties/odv_bounty13.dbr"}
	ODVBounty13StateObjects[""					 	] = { state = BountyState.Default, dbr = nil }

function gd.bounties.ODVBounty13OnAddToWorld(objectId)
	if Server then
		if (not ODVBounty13Spawned) then
			local player = Game.GetLocalPlayer()
			local MPOverrideDbr = nil
			local MPOverrideState = false

			if (player:AnyoneHasToken("ODV_BOUNTY13")) then
				MPOverrideDbr = "records/creatures/enemies/bounties/odv_bounty13.dbr"
				MPOverrideState = true
				ODVBounty13Spawned = true
				
			end

			monsterId = objectId
			ODVBounty13Id = objectId
	
			local userdata = {}
			local didWork, newState = TokenStateBasedObjectSwap(objectId, userdata, ODVBounty13StateObjects, Character, CharacterCreateArgs, MPOverrideState, MPOverrideDbr)
	
			Shared.setUserdata(objectId, userdata)
	
			-- Don't respawn the Monster next time. If spawned as hostile, will be saved into the world
			if (newState == BountyState.Spawned) then
				ODVBounty13Spawned = true
				
			end
			
		end
	
	end
	
end

function gd.bounties.spawnODVBounty13()
	if Server then
		local player = Game.GetLocalPlayer()
		
		if not ODVBounty13Spawned then
			local player = Game.GetLocalPlayer()
			local MPOverrideDbr = nil
			local MPOverrideState = false
			
			local entity = Entity.Get(ODVBounty13Id)
			
			if entity != nil then
				if (player:AnyoneHasToken("ODV_BOUNTY13")) then
					MPOverrideDbr = "records/creatures/enemies/bounties/odv_bounty13.dbr"
					MPOverrideState = true
					
				end
			
				monsterId = ODVBounty13Id
				local didWork, newState = UpdateObjectSwap(ODVBounty13Id, ODVBounty13StateObjects, Character, CharacterCreateArgs, MPOverrideState, MPOverrideDbr)
	
				-- Don't respawn the Monster next time. If spawned as hostile, will be saved into the world
				ODVBounty13Spawned = true
			
			end
			
		end
	
	end

end


--Exile Spawns
--Bounty 12
local EXILEBounty12Id = 0
local EXILEBounty12Spawned = false

local EXILEBounty12StateObjects = orderedTable()
	EXILEBounty12StateObjects["EXILE_BOUNTY12"	] = { state = BountyState.Spawned, dbr = "records/creatures/enemies/bounties/exile_bounty12.dbr"}
	EXILEBounty12StateObjects[""					 	] = { state = BountyState.Default, dbr = nil }

function gd.bounties.EXILEBounty12OnAddToWorld(objectId)
	if Server then
		if (not EXILEBounty12Spawned) then
			local player = Game.GetLocalPlayer()
			local MPOverrideDbr = nil
			local MPOverrideState = false

			if (player:AnyoneHasToken("EXILE_BOUNTY12")) then
				MPOverrideDbr = "records/creatures/enemies/bounties/exile_bounty12.dbr"
				MPOverrideState = true
				EXILEBounty12Spawned = true
				
			end

			monsterId = objectId
			EXILEBounty12Id = objectId
	
			local userdata = {}
			local didWork, newState = TokenStateBasedObjectSwap(objectId, userdata, EXILEBounty12StateObjects, Character, CharacterCreateArgs, MPOverrideState, MPOverrideDbr)
	
			Shared.setUserdata(objectId, userdata)
	
			-- Don't respawn the Monster next time. If spawned as hostile, will be saved into the world
			if (newState == BountyState.Spawned) then
				EXILEBounty12Spawned = true
				
			end
			
		end
	
	end
	
end

function gd.bounties.spawnEXILEBounty12()
	if Server then
		local player = Game.GetLocalPlayer()
		
		if not EXILEBounty12Spawned then
			local player = Game.GetLocalPlayer()
			local MPOverrideDbr = nil
			local MPOverrideState = false
			
			local entity = Entity.Get(EXILEBounty12Id)
			
			if entity != nil then
				if (player:AnyoneHasToken("EXILE_BOUNTY12")) then
					MPOverrideDbr = "records/creatures/enemies/bounties/exile_bounty12.dbr"
					MPOverrideState = true
					
				end
			
				monsterId = EXILEBounty12Id
				local didWork, newState = UpdateObjectSwap(EXILEBounty12Id, EXILEBounty12StateObjects, Character, CharacterCreateArgs, MPOverrideState, MPOverrideDbr)
			
				-- Don't respawn the Monster next time. If spawned as hostile, will be saved into the world
				EXILEBounty12Spawned = true
				
			end

		end
	
	end

end

--Bounty 13
local EXILEBounty13Id = 0
local EXILEBounty13Spawned = false

local EXILEBounty13StateObjects = orderedTable()
	EXILEBounty13StateObjects["EXILE_BOUNTY13"	] = { state = BountyState.Spawned, dbr = "records/creatures/enemies/bounties/exile_bounty13.dbr"}
	EXILEBounty13StateObjects[""					 	] = { state = BountyState.Default, dbr = nil }

function gd.bounties.EXILEBounty13OnAddToWorld(objectId)
	if Server then
		if (not EXILEBounty13Spawned) then
			local player = Game.GetLocalPlayer()
			local MPOverrideDbr = nil
			local MPOverrideState = false

			if (player:AnyoneHasToken("EXILE_BOUNTY13")) then
				MPOverrideDbr = "records/creatures/enemies/bounties/exile_bounty13.dbr"
				MPOverrideState = true
				EXILEBounty13Spawned = true
				
			end

			monsterId = objectId
			EXILEBounty13Id = objectId
	
			local userdata = {}
			local didWork, newState = TokenStateBasedObjectSwap(objectId, userdata, EXILEBounty13StateObjects, Character, CharacterCreateArgs, MPOverrideState, MPOverrideDbr)
	
			Shared.setUserdata(objectId, userdata)
	
			-- Don't respawn the Monster next time. If spawned as hostile, will be saved into the world
			if (newState == BountyState.Spawned) then
				EXILEBounty13Spawned = true
				
			end
			
		end
	
	end
	
end

function gd.bounties.spawnEXILEBounty13()
	if Server then
		local player = Game.GetLocalPlayer()
		
		if not EXILEBounty13Spawned then
			local player = Game.GetLocalPlayer()
			local MPOverrideDbr = nil
			local MPOverrideState = false
			
			local entity = Entity.Get(EXILEBounty13Id)
			
			if entity != nil then
				if (player:AnyoneHasToken("EXILE_BOUNTY13")) then
					MPOverrideDbr = "records/creatures/enemies/bounties/exile_bounty13.dbr"
					MPOverrideState = true
					
				end
				
				monsterId = EXILEBounty13Id
				local didWork, newState = UpdateObjectSwap(EXILEBounty13Id, EXILEBounty13StateObjects, Character, CharacterCreateArgs, MPOverrideState, MPOverrideDbr)
		
				-- Don't respawn the Monster next time. If spawned as hostile, will be saved into the world
				EXILEBounty13Spawned = true
			
			end
			
		end
	
	end

end

--Bounty 14
local EXILEBounty14Id = 0
local EXILEBounty14Spawned = false

local EXILEBounty14StateObjects = orderedTable()
	EXILEBounty14StateObjects["EXILE_BOUNTY14"	] = { state = BountyState.Spawned, dbr = "records/creatures/enemies/bounties/exile_bounty14.dbr"}
	EXILEBounty14StateObjects[""					 	] = { state = BountyState.Default, dbr = nil }

function gd.bounties.EXILEBounty14OnAddToWorld(objectId)
	if Server then
		if (not EXILEBounty14Spawned) then
			local player = Game.GetLocalPlayer()
			local MPOverrideDbr = nil
			local MPOverrideState = false

			if (player:AnyoneHasToken("EXILE_BOUNTY14")) then
				MPOverrideDbr = "records/creatures/enemies/bounties/exile_bounty14.dbr"
				MPOverrideState = true
				EXILEBounty14Spawned = true
				
			end

			monsterId = objectId
			EXILEBounty14Id = objectId
	
			local userdata = {}
			local didWork, newState = TokenStateBasedObjectSwap(objectId, userdata, EXILEBounty14StateObjects, Character, CharacterCreateArgs, MPOverrideState, MPOverrideDbr)
	
			Shared.setUserdata(objectId, userdata)
	
			-- Don't respawn the Monster next time. If spawned as hostile, will be saved into the world
			if (newState == BountyState.Spawned) then
				EXILEBounty14Spawned = true
				
			end
			
		end
	
	end
	
end

function gd.bounties.spawnEXILEBounty14()
	if Server then
		local player = Game.GetLocalPlayer()
		
		if not EXILEBounty14Spawned then
			local player = Game.GetLocalPlayer()
			local MPOverrideDbr = nil
			local MPOverrideState = false
			
			local entity = Entity.Get(EXILEBounty14Id)
			
			if entity != nil then
				if (player:AnyoneHasToken("EXILE_BOUNTY14")) then
					MPOverrideDbr = "records/creatures/enemies/bounties/exile_bounty14.dbr"
					MPOverrideState = true
					
				end
				
				monsterId = EXILEBounty14Id
				local didWork, newState = UpdateObjectSwap(EXILEBounty14Id, EXILEBounty14StateObjects, Character, CharacterCreateArgs, MPOverrideState, MPOverrideDbr)
		
				-- Don't respawn the Monster next time. If spawned as hostile, will be saved into the world
				EXILEBounty14Spawned = true
			
			end
			
		end
	
	end

end

--Bounty 15
local EXILEBounty15Id = 0
local EXILEBounty15Spawned = false

local EXILEBounty15StateObjects = orderedTable()
	EXILEBounty15StateObjects["EXILE_BOUNTY15"	] = { state = BountyState.Spawned, dbr = "records/creatures/enemies/bounties/exile_bounty15.dbr"}
	EXILEBounty15StateObjects[""					 	] = { state = BountyState.Default, dbr = nil }

function gd.bounties.EXILEBounty15OnAddToWorld(objectId)
	if Server then
		if (not EXILEBounty15Spawned) then
			local player = Game.GetLocalPlayer()
			local MPOverrideDbr = nil
			local MPOverrideState = false

			if (player:AnyoneHasToken("EXILE_BOUNTY15")) then
				MPOverrideDbr = "records/creatures/enemies/bounties/exile_bounty15.dbr"
				MPOverrideState = true
				EXILEBounty15Spawned = true
				
			end

			monsterId = objectId
			EXILEBounty15Id = objectId
	
			local userdata = {}
			local didWork, newState = TokenStateBasedObjectSwap(objectId, userdata, EXILEBounty15StateObjects, Character, CharacterCreateArgs, MPOverrideState, MPOverrideDbr)
	
			Shared.setUserdata(objectId, userdata)
	
			-- Don't respawn the Monster next time. If spawned as hostile, will be saved into the world
			if (newState == BountyState.Spawned) then
				EXILEBounty15Spawned = true
				
			end
			
		end
	
	end
	
end

function gd.bounties.spawnEXILEBounty15()
	if Server then
		local player = Game.GetLocalPlayer()
		
		if not EXILEBounty15Spawned then
			local player = Game.GetLocalPlayer()
			local MPOverrideDbr = nil
			local MPOverrideState = false
			
			local entity = Entity.Get(EXILEBounty15Id)
			
			if entity != nil then
				if (player:AnyoneHasToken("EXILE_BOUNTY15")) then
					MPOverrideDbr = "records/creatures/enemies/bounties/exile_bounty15.dbr"
					MPOverrideState = true
					
				end
				
				monsterId = EXILEBounty15Id
				local didWork, newState = UpdateObjectSwap(EXILEBounty15Id, EXILEBounty15StateObjects, Character, CharacterCreateArgs, MPOverrideState, MPOverrideDbr)
		
				-- Don't respawn the Monster next time. If spawned as hostile, will be saved into the world
				EXILEBounty15Spawned = true
			
			end
			
		end
	
	end

end







