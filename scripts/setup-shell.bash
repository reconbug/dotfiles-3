#!/usr/bin/env bash

set -u

# logging text
installing_text="\nℹ️  Installing"
successful_text="\n✅  Successfully installed"
symlink_text="\nℹ️  Symlinking"
os_support_error="\n🚨  Script only supports macOS and Ubuntu"

# Dependencies
printf "%s dependencies" "${installing_text}"
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
    printf "%s" "${os_support_errors}"
    ;;
esac
printf "%s dependencies" "${successful_text}"

############ BEGIN: ZSH
printf "%s ZSH" "${installing_text}"
sudo apt install zsh

# install oh-my-zsh
printf "%s oh-my-zsh" "${installing_text}"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# add fonts for powerline
printf "%s powerline fonts" "${installing_text}"
cd ~ && git clone https://github.com/powerline/fonts.git --depth=1
fonts/install.sh
cd ~ && rm -rf fonts/

# symlink zshrc
printf "%s zshrc" "${symlink_text}"
mv ~/.zshrc ~/.zshrc.orig
ln -sv ~/projects/dotfiles/zsh/.zshrc ~/.zshrc

# change default shell
printf "\nℹ️  Setting default shell to ZSH"
chsh -s "$(command -v zsh)"
printf "%s ZSH" "${successful_text}"
############ END: ZSH

# symlink aliases
printf "%s aliases" "${symlink_text}"
ln -sv ~/projects/dotfiles/config/.aliases ~/.aliases

# starship theme
printf "%s starship theme" "${installing_text}"
curl -fsSL https://starship.rs/install.sh | bash

printf "\n🏁  Fin"
