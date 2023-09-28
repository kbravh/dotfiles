#!/bin/bash

# Directory containing the video files
dir="$1"

# Loop over all .mp4 and .mkv files in the directory
echo "Spanish audio track found in:"
for file in "$dir"/*.{mp4,mkv}; do
  # Check if the file exists (this handles the case where there are no files with the given extension)
  if [ -f "$file" ]; then
    # Use ffprobe to list the metadata for each audio stream in the file
    # and grep to check for the presence of a Spanish audio track
    if ffprobe -v quiet -select_streams a -show_streams "$file" | grep -q "TAG:language=spa"; then
      echo "$(basename "$file")"
    fi
  fi
done

