--[[
Wanez.DGA - MOD

- Area: The entire Area, including chosen Layout, all Floors and Regions - Canyon or Dungeon is an area
- Layout: alternate Layout, to give a feel of randomized areas
- Floor: multilevel dungeons or multiple parts of an Area requires an interaction with a portal or door(glow)
- Region: multiple parts without interacting with a portal or door(glow) - large areas will have multiple regions

Thanks to PrincessLuna for providing a solution to de-spawn monsters

@author WareBare
@version v0.3.1 [BETA] (06/14/2016)
]]--

wanez.dga = {};
wanez.dga.var = {}
wanez.dga.localVar = {}
-- dgaVar is a pseudo global var - stores all data required for several fn in different files (loads a global var into a local var for easy access)
local dgaVar = wanez.dga.localVar
dgaAreaType = "Default"
wanez.dga.var.BlockProxyCleanUp = false
dgaSpecialCredit = 0

Script.Load("wanez-dga/scripts/_Data.lua");
Script.Load("wanez-dga/scripts/_Settings.lua");
Script.Load("scripts/Omega_Mod/dga.lua");

wanez.dga.Data = {};
wanez.dga.Token = {};
wanez.dga.Data.Portals = {};
wanez.dga.Data.Entities = {};
wanez.dga.Data.Rewards = {};
wanez.dga.Rifts = {};
wanez.dga.DynRifts = {}; -- rifts opened by a scroll
wanez.dga.RiftHO = false
Script.Load("wanez-dga/scripts/cMain.lua");
Script.Load("wanez-dga/scripts/cPortal.lua");
Script.Load("wanez-dga/scripts/cReward.lua");
Script.Load("wanez-dga/scripts/cArea.lua");
Script.Load("wanez-dga/scripts/cRift.lua");
Script.Load("wanez-dga/scripts/cEntity.lua");
Script.Load("wanez-dga/scripts/cLoot.lua");
Script.Load("wanez-dga/scripts/cGamble.lua");
Script.Load("wanez-dga/scripts/cSettings.lua");
--wanez.dga.Settings = {};
Script.Load("wanez-dga/scripts/fnHideout.lua");
Script.Load("wanez-dga/scripts/fnArea.lua");
Script.Load("wanez-dga/scripts/fnAffixDGA.lua");
Script.Load("wanez-dga/scripts/fnBounties.lua");
Script.Load("wanez-dga/scripts/fnEntity.lua");
Script.Load("wanez-dga/scripts/fnProxies.lua");
Script.Load("wanez-dga/scripts/fnMisc.lua");
Script.Load("wanez-dga/scripts/fnQuest.lua");
Script.Load("wanez-dga/scripts/fnNPC.lua");
--Script.Load("scripts/wanez/dga/dbrSouls.lua");

--[[
Data.Portals.AreaID.PortalID [cPortal]
Data.Areas.AreaID.LayoutID.FloorID.RegionID.ProxyID [cProxy]
(cArea)
]]--