#! bin/bash

### default bashrc
if [ -f "$HOME/.default_bashrc" ]; then
    source "$HOME/.default_bashrc"
fi

### language
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

### asdf
source "$HOME/.asdf/asdf.sh"
source "$HOME/.asdf/completions/asdf.bash"

### yarn
PATH="$PATH:/opt/yarn-[version]/bin"
PATH="$PATH:$(yarn global bin)"
export PATH

### z
if [ -f "$HOME/z.sh" ]; then
    source "$HOME/z.sh"
fi

### fzf
if [ -f "$HOME/.fzf.bash" ]; then
    source "$HOME/.fzf.bash"
fi

### aliases
if [ -f "$HOME/.aliases" ]; then
    source "$HOME/.aliases"
fi
