#!/bin/bash

# Exit on error
set -e

echo "Checking if iTerm2 is installed..."

# Check if iTerm2 is already installed
if brew list --cask | grep -q "iterm2"; then
    echo "iTerm2 is already installed. Skipping installation."
else
    echo "Installing iTerm2 with Homebrew..."
    brew install --cask iterm2
fi

# Get the script directory (absolute path)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Define source and destination paths for iTerm2 Profiles.json
SOURCE_CONFIG="$SCRIPT_DIR/../.config/iterm2/Profiles.json"
DEST_DIR="$HOME/Library/Application Support/iTerm2/DynamicProfiles"
DEST_CONFIG="$DEST_DIR/Profiles.json"

# Check if the source file exists
if [[ ! -f "$SOURCE_CONFIG" ]]; then
    echo "Error: Profiles.json not found at $SOURCE_CONFIG. Skipping..."
    exit 1
fi

# Ensure the destination directory exists
mkdir -p "$DEST_DIR"

# Remove existing Profiles.json if it exists
if [[ -f "$DEST_CONFIG" ]]; then
    echo "Replacing existing Profiles.json..."
    rm -f "$DEST_CONFIG"
fi

# Copy the new Profiles.json file
echo "Copying Profiles.json to iTerm2 configuration directory..."
cp "$SOURCE_CONFIG" "$DEST_CONFIG"

# Verify that the file was copied
if [[ -f "$DEST_CONFIG" ]]; then
    echo "Profiles.json has been successfully copied to iTerm2."
else
    echo "Error: Profiles.json was not copied successfully."
    exit 1
fi

echo "iTerm2 installation and configuration completed."
