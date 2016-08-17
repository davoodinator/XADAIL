
gd.pal = {}

local amount = 1

local path0 = "records/items/materia/compa_aethercrystal.dbr"
local path1 = "records/items/materia/compa_aethersoul.dbr"
local path2 = "records/items/materia/compa_aethersteelalloy.dbr"
local path3 = "records/items/materia/compa_aethersteelbolts.dbr"
local path4 = "records/items/materia/compa_amber.dbr"
local path5 = "records/items/materia/compa_ballisticplating.dbr"
local path6 = "records/items/materia/compa_batteredshell.dbr"
local path7 = "records/items/materia/compa_blacktallow.dbr"
local path8 = "records/items/materia/compa_blessedsteel.dbr"
local path9 = "records/items/materia/compa_bristlyfur.dbr"
local path10 = "records/items/materia/compa_chilledsteel.dbr"
local path11 = "records/items/materia/compa_chippedclaw.dbr"
local path12 = "records/items/materia/compa_coldstone.dbr"
local path13 = "records/items/materia/compa_consecratedwrappings.dbr"
local path14 = "records/items/materia/compa_corpsedust.dbr"
local path15 = "records/items/materia/compa_crackedlodestone.dbr"
local path16 = "records/items/materia/compa_deathchillbolts.dbr"
local path17 = "records/items/materia/compa_densefur.dbr"
local path18 = "records/items/materia/compa_ectoplasm.dbr"
local path19 = "records/items/materia/compa_festeringblood.dbr"
local path20 = "records/items/materia/compa_flint.dbr"
local path21 = "records/items/materia/compa_flintcorebolts.dbr"
local path22 = "records/items/materia/compa_focusingprism.dbr"
local path23 = "records/items/materia/compa_frozenheart.dbr"
local path24 = "records/items/materia/compa_gallstone.dbr"
local path25 = "records/items/materia/compa_hellbaneammo.dbr"
local path26 = "records/items/materia/compa_hollowedfang.dbr"
local path27 = "records/items/materia/compa_imbuedsilver.dbr"
local path28 = "records/items/materia/compa_leatheryhide.dbr"
local path29 = "records/items/materia/compa_markofillusions.dbr"
local path30 = "records/items/materia/compa_markofthetraveler.dbr"
local path31 = "records/items/materia/compa_moltenskin.dbr"
local path32 = "records/items/materia/compa_mutagenicichor.dbr"
local path33 = "records/items/materia/compa_mutatedscales.dbr"
local path34 = "records/items/materia/compa_polishedemerald.dbr"
local path35 = "records/items/materia/compa_purifiedsalt.dbr"
local path36 = "records/items/materia/compa_radiantgem.dbr"
local path37 = "records/items/materia/compa_reinforcedshell.dbr"
local path38 = "records/items/materia/compa_resilientchestplate.dbr"
local path39 = "records/items/materia/compa_restlessremains.dbr"
local path40 = "records/items/materia/compa_riftstone.dbr"
local path41 = "records/items/materia/compa_rigidshell.dbr"
local path42 = "records/items/materia/compa_rottenheart.dbr"
local path43 = "records/items/materia/compa_runestone.dbr"
local path44 = "records/items/materia/compa_sanctifiedbone.dbr"
local path45 = "records/items/materia/compa_scalyhide.dbr"
local path46 = "records/items/materia/compa_scavengedplating.dbr"
local path47 = "records/items/materia/compa_searingember.dbr"
local path48 = "records/items/materia/compa_serratedspike.dbr"
local path49 = "records/items/materia/compa_severedclaw.dbr"
local path50 = "records/items/materia/compa_silkswatch.dbr"
local path51 = "records/items/materia/compa_soulshard.dbr"
local path52 = "records/items/materia/compa_spinedcarapace.dbr"
local path53 = "records/items/materia/compa_vengefulwraith.dbr"
local path54 = "records/items/materia/compa_venomtippedammo.dbr"
local path55 = "records/items/materia/compa_viciousjawbone.dbr"
local path56 = "records/items/materia/compa_viciousspikes.dbr"
local path57 = "records/items/materia/compa_viscousvenom.dbr"
local path58 = "records/items/materia/compa_voidtouchedammo.dbr"
local path59 = "records/items/materia/compa_wardstone.dbr"
local path60 = "records/items/materia/compa_whetstone.dbr"
local path61 = "records/items/materia/compa_wrathstone.dbr"
local path62 = "records/items/materia/compb_ancientarmorplate.dbr"
local path63 = "records/items/materia/compb_arcanediamond.dbr"
local path64 = "records/items/materia/compb_arcanelens.dbr"
local path65 = "records/items/materia/compb_arcanespark.dbr"
local path66 = "records/items/materia/compb_beronath.dbr"
local path67 = "records/items/materia/compb_bindingsofbysmiel.dbr"
local path68 = "records/items/materia/compb_bloodywhetstone.dbr"
local path69 = "records/items/materia/compb_chainsofoleron.dbr"
local path70 = "records/items/materia/compb_deviltouchedammo.dbr"
local path71 = "records/items/materia/compb_dreadskull.dbr"
local path72 = "records/items/materia/compb_hallowedground.dbr"
local path73 = "records/items/materia/compb_hauntedsteel.dbr"
local path74 = "records/items/materia/compb_kilriansoul.dbr"
local path75 = "records/items/materia/compb_lodestone.dbr"
local path76 = "records/items/materia/compb_markofdreeg.dbr"
local path77 = "records/items/materia/compb_markofmogdrogen.dbr"
local path78 = "records/items/materia/compb_markofthemyrmidon.dbr"
local path79 = "records/items/materia/compb_oleronblood.dbr"
local path80 = "records/items/materia/compb_silvercorebolts.dbr"
local path81 = "records/items/materia/compb_spellwoventhreads.dbr"
local path82 = "records/items/materia/compb_symbolofsolael.dbr"
local path83 = "records/items/materia/compb_unholyinscription.dbr"
local path84 = "records/items/crafting/materials/craft_aethercrystalcluster.dbr"
local path85 = "records/items/crafting/materials/craft_aethershard.dbr"
local path86 = "records/items/crafting/materials/craft_ancientheart.dbr"
local path87 = "records/items/crafting/materials/craft_bloodchthon.dbr"
local path88 = "records/items/crafting/materials/craft_cultistseal.dbr"
local path89 = "records/items/crafting/materials/craft_manticore.dbr"
local path90 = "records/items/crafting/materials/craft_royaljelly.dbr"
local path91 = "records/items/crafting/materials/craft_skeletonkey.dbr"
local path92 = "records/items/crafting/materials/craft_taintedbrain.dbr"
local path93 = "records/items/questitems/quest_dynamite.dbr"
local path94 = "records/items/questitems/scrapmetal.dbr"
local path95 = "records/items/custom/comp/comp_voidstone.dbr"
local path96 = "records/items/custom/comp/comp_iceshard.dbr"
local path97 = "records/items/custom/comp/comp_prismatic.dbr"
local path98 = "records/items/custom/comp/comp_crystal.dbr"

