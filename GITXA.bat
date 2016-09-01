call paths

copy "%SOURCE_PATH%\VanillaBak\VanillaBak.7z" "%SOURCE_PATH%\XADAIL\VanillaBak" /y 
pause
robocopy "%SOURCE_PATH%\XADAIL" "%SOURCE_PATH%." *.bat *.txt *.nsi README /XO /xd *.*
robocopy "%SOURCE_PATH%\XADAIL\DAIL" "%SOURCE_PATH%\DAIL" /NDL /NFL /S /XO /xf *.arz *.arc *.map *.7z *.debug *.good *.DAIL *.n *.bak
robocopy "%SOURCE_PATH%\XADAIL\DAIL - RIFT" "%SOURCE_PATH%\DAIL - RIFT" /NDL /NFL /S /XO /xf *.arz *.arc *.map *.7z *.debug *.good *.DAIL
robocopy "%SOURCE_PATH%\XADAIL\DAIL - Survival" "%SOURCE_PATH%\DAIL - Survival" /NDL /NFL /S /XO /xf *.arz *.arc *.map *.7z *.debug *.good *.DAIL
robocopy "%SOURCE_PATH%\XADAIL\DAILmain - S" "%SOURCE_PATH%\DAILmain - S" /NDL /NFL /S /XO /xf *.arz *.arc *.7z
robocopy "%SOURCE_PATH%\XADAIL\DAILmain - A" "%SOURCE_PATH%\DAILmain - A" /NDL /NFL /S /XO /xf *.arz *.arc *.7z
robocopy "%SOURCE_PATH%\XADAIL\DAILmain - B" "%SOURCE_PATH%\DAILmain - B" /NDL /NFL /S /XO /xf *.arz *.arc *.7z
robocopy "%SOURCE_PATH%\XADAIL\DAILmain - X" "%SOURCE_PATH%\DAILmain - X" /NDL /NFL /S /XO /xf *.arz *.arc *.7z
robocopy "%SOURCE_PATH%\XADAIL\DAILmergeGQ" "%SOURCE_PATH%\DAILmergeGQ" /NDL /NFL /S /XO /xf *.arz *.arc *.7z
robocopy "%SOURCE_PATH%\XADAIL\dailFICULTIES" "%SOURCE_PATH%\dailFICULTIES" /NDL /NFL /S /XO /xf *.arz *.arc *.7z
robocopy "%SOURCE_PATH%\XADAIL\survivalmode" "%SOURCE_PATH%\survivalmode" /NDL /NFL /S /XO *.bat
