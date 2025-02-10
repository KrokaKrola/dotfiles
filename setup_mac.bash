#!/bin/bash

# Exit on error
set -e

# Get the script directory (absolute path)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# List of scripts to execute
SCRIPTS=(
    "$SCRIPT_DIR/common/ideavimrc.bash"
    "$SCRIPT_DIR/mac/brew.bash"
    "$SCRIPT_DIR/mac/fish.bash"
    "$SCRIPT_DIR/mac/node.bash"
    "$SCRIPT_DIR/mac/java.bash"
    "$SCRIPT_DIR/mac/go.bash"
    "$SCRIPT_DIR/mac/ideavimrc.bash"
    "$SCRIPT_DIR/mac/karabiner.bash"
    "$SCRIPT_DIR/mac/iterm2.bash"
    "$SCRIPT_DIR/mac/python.bash"
    "$SCRIPT_DIR/mac/zoxide.bash"
    "$SCRIPT_DIR/mac/lazygit.bash"
    "$SCRIPT_DIR/mac/btop.bash"
    "$SCRIPT_DIR/mac/nvim.bash"
    "$SCRIPT_DIR/mac/nvim_config.bash"
    "$SCRIPT_DIR/mac/jetbrainsmono.bash"
    "$SCRIPT_DIR/mac/omf.bash"
)

# Execute each script in order
for script in "${SCRIPTS[@]}"; do
    if [[ -f "$script" && -x "$script" ]]; then
        echo "Executing $script..."
        "$script"
    else
        echo "Skipping $script (not found or not executable)."
    fi
done

echo "macOS setup completed."
