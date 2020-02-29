#!/usr/bin/env bash

set -u

# logging text
installing_text="ℹ️  Installing"
successful_text="✅  Successfully installed"
symlink_text="ℹ️  Symlinking"
os_support_error="🚨  Script only supports macOS and Ubuntu"

# get OS name
osType="$(uname -s)"

############ BEGIN: Tools
# z
if [ -f "${HOME}/z.sh" ]; then
    printf "✅  z.sh already exists\\n"
else
    printf "%s z\\n" "${installing_text}"
    wget -O https://raw.githubusercontent.com/rupa/z/master/z.sh "${HOME}"
fi

# fzf
if [ -d "${HOME}/.fzf" ]; then
    printf "✅  fzf already exists\\n"
else
    printf "%s fzf\\n" "${installing_text}"
    git clone --depth 1 https://github.com/junegunn/fzf.git "${HOME}/.fzf"
    ~/.fzf/install --key-bindings --completion --no-update-rc --no-bash --no-zsh
fi

# asdf
if [ -d "${HOME}/.asdf" ]; then
    printf "✅  asdf already exists\\n"
else
    printf "%s asdf\\n" "${installing_text}"
    git clone https://github.com/asdf-vm/asdf.git "${HOME}/.asdf"
    cd "${HOME}/.asdf" || {
        printf "❌  Could not find .asdf" 1>&2
        exit 1
    }
    git checkout "$(git describe --abbrev=0 --tags)"
    cd "${HOME}" || {
        printf "❌  Could not find %s" "${HOME}" 1>&2
        exit 1
    }
    printf "%s asdf\\n" "${successful_text}"
    printf "ℹ️  Shell must be restarted before asdf is available on your PATH. Re-run this script."
    exit 0
fi

# nodejs
printf "%s NodeJS\\n" "${installing_text}"
printf "%s default-npm-packages\\n" "${symlink_text}"
ln -sv ~/projects/dotfiles/config/.default-npm-packages ~/.default-npm-packages
case "${osType}" in
Linux*)
    apt-get install dirmngr gpg -y
    ;;
Darwin*)
    brew install coreutils
    brew install gpg
    ;;
*)
    printf "%s\\n" "${os_support_error}"
    ;;
esac
asdf plugin-add nodejs
bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring
asdf install nodejs 10.19.0
asdf install nodejs 12.16.1
asdf global nodejs 12.16.1
printf "%s NodeJS\\n" "${successful_text}"

# Python
printf "%s Python\\n" "${installing_text}"
case "${osType}" in
Linux*)
    sudo apt-get update
    sudo apt-get install --no-install-recommends \
        make build-essential libssl-dev zlib1g-dev libbz2-dev \
        libreadline-dev libsqlite3-dev wget curl llvm \
        libncurses5-dev xz-utils tk-dev libxml2-dev \
        libxmlsec1-dev libffi-dev liblzma-dev -y
    ;;
Darwin*)
    brew install openssl readline sqlite3 xz zlib
    ;;
*)
    printf "%s\\n" "${os_support_error}"
    ;;
esac
asdf plugin-add python
asdf install python 3.8.2
asdf global python 3.8.2
printf "%s Python\\n" "${successful_text}"

# OCaml
printf "%s OCaml\\n" "${installing_text}"
asdf plugin-add ocaml
asdf install ocaml 4.07.0
asdf global ocaml 4.07.0
printf "%s OCaml\\n" "${successful_text}"

# Terraform
printf "%s Terraform\\n" "${installing_text}"
asdf plugin-add terraform
asdf install terraform 0.12.21
asdf global terraform 0.12.21
printf "%s Terraform\\n" "${successful_text}"

# GCloud
printf "%s GCloud\\n" "${installing_text}"
case "${osType}" in
Linux*)
    printf "⚠️  TODO: add automated setup for GCloud\\n"
    # echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
    # sudo apt-get install apt-transport-https ca-certificates gnupg
    # curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
    # sudo apt-get update && sudo apt-get install google-cloud-sdk
    ;;
Darwin*)
    printf "⚠️  TODO: add automated setup for GCloud\\n"
    ;;
*)
    printf "%s\\n" "${os_support_error}"
    ;;
esac
printf "%s GCloud\\n" "${successful_text}"

# Extras
printf "%s Extras\\n" "${installing_text}"
case "${osType}" in
Linux*)
    # exfat support
    sudo apt-get install exfat-fuse exfat-utils -y
    # increase max watchers
    echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf
    sudo sysctl -p
    # add chrome gnome shell integration
    sudo apt-get install chrome-gnome-shell -y
    ;;
Darwin*)
    brew install openssl readline sqlite3 xz zlib
    ;;
*)
    printf "%s\\n" "${os_support_error}"
    ;;
esac
printf "%s Extras\\n" "${successful_text}"
############ END: Tools

printf "🏁  Fin\\n"
