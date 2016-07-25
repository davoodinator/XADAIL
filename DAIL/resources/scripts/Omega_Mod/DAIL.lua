----THIS FILE is FOR DAIL MOD and will be erased/replaced by DAIL scripts.It does nothing for OMEGA MOD
---The function callDAILonherodeath is the only one called by omega scripts on hero death on any difficulty.
--DAIL START
dail = {}
dail.scripts = {}
dail.summon = {}
--DAIL END

--DAIL START
function callDAILonherodeath()
	math.randomseed(Time.Now());
	local DAILpop = math.random(1, 100000);
	--5% chance
	if DAILpop < 5000 then
		UI.Notify("DAIL_AETHERIAL_POP");
		local player = Game.GetLocalPlayer();
		player:GiveItem('DAIL/items/summon/dailRNGpot.dbr', 1, true);
--		dail.scripts.spawndailitems();
--		dail.scripts.spawndailnpcs();
	end
end
--DAIL END

--DAIL START
function dail.scripts.spawndailitems()
	local player = Game.GetLocalPlayer();
		local dbrITEM = {
		'DAIL/items/summon/dailskillsummon0001.dbr',
		'DAIL/items/summon/dailskillsummon0002.dbr',
		'DAIL/items/summon/dailskillsummon0003.dbr',
		'DAIL/items/summon/dailskillsummon0004.dbr',
		'DAIL/items/summon/dailskillsummon0005.dbr',
		'DAIL/items/summon/dailskillsummon0006.dbr',
		'DAIL/items/summon/dailskillsummon0007.dbr',
		'DAIL/items/summon/dailskillsummon0008.dbr',
		'DAIL/items/summon/dailskillsummon0009.dbr',
		'DAIL/items/summon/dailskillsummon0010.dbr',
		'DAIL/items/summon/dailskillsummon0011.dbr',
		'DAIL/items/summon/dailskillsummon0012.dbr',
		'DAIL/items/summon/dailskillsummon0013.dbr',
		'DAIL/items/summon/dailskillsummon0016.dbr',
		'DAIL/items/summon/dailskillsummon0017.dbr',
		'DAIL/items/summon/dailskillsummon0018.dbr',
		'DAIL/items/summon/dailskillsummon0019.dbr',
		'DAIL/items/summon/dailskillsummon0020.dbr',
		'DAIL/items/summon/dailskillsummon0021.dbr',
		'DAIL/items/summon/dailskillsummon0022.dbr',
		'DAIL/items/summon/dailskillsummon0023.dbr',
		'DAIL/items/summon/dailskillsummon0024.dbr',
		'DAIL/items/summon/dailskillsummon0026.dbr',
		'DAIL/items/summon/dailskillsummon0027.dbr',
		'DAIL/items/summon/dailskillsummon0028.dbr',
		'DAIL/items/summon/dailskillsummon0029.dbr',
		'DAIL/items/summon/cratebox.dbr',
		'DAIL/items/summon/dailfactionsummon0001.dbr',
		'DAIL/items/summon/dailfactionsummon0002.dbr',
		'DAIL/items/summon/dailfactionsummon0003.dbr'
	};
--	math.randomseed(Time.Now());
--	local randNPC = math.random(1, table.getn(dbrITEM));
	local randITEM = math.random(1, 31);
--	local newNPC = Entity.Create(dbrNPC[randNPC]);
	player:GiveItem(dbrITEM[randITEM], 1, true);

end

--		'DAIL/creatures/npcs/merchants/DAILclassplusser0014.dbr',
--		'DAIL/creatures/npcs/merchants/DAILclassplusser0015.dbr',
--		'DAIL/creatures/npcs/merchants/DAILclassplusser0025.dbr',
--		'DAIL/creatures/npcs/merchants/DAILclassplusser0030.dbr',

