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
  REDIRECT=/dev/tty
else
  REDIRECT=/dev/null
fi

jq -r ".$KEY" $JSON_FILE &> $REDIRECT
