#!/bin/bash
unzip -q grep-logs.zip -d unzipped
cd unzipped
files_list=($(ls))
responds=()
for file in "${files_list[@]}"; do
    # echo $(zgrep -H -n -m 1 "HTTP/1\.1 5.." $file)
    # echo $(zgrep -m 1 "HTTP/1\.1 5.." $file | \
        # awk '{for(i=1; i <= NF; i++) if(system( \
            # "echo $i | cut -c2- | { read kek ; date -d "$kek" ; }")) print $(i + 1)}')
        # awk '{for(i=1; i <= NF; i++) if($i ~ /\[.*\]/) print $(i + 1)}')
    error_line=($(zgrep -m 1 "HTTP/1\.1 5.." $file))
    for i in "${!error_line[@]}"; do
        word=${error_line[i]}
        if [[ (${#word} > 2) && ("${word:0:1}" == "[") ]]; then
            word="${word:1:-1}"
            date -d "$word" > /dev/null
            ret=$?
            if [ "$ret" == "0" ]; then
                # echo ${error_line[i + 1]}
                responds+=("${error_line[i + 1]}")
                break
            fi
        fi
    done
done
echo $(printf '%s\n' "${responds[@]}" | sort | uniq)
cd ..
rm -r unzipped