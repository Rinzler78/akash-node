#!/bin/bash
CURRENT_GAS_PRICE=$(./akash.gasPrice.get.sh)
NEW_GAS_PRICE="minimum-gas-prices = \"$1uakt\""

if [[ $# -ne 1 ]]; then
 echo "Error: Missing arguments"
 exit
fi

./helper.script.replace.sh "$HOME/.akash/config/app.toml" "$CURRENT_GAS_PRICE" "$NEW_GAS_PRICE"
