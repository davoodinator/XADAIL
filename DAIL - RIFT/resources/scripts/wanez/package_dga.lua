--[[
Wanez.DGA - MOD

- Area: The entire Area, including chosen Layout, all Floors and Regions - Canyon or Dungeon is an area
- Layout: alternate Layout, to give a feel of randomized areas
- Floor: multilevel dungeons or multiple parts of an Area requires an interaction with a portal or door(glow)
- Region: multiple parts without interacting with a portal or door(glow) - large areas will have multiple regions

Thanks to PrincessLuna for providing a solution to despawn monsters

@author WareBare
@version v0.3.1 [BETA] (06/14/2016)
]]--

wanez.dga = {};
wanez.dga.var = {}
dgaAreaType = "Default"
wanez.dga.var.BlockProxyCleanUp = false
dgaSpecialCredit = 0

Script.Load("scripts/wanez/dga/_data.lua");
Script.Load("scripts/wanez/dga/_settings.lua");
Script.Load("scripts/Omega_Mod/dga.lua");

wanez.dga.Data = {};
wanez.dga.Token = {};
wanez.dga.Data.Portals = {};
wanez.dga.Data.Entities = {};
wanez.dga.Data.Rewards = {};
wanez.dga.Rifts = {};
wanez.dga.DynRifts = {}; -- rifts opened by a scroll
wanez.dga.RiftHO = false
Script.Load("scripts/wanez/dga/cMain.lua");
Script.Load("scripts/wanez/dga/cPortal.lua");
Script.Load("scripts/wanez/dga/cReward.lua");
Script.Load("scripts/wanez/dga/cArea.lua");
Script.Load("scripts/wanez/dga/cRift.lua");
Script.Load("scripts/wanez/dga/cEntity.lua");
Script.Load("scripts/wanez/dga/cLoot.lua");
Script.Load("scripts/wanez/dga/cGamble.lua");
Script.Load("scripts/wanez/dga/cSettings.lua");
--wanez.dga.Settings = {};
Script.Load("scripts/wanez/dga/dbrHideout.lua");
Script.Load("scripts/wanez/dga/dbrArea.lua");
Script.Load("scripts/wanez/dga/dbrEntity.lua");
Script.Load("scripts/wanez/dga/dbrMisc.lua");
Script.Load("scripts/wanez/dga/dbrQuest.lua");
Script.Load("scripts/wanez/dga/dbrNPC.lua");
--Script.Load("scripts/wanez/dga/dbrSouls.lua");

--[[
Data.Portals.AreaID.PortalID [cPortal]
Data.Areas.AreaID.LayoutID.FloorID.RegionID.ProxyID [cProxy]
(cArea)
]]--