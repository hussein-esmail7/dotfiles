#!/bin/bash

# This file is meant to install all the libraries I normally use on macOS

# Ask the user immediately for the password so the program doesn't ask multiple times
sudo -v

# Install homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" 

# Install pip
sudo easy_install pip

# Install homebrew packages and apps
brew tap makeworld-the-better-one/tap # Used to install amfora
brew -q install amfora
brew -q install cmatrix
brew -q install bash
brew -q install newsboat
brew -q install steam
brew -q install vlc
brew -q install gimp
brew -q install qlab
brew -q install visual-studio-code
brew -q install calibre
brew -q install chromedriver
brew -q install clocksaver
brew -q install discord
brew -q install eclipse-java
brew -q install ffmpeg
brew -q install get-lyrical
brew -q install google-backup-and-sync
brew -q install groff qs
brew -q install megasync
brew -q install messenger
brew -q install microsoft-auto-update
brew -q install microsoft-excel
brew -q install microsoft-powerpoint
brew -q install microsoft-teams
brew -q install microsoft-word
brew -q install minecraft
brew -q install mutespotifyads
brew -q install spotify
brew -q install the-unarchiver
brew -q install vivaldi
brew -q install wget --with-libressl
brew -q install whatsapp
brew -q install zoomus
brew -q install terminal-notifier
brew -q install awk
brew -q install node

# Install python libraries I use
python3 -m pip install base64
python3 -m pip install bs4
python3 -m pip install imdbpy
python3 -m pip install pick
python3 -m pip install pillow
python3 -m pip install py2app
python3 -m pip install pygame
python3 -m pip install PyGetWindow
python3 -m pip install pyperclip
python3 -m pip install pyqrcode
python3 -m pip install pyserial
python3 -m pip install pytesseract
python3 -m pip install pytube
python3 -m pip install rawpy
python3 -m pip install requests
python3 -m pip install selenium
python3 -m pip install Send2Trash
python3 -m pip install spotipy
python3 -m pip install termcolor
python3 -m pip install numpy
python3 -m pip install termcolor
python3 -m pip install tkinter
python3 -m pip install unidecode
python3 -m pip install webbrowser
python3 -m pip install youtube-dl

# Link the version of Python to the homebrew's python
brew -q link python@3.9

# Automatically restart if the conputer freezes
sudo systemsetup -setrestartfreeze on

# Make Finder able to "Quit"
defaults write com.apple.finder QuitMenuItem -bool true

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Automatically quit printer app once the print jobs complete
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# Save to disk (not to iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Enable AirDrop over Ethernet and on unsupported Macs running Lion
defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true

# Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Finder: show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Save screenshots to the Downloads folder
defaults write com.apple.screencapture location -string "${HOME}/Downloads"
# Save screenshots in JPG format (other options: BMP, GIF, JPG, PDF, TIFF)
defaults write com.apple.screencapture type -string "jpg"
killall SystemUIServer

# I forget what these do...
defaults write com.apple.Safari WebKitMediaPlaybackAllowsInline -bool false
defaults write com.apple.SafariTechnologyPreview WebKitMediaPlaybackAllowsInline -bool false

# Turn off the creation of .DS_Store files
defaults write com.apple.desktopservices DSDontWriteNetworkStores true 
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Copy email addresses as `foo@example.com` instead of `Foo Bar <foo@example.com>` in Mail.app
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false

# Add the keyboard shortcut ⌘ + Enter to send an email in Mail.app
defaults write com.apple.mail NSUserKeyEquivalents -dict-add "Send" "@\U21a9"

touch .hushlogin # Removing the "Last login: blah blah blah" on Terminal startup

# Disable spell check on iMessage
defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "continuousSpellCheckingEnabled" -bool false

# Get imgcat so you can display images in iTerm2
sudo curl -o /usr/local/bin/imgcat -0 https://iterm2.com/utilities/imgcat && sudo chmod +x /usr/local/bin/imgcat

# When opening TextEdit, display a new .txt file instead of the file picker
defaults write com.apple.TextEdit NSShowAppCentricOpenPanelInsteadOfUntitledFile -bool false

# Security fix by Sun Knuden 
echo "127.0.0.1 ocsp.apple.com isrg.trustid.ocsp.identrust.com" | sudo tee -a /etc/hosts

# Set Dark mode
osascript -e 'tell application "System Events" to tell appearance preferences to set dark mode to true'

# Link Python3 to Python (since 2.7 is depricated)
ln -s -f /usr/local/bin/python3.9 /usr/local/bin/python

# Installing youtube-dl
sudo wget https://yt-dl.org/downloads/latest/youtube-dl -O /usr/local/bin/youtube-dl 
sudo chmod a+rx /usr/local/bin/youtube-dl 

# Installing ffmpeg-progressbar-cli
# https://github.com/sidneys/ffmpeg-progressbar-cli
npm install --global ffmpeg-progressbar-cli
