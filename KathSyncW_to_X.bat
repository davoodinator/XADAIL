@Echo on
rem set %SOURCE_PATH% ="c:\program files (x86)\steam\steamapps\common\grim dawn\mods" 

rem prep the root - mirror the root - ignore the subdirs when mirroring
robocopy "c:\program files (x86)\steam\steamapps\common\grim dawn\mods" "c:\program files (x86)\steam\steamapps\common\grim dawn\mods\XADAIL" /XO *.bat *.txt *.nsi README /MIR /xd *.*
robocopy "c:\program files (x86)\steam\steamapps\common\grim dawn\mods\_Dev_Info" "c:\program files (x86)\steam\steamapps\common\grim dawn\mods\XADAIL\_Dev_Info" /NDL /NFL /S /XO

PAUSE
rem copy soft mods
robocopy "c:\program files (x86)\steam\steamapps\common\grim dawn\mods\DAIL" "c:\program files (x86)\steam\steamapps\common\grim dawn\mods\XADAIL\DAIL" /NDL /NFL /MIR /S /XO /xf *.arz *.arc *.map *.7z *.debug *.good *.DAIL *.n *.bak
rem robocopy "c:\program files (x86)\steam\steamapps\common\grim dawn\mods\DAIL - RIFT" "c:\program files (x86)\steam\steamapps\common\grim dawn\mods\XADAIL\DAIL - RIFT" /NDL /NFL /MIR /S /XO /xf *.arz *.arc *.map *.7z *.debug *.good *.DAIL
rem robocopy "c:\program files (x86)\steam\steamapps\common\grim dawn\mods\DAIL - Survival" "c:\program files (x86)\steam\steamapps\common\grim dawn\mods\XADAIL\DAIL - Survival" /NDL /NFL /MIR /S /XO /xf *.arz *.arc *.map *.7z *.debug *.good *.DAIL

rem copy hard mods
rem robocopy "c:\program files (x86)\steam\steamapps\common\grim dawn\mods\DAILmain - S" "%SOURCE_PATH%\XADAIL\DAILmain - S" /NDL /NFL /MIR /S /XO /xf *.arz *.arc *.7z
rem robocopy "c:\program files (x86)\steam\steamapps\common\grim dawn\mods\DAILmain - A" "%SOURCE_PATH%\XADAIL\DAILmain - A" /NDL /NFL /MIR /S /XO /xf *.arz *.arc *.7z
rem robocopy "c:\program files (x86)\steam\steamapps\common\grim dawn\mods\DAILmain - B" "%SOURCE_PATH%\XADAIL\DAILmain - B" /NDL /NFL /MIR /S /XO /xf *.arz *.arc *.7z
rem robocopy "c:\program files (x86)\steam\steamapps\common\grim dawn\mods\DAILmain - AB" "%SOURCE_PATH%\XADAIL\DAILmain - AB" /NDL /NFL /MIR /S /XO /xf *.arz *.arc *.7z
rem robocopy "c:\program files (x86)\steam\steamapps\common\grim dawn\mods\DAILmain - AX" "%SOURCE_PATH%\XADAIL\DAILmain - AX" /NDL /NFL /MIR /S /XO /xf *.arz *.arc *.7z
rem robocopy "c:\program files (x86)\steam\steamapps\common\grim dawn\mods\DAILmain - X" "%SOURCE_PATH%\XADAIL\DAILmain - X" /NDL /NFL /MIR /S /XO /xf *.arz *.arc *.7z
rem robocopy "c:\program files (x86)\steam\steamapps\common\grim dawn\mods\DAILmain - SX" "%SOURCE_PATH%\XADAIL\DAILmain - SX" /NDL /NFL /MIR /S /XO /xf *.arz *.arc *.7z
rem robocopy "c:\program files (x86)\steam\steamapps\common\grim dawn\mods\DAILmain - ASX" "%SOURCE_PATH%\XADAIL\DAILmain - ASX" /NDL /NFL /MIR /S /XO /xf *.arz *.arc *.7z
rem robocopy "c:\program files (x86)\steam\steamapps\common\grim dawn\mods\DAILmain - A NG" "%SOURCE_PATH%\XADAIL\DAILmain - A NG" /NDL /NFL /MIR /S /XO /xf *.arz *.arc *.7z

rem copy hard mod backup for "uninstalling"
rem removed the line because .arz files are >50 megs and github was complaining.. just in case the .arz files get even larger.....
rem robocopy "%SOURCE_PATH%\VanillaBak" "%SOURCE_PATH%\XADAIL\VanillaBak" /NDL /NFL /MIR /S /XO /xf *.arz *.arc
rem copy "c:\program files (x86)\steam\steamapps\common\grim dawn\modsVanillaBak\VanillaBak.7z" "%SOURCE_PATH%\XADAIL\VanillaBak" /y

rem copy the Grim Quest and TEXT_EN merger files
rem robocopy "c:\program files (x86)\steam\steamapps\common\grim dawn\mods" "c:\program files (x86)\steam\steamapps\common\grim dawn\mods\XADAIL\DAILmergeGQ" /NDL /NFL /MIR /S /XO /xf *.arz *.arc *.7z
rem robocopy "c:\program files (x86)\steam\steamapps\common\grim dawn\mods" "c:\program files (x86)\steam\steamapps\common\grim dawn\mods\XADAIL\dailFICULTIES" /NDL /NFL /MIR /S /XO /xf *.arz *.arc *.7z
rem robocopy "c:\program files (x86)\steam\steamapps\common\grim dawn\mods" "c:\program files (x86)\steam\steamapps\common\grim dawn\mods\XADAIL\survivalmode" /NDL /NFL /MIR /S /XO *.bat
PAUSE