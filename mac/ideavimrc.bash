#!/bin/bash

# Exit on error
set -e

echo "Setting up .ideavimrc configuration..."

# Get the script directory (absolute path)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Define the source file inside the project folder
SOURCE_CONFIG="$SCRIPT_DIR/../.config/.ideavimrc"
DEST_CONFIG="$HOME/.ideavimrc"

# Check if the source file exists
if [[ ! -f "$SOURCE_CONFIG" ]]; then
    echo "Error: .ideavimrc not found at $SOURCE_CONFIG. Skipping..."
    exit 1
fi

# Remove existing .ideavimrc if it exists
if [[ -f "$DEST_CONFIG" ]]; then
    echo "Replacing existing .ideavimrc..."
    rm -f "$DEST_CONFIG"
fi

# Copy the new .ideavimrc file
echo "Copying .ideavimrc to home directory..."
cp "$SOURCE_CONFIG" "$DEST_CONFIG"

# Verify that the file was copied
if [[ -f "$DEST_CONFIG" ]]; then
    echo ".ideavimrc has been successfully copied to the home directory."
else
    echo "Error: .ideavimrc was not copied successfully."
    exit 1
fi
