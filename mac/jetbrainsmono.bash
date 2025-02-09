#!/bin/bash

# Exit on error
set -e

echo "Installing JetBrains Mono Nerd Font..."

# Ensure Homebrew is installed
if ! command -v brew &>/dev/null; then
    echo "Error: Homebrew is not installed. Please install Homebrew first."
    exit 1
fi

# Ensure Homebrew Cask Fonts is installed
if ! brew tap | grep -q "homebrew/cask-fonts"; then
    echo "Adding Homebrew Cask Fonts..."
    brew tap homebrew/cask-fonts
fi

# Check if the font is already installed
if brew list --cask | grep -q "font-jetbrains-mono-nerd-font"; then
    echo "JetBrains Mono Nerd Font is already installed. Skipping installation."
else
    echo "Installing JetBrains Mono Nerd Font..."
    brew install --cask font-jetbrains-mono-nerd-font
fi

# Verify installation
if ls "$HOME/Library/Fonts/" | grep -qi "JetBrainsMonoNerdFont"; then
    echo "JetBrains Mono Nerd Font successfully installed!"
else
    echo "Error: Font installation failed."
    exit 1
fi
