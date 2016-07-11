rem setup templates for items for summoning
rem skillName,records/skills/itemskills/consumableskills/item_cratebox.dbr,
copy base_summon_skill.dbr .\items\summon\dailskillsummon0001.dbr /y
copy base_summon_item.dbr .\items\summon\dailskillsummon0002.dbr /y
copy base_summon_item.dbr .\items\summon\dailskillsummon0003.dbr /y
copy base_summon_item.dbr .\items\summon\dailskillsummon0004.dbr /y
copy base_summon_item.dbr .\items\summon\dailskillsummon0005.dbr /y
copy base_summon_item.dbr .\items\summon\dailskillsummon0006.dbr /y
copy base_summon_item.dbr .\items\summon\dailskillsummon0007.dbr /y
copy base_summon_item.dbr .\items\summon\dailskillsummon0008.dbr /y
copy base_summon_item.dbr .\items\summon\dailskillsummon0009.dbr /y
copy base_summon_item.dbr .\items\summon\dailskillsummon0010.dbr /y
copy base_summon_item.dbr .\items\summon\dailskillsummon0011.dbr /y
copy base_summon_item.dbr .\items\summon\dailskillsummon0012.dbr /y
copy base_summon_item.dbr .\items\summon\dailskillsummon0013.dbr /y
copy base_summon_item.dbr .\items\summon\dailskillsummon0014.dbr /y
copy base_summon_item.dbr .\items\summon\dailskillsummon0015.dbr /y
copy base_summon_item.dbr .\items\summon\dailskillsummon0016.dbr /y
copy base_summon_item.dbr .\items\summon\dailskillsummon0017.dbr /y
copy base_summon_item.dbr .\items\summon\dailskillsummon0018.dbr /y
copy base_summon_item.dbr .\items\summon\dailskillsummon0019.dbr /y
copy base_summon_item.dbr .\items\summon\dailskillsummon0020.dbr /y
copy base_summon_item.dbr .\items\summon\dailskillsummon0021.dbr /y
copy base_summon_item.dbr .\items\summon\dailskillsummon0022.dbr /y
copy base_summon_item.dbr .\items\summon\dailskillsummon0023.dbr /y
copy base_summon_item.dbr .\items\summon\dailskillsummon0024.dbr /y
copy base_summon_item.dbr .\items\summon\dailskillsummon0025.dbr /y
copy base_summon_item.dbr .\items\summon\dailskillsummon0026.dbr /y
copy base_summon_item.dbr .\items\summon\dailskillsummon0027.dbr /y
copy base_summon_item.dbr .\items\summon\dailskillsummon0028.dbr /y
copy base_summon_item.dbr .\items\summon\dailskillsummon0029.dbr /y
copy base_summon_item.dbr .\items\summon\dailskillsummon0030.dbr /y
copy base_summon_item.dbr .\items\summon\dailfactionsummon0001.dbr /y
copy base_summon_item.dbr .\items\summon\dailfactionsummon0002.dbr /y
copy base_summon_item.dbr .\items\summon\dailfactionsummon0003.dbr /y

pause

