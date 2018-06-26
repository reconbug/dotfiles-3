<h1 align="center">my os, apps, dotfiles & dev env</h1>

<p align="center">ubuntu 18.04lts, apps & vscode setup with bash & zsh dotfiles<br/>install scripts for the lazy or manual instructions for terminal beginners included!</p>

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
    <a href="#dotfiles">dotfiles</a>
    · <a href="#development_tools">development tools</a>
    · <a href="./docs/ubuntu-1804.md">os & apps</a>
    · <a href="./docs/vscode.md">vscode & extensions</a>
    · :family_man_woman_girl_boy: <a href="#contribs">contributions</a>
    · :clipboard: <a href="#license">license</a>
    </em>
</p>

<h2 id="installation">installation</h2>

```markdown
# required dependencies

sudo apt install git curl -y
```

<h3 id="repo_folder_structure">repo folder structure</h3>

This project assumes a local repository folder structure like the following:

```
~/Projects
~/Projects/Forks
~/Projects/Job
~/Projects/Personal
~/Projects/Playground
```

Where this `dotfiles` repo is cloned to `~/Projects/Personal/`, resulting in `~/Projects/Personal/dotfiles/`. If you wish to use a different folder structure, do a **search and replace** on `/Projects/Personal`. Other Zsh install guides recommend putting the `/Dotfiles/` folder in your user Home folder `~/`

- To create the folder structure run this command in Bash:

```shell
cd ~ && mkdir -p Projects/Forks Projects/Job Projects/Personal Projects/Playground
```

<h3 id="install_dotfiles">install these dotfiles</h3>

Clone this repo to `~/Projects/Personal/`

```shell
cd ~ && git clone https://github.com/jthegedus/dotfiles "Projects/Personal/dotfiles"
```

Now follow either the automated or manual instructions in dotfiles and development tools sections.

<h2 id="dotfiles">dotfiles</h2>

<h3 id="dotfiles_automatic">automatic installation</h3>

TBD - currently a wip.

```markdown
# for bash users

...

# for zsh users

...
```

<h3 id="dotfiles_manual">manual installation</h3>

:warning: before re-sourcing or rebooting you should complete the installation of the <a href="#development_tools">development tools</a> section as your shell now depends on some other tools.

#### common

- add symlink between `~/.aliases` and `/common/.aliases`
  ```shell
  ln -sv ~/Projects/Personal/dotfiles/common/.aliases ~/.aliases
  ```

#### bash

- backup existing `.bashrc`

  ```shell
  mv ~/.bashrc ~/.bashrc.orig
  ```

- add a default `.bashrc` to extend by symlinking between `~/.default_bashrc` and `/bash/.default_bashrc`

  ```shell
  ln -sv ~/Projects/Personal/dotfiles/bash/.default_bashrc ~/.default_bashrc
  ```

- add symlink between `~/.bashrc` and `/bash/.bashrc`:

  ```shell
  ln -sv ~/Projects/Personal/dotfiles/bash/.bashrc ~/.bashrc
  ```

#### zsh

- backup existing `.zshrc`

  ```shell
  mv ~/.zshrc ~/.zshrc.orig
  ```

- Add symlink between `~/.zshrc` and `/zsh/.zshrc`:

  ```shell
  ln -sv ~/Projects/Personal/dotfiles/zsh/.zshrc ~/.zshrc
  ```

<h2 id="development_tools">development tools</h2>

<h3 id="dev_tools_automatic">automatic installation</h3>

TBD - currently a wip.

```markdown
...
```

<h3 id="dev_tools_manual">manual installation</h3>

[Instructions can be found here](/docs/dev-tools-manual.md).

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
