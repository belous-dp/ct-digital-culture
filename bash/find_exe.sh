#!/bin/bash/
find_exe_name=$(unzip -Z find-exe.zip | grep '\-..x' | awk '{ print $NF }')
echo $(basename /.find-exe.zip/$find_exe_name)

