rem generate the loot tables
rem cd creatures
rem cd npcs
rem cd merchants
copy dailTBL0000.dbr .\creatures\npcs\merchants\dailTBL0001.dbr /y
copy dailTBL0000.dbr .\creatures\npcs\merchants\dailTBL0002.dbr /y
copy dailTBL0000.dbr .\creatures\npcs\merchants\dailTBL0003.dbr /y
copy dailTBL0000.dbr .\creatures\npcs\merchants\dailTBL0004.dbr /y
copy dailTBL0000.dbr .\creatures\npcs\merchants\dailTBL0005.dbr /y
copy dailTBL0000.dbr .\creatures\npcs\merchants\dailTBL0006.dbr /y
copy dailTBL0000.dbr .\creatures\npcs\merchants\dailTBL0007.dbr /y
copy dailTBL0000.dbr .\creatures\npcs\merchants\dailTBL0008.dbr /y
copy dailTBL0000.dbr .\creatures\npcs\merchants\dailTBL0009.dbr /y
copy dailTBL0000.dbr .\creatures\npcs\merchants\dailTBL0010.dbr /y
copy dailTBL0000.dbr .\creatures\npcs\merchants\dailTBL0011.dbr /y
copy dailTBL0000.dbr .\creatures\npcs\merchants\dailTBL0012.dbr /y
copy dailTBL0000.dbr .\creatures\npcs\merchants\dailTBL0013.dbr /y
copy dailTBL0000.dbr .\creatures\npcs\merchants\dailTBL0014.dbr /y
copy dailTBL0000.dbr .\creatures\npcs\merchants\dailTBL0015.dbr /y
copy dailTBL0000.dbr .\creatures\npcs\merchants\dailTBL0016.dbr /y
copy dailTBL0000.dbr .\creatures\npcs\merchants\dailTBL0017.dbr /y
copy dailTBL0000.dbr .\creatures\npcs\merchants\dailTBL0018.dbr /y
copy dailTBL0000.dbr .\creatures\npcs\merchants\dailTBL0019.dbr /y
copy dailTBL0000.dbr .\creatures\npcs\merchants\dailTBL0020.dbr /y
copy dailTBL0000.dbr .\creatures\npcs\merchants\dailTBL0021.dbr /y
copy dailTBL0000.dbr .\creatures\npcs\merchants\dailTBL0022.dbr /y
copy dailTBL0000.dbr .\creatures\npcs\merchants\dailTBL0023.dbr /y
copy dailTBL0000.dbr .\creatures\npcs\merchants\dailTBL0024.dbr /y
copy dailTBL0000.dbr .\creatures\npcs\merchants\dailTBL0025.dbr /y
copy dailTBL0000.dbr .\creatures\npcs\merchants\dailTBL0026.dbr /y
copy dailTBL0000.dbr .\creatures\npcs\merchants\dailTBL0027.dbr /y
copy dailTBL0000.dbr .\creatures\npcs\merchants\dailTBL0028.dbr /y
copy dailTBL0000.dbr .\creatures\npcs\merchants\dailTBL0029.dbr /y
copy dailTBL0000.dbr .\creatures\npcs\merchants\dailTBL0030.dbr /y

