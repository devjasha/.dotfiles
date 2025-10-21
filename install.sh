#!/bin/bash

# Dotfiles installation script
# This script creates symlinks from your home directory to the dotfiles repo

DOTFILES_DIR="$HOME/dotfiles"

echo "Installing dotfiles from $DOTFILES_DIR"

# Function to create symlink
create_symlink() {
    local source="$1"
    local target="$2"

    # Create parent directory if it doesn't exist
    mkdir -p "$(dirname "$target")"

    # Backup existing file/directory if it exists and is not a symlink
    if [ -e "$target" ] && [ ! -L "$target" ]; then
        echo "Backing up existing $target to $target.backup"
        mv "$target" "$target.backup"
    fi

    # Remove old symlink if it exists
    if [ -L "$target" ]; then
        rm "$target"
    fi

    # Create symlink
    ln -s "$source" "$target"
    echo "Created symlink: $target -> $source"
}

# Symlink config directories
create_symlink "$DOTFILES_DIR/.config/hypr" "$HOME/.config/hypr"
create_symlink "$DOTFILES_DIR/.config/waybar" "$HOME/.config/waybar"
create_symlink "$DOTFILES_DIR/.config/wofi" "$HOME/.config/wofi"
create_symlink "$DOTFILES_DIR/.config/nvim" "$HOME/.config/nvim"

# Symlink scripts
create_symlink "$DOTFILES_DIR/.local/bin/create-pwa" "$HOME/.local/bin/create-pwa"

# Symlink web app launchers
for app in "$DOTFILES_DIR/.local/share/applications"/*-webapp.desktop; do
    if [ -f "$app" ]; then
        app_name=$(basename "$app")
        create_symlink "$app" "$HOME/.local/share/applications/$app_name"
    fi
done

echo ""
echo "Dotfiles installation complete!"
echo "Your config files are now symlinked to $DOTFILES_DIR"
echo ""
echo "To apply changes:"
echo "  - Hyprland: Log out and log back in"
echo "  - Waybar: pkill waybar && waybar &"
