#!/bin/bash

# Exit on error
set -e

echo "Checking if btop is installed..."

# Check if btop is already installed
if brew list | grep -q "^btop$"; then
    echo "btop is already installed. Skipping installation."
else
    echo "Installing btop with Homebrew..."
    brew install btop
fi

# Verify installation
btop --version

echo "btop installation completed."
