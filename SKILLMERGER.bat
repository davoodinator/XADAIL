copy "f:\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\source\text_en\tags_skills.txt" "f:\SHTEEM\steamapps\common\Grim Dawn\mods\DAILmain - S\source\text_en\" /y
copy "f:\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\source\text_en\tags_skills.txt" "f:\SHTEEM\steamapps\common\Grim Dawn\mods\DAILmain - B\source\text_en\" /y
copy "f:\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\source\text_en\tags_skills.txt" "f:\SHTEEM\steamapps\common\Grim Dawn\mods\DAILmain - A\source\text_en\" /y
copy "f:\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\source\text_en\tags_skills.txt" "f:\SHTEEM\steamapps\common\Grim Dawn\mods\DAILmain - AB\source\text_en\" /y
copy "f:\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\source\text_en\tags_skills.txt" "f:\SHTEEM\steamapps\common\Grim Dawn\mods\DAILmain - A NG\source\text_en\" /y
copy "f:\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\source\text_en\tags_skills.txt" "f:\SHTEEM\steamapps\common\Grim Dawn\mods\DAILmain - NG\source\text_en\" /y
rem pause

copy "f:\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\database\records\creatures\pc\FemalePC01.dbr" "f:\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - SURVIVAL\database\records\creatures\pc\" /y
copy "f:\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\database\records\creatures\pc\FemalePC01.dbr" "f:\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - RIFT\database\records\creatures\pc\" /y
copy "f:\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\database\records\creatures\pc\MalePC01.dbr" "f:\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - SURVIVAL\database\records\creatures\pc\" /y
copy "f:\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\database\records\creatures\pc\MalePC01.dbr" "f:\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - RIFT\database\records\creatures\pc\" /y
copy "f:\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\database\records\creatures\pc\playerlevels.dbr" "f:\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - RIFT\database\records\creatures\pc\" /y
copy "f:\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\database\records\creatures\pc\playerlevels.dbr" "f:\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - SURVIVAL\database\records\creatures\pc\" /y
rem pause

robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\source\text_en\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - RIFT\source\text_en\/" /S
robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\source\text_en\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - SURVIVAL\source\text_en\/" /S

robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\assets\text_en\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - RIFT\assets\text_en\/" /S
robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\assets\text_en\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - SURVIVAL\assets\text_en\/" /S

robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\source\Custom\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - RIFT\source\Custom\/" /S
robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\source\Custom\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - SURVIVAL\source\Custom\/" /S

robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\assets\Custom\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - RIFT\assets\Custom\/" /S
robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\assets\Custom\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - SURVIVAL\assets\Custom\/" /S


robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\source\ui\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - RIFT\source\ui\/" /S
robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\source\ui\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - SURVIVAL\source\ui\/" /S

robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\assets\ui\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - RIFT\assets\ui\/" /S
robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\assets\ui\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - SURVIVAL\assets\ui\/" /S

robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\source\fx\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - RIFT\source\fx\/" /S
robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\source\fx\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - SURVIVAL\source\fx\/" /S

robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\assets\fx\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - RIFT\assets\fx\/" /S
robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\assets\fx\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - SURVIVAL\assets\fx\/" /S
rem pause

rem robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\assets\ui\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - RIFT\assets\ui\/" /S
rem robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\assets\ui\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - SURVIVAL\assets\ui\/" /S
robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\database\DAIL\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - RIFT\database\DAIL\/" /S
robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\database\DAIL\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - SURVIVAL\database\DAIL\/" /S

robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\database\records\ui\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - RIFT\database\records\ui\/" /S
robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\database\records\ui\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - SURVIVAL\database\records\ui\/" /S

robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\database\records\fx\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - RIFT\database\records\fx\/" /S
robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\database\records\fx\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - SURVIVAL\database\records\fx\/" /S

robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\database\records\sfx\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - RIFT\database\records\sfx\/" /S
robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\database\records\sfx\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - SURVIVAL\database\records\sfx\/" /S

robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\database\records\skills\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - RIFT\database\records\skills\/" /S
robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\database\records\skills\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - SURVIVAL\database\records\skills\/" /S
rem pause