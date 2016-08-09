--[[

Wanez - MOD

@author: WareBare (warebare89@gmail.com)
@version: 0.1.0

Updated: 07/30/2016

]]

wanez = {}
wanez.isDev = false
--Script.Load("scripts/wanez/old/settings.lua")
--Script.Load("scripts/wanez/old/pools.lua")
--Script.Load("scripts/wanez/old/dga.lua")

--Script.Load("scripts/wanez/cData.lua");

Script.Load("wanez/scripts/data.lua");
Script.Load("wanez/scripts/_Settings.lua");
Script.Load("wanez/scripts/_Data.lua");
Script.Load("wanez-runes/scripts/_Package.lua");
Script.Load("wanez-dga/scripts/_Package.lua");

--Script.Load("scripts/wanez/init.lua")
-- Wanez RNG with chances
function wanez.RNG(optRange,argChance)
    
    optRange[1] = optRange[1] or 1
    optRange[2] = optRange[2] or 100
    local rand = math.random(optRange[1],optRange[2])
    if(argChance ~= nil)then
        if(tonumber(argChance))then
            rand = (rand <= argChance) and true or false
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
-- argFaction: String Faction
function wanez.getFactionRank(argFaction)
    local factionRating = Game.GetLocalPlayer():GetFaction(argFaction)
    local FactionRank = 0
    if(factionRating >= 25000)then FactionRank = 4
    elseif(factionRating <= -20000 or factionRating >= 10000)then FactionRank = 3
    elseif(factionRating <= -8000 or factionRating >= 5000)then FactionRank = 2
    elseif(factionRating <= -1500 or factionRating >= 1500)then FactionRank = 1 end

    return FactionRank;
end
