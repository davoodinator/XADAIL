--OMEGA MOD scripts
--credit : okami29 at http://www.grimdawn.com/forums/showthread.php?p=387218

omega.scripts = {}

--DAIL START
dail = {}
dail.scripts = {}
dail.summon = {}
--DAIL END

function omega.scripts.onherodeath()
if Game.GetGameDifficulty() >= Game.Difficulty.Legendary then
local player = Game.GetLocalPlayer();
player:GiveItem('records/omega/items/questitems/Omega_Soul_Heroes.dbr', 1, true);
	if 	player:GetQuestState(0x4B25F880) != QuestState.InProgress then
		player:GrantQuest(0x4B25F880,0x36BE5A40);
	end
omega.scripts.spawnomegaboss();
end
--DAIL START
	math.randomseed(Time.Now());
	local DAILpop = random(1, 2000);
	--5% chance
	if DAILpop < 200 then
		UI.Notify("DAIL_AETHERIAL_POP");
		dail.scripts.spawndailitems();
--		dail.scripts.spawndailnpcs();
	end
--DAIL END
end


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
	math.randomseed(Time.Now());
--	local randNPC = random(1, table.getn(dbrITEM));
	local randITEM = random(1, 31);
--	local newNPC = Entity.Create(dbrNPC[randNPC]);
	player:GiveItem(dbrITEM[randITEM], 1, true);

end

--		'DAIL/creatures/npcs/merchants/DAILclassplusser0014.dbr',
--		'DAIL/creatures/npcs/merchants/DAILclassplusser0015.dbr',
--		'DAIL/creatures/npcs/merchants/DAILclassplusser0025.dbr',
--		'DAIL/creatures/npcs/merchants/DAILclassplusser0030.dbr',

function dail.scripts.spawndailnpcs()
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
	math.randomseed(Time.Now());
--	local randNPC = random(1, table.getn(dbrNPC));
	local randNPC = random(1, 31);
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

function omega.scripts.summonatfeet(objectID)
	local Player = Game.GetLocalPlayer();
	local coords = Player:GetCoords();
	--local namedbr ="records/creatures/enemies/hero/"..objectID..".dbr"
	local test = Entity.Create(objectID);
			
				if (test != nil) then
					test:NetworkEnable()
					test:SetCoords(coords)
				end
end

function omega.scripts.spawnomegaboss()
local bonusRandomizer = 0
local spOMbossRandomizer = 0
local spOMbosschance = 0
local player = Game.GetLocalPlayer();
math.randomseed(Time.Now())
spOMbossRandomizer = random(1,10000)

