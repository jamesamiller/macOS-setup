#!/usr/bin/env bash

# Install modern Bash and GNU command-line tools using Homebrew.

# Make script executable: chmod u+x gnu.sh.

# Save Homebrew’s installed location.
# This is '/usrlocal'
BREW_PREFIX=$(brew --prefix)

# Install GNU core utilities (those that come with macOS are outdated).
# Note: To reference these utilities without the 'g' prefix, add
# $(brew --prefix coreutils)/libexec/gnubin in PATH before /usr/bin (which contains
# the default macOS tools). This is taken care of in my .bash_profile through the .path file.
brew install coreutils
sudo ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Install GNU find utilities.
# Note: Same here. Place these in PATH before the default macOS ones.
brew install findutils

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
brew install vim --with-override-system-vi

# Install a modern version of Bash.
brew install bash
brew install bash-completion2

# Switch to using brew-installed bash as default shell
if ! fgrep -q "${BREW_PREFIX}/bin/bash" /etc/shells; then
  echo "${BREW_PREFIX}/bin/bash" | sudo tee -a /etc/shells;
  chsh -s "${BREW_PREFIX}/bin/bash";
fi;

# Install other utilities and other more recent versions of some macOS tools. 
brew install moreutils
brew install openssh    # newer version of GNU tool that came with macOS

# Remove outdated versions from the cellar.
brew cleanup
