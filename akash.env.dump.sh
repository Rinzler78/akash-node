#!/bin/bash
trace ()
{
    echo "********************** $1 *****************************"
}

trace "AKASH ENV DUMP"

echo "AKASH_NET => $AKASH_NET"
echo "AKASH_DSEQ => $AKASH_DSEQ"
echo "AKASH_OSEQ => $AKASH_OSEQ"
echo "AKASH_GSEQ => $AKASH_GSEQ"
echo "AKASH_KEY_NAME => $AKASH_KEY_NAME"
echo "AKASH_NODE => $AKASH_NODE"
echo "AKASH_ACCOUNT_ADDRESS => $AKASH_ACCOUNT_ADDRESS"
echo "AKASH_MONIKER => $AKASH_MONIKER"
echo "AKASH_CHAIN_ID => $AKASH_CHAIN_ID"
echo "AKASH_GAS_PRICE => $AKASH_GAS_PRICE"

trace "AKASH ENV DUMP"
