rem dailFiculties merger.
robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\database\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAILmain - S\database\/" /S *.dbr *.tpl
robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\database\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAILmain - B\database\/" /S *.dbr *.tpl
robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\database\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAILmain - A\database\/" /S *.dbr *.tpl
robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\database\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAILmain - AB\database\/" /S *.dbr *.tpl
rem no longer needed. base version of DAIL is NG
rem robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\database\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAILmain - NG\database\/" /S *.dbr
robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\database\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAILmain - A NG\database\/" /S *.dbr *.tpl
robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\database\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAILmain - X\database\/" /S *.dbr *.tpl /xf gameengine.dbr
robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\database\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAILmain - AX\database\/" /S *.dbr *.tpl /xf gameengine.dbr

rem restore super loot tables for x mode
robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\VanillaBak\X_loot\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAILmain - X\database\records\items\/" /S *.dbr
robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\VanillaBak\X_loot\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAILmain - AX\database\records\items\/" /S *.dbr
robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\VanillaBak\X_bossmerge\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAILmain - X\database\records\creatures\enemies\/" /S *.dbr
robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\VanillaBak\X_bossmerge\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAILmain - AX\database\records\creatures\enemies\/" /S *.dbr

rem text_en replication
copy "f:\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\source\text_en\tags_skills.txt" "f:\SHTEEM\steamapps\common\Grim Dawn\mods\DAILmain - S\source\text_en\" /y
copy "f:\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\assets\text_en\tags_skills.txt" "f:\SHTEEM\steamapps\common\Grim Dawn\mods\DAILmain - S\assets\text_en\" /y
copy "f:\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\source\text_en\DAIL_hybrid_tags.txt" "f:\SHTEEM\steamapps\common\Grim Dawn\mods\DAILmain - S\source\text_en\" /y
copy "f:\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\assets\text_en\DAIL_hybrid_tags.txt" "f:\SHTEEM\steamapps\common\Grim Dawn\mods\DAILmain - S\assets\text_en\" /y

rem specific script replication
robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\source\scripts\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAILmain - X\source\scripts\/" /S *.dbr
copy "f:\SHTEEM\steamapps\common\Grim Dawn\mods\DAILmain - X\source\scripts\Omega_Mod\DAIL.lua.bak" "f:\SHTEEM\steamapps\common\Grim Dawn\mods\DAILmain - S\source\scripts\Omega_Mod\DAIL.lua" /y
robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\source\scripts\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAILmain - S\source\scripts\/" /S *.dbr
robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\assets\scripts\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAILmain - X\assets\scripts\/" /S *.dbr
robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\assets\scripts\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAILmain - S\assets\scripts\/" /S *.dbr
rem copy "f:\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\source\scripts\Omega_Mod\Omega_scripts.lua" "f:\SHTEEM\steamapps\common\Grim Dawn\mods\DAILmain - S\source\scripts\Omega_Mod\" /y
rem copy "f:\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\source\scripts\Omega_Mod\Omega_scripts.lua" "f:\SHTEEM\steamapps\common\Grim Dawn\mods\DAILmain - X\source\scripts\Omega_Mod\" /y
rem copy "f:\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\source\scripts\Game\quests\devilscrossing.lua" "f:\SHTEEM\steamapps\common\Grim Dawn\mods\DAILmain - S\source\scripts\Game\quests\" /y
rem copy "f:\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\source\scripts\Omega_Mod\DAIL.lua" "f:\SHTEEM\steamapps\common\Grim Dawn\mods\DAILmain - S\source\scripts\Omega_Mod\" /y
rem copy "f:\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\source\scripts\Game\quests\devilscrossing.lua" "f:\SHTEEM\steamapps\common\Grim Dawn\mods\DAILmain - S\source\scripts\Game\quests\" /y
rem copy "f:\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\assets\scripts\Game\quests\devilscrossing.lua" "f:\SHTEEM\steamapps\common\Grim Dawn\mods\DAILmain - X\assets\scripts\Game\quests\" /y
rem F:\SHTEEM\steamapps\common\Grim Dawn\mods\DAILmain - X\source\scripts\Omega_Mod

