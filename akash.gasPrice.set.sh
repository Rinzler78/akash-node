#!/bin/bash
CURRENT_STATE=$(./akash.gasPrice.sh)
NEW_STATE="minimum-gas-prices = \"$1uakt\""

if [[ $# -ne 1 ]]; then
 echo "Error: Missing arguments"
 exit
fi

./helper.script.replace.sh "$HOME/.akash/config/app.toml" "$CURRENT_STATE" "$NEW_STATE"
