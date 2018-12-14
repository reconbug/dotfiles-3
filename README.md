<h1 align="center">my os, apps, dotfiles & dev env</h1>

<p align="center">ubuntu 18.04lts, apps & vscode setup with bash & zsh dotfiles<br/>install scripts for the lazy (TBD) or manual instructions for terminal beginners included!</p>

<!-- badges -->

<p align="center">
  <a href="https://github.com/prettier/prettier"><img alt="styled with Prettier" src="https://img.shields.io/badge/code_style-prettier-ff69b4.svg?style=flat" /></a>
  <a href="http://makeapullrequest.com"><img alt="prs welcome" src="https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat" /></a>
  <a href="contribs"><img alt="All Contributors" src="https://img.shields.io/badge/all_contributors-1-orange.svg?style=flat" /></a>
</p>

<!-- some tools used -->

<p align="center">
    :zap: tools for superpowers :zap:<br/>
    <em>
      <a href="https://github.com/asdf-vm/asdf">asdf</a>
      · <a href="https://github.com/koalaman/shellcheck">shellcheck</a>
      · <a href="https://github.com/junegunn/fzf">fzf</a>
      · <a href="https://github.com/rupa/z">z</a>
    </em>
</p>

<!-- toc -->

<p align="center">
    <em>
    :card_file_box: <a href="#dotfiles">dotfiles</a>
    · :wrench: <a href="#development_tools">development tools</a>
    · :computer: <a href="./docs/ubuntu-1804.md">ubuntu1804: os & apps</a>
    · :computer: <a href="./docs/windows-1809.md">win10 & wsl</a>
    · :metro: <a href="./docs/vscode.md">vscode & extensions</a>
    · :family_man_woman_girl_boy: <a href="#contribs">contributions</a>
    · :clipboard: <a href="#license">license</a>
    </em>
</p>

<h2 id="installation">:building_construction: installation</h2>

```markdown
# required dependencies

sudo apt install git curl -y

# make folder dir

cd ~ && mkdir -p projects

# download dotfiles

cd ~ && git clone https://github.com/jthegedus/dotfiles "projects/dotfiles"
```

### Automated Setup

For quick setup you can use the `scripts/install.sh` script. It can setup your `.bashrc`, `.zshrc` and install the [dev tools as listed here](/docs/dev-tools-manual.md).

```markdown
# required 1st param

--bash | --zsh | --skip-shell

# optional 2nd param

--install-devtools # only works on Ubuntu at this time
```

```markdown
# bash

~/projects/dotfiles/scripts/install.sh --bash --install-devtools

# zsh

~/projects/dotfiles/scripts/install.sh --zsh --install-devtools
```

### repo folder structure

This project assumes a local repository folder structure like the following:

```
~/projects
```

Where this `dotfiles` repo is cloned to `~/projects/`, resulting in `~/projects/dotfiles/`. If you wish to use a different folder structure, do a **search and replace** on `/projects`. Other Zsh install guides recommend putting the `/Dotfiles/` folder in your user Home folder `~/`

<details>
<summary>manual installation</summary>

:warning: before re-sourcing or rebooting you should complete the installation of the <a href="#development_tools">development tools</a> section as your shell now depends on some other tools.

#### bash

```markdown
# backup bashrc

mv ~/.bashrc ~/.bashrc.orig

# symlink bashrc

ln -sv ~/projects/dotfiles/bash/.bashrc_default ~/.bashrc_default
ln -sv ~/projects/dotfiles/bash/.bashrc ~/.bashrc

# add aliases (zsh uses a oh-my-zsh alias plugin)

ln -sv ~/projects/dotfiles/common/.aliases ~/.aliases
```

#### zsh

```markdown
# install oh-my-zsh

sh -c "\$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# change default shell

chsh -s "\$(command -v zsh)"

# install zgen

sudo apt install git
git clone https://github.com/tarjoilija/zgen.git "\${HOME}/.zgen"

# backup zshrc

mv ~/.zshrc ~/.zshrc.orig

# symlink zshrc

ln -sv ~/projects/dotfiles/zsh/.zshrc_default ~/.zshrc_default
ln -sv ~/projects/dotfiles/zsh/.zshrc ~/.zshrc

# add fonts for powerline

# sudo apt-get install fonts-powerline

cd ~ && git clone https://github.com/powerline/fonts.git --depth=1
fonts/install.sh
cd ~ && rm -rf fonts/
```

#### development tools

[Instructions can be found here](/docs/dev-tools-manual.md).

</details>

<h2 id="os-and-apps">:computer: os & apps</h2>

[Instructions can be found here](/docs/ubuntu-1804.md).

<h2 id="vscode-extensions">:metro: vscode & extensions</h2>

[Instructions can be found here](/docs/vscode.md).

<h2 id="contribs">:family_man_woman_girl_boy: contributions</h2>

Contributions of any kind welcome!

Thanks goes to these wonderful people ([emoji key](https://github.com/kentcdodds/all-contributors#emoji-key)):

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore -->
| [<img src="https://avatars2.githubusercontent.com/u/20798510?v=4" width="100px;"/><br /><sub><b>James Hegedus</b></sub>](https://medium.com/@jthegedus)<br />[📖](https://github.com/jthegedus/dotfiles/commits?author=jthegedus "Documentation") [📝](#blog-jthegedus "Blogposts") [🎨](#design-jthegedus "Design") [💻](https://github.com/jthegedus/dotfiles/commits?author=jthegedus "Code") |
| :---: |

<!-- ALL-CONTRIBUTORS-LIST:END -->

<h2 id="license">:clipboard: license</h2>

MIT
