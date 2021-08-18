echo "akash key name : $AKASH_KEY_NAME"
akash keys add $AKASH_KEY_NAME

export AKASH_ACCOUNT_ADDRESS="$(akash keys show $AKASH_KEY_NAME -a)"

echo "akash account adress : $AKASH_ACCOUNT_ADDRESS"