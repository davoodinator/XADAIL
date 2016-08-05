--[[
Created by IntelliJ IDEA.
User: WareBare
Date: 7/31/2016
Time: 10:41 AM

Package: 
]]--
wanez.dga.localVar.dgaAffixes = {}
local dgaVar = wanez.dga.localVar

wanez.dga.affixdga = {}

function wanez.dga.affixdga.getCurrentAffixCount()
    --local curAffixCount = table.getn(dgaVar.dgaAffixes)
    return table.getn(dgaVar.dgaAffixes)
end

local function checkAffixID(argAffixID)
    local curAffixCount = wanez.dga.affixdga.getCurrentAffixCount()
    local hasAffix = false
    if(curAffixCount > 0)then
        for i=1,curAffixCount do
            if(dgaVar.dgaAffixes[i] == argAffixID)then hasAffix = true;end;
        end;
    end
    return hasAffix;
end

function wanez.dga.affixdga.genRandomAffix()
    local _player = Game.GetLocalPlayer()
    local dataAffixCount = table.getn(wanez.dga._Data.DGA_Affixes)
    local curAffixCount = wanez.dga.affixdga.getCurrentAffixCount() + 1

    local totalAffixRatio = 0
    local aAffixRatio = {}
    for i=1,dataAffixCount do
        table.insert(aAffixRatio,wanez.dga._Data.DGA_Affixes[i][1])
        totalAffixRatio = totalAffixRatio + wanez.dga._Data.DGA_Affixes[i][1]
    end;

    local newAffixID = 0
    while (newAffixID == 0) do
        local tempAffixID = wanez.RNG({1,totalAffixRatio},aAffixRatio)
        if not(checkAffixID(tempAffixID))then newAffixID = tempAffixID;end;
    end;
    table.insert(wanez.dga.localVar.dgaAffixes,newAffixID);

    local aAffixCost = {10,20}
    _player:TakeItem('mod_wanez/items/dga/upgrade_token_01.dbr',aAffixCost[curAffixCount],true)

    UI.Notify('tagWaNewAffixDGA')
    -- wanez.dga.localVar
end



function wanez.dga.affixdga.resetAffixes()
    wanez.dga.localVar.dgaAffixes = {}
end

function wanez.dga.affixdga.getAffixData(argAffixID)
    local aData = false
    if(checkAffixID(argAffixID))then
        aData = wanez.dga._Data.DGA_Affixes[argAffixID][2]
    end

    return aData;
end

function wanez.dga.affixdga.hasAffix_001() return checkAffixID(1);end;
function wanez.dga.affixdga.hasAffix_002() return checkAffixID(2);end;
function wanez.dga.affixdga.hasAffix_003() return checkAffixID(3);end;
function wanez.dga.affixdga.hasAffix_004() return checkAffixID(4);end;
function wanez.dga.affixdga.hasAffix_005() return checkAffixID(5);end;