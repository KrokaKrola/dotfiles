#!/bin/bash

# Exit on error
set -e

echo "Checking if Neovim is installed..."

# Check if Neovim is already installed
if command -v nvim &>/dev/null; then
    echo "Neovim is already installed. Skipping installation."
    exit 0
fi

echo "Installing Neovim from source..."

# Install dependencies
brew install ninja cmake unzip curl gettext

# Create a directory for Neovim source
mkdir -p "$HOME/dev"
cd "$HOME/dev"

# Clone the Neovim repository
if [[ -d "neovim" ]]; then
    echo "Neovim source already exists, updating..."
    cd neovim
    git pull
else
    echo "Cloning Neovim repository..."
    git clone https://github.com/neovim/neovim.git
    cd neovim
fi

# Checkout latest stable version
git checkout stable

# Build and install
make CMAKE_BUILD_TYPE=Release
sudo make install

# Verify installation
nvim --version
echo "Neovim installation completed."
