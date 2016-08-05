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

Script.Load(wanez.filePath.DGA.."_Data.lua");
Script.Load(wanez.filePath.DGA.."_Settings.lua");
Script.Load("scripts/Omega_Mod/dga.lua");

wanez.dga.Data = {};
wanez.dga.Token = {};
wanez.dga.Data.Portals = {};
wanez.dga.Data.Entities = {};
wanez.dga.Data.Rewards = {};
wanez.dga.Rifts = {};
wanez.dga.DynRifts = {}; -- rifts opened by a scroll
wanez.dga.RiftHO = false
Script.Load(wanez.filePath.DGA.."cMain.lua");
Script.Load(wanez.filePath.DGA.."cPortal.lua");
Script.Load(wanez.filePath.DGA.."cReward.lua");
Script.Load(wanez.filePath.DGA.."cArea.lua");
Script.Load(wanez.filePath.DGA.."cRift.lua");
Script.Load(wanez.filePath.DGA.."cEntity.lua");
Script.Load(wanez.filePath.DGA.."cLoot.lua");
Script.Load(wanez.filePath.DGA.."cGamble.lua");
Script.Load(wanez.filePath.DGA.."cSettings.lua");
--wanez.dga.Settings = {};
Script.Load(wanez.filePath.DGA.."fnHideout.lua");
Script.Load(wanez.filePath.DGA.."fnArea.lua");
Script.Load(wanez.filePath.DGA.."fnAffixDGA.lua");
Script.Load(wanez.filePath.DGA.."fnBounties.lua");
Script.Load(wanez.filePath.DGA.."fnEntity.lua");
Script.Load(wanez.filePath.DGA.."fnProxies.lua");
Script.Load(wanez.filePath.DGA.."fnMisc.lua");
Script.Load(wanez.filePath.DGA.."fnQuest.lua");
Script.Load(wanez.filePath.DGA.."fnNPC.lua");
--Script.Load("scripts/wanez/dga/dbrSouls.lua");

--[[
Data.Portals.AreaID.PortalID [cPortal]
Data.Areas.AreaID.LayoutID.FloorID.RegionID.ProxyID [cProxy]
(cArea)
]]--