rem add the lines to link it properly
echo marketMedalTable,DAIL/items/loottables/.\items\loottables\dailTBLoneskilldash0001.dbr, >> .\creatures\npcs\merchants\dailTBL0001.dbr
echo marketMedalTable,DAIL/items/loottables/.\items\loottables\dailTBLoneskilldash0002.dbr, >> .\creatures\npcs\merchants\dailTBL0002.dbr
echo marketMedalTable,DAIL/items/loottables/.\items\loottables\dailTBLoneskilldash0003.dbr, >> .\creatures\npcs\merchants\dailTBL0003.dbr
echo marketMedalTable,DAIL/items/loottables/.\items\loottables\dailTBLoneskilldash0004.dbr, >> .\creatures\npcs\merchants\dailTBL0004.dbr
echo marketMedalTable,DAIL/items/loottables/.\items\loottables\dailTBLoneskilldash0005.dbr, >> .\creatures\npcs\merchants\dailTBL0005.dbr
echo marketMedalTable,DAIL/items/loottables/.\items\loottables\dailTBLoneskilldash0006.dbr, >> .\creatures\npcs\merchants\dailTBL0006.dbr
echo marketMedalTable,DAIL/items/loottables/.\items\loottables\dailTBLoneskilldash0007.dbr, >> .\creatures\npcs\merchants\dailTBL0007.dbr
echo marketMedalTable,DAIL/items/loottables/.\items\loottables\dailTBLoneskilldash0008.dbr, >> .\creatures\npcs\merchants\dailTBL0008.dbr
echo marketMedalTable,DAIL/items/loottables/.\items\loottables\dailTBLoneskilldash0009.dbr, >> .\creatures\npcs\merchants\dailTBL0009.dbr
echo marketMedalTable,DAIL/items/loottables/.\items\loottables\dailTBLoneskilldash0010.dbr, >> .\creatures\npcs\merchants\dailTBL0010.dbr
echo marketMedalTable,DAIL/items/loottables/.\items\loottables\dailTBLoneskilldash0011.dbr, >> .\creatures\npcs\merchants\dailTBL0011.dbr
echo marketMedalTable,DAIL/items/loottables/.\items\loottables\dailTBLoneskilldash0012.dbr, >> .\creatures\npcs\merchants\dailTBL0012.dbr
echo marketMedalTable,DAIL/items/loottables/.\items\loottables\dailTBLoneskilldash0013.dbr, >> .\creatures\npcs\merchants\dailTBL0013.dbr
echo marketMedalTable,DAIL/items/loottables/.\items\loottables\dailTBLoneskilldash0014.dbr, >> .\creatures\npcs\merchants\dailTBL0014.dbr
echo marketMedalTable,DAIL/items/loottables/.\items\loottables\dailTBLoneskilldash0015.dbr, >> .\creatures\npcs\merchants\dailTBL0015.dbr
echo marketMedalTable,DAIL/items/loottables/.\items\loottables\dailTBLoneskilldash0016.dbr, >> .\creatures\npcs\merchants\dailTBL0016.dbr
echo marketMedalTable,DAIL/items/loottables/.\items\loottables\dailTBLoneskilldash0017.dbr, >> .\creatures\npcs\merchants\dailTBL0017.dbr
echo marketMedalTable,DAIL/items/loottables/.\items\loottables\dailTBLoneskilldash0018.dbr, >> .\creatures\npcs\merchants\dailTBL0018.dbr
echo marketMedalTable,DAIL/items/loottables/.\items\loottables\dailTBLoneskilldash0019.dbr, >> .\creatures\npcs\merchants\dailTBL0019.dbr
echo marketMedalTable,DAIL/items/loottables/.\items\loottables\dailTBLoneskilldash0020.dbr, >> .\creatures\npcs\merchants\dailTBL0020.dbr
echo marketMedalTable,DAIL/items/loottables/.\items\loottables\dailTBLoneskilldash0021.dbr, >> .\creatures\npcs\merchants\dailTBL0021.dbr
echo marketMedalTable,DAIL/items/loottables/.\items\loottables\dailTBLoneskilldash0022.dbr, >> .\creatures\npcs\merchants\dailTBL0022.dbr
echo marketMedalTable,DAIL/items/loottables/.\items\loottables\dailTBLoneskilldash0023.dbr, >> .\creatures\npcs\merchants\dailTBL0023.dbr
echo marketMedalTable,DAIL/items/loottables/.\items\loottables\dailTBLoneskilldash0024.dbr, >> .\creatures\npcs\merchants\dailTBL0024.dbr
echo marketMedalTable,DAIL/items/loottables/.\items\loottables\dailTBLoneskilldash0025.dbr, >> .\creatures\npcs\merchants\dailTBL0025.dbr
echo marketMedalTable,DAIL/items/loottables/.\items\loottables\dailTBLoneskilldash0026.dbr, >> .\creatures\npcs\merchants\dailTBL0026.dbr
echo marketMedalTable,DAIL/items/loottables/.\items\loottables\dailTBLoneskilldash0027.dbr, >> .\creatures\npcs\merchants\dailTBL0027.dbr
echo marketMedalTable,DAIL/items/loottables/.\items\loottables\dailTBLoneskilldash0028.dbr, >> .\creatures\npcs\merchants\dailTBL0028.dbr
echo marketMedalTable,DAIL/items/loottables/.\items\loottables\dailTBLoneskilldash0029.dbr, >> .\creatures\npcs\merchants\dailTBL0029.dbr
echo marketMedalTable,DAIL/items/loottables/.\items\loottables\dailTBLoneskilldash0030.dbr, >> .\creatures\npcs\merchants\dailTBL0030.dbr

