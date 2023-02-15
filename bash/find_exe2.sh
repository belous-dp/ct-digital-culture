#!/bin/bash
unzip -q find-exe.zip -d unzipped
find unzipped -perm 755 -exec stat --printf "%A \n" {} \;
