# Dotfiles

A collection of dotfiles and scripts for customizing Ubuntu to my liking.

Heavily inspired by https://github.com/denysdovhan/dotfiles.

## TOC
*   [Repo Structure](#your-repo-structure)
*   [Unix machine setup](#terminal-setup-unix-machine)
*   [Bash on Windows setup](#terminal-setup-bash-on-windows)
*   [To do](#to-do)

## Your Repo Structure
This project assumes a local repository folder structure like the following:
```
~/Projects
~/Projects/Forks
~/Projects/Job
~/Projects/Personal
~/Projects/Playground
```
Where this ``dotfiles`` repo is cloned to ``~/Projects/Personal/``, resulting in ``~/Projects/Personal/dotfiles/``. If you wish to use a different folder structure, do a **search and replace** on ``/Projects/Personal``. Other Zsh install guides recommend putting the ``/Dotfiles/`` folder in your user Home folder ``~/``

## This Repo's Structure
*   /scripts: useful scripts used in the setup process
*   /tilde: files that symlinked to user Home ~/
*   /zsh: the zsh $custom folder. Holds aliases etc for zsh

## Terminal Setup (Unix Machine)
**Tested on Ubuntu 16.04** (no MacOS testing performed)

*   Install ZSH:
```shell
sudo apt-get update && sudo apt-get upgrade && sudo apt-get install zsh
```
*   Make ZSH the default shell (you must lougout or restart for this to take effect)
```shell
chsh -s $(which zsh)
```
*   Install oh-my-zsh:
```shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```
*   Add Zgen for zsh plugin management:
```shell
git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"
```
*   Add symlink between ``~/.zshrc`` and ``/tilde/.zshrc``:
```shell
ln -sv ~/Projects/Personal/dotfiles/tilde/.zshrc ~/.zshrc
```
*   Create the terminal profile with the Atom One-Dark theme from ``/scripts/one-dark.sh``: run
```shell
bash ./scripts/one-dark.sh
```
## Terminal Setup (Bash on Windows)
**Tested on Windows 10 Insider Preview Version 1703 - Build 15063.11**

**Warning - 01/04/2017** I've experienced issues with Bash on Windows when using [yarn](https://github.com/yarnpkg/yarn). The following instructions were tested on a *Slow Ring* installation of the Windows Insider build as of this warning's date. The *Windows 10 Creators Update* should have fixed these issues. The specific issue related to connecting to Webpack Development Servers in the system default browser when started in Bash on Windows.

*   Install ZSH:
```shell
sudo apt-get update && sudo apt-get upgrade && sudo apt-get install zsh
```
*   (For Bash on Windows) Add the following to the top of ``.bashrc`` to launch ZSH on start of the Bash app
```shell
# Switch to ZSH shell
if test -t 1; then
  exec zsh
fi
```
*   Add symlink for Ubuntu user-space ``Projects`` directories and Windows user ``Projects`` directories
```shell
ln -sv /mnt/c/Users/<username>/Projects ~/Projects
```
NB: This creates the ``Projects`` folder in the Ubuntu user-space.
    *   Check the above with ``ls -la``. Symlinks render as the local folder/file name followed by ``->`` and then the linked directory/file path.
*   Install oh-my-zsh:
```shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

## To do:
-   [ ] create install script for automated setup
-   [ ] create separate automated symlinking process
-   [ ] add script to automatically run ``nvm use``, ``rvm use`` etc on folder change to an repo
-   [ ] add Bash on Windows instructions
-   [x] add support for Web Development tools
-   [x] add ZSH plugins through zgen
