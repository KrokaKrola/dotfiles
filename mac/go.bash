#!/bin/bash

# Exit on error
set -e

echo "Installing Go (Golang)..."

# Install Go using Homebrew
brew install go

# Get the installed Go version
GO_VERSION=$(go version | awk '{print $3}')

# Set up Go environment variables
GO_PATH="$HOME/go"
GO_ROOT="$(brew --prefix go)"
echo "export GOPATH=$GO_PATH" >> ~/.zshrc
echo "export GOROOT=$GO_ROOT" >> ~/.zshrc
echo 'export PATH="$GOROOT/bin:$GOPATH/bin:$PATH"' >> ~/.zshrc

# Apply the changes
source ~/.zshrc

# Verify installation
go version
echo "Go installation completed."
