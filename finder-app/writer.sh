#!/bin/sh
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <write_file> <write_string>"
    exit 1
fi

writefile="$1"
writestr="$2"

if [ ! -f "$writefile" ]; then
    mkdir -p "$(dirname "$writefile")"
    touch "$writefile"
fi

echo "$writestr" > "$writefile" 

if [ $? -ne 0 ]; then
    echo "Error: Failed to write to file '$writefile'."
    exit 1
fi

