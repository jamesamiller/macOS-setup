#!/usr/bin/env bash

# Install macOS apps with Homebrew.

# Make script executable: chmod u+x apps.sh.

############### Homebrew ################

brew install git
brew install pandoc
#brew install wget
brew install markdown

############### Cask ################

brew install --cask alfred
brew install --cask iterm2
#brew install --cask xquartz
brew install --cask sublime-text
brew install --cask visual-studio-code
brew install --cask github
brew install --cask tower
brew install --cask google-chrome
brew install --cask firefox
brew install --cask epic
brew install --cask tor-browser
brew install --cask dropbox
brew install --cask evernote
brew install --cask 1password
#brew install --cask viscosity  #use protonVPN app now
brew install --cask google-drive-file-stream
brew install --cask adobe-creative-cloud
brew install --cask keka
brew install --cask texmaker
brew install --cask zoom
#brew install --cask keybase
#brew install --cask private-internet-access
brew install --cask graphsketcher

# Remove outdated versions from the cellar.
brew cleanup
