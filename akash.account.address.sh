if [ -z $AKASH_KEY_NAME ];then
    echo "Warning : AKASH_KEY_NAME not set. Please enter a name"
    read AKASH_KEY_NAME
fi

akash keys show $AKASH_KEY_NAME -a
