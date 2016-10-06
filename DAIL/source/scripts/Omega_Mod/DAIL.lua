----THIS FILE is FOR DAIL MOD and will be erased/replaced by DAIL scripts.It does nothing for OMEGA MOD
---The function callDAILonherodeath is the only one called by omega scripts on hero death on any difficulty.
--DAIL START
dail = {}
-- dail.scripts = {}
-- dail.summon = {}
--DAIL END

--DAIL START
function callDAILonherodeath()
	--math.randomseed(Time.Now());

	--local DAILpop = math.random(1, 100000);
	
	-- if DAILpop < 35000 then
		UI.Notify("DAIL_AETHERIAL_POP");
		local player = Game.GetLocalPlayer();
		player:GiveItem('DAIL/items/summon/dailRNGpot.dbr', 1, true);
	-- end
end
