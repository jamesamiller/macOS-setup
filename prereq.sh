#!/usr/bin/env bash

# Takes care of the prerequisites for software installs. 

# Make script executable: chmod u+x prereq.sh

# Install Xcode Command Line Tools.
echo "------------------------------"
echo "Installing Xcode Command Line Tools..."
echo "------------------------------"
xcode-select --install

# Install Homebrew.
echo "------------------------------"
echo "Installing Homebrew..."
echo "------------------------------"
if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Check it.
echo "------------------------------"
echo "Checking Homebrew install..."
echo "------------------------------"
brew doctor

# Install mas.
echo "------------------------------"
echo "Installing mas..."
echo "------------------------------"
brew install mas
echo "------------------------------"
echo "Done with prerequisite installs."
echo "Now sign in to the Mac App Store to wrap up: 'mas signin myemail@myemail.com'"
