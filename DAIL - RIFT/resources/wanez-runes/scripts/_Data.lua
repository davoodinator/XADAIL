--[[
Created by IntelliJ IDEA.
User: WareBare
Date: 7/28/2016
Time: 4:32 AM

Package: wanez.runes

using fixed table keys because:
- to make sure the right component is used
- to be able to add new components alphabetically without messing up the MateriaID
- to find the MateriaID easier
- [int MateriaID]=string Path

]]--

-- Tier 1 Components (or Common?!?!)
local materia01 = {
    [1]='records/items/materia/compa_aethersoul.dbr',
    [2]='records/items/materia/compa_aethersteelalloy.dbr',
    [3]='records/items/materia/compa_aethersteelbolts.dbr',
    [4]='records/items/materia/compa_amber.dbr',
    [5]='records/items/materia/compa_ballisticplating.dbr',
    [6]='records/items/materia/compa_batteredshell.dbr',
    [7]='records/items/materia/compa_blacktallow.dbr',
    [8]='records/items/materia/compa_blessedsteel.dbr',
    [9]='records/items/materia/compa_bristlyfur.dbr',
    [10]='records/items/materia/compa_chilledsteel.dbr',
    [11]='records/items/materia/compa_chippedclaw.dbr',
    [12]='records/items/materia/compa_coldstone.dbr',
    [13]='records/items/materia/compa_consecratedwrappings.dbr',
    [14]='records/items/materia/compa_corpsedust.dbr',
    [15]='records/items/materia/compa_crackedlodestone.dbr',
    [16]='records/items/materia/compa_deathchillbolts.dbr',
    [17]='records/items/materia/compa_densefur.dbr',
    [18]='records/items/materia/compa_ectoplasm.dbr',
    [19]='records/items/materia/compa_festeringblood.dbr',
    [20]='records/items/materia/compa_flint.dbr',
    [21]='records/items/materia/compa_flintcorebolts.dbr',
    [22]='records/items/materia/compa_focusingprism.dbr',
    [23]='records/items/materia/compa_frozenheart.dbr',
    [24]='records/items/materia/compa_gallstone.dbr',
    [25]='records/items/materia/compa_hellbaneammo.dbr',
    [26]='records/items/materia/compa_hollowedfang.dbr',
    [27]='records/items/materia/compa_imbuedsilver.dbr',
    [28]='records/items/materia/compa_leatheryhide.dbr',
    [29]='records/items/materia/compa_markofillusions.dbr',
    [30]='records/items/materia/compa_markofthetraveler.dbr',
    [31]='records/items/materia/compa_moltenskin.dbr',
    [32]='records/items/materia/compa_mutagenicichor.dbr',
    [33]='records/items/materia/compa_mutatedscales.dbr',
    [34]='records/items/materia/compa_polishedemerald.dbr',
    [35]='records/items/materia/compa_purifiedsalt.dbr',
    [36]='records/items/materia/compa_radiantgem.dbr',
    [37]='records/items/materia/compa_reinforcedshell.dbr',
    [38]='records/items/materia/compa_resilientchestplate.dbr',
    [39]='records/items/materia/compa_restlessremains.dbr',
    [40]='records/items/materia/compa_riftstone.dbr',
    [41]='records/items/materia/compa_rigidshell.dbr',
    [42]='records/items/materia/compa_rottenheart.dbr',
    [43]='records/items/materia/compa_runestone.dbr',
    [44]='records/items/materia/compa_sanctifiedbone.dbr',
    [45]='records/items/materia/compa_scalyhide.dbr',
    [46]='records/items/materia/compa_scavengedplating.dbr',
    [47]='records/items/materia/compa_searingember.dbr',
    [48]='records/items/materia/compa_serratedspike.dbr',
    [49]='records/items/materia/compa_severedclaw.dbr',
    [50]='records/items/materia/compa_silkswatch.dbr',
    [51]='records/items/materia/compa_soulshard.dbr',
    [52]='records/items/materia/compa_spinedcarapace.dbr',
    [53]='records/items/materia/compa_vengefulwraith.dbr',
    [54]='records/items/materia/compa_venomtippedammo.dbr',
    [55]='records/items/materia/compa_viciousjawbone.dbr',
    [56]='records/items/materia/compa_viciousspikes.dbr',
    [57]='records/items/materia/compa_viscousvenom.dbr',
    [58]='records/items/materia/compa_voidtouchedammo.dbr',
    [59]='records/items/materia/compa_wardstone.dbr',
    [60]='records/items/materia/compa_whetstone.dbr',
    [61]='records/items/materia/compa_wrathstone.dbr'
}
-- Tier 2 Components (or Rare?!?!)
local materia02 = {
    [1]='records/items/materia/compb_ancientarmorplate.dbr',
    [2]='records/items/materia/compb_arcanediamond.dbr',
    [3]='records/items/materia/compb_arcanelens.dbr',
    [4]='records/items/materia/compb_arcanespark.dbr',
    [5]='records/items/materia/compb_beronath.dbr',
    [6]='records/items/materia/compb_bindingsofbysmiel.dbr',
    [7]='records/items/materia/compb_bloodywhetstone.dbr',
    [8]='records/items/materia/compb_chainsofoleron.dbr',
    [9]='records/items/materia/compb_deviltouchedammo.dbr',
    [10]='records/items/materia/compb_dreadskull.dbr',
    [11]='records/items/materia/compb_hallowedground.dbr',
    [12]='records/items/materia/compb_hauntedsteel.dbr',
    [13]='records/items/materia/compb_kilriansoul.dbr',
    [14]='records/items/materia/compb_lodestone.dbr',
    [15]='records/items/materia/compb_markofdreeg.dbr',
    [16]='records/items/materia/compb_markofmogdrogen.dbr',
    [17]='records/items/materia/compb_markofthemyrmidon.dbr',
    [18]='records/items/materia/compb_oleronblood.dbr',
    [19]='records/items/materia/compb_silvercorebolts.dbr',
    [20]='records/items/materia/compb_spellwoventhreads.dbr',
    [21]='records/items/materia/compb_symbolofsolael.dbr',
    [22]='records/items/materia/compb_unholyinscription.dbr'
}

wanez.runes._Data = {
    ['Materia']={
        materia01,
        materia02
    },
    ['Items']={

    },
    ['Runes']={

    }
}
