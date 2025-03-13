#!/bin/bash


dir="$1"
date_str=$(date +"%Y-%m-%d")
dir_name=$(basename "$dir")

if [ -z "$dir" ]; then
	echo "Usage: ./log-archive.sh <directory to archive>"
	echo "Try again"
	exit 1
fi

tar -czf "${dir_name}-${date_str}.tar.gz" -C "$dir" .
echo -e "Sucessfully archived log ${dir_name}-${date_str}.tar.gz to $(pwd)"





