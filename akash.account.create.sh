if [ -z $AKASH_NODE ];then
    export AKASH_NODE=$(hostname)
    echo "Warning : AKASH_KEY_NAME not set. Setting to $AKASH_NODE"
fi

if [ -z $AKASH_ACCOUNT_PASS ];then
    export AKASH_ACCOUNT_PASS=$(./helper.password.generate.sh 8)
    echo "Warning : AKASH_ACCOUNT_PASS not set. Setting to $AKASH_ACCOUNT_PASS"
fi

akash keys add $AKASH_KEY_NAME &
echo $AKASH_ACCOUNT_PASS
echo $AKASH_ACCOUNT_PASS
