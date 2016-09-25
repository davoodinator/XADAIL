SET BATCH_DIR=%~dp0

copy "%BATCH_DIR%XADAIL\VanillaBak\VanillaBak.7z" "%BATCH_DIR%VanillaBak" /y 
copy "%BATCH_DIR%XADAIL\DAIL\database\records\ui\skills\30_MasteriesClassSelection.7z" "%BATCH_DIR%DAIL\database\records\ui\skills" /y
copy "%BATCH_DIR%XADAIL\DAIL\database\records\ui\skills\99_MasteriesClassSelection.7z" "%BATCH_DIR%DAIL\database\records\ui\skills" /y
xcopy "%BATCH_DIR%XADAIL\MissingFilesSearch.*" "c:\program files (x86)\steam\steamapps\common\grim dawn\mods" /y /i

robocopy "%BATCH_DIR%XADAIL\_Dev_info" "%BATCH_DIR%_Dev_info" /xd *.*
robocopy "%BATCH_DIR%XADAIL" "c:\program files (x86)\steam\steamapps\common\grim dawn\mods" *.bat *.txt *.nsi README /xd *.*
robocopy "%BATCH_DIR%XADAIL\DAIL" "%BATCH_DIR%DAIL" /NDL /NFL /S /xf *.arz *.arc *.map *.7z *.debug *.good *.DAIL *.n *.bak
robocopy "%BATCH_DIR%XADAIL\DAIL - RIFT" "%BATCH_DIR%DAIL - RIFT" /NDL /NFL /S /xf *.arz *.arc *.map *.7z *.debug *.good *.DAIL
robocopy "%BATCH_DIR%XADAIL\DAIL - Survival" "%BATCH_DIR%DAIL - Survival" /NDL /NFL /S /xf *.arz *.arc *.map *.7z *.debug *.good *.DAIL
robocopy "%BATCH_DIR%XADAIL\DAILmain - S" "%BATCH_DIR%DAILmain - S" /NDL /NFL /S /xf *.arz *.arc *.7z
robocopy "%BATCH_DIR%XADAIL\DAILmain - A" "%BATCH_DIR%DAILmain - A" /NDL /NFL /S /xf *.arz *.arc *.7z
robocopy "%BATCH_DIR%XADAIL\DAILmain - B" "%BATCH_DIR%DAILmain - B" /NDL /NFL /S /xf *.arz *.arc *.7z
robocopy "%BATCH_DIR%XADAIL\DAILmain - X" "%BATCH_DIR%DAILmain - X" /NDL /NFL /S /xf *.arz *.arc *.7z
robocopy "%BATCH_DIR%XADAIL\DAILmergeGQ" "%BATCH_DIR%DAILmergeGQ" /NDL /NFL /S /xf *.arz *.arc *.7z
robocopy "%BATCH_DIR%XADAIL\dailFICULTIES" "%BATCH_DIR%dailFICULTIES" /NDL /NFL /S /xf *.arz *.arc *.7z
robocopy "%BATCH_DIR%XADAIL\survivalmode" "%BATCH_DIR%survivalmode" /NDL /NFL /S *.bat
