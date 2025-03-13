#!/bin/bash

GREEN="\e[32m"
RED="\e[31m"
YELLOW="\e[33m"
RESET="\e[0m"

# Check if required argument is provided
if [ -z "$1" ]; then
    echo -e "${RED}Usage: $0 <directory-to-archive> [storage-location] [compression-method]${RESET}"
    echo -e "Example: $0 /var/logs /backups gz"
    exit 1
fi


dir="$1"
storage_dir="${2:-$(pwd)}"  # Default to current directory if not provided
compression_method="${3:-gz}"  # Default to gzip
date_str=$(date +"%Y-%m-%d")
dir_name=$(basename "$dir")

# Check if directory exists
if [ ! -d "$dir" ]; then
    echo -e "${RED}Error: Directory '$dir' not found.${RESET}"
    exit 1
fi

# Ensure storage directory exists
mkdir -p "$storage_dir"

# Determine compression method
case "$compression_method" in
    gz)  ext="tar.gz";  compress_flag="z" ;;
    bz2) ext="tar.bz2"; compress_flag="j" ;;
    xz)  ext="tar.xz";  compress_flag="J" ;;
    *)
        echo -e "${YELLOW}Invalid compression method! Using default: gz.${RESET}"
        ext="tar.gz"
        compress_flag="z"
        ;;
esac

# Archive the directory
archive_file="${storage_dir}/${dir_name}-${date_str}.${ext}"
tar -c${compress_flag}f "$archive_file" -C "$dir" .

# Verify if the archive was created successfully
if [ $? -eq 0 ]; then
    echo -e "${GREEN}Successfully archived log to ${archive_file}${RESET}"
    
    # Log the archive record
    log_file="${storage_dir}/log-archive-history.txt"
    echo "$(date +"%Y-%m-%d %H:%M:%S") - Archived: $archive_file" >> "$log_file"
    echo -e "${GREEN}Log saved to ${log_file}${RESET}"
else
    echo -e "${RED}Error: Failed to create archive.${RESET}"
    exit 1
fi



