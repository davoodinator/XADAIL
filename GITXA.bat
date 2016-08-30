copy "f:\SHTEEM\steamapps\common\Grim Dawn\mods\VanillaBak\VanillaBak.7z" "f:\SHTEEM\steamapps\common\Grim Dawn\mods\XADAIL\VanillaBak\" /y 
robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\XADAIL\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\/" *.bat *.txt *.nsi README /XO /xd *.*
robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\XADAIL\DAIL\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\/" /NDL /NFL /S /XO /xf *.arz *.arc *.map *.7z *.debug *.good *.DAIL *.n *.bak
robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\XADAIL\DAIL - RIFT\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - RIFT\/" /NDL /NFL /S /XO /xf *.arz *.arc *.map *.7z *.debug *.good *.DAIL
robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\XADAIL\DAIL - Survival\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - Survival\/" /NDL /NFL /S /XO /xf *.arz *.arc *.map *.7z *.debug *.good *.DAIL
robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\XADAIL\DAILmain - S\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAILmain - S\/" /NDL /NFL /S /XO /xf *.arz *.arc *.7z
robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\XADAIL\DAILmain - A\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAILmain - A\/" /NDL /NFL /S /XO /xf *.arz *.arc *.7z
robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\XADAIL\DAILmain - B\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAILmain - B\/" /NDL /NFL /S /XO /xf *.arz *.arc *.7z
robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\XADAIL\DAILmain - X\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAILmain - X\/" /NDL /NFL /S /XO /xf *.arz *.arc *.7z
robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\XADAIL\DAILmergeGQ\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAILmergeGQ\/" /NDL /NFL /S /XO /xf *.arz *.arc *.7z
robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\XADAIL\dailFICULTIES\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\dailFICULTIES\/" /NDL /NFL /S /XO /xf *.arz *.arc *.7z
robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\XADAIL\survivalmode\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\survivalmode\/" /NDL /NFL /S /XO *.bat