local t={'OMEGA_LEVEL_1','OMEGA_LEVEL_2','OMEGA_LEVEL_3','OMEGA_LEVEL_4','OMEGA_LEVEL_5','OMEGA_LEVEL_6','OMEGA_LEVEL_7','OMEGA_LEVEL_8','OMEGA_LEVEL_9','OMEGA_LEVEL_10','OMEGA_LEVEL_11','OMEGA_LEVEL_12','OMEGA_LEVEL_13','OMEGA_LEVEL_14','OMEGA_LEVEL_15','OMEGA_LEVEL_16','OMEGA_LEVEL_17','OMEGA_LEVEL_18','OMEGA_LEVEL_19','OMEGA_LEVEL_20','OMEGA_LEVEL_21','OMEGA_LEVEL_22','OMEGA_LEVEL_23','OMEGA_LEVEL_24','OMEGA_LEVEL_25','OMEGA_LEVEL_26','OMEGA_LEVEL_27','OMEGA_LEVEL_28','OMEGA_LEVEL_29','OMEGA_LEVEL_30','OMEGA_LEVEL_31','OMEGA_LEVEL_32','OMEGA_LEVEL_33','OMEGA_LEVEL_34','OMEGA_LEVEL_35','OMEGA_LEVEL_36','OMEGA_LEVEL_37','OMEGA_LEVEL_38','OMEGA_LEVEL_39','OMEGA_LEVEL_40','OMEGA_LEVEL_41','OMEGA_LEVEL_42','OMEGA_LEVEL_43','OMEGA_LEVEL_44','OMEGA_LEVEL_45','OMEGA_LEVEL_46','OMEGA_LEVEL_47','OMEGA_LEVEL_48','OMEGA_LEVEL_49','OMEGA_LEVEL_50','OMEGA_LEVEL_51','OMEGA_LEVEL_52','OMEGA_LEVEL_53','OMEGA_LEVEL_54','OMEGA_LEVEL_55','OMEGA_LEVEL_56','OMEGA_LEVEL_57','OMEGA_LEVEL_58','OMEGA_LEVEL_59','OMEGA_LEVEL_60','OMEGA_LEVEL_61','OMEGA_LEVEL_62','OMEGA_LEVEL_63','OMEGA_LEVEL_64','OMEGA_LEVEL_65','OMEGA_LEVEL_66','OMEGA_LEVEL_67','OMEGA_LEVEL_68','OMEGA_LEVEL_69','OMEGA_LEVEL_70','OMEGA_LEVEL_71','OMEGA_LEVEL_72','OMEGA_LEVEL_73','OMEGA_LEVEL_74','OMEGA_LEVEL_75','OMEGA_LEVEL_76','OMEGA_LEVEL_77','OMEGA_LEVEL_78','OMEGA_LEVEL_79','OMEGA_LEVEL_80','OMEGA_LEVEL_81','OMEGA_LEVEL_82','OMEGA_LEVEL_83','OMEGA_LEVEL_84','OMEGA_LEVEL_85','OMEGA_LEVEL_86','OMEGA_LEVEL_87','OMEGA_LEVEL_88','OMEGA_LEVEL_89','OMEGA_LEVEL_90','OMEGA_LEVEL_91','OMEGA_LEVEL_92','OMEGA_LEVEL_93','OMEGA_LEVEL_94','OMEGA_LEVEL_95','OMEGA_LEVEL_96','OMEGA_LEVEL_97','OMEGA_LEVEL_98','OMEGA_LEVEL_99','OMEGA_LEVEL_100'}		
		for i=1,100 do
			if player:HasToken(t[i]) then
			bonusRandomizer=i*2
			break
			end
		end
	spOMbosschance=spOMbossRandomizer+bonusRandomizer
	
	if spOMbosschance > 10000 then
		local spOMpetRandomizer = 0
		spOMpetRandomizer = random(1,6)
		if spOMpetRandomizer < 6 then
			omega.scripts.summonatfeet('records/omega/creatures/om_spawnerpet.dbr');
		else
			omega.scripts.summonatfeet('records/omega/creatures/om_spawnerpet2.dbr');
		end
	end
end



function omega.scripts.beginomegaquest()
	local player = Game.GetLocalPlayer();
	if Game.GetGameDifficulty() >= Game.Difficulty.Legendary and player:GetQuestState(0x4B25F880) != QuestState.InProgress then
	player:GrantQuest(0x4B25F880,0x36BE5A40);
	end
end


