#!/bin/bash

# Exit on error
set -e

echo "Checking if zoxide is installed..."

# Check if zoxide is already installed
if brew list | grep -q "^zoxide$"; then
    echo "zoxide is already installed. Skipping installation."
else
    echo "Installing zoxide with Homebrew..."
    brew install zoxide
fi

# Configure zoxide for Fish
FISH_CONFIG="$HOME/.config/fish/config.fish"

if ! grep -q "zoxide init fish | source" "$FISH_CONFIG"; then
    echo "Configuring zoxide for Fish..."
    echo "zoxide init fish | source" >> "$FISH_CONFIG"
fi

# Apply changes
source "$FISH_CONFIG"

# Verify installation
zoxide --version

echo "zoxide installation completed."
