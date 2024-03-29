#!/bin/bash

# Define a function to fix Liquid syntax errors in a file
fix_liquid_errors() {
    local file=$1
    # Backup the original file
    cp "$file" "$file.bak"
    # Fix the common Liquid syntax mistakes
    sed -i 's/{{!--/<!--/g; s/--}}/-->/' "$file"
    sed -i 's/{{#markdown }}/<!--/g; s/{{\/markdown }}/-->/' "$file"
}

export -f fix_liquid_errors

# Find all .hbs files and apply fixes
find . -type f -name "*.hbs" -exec bash -c 'fix_liquid_errors "$0"' {} \;
