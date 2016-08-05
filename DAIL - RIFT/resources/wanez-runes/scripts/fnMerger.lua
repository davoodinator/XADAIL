--[[
Conversation/Merge functions

Created by IntelliJ IDEA.
User: WareBare
Date: 7/28/2016
Time: 4:35 AM

Package: wanez.runes
]]--

function wanez.runes.giveItems()
    local dbr = 'records/items/geartorso/a09_torso004.dbr'
    Game.GetLocalPlayer():GiveItem(dbr,1,true)
end
