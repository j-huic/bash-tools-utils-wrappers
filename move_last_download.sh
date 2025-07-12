#!/bin/bash

last_download=$(ls -t ~/Downloads | head -n 1)

if [ -z "$last_download" ]; then
	echo "No files found in the Downloads folder"
	exit 1
fi

# Set destination directory (default to current directory)
dest_dir="${1:-.}"

# Create destination directory if it doesn't exist
if [ "$dest_dir" != "." ]; then
	mkdir -p "$dest_dir"
fi

destination="$dest_dir/$last_download"

if [ -e "$destination" ]; then
	if [ "$dest_dir" = "." ]; then
		echo "Error: File $last_download already exists in current directory"
	else
		echo "Error: File $last_download already exists in $dest_dir/"
	fi
	exit 1
fi

cp ~/Downloads/"$last_download" "$destination"

if [ "$dest_dir" = "." ]; then
	echo "Moved $last_download to current directory"
else
	echo "Moved $last_download to $dest_dir/"
fi
