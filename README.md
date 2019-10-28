<div align="center">

# my os, dotfiles & dev env

Cross-platform dotfiles & dev env for Ubuntu 18.04+ & Windows 10 with WSL2

<!-- badges -->

[![prs welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat)](http://makeapullrequest.com) [![All Contributors](https://img.shields.io/badge/all_contributors-1-orange.svg?style=flat)](#contributors)

⚡️ tools for shell superpowers ⚡️<br/>[asdf](https://github.com/asdf-vm/asdf) · [shellcheck](https://github.com/koalaman/shellcheck) · [fzf](https://github.com/junegunn/fzf) · [z](https://github.com/rupa/z)

</div>

## Contents

- [Preamble](#preamble)
- [Windows 10 with WSL](#windows-10-with-wsl)
- [Ubuntu 18.04+](#ubuntu-1804+)
- [Other](#other)
- [Contributions](#contributions)
- [License](#license)

## Preamble

This "cross-platform" setup of mine is really just a Ubuntu 18.04+ ZSH environment. With Windows 10 and WSL 2 I can reuse most (maybe all, haven't really checked) of my env on both platforms.

## Windows 10 with WSL

<details>
<summary>Expand for Windows Setup</summary>

### Enable WSL

1. press `windows key`
2. type `developer settings` & press `enter`
3. select `developer mode`
4. press `windows key`
5. type `turn windows features on or off` & press `enter`
6. check `Windows Subsystem for Linux` & then press `ok`
7. reboot

### Ubuntu 18.04 on Windows

Install the [Ubuntu 18.04 Shell](https://www.microsoft.com/store/productId/9N9TNGVNDL3Q).

Boot the app and follow any instructions to setup your Ubuntu user profile.

Update Ubuntu deps with: `sudo apt-get update && sudo apt-get upgrade`

### A note on WSL 1 vs WSL 2

This guide will work with WSL version 1 and 2. WSL 2 will be recommended for better Ubuntu support and an improved user experience when it moves into a stable release of Windows 10.

If you intend to use WSL 2, then you will require a Windows build 18917+, currently only available in the Insider Fast ring. [Read more about the requirements in the official release post](https://devblogs.microsoft.com/commandline/wsl-2-is-now-available-in-windows-insiders/).

### Set WSL Version

In powershell (admin) set the WSL version for your Ubuntu shell:

```shell
# wsl --set-version <Distro> <Version>
wsl --set-version Ubuntu-18.04 2
```

Validate the correct WSL version is being used:

```shell
wsl --list --verbose
```

See the [development of WSL on GitHub](https://github.com/microsoft/WSL).

### Windows Terminal

Microsoft's new [Terminal application for Windows 10](https://www.microsoft.com/store/productId/9N0DX20HK701) is a modern terminal app with support for different shells, themes, tabs and unicode (read emoji) support.

See the [development of Terminal on GitHub](https://github.com/microsoft/terminal).

<details>
<summary>Configuring the Terminal</summary>

- settings is a JSON file (`profile.json`) so easily syncable over cloud storage or code repository
- JSON Schema for `profile.json` provides autocompletion in editors for easy discovery of options
- set the default shell using the `globals.defaultProfile` value with the guid from your desired profile `profile[x].guid`.
- custom font via `profiles[x].fontFace` & `.fontSize`
- custom theme per profile with `profiles[x].colorScheme`, set with the desired `schemes[x].name` value. Comes with Solarized Dark/Light, Campbell (MS default theme) and One Half Dark/Light
- adjustable acrylic opacity (blur)
- editable key bindings

</details>

### VSCode with WSL 2

With VSCode's remote server feature, we now have native support for WSL within VSCode! Simply run `code .` from within a project folder in any terminal, if VSCode detects it needs to use WSL it will 💯 See the [docs for further information](https://code.visualstudio.com/docs/remote/wsl).

See the [VSCode remote server development on GitHub](https://github.com/microsoft/vscode-remote-release).

### Prepare for Ubuntu 18.04

The filesystem used by the Linux shell is hidden deep in your user's AppData folder. To make developing more convenient we will set up a symlink between our `projects` folder across the two environments.

1. create a `projects` folder in your Windows user space. I like to use `C:\Users\<username>\projects`
   > NB: Ubuntu will mount your `C:` drive to `/mnt/c`
2. open a Ubuntu Shell
3. create a symlink by linking your new `projects` folder from Windows to our Ubuntu userspace.

   ```shell
   ln -sv /mnt/c/Users/<username>/projects ~/projects
   ```

4. validate the symlink with `ls -la` and creating and editing a file from each userspace to see that the changes are reflected correctly.

### Last Steps

Now that we have WSL 2 working and a Ubuntu 18.04 Bash shell we can essentially follow the below Ubuntu guide below ⬇️

</details>

## Ubuntu 18.04+

### Automated installation

- clone my dotiles into the `projects` dir

  ```shell
  cd ~ && git clone https://github.com/jthegedus/dotfiles "projects/dotfiles"
  ```

- run the install script

  ```shell
  # script args
  # arg 1: required --zsh | --bash | --skip-shell
  # arg 2: optional --install-devtools

  # bash
  ~/projects/dotfiles/scripts/install.sh --bash
  # zsh
  ~/projects/dotfiles/scripts/install.sh --zsh
  ```

  add `--install-devtools` if you want to install [asdf](https://github.com/asdf-vm/asdf), Node, Yarn, Python & OCaml tools. If not, you may want to edit your `.zshrc` file after setup to remove the dependencies on some of these tools.

⚠️ development on this script is ongoing to improve ergonomics and add support for macOS.

### Manual Installation

- open `scripts/install.sh` and copy/paste the commands you wish to use from top to bottom. It's fairly straight forward. If there is a tool you're unsure about either see my links at the top of the README or Google them 😉

## Other

Some other development env things:

### VSCode

[My vscode sync-settings can be found here](https://gist.github.com/jthegedus/21f04da71670c80f39f3f583c87465e0). Some extensions include:

- [Settings Sync](https://marketplace.visualstudio.com/items?itemName=Shan.code-settings-sync): Store your config in the cloud making multi-machine and reinstallations a breeze!
- [One Dark Pro Monokai Darker](https://marketplace.visualstudio.com/items?itemName=eserozvataf.one-dark-pro-monokai-darker): One Dark Pro x Monokai, made darker.
- [ReasonML language server](https://marketplace.visualstudio.com/items?itemName=jaredly.reason-vscode): written from scratch in Reason for Reason.
- [shellcheck](https://marketplace.visualstudio.com/items?itemName=timonwong.shellcheck): static analysis your `.sh` scripts. Requires [shellcheck itself](https://github.com/koalaman/shellcheck#shellcheck---a-shell-script-static-analysis-tool).

### Fonts

- [Cascadia Code](https://github.com/microsoft/cascadia-code): mono, ligatures, free
- [Fira Code](https://github.com/tonsky/FiraCode): mono, ligatures, free
- [Dank Mono](https://dank.sh/): mono, ligatures, paid (although reasonable)
- [Hack](https://github.com/source-foundry/Hack): mono, free

### Ubuntu on various hardware

#### Lenovo ThinkPad E485/E585

Ubuntu installation will hang on a Lenovo ThinkPad E485/E585. Below are the instructions I followed to remedy the issues:

- [18.04 / 18.10](https://medium.com/@jthegedus/ubuntu-18-04-lts-on-lenovo-thinkpad-e485-15e1d601473f)
- [19.04](https://medium.com/@jthegedus/ubuntu-19-04-lts-on-lenovo-thinkpad-e485-bf2d6cfd9cad)
- [19.04 - PopOS!](https://medium.com/@jthegedus/popos-19-04-on-lenovo-thinkpad-e485-ac3951199132)

#### Dell XPS15 9560

On login the OS may hang. Below are the instructions I followed to remedy the issues:

- [18.04 / 18.10](https://medium.com/@jthegedus/ubuntu-18-04-lts-on-a-dell-xps-db4dcee9a2f9)

### Ubuntu 18.04+ apps

- [Solaar](https://pwr.github.io/Solaar/): Logitech Wireless device management. `sudo apt install solaar`
- [Synergy](https://symless.com/synergy): Cross-platform mouse/keyboard sharing.
- Gnome Extensions (requires `sudo apt-get install chrome-gnome-shell -y`):
  - [Sound Input & Output Device Chooser](https://extensions.gnome.org/extension/906/sound-output-device-chooser/): Select audio IO from media dropdown
  - [ShellTile](https://extensions.gnome.org/extension/657/shelltile/): A tiling window extension for GNOME Shell.

## Contributions

Contributions of any kind welcome!

Thanks goes to these wonderful people ([emoji key](https://github.com/kentcdodds/all-contributors#emoji-key)):

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore -->
| [<img src="https://avatars2.githubusercontent.com/u/20798510?v=4" width="100px;"/><br /><sub><b>James Hegedus</b></sub>](https://medium.com/@jthegedus)<br />[📖](https://github.com/jthegedus/dotfiles/commits?author=jthegedus "Documentation") [📝](#blog-jthegedus "Blogposts") [🎨](#design-jthegedus "Design") [💻](https://github.com/jthegedus/dotfiles/commits?author=jthegedus "Code") |
| :---: |

<!-- ALL-CONTRIBUTORS-LIST:END -->

## License

[MIT License](LICENSE) © [James Hegedus](https://github.com/jthegedus/)
