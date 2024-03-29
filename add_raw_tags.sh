#!/bin/bash

# Define a function to add raw tags around Liquid tags
add_raw_tags() {
    local file=$1
    # Backup the original file
    cp "$file" "$file.bak"
    # Use sed to add {% raw %} and {% endraw %} around Liquid tags
    sed -i 's/{{/{% raw %}{{/g; s/}}/}}{% endraw %}/g' "$file"
}

export -f add_raw_tags

# Find all .html and .md files (or other file types as needed) and process them
find . \( -name "*.html" -o -name "*.md" \) -exec bash -c 'add_raw_tags "$0"' {} \;

