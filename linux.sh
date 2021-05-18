#!/bin/bash

# This script is for package installations and preferences on Arch-based systems of GNU/Linux
# This has not been tested before, so keep that in mind if you intend to use this
# If you see anything that can be improved/fixed, please create a pull request :)

# Directory this file is being run from
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

ln -s "$DIR/vimrc" "~/.vimrc" # Make symlink of vimrc to home directory
# Did it this way so that when git updates it, it auto-updates the current vim too

echo -n "Email for git: "
read GIT_EMAIL

echo -n "Name for git: "
read GIT_NAME

# Ask for user password immediately so it doesn't keep asking multiple times
sudo -v

# Cool site where you can search available packages:
# https://archlinux.org/packages/
pacman -Syu # Upgrade all pacman packages
pacman -S cmatrix newsboat-git steam davinci-resolve discord ttf-ms-fonts zoom vlc gimp discord youtube-dl snapd brave calibre chromium neofetch obs-studio thunderbird yay-git mlocate unrar foobar xorg-xev rhythmbox toilet vim amfora ueberzug
# amfora                # Gemini page viewer
# cmatrix               # Cuz it looks cool
# newsboat              # My default RSS reader
# davinci-resolve       # Video editor
# ttf-ms-fonts          # Common fonts
# zoom                  # Because who doesn't need this?
# vlc                   # For when mpv doesn't work
# mpv                   # Video viewer
# youtube-dl            # YouTube video downloader
# snapd                 # Install snapd store
# brave                 # Default browser
# calibre               # ebook manager
# chromium              # For when Brave doesn't work
# obs-studio            # Screen recording software
# texlive-most          # LaTeX Tools
# thunderbird           # Email client
# yay-git               # For AUR
# mlocate               # For 'locate' command
# xorg-xev              # 'xev' command for monitoring keypresses
# rhythmbox             # Music player
# toilet                # Cool terminal fonts
# ueberzug              # Images in terminal

# Setup snapd
systemctl enable --now snapd.socket
ln -s /var/lib/snapd/snap /snap

git clone https://aur.archlinux.org/yay-git.git
sudo chown -R tecmint:tecmint ./yay-git
cd yay-git
makepkg -si

yay -Syu # Upgrade all yay packages
yay -S gparted musikcube ytfzf minecraft-launcher spotify
# gparted       # Disk partition manager
# musikcube     # Terminal music player
# ytfzf         # Search YouTube videos through Terminal
# teams         # Microsoft Teams

git config --global user.email "$GIT_EMAIL"
git config --global user.name "$GIT_NAME"

# Install Plug for vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


systemctl enable sshd
systemctl enable plexmediaserver
systemctl enable transmission-daemon


# Other apps I would still need to install (terminal installation commands not found)
# megasync
# Whatsapp

# Allow incoming SSH on local network
systemctl enable sshd
systemctl start sshd