function omega.scripts.reset()
		local player = Game.GetLocalPlayer()
		--if Game.GetGameDifficulty() >= Game.Difficulty.Legendary then
			local t={'OMEGA_LEVEL_1','OMEGA_LEVEL_2','OMEGA_LEVEL_3','OMEGA_LEVEL_4','OMEGA_LEVEL_5','OMEGA_LEVEL_6','OMEGA_LEVEL_7','OMEGA_LEVEL_8','OMEGA_LEVEL_9','OMEGA_LEVEL_10','OMEGA_LEVEL_11','OMEGA_LEVEL_12','OMEGA_LEVEL_13','OMEGA_LEVEL_14','OMEGA_LEVEL_15','OMEGA_LEVEL_16','OMEGA_LEVEL_17','OMEGA_LEVEL_18','OMEGA_LEVEL_19','OMEGA_LEVEL_20','OMEGA_LEVEL_21','OMEGA_LEVEL_22','OMEGA_LEVEL_23','OMEGA_LEVEL_24','OMEGA_LEVEL_25','OMEGA_LEVEL_26','OMEGA_LEVEL_27','OMEGA_LEVEL_28','OMEGA_LEVEL_29','OMEGA_LEVEL_30','OMEGA_LEVEL_31','OMEGA_LEVEL_32','OMEGA_LEVEL_33','OMEGA_LEVEL_34','OMEGA_LEVEL_35','OMEGA_LEVEL_36','OMEGA_LEVEL_37','OMEGA_LEVEL_38','OMEGA_LEVEL_39','OMEGA_LEVEL_40','OMEGA_LEVEL_41','OMEGA_LEVEL_42','OMEGA_LEVEL_43','OMEGA_LEVEL_44','OMEGA_LEVEL_45','OMEGA_LEVEL_46','OMEGA_LEVEL_47','OMEGA_LEVEL_48','OMEGA_LEVEL_49','OMEGA_LEVEL_50','OMEGA_LEVEL_51','OMEGA_LEVEL_52','OMEGA_LEVEL_53','OMEGA_LEVEL_54','OMEGA_LEVEL_55','OMEGA_LEVEL_56','OMEGA_LEVEL_57','OMEGA_LEVEL_58','OMEGA_LEVEL_59','OMEGA_LEVEL_60','OMEGA_LEVEL_61','OMEGA_LEVEL_62','OMEGA_LEVEL_63','OMEGA_LEVEL_64','OMEGA_LEVEL_65','OMEGA_LEVEL_66','OMEGA_LEVEL_67','OMEGA_LEVEL_68','OMEGA_LEVEL_69','OMEGA_LEVEL_70','OMEGA_LEVEL_71','OMEGA_LEVEL_72','OMEGA_LEVEL_73','OMEGA_LEVEL_74','OMEGA_LEVEL_75','OMEGA_LEVEL_76','OMEGA_LEVEL_77','OMEGA_LEVEL_78','OMEGA_LEVEL_79','OMEGA_LEVEL_80','OMEGA_LEVEL_81','OMEGA_LEVEL_82','OMEGA_LEVEL_83','OMEGA_LEVEL_84','OMEGA_LEVEL_85','OMEGA_LEVEL_86','OMEGA_LEVEL_87','OMEGA_LEVEL_88','OMEGA_LEVEL_89','OMEGA_LEVEL_90','OMEGA_LEVEL_91','OMEGA_LEVEL_92','OMEGA_LEVEL_93','OMEGA_LEVEL_94','OMEGA_LEVEL_95','OMEGA_LEVEL_96','OMEGA_LEVEL_97','OMEGA_LEVEL_98','OMEGA_LEVEL_99','OMEGA_LEVEL_100'}
			local t2={'OMEGA_TOTALSPEED_1','OMEGA_TOTALSPEED_2','OMEGA_TOTALSPEED_3','OMEGA_TOTALSPEED_4','OMEGA_TOTALSPEED_5','OMEGA_TOTALSPEED_6','OMEGA_TOTALSPEED_7','OMEGA_TOTALSPEED_8','OMEGA_TOTALSPEED_9','OMEGA_TOTALSPEED_10','OMEGA_TOTALSPEED_11','OMEGA_TOTALSPEED_12','OMEGA_TOTALSPEED_13','OMEGA_TOTALSPEED_14','OMEGA_TOTALSPEED_15','OMEGA_TOTALSPEED_16','OMEGA_TOTALSPEED_17','OMEGA_TOTALSPEED_18','OMEGA_TOTALSPEED_19','OMEGA_TOTALSPEED_20','OMEGA_TOTALSPEED_21','OMEGA_TOTALSPEED_22','OMEGA_TOTALSPEED_23','OMEGA_TOTALSPEED_24','OMEGA_TOTALSPEED_25','OMEGA_TOTALSPEED_26','OMEGA_TOTALSPEED_27','OMEGA_TOTALSPEED_28','OMEGA_TOTALSPEED_29','OMEGA_TOTALSPEED_30','OMEGA_SHIELD_1','OMEGA_SHIELD_2','OMEGA_SHIELD_3','OMEGA_SHIELD_4','OMEGA_SHIELD_5','OMEGA_PROJSPEED_1','OMEGA_PROJSPEED_2','OMEGA_PROJSPEED_3','OMEGA_PROJSPEED_4','OMEGA_PROJSPEED_5','OMEGA_COOLDOWN_1','OMEGA_ABSREDUCTION_1','OMEGA_ENERGYREDUC_1','OMEGA_PETDAMAGE_1','OMEGA_PETDAMAGE_2','OMEGA_MAXRESIST_1','OMEGA_ALLDAMAGE_1','OMEGA_ALLDAMAGE_2','OMEGA_ALLDAMAGE_3','OMEGA_ALLDAMAGE_4','OMEGA_ALLDAMAGE_5','OMEGA_ALLDAMAGE_6','OMEGA_ALLDAMAGE_7','OMEGA_LLEECH_1','OMEGA_HEALTH_1','OMEGA_DEFENSE_1','OMEGA_REFLECTION_1','OMEGA_REFLECTION_2'}

			for i=1,58 do
				player:RemoveToken(t2[i])
			end

			for i=1,100 do
				if player:HasToken(t[i]) then
				player:GiveItem('records/omega/items/questitems/omega_orb.dbr',i,true);	
				break
				end
			end
			UI.Notify("tagOM_onReset");


