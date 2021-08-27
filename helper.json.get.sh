#!/bin/bash
JSON_FILE=$1
KEY=$2

if [ -z $JSON_FILE ];then
    echo "Error : Missing file name"
    exit
fi

if [ -z $KEY ];then
    echo "Error : Missing key"
    exit
fi

if [ -f $JSON_FILE ]; then
  jq -r ".$KEY" $JSON_FILE
else
  jq -r ".$KEY" $JSON_FILE &> /dev/null
fi
