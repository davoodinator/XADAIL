java -jar bfg.jar --strip-blobs-bigger-than 100M .\XADAIL
 cd XADAIL
 git reflog expire --expire=now --all && git gc --prune=now --aggressive


pause