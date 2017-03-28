# Dotfiles

A collection of dotfiles and scripts for customizing Ubuntu to my liking.

Heavily inspired by https://github.com/denysdovhan/dotfiles.

## Your Repo Structure
This project assumes a repository folder structure like the following:
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
*   create the terminal profile with the Atom One-Dark theme from ``/scripts/one-dark.sh``: run
```shell
bash ./scripts/one-dark.sh
```
*   install ZSH:
```shell
sudo apt-get update && sudo apt-get upgrade && sudo apt-get install zsh
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

# To do:
-   [ ] create install script for automated setup
-   [ ] create separate automated symlinking process
-   [x] add support for Web Development tools
-   [x] add ZSH plugins through zgen
