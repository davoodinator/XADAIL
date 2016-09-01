SET BATCH_DIR=%~dp0

rem sample: 
rem MissingFilesSearch.exe /path:"E:\Working\Grim Dawn\mods\XADAIL-1\DAIL\database" /GrimDawnPath:"E:\Working\Grim Dawn\database"

rem /path path to check
rem /GrimDawnPath path to extracted GD extracted game files
MissingFilesSearch.exe /path:"%BATCH_DIR%DAIL\database" /GrimDawnPath:"E:\Working\Grim Dawn\database"
MissingFilesSearch.exe /path:"%BATCH_DIR%DAIL - Survival\database" /GrimDawnPath:"E:\Working\Grim Dawn\database"