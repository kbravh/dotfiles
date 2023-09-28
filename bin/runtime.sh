#!/bin/bash

# Check for directory parameter
if [ "$#" -ne 1 ]; then
  echo "Usage: $0 /path/to/directory"
  exit 1
fi

# Initialize total_seconds to 0
total_seconds=0

# The directory in question
dir="$1"

# Store the output of 'find' command in a variable
files=$(find "$dir" -type f \( -name "*.mp4" -o -name "*.mkv" \))

# Loop over each file and calculate the duration
IFS=$'\n'  # Internal Field Separator set to newline for iteration
for file in $files; do
  # Use ffprobe to get the duration of each file in seconds
  duration=$(ffprobe -i "$file" -show_entries format=duration -v quiet -of csv="p=0")
  
  # Convert duration to integer and add it to total_seconds
  duration_int=${duration%.*}
  total_seconds=$((total_seconds + duration_int))
done

# Convert total_seconds to hours, minutes, and seconds
hours=$((total_seconds / 3600))
minutes=$(( (total_seconds % 3600) / 60 ))
seconds=$((total_seconds % 60))

echo "Total runtime of all video files: $hours hrs, $minutes mins, $seconds secs"

