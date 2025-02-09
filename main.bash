#!/bin/bash

# Ensure a parameter is passed
if [ -z "$1" ]; then
    echo "Usage: $0 <os-type>"
    echo "Valid options: mac, linux"
    exit 1
fi

OS_TYPE=$1

# Validate the OS type
if [[ "$OS_TYPE" != "mac" && "$OS_TYPE" != "linux" ]]; then
    echo "Invalid OS type: $OS_TYPE"
    echo "Valid options are 'mac' or 'linux'"
    exit 1
fi

# Execute OS-specific configuration script
SCRIPT_DIR="$(dirname "$0")"
CONFIG_SCRIPT="$SCRIPT_DIR/setup_$OS_TYPE.bash"

if [ -f "$CONFIG_SCRIPT" ]; then
    echo "Executing configuration for $OS_TYPE..."
    bash "$CONFIG_SCRIPT"
else
    echo "Error: Configuration script for $OS_TYPE not found. Expected: $CONFIG_SCRIPT"
    exit 1
fi
