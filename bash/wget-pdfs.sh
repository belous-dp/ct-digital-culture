#!/bin/bash
mkdir downloaded
wget -q -P downloaded -i wget-pdfs
# echo $(find downloaded -type f -name '*.pdf' -exec du --bytes {} \;)
# echo $(find downloaded -type f -name '*.pdf' | xargs -n 1 du -a --bytes)
# file_list=$(find downloaded -type f -name '*.pdf')
# echo $(du -bc $file_list | tail -1 | cut -f 1)
# echo $(stat -c %s $file_list | paste -sd "+" - | bc)
cd downloaded
all_files=($(ls))
sum=0
for file in "${all_files[@]}"; do
    type="$(file -b $file)"
    # echo $(echo $type | awk '{print $1, $2}')
    # if [ "${type%%,*}" == "PDF document" ]; then
    if [ "$(echo $type | awk '{print $1, $2}')" == "PDF document," ]; then
        # echo $file
        sum=$(($sum + $(stat -c %s $file)))
    fi
done
echo $sum
cd ..
rm -r downloaded