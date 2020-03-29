#!/usr/bin/env bash

set -euo pipefail

# shellcheck source=./utils.bash
source "$(dirname "$0")/utils.bash"

# get machine type - https://stackoverflow.com/a/3466183
osType="$(uname -s)"

# Dependencies
log_info "ℹ️  Installing dependencies"
case "${osType}" in
Linux*)
    sudo apt install git curl shellcheck -y
    sudo apt install \
        automake autoconf libreadline-dev \
        libncurses-dev libssl-dev libyaml-dev \
        libxslt-dev libffi-dev libtool unixodbc-dev \
        unzip -y
    ;;
Darwin*)
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    xcode-select --install
    brew install curl
    brew install shellcheck
    brew install \
        coreutils automake autoconf openssl \
        libyaml readline libxslt libtool unixodbc \
        unzip curl
    ;;
*)
    log_failure_and_exit "🚨  Script only supports macOS and Ubuntu"
    ;;
esac
log_success "✅  Successfully installed dependencies"

############ BEGIN: ZSH
case "${osType}" in
Linux*)
    log_info "ℹ️  Installing ZSH"
    sudo apt install zsh
    ;;
Darwin*)
    log_info "ℹ️  macOS Catalina comes with ZSH as the default shell."
    ;;
*)
    log_failure_and_exit "🚨  Script only supports macOS and Ubuntu"
    ;;
esac

# install oh-my-zsh
log_info "ℹ️  Installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

log_info "ℹ️  Installing zsh-syntax-highlighting plugin"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

# add fonts for powerline
log_info "ℹ️  Installing powerline fonts"
cd ~ && git clone https://github.com/powerline/fonts.git --depth=1
fonts/install.sh
cd ~ && rm -rf fonts/

# symlink zshrc
log_info "ℹ️  Installing .zshrc"
mv ~/.zshrc ~/.zshrc.orig
ln -sv ~/projects/dotfiles/config/.zshrc ~/.zshrc

# change default shell
log_info "ℹ️  Setting default shell to ZSH"
chsh -s "$(command -v zsh)"
log_success "Successfully installed ZSH"
############ END: ZSH

# symlink aliases
log_info "ℹ️  Symlinking aliases"
ln -sv ~/projects/dotfiles/config/.aliases ~/.aliases

# starship theme

log_info "🚀  Installing Starship theme"
mkdir -p ~/.config
ln -sv ~/projects/dotfiles/config/starship.toml ~/.config/starship.toml
curl -fsSL https://starship.rs/install.sh | bash

log_info "🏁  Fin"
