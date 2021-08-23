#!/bin/bash
TARGET_FILE=$1
ORIGINAL_STRING=$2
NEW_STRING=$3

if [[ $# -ne 3 ]]; then
 echo "Error: Missing arguments"
 exit
fi

# File check
if [ -z "$TARGET_FILE" ]
  then
    echo "Error : Missing action name"
    exit
fi

if [ ! -f "$TARGET_FILE" ];
  then
    echo "Error : File does not exist"
    exit
fi

# Replace original string by new string in target file
sed -i ".new" "s/${ORIGINAL_STRING}/${NEW_STRING}/g" "$TARGET_FILE"
