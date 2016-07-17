rem this is how it works
rem archivetool.exe resource -add folderinside of archive actual text outside of archive

rem Text_En prepper
del *.arc -y
del *.arc.* -y
rem F:\SHTEEM\steamapps\common\Grim Dawn\mods\DAILmain - S\resources
rem F:\SHTEEM\steamapps\common\Grim Dawn\mods\DAILmain - S\resources\text_en.arc
copy "F:\SHTEEM\steamapps\common\Grim Dawn\mods\DAILmain - S\resources\text_en.arc"
rem copy "..\DAILmain - S\resources\text_en\text_en.arc"

copy Text_En.arc Text_En.arc.S
copy Text_En.arc Text_En.arc.A
copy Text_En.arc Text_En.arc.ANG
copy Text_En.arc Text_En.arc.NG
copy Text_En.arc Text_En.arc.B
copy Text_En.arc Text_En.arc.AB

rem Text_en fiddler
Archivetool.exe Text_EN.arc.S -add ./dailFICULTIES.txt DAIL_version_S.txt
Archivetool.exe Text_EN.arc.A -add ./dailFICULTIES.txt DAIL_version_A.txt
Archivetool.exe Text_EN.arc.ANG -add ./dailFICULTIES.txt DAIL_version_ANG.txt
Archivetool.exe Text_EN.arc.NG -add ./dailFICULTIES.txt DAIL_version_NG.txt
Archivetool.exe Text_EN.arc.B -add ./dailFICULTIES.txt DAIL_version_B.txt
Archivetool.exe Text_EN.arc.AB -add ./dailFICULTIES.txt DAIL_version_AB.txt

pause