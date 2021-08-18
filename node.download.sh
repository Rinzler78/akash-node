#!/bin/bash
AKASH_VERSION=$1

if [ -z "$1" ]
  then
    REMOTE_VERSION=$(./node.remoteVersion.sh)
    echo "No version specified => Get current version : $REMOTE_VERSION"
    AKASH_VERSION=$REMOTE_VERSION
fi

curl https://raw.githubusercontent.com/ovrclk/akash/master/godownloader.sh | sh -s -- "v$AKASH_VERSION"

