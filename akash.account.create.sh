if [ -z $AKASH_KEY_NAME ];then
    echo "Warning : AKASH_KEY_NAME not set. Pleas enter a name"
    export AKASH_KEY_NAME=$(read line)
fi


akash keys add $AKASH_KEY_NAME