copy dailMerchTemplate.dbr .\creatures\npcs\merchants\DAILclassplusser0001.dbr /y
copy dailMerchTemplate.dbr .\creatures\npcs\merchants\DAILclassplusser0002.dbr /y
copy dailMerchTemplate.dbr .\creatures\npcs\merchants\DAILclassplusser0003.dbr /y
copy dailMerchTemplate.dbr .\creatures\npcs\merchants\DAILclassplusser0004.dbr /y
copy dailMerchTemplate.dbr .\creatures\npcs\merchants\DAILclassplusser0005.dbr /y
copy dailMerchTemplate.dbr .\creatures\npcs\merchants\DAILclassplusser0006.dbr /y
copy dailMerchTemplate.dbr .\creatures\npcs\merchants\DAILclassplusser0007.dbr /y
copy dailMerchTemplate.dbr .\creatures\npcs\merchants\DAILclassplusser0008.dbr /y
copy dailMerchTemplate.dbr .\creatures\npcs\merchants\DAILclassplusser0009.dbr /y
copy dailMerchTemplate.dbr .\creatures\npcs\merchants\DAILclassplusser0010.dbr /y
copy dailMerchTemplate.dbr .\creatures\npcs\merchants\DAILclassplusser0011.dbr /y
copy dailMerchTemplate.dbr .\creatures\npcs\merchants\DAILclassplusser0012.dbr /y
copy dailMerchTemplate.dbr .\creatures\npcs\merchants\DAILclassplusser0013.dbr /y
copy dailMerchTemplate.dbr .\creatures\npcs\merchants\DAILclassplusser0014.dbr /y
copy dailMerchTemplate.dbr .\creatures\npcs\merchants\DAILclassplusser0015.dbr /y
copy dailMerchTemplate.dbr .\creatures\npcs\merchants\DAILclassplusser0016.dbr /y
copy dailMerchTemplate.dbr .\creatures\npcs\merchants\DAILclassplusser0017.dbr /y
copy dailMerchTemplate.dbr .\creatures\npcs\merchants\DAILclassplusser0018.dbr /y
copy dailMerchTemplate.dbr .\creatures\npcs\merchants\DAILclassplusser0019.dbr /y
copy dailMerchTemplate.dbr .\creatures\npcs\merchants\DAILclassplusser0020.dbr /y
copy dailMerchTemplate.dbr .\creatures\npcs\merchants\DAILclassplusser0021.dbr /y
copy dailMerchTemplate.dbr .\creatures\npcs\merchants\DAILclassplusser0022.dbr /y
copy dailMerchTemplate.dbr .\creatures\npcs\merchants\DAILclassplusser0023.dbr /y
copy dailMerchTemplate.dbr .\creatures\npcs\merchants\DAILclassplusser0024.dbr /y
copy dailMerchTemplate.dbr .\creatures\npcs\merchants\DAILclassplusser0025.dbr /y
copy dailMerchTemplate.dbr .\creatures\npcs\merchants\DAILclassplusser0026.dbr /y
copy dailMerchTemplate.dbr .\creatures\npcs\merchants\DAILclassplusser0027.dbr /y
copy dailMerchTemplate.dbr .\creatures\npcs\merchants\DAILclassplusser0028.dbr /y
copy dailMerchTemplate.dbr .\creatures\npcs\merchants\DAILclassplusser0029.dbr /y
copy dailMerchTemplate.dbr .\creatures\npcs\merchants\DAILclassplusser0030.dbr /y


