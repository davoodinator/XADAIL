rem this is how it works
rem archivetool.exe resource -add folderinside of archive actual text outside of archive

rem Text_En prepper
del *.arc -y
del *.arc.* -y
del *.txt -y
copy ..\DAIL\resources\Text_En.arc
copy Text_En.arc Text_En.arc.S
copy Text_En.arc Text_En.arc.A
copy Text_En.arc Text_En.arc.ANG
copy Text_En.arc Text_En.arc.NG
copy Text_En.arc Text_En.arc.B
copy Text_En.arc Text_En.arc.AB
copy Text_En.arc Text_En.arc.AX
copy Text_En.arc Text_En.arc.X
copy Text_En.arc Text_En.arc.SX
copy Text_En.arc Text_En.arc.ASX

mkdir source

echo tagRDifficultyTitle01=Normal^o(S 0049) > .\source\df_S.txt
echo tagRDifficultyTitle01=Normal^o(A 0049) > .\source\df_A.txt
echo tagRDifficultyTitle01=Normal^o(ANG 0049) > .\source\df_ANG.txt
echo tagRDifficultyTitle01=Normal^o(NG 0049) > .\source\df_NG.txt
echo tagRDifficultyTitle01=Normal^o(B 0049) > .\source\df_B.txt
echo tagRDifficultyTitle01=Normal^o(AB 0049) > .\source\df_AB.txt
echo tagRDifficultyTitle01=Normal^o(AX 0049) > .\source\df_AX.txt
echo tagRDifficultyTitle01=Normal^o(X 0049) > .\source\df_X.txt
echo tagRDifficultyTitle01=Normal^o(SX 0049) > .\source\df_SX.txt
echo tagRDifficultyTitle01=Normal^o(ASX 0049) > .\source\df_ASX.txt

echo tagChallengeDifficulty=Veteran^o(S 0049) >> .\source\df_S.txt
echo tagChallengeDifficulty=Veteran^o(A 0049) >> .\source\df_A.txt
echo tagChallengeDifficulty=Veteran^o(ANG 0049) >> .\source\df_ANG.txt
echo tagChallengeDifficulty=Veteran^o(NG 0049) >> .\source\df_NG.txt
echo tagChallengeDifficulty=Veteran^o(B 0049) >> .\source\df_B.txt
echo tagChallengeDifficulty=Veteran^o(AB 0049) >> .\source\df_AB.txt
echo tagChallengeDifficulty=Veteran^o(AX 0049) >> .\source\df_AX.txt
echo tagChallengeDifficulty=Veteran^o(X 0049) >> .\source\df_X.txt
echo tagChallengeDifficulty=Veteran^o(SX 0049) >> .\source\df_SX.txt
echo tagChallengeDifficulty=Veteran^o(ASX 0049) >> .\source\df_ASX.txt

echo tagRDifficultyTitle03=Elite^o(S 0049) >> .\source\df_S.txt
echo tagRDifficultyTitle03=Elite^o(A 0049) >> .\source\df_A.txt
echo tagRDifficultyTitle03=Elite^o(ANG 0049) >> .\source\df_ANG.txt
echo tagRDifficultyTitle03=Elite^o(NG 0049) >> .\source\df_NG.txt
echo tagRDifficultyTitle03=Elite^o(B 0049) >> .\source\df_B.txt
echo tagRDifficultyTitle03=Elite^o(AB 0049) >> .\source\df_AB.txt
echo tagRDifficultyTitle03=Elite^o(AX 0049) >> .\source\df_AX.txt
echo tagRDifficultyTitle03=Elite^o(X 0049) >> .\source\df_X.txt
echo tagRDifficultyTitle03=Elite^o(SX 0049) >> .\source\df_SX.txt
echo tagRDifficultyTitle03=Elite^o(ASX 0049) >> .\source\df_ASX.txt

echo tagRDifficultyTitle04=Ultimate^o(S 0049) >> .\source\df_S.txt
echo tagRDifficultyTitle04=Ultimate^o(A 0049) >> .\source\df_A.txt
echo tagRDifficultyTitle04=Ultimate^o(ANG 0049) >> .\source\df_ANG.txt
echo tagRDifficultyTitle04=Ultimate^o(NG 0049) >> .\source\df_NG.txt
echo tagRDifficultyTitle04=Ultimate^o(B 0049) >> .\source\df_B.txt
echo tagRDifficultyTitle04=Ultimate^o(AB 0049) >> .\source\df_AB.txt
echo tagRDifficultyTitle04=Ultimate^o(AX 0049) >> .\source\df_AX.txt
echo tagRDifficultyTitle04=Ultimate^o(X 0049) >> .\source\df_X.txt
echo tagRDifficultyTitle04=Ultimate^o(SX 0049) >> .\source\df_SX.txt
echo tagRDifficultyTitle04=Ultimate^o(ASX 0049) >> .\source\df_ASX.txt

echo tagHardcore=Hardcore^o(S 0049) >> .\source\df_S.txt
echo tagHardcore=Hardcore^o(A 0049) >> .\source\df_A.txt
echo tagHardcore=Hardcore^o(ANG 0049) >> .\source\df_ANG.txt
echo tagHardcore=Hardcore^o(NG 0049) >> .\source\df_NG.txt
echo tagHardcore=Hardcore^o(B 0049) >> .\source\df_B.txt
echo tagHardcore=Hardcore^o(AB 0049) >> .\source\df_AB.txt
echo tagHardcore=Hardcore^o(AX 0049) >> .\source\df_AX.txt
echo tagHardcore=Hardcore^o(X 0049) >> .\source\df_X.txt
echo tagHardcore=Hardcore^o(SX 0049) >> .\source\df_SX.txt
echo tagHardcore=Hardcore^o(ASX 0049) >> .\source\df_ASX.txt

rem Text_en fiddler
Archivetool.exe Text_EN.arc.S -update . \source\df_S.txt
Archivetool.exe Text_EN.arc.A -update . \source\df_A.txt
Archivetool.exe Text_EN.arc.ANG -update . \source\df_ANG.txt
Archivetool.exe Text_EN.arc.NG -update . \source\df_NG.txt
Archivetool.exe Text_EN.arc.B -update . \source\df_B.txt
Archivetool.exe Text_EN.arc.AB -update . \source\df_AB.txt
Archivetool.exe Text_EN.arc.AX -update . \source\df_AX.txt
Archivetool.exe Text_EN.arc.X -update . \source\df_X.txt
Archivetool.exe Text_EN.arc.SX -update . \source\df_SX.txt
Archivetool.exe Text_EN.arc.ASX -update . \source\df_ASX.txt

rem database.arz prepper
rem del *.arz -y
rem del *.arz.* -y
rem copy "..\DAILmain - S\database\DAILmain - S.arz" database.arz
rem copy database.arz database.arz.S
rem copy database.arz database.arz.B
rem copy database.arz database.arz.A
rem copy database.arz database.arz.NG
rem copy database.arz database.arz.AB
rem copy database.arz database.arz.ANG

rem database.arz fiddler
rem Archivetool.exe database.arz.S -replace ./database/records ./Arachnophobia/database/records/



rem pause