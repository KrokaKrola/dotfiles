#!/bin/bash

# Exit on error
set -e

echo "Installing Karabiner-Elements with Homebrew..."

# Install Karabiner-Elements using Homebrew
brew install --cask karabiner-elements

# Get the script directory (absolute path)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Define source and destination paths for Karabiner config
SOURCE_CONFIG="$SCRIPT_DIR/../.config/karabiner/karabiner.json"
DEST_DIR="$HOME/.config/karabiner"
DEST_CONFIG="$DEST_DIR/karabiner.json"

# Check if the source file exists
if [[ ! -f "$SOURCE_CONFIG" ]]; then
    echo "Error: karabiner.json not found at $SOURCE_CONFIG. Skipping..."
    exit 1
fi

# Ensure the destination directory exists
mkdir -p "$DEST_DIR"

# Remove existing karabiner.json if it exists
if [[ -f "$DEST_CONFIG" ]]; then
    echo "Replacing existing karabiner.json..."
    rm -f "$DEST_CONFIG"
fi

# Copy the new karabiner.json file
echo "Copying karabiner.json to ~/.config/karabiner/"
cp "$SOURCE_CONFIG" "$DEST_CONFIG"

# Verify that the file was copied
if [[ -f "$DEST_CONFIG" ]]; then
    echo "karabiner.json has been successfully copied to ~/.config/karabiner/."
else
    echo "Error: karabiner.json was not copied successfully."
    exit 1
fi

echo "Karabiner-Elements installation and configuration completed."
