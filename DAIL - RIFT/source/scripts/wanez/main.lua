--[[

Wanez - MOD




@author: WareBare
@version: 0.0.1

Updated: 06/14/2016

]]--

wanez = {}

--Script.Load("scripts/wanez/old/settings.lua")
--Script.Load("scripts/wanez/old/pools.lua")
--Script.Load("scripts/wanez/old/dga.lua")

--Script.Load("scripts/wanez/cData.lua");

Script.Load("scripts/wanez/data.lua");
Script.Load("scripts/wanez/_Settings.lua");
Script.Load("scripts/wanez/_Data.lua");
Script.Load("scripts/wanez/package_dga.lua");

--Script.Load("scripts/wanez/init.lua")
-- Wanez RNG with chances
function wanez.RNG(optRange,argChance)
    
    optRange[1] = optRange[1] || 1
    optRange[2] = optRange[2] || 100
    local rand = math.random(optRange[1],optRange[2])
    if(argChance != nil)then
        if(tonumber(argChance))then
            rand = (rand <= argChance) && true || false
        elseif(type(argChance) == "table")then
            local totalChances = table.getn(argChance)
            local curChance = 0
            local retRand = 0
            for i=1,totalChances do
                curChance = curChance + argChance[i]
                if(rand <= curChance)then
                    if(retRand == 0)then retRand = i;end;
                    --i = totalChances + 1
                end
            end
            rand = retRand
        end
    end;
    
    return rand
end