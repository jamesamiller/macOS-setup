#!/usr/bin/env bash

# Install Bash 4 and GNU command-line tools using Homebrew.

# Make script executable: chmod u+x gnu.sh.

# Double check for Homebrew, and install if we don't have it.
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install GNU core and find utilities.
brew install coreutils
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum
# Note: To reference these utilities without the 'g' prefix, add
# $(brew --prefix coreutils)/libexec/gnubin in PATH before /usr/bin (which contains
# the default macOS tools). This is taken care of in my .bash_profile.
# Install GNU find utilities.
brew install findutils
# Note: Same here. Place these in PATH before the default macOS ones.

# More GNU utilities
brew install diffutils
brew install gawk
brew install gnu-indent --with-default-names
brew install gnu-sed --with-default-names
brew install gnu-tar --with-default-names
brew install gnu-which --with-default-names
brew install grep --with-default-names      # newer version of GNU tool that came with macOS
brew install make --with-default-names      # newer version of GNU tool that came with macOS
brew install gzip
brew install wget
brew install screen
brew install nano       # newer version of GNU tool that came with macOS
brew install emacs      # newer version of GNU tool that came with macOS

# Install Bash 4.
brew install bash
brew tap homebrew/versions
brew install bash-completion2
# We installed the new shell, now we have to activate it
echo "Adding the newly installed shell to the list of allowed shells..."
# Prompts for password
sudo bash -c 'echo /usr/local/bin/bash >> /etc/shells'
# Change to the new shell, prompts for password
chsh -s /usr/local/bin/bash

# Install other utilities and other more recent versions of some macOS tools. 
brew install moreutils
brew install openssh    # newer version of GNU tool that came with macOS
brew install vim --with-override-system-vi  # newer version of GNU tool that came with macOS
#brew install zsh

# Remove outdated versions from the cellar.
brew cleanup
