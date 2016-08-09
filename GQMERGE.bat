rem CRATE DLC asset merges
robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\resources/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\survivalmode\resources\/" /S /xf *.arc
robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAILmergeGQ/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\survivalmode\/" /S /xf *.arc
cd survivalmode
cd resources
call updatearcsCRATE.bat


rem cook in the grim quest assets
cd ..
cd ..
robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAILmergeGQ/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\/" /S
cd DAIL
cd resources
call updatearcs.bat

cd ..
cd ..
robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAILmergeGQ/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - RIFT\/" /S
cd "DAIL - RIFT"
cd resources
call updatearcs.bat

cd ..
cd ..
robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAILmergeGQ/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - Survival\/" /S
cd "DAIL - Survival"
cd resources
call updatearcs.bat


echo MAKE SURE YOU CTRL+C HERE
rem MAKE SURE YOU CTRL+C HERE