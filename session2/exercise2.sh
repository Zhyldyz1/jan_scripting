#!/bin/bash

name=$1
age=$2
state=$3

if [ $# -lt 3 ]; then
  echo "Please provide all required info"
  exit 
fi

echo """
Name: $name
Age: $age
State: $state
"""


if [ $state = "Illinois" ] && [ $state = "illinois" ]; then
  echo "Note: Keep in mind you are required to attend sessions in person"
else 
  echo "Note: You will receive a zoom invite for a session"
fi

