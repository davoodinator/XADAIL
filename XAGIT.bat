call paths

rem prep the root - mirror the root - ignore the subdirs when mirroring
robocopy "%SOURCE_PATH%\" "%SOURCE_PATH%\XADAIL" /XO *.bat *.txt *.nsi README /MIR /xd *.* /xf cl*.txt
copy "%SOURCE_PATH%\DAIL\database\records\ui\skills\30_MasteriesClassSelection.7z" "%SOURCE_PATH%\XADAIL\DAIL\database\records\ui\skills" /y
copy "%SOURCE_PATH%\DAIL\database\records\ui\skills\99_MasteriesClassSelection.7z" "%SOURCE_PATH%\XADAIL\DAIL\database\records\ui\skills" /y

rem copy soft mods
robocopy "%SOURCE_PATH%\DAIL" "%SOURCE_PATH%\XADAIL\DAIL" /NDL /NFL /MIR /S /XO /xf *.arz *.arc *.map *.7z *.debug *.good *.DAIL *.n *.bak
robocopy "%SOURCE_PATH%\DAIL - RIFT" "%SOURCE_PATH%\XADAIL\DAIL - RIFT" /NDL /NFL /MIR /S /XO /xf *.arz *.arc *.map *.7z *.debug *.good *.DAIL
robocopy "%SOURCE_PATH%\DAIL - Survival" "%SOURCE_PATH%\XADAIL\DAIL - Survival" /NDL /NFL /MIR /S /XO /xf *.arz *.arc *.map *.7z *.debug *.good *.DAIL

rem copy hard mods
robocopy "%SOURCE_PATH%\DAILmain - S" "%SOURCE_PATH%\XADAIL\DAILmain - S" /NDL /NFL /MIR /S /XO /xf *.arz *.arc *.7z
robocopy "%SOURCE_PATH%\DAILmain - A" "%SOURCE_PATH%\XADAIL\DAILmain - A" /NDL /NFL /MIR /S /XO /xf *.arz *.arc *.7z
robocopy "%SOURCE_PATH%\DAILmain - B" "%SOURCE_PATH%\XADAIL\DAILmain - B" /NDL /NFL /MIR /S /XO /xf *.arz *.arc *.7z
rem robocopy "%SOURCE_PATH%\DAILmain - AB" "%SOURCE_PATH%\XADAIL\DAILmain - AB" /NDL /NFL /MIR /S /XO /xf *.arz *.arc *.7z
rem robocopy "%SOURCE_PATH%\DAILmain - AX" "%SOURCE_PATH%\XADAIL\DAILmain - AX" /NDL /NFL /MIR /S /XO /xf *.arz *.arc *.7z
robocopy "%SOURCE_PATH%\DAILmain - X" "%SOURCE_PATH%\XADAIL\DAILmain - X" /NDL /NFL /MIR /S /XO /xf *.arz *.arc *.7z
rem robocopy "%SOURCE_PATH%\DAILmain - SX" "%SOURCE_PATH%\XADAIL\DAILmain - SX" /NDL /NFL /MIR /S /XO /xf *.arz *.arc *.7z
rem robocopy "%SOURCE_PATH%\DAILmain - ASX" "%SOURCE_PATH%\XADAIL\DAILmain - ASX" /NDL /NFL /MIR /S /XO /xf *.arz *.arc *.7z
rem robocopy "%SOURCE_PATH%\DAILmain - A NG" "%SOURCE_PATH%\XADAIL\DAILmain - A NG" /NDL /NFL /MIR /S /XO /xf *.arz *.arc *.7z

rem copy hard mod backup for "uninstalling"
rem removed the line because .arz files are >50 megs and github was complaining.. just in case the .arz files get even larger.....
rem robocopy "%SOURCE_PATH%\VanillaBak" "%SOURCE_PATH%\XADAIL\VanillaBak" /NDL /NFL /MIR /S /XO /xf *.arz *.arc
copy "%SOURCE_PATH%\VanillaBak\VanillaBak.7z" "%SOURCE_PATH%\XADAIL\VanillaBak" /y

rem copy the Grim Quest and TEXT_EN merger files
robocopy "%SOURCE_PATH%\DAILmergeGQ" "%SOURCE_PATH%\XADAIL\DAILmergeGQ" /NDL /NFL /MIR /S /XO /xf *.arz *.arc *.7z
robocopy "%SOURCE_PATH%\dailFICULTIES" "%SOURCE_PATH%\XADAIL\dailFICULTIES" /NDL /NFL /MIR /S /XO /xf *.arz *.arc *.7z
robocopy "%SOURCE_PATH%\survivalmode" "%SOURCE_PATH%\XADAIL\survivalmode" /NDL /NFL /MIR /S /XO *.bat