local ench01 = "records/items/enchants/enchant_frost01.dbr"
local ench02 = "records/items/enchants/enchant_fire01.dbr"
local ench03 = "records/items/enchants/enchant_shock01.dbr"
local ench04 = "records/items/enchants/enchant_elements01.dbr"
local ench05 = "records/items/enchants/enchant_chaos01.dbr"
local ench06 = "records/items/enchants/enchant_might01.dbr"
local ench07 = "records/items/enchants/enchant_pierce01.dbr"
local ench08 = "records/items/enchants/enchant_blood01.dbr"
local ench09 = "records/items/enchants/enchant_aether01.dbr"
local ench10 = "records/items/enchants/enchant_health01.dbr"
local ench11 = "records/items/enchants/enchant_mana01.dbr"
local ench12 = "records/items/enchants/enchant_poison01.dbr"
local ench13 = "records/items/enchants/enchant_pets01.dbr"

--Functions

function gd.pal.compa_aethercrystal()
		local Player = Game.GetLocalPlayer()
		Player:GiveItem(path0, amount, false)
end

function gd.pal.compa_aethersoul()
		local Player = Game.GetLocalPlayer()
		Player:GiveItem(path1, amount, false)
end

function gd.pal.compa_aethersteelalloy()
		local Player = Game.GetLocalPlayer()
		Player:GiveItem(path2, amount, false)
