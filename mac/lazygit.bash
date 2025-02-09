#!/bin/bash

# Exit on error
set -e

echo "Checking if lazygit is installed..."

# Check if lazygit is already installed
if brew list | grep -q "^lazygit$"; then
    echo "lazygit is already installed. Skipping installation."
else
    echo "Installing lazygit with Homebrew..."
    brew install lazygit
fi

# Verify installation
lazygit --version

echo "lazygit installation completed."
