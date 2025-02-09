#!/bin/bash

# Exit on error
set -e

echo "Checking if Python is installed..."

# Check if Python is already installed
if brew list | grep -q "^python@3"; then
    echo "Python is already installed. Skipping installation."
else
    echo "Installing Python with Homebrew..."
    brew install python
fi

# Get Python binary paths
PYTHON_BIN="$(brew --prefix python)/bin/python3"
PIP_BIN="$(brew --prefix python)/bin/pip3"

# Ensure Python and Pip are available in Fish Shell
FISH_CONFIG="$HOME/.config/fish/config.fish"

if ! grep -q "set -gx PATH $(brew --prefix python)/bin \$PATH" "$FISH_CONFIG"; then
    echo "Adding Python to Fish config..."
    echo "set -gx PATH $(brew --prefix python)/bin \$PATH" >> "$FISH_CONFIG"
fi

# Apply changes
source "$FISH_CONFIG"

# Verify installation
python3 --version
pip3 --version

echo "Python installation and configuration completed."
