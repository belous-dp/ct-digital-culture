#!/bin/bash
unzip -q mod-sort.zip -d unzipped
cd ./unzipped/
echo $(cat $(ls -tr) | sha256sum | awk '{ print $1 }')
cd ..
rm -r unzipped