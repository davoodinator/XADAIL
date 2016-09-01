@ECHO OFF
SET BATCH_DIR=%~dp0

for %%a in (.) do set currentfolder=%%~na
echo %currentfolder%

IF "%currentfolder%" == "mods" (
SET SOURCE_PATH=%BATCH_DIR%
)

IF "%currentfolder%" == "XADAIL" (
CALL :PREV_FOLDER
)

ECHO SOURCE_PATH SET TO %SOURCE_PATH%

GOTO :EOF

:PREV_FOLDER
CD..
SET SOURCE_PATH=%CD%
CD %BATCH_DIR%
GOTO :EOF
