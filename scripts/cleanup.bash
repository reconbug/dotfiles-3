#!/usr/bin/env bash

set -u

printf "\n⚠️  This script does not remove packages/tools installed with apt-get or brew"

printf "\nℹ️  removing symlinks"
rm -f ~/.zshrc ~/.aliases ~/.default-npm-packages ~/.config/starship.toml

printf "\nℹ️  removing asdf"
rm -rf ~/.asdf ~/.tool-versions

printf "\nℹ️  removing fzf"
rm -rf ~/.fzf

printf "\nℹ️  removing z"
rm -rf ~/z.sh

printf "\n🏁  Fin"
