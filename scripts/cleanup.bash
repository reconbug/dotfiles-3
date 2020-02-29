#!/usr/bin/env bash

set -u

printf "[WARNING] This script does not remove packages/tools installed with apt-get or brew"

printf "[INFO] removing symlinks"
rm ~/.zshrc ~/.aliases ~/.default-npm-packages ~/.tool-versions

printf "[INFO] remove asdf"
rm -rf ~/.asdf

printf "[INFO] remove fzf"
rm -rf ~/.fzf

printf "[INFO] remove z"
rm -rf ~/z.sh

printf "[INFO] Fin"
