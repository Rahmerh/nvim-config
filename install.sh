#!/bin/bash
. "./scripts/utils.sh"
. "./scripts/kitty.sh"
. "./scripts/brew.sh"
. "./scripts/spotify.sh"

# Get sudo access
print_info "\nChecking for sudo access...\n"
ask_for_sudo
print_success "Done!\n"

# (Re)install brew
print_info "\n(Re)installing brew...\n"

brew_install

print_success "Done!\n"

# (Re)create the .config folder
if [ ! -d ~/.config ]; then
    print_info "\nCreating config folder..\n"
    sudo mkdir ~/.config
    print_success "Done!\n"
else
    print_info "\nRecreating config folder..\n"
    sudo rm -rf ~/.config
    sudo mkdir ~/.config
    print_success "Done!\n"
fi

# Set fish config before doing anything else
# This is needed for brew to work
sudo ln -s "$PWD/config/fish" ~/.config

# Install brew packages
brew_bundle

# Create symlinks for all dotfiles
print_info "\nCreating symlinks...\n"

create_symlink "$PWD/config/nvim" ~/.config "nvim"
create_symlink "$PWD/config/kitty" ~/.config "kitty"
create_symlink "$PWD/config/spotify-tui" ~/.config "spotify-tui"

print_success "Done!\n"

print_info "\nReplacing kitty's icon...\n"

kitty_replace_icon

print_success "Done!\n"

print_info "\nReplacing the wallpaper...\n"

change_wallpaper "$PWD/util/wallpapers/mountains.jpg"

print_success "Done!\n"

print_info "\nSetting up spotify...\n"

spotify_setup

print_success "\n\nDone setting up your system.\n\n"

finished_message=$(< ./util/ascii-art.txt)

print_success "$finished_message"