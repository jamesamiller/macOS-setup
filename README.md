# MacOS Setup

These instructions are for configuring a new install of macOS, based on my research, teaching, and personal needs. You can clone or fork this repository and modify the accompanying scripts to suit yourself. 

### References and Additional Resources

- [Terminal commands](https://github.com/herrbischoff/awesome-macos-command-line)
- [Another macOS setup](https://gist.github.com/kevinelliott/7152e00d6567e223902a4775b5a0a0be)
- [Mathias Bynens' dotfiles](https://github.com/mathiasbynens/dotfiles)

# First Steps

1. Have available
    - iCloud username and password
    - App Store username and password (if different)
1. See if there is a macOS update
2. Through the System Preferences panel, set 
    - Mouse behavior (e.g., tracking speed, scrolling)
    - Screen and Energy Saver options
    - Dock size
    - Finder preferences and layout
    - Firewall
    - Hostname
    - In Spotlight, deselect "Spotlight Suggestions" and "Allow Spotlight Suggestions in Lookup"
3. [Restart in recovery mode](https://support.apple.com/en-us/HT201314) and [set firmware password](https://support.apple.com/en-us/HT204455).
4. Sign in to iCloud and sync (including Photos).

# Software Installation

## Prerequisites

We need these first:
- Xcode Command Line Tools
- [Homebrew](https://brew.sh/)
- [mas](https://github.com/mas-cli/mas)

These three items are handled by the script `prereq.sh`. Retrieve it in the Terminal with

`curl -o prereq.sh https://raw.githubusercontent.com/jamesamiller/macOS-setup/master/prereq.sh`

and then make it executable

`chmod u+x prereq.sh`

and run it

`./prereq.sh`

At this point, it should ask for an App Store signin. If not, sign in manually through the App. 

## Applications via Homebrew

Retrieve the script `apps.sh`

`curl -o apps.sh https://raw.githubusercontent.com/jamesamiller/macOS-setup/master/apps.sh`

and edit for any additions or deletions. Make the script executable as above and run it.

### Sign-ins and Cloud Storage

Sign into
-1Password
-Chrome, Firefox
-Dropbox (and sync)
-Evernote (and sync)
-Google Drive Filestream (and sync)
-Adobe Creative Cloud
-Zoom

### Alfred Sync

Set up syncing to `~/Dropbox/Alfred\ Sync` and supply the license for Powerpack.

### iTerm2 Sync

Set up preference syncing in iTerm2 to the directory `~/Dropbox/iTerm2`.

## Mac App Store (XXX working...)

These applications are installed with the bash script `mas.sh`.

Grab the script

`curl -o mas.sh https://raw.githubusercontent.com/jamesamiller/macOS-setup/master/mas.sh`

and as before review it and make any last-minute changes. Change permissions to make is executable and then run it. 

## Misc Applications

- Office 2016 for Mac
- Mathematica
- Matlab
- Julia and Pluto ([instructions here](https://computationalthinking.mit.edu/Fall20/installation/))
- MacTeX
- Adobe Creative Cloud apps, such as
	- Acrobat DC
	- Lightroom
	- Photoshop
- ScanSnap Tools
- Epson Tools

# More Configuration

## Dotfiles

Create the directory`~/GitHub/dotfiles`.

Clone my remote `.dotfiles` repository 

`https://github.com/jamesamiller/dotfiles.git` 

to `~/GitHub/dotfiles` and run `symlinks.sh` to construct symbolic links from the home directory to the local repository.

## Specific macOS Preferences

I don't have many for the time being, and these can be done manually.

```bash
# Show the ~/Library folder
chflags nohidden ~/Library

# Store screenshots in Dropbox
defaults write com.apple.screencapture location ~/Dropbox/Screenshots

# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
defaults write com.apple.screencapture type -string "png"

# Show the full path at the top of the finder window
defaults write com.apple.finder _FXShowPosixPathInTitle -bool YES; killall Finder

# Immediate showing of hidden Dock
defaults write com.apple.dock autohide-time-modifier -int 0;killall Dock

# Mail: Disable inline attachments (just show the icons)
defaults write com.apple.mail DisableInlineAttachmentViewing -bool true
```

## MacTeX

After the MacTeX install, we need to install extra fonts and set up access to my sty files.

### Fonts

**Note:** Logout of the bash shell and start a new one, or TeXLive will not be in the path and the following install will hang.

I need to add the [MathTime Professional 2 fonts](http://www.pctex.com/mtpro2.html). General instructions can be found [here](http://cims.nyu.edu/~fennell/mtpro2/). For my set up, the fonts are installed as follows.

Change directory 

`cd /Users/miller/Dropbox/Software/TeX/MathTime\ Pro\ Fonts/mtpro2-texlive`

and make the installer script user executable (if it isn't already)

`chmod u+x ./mtpro2-texlive.sh`

Then run the script, including the path to the font files

`./mtpro2-texlive.sh -i ../mtp2fonts/mtp2fonts.zip.tpm`

### Style Files

My personal sty files are stored and synced on Dropbox. TeXLive will look for custom style files in `~/Library/texmf/tex/latex`, so we need to create a symbolic link. 

```bash
cd ~/Library
mkdir texmf
cd texmf
mkdir tex
cd tex
ln -s ~/Dropbox/Library/texmf/tex/latex
```

## Sublime Text

### Package Control

Instructions on setting up Package Control with Sublime Text are found [here](https://packagecontrol.io/installation#st3). (Heeding their warning, I'm not reproducing the code but rather linking to theirs.)

### Sync Packages

I [sync packages with Dropbox](https://packagecontrol.io/docs/syncing). I just need to create a sym link to those with

```bash
cd ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/
rm -r User
ln -s ~/Dropbox/Sublime/User
```

Now any package additions or changes will be synced across all my machines. 

### Markdown Support

The `Markdown` package for `Sublime Text` will be loaded in the last step. Let's take care of the configuration for the viewer `Marked 2` at this point.

Download custom `css` themes directory with

`curl -o md_css_themes https://raw.githubusercontent.com/jamesamiller/macOS-Sierra-Setup/master/md_css_themes`

and then load these into `Marked 2` via the `Preferences -> Style` panel. 

## Create Symbolic Links

I've organized my stuff into a few directories that are stored on Dropbox, which keeps them in sync across all computers. However, it's easier if I access those directories from `~`. So, create symbolic links from the home directory to Dropbox using the file `symlinks.sh`.

So, retrieve the file

`curl -o symlinks.sh https://raw.githubusercontent.com/jamesamiller/macOS-setup/master/symlinks.sh`

change permissions

`chmod u+x symlinks.sh`

and execute it

`./symlinks.sh`





