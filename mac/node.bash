#!/bin/bash

# Exit on error
set -e

echo "Installing NVM (Node Version Manager)..."

# Get the latest NVM install script dynamically
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash

# Ensure NVM is loaded
export NVM_DIR="$HOME/.nvm"
source "$NVM_DIR/nvm.sh"

# Install the latest Node.js version
echo "Installing the latest Node.js version..."
nvm install node
nvm alias default node

# Verify installation
echo "NVM version: $(nvm --version)"
echo "Node.js version: $(node -v)"
echo "NPM version: $(npm -v)"

echo "NVM and Node.js installation completed."
