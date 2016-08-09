@ECHO OFF
SET BATCH_DIR=%~dp0

rem dailFiculties merger.
robocopy "%BATCH_DIR%DAIL\database" "%BATCH_DIR%DAILmain - S\database" /S /NFL /NDL *.dbr *.tpl
robocopy "%BATCH_DIR%DAIL\database" "%BATCH_DIR%DAILmain - B\database" /S /NFL /NDL *.dbr *.tpl
robocopy "%BATCH_DIR%DAIL\database" "%BATCH_DIR%DAILmain - A\database" /S /NFL /NDL *.dbr *.tpl
robocopy "%BATCH_DIR%DAIL\database" "%BATCH_DIR%DAILmain - AB\database" /S /NFL /NDL *.dbr *.tpl
rem no longer needed. base version of DAIL is NG
rem robocopy "%BATCH_DIR%DAIL\database" "%BATCH_DIR%DAILmain - NG\database" /S /NFL /NDL *.dbr
robocopy "%BATCH_DIR%DAIL\database" "%BATCH_DIR%DAILmain - A NG\database" /S /NFL /NDL *.dbr *.tpl
robocopy "%BATCH_DIR%DAIL\database" "%BATCH_DIR%DAILmain - X\database" /S /NFL /NDL *.dbr *.tpl /xf gameengine.dbr
robocopy "%BATCH_DIR%DAIL\source\scripts" "%BATCH_DIR%DAILmain - X\source\scripts" /S /NFL /NDL *.dbr *.tpl /xf gameengine.dbr
robocopy "%BATCH_DIR%DAIL\database" "%BATCH_DIR%DAILmain - AX\database" /S /NFL /NDL *.dbr *.tpl /xf gameengine.dbr
copy "%BATCH_DIR%DAIL - X\database\records\game\gameengine.dbr" "%BATCH_DIR%X\database\records\game" /y
copy "%BATCH_DIR%DAIL\source\scripts\Omega_Mod\DAIL.lua" "%BATCH_DIR%DAIL - RIFT\source\scripts\Omega_Mod" /y

rem restore super loot tables for x mode
robocopy "%BATCH_DIR%VanillaBak\X_loot" "%BATCH_DIR%DAILmain - X\database\records\items" /S /NFL /NDL *.dbr
robocopy "%BATCH_DIR%VanillaBak\X_loot" "%BATCH_DIR%DAILmain - AX\database\records\items" /S /NFL /NDL *.dbr
robocopy "%BATCH_DIR%VanillaBak\X_bossmerge" "%BATCH_DIR%DAILmain - X\database\records\creatures\enemies" /S /NFL /NDL *.dbr
robocopy "%BATCH_DIR%VanillaBak\X_bossmerge" "%BATCH_DIR%DAILmain - AX\database\records\creatures\enemies" /S /NFL /NDL *.dbr

rem text_en replication
copy "%BATCH_DIR%DAIL\source\text_en\tags_skills.txt" "%BATCH_DIR%DAILmain - S\source\text_en" /y
copy "%BATCH_DIR%DAIL\assets\text_en\tags_skills.txt" "%BATCH_DIR%DAILmain - S\assets\text_en" /y
copy "%BATCH_DIR%DAIL\source\text_en\DAIL_hybrid_tags.txt" "%BATCH_DIR%DAILmain - S\source\text_en" /y
copy "%BATCH_DIR%DAIL\assets\text_en\DAIL_hybrid_tags.txt" "%BATCH_DIR%DAILmain - S\assets\text_en" /y

