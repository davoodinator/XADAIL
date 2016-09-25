SET BATCH_DIR=%~dp0

rem prep the root - mirror the root - ignore the subdirs when mirroring
robocopy "c:\program files (x86)\steam\steamapps\common\grim dawn\mods" "%BATCH_DIR%\XADAIL"  *.bat *.txt *.nsi README /MIR /xd *.* /xf cl*.txt
copy "%BATCH_DIR%\DAIL\database\records\ui\skills\30_MasteriesClassSelection.7z" "%BATCH_DIR%\XADAIL\DAIL\database\records\ui\skills" /y
copy "%BATCH_DIR%\DAIL\database\records\ui\skills\99_MasteriesClassSelection.7z" "%BATCH_DIR%\XADAIL\DAIL\database\records\ui\skills" /y
robocopy "%BATCH_DIR%\_Dev_info" "%BATCH_DIR%\XADAIL\_Dev_info"  /xd *.*

rem copy soft mods
robocopy "%BATCH_DIR%\DAIL" "%BATCH_DIR%\XADAIL\DAIL" /NDL /NFL /MIR /S  /xf *.arz *.arc *.map *.7z *.debug *.good *.DAIL *.n *.bak /XD resources
robocopy "%BATCH_DIR%\DAIL - RIFT" "%BATCH_DIR%\XADAIL\DAIL - RIFT" /NDL /NFL /MIR /S  /xf *.arz *.arc *.map *.7z *.debug *.good *.DAIL /XD resources
robocopy "%BATCH_DIR%\DAIL - Survival" "%BATCH_DIR%\XADAIL\DAIL - Survival" /NDL /NFL /MIR /S  /xf *.arz *.arc *.map *.7z *.debug *.good *.DAIL /XD resources
robocopy "%BATCH_DIR%\DAIL - RIFT\assets" "%BATCH_DIR%\XADAIL\DAIL - RIFT\assets" /NDL /NFL /S  /xf *.arz *.arc *.7z *.debug *.good *.DAIL /XD resources
robocopy "%BATCH_DIR%\DAIL - Survival\assets" "%BATCH_DIR%\XADAIL\DAIL - Survival\assets" /NDL /NFL /S  /xf *.arz *.arc *.7z *.debug *.good *.DAIL /XD resources

rem copy hard mods
robocopy "%BATCH_DIR%\DAILmain - S" "%BATCH_DIR%\XADAIL\DAILmain - S" /NDL /NFL /MIR /S  /xf *.arz *.arc *.7z /XD resources
robocopy "%BATCH_DIR%\DAILmain - A" "%BATCH_DIR%\XADAIL\DAILmain - A" /NDL /NFL /MIR /S  /xf *.arz *.arc *.7z /XD resources
robocopy "%BATCH_DIR%\DAILmain - B" "%BATCH_DIR%\XADAIL\DAILmain - B" /NDL /NFL /MIR /S  /xf *.arz *.arc *.7z /XD resources
rem robocopy "%BATCH_DIR%\DAILmain - AB" "%BATCH_DIR%\XADAIL\DAILmain - AB" /NDL /NFL /MIR /S  /xf *.arz *.arc *.7z
rem robocopy "%BATCH_DIR%\DAILmain - AX" "%BATCH_DIR%\XADAIL\DAILmain - AX" /NDL /NFL /MIR /S  /xf *.arz *.arc *.7z
robocopy "%BATCH_DIR%\DAILmain - X" "%BATCH_DIR%\XADAIL\DAILmain - X" /NDL /NFL /MIR /S  /xf *.arz *.arc *.7z /XD resources
rem robocopy "%BATCH_DIR%\DAILmain - SX" "%BATCH_DIR%\XADAIL\DAILmain - SX" /NDL /NFL /MIR /S  /xf *.arz *.arc *.7z
rem robocopy "%BATCH_DIR%\DAILmain - ASX" "%BATCH_DIR%\XADAIL\DAILmain - ASX" /NDL /NFL /MIR /S  /xf *.arz *.arc *.7z
rem robocopy "%BATCH_DIR%\DAILmain - A NG" "%BATCH_DIR%\XADAIL\DAILmain - A NG" /NDL /NFL /MIR /S  /xf *.arz *.arc *.7z

rem copy hard mod backup for "uninstalling"
rem removed the line because .arz files are >50 megs and github was complaining.. just in case the .arz files get even larger.....
rem robocopy "%BATCH_DIR%\VanillaBak" "%BATCH_DIR%\XADAIL\VanillaBak" /NDL /NFL /MIR /S  /xf *.arz *.arc
copy "%BATCH_DIR%\VanillaBak\VanillaBak.7z" "%BATCH_DIR%\XADAIL\VanillaBak" /y

rem copy the Grim Quest and TEXT_EN merger files
robocopy "%BATCH_DIR%\DAILmergeGQ" "%BATCH_DIR%\XADAIL\DAILmergeGQ" /NDL /NFL /MIR /S  /xf *.arz *.arc *.7z
robocopy "%BATCH_DIR%\dailFICULTIES" "%BATCH_DIR%\XADAIL\dailFICULTIES" /NDL /NFL /MIR /S  /xf *.arz *.arc *.7z
robocopy "%BATCH_DIR%\survivalmode" "%BATCH_DIR%\XADAIL\survivalmode" /NDL /NFL /MIR /S  *.bat