end

function gd.pal.compa_aethersteelbolts()
		local Player = Game.GetLocalPlayer()
		Player:GiveItem(path3, amount, false)
end

function gd.pal.compa_amber()
		local Player = Game.GetLocalPlayer()
		Player:GiveItem(path4, amount, false)
end

function gd.pal.compa_ballisticplating()
		local Player = Game.GetLocalPlayer()
		Player:GiveItem(path5, amount, false)
end

function gd.pal.compa_batteredshell()
		local Player = Game.GetLocalPlayer()
		Player:GiveItem(path6, amount, false)
end

function gd.pal.compa_blacktallow()
		local Player = Game.GetLocalPlayer()
		Player:GiveItem(path7, amount, false)
end

function gd.pal.compa_blessedsteel()
		local Player = Game.GetLocalPlayer()
		Player:GiveItem(path8, amount, false)
end

function gd.pal.compa_bristlyfur()
		local Player = Game.GetLocalPlayer()
		Player:GiveItem(path9, amount, false)
end

function gd.pal.compa_chilledsteel()
		local Player = Game.GetLocalPlayer()
		Player:GiveItem(path10, amount, false)
end

function gd.pal.compa_chippedclaw()
		local Player = Game.GetLocalPlayer()
		Player:GiveItem(path11, amount, false)
end

function gd.pal.compa_coldstone()
		local Player = Game.GetLocalPlayer()
		Player:GiveItem(path12, amount, false)
end

function gd.pal.compa_consecratedwrappings()
		local Player = Game.GetLocalPlayer()
		Player:GiveItem(path13, amount, false)
end

function gd.pal.compa_corpsedust()
		local Player = Game.GetLocalPlayer()
		Player:GiveItem(path14, amount, false)
end

function gd.pal.compa_crackedlodestone()
		local Player = Game.GetLocalPlayer()
		Player:GiveItem(path15, amount, false)
end

function gd.pal.compa_deathchillbolts()
		local Player = Game.GetLocalPlayer()
		Player:GiveItem(path16, amount, false)
end

function gd.pal.compa_densefur()
		local Player = Game.GetLocalPlayer()
		Player:GiveItem(path17, amount, false)
end

function gd.pal.compa_ectoplasm()
		local Player = Game.GetLocalPlayer()
		Player:GiveItem(path18, amount, false)
end

function gd.pal.compa_festeringblood()
		local Player = Game.GetLocalPlayer()
		Player:GiveItem(path19, amount, false)
end

function gd.pal.compa_flint()
		local Player = Game.GetLocalPlayer()
		Player:GiveItem(path20, amount, false)
end

function gd.pal.compa_flintcorebolts()
		local Player = Game.GetLocalPlayer()
		Player:GiveItem(path21, amount, false)
end

function gd.pal.compa_focusingprism()
		local Player = Game.GetLocalPlayer()
		Player:GiveItem(path22, amount, false)
end

function gd.pal.compa_frozenheart()
		local Player = Game.GetLocalPlayer()
		Player:GiveItem(path23, amount, false)
end

function gd.pal.compa_gallstone()
		local Player = Game.GetLocalPlayer()
		Player:GiveItem(path24, amount, false)
end

function gd.pal.compa_hellbaneammo()
		local Player = Game.GetLocalPlayer()
		Player:GiveItem(path25, amount, false)
end

function gd.pal.compa_hollowedfang()
		local Player = Game.GetLocalPlayer()
		Player:GiveItem(path26, amount, false)
end

function gd.pal.compa_imbuedsilver()
		local Player = Game.GetLocalPlayer()
		Player:GiveItem(path27, amount, false)
