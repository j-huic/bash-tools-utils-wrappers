#!/bin/bash

last_download=$(ls -t ~/Downloads | head -n 1)

if [ -z "$last_download" ]; then
	echo "No files found in the Downloads folder"
	exit 1
fi

if [ -z "$1" ]; then
	echo "No destination provided"
	exit 1
fi

if [ -e "$1" ]; then
	echo "Error: Destination already exists"
	exit 1
fi

cp ~/Downloads/"$last_download" "$1"

echo "Moved $last_download to $1"
