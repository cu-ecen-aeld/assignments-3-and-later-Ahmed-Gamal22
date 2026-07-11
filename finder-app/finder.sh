#!/bin/sh

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <files_directory> <search_string>"
    exit 1
fi

filesdir="$1"
searchstr="$2"

if [ ! -d "$filesdir" ]; then
    echo "Error: Directory '$filesdir' does not exist."
    exit 1
fi

echo "The number of files are $(find -L "$filesdir" -type f | wc -l) and the number of matching lines are $(grep -r "$searchstr" "$filesdir" | wc -l)"