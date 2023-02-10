#!/bin/bash
unzip -q mod-sort.zip -d unzipped
touch filee
cd ./unzipped/
cat $(ls -tr) > ../filee
cd ..
# cat filee
echo $(sha256sum filee)
rm -r unzipped