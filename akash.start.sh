#   ./akash.status.sh
#AKASH_ACCOUNT_ADDRESS=$(./akash.account.address.sh)
#
#echo "AKASH_ACCOUNT_ADDRESS => $AKASH_ACCOUNT_ADDRESS"
#
#if [ -z $AKASH_ACCOUNT_ADDRESS ] ;then
#    echo "Warning : No account adress => Create account"
#    ./akash.account.create.sh
#fi
# Set environment
. ./akash.env.init.sh
./menu.sh