end
function omega.scripts.reward()
		local player = Game.GetLocalPlayer()
		--if Game.GetGameDifficulty() >= Game.Difficulty.Legendary then
			local t={'OMEGA_LEVEL_1','OMEGA_LEVEL_2','OMEGA_LEVEL_3','OMEGA_LEVEL_4','OMEGA_LEVEL_5','OMEGA_LEVEL_6','OMEGA_LEVEL_7','OMEGA_LEVEL_8','OMEGA_LEVEL_9','OMEGA_LEVEL_10','OMEGA_LEVEL_11','OMEGA_LEVEL_12','OMEGA_LEVEL_13','OMEGA_LEVEL_14','OMEGA_LEVEL_15','OMEGA_LEVEL_16','OMEGA_LEVEL_17','OMEGA_LEVEL_18','OMEGA_LEVEL_19','OMEGA_LEVEL_20','OMEGA_LEVEL_21','OMEGA_LEVEL_22','OMEGA_LEVEL_23','OMEGA_LEVEL_24','OMEGA_LEVEL_25','OMEGA_LEVEL_26','OMEGA_LEVEL_27','OMEGA_LEVEL_28','OMEGA_LEVEL_29','OMEGA_LEVEL_30','OMEGA_LEVEL_31','OMEGA_LEVEL_32','OMEGA_LEVEL_33','OMEGA_LEVEL_34','OMEGA_LEVEL_35','OMEGA_LEVEL_36','OMEGA_LEVEL_37','OMEGA_LEVEL_38','OMEGA_LEVEL_39','OMEGA_LEVEL_40','OMEGA_LEVEL_41','OMEGA_LEVEL_42','OMEGA_LEVEL_43','OMEGA_LEVEL_44','OMEGA_LEVEL_45','OMEGA_LEVEL_46','OMEGA_LEVEL_47','OMEGA_LEVEL_48','OMEGA_LEVEL_49','OMEGA_LEVEL_50','OMEGA_LEVEL_51','OMEGA_LEVEL_52','OMEGA_LEVEL_53','OMEGA_LEVEL_54','OMEGA_LEVEL_55','OMEGA_LEVEL_56','OMEGA_LEVEL_57','OMEGA_LEVEL_58','OMEGA_LEVEL_59','OMEGA_LEVEL_60','OMEGA_LEVEL_61','OMEGA_LEVEL_62','OMEGA_LEVEL_63','OMEGA_LEVEL_64','OMEGA_LEVEL_65','OMEGA_LEVEL_66','OMEGA_LEVEL_67','OMEGA_LEVEL_68','OMEGA_LEVEL_69','OMEGA_LEVEL_70','OMEGA_LEVEL_71','OMEGA_LEVEL_72','OMEGA_LEVEL_73','OMEGA_LEVEL_74','OMEGA_LEVEL_75','OMEGA_LEVEL_76','OMEGA_LEVEL_77','OMEGA_LEVEL_78','OMEGA_LEVEL_79','OMEGA_LEVEL_80','OMEGA_LEVEL_81','OMEGA_LEVEL_82','OMEGA_LEVEL_83','OMEGA_LEVEL_84','OMEGA_LEVEL_85','OMEGA_LEVEL_86','OMEGA_LEVEL_87','OMEGA_LEVEL_88','OMEGA_LEVEL_89','OMEGA_LEVEL_90','OMEGA_LEVEL_91','OMEGA_LEVEL_92','OMEGA_LEVEL_93','OMEGA_LEVEL_94','OMEGA_LEVEL_95','OMEGA_LEVEL_96','OMEGA_LEVEL_97','OMEGA_LEVEL_98','OMEGA_LEVEL_99','OMEGA_LEVEL_100'}	

				for i=1,99 do
					if player:HasToken(t[i]) then
						player:GiveToken(t[i+1])
						player:RemoveToken(t[i])
						--player:GiveItem('records/omega/items/questitems/omega_orb.dbr',1,true);
						local dbrrecipe='records/omega/items/crafting/blueprints/other/omega_craft_proof_'..(i+1)..'.dbr'
						player:GiveItem(dbrrecipe,1,true);
						break
					end
				end
			--UI.Notify("tagOM_onReset");


