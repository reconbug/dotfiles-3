#!/usr/bin/env bash

set -u

# logging text
installing_text="ℹ️  Installing"
successful_text="✅  Successfully installed"
symlink_text="ℹ️  Symlinking"
os_support_error="🚨  Script only supports macOS and Ubuntu"

# Dependencies
printf "%s dependencies\n" "${installing_text}"
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
    printf "%s\n" "${os_support_errors}"
    ;;
esac
printf "%s dependencies\n" "${successful_text}"

############ BEGIN: ZSH
case "${osType}" in
Linux*)
    printf "%s ZSH\n" "${installing_text}"
    sudo apt install zsh
    ;;
Darwin*)
    printf "ℹ️  macOS Catalina comes with ZSH as the default shell.\n"
    ;;
*)
    printf "%s\n" "${os_support_errors}"
    ;;
esac

# install oh-my-zsh
printf "%s oh-my-zsh\n" "${installing_text}"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# add fonts for powerline
printf "\n%s powerline fonts" "${installing_text}"
cd ~ && git clone https://github.com/powerline/fonts.git --depth=1
fonts/install.sh
cd ~ && rm -rf fonts/

# symlink zshrc
printf "%s zshrc\n" "${symlink_text}"
mv ~/.zshrc ~/.zshrc.orig
ln -sv ~/projects/dotfiles/config/.zshrc ~/.zshrc

# change default shell
printf "ℹ️  Setting default shell to ZSH\n"
chsh -s "$(command -v zsh)"
printf "%s ZSH\n" "${successful_text}"
############ END: ZSH

# symlink aliases
printf "%s aliases\n" "${symlink_text}"
ln -sv ~/projects/dotfiles/config/.aliases ~/.aliases

# starship theme
printf "%s starship theme\n" "${installing_text}"
mkdir -p ~/.config
ln -sv ~/projects/dotfiles/config/starship.toml ~/.config/starship.toml
curl -fsSL https://starship.rs/install.sh | bash

printf "🏁  Fin\n"
