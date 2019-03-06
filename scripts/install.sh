#!/usr/bin/env bash

set -u

# validate args
if [[ $# -eq 0 ]] ; then
    echo "requires at least 1 arg"
    echo "1: required --zsh | --bash | --skip-shell"
    echo "2: optional --install-devtools"
    exit 1
fi

if [ "$1" = "--skip-shell" ]; then
    echo "Skipping shell installation"
fi

##############################################
if [ "$1" = "--bash" ]; then
    echo "Setting up Bash"

    # backup bashrc
    mv ~/.bashrc ~/.bashrc.orig

    # symlink bashrc
    ln -sv ~/projects/dotfiles/bash/.bashrc_default ~/.bashrc_default
    ln -sv ~/projects/dotfiles/bash/.bashrc ~/.bashrc

    # add aliases
    ln -sv ~/projects/dotfiles/common/.aliases ~/.aliases
fi

##############################################
if [ "$1" = "--zsh" ]; then
    echo "Setting up ZSH"

    # add aliases
    ln -sv ~/projects/dotfiles/common/.aliases ~/.aliases
    
    # install oh-my-zsh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

    # change default shell
    chsh -s "$(command -v zsh)"

    # install zgen
    sudo apt install git
    git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"

    # backup zshrc
    mv ~/.zshrc ~/.zshrc.orig

    # symlink zshrc
    ln -sv ~/projects/dotfiles/zsh/.zshrc_default ~/.zshrc_default
    ln -sv ~/projects/dotfiles/zsh/.zshrc ~/.zshrc

    # add fonts for powerline
    # sudo apt-get install fonts-powerline
    cd ~ && git clone https://github.com/powerline/fonts.git --depth=1
    fonts/install.sh
    cd ~ && rm -rf fonts/
fi

##############################################
### development tools
if [ -z "$2" ]; then
    echo "Skipping dev-tool installation"
fi

if [ "$2" = "--install-devtools" ]; then
    echo "Setting up development tooling"

    sudo apt install git curl automake autoconf libreadline-dev libncurses-dev \
    libssl-dev libyaml-dev libxslt-dev libffi-dev libtool unixodbc-dev -y

    ### asdf
    git clone https://github.com/asdf-vm/asdf.git ~/.asdf
    if cd ~/.asdf; then
        git checkout "$(git describe --abbrev=0 --tags)";
    else
        echo "ERROR accessing ~/.asdf dir. Possible error while cloning."
        echo "Try the following command manually:"
        echo "git clone https://github.com/asdf-vm/asdf.git ~/.asdf"
        exit
    fi

    ### z
    cd ~ && wget https://raw.githubusercontent.com/rupa/z/master/z.sh

    ### fzf
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install --key-bindings --completion --no-update-rc --no-bash --no-zsh

    ### nodejs
    asdf plugin-add nodejs
    bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring
    asdf install nodejs 6.15.1
    asdf install nodejs 8.14.0
    asdf install nodejs 10.14.2
    asdf global nodejs 10.14.2

    ### yarn
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
    sudo apt remove cmdtest -y
    sudo apt-get update -y
    sudo apt-get install --no-install-recommends yarn -y

    ### shellcheck
    sudo apt install shellcheck -y

    ### python
    sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev \
    libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
    xz-utils tk-dev -y

    asdf plugin-add python
    asdf install python 2.7.15
    asdf install python 3.7.1
    asdf global python 3.7.1 2.7.15

    ### ruby
    asdf plugin-add ruby
    asdf install ruby 2.5.3
    asdf global ruby 2.5.3

    ### golang
    asdf plugin-add golang
    asdf install golang 1.11.3
    asdf global golang 1.11.3

    ### ocaml
    asdf plugin-add ocaml
    asdf install ocaml 4.07.0
    asdf global ocaml 4.07.0

    ### rust
    asdf plugin-add rust
    asdf install rust 1.31.0
    asdf global rust 1.31.0

fi

### Ubuntu specific
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    ### exfat support
    sudo apt-get install exfat-fuse exfat-utils -y

    ### increase max watchers
    echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf
    sudo sysctl -p

    ### terminal Atom-One Light/Dark profiles
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/denysdovhan/gnome-terminal-one/master/one-dark.sh)"
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/denysdovhan/gnome-terminal-one/master/one-light.sh)"

    ### add chrome gnome shell integration
    sudo apt-get install chrome-gnome-shell -y
fi