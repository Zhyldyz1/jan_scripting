#!/bin/bash
FILE_NAME='report.txt'
RESULT=$(find / -name $FILE_NAME -type f)

if [ -z RESULT ]; then
  echo "Report Created" >> $FILE_NAME 

else 
  echo "File: $RESULT" 
fi
