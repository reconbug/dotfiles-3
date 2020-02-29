#!/usr/bin/env bash

set -u

printf "⚠️  This script does not remove packages/tools installed with apt-get or brew\\n"

printf "ℹ️  removing symlinks\\n"
rm -f ~/.zshrc ~/.aliases ~/.default-npm-packages ~/.config/starship.toml

printf "ℹ️  removing asdf\\n"
rm -rf ~/.asdf ~/.tool-versions

printf "ℹ️  removing fzf\\n"
rm -rf ~/.fzf

printf "ℹ️  removing z\\n"
rm -rf ~/z.sh

printf "ℹ️  removing oh-my-zsh\\n"
uninstall_oh_my_zsh

printf "🚨 🚨 🚨  You will likely need to reboot your machine. I've seen weird behaviour when not rebooting."
printf "🏁  Fin\\n"
