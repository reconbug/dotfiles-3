#! bin/bash

### ~/.zhsrc
#

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/home/james/.oh-my-zsh

# Export path to root of dotfiles repo
export DOTFILES=${DOTFILES:-"$HOME/Projects/Personal/dotfiles"}

### You may need to manually set your language environment
#
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

### From original .zshrc file
#
export PATH=$HOME/bin:/usr/local/bin:$PATH
#
# hyphen-insensitive completion: sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"
export HYPHEN_INSENSITIVE

### ASDF
#
. "$HOME/.asdf/asdf.sh"
. "$HOME/.asdf/completions/asdf.bash"

### Yarn
#
PATH="$PATH:/opt/yarn-[version]/bin"
PATH="$PATH:$(yarn global bin)"
export PATH



### Extend $NODE_PATH
#
if [ -d ~/.npm-global ]; then
  export NODE_PATH="$NODE_PATH:$HOME/.npm-global/lib/node_modules"
fi


### Direnv
#
eval "$(direnv hook zsh)"


### AWS
#
export PATH=~/.local/bin:$PATH

# ssh
export SSH_KEY_PATH="$HOME/.ssh/rsa_id"

# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="dd.mm.yyyy"
export HIST_STAMPS

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM="$DOTFILES/zsh"
export ZSH_CUSTOM

### Z
#
. "$HOME/z.sh"

### ZGEN
#
# load zgen
source "$HOME/.zgen/zgen.zsh"

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
  zgen oh-my-zsh plugins/git
  zgen oh-my-zsh plugins/gitignore
  zgen oh-my-zsh plugins/asdf
  # development: web
  zgen oh-my-zsh plugins/node
  zgen oh-my-zsh plugins/npm
  zgen oh-my-zsh plugins/yarn
  # development: other
  zgen oh-my-zsh plugins/aws
  zgen oh-my-zsh plugins/go
  zgen oh-my-zsh plugins/python
  zgen oh-my-zsh plugins/pip
  zgen oh-my-zsh plugins/docker

  # Load theme
  zgen load denysdovhan/spaceship-zsh-theme spaceship

  # Automaticaly refresh ~/.zshrc and ~/.zshlocal
  if [[ -f ~/.zshlocal ]]; then
    ZGEN_RESET_ON_CHANGE=("$HOME/.zshrc" "$HOME/.zshlocal")
  else
    ZGEN_RESET_ON_CHANGE=("$HOME/.zshrc")
  fi

  # save all to init script
  zgen save
fi

### Bind Keypad keys
# use ctrl+v in the terminal followed by pressing a key to find it's key-code
#
# 0 . Enter
bindkey -s "^[Op" "0"
bindkey -s "^[Ol" "."
bindkey -s "^[OM" "^M"
# 1 2 3
bindkey -s "^[Oq" "1"
bindkey -s "^[Or" "2"
bindkey -s "^[Os" "3"
# 4 5 6
bindkey -s "^[Ot" "4"
bindkey -s "^[Ou" "5"
bindkey -s "^[Ov" "6"
# 7 8 9
bindkey -s "^[Ow" "7"
bindkey -s "^[Ox" "8"
bindkey -s "^[Oy" "9"
# + -  * /
bindkey -s "^[Ok" "+"
bindkey -s "^[Om" "-"
bindkey -s "^[Oj" "*"
bindkey -s "^[Oo" "/"

### From generated .zshrc from oh-my-zsh interactive init option (2)
#
# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history