rem specific script replication
robocopy "%BATCH_DIR%DAIL\source\scripts" "%BATCH_DIR%DAILmain - X\source\scripts" /S /NFL /NDL *.dbr
copy "%BATCH_DIR%DAILmain - X\source\scripts\Omega_Mod\DAIL.lua.bak" "%BATCH_DIR%DAILmain - X\source\scripts\Omega_Mod\DAIL.lua" /y
robocopy "%BATCH_DIR%DAIL\source\scripts" "%BATCH_DIR%DAILmain - S\source\scripts" /S /NFL /NDL *.dbr
robocopy "%BATCH_DIR%DAIL\assets\scripts" "%BATCH_DIR%DAILmain - X\assets\scripts" /S /NFL /NDL *.dbr
robocopy "%BATCH_DIR%DAIL\assets\scripts" "%BATCH_DIR%DAILmain - S\assets\scripts" /S /NFL /NDL *.dbr
rem copy "%BATCH_DIR%DAIL\source\scripts\Omega_Mod\Omega_scripts.lua" "%BATCH_DIR%DAILmain - S\source\scripts\Omega_Mod" /y
rem copy "%BATCH_DIR%DAIL\source\scripts\Omega_Mod\Omega_scripts.lua" "%BATCH_DIR%DAILmain - X\source\scripts\Omega_Mod" /y
rem copy "%BATCH_DIR%DAIL\source\scripts\Game\quests\devilscrossing.lua" "%BATCH_DIR%DAILmain - S\source\scripts\Game\quests" /y
rem copy "%BATCH_DIR%DAIL\source\scripts\Omega_Mod\DAIL.lua" "%BATCH_DIR%DAILmain - S\source\scripts\Omega_Mod" /y
rem copy "%BATCH_DIR%DAIL\source\scripts\Game\quests\devilscrossing.lua" "%BATCH_DIR%DAILmain - S\source\scripts\Game\quests" /y
rem copy "%BATCH_DIR%DAIL\assets\scripts\Game\quests\devilscrossing.lua" "%BATCH_DIR%DAILmain - X\assets\scripts\Game\quests" /y
rem %BATCH_DIR%DAILmain - X\source\scripts\Omega_Mod

rem specific DBR replication
copy "%BATCH_DIR%DAIL\database\records\creatures\pc\anm_femalepc.dbr" "%BATCH_DIR%DAIL - SURVIVAL\database\records\creatures\pc" /y
copy "%BATCH_DIR%DAIL\database\records\creatures\pc\anm_malepc.dbr" "%BATCH_DIR%DAIL - SURVIVAL\database\records\creatures\pc" /y
copy "%BATCH_DIR%DAIL\database\records\creatures\pc\FemalePC01.dbr" "%BATCH_DIR%DAIL - SURVIVAL\database\records\creatures\pc" /y
copy "%BATCH_DIR%DAIL\database\records\creatures\pc\FemalePC01.dbr" "%BATCH_DIR%DAIL - RIFT\database\records\creatures\pc" /y
copy "%BATCH_DIR%DAIL\database\records\creatures\pc\MalePC01.dbr" "%BATCH_DIR%DAIL - SURVIVAL\database\records\creatures\pc" /y
copy "%BATCH_DIR%DAIL\database\records\creatures\pc\MalePC01.dbr" "%BATCH_DIR%DAIL - RIFT\database\records\creatures\pc" /y
copy "%BATCH_DIR%DAIL\database\records\creatures\pc\playerlevels.dbr" "%BATCH_DIR%DAIL - RIFT\database\records\creatures\pc" /y
copy "%BATCH_DIR%DAIL\database\records\creatures\pc\playerlevels.dbr" "%BATCH_DIR%DAIL - SURVIVAL\database\records\creatures\pc" /y

rem ASSET REPLICATION
robocopy "%BATCH_DIR%DAIL\source\effects" "%BATCH_DIR%DAIL - RIFT\source\effects" /S /NFL /NDL
robocopy "%BATCH_DIR%DAIL\source\effects" "%BATCH_DIR%DAIL - SURVIVAL\source\effects" /S /NFL /NDL
robocopy "%BATCH_DIR%DAIL\assets\effects" "%BATCH_DIR%DAIL - RIFT\assets\effects" /S /NFL /NDL
robocopy "%BATCH_DIR%DAIL\assets\effects" "%BATCH_DIR%DAIL - SURVIVAL\assets\effects" /S /NFL /NDL

robocopy "%BATCH_DIR%DAIL\source\ingameui" "%BATCH_DIR%DAIL - RIFT\source\ingameui" /S /NFL /NDL
robocopy "%BATCH_DIR%DAIL\source\ingameui" "%BATCH_DIR%DAIL - SURVIVAL\source\ingameui" /S /NFL /NDL
robocopy "%BATCH_DIR%DAIL\assets\ingameui" "%BATCH_DIR%DAIL - RIFT\assets\ingameui" /S /NFL /NDL
robocopy "%BATCH_DIR%DAIL\assets\ingameui" "%BATCH_DIR%DAIL - SURVIVAL\assets\ingameui" /S /NFL /NDL

