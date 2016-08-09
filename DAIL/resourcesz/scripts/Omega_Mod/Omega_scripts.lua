--OMEGA MOD scripts
--credit : okami29 at http://www.grimdawn.com/forums/showthread.php?p=387218

omega.scripts = {}

function omega.scripts.onherodeath()
	if Game.GetGameDifficulty() >= Game.Difficulty.Legendary then
		local player = Game.GetLocalPlayer();
		player:GiveItem('records/omega/items/questitems/Omega_Soul_Heroes.dbr', 1, true);
			if 	player:GetQuestState(0x4B25F880) != QuestState.InProgress then
				player:GrantQuest(0x4B25F880,0x36BE5A40);
			end
		omega.scripts.spawnomegaboss();
	end
	----START CALL for DAIL if Omega mod merge with DAIL.Function callDAILonherodeath() is inside DAIL.lua
	callDAILonherodeath()
	----END CALL for DAIL mod
end

function omega.scripts.onbossdeath()
	if Game.GetGameDifficulty() >= Game.Difficulty.Legendary then
		local player = Game.GetLocalPlayer();
		player:GiveItem('records/omega/items/questitems/Omega_Soul_Boss.dbr', 1, true);
	end
end

function omega.scripts.summonatfeet(objectID)
	local newCreature = Entity.Create(objectID);
	local playerCoords = Game.GetLocalPlayer():GetCoords();
	newCreature:SetCoords(playerCoords);
end

function omega.scripts.spawnomegaboss()
local bonusRandomizer = 0
local spOMbossRandomizer = 0
local spOMbosschance = 0
local player = Game.GetLocalPlayer();
math.randomseed(Time.Now())
spOMbossRandomizer = math.random(1,10000)

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
		local OmegaNemesisDBRs = { 'records/omega/creatures/om_spawnerpet_aetherial.dbr','records/omega/creatures/om_spawnerpet_chthonian.dbr','records/omega/creatures/om_spawnerpet_kymon.dbr','records/omega/creatures/om_spawnerpet_order.dbr','records/omega/creatures/om_spawnerpet_outlaw.dbr','records/omega/creatures/om_spawnerpet_undead.dbr' }
		local totalOmegaNemesis = table.getn(OmegaNemesisDBRs)
		--math.randomseed(Time.Now())
		spOMpetRandomizer = math.random(1,totalOmegaNemesis)
		omega.scripts.summonatfeet(OmegaNemesisDBRs[spOMpetRandomizer]);

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

-----Give a low chance to summon the corresponding Omega boss when opening Nemesis chest in Ultimate Difficulty.
function omega.scripts.onopenchestnemesis(objectID)
	local player = Game.GetLocalPlayer()
	if player:HasToken('OMEGA_START_QUEST') and Game.GetGameDifficulty() >= Game.Difficulty.Legendary then
		local spOMbosschance = 0
		math.randomseed(Time.Now())
		spOMbosschance = math.random(1,100)
			if spOMbosschance > 96 then
					omega.scripts.summonatfeet(objectID)
				else
					if player:HasToken('OMEGA_BUFF_SPAWN') then
						omega.scripts.summonatfeet(objectID)
						player:RemoveToken('OMEGA_BUFF_SPAWN')
					end
			end
	end
end

function omega.scripts.onopenchestaetherial()
	omega.scripts.onopenchestnemesis('records/omega/creatures/om_spawnerpet_aetherial.dbr');
end
function omega.scripts.onopenchestchthonian()
	omega.scripts.onopenchestnemesis('records/omega/creatures/om_spawnerpet_chthonian.dbr');
end
function omega.scripts.onopenchestkymon()
	omega.scripts.onopenchestnemesis('records/omega/creatures/om_spawnerpet_kymon.dbr');
end
function omega.scripts.onopenchestorder()
	omega.scripts.onopenchestnemesis('records/omega/creatures/om_spawnerpet_order.dbr');
end
function omega.scripts.onopenchestoutlaw()
	omega.scripts.onopenchestnemesis('records/omega/creatures/om_spawnerpet_outlaw.dbr');
end
function omega.scripts.onopenchestundead()
	omega.scripts.onopenchestnemesis('records/omega/creatures/om_spawnerpet_undead.dbr');
end