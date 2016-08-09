--[[
Created by IntelliJ IDEA.
User: WareBare
Date: 7/21/2016
Time: 12:41 AM

Package: Wanez.DGA

DGA implementation script for
OMEGA MOD by okami29 - http://www.grimdawn.com/forums/showthread.php?p=387218
]]--

wanez.omega = {}

local aTokenLevel = {'OMEGA_LEVEL_1','OMEGA_LEVEL_2','OMEGA_LEVEL_3','OMEGA_LEVEL_4','OMEGA_LEVEL_5','OMEGA_LEVEL_6','OMEGA_LEVEL_7','OMEGA_LEVEL_8','OMEGA_LEVEL_9','OMEGA_LEVEL_10','OMEGA_LEVEL_11','OMEGA_LEVEL_12','OMEGA_LEVEL_13','OMEGA_LEVEL_14','OMEGA_LEVEL_15','OMEGA_LEVEL_16','OMEGA_LEVEL_17','OMEGA_LEVEL_18','OMEGA_LEVEL_19','OMEGA_LEVEL_20','OMEGA_LEVEL_21','OMEGA_LEVEL_22','OMEGA_LEVEL_23','OMEGA_LEVEL_24','OMEGA_LEVEL_25','OMEGA_LEVEL_26','OMEGA_LEVEL_27','OMEGA_LEVEL_28','OMEGA_LEVEL_29','OMEGA_LEVEL_30','OMEGA_LEVEL_31','OMEGA_LEVEL_32','OMEGA_LEVEL_33','OMEGA_LEVEL_34','OMEGA_LEVEL_35','OMEGA_LEVEL_36','OMEGA_LEVEL_37','OMEGA_LEVEL_38','OMEGA_LEVEL_39','OMEGA_LEVEL_40','OMEGA_LEVEL_41','OMEGA_LEVEL_42','OMEGA_LEVEL_43','OMEGA_LEVEL_44','OMEGA_LEVEL_45','OMEGA_LEVEL_46','OMEGA_LEVEL_47','OMEGA_LEVEL_48','OMEGA_LEVEL_49','OMEGA_LEVEL_50','OMEGA_LEVEL_51','OMEGA_LEVEL_52','OMEGA_LEVEL_53','OMEGA_LEVEL_54','OMEGA_LEVEL_55','OMEGA_LEVEL_56','OMEGA_LEVEL_57','OMEGA_LEVEL_58','OMEGA_LEVEL_59','OMEGA_LEVEL_60','OMEGA_LEVEL_61','OMEGA_LEVEL_62','OMEGA_LEVEL_63','OMEGA_LEVEL_64','OMEGA_LEVEL_65','OMEGA_LEVEL_66','OMEGA_LEVEL_67','OMEGA_LEVEL_68','OMEGA_LEVEL_69','OMEGA_LEVEL_70','OMEGA_LEVEL_71','OMEGA_LEVEL_72','OMEGA_LEVEL_73','OMEGA_LEVEL_74','OMEGA_LEVEL_75','OMEGA_LEVEL_76','OMEGA_LEVEL_77','OMEGA_LEVEL_78','OMEGA_LEVEL_79','OMEGA_LEVEL_80','OMEGA_LEVEL_81','OMEGA_LEVEL_82','OMEGA_LEVEL_83','OMEGA_LEVEL_84','OMEGA_LEVEL_85','OMEGA_LEVEL_86','OMEGA_LEVEL_87','OMEGA_LEVEL_88','OMEGA_LEVEL_89','OMEGA_LEVEL_90','OMEGA_LEVEL_91','OMEGA_LEVEL_92','OMEGA_LEVEL_93','OMEGA_LEVEL_94','OMEGA_LEVEL_95','OMEGA_LEVEL_96','OMEGA_LEVEL_97','OMEGA_LEVEL_98','OMEGA_LEVEL_99','OMEGA_LEVEL_100'}

local aItemsDBR = {
    {'records/omega/items/questitems/omega_soul_heroes.dbr',180,360},
    {'records/omega/items/questitems/omega_essence_legendary.dbr',28,56},
    {'mod_wanez/items/token/souls/soul_nemesis.dbr',50,100},
    {'mod_wanez/items/token/souls/soul_boss.dbr',50,100},
    {'mod_wanez/items/token/souls/soul_raid.dbr',10,20},
    {'mod_wanez/items/token/souls/soul_uber.dbr',1,5}
}
local function omegaRemoveSouls(argIsEater)
    local CountID = argIsEater and 2 or 3
    local _player = Game.GetLocalPlayer()

    for i=1,table.getn(aItemsDBR) do
        _player:TakeItem(aItemsDBR[i][1],aItemsDBR[i][CountID],true)
    end;
    --UI.Notify('Souls Removed')
end
local function omegaCheckSoulReq(argIsEater)
    local CountID = argIsEater and 2 or 3

    local _player = Game.GetLocalPlayer()
    local hasReq = true

    for i=1,table.getn(aItemsDBR) do
        if not(_player:HasItem(aItemsDBR[i][1],aItemsDBR[i][CountID],true))then
            hasReq = false
        end
    end

    return hasReq;
end
function wanez.omega.tempGiveSouls()
    local _player = Game.GetLocalPlayer()
    for i=1,table.getn(aItemsDBR) do
        _player:GiveItem(aItemsDBR[i][1],aItemsDBR[i][3],false)
    end;
    --UI.Notify('Souls Given!')
end
function wanez.omega.checkSoulReq01() return omegaCheckSoulReq(true);end; -- isSoulEater
function wanez.omega.checkSoulReq02() return omegaCheckSoulReq(false);end; -- isNotSoulEater
function wanez.omega.removeSouls(argIsEater) argIsEater = argIsEater or false;omegaRemoveSouls(argIsEater);end;
--function wanez.omega.checkSoulReq01() omegaRemoveSouls(true);end;
-- @return void
function wanez.omega.setLevel(argIsEater)
    argIsEater = argIsEater or false
    local isLevel = 0
    local _player = Game.GetLocalPlayer()

    for i=1,table.getn(aTokenLevel) do
        if(_player:HasToken(aTokenLevel[i]))then
            isLevel = i
        end
    end;

    -- check requirements and remove if true and also take care of token
    if(omegaCheckSoulReq(argIsEater))then
        omegaRemoveSouls(argIsEater)
        _player:GiveItem('records/omega/items/questitems/omega_orb.dbr',1,true)

        if(isLevel < 100)then
            _player:GiveToken('OMEGA_START_QUEST')
            _player:GiveToken(aTokenLevel[isLevel + 1])
            _player:RemoveToken(aTokenLevel[isLevel])
            _player:GiveItem('records/omega/items/crafting/blueprints/other/omega_craft_proof_'..(isLevel + 1)..'.dbr',1,true)
        end


        UI.Notify('tagOM_onCompleteQuest')
    end

end
function wanez.omega.randOmegaItem()
    local _player = Game.GetLocalPlayer()
    _player:GiveItem('records/omega/items/loottables/mastertables/om_loot_quest10.dbr',1,true)
end