rem specific DBR replication
copy "f:\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\database\records\creatures\pc\anm_femalepc.dbr" "f:\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - SURVIVAL\database\records\creatures\pc\" /y
copy "f:\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\database\records\creatures\pc\anm_malepc.dbr" "f:\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - SURVIVAL\database\records\creatures\pc\" /y
copy "f:\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\database\records\creatures\pc\FemalePC01.dbr" "f:\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - SURVIVAL\database\records\creatures\pc\" /y
copy "f:\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\database\records\creatures\pc\FemalePC01.dbr" "f:\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - RIFT\database\records\creatures\pc\" /y
copy "f:\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\database\records\creatures\pc\MalePC01.dbr" "f:\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - SURVIVAL\database\records\creatures\pc\" /y
copy "f:\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\database\records\creatures\pc\MalePC01.dbr" "f:\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - RIFT\database\records\creatures\pc\" /y
copy "f:\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\database\records\creatures\pc\playerlevels.dbr" "f:\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - RIFT\database\records\creatures\pc\" /y
copy "f:\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\database\records\creatures\pc\playerlevels.dbr" "f:\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - SURVIVAL\database\records\creatures\pc\" /y

rem ASSET REPLICATION
robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\source\effects\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - RIFT\source\effects\/" /S
robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\source\effects\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - SURVIVAL\source\effects\/" /S
robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\assets\effects\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - RIFT\assets\effects\/" /S
robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\assets\effects\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - SURVIVAL\assets\effects\/" /S

robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\source\ingameui\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - RIFT\source\ingameui\/" /S
robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\source\ingameui\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - SURVIVAL\source\ingameui\/" /S
robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\assets\ingameui\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - RIFT\assets\ingameui\/" /S
robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\assets\ingameui\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - SURVIVAL\assets\ingameui\/" /S

robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\source\sounds\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - RIFT\source\sounds\/" /S
robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\source\sounds\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - SURVIVAL\source\sounds\/" /S
robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\assets\sounds\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - RIFT\assets\sounds\/" /S
robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\assets\sounds\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - SURVIVAL\assets\sounds\/" /S

robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\source\soundeffects\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - RIFT\source\soundeffects\/" /S
robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\source\soundeffects\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - SURVIVAL\source\soundeffects\/" /S
robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\assets\soundeffects\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - RIFT\assets\soundeffects\/" /S
robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\assets\soundeffects\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - SURVIVAL\assets\soundeffects\/" /S

robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\source\xpack\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - RIFT\source\xpack\/" /S
robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\source\xpack\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - SURVIVAL\source\xpack\/" /S
robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\assets\xpack\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - RIFT\assets\xpack\/" /S
robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\assets\xpack\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - SURVIVAL\assets\xpack\/" /S

robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\source\text_en\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - RIFT\source\text_en\/" /S
robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\source\text_en\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - SURVIVAL\source\text_en\/" /S
robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\assets\text_en\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - RIFT\assets\text_en\/" /S
robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\assets\text_en\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - SURVIVAL\assets\text_en\/" /S

robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\source\textures\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - RIFT\source\textures\/" /S
robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\source\textures\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - SURVIVAL\source\textures\/" /S
robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\assets\textures\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - RIFT\assets\textures\/" /S
robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\assets\textures\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - SURVIVAL\assets\textures\/" /S

robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\source\wanez\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - RIFT\source\wanez\/" /S
robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\source\wanez\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - SURVIVAL\source\wanez\/" /S
robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\assets\wanez\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - RIFT\assets\wanez\/" /S
robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\assets\wanez\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - SURVIVAL\assets\wanez\/" /S

robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\source\Custom\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - RIFT\source\Custom\/" /S
robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\source\Custom\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - SURVIVAL\source\Custom\/" /S
robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\assets\Custom\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - RIFT\assets\Custom\/" /S
robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\assets\Custom\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - SURVIVAL\assets\Custom\/" /S

robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\assets\meshes\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - RIFT\assets\meshes\/" /S
robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\assets\meshes\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - SURVIVAL\assets\meshes\/" /S
robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\source\meshes\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - RIFT\source\meshes\/" /S
robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\source\meshes\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - SURVIVAL\source\meshes\/" /S

robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\source\ui\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - RIFT\source\ui\/" /S
robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\source\ui\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - SURVIVAL\source\ui\/" /S
robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\assets\ui\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - RIFT\assets\ui\/" /S
robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\assets\ui\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - SURVIVAL\assets\ui\/" /S

robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\source\fx\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - RIFT\source\fx\/" /S
robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\source\fx\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - SURVIVAL\source\fx\/" /S
robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\assets\fx\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - RIFT\assets\fx\/" /S
robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\assets\fx\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - SURVIVAL\assets\fx\/" /S

rem DATABASE REPLICATION
robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\database\DAIL\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - RIFT\database\DAIL\/" /S
robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\database\DAIL\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - SURVIVAL\database\DAIL\/" /S

robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\database\records\sounds\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - RIFT\database\records\sounds\/" /S /xf crafting_table.dbr
robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\database\records\sounds\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - SURVIVAL\database\records\sounds\/" /S /xf crafting_table.dbr

robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\database\records\items\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - RIFT\database\records\items\/" /S /xf crafting_table.dbr d01_chesthero_all_01.dbr
robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\database\records\items\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - SURVIVAL\database\records\items\/" /S /xf crafting_table.dbr d01_chesthero_all_01.dbr

robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\database\records\effects\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - RIFT\database\records\effects\/" /S /xf crafting_table.dbr
robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\database\records\effects\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - SURVIVAL\database\records\effects\/" /S /xf crafting_table.dbr

robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\database\records\xpack\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - RIFT\database\records\xpack\/" /S /xf crafting_table.dbr
robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\database\records\xpack\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - SURVIVAL\database\records\xpack\/" /S /xf crafting_table.dbr

robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\database\records\ui\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - RIFT\database\records\ui\/" /S /xf crafting_table.dbr
robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\database\records\ui\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - SURVIVAL\database\records\ui\/" /S /xf crafting_table.dbr

robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\database\records\creatures\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - RIFT\database\records\creatures\/" /S /xf crafting_table.dbr
robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\database\records\creatures\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - SURVIVAL\database\records\creatures\/" /S /xf crafting_table.dbr

robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\database\records\mod_wanez\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - RIFT\database\records\mod_wanez\/" /S
robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\database\records\mod_wanez\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - SURVIVAL\database\records\mod_wanez\/" /S

robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\database\DAIL\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - RIFT\database\DAIL\/" /S
robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\database\DAIL\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - SURVIVAL\database\DAIL\/" /S

robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\database\records\controllers\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - RIFT\database\records\controllers\/" /S
robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\database\records\controllers\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - SURVIVAL\database\records\controllers\/" /S

robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\database\records\interactive\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - RIFT\database\records\interactive\/" /S
robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\database\records\interactive\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - SURVIVAL\database\records\interactive\/" /S

robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\database\records\fx\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - RIFT\database\records\fx\/" /S
robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\database\records\fx\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - SURVIVAL\database\records\fx\/" /S

robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\database\records\sfx\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - RIFT\database\records\sfx\/" /S
robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\database\records\sfx\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - SURVIVAL\database\records\sfx\/" /S

robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\database\records\skills\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - RIFT\database\records\skills\/" /S
robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\database\records\skills\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - SURVIVAL\database\records\skills\/" /S

rem build SX and ASX mode
robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAILmain - X\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAILmain - SX\/" /S /MIR
robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAILmain - AX\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAILmain - ASX\/" /S /MIR
rem grab the limit_unlimited.dbr from S mode
copy ".\DAILmain - S\database\records\proxies\proxypoolequation_01.dbr" ".\DAILmain - SX\database\records\proxies\proxypoolequation_01.dbr" /y
copy ".\DAILmain - S\database\records\proxies\proxypoolequation_01.dbr" ".\DAILmain - ASX\database\records\proxies\proxypoolequation_01.dbr" /y
rem grab the tiny spiders from AS
robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAILmain - AX\database\records\creatures\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAILmain - ASX\database\records\creatures\/" /S