robocopy "%BATCH_DIR%DAIL\source\sounds" "%BATCH_DIR%DAIL - RIFT\source\sounds" /S /NFL /NDL
robocopy "%BATCH_DIR%DAIL\source\sounds" "%BATCH_DIR%DAIL - SURVIVAL\source\sounds" /S /NFL /NDL
robocopy "%BATCH_DIR%DAIL\assets\sounds" "%BATCH_DIR%DAIL - RIFT\assets\sounds" /S /NFL /NDL
robocopy "%BATCH_DIR%DAIL\assets\sounds" "%BATCH_DIR%DAIL - SURVIVAL\assets\sounds" /S /NFL /NDL

robocopy "%BATCH_DIR%DAIL\source\soundeffects" "%BATCH_DIR%DAIL - RIFT\source\soundeffects" /S /NFL /NDL
robocopy "%BATCH_DIR%DAIL\source\soundeffects" "%BATCH_DIR%DAIL - SURVIVAL\source\soundeffects" /S /NFL /NDL
robocopy "%BATCH_DIR%DAIL\assets\soundeffects" "%BATCH_DIR%DAIL - RIFT\assets\soundeffects" /S /NFL /NDL
robocopy "%BATCH_DIR%DAIL\assets\soundeffects" "%BATCH_DIR%DAIL - SURVIVAL\assets\soundeffects" /S /NFL /NDL

robocopy "%BATCH_DIR%DAIL\source\xpack" "%BATCH_DIR%DAIL - RIFT\source\xpack" /S /NFL /NDL
robocopy "%BATCH_DIR%DAIL\source\xpack" "%BATCH_DIR%DAIL - SURVIVAL\source\xpack" /S /NFL /NDL
robocopy "%BATCH_DIR%DAIL\assets\xpack" "%BATCH_DIR%DAIL - RIFT\assets\xpack" /S /NFL /NDL
robocopy "%BATCH_DIR%DAIL\assets\xpack" "%BATCH_DIR%DAIL - SURVIVAL\assets\xpack" /S /NFL /NDL

robocopy "%BATCH_DIR%DAIL\source\text_en" "%BATCH_DIR%DAIL - RIFT\source\text_en" /S /NFL /NDL
robocopy "%BATCH_DIR%DAIL\source\text_en" "%BATCH_DIR%DAIL - SURVIVAL\source\text_en" /S /NFL /NDL
robocopy "%BATCH_DIR%DAIL\assets\text_en" "%BATCH_DIR%DAIL - RIFT\assets\text_en" /S /NFL /NDL
robocopy "%BATCH_DIR%DAIL\assets\text_en" "%BATCH_DIR%DAIL - SURVIVAL\assets\text_en" /S /NFL /NDL

robocopy "%BATCH_DIR%DAIL\source\textures" "%BATCH_DIR%DAIL - RIFT\source\textures" /S /NFL /NDL
robocopy "%BATCH_DIR%DAIL\source\textures" "%BATCH_DIR%DAIL - SURVIVAL\source\textures" /S /NFL /NDL
robocopy "%BATCH_DIR%DAIL\assets\textures" "%BATCH_DIR%DAIL - RIFT\assets\textures" /S /NFL /NDL
robocopy "%BATCH_DIR%DAIL\assets\textures" "%BATCH_DIR%DAIL - SURVIVAL\assets\textures" /S /NFL /NDL

robocopy "%BATCH_DIR%DAIL\source\wanez" "%BATCH_DIR%DAIL - RIFT\source\wanez" /S /NFL /NDL
robocopy "%BATCH_DIR%DAIL\source\wanez" "%BATCH_DIR%DAIL - SURVIVAL\source\wanez" /S /NFL /NDL
robocopy "%BATCH_DIR%DAIL\assets\wanez" "%BATCH_DIR%DAIL - RIFT\assets\wanez" /S /NFL /NDL
robocopy "%BATCH_DIR%DAIL\assets\wanez" "%BATCH_DIR%DAIL - SURVIVAL\assets\wanez" /S /NFL /NDL

