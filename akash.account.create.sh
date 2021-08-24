if [ -z $AKASH_KEY_NAME ];then
    echo "Warning : AKASH_KEY_NAME not set. Please enter a name"
    AKASH_KEY_NAME=$(read line)
fi

echo "akash : Create account with $AKASH_KEY_NAME"
akash keys add $AKASH_KEY_NAME