end

function gd.pal.compa_leatheryhide()
		local Player = Game.GetLocalPlayer()
		Player:GiveItem(path28, amount, false)
end

function gd.pal.compa_markofillusions()
		local Player = Game.GetLocalPlayer()
		Player:GiveItem(path29, amount, false)
end

function gd.pal.compa_markofthetraveler()
		local Player = Game.GetLocalPlayer()
		Player:GiveItem(path30, amount, false)
end

function gd.pal.compa_moltenskin()
		local Player = Game.GetLocalPlayer()
		Player:GiveItem(path31, amount, false)
end

function gd.pal.compa_mutagenicichor()
		local Player = Game.GetLocalPlayer()
		Player:GiveItem(path32, amount, false)
end

function gd.pal.compa_mutatedscales()
		local Player = Game.GetLocalPlayer()
		Player:GiveItem(path33, amount, false)
end

function gd.pal.compa_polishedemerald()
		local Player = Game.GetLocalPlayer()
		Player:GiveItem(path34, amount, false)
end

function gd.pal.compa_purifiedsalt()
		local Player = Game.GetLocalPlayer()
		Player:GiveItem(path35, amount, false)
end

function gd.pal.compa_radiantgem()
		local Player = Game.GetLocalPlayer()
		Player:GiveItem(path36, amount, false)
end

function gd.pal.compa_reinforcedshell()
		local Player = Game.GetLocalPlayer()
		Player:GiveItem(path37, amount, false)
end

function gd.pal.compa_resilientchestplate()
		local Player = Game.GetLocalPlayer()
		Player:GiveItem(path38, amount, false)
end

function gd.pal.compa_restlessremains()
		local Player = Game.GetLocalPlayer()
		Player:GiveItem(path39, amount, false)
end

function gd.pal.compa_riftstone()
		local Player = Game.GetLocalPlayer()
		Player:GiveItem(path40, amount, false)
end

function gd.pal.compa_rigidshell()
		local Player = Game.GetLocalPlayer()
		Player:GiveItem(path41, amount, false)
end

function gd.pal.compa_rottenheart()
		local Player = Game.GetLocalPlayer()
		Player:GiveItem(path42, amount, false)
end

function gd.pal.compa_runestone()
		local Player = Game.GetLocalPlayer()
		Player:GiveItem(path43, amount, false)
end

function gd.pal.compa_sanctifiedbone()
		local Player = Game.GetLocalPlayer()
		Player:GiveItem(path44, amount, false)
end

function gd.pal.compa_scalyhide()
		local Player = Game.GetLocalPlayer()
		Player:GiveItem(path45, amount, false)
end

function gd.pal.compa_scavengedplating()
		local Player = Game.GetLocalPlayer()
		Player:GiveItem(path46, amount, false)
end

function gd.pal.compa_searingember()
		local Player = Game.GetLocalPlayer()
		Player:GiveItem(path47, amount, false)
end

function gd.pal.compa_serratedspike()
		local Player = Game.GetLocalPlayer()
		Player:GiveItem(path48, amount, false)
end

function gd.pal.compa_severedclaw()
		local Player = Game.GetLocalPlayer()
		Player:GiveItem(path49, amount, false)
end

function gd.pal.compa_silkswatch()
		local Player = Game.GetLocalPlayer()
		Player:GiveItem(path50, amount, false)
end

function gd.pal.compa_soulshard()
		local Player = Game.GetLocalPlayer()
		Player:GiveItem(path51, amount, false)
end

function gd.pal.compa_spinedcarapace()
		local Player = Game.GetLocalPlayer()
		Player:GiveItem(path52, amount, false)
end

function gd.pal.compa_vengefulwraith()
		local Player = Game.GetLocalPlayer()
		Player:GiveItem(path53, amount, false)
end

function gd.pal.compa_venomtippedammo()
		local Player = Game.GetLocalPlayer()
		Player:GiveItem(path54, amount, false)
end

function gd.pal.compa_viciousjawbone()
		local Player = Game.GetLocalPlayer()
		Player:GiveItem(path55, amount, false)
