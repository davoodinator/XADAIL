@ECHO OFF
REM batch to extract mod projects

SET REG_KEY=HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Steam App 219990
SET VALUE_NAME=InstallLocation
FOR /F "tokens=2*" %%A IN ('REG.exe query "%REG_KEY%" /v "%VALUE_NAME%"') DO (set pInstallDir=%%B)
echo %pInstallDir%

call :ExtractArcFiles
call :ExtractArzFiles

goto :EOF

:ExtractArcFiles
for /r %%i in (*.arc) do ( 
echo Extracting %%i
FOR %%j IN ("%%i") DO (
"%pInstallDir%\archivetool.exe" "%%i" -extract "%%~dj%%~pj\."
)
)
goto :EOF

:ExtractArzFiles
for /r %%i in (*.arz) do ( 
echo Extracting %%i
FOR %%j IN ("%%i") DO (
"%pInstallDir%\archivetool.exe" "%%i" -database "%%~dj%%~pj\."
)
)
goto :EOF