echo description,tagDailThentyZShopping0001, >> .\creatures\npcs\merchants\DAILclassplusser0001.dbr
echo description,tagDailThentyZShopping0002, >> .\creatures\npcs\merchants\DAILclassplusser0002.dbr
echo description,tagDailThentyZShopping0003, >> .\creatures\npcs\merchants\DAILclassplusser0003.dbr
echo description,tagDailThentyZShopping0004, >> .\creatures\npcs\merchants\DAILclassplusser0004.dbr
echo description,tagDailThentyZShopping0005, >> .\creatures\npcs\merchants\DAILclassplusser0005.dbr
echo description,tagDailThentyZShopping0006, >> .\creatures\npcs\merchants\DAILclassplusser0006.dbr
echo description,tagDailThentyZShopping0007, >> .\creatures\npcs\merchants\DAILclassplusser0007.dbr
echo description,tagDailThentyZShopping0008, >> .\creatures\npcs\merchants\DAILclassplusser0008.dbr
echo description,tagDailThentyZShopping0009, >> .\creatures\npcs\merchants\DAILclassplusser0009.dbr
echo description,tagDailThentyZShopping0010, >> .\creatures\npcs\merchants\DAILclassplusser0010.dbr
echo description,tagDailThentyZShopping0011, >> .\creatures\npcs\merchants\DAILclassplusser0011.dbr
echo description,tagDailThentyZShopping0012, >> .\creatures\npcs\merchants\DAILclassplusser0012.dbr
echo description,tagDailThentyZShopping0013, >> .\creatures\npcs\merchants\DAILclassplusser0013.dbr
echo description,tagDailThentyZShopping0014, >> .\creatures\npcs\merchants\DAILclassplusser0014.dbr
echo description,tagDailThentyZShopping0015, >> .\creatures\npcs\merchants\DAILclassplusser0015.dbr
echo description,tagDailThentyZShopping0016, >> .\creatures\npcs\merchants\DAILclassplusser0016.dbr
echo description,tagDailThentyZShopping0017, >> .\creatures\npcs\merchants\DAILclassplusser0017.dbr
echo description,tagDailThentyZShopping0018, >> .\creatures\npcs\merchants\DAILclassplusser0018.dbr
echo description,tagDailThentyZShopping0019, >> .\creatures\npcs\merchants\DAILclassplusser0019.dbr
echo description,tagDailThentyZShopping0020, >> .\creatures\npcs\merchants\DAILclassplusser0020.dbr
echo description,tagDailThentyZShopping0021, >> .\creatures\npcs\merchants\DAILclassplusser0021.dbr
echo description,tagDailThentyZShopping0022, >> .\creatures\npcs\merchants\DAILclassplusser0022.dbr
echo description,tagDailThentyZShopping0023, >> .\creatures\npcs\merchants\DAILclassplusser0023.dbr
echo description,tagDailThentyZShopping0024, >> .\creatures\npcs\merchants\DAILclassplusser0024.dbr
echo description,tagDailThentyZShopping0025, >> .\creatures\npcs\merchants\DAILclassplusser0025.dbr
echo description,tagDailThentyZShopping0026, >> .\creatures\npcs\merchants\DAILclassplusser0026.dbr
echo description,tagDailThentyZShopping0027, >> .\creatures\npcs\merchants\DAILclassplusser0027.dbr
echo description,tagDailThentyZShopping0028, >> .\creatures\npcs\merchants\DAILclassplusser0028.dbr
echo description,tagDailThentyZShopping0029, >> .\creatures\npcs\merchants\DAILclassplusser0029.dbr
echo description,tagDailThentyZShopping0030, >> .\creatures\npcs\merchants\DAILclassplusser0030.dbr

