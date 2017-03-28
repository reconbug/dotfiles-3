# Dotfiles

A collection of dotfiles and scripts for customizing Ubuntu to my liking.

## Terminal Setup
*   install ZSH:
```shell
sudo apt-get update && sudo apt-get upgrade && sudo apt-get install zsh
```
*   install oh-my-zsh:
```shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```
*   add zsh theme:
```shell
curl -o - https://raw.githubusercontent.com/denysdovhan/spaceship-zsh-theme/master/install.sh | zsh
```
*   create the terminal profile with the Atom One-Dark theme from /scripts/one-dark.sh: run
```shell
bash ./scripts/one-dark.sh
```
*   add symlink between zshrc and /tilde/.zshrc:
```shell
ln -sv ~/Projects/Personal/dotfiles/tilde/.zshrc ~/.zshrc
```

# To do:
-   [ ] create install script for automated setup
-   [ ] create separate symlinking process
-   [ ] add support for Web Development tools
-   [ ] add ZSH plugins through zgen