rem append what is needed to the item summoning files
echo skillName,DAIL/skills/itemskills/item_cratebox.dbr, >> .\items\summon\cratebox.dbr
echo skillName,DAIL/skills/itemskillsdailskillsummon0001.dbr, >> .\items\summon\dailskillsummon0001.dbr
echo skillName,DAIL/skills/itemskillsdailskillsummon0002.dbr, >> .\items\summon\dailskillsummon0002.dbr
echo skillName,DAIL/skills/itemskillsdailskillsummon0003.dbr, >> .\items\summon\dailskillsummon0003.dbr
echo skillName,DAIL/skills/itemskillsdailskillsummon0004.dbr, >> .\items\summon\dailskillsummon0004.dbr
echo skillName,DAIL/skills/itemskillsdailskillsummon0005.dbr, >> .\items\summon\dailskillsummon0005.dbr
echo skillName,DAIL/skills/itemskillsdailskillsummon0006.dbr, >> .\items\summon\dailskillsummon0006.dbr
echo skillName,DAIL/skills/itemskillsdailskillsummon0007.dbr, >> .\items\summon\dailskillsummon0007.dbr
echo skillName,DAIL/skills/itemskillsdailskillsummon0008.dbr, >> .\items\summon\dailskillsummon0008.dbr
echo skillName,DAIL/skills/itemskillsdailskillsummon0009.dbr, >> .\items\summon\dailskillsummon0009.dbr
echo skillName,DAIL/skills/itemskillsdailskillsummon0010.dbr, >> .\items\summon\dailskillsummon0010.dbr
echo skillName,DAIL/skills/itemskillsdailskillsummon0011.dbr, >> .\items\summon\dailskillsummon0011.dbr
echo skillName,DAIL/skills/itemskillsdailskillsummon0012.dbr, >> .\items\summon\dailskillsummon0012.dbr
echo skillName,DAIL/skills/itemskillsdailskillsummon0013.dbr, >> .\items\summon\dailskillsummon0013.dbr
echo skillName,DAIL/skills/itemskillsdailskillsummon0014.dbr, >> .\items\summon\dailskillsummon0014.dbr
echo skillName,DAIL/skills/itemskillsdailskillsummon0015.dbr, >> .\items\summon\dailskillsummon0015.dbr
echo skillName,DAIL/skills/itemskillsdailskillsummon0016.dbr, >> .\items\summon\dailskillsummon0016.dbr
echo skillName,DAIL/skills/itemskillsdailskillsummon0017.dbr, >> .\items\summon\dailskillsummon0017.dbr
echo skillName,DAIL/skills/itemskillsdailskillsummon0018.dbr, >> .\items\summon\dailskillsummon0018.dbr
echo skillName,DAIL/skills/itemskillsdailskillsummon0019.dbr, >> .\items\summon\dailskillsummon0019.dbr
echo skillName,DAIL/skills/itemskillsdailskillsummon0020.dbr, >> .\items\summon\dailskillsummon0020.dbr
echo skillName,DAIL/skills/itemskillsdailskillsummon0021.dbr, >> .\items\summon\dailskillsummon0021.dbr
echo skillName,DAIL/skills/itemskillsdailskillsummon0022.dbr, >> .\items\summon\dailskillsummon0022.dbr
echo skillName,DAIL/skills/itemskillsdailskillsummon0023.dbr, >> .\items\summon\dailskillsummon0023.dbr
echo skillName,DAIL/skills/itemskillsdailskillsummon0024.dbr, >> .\items\summon\dailskillsummon0024.dbr
echo skillName,DAIL/skills/itemskillsdailskillsummon0025.dbr, >> .\items\summon\dailskillsummon0025.dbr
echo skillName,DAIL/skills/itemskillsdailskillsummon0026.dbr, >> .\items\summon\dailskillsummon0026.dbr
echo skillName,DAIL/skills/itemskillsdailskillsummon0027.dbr >> .\items\summon\dailskillsummon0027.dbr
echo skillName,DAIL/skills/itemskillsdailskillsummon0028.dbr, >> .\items\summon\dailskillsummon0028.dbr
echo skillName,DAIL/skills/itemskillsdailskillsummon0029.dbr, >> .\items\summon\dailskillsummon0029.dbr
echo skillName,DAIL/skills/itemskillsdailskillsummon0030.dbr, >> .\items\summon\dailskillsummon0030.dbr
echo skillName,DAIL/skills/itemskillsdailfactionsummon00001.dbr, >> .\items\summon\dailfactionsummon0001.dbr
echo skillName,DAIL/skills/itemskillsdailfactionsummon00002.dbr, >> .\items\summon\dailfactionsummon0002.dbr
echo skillName,DAIL/skills/itemskillsdailfactionsummon00003.dbr, >> .\items\summon\dailfactionsummon0003.dbr

