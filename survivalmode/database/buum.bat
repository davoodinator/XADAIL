SET BATCH_DIR=%~dp0

@ECHO OFF

SET REG_KEY=HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Steam App 219990
SET VALUE_NAME=InstallLocation
FOR /F "tokens=2*" %%A IN ('REG.exe query "%REG_KEY%" /v "%VALUE_NAME%"') DO (set pInstallDir=%%B)
echo %pInstallDir%
cd %pInstallDir%\mods\survivalmode\database

rename SurvivalMode.arz SurvivalMode.arz.old
DAIL-crucible.exe SurvivalMode.arz.old SurvivalMode.arz
@echo wtf is going on. hit enter to continue
@pause
del SurvivalMode.arz.old

cd ..
cd resources
archivetool Custom.arc -update . Custom 6
archivetool Creatures.arc -update . Creatures 6
archivetool Conversations.arc -update . Conversations 6
archivetool Custom.arc -update . Custom 6
archivetool Effects.arc -update . Effects 6
archivetool fx.arc -update . fx 6
archivetool ingameui.arc -update . ingameui 6
archivetool Items.arc -update . Items 6
archivetool Meshes.arc -update . Meshes 6
archivetool Quests.arc -update . Quests 6
rem archivetool Scripts.arc -update . Scripts 6
archivetool Sound.arc -update . Sound 6
archivetool Sounds.arc -update . Sounds 6
archivetool Soundeffects.arc -update . Soundeffects 6
archivetool Textures.arc -update . Textures 6
archivetool Text_EN.arc -update . Text_EN 6
archivetool wanez.arc -update . wanez 6
archivetool wanez-dga.arc -update . wanez-dga 6
archivetool ui.arc -update . ui 6
archivetool XPack.arc -update . XPack 6
archivetool Sound.arc -update . Items 6



@ECHO SUCCESS! .. i hope.  ! if it failed then you need to do an integrity check.
@ECHO REMEMBER THIS IS FOR PATCHING UNTOUCHED 1.0.0.5 CRUCIBLE DLC ONLY. if you dont have
@ECHO the crucible dlc. this won't work. since this doesn't actually contain the DLC.
@pause