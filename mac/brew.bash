#!/bin/bash

# Exit on error
set -e

echo "Installing Homebrew..."

# Check if Homebrew is installed
if command -v brew &>/dev/null; then
    echo "Homebrew is already installed."
else
    # Install Homebrew using the official script
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Homebrew installation path (Apple Silicon only)
HOMEBREW_PREFIX="/opt/homebrew"

# Ensure Homebrew is added to Fish shell
FISH_CONFIG="$HOME/.config/fish/config.fish"

if ! grep -q "set -gx PATH $HOMEBREW_PREFIX/bin \$PATH" "$FISH_CONFIG"; then
    echo "Adding Homebrew to Fish config..."
    echo "set -gx PATH $HOMEBREW_PREFIX/bin \$PATH" >> "$FISH_CONFIG"
    echo "set -gx PATH $HOMEBREW_PREFIX/sbin \$PATH" >> "$FISH_CONFIG"
    echo "set -gx MANPATH $HOMEBREW_PREFIX/share/man \$MANPATH" >> "$FISH_CONFIG"
    echo "set -gx INFOPATH $HOMEBREW_PREFIX/share/info \$INFOPATH" >> "$FISH_CONFIG"
fi

# Apply changes
source "$FISH_CONFIG"

# Verify installation
brew --version
echo "Homebrew installation and Fish configuration completed."
