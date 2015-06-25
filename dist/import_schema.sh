#!/bin/bash

set -e

if [ -z "$1" ] || [ -z "$2" ]; then
    echo "Usage: $0 dbfile schema"
    echo "  dbfile    The file of the database to populate. It must be non-existent."
    echo "  schema    The directory where the schema files are located."
    exit 2
fi

DB_FILE=$1
SCHEMA_DIR=$2

if [ -f "$DB_FILE" ]; then
    echo "Database file already exists: \"$DB_FILE\"" ; exit 1
fi

if [ ! -d "$SCHEMA_DIR" ]; then
    echo "Schema directory does not exist: \"$SCHEMA_DIR\"" ; exit 1
fi

# Create DB file
touch "$DB_FILE"

# Import schema
for f in "$SCHEMA_DIR"/*
do
    echo "Importing \"$f\"..."
    cat "$f" | sqlite3 "$DB_FILE"
done
