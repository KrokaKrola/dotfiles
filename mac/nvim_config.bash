#!/bin/bash

# Exit on error
set -e

echo "Setting up custom Neovim configuration..."

# Define the Git repository URL for your Neovim config
NVIM_CONFIG_REPO="https://github.com/KrokaKrola/nvim"
NVIM_CONFIG_DIR="$HOME/.config/nvim"

# Ensure Git is installed
if ! command -v git &>/dev/null; then
    echo "Error: Git is not installed. Please install Git first."
    exit 1
fi

# Check if Neovim is installed
if ! command -v nvim &>/dev/null; then
    echo "Error: Neovim is not installed. Please install Neovim first."
    exit 1
fi

# Remove existing Neovim config if it exists
if [[ -d "$NVIM_CONFIG_DIR" ]]; then
    echo "Removing existing Neovim configuration..."
    rm -rf "$NVIM_CONFIG_DIR"
fi

# Clone the custom Neovim config repository
echo "Cloning Neovim configuration from $NVIM_CONFIG_REPO..."
git clone "$NVIM_CONFIG_REPO" "$NVIM_CONFIG_DIR"

# Verify cloning was successful
if [[ -d "$NVIM_CONFIG_DIR" ]]; then
    echo "Neovim configuration has been successfully cloned to ~/.config/nvim."
else
    echo "Error: Failed to clone Neovim configuration."
    exit 1
fi

echo "Custom Neovim configuration setup completed."
