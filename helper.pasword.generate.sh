#!/bin/bash
COUNT=$1

if [ -z $COUNT ];then
    COUNT=8
fi

openssl rand -base64 $COUNT
