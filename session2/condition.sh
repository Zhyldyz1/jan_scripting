#!/bin/bash

#result=$(($1+$2))
#echo "Total: $result"

#echo $(date)
#echo $((3+3))

####
#another example

read -p "What is your age?: " age

if [ $age > 18]; then 
  echo "You may purchase your item"

else
  echo "You are too young"
fi
