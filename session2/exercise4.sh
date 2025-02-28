#!/bin/bash

if [ $# -eq 0 ]; then
  read -p  "enter a folder to look for: " folder
else
  folder=$1
fi

result=$(find / -name $folder -type d) 

if [ -z "$result" ]; then 
  echo "Folder $folder not found"
  exit
else 
  echo "Directory $result exists"
fi
 
