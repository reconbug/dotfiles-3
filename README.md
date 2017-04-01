# Dotfiles

A collection of dotfiles and scripts for customizing Ubuntu to my liking.

Heavily inspired by https://github.com/denysdovhan/dotfiles.

## TOC
*   [Repo Structure](##Your Repo Structure)
*   [Unix machine setup](## Terminal Setup (Unix Machine))
*   [Bash on Windows setup](## Terminal Setup (Bash on Windows))
*   [To do](## To do:)

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

## Terminal Setup
*   install ZSH:
```shell
sudo apt-get update && sudo apt-get upgrade && sudo apt-get install zsh
```
*   (For Linux Terminal only) make ZSH the default shell (you must lougout or restart for this to take effect)
```shell
chsh -s $(which zsh)
```
*   (For Bash on Windows) Add the following to the top of ``.bashrc`` to launch ZSH on start of the Bash app
```shell
# Switch to ZSH shell
if test -t 1; then
  exec zsh
fi
```
*   install oh-my-zsh:
```shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```
*   Add Zgen for zsh plugin management:
```shell
git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"
```
*   add symlink between ``~/.zshrc`` and ``/tilde/.zshrc``:
```shell
ln -sv ~/Projects/Personal/dotfiles/tilde/.zshrc ~/.zshrc
```
*   (For Linux Terminal only) create the terminal profile with the Atom One-Dark theme from ``/scripts/one-dark.sh``: run
```shell
bash ./scripts/one-dark.sh
```

# To do:
## To do:
-   [ ] create install script for automated setup
-   [ ] create separate automated symlinking process
-   [ ] add script to automatically run ``nvm use``, ``rvm use`` etc on folder change to an repo
-   [ ] add Bash on Windows instructions
-   [x] add support for Web Development tools
-   [x] add ZSH plugins through zgen
