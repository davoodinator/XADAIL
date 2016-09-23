SET BATCH_DIR=%~dp0

copy "%BATCH_DIR%XADAIL\VanillaBak\VanillaBak.7z" "%BATCH_DIR%VanillaBak" /y 
copy "%BATCH_DIR%XADAIL\DAIL\database\records\ui\skills\30_MasteriesClassSelection.7z" "%BATCH_DIR%DAIL\database\records\ui\skills" /y
copy "%BATCH_DIR%XADAIL\DAIL\database\records\ui\skills\99_MasteriesClassSelection.7z" "%BATCH_DIR%DAIL\database\records\ui\skills" /y
xcopy "%BATCH_DIR%XADAIL\MissingFilesSearch.*" "%SOURCE_PATH%" /y /i

rem look ma i can copy _dev_info now!
robocopy "%BATCH_DIR%XADAIL\_Dev_info" "%BATCH_DIR%_Dev_info" /XO /xd *.*
robocopy "%BATCH_DIR%XADAIL" "%SOURCE_PATH%." *.bat *.txt *.nsi README /XO /xd *.*
robocopy "%BATCH_DIR%XADAIL\DAIL" "%BATCH_DIR%DAIL" /NDL /NFL /S /XO /xf *.arz *.arc *.map *.7z *.debug *.good *.DAIL *.n *.bak
robocopy "%BATCH_DIR%XADAIL\DAIL - RIFT" "%BATCH_DIR%DAIL - RIFT" /NDL /NFL /S /XO /xf *.arz *.arc *.map *.7z *.debug *.good *.DAIL
robocopy "%BATCH_DIR%XADAIL\DAIL - Survival" "%BATCH_DIR%DAIL - Survival" /NDL /NFL /S /XO /xf *.arz *.arc *.map *.7z *.debug *.good *.DAIL
robocopy "%BATCH_DIR%XADAIL\DAILmain - S" "%BATCH_DIR%DAILmain - S" /NDL /NFL /S /XO /xf *.arz *.arc *.7z
robocopy "%BATCH_DIR%XADAIL\DAILmain - A" "%BATCH_DIR%DAILmain - A" /NDL /NFL /S /XO /xf *.arz *.arc *.7z
robocopy "%BATCH_DIR%XADAIL\DAILmain - B" "%BATCH_DIR%DAILmain - B" /NDL /NFL /S /XO /xf *.arz *.arc *.7z
robocopy "%BATCH_DIR%XADAIL\DAILmain - X" "%BATCH_DIR%DAILmain - X" /NDL /NFL /S /XO /xf *.arz *.arc *.7z
robocopy "%BATCH_DIR%XADAIL\DAILmergeGQ" "%BATCH_DIR%DAILmergeGQ" /NDL /NFL /S /XO /xf *.arz *.arc *.7z
robocopy "%BATCH_DIR%XADAIL\dailFICULTIES" "%BATCH_DIR%dailFICULTIES" /NDL /NFL /S /XO /xf *.arz *.arc *.7z
robocopy "%BATCH_DIR%XADAIL\survivalmode" "%BATCH_DIR%survivalmode" /NDL /NFL /S /XO *.bat
