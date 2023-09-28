#!/bin/bash

# Check if directory is provided
if [ -z "$1" ]; then
    echo "Please provide a directory."
    exit 1
fi

# Change to the directory provided as argument
cd "$1"

# Loop through all .mp4 and .mkv files in the directory
for file in *.{mp4,mkv}; do
    # Ignore if no such file exists
    [ -e "$file" ] || continue
    # Use ffprobe to get the video resolution, redirect error stream to /dev/null
    resolution=$(ffprobe -v error -select_streams v:0 -show_entries stream=width,height -of csv=s=x:p=0 "$file" 2>/dev/null)
    # Check if ffprobe was successful. If not, skip this file.
    if [ $? -ne 0 ]; then
        echo "ffprobe had an issue with $file, skipping."
        continue
    fi
    # Split the resolution into width and height
    width=${resolution%x*}
    height=${resolution#*x}
    # If both width and height are greater than or equal to 2160 (4K), print the file
    if [ "$width" -ge 3840 ] && [ "$height" -ge 2160 ]; then
        echo "$file is of 4K quality"
    fi
done

