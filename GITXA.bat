call paths

copy "%SOURCE_PATH%\XADAIL\VanillaBak\VanillaBak.7z" "%SOURCE_PATH%\VanillaBak" /y 
copy "%SOURCE_PATH%\XADAIL\DAIL\database\records\ui\skills\30_MasteriesClassSelection.7z" "%SOURCE_PATH%\DAIL\database\records\ui\skills" /y
copy "%SOURCE_PATH%\XADAIL\DAIL\database\records\ui\skills\99_MasteriesClassSelection.7z" "%SOURCE_PATH%\DAIL\database\records\ui\skills" /y
xcopy "%SOURCE_PATH%\XADAIL\MissingFilesSearch.*" "%SOURCE_PATH%" /y /i

rem look ma i can copy _dev_info now!
robocopy "%SOURCE_PATH%\XADAIL\_Dev_info" "%SOURCE_PATH%\_Dev_info"  /xd *.*
robocopy "%SOURCE_PATH%\XADAIL" "%SOURCE_PATH%." *.bat *.txt *.nsi README  /xd *.*
robocopy "%SOURCE_PATH%\XADAIL\DAIL" "%SOURCE_PATH%\DAIL" /NDL /NFL /S  /xf *.arz *.arc *.map *.7z *.debug *.good *.DAIL *.n *.bak
robocopy "%SOURCE_PATH%\XADAIL\DAIL - RIFT" "%SOURCE_PATH%\DAIL - RIFT" /NDL /NFL /S  /xf *.arz *.arc *.map *.7z *.debug *.good *.DAIL
robocopy "%SOURCE_PATH%\XADAIL\DAIL - Survival" "%SOURCE_PATH%\DAIL - Survival" /NDL /NFL /S  /xf *.arz *.arc *.map *.7z *.debug *.good *.DAIL
robocopy "%SOURCE_PATH%\XADAIL\DAILmain - S" "%SOURCE_PATH%\DAILmain - S" /NDL /NFL /S  /xf *.arz *.arc *.7z
robocopy "%SOURCE_PATH%\XADAIL\DAILmain - A" "%SOURCE_PATH%\DAILmain - A" /NDL /NFL /S  /xf *.arz *.arc *.7z
robocopy "%SOURCE_PATH%\XADAIL\DAILmain - B" "%SOURCE_PATH%\DAILmain - B" /NDL /NFL /S  /xf *.arz *.arc *.7z
robocopy "%SOURCE_PATH%\XADAIL\DAILmain - X" "%SOURCE_PATH%\DAILmain - X" /NDL /NFL /S  /xf *.arz *.arc *.7z
robocopy "%SOURCE_PATH%\XADAIL\DAILmergeGQ" "%SOURCE_PATH%\DAILmergeGQ" /NDL /NFL /S  /xf *.arz *.arc *.7z
robocopy "%SOURCE_PATH%\XADAIL\dailFICULTIES" "%SOURCE_PATH%\dailFICULTIES" /NDL /NFL /S  /xf *.arz *.arc *.7z
robocopy "%SOURCE_PATH%\XADAIL\survivalmode" "%SOURCE_PATH%\survivalmode" /NDL /NFL /S  *.bat
