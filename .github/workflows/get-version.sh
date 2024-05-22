#!/bin/bash

# Format is expect to be as follow:
# "...Release 1.2.3" or
# "...Release v1.2.3"
TITLE=${TAG}

# Regex to get release
regex='([Rr]elease)(\W[Vv]?)([0-9]+\.[0-9]+\.[0-9]+)(.*)'

if [[ "$TITLE" =~ $regex ]]; then
    echo "${BASH_REMATCH[3]}"
else
    echo "0.0.0"
fi
