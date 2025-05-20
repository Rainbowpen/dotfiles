#!/bin/bash

home=~/
# Set the directory where the files are located
DIR="${home}/.local/share/tmux/resurrect"  # Replace with your actual directory

# Find the last created file based on the timestamp in the filename
last_file=$(ls -1 "${DIR}/tmux_resurrect_"*.txt | sort -r | head -n 1)

# Check if a file was found
if [[ -n "$last_file" ]]; then
    # Check if a file is NOT empty
    if [ -s "$last_file" ]; then
        # file is not empty
        echo "Nothing wrong."
    else
        # file is empty
        # Delete the last created file
        rm -f "$last_file"
        last_file=$(ls -1 "${DIR}/tmux_resurrect_"*.txt | sort -r | head -n 1)
        echo "Deleted file: $last_file"

    fi
    # Create a symbolic link called "last" pointing to the file
    rm "${DIR}/last"
    cd ${DIR} || exit
    ln -s "$last_file" "last"
    echo "Created symbolic link: ${DIR}/last"
else
      echo "No files found matching the pattern."
fi
cd || cd ~/ || echo "Failed to cd back home. What a loser."
