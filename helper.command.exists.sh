#!/bin/bash
if which $1 >/dev/null; then
    return 0
fi

return 1
