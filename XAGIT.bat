rem prep the root - mirror the root - ignore the subdirs when mirroring
robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\XADAIL\/" *.bat *.txt *.nsi README /MIR /xd *.*

rem copy soft mods
robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\XADAIL\DAIL\/" /NDL /NFL /MIR /S /XO /xf *.arz *.arc *.map *.7z *.debug *.good *.DAIL *.n *.bak
robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - RIFT\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\XADAIL\DAIL - RIFT\/" /NDL /NFL /MIR /S /XO /xf *.arz *.arc *.map *.7z *.debug *.good *.DAIL
robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAIL - Survival\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\XADAIL\DAIL - Survival\/" /NDL /NFL /MIR /S /XO /xf *.arz *.arc *.map *.7z *.debug *.good *.DAIL

rem copy hard mods
robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAILmain - S\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\XADAIL\DAILmain - S\/" /NDL /NFL /MIR /S /XO /xf *.arz *.arc *.7z
robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAILmain - A\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\XADAIL\DAILmain - A\/" /NDL /NFL /MIR /S /XO /xf *.arz *.arc *.7z
robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAILmain - B\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\XADAIL\DAILmain - B\/" /NDL /NFL /MIR /S /XO /xf *.arz *.arc *.7z
robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAILmain - AB\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\XADAIL\DAILmain - AB\/" /NDL /NFL /MIR /S /XO /xf *.arz *.arc *.7z
robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAILmain - AX\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\XADAIL\DAILmain - AX\/" /NDL /NFL /MIR /S /XO /xf *.arz *.arc *.7z
robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAILmain - X\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\XADAIL\DAILmain - X\/" /NDL /NFL /MIR /S /XO /xf *.arz *.arc *.7z
robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAILmain - SX\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\XADAIL\DAILmain - SX\/" /NDL /NFL /MIR /S /XO /xf *.arz *.arc *.7z
robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAILmain - ASX\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\XADAIL\DAILmain - ASX\/" /NDL /NFL /MIR /S /XO /xf *.arz *.arc *.7z
robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAILmain - A NG\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\XADAIL\DAILmain - A NG\/" /NDL /NFL /MIR /S /XO /xf *.arz *.arc *.7z

rem copy hard mod backup for "uninstalling"
rem removed the line because .arz files are >50 megs and github was complaining.. just in case the .arz files get even larger.....
rem robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\VanillaBak\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\XADAIL\VanillaBak\/" /NDL /NFL /MIR /S /XO /xf *.arz *.arc
copy "f:\SHTEEM\steamapps\common\Grim Dawn\mods\VanillaBak\VanillaBak.7z" "f:\SHTEEM\steamapps\common\Grim Dawn\mods\XADAIL\VanillaBak\" /y

rem copy the Grim Quest and TEXT_EN merger files
robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\DAILmergeGQ\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\XADAIL\DAILmergeGQ\/" /NDL /NFL /MIR /S /XO /xf *.arz *.arc *.7z
robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\dailFICULTIES\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\XADAIL\dailFICULTIES\/" /NDL /NFL /MIR /S /XO /xf *.arz *.arc *.7z
robocopy /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\survivalmode\/" /"\localhost\f\SHTEEM\steamapps\common\Grim Dawn\mods\XADAIL\survivalmode\/" /NDL /NFL /MIR /S /XO *.bat