end

function gd.pal.compa_viciousspikes()
		local Player = Game.GetLocalPlayer()
		Player:GiveItem(path56, amount, false)
end

function gd.pal.compa_viscousvenom()
		local Player = Game.GetLocalPlayer()
		Player:GiveItem(path57, amount, false)
end

function gd.pal.compa_voidtouchedammo()
		local Player = Game.GetLocalPlayer()
		Player:GiveItem(path58, amount, false)
end

function gd.pal.compa_wardstone()
		local Player = Game.GetLocalPlayer()
		Player:GiveItem(path59, amount, false)
end

function gd.pal.compa_whetstone()
		local Player = Game.GetLocalPlayer()
		Player:GiveItem(path60, amount, false)
end

function gd.pal.compa_wrathstone()
		local Player = Game.GetLocalPlayer()
		Player:GiveItem(path61, amount, false)
end

function gd.pal.compb_ancientarmorplate()
		local Player = Game.GetLocalPlayer()
		Player:GiveItem(path62, amount, false)
end

function gd.pal.compb_arcanediamond()
		local Player = Game.GetLocalPlayer()
		Player:GiveItem(path63, amount, false)
end

function gd.pal.compb_arcanelens()
		local Player = Game.GetLocalPlayer()
		Player:GiveItem(path64, amount, false)
end

function gd.pal.compb_arcanespark()
		local Player = Game.GetLocalPlayer()
		Player:GiveItem(path65, amount, false)
end

function gd.pal.compb_beronath()
		local Player = Game.GetLocalPlayer()
		Player:GiveItem(path66, amount, false)
end

function gd.pal.compb_bindingsofbysmiel()
		local Player = Game.GetLocalPlayer()
		Player:GiveItem(path67, amount, false)
end

function gd.pal.compb_bloodywhetstone()
		local Player = Game.GetLocalPlayer()
		Player:GiveItem(path68, amount, false)
end

function gd.pal.compb_chainsofoleron()
		local Player = Game.GetLocalPlayer()
		Player:GiveItem(path69, amount, false)
end

function gd.pal.compb_deviltouchedammo()
		local Player = Game.GetLocalPlayer()
		Player:GiveItem(path70, amount, false)
end

function gd.pal.compb_dreadskull()
		local Player = Game.GetLocalPlayer()
		Player:GiveItem(path71, amount, false)
end

function gd.pal.compb_hallowedground()
		local Player = Game.GetLocalPlayer()
		Player:GiveItem(path72, amount, false)
end

function gd.pal.compb_hauntedsteel()
		local Player = Game.GetLocalPlayer()
		Player:GiveItem(path73, amount, false)
end

function gd.pal.compb_kilriansoul()
		local Player = Game.GetLocalPlayer()
		Player:GiveItem(path74, amount, false)
end

function gd.pal.compb_lodestone()
		local Player = Game.GetLocalPlayer()
		Player:GiveItem(path75, amount, false)
end

function gd.pal.compb_markofdreeg()
		local Player = Game.GetLocalPlayer()
		Player:GiveItem(path76, amount, false)
end

function gd.pal.compb_markofmogdrogen()
		local Player = Game.GetLocalPlayer()
		Player:GiveItem(path77, amount, false)
end

function gd.pal.compb_markofthemyrmidon()
		local Player = Game.GetLocalPlayer()
		Player:GiveItem(path78, amount, false)
end

function gd.pal.compb_oleronblood()
		local Player = Game.GetLocalPlayer()
		Player:GiveItem(path79, amount, false)
end

function gd.pal.compb_silvercorebolts()
		local Player = Game.GetLocalPlayer()
		Player:GiveItem(path80, amount, false)
end

function gd.pal.compb_spellwoventhreads()
		local Player = Game.GetLocalPlayer()
		Player:GiveItem(path81, amount, false)
end

function gd.pal.compb_symbolofsolael()
		local Player = Game.GetLocalPlayer()
		Player:GiveItem(path82, amount, false)
end

