rem this is how it works
rem archivetool.exe resource -add folderinside of archive actual text outside of archive

rem Text_En prepper
del *.arc -y
del *.arc.* -y
del *.txt -y
rem copy ..\DAIL\resources\Text_En.arc
copy ..\VanillaBak\text_en.arc.1005
copy ..\DAIL\source\Text_EN\tags_uimain.txt
copy text_en.arc.1005 Text_En.arc

copy Text_En.arc Text_En.arc.S.arc
copy Text_En.arc Text_En.arc.A.arc
copy Text_En.arc Text_En.arc.ANG.arc
copy Text_En.arc Text_En.arc.NG.arc
copy Text_En.arc Text_En.arc.B.arc
copy Text_En.arc Text_En.arc.AB.arc
copy Text_En.arc Text_En.arc.AX.arc
copy Text_En.arc Text_En.arc.X.arc
copy Text_En.arc Text_En.arc.SX.arc
copy Text_En.arc Text_En.arc.ASX.arc

mkdir source_S
mkdir source_A
mkdir source_ANG
mkdir source_NG
mkdir source_B
mkdir source_AB
mkdir source_AX
mkdir source_X
mkdir source_SX
mkdir source_ASX

COPY tags_uimain.txt .\source_S\ /y
COPY tags_uimain.txt .\source_A\ /y
COPY tags_uimain.txt .\source_ANG\ /y
COPY tags_uimain.txt .\source_NG\ /y
COPY tags_uimain.txt .\source_B\ /y
COPY tags_uimain.txt .\source_AB\ /y
COPY tags_uimain.txt .\source_AX\ /y
COPY tags_uimain.txt .\source_X\ /y
COPY tags_uimain.txt .\source_SX\ /y
COPY tags_uimain.txt .\source_ASX\ /y

echo tagRDifficultyTitle01=Normal(S 0053) >> .\source_S\tags_uimain.txt
echo tagRDifficultyTitle01=Normal(A 0053) >> .\source_A\tags_uimain.txt
echo tagRDifficultyTitle01=Normal(ANG 0053) >> .\source_ANG\tags_uimain.txt
echo tagRDifficultyTitle01=Normal(NG 0053) >> .\source_NG\tags_uimain.txt
echo tagRDifficultyTitle01=Normal(B 0053) >> .\source_B\tags_uimain.txt
echo tagRDifficultyTitle01=Normal(AB 0053) >> .\source_AB\tags_uimain.txt
echo tagRDifficultyTitle01=Normal(AX 0053) >> .\source_AX\tags_uimain.txt
echo tagRDifficultyTitle01=Normal(X 0053) >> .\source_X\tags_uimain.txt
echo tagRDifficultyTitle01=Normal(SX 0053) >> .\source_SX\tags_uimain.txt
echo tagRDifficultyTitle01=Normal(ASX 0053) >> .\source_ASX\tags_uimain.txt

echo tagChallengeDifficulty=Veteran(S 0053) >> .\source_S\tags_uimain.txt
echo tagChallengeDifficulty=Veteran(A 0053) >> .\source_A\tags_uimain.txt
echo tagChallengeDifficulty=Veteran(ANG 0053) >> .\source_ANG\tags_uimain.txt
echo tagChallengeDifficulty=Veteran(NG 0053) >> .\source_NG\tags_uimain.txt
echo tagChallengeDifficulty=Veteran(B 0053) >> .\source_B\tags_uimain.txt
echo tagChallengeDifficulty=Veteran(AB 0053) >> .\source_AB\tags_uimain.txt
echo tagChallengeDifficulty=Veteran(AX 0053) >> .\source_AX\tags_uimain.txt
echo tagChallengeDifficulty=Veteran(X 0053) >> .\source_X\tags_uimain.txt
echo tagChallengeDifficulty=Veteran(SX 0053) >> .\source_SX\tags_uimain.txt
echo tagChallengeDifficulty=Veteran(ASX 0053) >> .\source_ASX\tags_uimain.txt

echo tagRDifficultyTitle02=Elite(S 0053) >> .\source_S\tags_uimain.txt
echo tagRDifficultyTitle02=Elite(A 0053) >> .\source_A\tags_uimain.txt
echo tagRDifficultyTitle02=Elite(ANG 0053) >> .\source_ANG\tags_uimain.txt
echo tagRDifficultyTitle02=Elite(NG 0053) >> .\source_NG\tags_uimain.txt
echo tagRDifficultyTitle02=Elite(B 0053) >> .\source_B\tags_uimain.txt
echo tagRDifficultyTitle02=Elite(AB 0053) >> .\source_AB\tags_uimain.txt
echo tagRDifficultyTitle02=Elite(AX 0053) >> .\source_AX\tags_uimain.txt
echo tagRDifficultyTitle02=Elite(X 0053) >> .\source_X\tags_uimain.txt
echo tagRDifficultyTitle02=Elite(SX 0053) >> .\source_SX\tags_uimain.txt
echo tagRDifficultyTitle02=Elite(ASX 0053) >> .\source_ASX\tags_uimain.txt

