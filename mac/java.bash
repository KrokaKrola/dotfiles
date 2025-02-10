#!/bin/bash

# Exit on error
set -e

echo "Installing SDKMAN! (Software Development Kit Manager)..."

# Ensure dependencies are installed
brew install curl unzip zip

# Install SDKMAN
curl -s "https://get.sdkman.io" | bash

# Ensure SDKMAN is loaded
export SDKMAN_DIR="$HOME/.sdkman"
source "$SDKMAN_DIR/bin/sdkman-init.sh"

# Verify SDKMAN installation
if command -v sdk &>/dev/null; then
    echo "SDKMAN installed successfully."
else
    echo "Error: SDKMAN installation failed."
    exit 1
fi

# Install the latest Java version
echo "Installing the latest Java version..."
sdk install java

# Verify Java installation
java -version

echo "SDKMAN and Java installation completed."
