title="Akash menu"
prompt="Select an option :"
options=("Update akash " "Set key name (AKASK_KEY_NAME)" "Create account" "Get account address")

echo "$title"
PS3="$prompt "
select opt in "${options[@]}" "Quit"; do 
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
    $((${#options[@]}+1))) echo "Goodbye!"; break;;
    *) echo "Invalid option. Try another one.";continue;;
    esac
done