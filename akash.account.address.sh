if [ -z $AKASH_KEY_NAME ];then
    echo "Error : AKASH_KEY_NAME must be set"
    exit
fi

akash keys show $AKASH_KEY_NAME -a
