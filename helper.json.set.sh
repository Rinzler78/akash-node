#!/bin/bash
JSON_FILE=$1
KEY=$2
VALUE=$3

if [ -z $JSON_FILE ];then
    echo "Error : Missing file name"
    exit
fi

if [ ! -f $JSON_FILE ];then
    echo "{}" > $JSON_FILE
fi

if [ -z $KEY ];then
    echo "Error : Missing key"
    exit
fi

echo $(jq ".$KEY = \"$VALUE\"" $JSON_FILE) > $JSON_FILE
