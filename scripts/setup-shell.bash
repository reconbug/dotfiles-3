#!/usr/bin/env bash

set -u

# logging text
installing_text="ℹ️  Installing"
successful_text="✅  Successfully installed"
symlink_text="ℹ️  Symlinking"
os_support_error="🚨  Script only supports macOS and Ubuntu"

# Dependencies
printf "\n%s dependencies" "${installing_text}"
# get machine type - https://stackoverflow.com/a/3466183
osType="$(uname -s)"
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
    xcode-select --install
    brew install curl
    brew install shellcheck
    brew install \
        coreutils automake autoconf openssl \
        libyaml readline libxslt libtool unixodbc \
        unzip curl
    ;;
*)
    printf "\n%s" "${os_support_errors}"
    ;;
esac
printf "\n%s dependencies" "${successful_text}"

############ BEGIN: ZSH
printf "\n%s ZSH" "${installing_text}"
sudo apt install zsh

# install oh-my-zsh
printf "\n%s oh-my-zsh" "${installing_text}"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# add fonts for powerline
printf "\n%s powerline fonts" "${installing_text}"
cd ~ && git clone https://github.com/powerline/fonts.git --depth=1
fonts/install.sh
cd ~ && rm -rf fonts/

# symlink zshrc
printf "\n%s zshrc" "${symlink_text}"
mv ~/.zshrc ~/.zshrc.orig
ln -sv ~/projects/dotfiles/config/.zshrc ~/.zshrc

# change default shell
printf "\n\nℹ️  Setting default shell to ZSH"
chsh -s "$(command -v zsh)"
printf "\n%s ZSH" "${successful_text}"
############ END: ZSH

# symlink aliases
printf "\n%s aliases" "${symlink_text}"
ln -sv ~/projects/dotfiles/config/.aliases ~/.aliases

# starship theme
printf "\n%s starship theme" "${installing_text}"
mkdir -p ~/.config
ln -sv ~/projects/dotfiles/config/starship.toml ~/.config/starship.toml
curl -fsSL https://starship.rs/install.sh | bash

printf "\n\n🏁  Fin"
