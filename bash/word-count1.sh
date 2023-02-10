#!/bin/bash
target_word=$(unzip -p word-count.zip target.word)
unzip -q word-count.zip -d unzipped
num_good_files=$(find unzipped -type f -name *$target_word* | wc -l)
arr=( $(find unzipped -type f -name *$target_word*) )
sum=0
for i in "${arr[@]}"; do
    #echo $i
find unzipped -type f -name *$target_word*
    sum=$(($sum + $(wc -w $i)))
done
echo $sum
#rm -r unzipped

