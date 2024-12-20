#!/usr/bin/env bash

# Get location of script assuming it is in a dotfiles directory
BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# If GNU Stow is installed
if ! command -v stow &>/dev/null; then
    echo "GNU Stow could not be found. Please install it first."
    exit 1
fi

# Function to display usage guide
usage() {
    echo "Usage: $0 [-n]"
    echo "-n    : Non-destructive (dry-run) mode, just display what would be done"
    exit 1
}

# Set default behavior
DRY_RUN="false"

# Parse command-line options
while getopts "n" option; do
    case $option in
    n) DRY_RUN="true" ;;
    *) usage ;;
    esac
done

# Remove parsed options from positional parameters
shift $((OPTIND - 1))

# Ensuring the base directory exists
if [ ! -d "$BASE_DIR" ]; then
    echo "Base directory $BASE_DIR does not exist."
    exit 1
fi

# Enter the base directory
cd "$BASE_DIR" || exit

# Loop over each directory inside the base directory and run stow
for module in */; do
    module_name="${module%/}" # Remove trailing slash
    if [ "$DRY_RUN" == "true" ]; then
        echo "Dry-Run: Would run 'stow -nv $module_name'"
        stow -nv "$module_name"
    else
        echo "Stowing $module_name..."
        stow -v "$module_name"
    fi
done
