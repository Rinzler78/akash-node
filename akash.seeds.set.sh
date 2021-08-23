#!/bin/bash
CURRENT_STATE=$(./akash.seeds.sh)

if [[ $# -ne 1 ]]; then
 echo "Error: Missing arguments"
 exit
fi

NEW_STATE="seeds = \"$1\""
./helper.file.replace.sh "$HOME/.akash/config/config.toml" "$CURRENT_STATE" "$NEW_STATE"
