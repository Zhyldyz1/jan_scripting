#!/bin/bash


result=$(find /root -name exercise3.sh -type f)

## syntax for for_loop
# for var in $var; do
#   command 1
#   command 2
# done

for file in $result; do 
  echo "exit" >> $file
done 

for item in $(ls); do 
    echo $item
    if [[ $item == *".sh"* ]]; then
        chmod +x $item
    fi
done

ls -la