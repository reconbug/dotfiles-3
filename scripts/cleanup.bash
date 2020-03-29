#!/usr/bin/env bash

set -euo pipefail

# shellcheck source=./utils.bash
source "$(dirname "$0")/utils.bash"

log_info "⚠️  This script does not remove packages/tools installed with apt-get or brew"

log_info "ℹ️  removing symlinks"
rm -f ~/.zshrc ~/.aliases ~/.default-npm-packages ~/.config/starship.toml

log_info "ℹ️  removing asdf"
rm -rf ~/.asdf ~/.tool-versions

log_info "ℹ️  removing fzf"
rm -rf ~/.fzf

log_info "ℹ️  removing z"
rm -rf ~/z.sh

log_info "ℹ️  removing oh-my-zsh"
uninstall_oh_my_zsh

log_failure "You will likely need to reboot your machine. I've seen weird behaviour when not rebooting."
log_info "🏁  Fin"