echo marketFileName,DAIL/creatures/npcs/merchants/.\creatures\npcs\merchants\dailTBL0001.dbr, >> .\creatures\npcs\merchants\DAILclassplusser0001.dbr
echo marketFileName,DAIL/creatures/npcs/merchants/.\creatures\npcs\merchants\dailTBL0002.dbr, >> .\creatures\npcs\merchants\DAILclassplusser0002.dbr
echo marketFileName,DAIL/creatures/npcs/merchants/.\creatures\npcs\merchants\dailTBL0003.dbr, >> .\creatures\npcs\merchants\DAILclassplusser0003.dbr
echo marketFileName,DAIL/creatures/npcs/merchants/.\creatures\npcs\merchants\dailTBL0004.dbr, >> .\creatures\npcs\merchants\DAILclassplusser0004.dbr
echo marketFileName,DAIL/creatures/npcs/merchants/.\creatures\npcs\merchants\dailTBL0005.dbr, >> .\creatures\npcs\merchants\DAILclassplusser0005.dbr
echo marketFileName,DAIL/creatures/npcs/merchants/.\creatures\npcs\merchants\dailTBL0006.dbr, >> .\creatures\npcs\merchants\DAILclassplusser0006.dbr
echo marketFileName,DAIL/creatures/npcs/merchants/.\creatures\npcs\merchants\dailTBL0007.dbr, >> .\creatures\npcs\merchants\DAILclassplusser0007.dbr
echo marketFileName,DAIL/creatures/npcs/merchants/.\creatures\npcs\merchants\dailTBL0008.dbr, >> .\creatures\npcs\merchants\DAILclassplusser0008.dbr
echo marketFileName,DAIL/creatures/npcs/merchants/.\creatures\npcs\merchants\dailTBL0009.dbr, >> .\creatures\npcs\merchants\DAILclassplusser0009.dbr
echo marketFileName,DAIL/creatures/npcs/merchants/.\creatures\npcs\merchants\dailTBL0010.dbr, >> .\creatures\npcs\merchants\DAILclassplusser0010.dbr
echo marketFileName,DAIL/creatures/npcs/merchants/.\creatures\npcs\merchants\dailTBL0011.dbr, >> .\creatures\npcs\merchants\DAILclassplusser0011.dbr
echo marketFileName,DAIL/creatures/npcs/merchants/.\creatures\npcs\merchants\dailTBL0012.dbr, >> .\creatures\npcs\merchants\DAILclassplusser0012.dbr
echo marketFileName,DAIL/creatures/npcs/merchants/.\creatures\npcs\merchants\dailTBL0013.dbr, >> .\creatures\npcs\merchants\DAILclassplusser0013.dbr
echo marketFileName,DAIL/creatures/npcs/merchants/.\creatures\npcs\merchants\dailTBL0014.dbr, >> .\creatures\npcs\merchants\DAILclassplusser0014.dbr
echo marketFileName,DAIL/creatures/npcs/merchants/.\creatures\npcs\merchants\dailTBL0015.dbr, >> .\creatures\npcs\merchants\DAILclassplusser0015.dbr
echo marketFileName,DAIL/creatures/npcs/merchants/.\creatures\npcs\merchants\dailTBL0016.dbr, >> .\creatures\npcs\merchants\DAILclassplusser0016.dbr
echo marketFileName,DAIL/creatures/npcs/merchants/.\creatures\npcs\merchants\dailTBL0017.dbr, >> .\creatures\npcs\merchants\DAILclassplusser0017.dbr
echo marketFileName,DAIL/creatures/npcs/merchants/.\creatures\npcs\merchants\dailTBL0018.dbr, >> .\creatures\npcs\merchants\DAILclassplusser0018.dbr
echo marketFileName,DAIL/creatures/npcs/merchants/.\creatures\npcs\merchants\dailTBL0019.dbr, >> .\creatures\npcs\merchants\DAILclassplusser0019.dbr
echo marketFileName,DAIL/creatures/npcs/merchants/.\creatures\npcs\merchants\dailTBL0020.dbr, >> .\creatures\npcs\merchants\DAILclassplusser0020.dbr
echo marketFileName,DAIL/creatures/npcs/merchants/.\creatures\npcs\merchants\dailTBL0021.dbr, >> .\creatures\npcs\merchants\DAILclassplusser0021.dbr
echo marketFileName,DAIL/creatures/npcs/merchants/.\creatures\npcs\merchants\dailTBL0022.dbr, >> .\creatures\npcs\merchants\DAILclassplusser0022.dbr
echo marketFileName,DAIL/creatures/npcs/merchants/.\creatures\npcs\merchants\dailTBL0023.dbr, >> .\creatures\npcs\merchants\DAILclassplusser0023.dbr
echo marketFileName,DAIL/creatures/npcs/merchants/.\creatures\npcs\merchants\dailTBL0024.dbr, >> .\creatures\npcs\merchants\DAILclassplusser0024.dbr
echo marketFileName,DAIL/creatures/npcs/merchants/.\creatures\npcs\merchants\dailTBL0025.dbr, >> .\creatures\npcs\merchants\DAILclassplusser0025.dbr
echo marketFileName,DAIL/creatures/npcs/merchants/.\creatures\npcs\merchants\dailTBL0026.dbr, >> .\creatures\npcs\merchants\DAILclassplusser0026.dbr
echo marketFileName,DAIL/creatures/npcs/merchants/.\creatures\npcs\merchants\dailTBL0027.dbr, >> .\creatures\npcs\merchants\DAILclassplusser0027.dbr
echo marketFileName,DAIL/creatures/npcs/merchants/.\creatures\npcs\merchants\dailTBL0028.dbr, >> .\creatures\npcs\merchants\DAILclassplusser0028.dbr
echo marketFileName,DAIL/creatures/npcs/merchants/.\creatures\npcs\merchants\dailTBL0029.dbr, >> .\creatures\npcs\merchants\DAILclassplusser0029.dbr
echo marketFileName,DAIL/creatures/npcs/merchants/.\creatures\npcs\merchants\dailTBL0030.dbr, >> .\creatures\npcs\merchants\DAILclassplusser0030.dbr


