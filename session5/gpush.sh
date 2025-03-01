#!/bin/bash

_push_to_github() {
  git add $1
  git commit -m $2
  git push origin $3
}

if [ $# -lt 3 ]; then
  read -p "Enter path to track: " files
  read -p "Enter message for commit: " message
  read -p "Enter target branch: " branch

  _push_to_github $files "message" $branch

else
  _push_to_github $1 "$2" $3

fi


## check if argument exists
## if argument 1 exists:
##   git add argument1
##   if argument2 exists:
##     git commit -m "argument2"
##   if argument 3 exists:
##     git push origin argument3
##     git push origin main
## if no argument:
##  git add .
##  ask user for commit message
##  git commit -m "given message"
##  git push origin main
