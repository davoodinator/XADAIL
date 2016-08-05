--[[
Gambling
]]--
local dgaVar = wanez.dga.localVar
--local createdDevStuff = false
local isCaravan = true
local function isCaravanCheck()
    --if(isCaravan)then UI.Notify("tagWaPlayerIsNearCaravan");end;
    return isCaravan;
end
function wanez.dga.onDieBountyMonster_DGA_PM_000(argObjectId)

	local player = Game.GetLocalPlayer()
	math.randomseed(Time.Now())
    
    --player:GiveItem("mod_wanez/items/token/upgrade_token_beginner.dbr",1,false)
    
	local moneyValue = random(1,2000)
	player:AdjustMoney(moneyValue)
	--UI.Notify("You just gambled: "..moneyValue.." Iron Bits")
end
function wanez.dga.spawnBountyReward_DGA_PM_001(argObjectId)
    if not(isCaravanCheck())then
        local monsterDBR = 'mod_wanez/items/dga/rewards/bounty_usable_monster.dbr'
        local monsterCount = wanez.RNG({10,20})
        local _player = Game.GetLocalPlayer()
        local playerCoords = _player:GetCoords()
        for i=1,monsterCount do
            Entity.Create(monsterDBR):SetCoords(playerCoords)
        end;
        --_player:GiveItem("mod_wanez/items/dga/rewards/bounty_usable.dbr",1,false)
        --Proxy.Create('mod_wanez/items/dga/rewards/bounty_usable_proxy.dbr'):SetCoords(playerCoords)
    end
end
--
function wanez.dga.onDropMoney(argObjectId)
    local player = Game.GetLocalPlayer()
    local scale = {{1,5},{6,10},{11,15}};
    local playerLevel = player:GetLevel();
    local mathMoneyValue = wanez.RNG({scale[wanez.DifficultyID][1],scale[wanez.DifficultyID][2]}) * (wanez.dga.Settings:getTier() + 1) * playerLevel / 10
    player:AdjustMoney(mathMoneyValue);
    Entity.Get(argObjectId):Destroy();
end
--
local scrollItem = false
--
function wanez.dga.onLoadScrollPortal(argObjectId)
    if(scrollItem == false)then
        scrollItem = Entity.Get(argObjectId)
    end
end
--
local prevCoords = false
--local _player = false
function wanez.dga.onUseScrollPortalHideout(argObjectId)
    if not(isCaravanCheck())then
        local player = Game.GetLocalPlayer()
        --if(_player == false)then _player = Game.GetLocalPlayer();end;
        local scrollDBR = "mod_wanez/items/dga/scroll_portal_hideout.dbr"
        if(player:HasItem(scrollDBR,2,true) == false and player:HasToken("DGA_SCROLL_PORTAL_HIDEOUT_BLOCK") == false)then
            player:GiveItem(scrollDBR,1,true)
        else
            player:RemoveToken("DGA_SCROLL_PORTAL_HIDEOUT_BLOCK")
        end
        if(wanez.dga.Settings:getAreaID() > 0 and wanez.dga.Settings:getSpawnTrigger() == false and wanez.dga.Data.Rewards:getKillCount() > 10) then
            wanez.dga.RiftHO:actionPortal()
        else
            --player:Turn(_player:GetCoords().zAxis.z)
            UI.Notify("tagWaCannotUsePortalScrollHidoutInHideout")
        end
    end
end
--
function wanez.dga.portalToHideoutOnInteract(argObjectId)
    wanez.dga.RiftHO:actionPortal('lock')
end

-- Caravan Fix Item onDestroy issue
local _caravanTrigger = false
function wanez.dga.nearCaravanOnEnter(argObjectId)
    --UI.Notify("test")
    isCaravan = true
end
function wanez.dga.nearCaravanOnLeave(argObjectId)
    isCaravan = false
end
local _onLoadTrigger = false
function wanez.dga.createCaravanTrigger(argObjectId)
    if(_caravanTrigger ~= false)then _caravanTrigger:Destroy();end;
    _caravanTrigger = Entity.Create("mod_wanez/proxies/map/misc/trigger_caravan.dbr")
    _caravanTrigger:SetCoords(Character.Get(argObjectId):GetCoords())
    --isCaravan = false
    if not(_onLoadTrigger)then _onLoadTrigger = Entity.Create("mod_wanez/proxies/map/misc/trigger_playeronload.dbr"):SetCoords(Game.GetLocalPlayer():GetCoords());end;
end

function wanez.dga.onUseScrollPortalDGA_01(argObjectId)
    -- setSettings
    --wanez.dga.Settings:prepPortal(wanez.dga.Settings:getTier(),wanez.dga.Settings:getModeID(),true)
    --math.randomseed(Time.Now())
    -- openPortal
    --portalCharges = Game.GetNumPlayers()
    --local data = wanez.dga.Settings:onOpenPortal(0,wanez.dga.Settings:getSpecialID(),wanez.dga.Settings:getIsUber(),true)
    if not(dgaBlockScrollPortalSpawnDGA)then
        if(wanez.dga.Data.Rewards:getSpecialCredit() > 0 or wanez.dga.Areas[dgaAreaType]:getAreaTypeID() == 2)then
            local areaId = wanez.dga.Areas[dgaAreaType]:getAreaTypeID() == 2 and wanez.dga.Settings:getAreaID() or 0
            local data = wanez.dga.Settings:onOpenPortalNextArea(areaId)
            wanez.dga.Data.Portals[data[1]][data[2]]:actionPortal()
        end
    end
    --wanez.dga.Areas[dgaAreaType]:removeEntities();
end


