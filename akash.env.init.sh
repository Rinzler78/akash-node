#!/bin/bash
trace ()
{
    echo "********************** $1 *****************************"
}

getOrSet()
{
    VALUE_NAME=$1
    ENV_VALUE="$2"
    SCRIPT="$3"
    
    NEW_VALUE=$(./akash.config.getOrSet.sh $VALUE_NAME "$ENV_VALUE" "$SCRIPT")
    
    echo "GetOrSet $VALUE_NAME => ENV($ENV_VALUE), Stored($NEW_VALUE)"
    
    ENV_VALUE=$NEW_VALUE
    
    eval $VALUE_NAME="'$ENV_VALUE'"
}

trace "AKASH ENV INIT"

getOrSet AKASH_NET "$AKASH_NET" "echo https://raw.githubusercontent.com/ovrclk/net/master/mainnet"
getOrSet AKASH_MONIKER "$AKASH_MONIKER" "echo akash-moniker-name"
getOrSet AKASH_GAS_PRICE "$AKASH_GAS_PRICE" "echo 0.025"
getOrSet AKASH_KEY_NAME "$AKASH_KEY_NAME" "echo akashNodeName"
getOrSet AKASH_NODE "$AKASH_NODE" ./akash.node.get.sh
getOrSet AKASH_CHAIN_ID "$AKASH_CHAIN_ID" ./akash.chainId.get.sh

trace "AKASH ENV INIT"
