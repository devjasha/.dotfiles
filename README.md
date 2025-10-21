# Dotfiles

My personal Arch Linux + Hyprland configuration files.

## What's Included

- **Hyprland** - Wayland compositor configuration
- **Waybar** - Status bar with custom styling
- **Wofi** - Application launcher
- **PWA Scripts** - Web app launcher creation tools
- **Web Apps** - Pre-configured PWAs (Discord, X, ChatGPT, WhatsApp, YouTube, Gmail, GitHub)

## Installation

### Prerequisites

```bash
# Install required packages
sudo pacman -S hyprland waybar wofi chromium ttf-cascadia-mono-nerd otf-font-awesome
```

### Install Dotfiles

```bash
# Clone the repository
git clone <your-repo-url> ~/dotfiles

# Run the installation script
cd ~/dotfiles
./install.sh
```

The install script will:
- Create symlinks from `~/.config` to the dotfiles repo
- Backup any existing configs to `*.backup`
- Set up all scripts and web app launchers

## Features

### Keybindings

- `Super + Q` - Open terminal (ghostty)
- `Super + R` - Open app launcher (wofi)
- `Super + Shift + B` - Open browser (chromium)
- `Super + E` - Open file manager (dolphin)
- `Super + C` - Close active window
- `Super + V` - Toggle floating
- `Super + H/J/K/L` - Move focus (vim-style)
- `Super + 1-9` - Switch workspace

### PWA Web Apps

Launch standalone web apps with:
- Discord
- X (Twitter)
- ChatGPT
- WhatsApp
- YouTube
- Gmail
- GitHub

### Creating New PWAs

```bash
create-pwa 'App Name' 'https://url.com' 'icon-name' 'Category;'
```

## Customization

### Colors

The theme uses a cyan accent color (`#33ccff`). To change:
- Hyprland borders: `~/.config/hypr/hyprland.conf` (line 92)
- Waybar highlights: `~/.config/waybar/style.css`
- Wofi borders: `~/.config/wofi/style.css`

## Updating

Any changes you make to your configs will automatically be reflected in the dotfiles repo since they're symlinked. Just commit and push:

```bash
cd ~/dotfiles
git add .
git commit -m "Update configuration"
git push
```

## License

Feel free to use and modify as you wish!
