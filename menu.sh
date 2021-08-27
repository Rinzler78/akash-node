title="Akash control menu"
prompt="Select an option :"
options=(\
"Update akash binary"\
 "Account : Create"\
 "Account : Address"\
 "Account : Balance"\
 "ENV : DUMP"\
 "Node : Init"\
 "Config : Gas Price"\
 "Node : Init genesis"\
 "Config : fast sync"\
 "Config : seeds"\
 "Node : Setup full Node"
 "Node : Start")

echo "$title"
PS3="$prompt "

executeCommand ()
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
        export AKASH_ACCOUNT_ADDRESS="$(./akash.account.address.sh)"
        ./akash.config.account.address.set.sh $AKASH_ACCOUNT_ADDRESS
    ;;
    4) # Get account Balance
        ./akash.account.balance.sh
    ;;
    5) # akash env status
        ./akash.env.dump.sh
    ;;
    6) # Node init
        ./akash.node.Init.sh
    ;;
    7) # Set Gas Price
        echo "Gas price : Current($(./akash.gasPrice.sh)), New ($($AKASH_GAS_PRICE))"
        ./akash.gasPrice.set.sh $AKASH_GAS_PRICE
    ;;
    8) # Init genesis file
        echo "Genesis file : Download"
        ./akash.genesisFile.download.sh
        
        echo "Genesis file : Validate"
        ./akash.genesisFile.validate.sh
    ;;
    9) # Config fast sync
        echo "Fast Sync State : Current ($(./akash.fastSync.state.sh)), New (true)"
        ./akash.fastSync.state.set.enable.sh

        echo "Fast Sync Version : Current ($(./akash.fastSync.version.sh)), New (v2)"
        ./akash.fastSync.version.set.v2.sh
    ;;
    10) # Set seeds
        echo "Seeds : Current ($(./akash.seeds.sh), New ($(./akash.seeds.download.sh))"
        ./akash.seeds.set.default.sh
    ;;
    11) # Full node setup
        executeCommand 1
        executeCommand 5
        executeCommand 6
        executeCommand 7
        executeCommand 8
        executeCommand 9
        executeCommand 10
    ;;
    12) # Full Node Start
        executeCommand 11
        ./akash.node.start.sh
    ;;
    esac
}

executeCommand 11
exit

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