function gd.pal.compb_unholyinscription()
		local Player = Game.GetLocalPlayer()
		Player:GiveItem(path83, amount, false)
end

function gd.pal.craft_aethercrystalcluster()
		local Player = Game.GetLocalPlayer()
		Player:GiveItem(path84, amount, false)
end

function gd.pal.craft_aethershard()
		local Player = Game.GetLocalPlayer()
		Player:GiveItem(path85, amount, false)
end

function gd.pal.craft_ancientheart()
		local Player = Game.GetLocalPlayer()
		Player:GiveItem(path86, amount, false)
end

function gd.pal.craft_bloodchthon()
		local Player = Game.GetLocalPlayer()
		Player:GiveItem(path87, amount, false)
end

function gd.pal.craft_cultistseal()
		local Player = Game.GetLocalPlayer()
		Player:GiveItem(path88, amount, false)
end

function gd.pal.craft_manticore()
		local Player = Game.GetLocalPlayer()
		Player:GiveItem(path89, amount, false)
end

function gd.pal.craft_royaljelly()
		local Player = Game.GetLocalPlayer()
		Player:GiveItem(path90, amount, false)
end

function gd.pal.craft_skeletonkey()
		local Player = Game.GetLocalPlayer()
		Player:GiveItem(path91, amount, false)
end

function gd.pal.craft_taintedbrain()
		local Player = Game.GetLocalPlayer()
		Player:GiveItem(path92, amount, false)
end

function gd.pal.quest_dynamite()
		local Player = Game.GetLocalPlayer()
		Player:GiveItem(path93, amount, false)
end

function gd.pal.scrapmetal()
		local Player = Game.GetLocalPlayer()
		Player:GiveItem(path94, amount, false)
end

function gd.pal.comp_void()
		local Player = Game.GetLocalPlayer()
		Player:GiveItem(path95, amount, false)
end

function gd.pal.comp_iceshard()
		local Player = Game.GetLocalPlayer()
		Player:GiveItem(path96, amount, false)
end

function gd.pal.comp_prismatic()
		local Player = Game.GetLocalPlayer()
		Player:GiveItem(path97, amount, false)
end

function gd.pal.comp_crystal()
		local Player = Game.GetLocalPlayer()
		Player:GiveItem(path98, amount, false)
end

function gd.pal.frostessence()
		local Player = Game.GetLocalPlayer()
		Player:GiveItem(ench01, amount, false)
end

function gd.pal.fireessence()
		local Player = Game.GetLocalPlayer()
		Player:GiveItem(ench02, amount, false)
end

function gd.pal.shockessence()
		local Player = Game.GetLocalPlayer()
		Player:GiveItem(ench03, amount, false)
end

function gd.pal.elemessence()
		local Player = Game.GetLocalPlayer()
		Player:GiveItem(ench04, amount, false)
end

function gd.pal.chaosessence()
		local Player = Game.GetLocalPlayer()
		Player:GiveItem(ench05, amount, false)
end

function gd.pal.mightessence()
		local Player = Game.GetLocalPlayer()
		Player:GiveItem(ench06, amount, false)
end

function gd.pal.pierceessence()
		local Player = Game.GetLocalPlayer()
		Player:GiveItem(ench07, amount, false)
end

function gd.pal.bloodessence()
		local Player = Game.GetLocalPlayer()
		Player:GiveItem(ench08, amount, false)
end

function gd.pal.aetheressence()
		local Player = Game.GetLocalPlayer()
		Player:GiveItem(ench09, amount, false)
end

function gd.pal.lifeessence()
		local Player = Game.GetLocalPlayer()
		Player:GiveItem(ench10, amount, false)
end

function gd.pal.manaessence()
		local Player = Game.GetLocalPlayer()
		Player:GiveItem(ench11, amount, false)
end

function gd.pal.poisonessence()
		local Player = Game.GetLocalPlayer()
		Player:GiveItem(ench12, amount, false)
end

function gd.pal.petsessence()
		local Player = Game.GetLocalPlayer()
		Player:GiveItem(ench13, amount, false)
end