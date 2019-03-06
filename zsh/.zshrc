#! bin/bash

### default zshrc
if [ -f "$HOME/.default_zshrc" ]; then
    source "$HOME/.default_zshrc"
fi

# oh-my-zsh path
export ZSH=$HOME/.oh-my-zsh

# custom folder instead of $ZSH/custom. path to root of dotfiles repo
export DOTFILES=${DOTFILES:-"$HOME/projects/dotfiles"}
ZSH_CUSTOM="$DOTFILES/zsh"
export ZSH_CUSTOM

### ZGEN
source "${HOME}/.zgen/zgen.zsh"

if ! zgen saved; then
  echo "Creating a zgen save..."

  ### Use Oh-My-Zsh
  #
  zgen oh-my-zsh

  ### Load Oh-My-Zsh plugins
  #
  # terminal
  zgen oh-my-zsh plugins/sudo
  zgen oh-my-zsh plugins/z
  # development
  zgen oh-my-zsh plugins/asdf
  zgen oh-my-zsh plugins/git
  zgen oh-my-zsh plugins/gitignore
  zgen oh-my-zsh plugins/vscode
  # development: web
  zgen oh-my-zsh plugins/node
  zgen oh-my-zsh plugins/npm
  zgen oh-my-zsh plugins/npx
  zgen oh-my-zsh plugins/yarn
  # development: other
  zgen oh-my-zsh plugins/aws
  zgen oh-my-zsh plugins/docker
  zgen oh-my-zsh plugins/common-aliases
  zgen oh-my-zsh plugins/go
  zgen oh-my-zsh plugins/pip
  zgen oh-my-zsh plugins/python
  zgen oh-my-zsh plugins/ruby

  # Load theme
  zgen load denysdovhan/spaceship-zsh-theme spaceship
  zgen load zsh-users/zsh-syntax-highlighting

  # Automaticaly refresh ~/.zshrc and ~/.zshlocal
  if [[ -f ~/.zshlocal ]]; then
    ZGEN_RESET_ON_CHANGE=("$HOME/.zshrc" "$HOME/.zshlocal")
  else
    ZGEN_RESET_ON_CHANGE=("$HOME/.zshrc")
  fi

  # save all to init script
  zgen save
fi

### aws
# export PATH=~/.local/bin:$PATH

### ssh
export SSH_KEY_PATH="$HOME/.ssh/rsa_id"

### yarn
if [ -f "/usr/bin/yarn" ]; then
    export PATH="$PATH:/opt/yarn-[version]/bin"
    export PATH="$PATH:$(yarn global bin)"
fi

### z
if [ -f "$HOME/z.sh" ]; then
    source "$HOME/z.sh"
fi

### fzf
if [ -f "$HOME/.fzf.zsh" ]; then
    source "$HOME/.fzf.zsh"
fi

### aliases
if [ -f "$HOME/.aliases" ]; then
    source "$HOME/.aliases"
fi