function dail.scripts.spawndailnpcs()
	UI.Notify("DAIL_AETHERIAL_POP2");
	local Player = Game.GetLocalPlayer();
	local coords = Player:GetCoords();
	local dbrNPC = {
		'DAIL/creatures/npcs/merchants/DAILclassplusser0001.dbr',
		'DAIL/creatures/npcs/merchants/DAILclassplusser0002.dbr',
		'DAIL/creatures/npcs/merchants/DAILclassplusser0003.dbr',
		'DAIL/creatures/npcs/merchants/DAILclassplusser0004.dbr',
		'DAIL/creatures/npcs/merchants/DAILclassplusser0005.dbr',
		'DAIL/creatures/npcs/merchants/DAILclassplusser0006.dbr',
		'DAIL/creatures/npcs/merchants/DAILclassplusser0007.dbr',
		'DAIL/creatures/npcs/merchants/DAILclassplusser0008.dbr',
		'DAIL/creatures/npcs/merchants/DAILclassplusser0009.dbr',
		'DAIL/creatures/npcs/merchants/DAILclassplusser0010.dbr',
		'DAIL/creatures/npcs/merchants/DAILclassplusser0011.dbr',
		'DAIL/creatures/npcs/merchants/DAILclassplusser0012.dbr',
		'DAIL/creatures/npcs/merchants/DAILclassplusser0013.dbr',
		'DAIL/creatures/npcs/merchants/DAILclassplusser0016.dbr',
		'DAIL/creatures/npcs/merchants/DAILclassplusser0017.dbr',
		'DAIL/creatures/npcs/merchants/DAILclassplusser0018.dbr',
		'DAIL/creatures/npcs/merchants/DAILclassplusser0019.dbr',
		'DAIL/creatures/npcs/merchants/DAILclassplusser0020.dbr',
		'DAIL/creatures/npcs/merchants/DAILclassplusser0021.dbr',
		'DAIL/creatures/npcs/merchants/DAILclassplusser0022.dbr',
		'DAIL/creatures/npcs/merchants/DAILclassplusser0023.dbr',
		'DAIL/creatures/npcs/merchants/DAILclassplusser0024.dbr',
		'DAIL/creatures/npcs/merchants/DAILclassplusser0026.dbr',
		'DAIL/creatures/npcs/merchants/DAILclassplusser0027.dbr',
		'DAIL/creatures/npcs/merchants/DAILclassplusser0028.dbr',
		'DAIL/creatures/npcs/merchants/DAILclassplusser0029.dbr',
		'records/creatures/npcs/merchants/transmogsmith.dbr',
		'DAIL/creatures/npcs/npcs/davood.dbr',
		'DAIL/creatures/npcs/npcs/khalanos.dbr',
		'DAIL/creatures/npcs/npcs/hardy.dbr'
	};
--	math.randomseed(Time.Now());
--	local randNPC = math.random(1, table.getn(dbrNPC));
	local randNPC = math.random(1, 31);
	local newNPC = Entity.Create(dbrNPC[randNPC]);
--	local playerCoords = Game.GetLocalPlayer():GetCoords();
--	newNPC:SetCoords(playerCoords);
				if (newNPC != nil) then
					newNPC:NetworkEnable()
					newNPC:SetCoords(coords)
				end
end

function dail.summon.item_cratebox()
 dail.summon.npc('records/creatures/npcs/merchant/transmogsmith.dbr')
 end
function dail.summon.dailskillsummon0001()
 dail.summon.npc('DAIL/creatures/npcs/merchants/DAILclassplusser0001.dbr')
 end
function dail.summon.dailskillsummon0002()
 dail.summon.npc('DAIL/creatures/npcs/merchants/DAILclassplusser0002.dbr')
 end
function dail.summon.dailskillsummon0003()
 dail.summon.npc('DAIL/creatures/npcs/merchants/DAILclassplusser0003.dbr')
 end
function dail.summon.dailskillsummon0004()
 dail.summon.npc('DAIL/creatures/npcs/merchants/DAILclassplusser0004.dbr')
 end
function dail.summon.dailskillsummon0005()
 dail.summon.npc('DAIL/creatures/npcs/merchants/DAILclassplusser0005.dbr')
 end
function dail.summon.dailskillsummon0006()
 dail.summon.npc('DAIL/creatures/npcs/merchants/DAILclassplusser0006.dbr')
 end
function dail.summon.dailskillsummon0007()
 dail.summon.npc('DAIL/creatures/npcs/merchants/DAILclassplusser0007.dbr')
 end
function dail.summon.dailskillsummon0008()
 dail.summon.npc('DAIL/creatures/npcs/merchants/DAILclassplusser0008.dbr')
 end
function dail.summon.dailskillsummon0009()
 dail.summon.npc('DAIL/creatures/npcs/merchants/DAILclassplusser0009.dbr')
 end