echo tagRDifficultyTitle03=Ultimate(S 0053) >> .\source_S\tags_uimain.txt
echo tagRDifficultyTitle03=Ultimate(A 0053) >> .\source_A\tags_uimain.txt
echo tagRDifficultyTitle03=Ultimate(ANG 0053) >> .\source_ANG\tags_uimain.txt
echo tagRDifficultyTitle03=Ultimate(NG 0053) >> .\source_NG\tags_uimain.txt
echo tagRDifficultyTitle03=Ultimate(B 0053) >> .\source_B\tags_uimain.txt
echo tagRDifficultyTitle03=Ultimate(AB 0053) >> .\source_AB\tags_uimain.txt
echo tagRDifficultyTitle03=Ultimate(AX 0053) >> .\source_AX\tags_uimain.txt
echo tagRDifficultyTitle03=Ultimate(X 0053) >> .\source_X\tags_uimain.txt
echo tagRDifficultyTitle03=Ultimate(SX 0053) >> .\source_SX\tags_uimain.txt
echo tagRDifficultyTitle03=Ultimate(ASX 0053) >> .\source_ASX\tags_uimain.txt

echo tagHardcore=Hardcore(S 0053) >> .\source_S\tags_uimain.txt
echo tagHardcore=Hardcore(A 0053) >> .\source_A\tags_uimain.txt
echo tagHardcore=Hardcore(ANG 0053) >> .\source_ANG\tags_uimain.txt
echo tagHardcore=Hardcore(NG 0053) >> .\source_NG\tags_uimain.txt
echo tagHardcore=Hardcore(B 0053) >> .\source_B\tags_uimain.txt
echo tagHardcore=Hardcore(AB 0053) >> .\source_AB\tags_uimain.txt
echo tagHardcore=Hardcore(AX 0053) >> .\source_AX\tags_uimain.txt
echo tagHardcore=Hardcore(X 0053) >> .\source_X\tags_uimain.txt
echo tagHardcore=Hardcore(SX 0053) >> .\source_SX\tags_uimain.txt
echo tagHardcore=Hardcore(ASX 0053) >> .\source_ASX\tags_uimain.txt

rem rename text_en.arc.1004HF1 text_en.arc.1004HF1.arc
rem Arhivetool.exe text_en.arc.1004HF1.arc -update . ..\DAIL\source\Text_EN\DAIL_hybrid_tags.txt 6

rem Text_en fiddler
Archivetool.exe Text_EN.arc.S.arc -update  .\source_S\tags_uimain.txt Text_EN 6
Archivetool.exe Text_EN.arc.A.arc -update  .\source_A\tags_uimain.txt Text_EN 6
Archivetool.exe Text_EN.arc.ANG.arc -update  .\source_ANG\tags_uimain.txt Text_EN 6
Archivetool.exe Text_EN.arc.NG.arc -update  .\source_NG\tags_uimain.txt Text_EN 6
Archivetool.exe Text_EN.arc.B.arc -update  .\source_B\tags_uimain.txt Text_EN 6
Archivetool.exe Text_EN.arc.AB.arc -update  .\source_AB\tags_uimain.txt Text_EN 6
Archivetool.exe Text_EN.arc.AX.arc -update  .\source_AX\tags_uimain.txt Text_EN 6
Archivetool.exe Text_EN.arc.X.arc -update  .\source_X\tags_uimain.txt Text_EN 6
Archivetool.exe Text_EN.arc.SX.arc -update  .\source_SX\tags_uimain.txt Text_EN 6
Archivetool.exe Text_EN.arc.ASX.arc -update  .\source_ASX\tags_uimain.txt Text_EN 6

Archivetool.exe Text_EN.arc.S.arc -update ..\DAIL\sources\Text_EN\DAIL_hybrid_tags.txt Text_EN 6
Archivetool.exe Text_EN.arc.A.arc -update ..\DAIL\sources\Text_EN\DAIL_hybrid_tags.txt Text_EN 6
Archivetool.exe Text_EN.arc.ANG.arc -update ..\DAIL\sources\Text_EN\DAIL_hybrid_tags.txt Text_EN 6
Archivetool.exe Text_EN.arc.NG.arc -update ..\DAIL\sources\Text_EN\DAIL_hybrid_tags.txt Text_EN 6
Archivetool.exe Text_EN.arc.B.arc -update ..\DAIL\sources\Text_EN\DAIL_hybrid_tags.txt Text_EN 6
Archivetool.exe Text_EN.arc.AB.arc -update ..\DAIL\sources\Text_EN\DAIL_hybrid_tags.txt Text_EN 6
Archivetool.exe Text_EN.arc.AX.arc -update ..\DAIL\sources\Text_EN\DAIL_hybrid_tags.txt Text_EN 6
Archivetool.exe Text_EN.arc.X.arc -update ..\DAIL\sources\Text_EN\DAIL_hybrid_tags.txt Text_EN 6
Archivetool.exe Text_EN.arc.SX.arc -update ..\DAIL\sources\Text_EN\DAIL_hybrid_tags.txt Text_EN 6
Archivetool.exe Text_EN.arc.ASX.arc -update ..\DAIL\sources\Text_EN\DAIL_hybrid_tags.txt Text_EN 6

rename Text_EN.arc.S.arc Text_EN.arc.S
rename Text_EN.arc.A.arc Text_EN.arc.A
rename Text_EN.arc.ANG.arc Text_EN.arc.ANG
rename Text_EN.arc.NG.arc Text_EN.arc.NG
rename Text_EN.arc.B.arc Text_EN.arc.B
rename Text_EN.arc.AB.arc Text_EN.arc.AB
rename Text_EN.arc.AX.arc Text_EN.arc.AX
rename Text_EN.arc.X.arc Text_EN.arc.X
rename Text_EN.arc.SX.arc Text_EN.arc.SX
rename Text_EN.arc.ASX.arc Text_EN.arc.ASX

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