#!/bin/sh

# Will source the provided resource if the resource exists
source_if_exists () {
  printf "SOURCING:\\t%s\\n" "$1"
  if [ -f "$1" ]; then
    . "$1";
  fi
}

### default zshrc
source_if_exists "$HOME/.zshrc_default"

# Required fix for error:
# >Insecure completion-dependent directories detected:
ZSH_DISABLE_COMPFIX="true"

# oh-my-zsh path
export ZSH="$HOME/.oh-my-zsh"

# custom folder instead of $ZSH/custom. path to root of dotfiles repo
export DOTFILES=${DOTFILES:-"$HOME/projects/dotfiles"}
export ZSH_CUSTOM="$DOTFILES/zsh"

### ZGEN
source_if_exists "${HOME}/.zgen/zgen.zsh"

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
  add_path_to_global_path "/opt/yarn-[version]/bin"
  add_path_to_global_path "$(yarn global bin)"
fi

### gcloud
export CLOUDSDK_PYTHON="$(command -v python)"
source_if_exists "$HOME/google-cloud-sdk/path.zsh.inc"
source_if_exists "$HOME/google-cloud-sdk/completion.zsh.inc"

### z
source_if_exists "$HOME/z.sh"

### fzf
source_if_exists "$HOME/.fzf.zsh"

### aliases
source_if_exists "$HOME/.aliases"
