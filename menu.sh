title="Akash control menu"
prompt="Select an option :"
options=("Update akash" "Create account" "Get account address" "ENV status" "Node init" "Configure Gas Price" "Init genesis" "Configure fast sync" "Configure seeds" "Run full node")

echo "$title"
PS3="$prompt "

function executeCommand 
{
    command=$1
    commandName=${options[$(($command-1))]}

    echo "Executing command [$command] => $commandName"

    case "$command" in
    1) # Update
        ./update.sh
    ;;
    2) # Create account
        ./akash.account.create.sh
    ;;
    3) # Get account Address
        ./akash.account.address.sh
    ;;
    4) # akash env status
        ./akash.status.sh
    ;;
    5) # Node init
        export AKASH_MONIKER="TestWalletMoniker"
        echo "AKASH_MONIKER => $AKASH_MONIKER"
        export AKASH_CHAIN_ID="$(./akash.chainId.get.sh)"
        echo "AKASH_CHAIN_ID => $AKASH_CHAIN_ID"
        ./akash.node.Init.sh
    ;;
    6) # Set Gas Price
        ./akash.gasPrice.sh
        export GAS_PRICE=0.025
        ./akash.gasPrice.set.sh $GAS_PRICE
        ./akash.gasPrice.sh
    ;;
    7) # Init genesis file
        ./akash.genesisFile.download.sh
        ./akash.genesisFile.validate.sh
    ;;
    8) # Enable fast sync
        ./akash.fastSync.state.sh
        ./akash.fastSync.state.set.enable.sh
        ./akash.fastSync.version.set.v2.sh
        ./akash.fastSync.state.sh
    ;;
    9) # Set seeds
        ./akash.seeds.sh
        ./akash.seeds.set.default.sh
        ./akash.seeds.sh
    ;;
    10) # Full Node Start
        executeCommand 6
        executeCommand 7
        executeCommand 8
        executeCommand 9
        executeCommand 10
        ./akash.node.start.sh
    ;;
    esac
}

select opt in "${options[@]}" "Quit"; do

    if [ $REPLY > 0 ] && [ $REPLY -le ${#options[@]} ];
    then
        executeCommand $REPLY
        else
            case "$REPLY" in
            $((${#options[@]}+1))) echo "Goodbye!"; break;;
            *) echo "Invalid option. Try another one.";continue;;
            esac
    fi
done