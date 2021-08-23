#!/bin/bash
CURRENT_STATE=$(./akash.fastSync.state.sh)

if [[ $# -ne 1 ]]; then
 echo "Error: Missing arguments"
 exit
fi

NEW_STATE="$1"
NEW_STATE=$(echo $NEW_STATE | tr '[:upper:]' '[:lower:]')

#echo "Arg => $1"
#echo "NEW_STATE => $NEW_STATE"

case $NEW_STATE in
    true | false)
        NEW_STATE="fast_sync = $NEW_STATE"
        ./helper.file.replace.sh "$HOME/.akash/config/config.toml" "$CURRENT_STATE" "$NEW_STATE"
        exit
    
    ;;
esac

echo "Error : Bad arguments. Need \"true\" or \"false\""
