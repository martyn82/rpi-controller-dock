#!/bin/bash

set -e

regex='"DatabaseFile": "(.*)"' ; [[ "$(cat /controllerd.conf.json)" =~ $regex ]] && dbfile="${BASH_REMATCH[1]}" \
    && /import_schema.sh "$dbfile" /schema