pause

rem  add description
rem  itemText,tagConsumableTransmogDesc,
echo itemText,tagDailThentyZShopping0001, >> .\items\summon\dailskillsummon0001.dbr
echo itemText,tagDailThentyZShopping0002, >> .\items\summon\dailskillsummon0002.dbr
echo itemText,tagDailThentyZShopping0003, >> .\items\summon\dailskillsummon0003.dbr
echo itemText,tagDailThentyZShopping0004, >> .\items\summon\dailskillsummon0004.dbr
echo itemText,tagDailThentyZShopping0005, >> .\items\summon\dailskillsummon0005.dbr
echo itemText,tagDailThentyZShopping0006, >> .\items\summon\dailskillsummon0006.dbr
echo itemText,tagDailThentyZShopping0007, >> .\items\summon\dailskillsummon0007.dbr
echo itemText,tagDailThentyZShopping0008, >> .\items\summon\dailskillsummon0008.dbr
echo itemText,tagDailThentyZShopping0009, >> .\items\summon\dailskillsummon0009.dbr
echo itemText,tagDailThentyZShopping0010, >> .\items\summon\dailskillsummon0010.dbr
echo itemText,tagDailThentyZShopping0011, >> .\items\summon\dailskillsummon0011.dbr
echo itemText,tagDailThentyZShopping0012, >> .\items\summon\dailskillsummon0012.dbr
echo itemText,tagDailThentyZShopping0013, >> .\items\summon\dailskillsummon0013.dbr
echo itemText,tagDailThentyZShopping0014, >> .\items\summon\dailskillsummon0014.dbr
echo itemText,tagDailThentyZShopping0015, >> .\items\summon\dailskillsummon0015.dbr
echo itemText,tagDailThentyZShopping0016, >> .\items\summon\dailskillsummon0016.dbr
echo itemText,tagDailThentyZShopping0017, >> .\items\summon\dailskillsummon0017.dbr
echo itemText,tagDailThentyZShopping0018, >> .\items\summon\dailskillsummon0018.dbr
echo itemText,tagDailThentyZShopping0019, >> .\items\summon\dailskillsummon0019.dbr
echo itemText,tagDailThentyZShopping0020, >> .\items\summon\dailskillsummon0020.dbr
echo itemText,tagDailThentyZShopping0021, >> .\items\summon\dailskillsummon0021.dbr
echo itemText,tagDailThentyZShopping0022, >> .\items\summon\dailskillsummon0022.dbr
echo itemText,tagDailThentyZShopping0023, >> .\items\summon\dailskillsummon0023.dbr
echo itemText,tagDailThentyZShopping0024, >> .\items\summon\dailskillsummon0024.dbr
echo itemText,tagDailThentyZShopping0025, >> .\items\summon\dailskillsummon0025.dbr
echo itemText,tagDailThentyZShopping0026, >> .\items\summon\dailskillsummon0026.dbr
echo itemText,tagDailThentyZShopping0027, >> .\items\summon\dailskillsummon0027.dbr
echo itemText,tagDailThentyZShopping0028, >> .\items\summon\dailskillsummon0028.dbr
echo itemText,tagDailThentyZShopping0029, >> .\items\summon\dailskillsummon0029.dbr
echo itemText,tagDailThentyZShopping0030, >> .\items\summon\dailskillsummon0030.dbr
echo itemText,tagDailDavoodFactioner, >> .\items\summon\dailfactionsummon0001.dbr
echo itemText,tagDailHardyFactioner, >> .\items\summon\dailfactionsummon0002.dbr
echo itemText,tagDailKhalanosFactioner, >> .\items\summon\dailfactionsummon0003.dbr

pause

