rem cook in the grim quest assets
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

