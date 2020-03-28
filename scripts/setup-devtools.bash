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
asdf plugin add nodejs
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
asdf plugin add python
asdf install python 3.8.2
asdf global python 3.8.2
printf "%s Python\\n" "${successful_text}"

# firebase
printf "%s Firebase\\n" "${installing_text}"
asdf plugin add firebase
asdf install firebase 7.15.1 # would be good to get `latest` support in asdf-firebase
asdf global firebase 7.15.1
printf "%s Firebase\\n" "${successful_text}"

# gcloud
printf "%s gcloud\\n" "${installing_text}"
ln -sv ~/projects/dotfiles/config/.default-cloud-sdk-components ~/.config/gcloud/.default-cloud-sdk-components
asdf plugin add gcloud
asdf install gcloud 285.0.1 # would be good to get `latest` support in asdf-gcloud
asdf global gcloud 285.0.1
printf "%s gcloud\\n" "${successful_text}"

# hadolint
printf "%s hadolint\\n" "${installing_text}"
asdf plugin add hadolint
asdf install hadolint v1.17.5 # this plugin is doing some weird stuff and could be replaced.
asdf global hadolint v1.17.5
printf "%s hadolint\\n" "${successful_text}"

# java
printf "%s Java, Gradle, Maven\\n" "${installing_text}"
asdf plugin add java
asdf install java adopt-openjdk-11.0.6+10
asdf global java adopt-openjdk-11.0.6+10

asdf plugin add maven
asdf install maven 3.6.3
asdf global maven 3.6.3

asdf plugin add gradle
asdf install gradle 6.2.2
asdf global gradle 6.2.2
printf "%s Java, Gradle, Maven\\n" "${successful_text}"

# OCaml
printf "%s OCaml\\n" "${installing_text}"
asdf plugin add ocaml
asdf install ocaml 4.07.0
asdf global ocaml 4.07.0
printf "%s OCaml\\n" "${successful_text}"

# Terraform
printf "%s Terraform\\n" "${installing_text}"
asdf plugin add terraform
asdf install terraform 0.12.23
asdf global terraform 0.12.23
printf "%s Terraform\\n" "${successful_text}"

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