end
function omega.scripts.notifylevel()
local t={'OMEGA_LEVEL_1','OMEGA_LEVEL_2','OMEGA_LEVEL_3','OMEGA_LEVEL_4','OMEGA_LEVEL_5','OMEGA_LEVEL_6','OMEGA_LEVEL_7','OMEGA_LEVEL_8','OMEGA_LEVEL_9','OMEGA_LEVEL_10','OMEGA_LEVEL_11','OMEGA_LEVEL_12','OMEGA_LEVEL_13','OMEGA_LEVEL_14','OMEGA_LEVEL_15','OMEGA_LEVEL_16','OMEGA_LEVEL_17','OMEGA_LEVEL_18','OMEGA_LEVEL_19','OMEGA_LEVEL_20','OMEGA_LEVEL_21','OMEGA_LEVEL_22','OMEGA_LEVEL_23','OMEGA_LEVEL_24','OMEGA_LEVEL_25','OMEGA_LEVEL_26','OMEGA_LEVEL_27','OMEGA_LEVEL_28','OMEGA_LEVEL_29','OMEGA_LEVEL_30','OMEGA_LEVEL_31','OMEGA_LEVEL_32','OMEGA_LEVEL_33','OMEGA_LEVEL_34','OMEGA_LEVEL_35','OMEGA_LEVEL_36','OMEGA_LEVEL_37','OMEGA_LEVEL_38','OMEGA_LEVEL_39','OMEGA_LEVEL_40','OMEGA_LEVEL_41','OMEGA_LEVEL_42','OMEGA_LEVEL_43','OMEGA_LEVEL_44','OMEGA_LEVEL_45','OMEGA_LEVEL_46','OMEGA_LEVEL_47','OMEGA_LEVEL_48','OMEGA_LEVEL_49','OMEGA_LEVEL_50','OMEGA_LEVEL_51','OMEGA_LEVEL_52','OMEGA_LEVEL_53','OMEGA_LEVEL_54','OMEGA_LEVEL_55','OMEGA_LEVEL_56','OMEGA_LEVEL_57','OMEGA_LEVEL_58','OMEGA_LEVEL_59','OMEGA_LEVEL_60','OMEGA_LEVEL_61','OMEGA_LEVEL_62','OMEGA_LEVEL_63','OMEGA_LEVEL_64','OMEGA_LEVEL_65','OMEGA_LEVEL_66','OMEGA_LEVEL_67','OMEGA_LEVEL_68','OMEGA_LEVEL_69','OMEGA_LEVEL_70','OMEGA_LEVEL_71','OMEGA_LEVEL_72','OMEGA_LEVEL_73','OMEGA_LEVEL_74','OMEGA_LEVEL_75','OMEGA_LEVEL_76','OMEGA_LEVEL_77','OMEGA_LEVEL_78','OMEGA_LEVEL_79','OMEGA_LEVEL_80','OMEGA_LEVEL_81','OMEGA_LEVEL_82','OMEGA_LEVEL_83','OMEGA_LEVEL_84','OMEGA_LEVEL_85','OMEGA_LEVEL_86','OMEGA_LEVEL_87','OMEGA_LEVEL_88','OMEGA_LEVEL_89','OMEGA_LEVEL_90','OMEGA_LEVEL_91','OMEGA_LEVEL_92','OMEGA_LEVEL_93','OMEGA_LEVEL_94','OMEGA_LEVEL_95','OMEGA_LEVEL_96','OMEGA_LEVEL_97','OMEGA_LEVEL_98','OMEGA_LEVEL_99','OMEGA_LEVEL_100'}

local player = Game.GetLocalPlayer();
	if player:HasToken('OMEGA_START_QUEST') then
		for i=1,100 do
			if player:HasToken(t[i]) then
				local tagnotify ='tagOM_notifylevel'..i
				UI.Notify(tagnotify);				
				break
			end
		end
	else	
	UI.Notify('tagOM_notifylevel0');
	end
end

function omega.scripts.bossMIonAddToWorld(objectId)
	UI.Notify('tagOM_bossMIdrop');
		local itemCoords = Entity.Get(objectId):GetCoords()
	    local test = Entity.Create('records/omega/fx/skills/om_fxpak_attackradius_sparkeffect.dbr');
			
				if (test != nil) then
					test:NetworkEnable()
					test:SetCoords(itemCoords)
				end
end