rem prep the skills
copy base_summon_skill.dbr .\skills\itemskills\dailskillsummon0001.dbr /y
copy base_summon_skill.dbr .\skills\itemskills\dailskillsummon0002.dbr /y
copy base_summon_skill.dbr .\skills\itemskills\dailskillsummon0003.dbr /y
copy base_summon_skill.dbr .\skills\itemskills\dailskillsummon0004.dbr /y
copy base_summon_skill.dbr .\skills\itemskills\dailskillsummon0005.dbr /y
copy base_summon_skill.dbr .\skills\itemskills\dailskillsummon0006.dbr /y
copy base_summon_skill.dbr .\skills\itemskills\dailskillsummon0007.dbr /y
copy base_summon_skill.dbr .\skills\itemskills\dailskillsummon0008.dbr /y
copy base_summon_skill.dbr .\skills\itemskills\dailskillsummon0009.dbr /y
copy base_summon_skill.dbr .\skills\itemskills\dailskillsummon0010.dbr /y
copy base_summon_skill.dbr .\skills\itemskills\dailskillsummon0011.dbr /y
copy base_summon_skill.dbr .\skills\itemskills\dailskillsummon0012.dbr /y
copy base_summon_skill.dbr .\skills\itemskills\dailskillsummon0013.dbr /y
copy base_summon_skill.dbr .\skills\itemskills\dailskillsummon0014.dbr /y
copy base_summon_skill.dbr .\skills\itemskills\dailskillsummon0015.dbr /y
copy base_summon_skill.dbr .\skills\itemskills\dailskillsummon0016.dbr /y
copy base_summon_skill.dbr .\skills\itemskills\dailskillsummon0017.dbr /y
copy base_summon_skill.dbr .\skills\itemskills\dailskillsummon0018.dbr /y
copy base_summon_skill.dbr .\skills\itemskills\dailskillsummon0019.dbr /y
copy base_summon_skill.dbr .\skills\itemskills\dailskillsummon0020.dbr /y
copy base_summon_skill.dbr .\skills\itemskills\dailskillsummon0021.dbr /y
copy base_summon_skill.dbr .\skills\itemskills\dailskillsummon0022.dbr /y
copy base_summon_skill.dbr .\skills\itemskills\dailskillsummon0023.dbr /y
copy base_summon_skill.dbr .\skills\itemskills\dailskillsummon0024.dbr /y
copy base_summon_skill.dbr .\skills\itemskills\dailskillsummon0025.dbr /y
copy base_summon_skill.dbr .\skills\itemskills\dailskillsummon0026.dbr /y
copy base_summon_skill.dbr .\skills\itemskills\dailskillsummon0027.dbr /y
copy base_summon_skill.dbr .\skills\itemskills\dailskillsummon0028.dbr /y
copy base_summon_skill.dbr .\skills\itemskills\dailskillsummon0029.dbr /y
copy base_summon_skill.dbr .\skills\itemskills\dailskillsummon0030.dbr /y
copy base_summon_skill.dbr .\skills\itemskills\dailfactionsummon0001.dbr /y
copy base_summon_skill.dbr .\skills\itemskills\dailfactionsummon0002.dbr /y
copy base_summon_skill.dbr .\skills\itemskills\dailfactionsummon0003.dbr /y

pause

