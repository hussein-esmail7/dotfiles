#!/bin/bash

# This script is for package installations and preferences on Arch-based systems of GNU/Linux
# This has not been tested before, so keep that in mind if you intend to use this
# If you see anything that can be improved/fixed, please create a pull request :)

# Ask for user password immediately so it doesn't keep asking multiple times
sudo -v

# Cool site where you can search available packages:
# https://archlinux.org/packages/
pacman -S texlive-most                  # LaTeX Tools
pacman -S cmatrix                       # Cuz it looks cool
pacman -S newsboat                      # My default RSS reader
pacman -S steam
pacman -S davinci-resolve
pacman -S discord
pacman -S minecraft-launcher
pacman -S ttf-ms-fonts
pacman -S zoom
pacman -S vlc
pacman -S gimp
pacman -S code                          # VS Code
pacman -S calibre
pacman -S discord
pacman -S youtube-dl
pacman -S snapd                         # Install snapd store
pacman -S brave                         # Default browser
pacman -S calibre                       # ebook manager
pacman -S chromium                      # For when Brave doesn't work
pacman -S lollypop                      # Music player
pacman -S neofetch
pacman -S obs-studio                    # Screen record
pacman -S thunderbird                   # Email client
pacman -S yay-git                       # For AUR

# Setup snapd
systemctl enable --now snapd.socket
ln -s /var/lib/snapd/snap /snap

# https://snapcraft.io
snap install teams-for-linux            # Install Microsoft Teams

sudo git clone https://aur.archlinux.org/yay-git.git
sudo chown -R tecmint:tecmint ./yay-git
cd yay-git
makepkg -si
sudo yay -Syu # Upgrade all yay packages
sudo pacman -Syu # Upgrade all pacman packages
sudo yay -S gparted


# Other apps I would still need to install (terminal installation commands not found)
# megasync
# Spotify
# Whatsapp





