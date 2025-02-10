#!/bin/bash

# Exit on error
set -e

echo "Installing Oh My Fish (OMF)..."

# Ensure Fish Shell is installed
if ! command -v fish &>/dev/null; then
    echo "Fish Shell is not installed. Please install Fish first."
    exit 1
fi

# Install Oh My Fish
fish -c "curl -L https://get.oh-my.fish | fish"

# Verify installation
if fish -c "omf --version" &>/dev/null; then
    echo "Oh My Fish installed successfully."
else
    echo "Error: Oh My Fish installation failed."
    exit 1
fi

fish -c "omf install bobthefish" # Install bobthefish theme
fish -c "omf install nvm"  # Install the NVM plugin for Fish
fish -c "omf install sdk"  # Install the SDKMAN plugin for Fish

# Ensure Fish loads NVM correctly
echo "set -gx NVM_DIR \$HOME/.nvm" >> ~/.config/fish/config.fish
echo "bass source ~/.nvm/nvm.sh" >> ~/.config/fish/config.fish

# Ensure Fish loads Go environment correctly
echo "set -gx GOPATH \$HOME/go" >> ~/.config/fish/config.fish
echo "set -gx GOROOT (brew --prefix go)" >> ~/.config/fish/config.fish
echo "set -gx PATH \$GOROOT/bin \$GOPATH/bin \$PATH" >> ~/.config/fish/config.fish

# Ensure Fish loads SDKMAN correctly
echo "set -gx SDKMAN_DIR \$HOME/.sdkman" >> ~/.config/fish/config.fish
echo "bass source \$SDKMAN_DIR/bin/sdkman-init.sh" >> ~/.config/fish/config.fish

echo "OMF installation completed. Restart Fish Shell or run 'exec fish' to apply changes."

