del test.tif -y
del test2.tga -y
call head changelog.txt 129 > cl1.txt
call tail cl1.txt 84 > cl2.txt
iv cl2.txt /append=test.tif /silent
iv test.tif /resize=(1920,1080) /aspectratio /resample /convert=test2.tga /silent
copy test2.tga .\DAIL\source\ui\loading\loadingbackground01.tga -y