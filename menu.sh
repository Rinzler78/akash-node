title="Akash control menu"
prompt="Select an option :"
options=("Update akash " "Set key name (AKASK_KEY_NAME)" "Create account" "Get account address" "ENV status" "Run full node")

echo "$title"
PS3="$prompt "

function executeCommadn 
{
    case "$REPLY" in
    1) echo "You picked $opt"
        ./update.sh
    ;;
    2) echo "You picked $opt"
        ./akash.account.create.sh
    ;;
    3) echo "You picked $opt "
        read AKASK_KEY_NAME
        echo "AKASK_KEY_NAME => $AKASK_KEY_NAME"
    ;;
    4) echo "You picked $opt "
        ./akash.account.address.sh
    ;;
    5) echo "You picked $opt "
        ./akash.status.sh
    ;;
    6) echo "You picked $opt "
        export AKASH_MONIKER="TestWalletMoniker"
        echo "AKASH_MONIKER => $AKASH_MONIKER"
        export AKASH_CHAIN_ID="$(./akash.chainId.get.sh)"
        echo "AKASH_CHAIN_ID => $AKASH_CHAIN_ID"
        ./akash.node.Init.sh

        export GAS_PRICE=0.025
        ./akash.gasPrice.set.sh $GAS_PRICE
        ./akash.gasPrice.sh

        ./akash.genesisFile.download.sh
        ./akash.genesisFile.validate.sh

        ./akash.fastSync.state.set.enable.sh
        ./akash.fastSync.version.set.v2.sh
        
        ./akash.seeds.set.default.sh
        
        ./akash.node.start.sh
    ;;
    esac
}

select opt in "${options[@]}" "Quit"; do 
    case "$REPLY" in
    ${#options[@]}[1-${#options[@]}]) echo "You picked $opt"
        executeCommadn $REPLY
    ;;
    $((${#options[@]}+1))) echo "Goodbye!"; break;;
    *) echo "Invalid option. Try another one.";continue;;
    esac
done

# select opt in "${options[@]}" "Quit"; do 
#     case "$REPLY" in
#     1) echo "You picked $opt"
#         ./update.sh
#     ;;
#     2) echo "You picked $opt"
#         ./akash.account.create.sh
#     ;;
#     3) echo "You picked $opt "
#         read AKASK_KEY_NAME
#         echo "AKASK_KEY_NAME => $AKASK_KEY_NAME"
#     ;;
#     4) echo "You picked $opt "
#         ./akash.account.address.sh
#     ;;
#     5) echo "You picked $opt "
#         ./akash.status.sh
#     ;;
#     6) echo "You picked $opt "
#         export AKASH_MONIKER="TestWalletMoniker"
#         echo "AKASH_MONIKER => $AKASH_MONIKER"
#         export AKASH_CHAIN_ID="$(./akash.chainId.get.sh)"
#         echo "AKASH_CHAIN_ID => $AKASH_CHAIN_ID"
#         ./akash.node.Init.sh

#         export GAS_PRICE=0.025
#         ./akash.gasPrice.set.sh $GAS_PRICE
#         ./akash.gasPrice.sh

#         ./akash.genesisFile.download.sh
#         ./akash.genesisFile.validate.sh

#         ./akash.fastSync.state.set.enable.sh
#         ./akash.fastSync.version.set.v2.sh
        
#         ./akash.seeds.set.default.sh
        
#         ./akash.node.start.sh
#     ;;
#     $((${#options[@]}+1))) echo "Goodbye!"; break;;
#     *) echo "Invalid option. Try another one.";continue;;
#     esac
# done