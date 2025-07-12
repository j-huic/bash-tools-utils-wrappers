#!/bin/bash

last_download=$(ls -t ~/Downloads | head -n 1)

if [ -z "$last_download" ]; then
	echo "No files found in the Downloads folder"
	exit 1
fi

destination="./$last_download"

if [ -e "$destination" ]; then
	echo "Error: File $last_download already exists in current directory"
	exit 1
fi

cp ~/Downloads/"$last_download" "$destination"

echo "Moved $last_download to current directory"
