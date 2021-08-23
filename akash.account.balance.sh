if [ -z $AKASH_NODE ];then
    echo "Error : AKASH_NODE must be set"
    exit
fi

if [ -z $AKASH_ACCOUNT_ADDRESS ];then
    echo "Warning : AKASH_ACCOUNT_ADDRESS not set. Try to retrieve from keys"
    AKASH_ACCOUNT_ADDRESS=$(./akash.account.address.sh)
    
    if [ -z $AKASH_ACCOUNT_ADDRESS ];then
        echo "Error : AKASH_ACCOUNT_ADDRESS not found"
        exit
    fi
fi

akash query bank balances --node $AKASH_NODE $AKASH_ACCOUNT_ADDRESS