rem generate the items
rem cd ..
rem cd ..
rem cd ..
rem cd items
rem cd loottables
rem actual loot table
copy dailoneskilldashTemplate.dbr .\items\loottables\dailoneskill0001.dbr /y
copy dailoneskilldashTemplate.dbr .\items\loottables\dailoneskill0002.dbr /y
copy dailoneskilldashTemplate.dbr .\items\loottables\dailoneskill0003.dbr /y
copy dailoneskilldashTemplate.dbr .\items\loottables\dailoneskill0004.dbr /y
copy dailoneskilldashTemplate.dbr .\items\loottables\dailoneskill0005.dbr /y
copy dailoneskilldashTemplate.dbr .\items\loottables\dailoneskill0006.dbr /y
copy dailoneskilldashTemplate.dbr .\items\loottables\dailoneskill0007.dbr /y
copy dailoneskilldashTemplate.dbr .\items\loottables\dailoneskill0008.dbr /y
copy dailoneskilldashTemplate.dbr .\items\loottables\dailoneskill0009.dbr /y
copy dailoneskilldashTemplate.dbr .\items\loottables\dailoneskill0010.dbr /y
copy dailoneskilldashTemplate.dbr .\items\loottables\dailoneskill0011.dbr /y
copy dailoneskilldashTemplate.dbr .\items\loottables\dailoneskill0012.dbr /y
copy dailoneskilldashTemplate.dbr .\items\loottables\dailoneskill0013.dbr /y
copy dailoneskilldashTemplate.dbr .\items\loottables\dailoneskill0014.dbr /y
copy dailoneskilldashTemplate.dbr .\items\loottables\dailoneskill0015.dbr /y
copy dailoneskilldashTemplate.dbr .\items\loottables\dailoneskill0016.dbr /y
copy dailoneskilldashTemplate.dbr .\items\loottables\dailoneskill0017.dbr /y
copy dailoneskilldashTemplate.dbr .\items\loottables\dailoneskill0018.dbr /y
copy dailoneskilldashTemplate.dbr .\items\loottables\dailoneskill0019.dbr /y
copy dailoneskilldashTemplate.dbr .\items\loottables\dailoneskill0020.dbr /y
copy dailoneskilldashTemplate.dbr .\items\loottables\dailoneskill0021.dbr /y
copy dailoneskilldashTemplate.dbr .\items\loottables\dailoneskill0022.dbr /y
copy dailoneskilldashTemplate.dbr .\items\loottables\dailoneskill0023.dbr /y
copy dailoneskilldashTemplate.dbr .\items\loottables\dailoneskill0024.dbr /y
copy dailoneskilldashTemplate.dbr .\items\loottables\dailoneskill0025.dbr /y
copy dailoneskilldashTemplate.dbr .\items\loottables\dailoneskill0026.dbr /y
copy dailoneskilldashTemplate.dbr .\items\loottables\dailoneskill0027.dbr /y
copy dailoneskilldashTemplate.dbr .\items\loottables\dailoneskill0028.dbr /y
copy dailoneskilldashTemplate.dbr .\items\loottables\dailoneskill0029.dbr /y
copy dailoneskilldashTemplate.dbr .\items\loottables\dailoneskill0030.dbr /y