robocopy "%BATCH_DIR%DAIL\source\Custom" "%BATCH_DIR%DAIL - RIFT\source\Custom" /S /NFL /NDL
robocopy "%BATCH_DIR%DAIL\source\Custom" "%BATCH_DIR%DAIL - SURVIVAL\source\Custom" /S /NFL /NDL
robocopy "%BATCH_DIR%DAIL\assets\Custom" "%BATCH_DIR%DAIL - RIFT\assets\Custom" /S /NFL /NDL
robocopy "%BATCH_DIR%DAIL\assets\Custom" "%BATCH_DIR%DAIL - SURVIVAL\assets\Custom" /S /NFL /NDL

robocopy "%BATCH_DIR%DAIL\assets\meshes" "%BATCH_DIR%DAIL - RIFT\assets\meshes" /S /NFL /NDL
robocopy "%BATCH_DIR%DAIL\assets\meshes" "%BATCH_DIR%DAIL - SURVIVAL\assets\meshes" /S /NFL /NDL
robocopy "%BATCH_DIR%DAIL\source\meshes" "%BATCH_DIR%DAIL - RIFT\source\meshes" /S /NFL /NDL
robocopy "%BATCH_DIR%DAIL\source\meshes" "%BATCH_DIR%DAIL - SURVIVAL\source\meshes" /S /NFL /NDL

robocopy "%BATCH_DIR%DAIL\source\ui" "%BATCH_DIR%DAIL - RIFT\source\ui" /S /NFL /NDL
robocopy "%BATCH_DIR%DAIL\source\ui" "%BATCH_DIR%DAIL - SURVIVAL\source\ui" /S /NFL /NDL
robocopy "%BATCH_DIR%DAIL\assets\ui" "%BATCH_DIR%DAIL - RIFT\assets\ui" /S /NFL /NDL
robocopy "%BATCH_DIR%DAIL\assets\ui" "%BATCH_DIR%DAIL - SURVIVAL\assets\ui" /S /NFL /NDL

robocopy "%BATCH_DIR%DAIL\source\fx" "%BATCH_DIR%DAIL - RIFT\source\fx" /S /NFL /NDL
robocopy "%BATCH_DIR%DAIL\source\fx" "%BATCH_DIR%DAIL - SURVIVAL\source\fx" /S /NFL /NDL
robocopy "%BATCH_DIR%DAIL\assets\fx" "%BATCH_DIR%DAIL - RIFT\assets\fx" /S /NFL /NDL
robocopy "%BATCH_DIR%DAIL\assets\fx" "%BATCH_DIR%DAIL - SURVIVAL\assets\fx" /S /NFL /NDL

rem DATABASE REPLICATION
robocopy "%BATCH_DIR%DAIL\database\DAIL" "%BATCH_DIR%DAIL - RIFT\database\DAIL" /S /NFL /NDL
robocopy "%BATCH_DIR%DAIL\database\DAIL" "%BATCH_DIR%DAIL - SURVIVAL\database\DAIL" /S /NFL /NDL

robocopy "%BATCH_DIR%DAIL\database\records\sounds" "%BATCH_DIR%DAIL - RIFT\database\records\sounds" /S /NFL /NDL /xf crafting_table.dbr
robocopy "%BATCH_DIR%DAIL\database\records\sounds" "%BATCH_DIR%DAIL - SURVIVAL\database\records\sounds" /S /NFL /NDL /xf crafting_table.dbr

robocopy "%BATCH_DIR%DAIL\database\records\items" "%BATCH_DIR%DAIL - RIFT\database\records\items" /S /NFL /NDL /xf crafting_table.dbr d01_chesthero_all_01.dbr
robocopy "%BATCH_DIR%DAIL\database\records\items" "%BATCH_DIR%DAIL - SURVIVAL\database\records\items" /S /NFL /NDL /xf crafting_table.dbr d01_chesthero_all_01.dbr

robocopy "%BATCH_DIR%DAIL\database\records\effects" "%BATCH_DIR%DAIL - RIFT\database\records\effects" /S /NFL /NDL /xf crafting_table.dbr
robocopy "%BATCH_DIR%DAIL\database\records\effects" "%BATCH_DIR%DAIL - SURVIVAL\database\records\effects" /S /NFL /NDL /xf crafting_table.dbr

robocopy "%BATCH_DIR%DAIL\database\records\xpack" "%BATCH_DIR%DAIL - RIFT\database\records\xpack" /S /NFL /NDL /xf crafting_table.dbr
robocopy "%BATCH_DIR%DAIL\database\records\xpack" "%BATCH_DIR%DAIL - SURVIVAL\database\records\xpack" /S /NFL /NDL /xf crafting_table.dbr

