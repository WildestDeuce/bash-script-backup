#!/bin/bash
#Charles Mercer

source_directory="$1"
destination_directory="$2"
timestamp=$(date +%Y-%m-%d_%H-%M-%S)

if [ "$#" -ne 2 ]; then
	echo "Incorrect number of arguments provided"
	exit 3
fi

sudo mkdir -p "$destination_directory"
echo "Directory created: $destination_directory"

tar -czf "$destination_directory/cmercer-backup.tar" "$source_directory"
rsync -av "$source_directory" "$destination_directory"


if [ "$?" -ne 0 ]; then
  echo "Error creating tar archive"
  exit 1
fi
echo "Backup completed successfully"
echo "Current Timestamp: $timestamp"


