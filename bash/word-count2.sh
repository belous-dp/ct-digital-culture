#!/bin/bash
target_word=$(unzip -p word-count.zip target.word)
unzip -q word-count.zip -d unzipped
good_files=$(find unzipped -type f -name *$target_word*)
echo $(wc -w $good_files)
rm -r unzipped