robocopy "%BATCH_DIR%DAIL\database\records\ui" "%BATCH_DIR%DAIL - RIFT\database\records\ui" /S /NFL /NDL /xf crafting_table.dbr
robocopy "%BATCH_DIR%DAIL\database\records\ui" "%BATCH_DIR%DAIL - SURVIVAL\database\records\ui" /S /NFL /NDL /xf crafting_table.dbr

robocopy "%BATCH_DIR%DAIL\database\records\creatures" "%BATCH_DIR%DAIL - RIFT\database\records\creatures" /S /NFL /NDL /xf crafting_table.dbr
robocopy "%BATCH_DIR%DAIL\database\records\creatures" "%BATCH_DIR%DAIL - SURVIVAL\database\records\creatures" /S /NFL /NDL /xf crafting_table.dbr

robocopy "%BATCH_DIR%DAIL\database\records\mod_wanez" "%BATCH_DIR%DAIL - RIFT\database\records\mod_wanez" /S /NFL /NDL
robocopy "%BATCH_DIR%DAIL\database\records\mod_wanez" "%BATCH_DIR%DAIL - SURVIVAL\database\records\mod_wanez" /S /NFL /NDL

robocopy "%BATCH_DIR%DAIL\database\DAIL" "%BATCH_DIR%DAIL - RIFT\database\DAIL" /S /NFL /NDL
robocopy "%BATCH_DIR%DAIL\database\DAIL" "%BATCH_DIR%DAIL - SURVIVAL\database\DAIL" /S /NFL /NDL

robocopy "%BATCH_DIR%DAIL\database\records\controllers" "%BATCH_DIR%DAIL - RIFT\database\records\controllers" /S /NFL /NDL
robocopy "%BATCH_DIR%DAIL\database\records\controllers" "%BATCH_DIR%DAIL - SURVIVAL\database\records\controllers" /S /NFL /NDL

robocopy "%BATCH_DIR%DAIL\database\records\interactive" "%BATCH_DIR%DAIL - RIFT\database\records\interactive" /S /NFL /NDL
robocopy "%BATCH_DIR%DAIL\database\records\interactive" "%BATCH_DIR%DAIL - SURVIVAL\database\records\interactive" /S /NFL /NDL

robocopy "%BATCH_DIR%DAIL\database\records\fx" "%BATCH_DIR%DAIL - RIFT\database\records\fx" /S /NFL /NDL
robocopy "%BATCH_DIR%DAIL\database\records\fx" "%BATCH_DIR%DAIL - SURVIVAL\database\records\fx" /S /NFL /NDL

robocopy "%BATCH_DIR%DAIL\database\records\sfx" "%BATCH_DIR%DAIL - RIFT\database\records\sfx" /S /NFL /NDL
robocopy "%BATCH_DIR%DAIL\database\records\sfx" "%BATCH_DIR%DAIL - SURVIVAL\database\records\sfx" /S /NFL /NDL

robocopy "%BATCH_DIR%DAIL\database\records\skills" "%BATCH_DIR%DAIL - RIFT\database\records\skills" /S /NFL /NDL
robocopy "%BATCH_DIR%DAIL\database\records\skills" "%BATCH_DIR%DAIL - SURVIVAL\database\records\skills" /S /NFL /NDL

rem build SX and ASX mode
robocopy "%BATCH_DIR%DAILmain - X\database" "%BATCH_DIR%DAILmain - SX\database" /S /NFL /NDL /MIR *.dbr
robocopy "%BATCH_DIR%DAILmain - AX\database" "%BATCH_DIR%DAILmain - ASX\database" /S /NFL /NDL /MIR *.dbr
rem grab the limit_unlimited.dbr from S mode
copy ".\DAILmain - S\database\records\proxies\proxypoolequation_01.dbr" ".\DAILmain - SX\database\records\proxies\proxypoolequation_01.dbr" /y
copy ".\DAILmain - S\database\records\proxies\proxypoolequation_01.dbr" ".\DAILmain - ASX\database\records\proxies\proxypoolequation_01.dbr" /y
rem grab the tiny spiders from AS
robocopy "%BATCH_DIR%DAILmain - AX\database\records\creatures" "%BATCH_DIR%DAILmain - ASX\database\records\creatures" /S /NFL /NDL