rem shitty loot table linker
copy dailoneskilltop.dbr .\items\loottables\dailTBLoneskilldash0001.dbr /y
copy dailoneskilltop.dbr .\items\loottables\dailTBLoneskilldash0002.dbr /y
copy dailoneskilltop.dbr .\items\loottables\dailTBLoneskilldash0003.dbr /y
copy dailoneskilltop.dbr .\items\loottables\dailTBLoneskilldash0004.dbr /y
copy dailoneskilltop.dbr .\items\loottables\dailTBLoneskilldash0005.dbr /y
copy dailoneskilltop.dbr .\items\loottables\dailTBLoneskilldash0006.dbr /y
copy dailoneskilltop.dbr .\items\loottables\dailTBLoneskilldash0007.dbr /y
copy dailoneskilltop.dbr .\items\loottables\dailTBLoneskilldash0008.dbr /y
copy dailoneskilltop.dbr .\items\loottables\dailTBLoneskilldash0009.dbr /y
copy dailoneskilltop.dbr .\items\loottables\dailTBLoneskilldash0010.dbr /y
copy dailoneskilltop.dbr .\items\loottables\dailTBLoneskilldash0011.dbr /y
copy dailoneskilltop.dbr .\items\loottables\dailTBLoneskilldash0012.dbr /y
copy dailoneskilltop.dbr .\items\loottables\dailTBLoneskilldash0013.dbr /y
copy dailoneskilltop.dbr .\items\loottables\dailTBLoneskilldash0014.dbr /y
copy dailoneskilltop.dbr .\items\loottables\dailTBLoneskilldash0015.dbr /y
copy dailoneskilltop.dbr .\items\loottables\dailTBLoneskilldash0016.dbr /y
copy dailoneskilltop.dbr .\items\loottables\dailTBLoneskilldash0017.dbr /y
copy dailoneskilltop.dbr .\items\loottables\dailTBLoneskilldash0018.dbr /y
copy dailoneskilltop.dbr .\items\loottables\dailTBLoneskilldash0019.dbr /y
copy dailoneskilltop.dbr .\items\loottables\dailTBLoneskilldash0020.dbr /y
copy dailoneskilltop.dbr .\items\loottables\dailTBLoneskilldash0021.dbr /y
copy dailoneskilltop.dbr .\items\loottables\dailTBLoneskilldash0022.dbr /y
copy dailoneskilltop.dbr .\items\loottables\dailTBLoneskilldash0023.dbr /y
copy dailoneskilltop.dbr .\items\loottables\dailTBLoneskilldash0024.dbr /y
copy dailoneskilltop.dbr .\items\loottables\dailTBLoneskilldash0025.dbr /y
copy dailoneskilltop.dbr .\items\loottables\dailTBLoneskilldash0026.dbr /y
copy dailoneskilltop.dbr .\items\loottables\dailTBLoneskilldash0027.dbr /y
copy dailoneskilltop.dbr .\items\loottables\dailTBLoneskilldash0028.dbr /y
copy dailoneskilltop.dbr .\items\loottables\dailTBLoneskilldash0029.dbr /y
copy dailoneskilltop.dbr .\items\loottables\dailTBLoneskilldash0030.dbr /y

