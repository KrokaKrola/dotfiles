#!/bin/bash

# Exit on error
set -e

echo "Installing Fish Shell directly from the official source..."

# Ensure required tools are installed
if ! command -v curl &>/dev/null || ! command -v tar &>/dev/null; then
    echo "Error: curl and tar are required but not found. Install them first."
    exit 1
fi

# Fetch the latest Fish version dynamically from GitHub
LATEST_VERSION=$(curl -sL "https://api.github.com/repos/fish-shell/fish-shell/releases/latest" | grep -Po '"tag_name": "\K.*?(?=")')
FISH_TARBALL="fish-${LATEST_VERSION}.tar.gz"
FISH_INSTALL_DIR="/usr/local/fish"

# Download the latest Fish binary package for macOS
echo "Downloading Fish Shell version ${LATEST_VERSION}..."
curl -Lo "$FISH_TARBALL" "https://github.com/fish-shell/fish-shell/releases/download/${LATEST_VERSION}/fish-${LATEST_VERSION}-macos.tar.gz"

# Extract and install Fish
sudo mkdir -p "$FISH_INSTALL_DIR"
sudo tar -xzf "$FISH_TARBALL" -C "$FISH_INSTALL_DIR" --strip-components=1
rm -f "$FISH_TARBALL"

# Get Fish binary path
FISH_PATH="$FISH_INSTALL_DIR/bin/fish"

# Add Fish to allowed shells if not already present
if ! grep -Fxq "$FISH_PATH" /etc/shells; then
    echo "Adding Fish to /etc/shells..."
    echo "$FISH_PATH" | sudo tee -a /etc/shells
fi

# Set Fish as the default shell
if [[ "$SHELL" != "$FISH_PATH" ]]; then
    echo "Setting Fish as the default shell..."
    chsh -s "$FISH_PATH"
else
    echo "Fish is already the default shell."
fi

# Verify installation
"$FISH_PATH" --version

echo "Fish Shell (version $LATEST_VERSION) installation completed. Restart your terminal or run 'exec fish' to switch."
