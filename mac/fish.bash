#!/bin/bash

# Exit on error
set -e

# Fetch the latest Fish version dynamically from GitHub
FISH_INSTALL_DIR="/opt/homebrew"

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

echo "Fish Shell (version $LATEST_VERSION) installation completed"
