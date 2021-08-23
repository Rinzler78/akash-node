#!/bin/bash
CURRENT_STATE=$(./akash.fastSync.get.sh)

if [[ $# -ne 1 ]]; then
 echo "Error: Missing arguments"
 exit
fi

NEW_STATE="$1"
NEW_STATE=$(echo $NEW_STATE | tr '[:upper:]' '[:lower:]')

echo "Arg => $1"
echo "NEW_STATE => $NEW_STATE"

if [ $NEW_STATE != "true" ] && [ $NEW_STATE != "false" ];
then
    echo "Error : Bad arguments. Need \"true\" or \"false\""
    exit
fi

NEW_STATE="fast_sync = $NEW_STATE"
./helper.script.replace.sh "$HOME/.akash/config/config.toml" "$CURRENT_STATE" "$NEW_STATE"
