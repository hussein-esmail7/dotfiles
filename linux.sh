#!/bin/bash

# This script is for package installations and preferences on Arch-based systems of GNU/Linux
# This has not been tested before, so keep that in mind if you intend to use this
# If you see anything that can be improved/fixed, please create a pull request :)

# Ask for user password immediately so it doesn't keep asking multiple times
sudo -v

# Cool site where you can search available packages:
# https://archlinux.org/packages/
pacman -S texlive-most textlive-lang    # LaTeX Tools
pacman -S cmatrix                       # Cuz it looks cool
pacman -S newsboat                      # My default RSS reader
pacman -S steam
pacman -S vlc
pacman -S gimp
pacman -S code                          # VS Code
pacman -S calibre
pacman -S discord
pacman -S ffmpeg
pacman -S vivaldi                       # My default browser
pacman -S python
pacman -S youtube-dl
pacman -S snapd                         # Install snapd store

# Setup snapd
systemctl enable --now snapd.socket
ln -s /var/lib/snapd/snap /snap

# https://snapcraft.io
snap install teams-for-linux            # Install Microsoft Teams

# Other apps I would still need to install (terminal installation commands not found)
# megasync
# Minecraft
# Spotify
# Whatsapp
# Zoom.us