rem add the npc to the summon skill dbr
rem spawnObjects,records/creatures/enemies/transmogsmith_alive.dbr,
echo DAIL/creatures/npc/merchant/DAILclassplusser0001.dbr, >> .\skills\itemskills\dailskillsummon0001.dbr
echo DAIL/creatures/npc/merchant/DAILclassplusser0002.dbr, >> .\skills\itemskills\dailskillsummon0002.dbr
echo DAIL/creatures/npc/merchant/DAILclassplusser0003.dbr, >> .\skills\itemskills\dailskillsummon0003.dbr
echo DAIL/creatures/npc/merchant/DAILclassplusser0004.dbr, >> .\skills\itemskills\dailskillsummon0004.dbr
echo DAIL/creatures/npc/merchant/DAILclassplusser0005.dbr, >> .\skills\itemskills\dailskillsummon0005.dbr
echo DAIL/creatures/npc/merchant/DAILclassplusser0006.dbr, >> .\skills\itemskills\dailskillsummon0006.dbr
echo DAIL/creatures/npc/merchant/DAILclassplusser0007.dbr, >> .\skills\itemskills\dailskillsummon0007.dbr
echo DAIL/creatures/npc/merchant/DAILclassplusser0008.dbr, >> .\skills\itemskills\dailskillsummon0008.dbr
echo DAIL/creatures/npc/merchant/DAILclassplusser0009.dbr, >> .\skills\itemskills\dailskillsummon0009.dbr
echo DAIL/creatures/npc/merchant/DAILclassplusser0010.dbr, >> .\skills\itemskills\dailskillsummon0010.dbr
echo DAIL/creatures/npc/merchant/DAILclassplusser0011.dbr, >> .\skills\itemskills\dailskillsummon0011.dbr
echo DAIL/creatures/npc/merchant/DAILclassplusser0012.dbr, >> .\skills\itemskills\dailskillsummon0012.dbr
echo DAIL/creatures/npc/merchant/DAILclassplusser0013.dbr, >> .\skills\itemskills\dailskillsummon0013.dbr
echo DAIL/creatures/npc/merchant/DAILclassplusser0014.dbr, >> .\skills\itemskills\dailskillsummon0014.dbr
echo DAIL/creatures/npc/merchant/DAILclassplusser0015.dbr, >> .\skills\itemskills\dailskillsummon0015.dbr
echo DAIL/creatures/npc/merchant/DAILclassplusser0016.dbr, >> .\skills\itemskills\dailskillsummon0016.dbr
echo DAIL/creatures/npc/merchant/DAILclassplusser0017.dbr, >> .\skills\itemskills\dailskillsummon0017.dbr
echo DAIL/creatures/npc/merchant/DAILclassplusser0018.dbr, >> .\skills\itemskills\dailskillsummon0018.dbr
echo DAIL/creatures/npc/merchant/DAILclassplusser0019.dbr, >> .\skills\itemskills\dailskillsummon0019.dbr
echo DAIL/creatures/npc/merchant/DAILclassplusser0020.dbr, >> .\skills\itemskills\dailskillsummon0020.dbr
echo DAIL/creatures/npc/merchant/DAILclassplusser0021.dbr, >> .\skills\itemskills\dailskillsummon0021.dbr
echo DAIL/creatures/npc/merchant/DAILclassplusser0022.dbr, >> .\skills\itemskills\dailskillsummon0022.dbr
echo DAIL/creatures/npc/merchant/DAILclassplusser0023.dbr, >> .\skills\itemskills\dailskillsummon0023.dbr
echo DAIL/creatures/npc/merchant/DAILclassplusser0024.dbr, >> .\skills\itemskills\dailskillsummon0024.dbr
echo DAIL/creatures/npc/merchant/DAILclassplusser0025.dbr, >> .\skills\itemskills\dailskillsummon0025.dbr
echo DAIL/creatures/npc/merchant/DAILclassplusser0026.dbr, >> .\skills\itemskills\dailskillsummon0026.dbr
echo DAIL/creatures/npc/merchant/DAILclassplusser0027.dbr, >> .\skills\itemskills\dailskillsummon0027.dbr
echo DAIL/creatures/npc/merchant/DAILclassplusser0028.dbr, >> .\skills\itemskills\dailskillsummon0028.dbr
echo DAIL/creatures/npc/merchant/DAILclassplusser0029.dbr, >> .\skills\itemskills\dailskillsummon0029.dbr
echo DAIL/creatures/npc/merchant/DAILclassplusser0030.dbr, >> .\skills\itemskills\dailskillsummon0030.dbr

pause