function dail.summon.dailskillsummon0010()
 dail.summon.npc('DAIL/creatures/npcs/merchants/DAILclassplusser0010.dbr')
 end
function dail.summon.dailskillsummon0011()
 dail.summon.npc('DAIL/creatures/npcs/merchants/DAILclassplusser0011.dbr')
 end
function dail.summon.dailskillsummon0012()
 dail.summon.npc('DAIL/creatures/npcs/merchants/DAILclassplusser0012.dbr')
 end
function dail.summon.dailskillsummon0013()
 dail.summon.npc('DAIL/creatures/npcs/merchants/DAILclassplusser0013.dbr')
 end
function dail.summon.dailskillsummon0014()
 dail.summon.npc('DAIL/creatures/npcs/merchants/DAILclassplusser0014.dbr')
 end
function dail.summon.dailskillsummon0015()
 dail.summon.npc('DAIL/creatures/npcs/merchants/DAILclassplusser0015.dbr')
 end
function dail.summon.dailskillsummon0016()
 dail.summon.npc('DAIL/creatures/npcs/merchants/DAILclassplusser0016.dbr')
 end
function dail.summon.dailskillsummon0017()
 dail.summon.npc('DAIL/creatures/npcs/merchants/DAILclassplusser0017.dbr')
 end
function dail.summon.dailskillsummon0018()
 dail.summon.npc('DAIL/creatures/npcs/merchants/DAILclassplusser0018.dbr')
 end
function dail.summon.dailskillsummon0019()
 dail.summon.npc('DAIL/creatures/npcs/merchants/DAILclassplusser0019.dbr')
 end
function dail.summon.dailskillsummon0020()
 dail.summon.npc('DAIL/creatures/npcs/merchants/DAILclassplusser0020.dbr')
 end
function dail.summon.dailskillsummon0021()
 dail.summon.npc('DAIL/creatures/npcs/merchants/DAILclassplusser0021.dbr')
 end
function dail.summon.dailskillsummon0022()
 dail.summon.npc('DAIL/creatures/npcs/merchants/DAILclassplusser0022.dbr')
 end
function dail.summon.dailskillsummon0023()
 dail.summon.npc('DAIL/creatures/npcs/merchants/DAILclassplusser0023.dbr')
 end
function dail.summon.dailskillsummon0024()
 dail.summon.npc('DAIL/creatures/npcs/merchants/DAILclassplusser0024.dbr')
 end
function dail.summon.dailskillsummon0025()
 dail.summon.npc('DAIL/creatures/npcs/merchants/DAILclassplusser0025.dbr')
 end
function dail.summon.dailskillsummon0026()
 dail.summon.npc('DAIL/creatures/npcs/merchants/DAILclassplusser0026.dbr')
 end
function dail.summon.dailskillsummon0027()
 dail.summon.npc('DAIL/creatures/npcs/merchants/DAILclassplusser0027.dbr')
 end
function dail.summon.dailskillsummon0028()
 dail.summon.npc('DAIL/creatures/npcs/merchants/DAILclassplusser0028.dbr')
 end
function dail.summon.dailskillsummon0029()
 dail.summon.npc('DAIL/creatures/npcs/merchants/DAILclassplusser0029.dbr')
 end
function dail.summon.dailskillsummon0030()
 dail.summon.npc('DAIL/creatures/npcs/merchants/DAILclassplusser0030.dbr')
 end
function dail.summon.dailfactionsummon00001()
 dail.summon.npc('DAIL/creatures/npcs/npcs/davood.dbr')
 end
function dail.summon.dailfactionsummon00002()
 dail.summon.npc('DAIL/creatures/npcs/npcs/khalanos.dbr')
 end
function dail.summon.dailfactionsummon00003()
 dail.summon.npc('DAIL/creatures/npcs/npcs/hardy.dbr')
 end

function dail.summon.npc(dailNPC)
	UI.Notify("DAIL_AETHERIAL_POP2");
	local Player = Game.GetLocalPlayer();
	local coords = Player:GetCoords();
	local newNPC = Entity.Create(dailNPC);
				if (newNPC != nil) then
					newNPC:NetworkEnable()
					newNPC:SetCoords(coords)
				end
end

--DAIL END