echo records,DAIL/items/loottables/.\items\loottables\dailoneskill0001.dbr, >> .\items\loottables\dailTBLoneskilldash0001.dbr
echo records,DAIL/items/loottables/.\items\loottables\dailoneskill0002.dbr, >> .\items\loottables\dailTBLoneskilldash0002.dbr
echo records,DAIL/items/loottables/.\items\loottables\dailoneskill0003.dbr, >> .\items\loottables\dailTBLoneskilldash0003.dbr
echo records,DAIL/items/loottables/.\items\loottables\dailoneskill0004.dbr, >> .\items\loottables\dailTBLoneskilldash0004.dbr
echo records,DAIL/items/loottables/.\items\loottables\dailoneskill0005.dbr, >> .\items\loottables\dailTBLoneskilldash0005.dbr
echo records,DAIL/items/loottables/.\items\loottables\dailoneskill0006.dbr, >> .\items\loottables\dailTBLoneskilldash0006.dbr
echo records,DAIL/items/loottables/.\items\loottables\dailoneskill0007.dbr, >> .\items\loottables\dailTBLoneskilldash0007.dbr
echo records,DAIL/items/loottables/.\items\loottables\dailoneskill0008.dbr, >> .\items\loottables\dailTBLoneskilldash0008.dbr
echo records,DAIL/items/loottables/.\items\loottables\dailoneskill0009.dbr, >> .\items\loottables\dailTBLoneskilldash0009.dbr
echo records,DAIL/items/loottables/.\items\loottables\dailoneskill0010.dbr, >> .\items\loottables\dailTBLoneskilldash0010.dbr
echo records,DAIL/items/loottables/.\items\loottables\dailoneskill0011.dbr, >> .\items\loottables\dailTBLoneskilldash0011.dbr
echo records,DAIL/items/loottables/.\items\loottables\dailoneskill0012.dbr, >> .\items\loottables\dailTBLoneskilldash0012.dbr
echo records,DAIL/items/loottables/.\items\loottables\dailoneskill0013.dbr, >> .\items\loottables\dailTBLoneskilldash0013.dbr
echo records,DAIL/items/loottables/.\items\loottables\dailoneskill0014.dbr, >> .\items\loottables\dailTBLoneskilldash0014.dbr
echo records,DAIL/items/loottables/.\items\loottables\dailoneskill0015.dbr, >> .\items\loottables\dailTBLoneskilldash0015.dbr
echo records,DAIL/items/loottables/.\items\loottables\dailoneskill0016.dbr, >> .\items\loottables\dailTBLoneskilldash0016.dbr
echo records,DAIL/items/loottables/.\items\loottables\dailoneskill0017.dbr, >> .\items\loottables\dailTBLoneskilldash0017.dbr
echo records,DAIL/items/loottables/.\items\loottables\dailoneskill0018.dbr, >> .\items\loottables\dailTBLoneskilldash0018.dbr
echo records,DAIL/items/loottables/.\items\loottables\dailoneskill0019.dbr, >> .\items\loottables\dailTBLoneskilldash0019.dbr
echo records,DAIL/items/loottables/.\items\loottables\dailoneskill0020.dbr, >> .\items\loottables\dailTBLoneskilldash0020.dbr
echo records,DAIL/items/loottables/.\items\loottables\dailoneskill0021.dbr, >> .\items\loottables\dailTBLoneskilldash0021.dbr
echo records,DAIL/items/loottables/.\items\loottables\dailoneskill0022.dbr, >> .\items\loottables\dailTBLoneskilldash0022.dbr
echo records,DAIL/items/loottables/.\items\loottables\dailoneskill0023.dbr, >> .\items\loottables\dailTBLoneskilldash0023.dbr
echo records,DAIL/items/loottables/.\items\loottables\dailoneskill0024.dbr, >> .\items\loottables\dailTBLoneskilldash0024.dbr
echo records,DAIL/items/loottables/.\items\loottables\dailoneskill0025.dbr, >> .\items\loottables\dailTBLoneskilldash0025.dbr
echo records,DAIL/items/loottables/.\items\loottables\dailoneskill0026.dbr, >> .\items\loottables\dailTBLoneskilldash0026.dbr
echo records,DAIL/items/loottables/.\items\loottables\dailoneskill0027.dbr, >> .\items\loottables\dailTBLoneskilldash0027.dbr
echo records,DAIL/items/loottables/.\items\loottables\dailoneskill0028.dbr, >> .\items\loottables\dailTBLoneskilldash0028.dbr
echo records,DAIL/items/loottables/.\items\loottables\dailoneskill0029.dbr, >> .\items\loottables\dailTBLoneskilldash0029.dbr
echo records,DAIL/items/loottables/.\items\loottables\dailoneskill0030.dbr, >> .\items\loottables\dailTBLoneskilldash0030.dbr

rem actual items
rem cd ..
rem cd materia

mkdir .\items\loottables\class0001
mkdir .\items\loottables\class0002
mkdir .\items\loottables\class0003
mkdir .\items\loottables\class0004
mkdir .\items\loottables\class0005
mkdir .\items\loottables\class0006
mkdir .\items\loottables\class0007
mkdir .\items\loottables\class0008
mkdir .\items\loottables\class0009
mkdir .\items\loottables\class0010
mkdir .\items\loottables\class0011
mkdir .\items\loottables\class0012
mkdir .\items\loottables\class0013
mkdir .\items\loottables\class0014
mkdir .\items\loottables\class0015
mkdir .\items\loottables\class0016
mkdir .\items\loottables\class0017
mkdir .\items\loottables\class0018
mkdir .\items\loottables\class0019
mkdir .\items\loottables\class0020
mkdir .\items\loottables\class0021
mkdir .\items\loottables\class0022
mkdir .\items\loottables\class0023
mkdir .\items\loottables\class0024
mkdir .\items\loottables\class0025
mkdir .\items\loottables\class0026
mkdir .\items\loottables\class0027
mkdir .\items\loottables\class0028
mkdir .\items\loottables\class0029
mkdir .\items\loottables\class0030
