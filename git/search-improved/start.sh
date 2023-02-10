#!/usr/bin/env bash

strings=(code stress-ng docker kill clear time subl hyperfine ghc gcc clang rm mv cp systemctl vim cut sync dos2unix zgrep strings lsusb sed printf xxd swapon reboot watch which uptime sysctl shred file du df uuidgen mount date taskset renice screenfetch dmesg tar uniq sha512sum ps sort touch xargs pwd mknod mkdir mktemp ls ln ffmpeg make gdb javac mpv vlc ssh git wget curl flex bison binwalk wine perl find chmod chown chgrp pidof ping base64 echo cat scp alias ruby grep rg 7z xz lz4 zstd)
strings=( $(shuf -e "${strings[@]}") )

f=cool-cheatsheet.txt

echo "bash" > $f
git add $f
git commit -m "Initial cheatsheet"

git tag -d 1.0
git tag 1.0

for i in "${!strings[@]}"; do
  echo "${strings[$i]}" >> $f
  commitIndex=$(($i+1))
  git commit -am "Update useful commands #$commitIndex"
  for (( i=1; i<=2; i++ )); do
    shuf $f -o $f
    git commit -am "Update useful commands #$commitIndex"
  done
done
