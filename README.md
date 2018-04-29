<h1 align="center">os, apps, dotfiles & dev env</h1>

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
      · <a href="https://yarnpkg.com/en/docs/install">yarn</a>
      · <a href="https://github.com/koalaman/shellcheck">shellcheck</a>
      · <a href="https://github.com/junegunn/fzf">fzf</a>
      · <a href="https://github.com/rupa/z">z</a>
    </em>
</p>

<!-- toc -->

<p align="center">
    <em>
    <a href="#os_apps">os & apps</a>
    · <a href="#dotfiles_automatic">dotfiles - automated</a>
    · <a href="#dotfiles_manual">dotfiles - manual</a>
    · <a href="#dev_tools">development tools</a>
    · <a href="#dev_env">vscode & extensions</a>
    </em>
</p>

<h2 id="os_apps">os & apps</h2>

<h2 id="dotfiles_automatic">dotfiles - automated</h2>

<h2 id="dotfiles_manual">dotfiles - manual</h2>

<h2 id="dev_tools">development tools</h2>

<h2 id="dev_env">vscode & extensions</h2>

# Dotfiles

A collection of dotfiles and scripts for customizing Unix Terminal and Bash on Windows to my liking (use [zsh](http://www.zsh.org) with [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) ;) ).

This README is intended for first time Zsh users and so I tried to be as verbose as possible with the instructions. Also Bash on Windows with Zsh is not very well documented, the articles I could find on Google did not outline the entire process. Again, I tried to be as verbose as possible.

Credit where credit is due:

* It was this Zsh theme that inspired me to try Zsh <https://github.com/denysdovhan/spaceship-zsh-theme>
* Of course <https://github.com/robbyrussell/oh-my-zsh>
* The [Hyper terminal app](https://hyper.is) fixes many of the issues encountered with using Bash on Windows
* [Awesome Hyper](https://github.com/bnb/awesome-hyper)
* The power of [z](https://github.com/rupa/z/) makes you feel like a true terminal super user, thanks [Wes Bos](https://twitter.com/@wesbos)
* Some dotfiles resources:
  * <https://dotfiles.github.io>
  * <https://github.com/webpro/awesome-dotfiles>
  * <https://github.com/denysdovhan/dotfiles>

## Contents

* [Repo Structure](#your-repo-structure)
* [Bash on Unix Setup](#bash-on-unix-setup)
  * [Terminal App Theming](#terminal-app-styling)
* [Bash on Windows Setup](#bash-on-windows-setup)
  * [Windows Terminal Theming](#styling-your-terminal-not-prompt)
* [To do](#to-do)

## Your Repo Structure

This project assumes a local repository folder structure like the following:

```
~/Projects
~/Projects/Forks
~/Projects/Job
~/Projects/Personal
~/Projects/Playground
```

Where this `dotfiles` repo is cloned to `~/Projects/Personal/`, resulting in `~/Projects/Personal/dotfiles/`. If you wish to use a different folder structure, do a **search and replace** on `/Projects/Personal`. Other Zsh install guides recommend putting the `/Dotfiles/` folder in your user Home folder `~/`

* To create the folder structure run this command in Bash:

```shell
cd ~ && mkdir -p Projects/Forks Projects/Job Projects/Personal Projects/Playground
```

## This Repo's Structure

* /scripts: useful scripts used in the setup process
* /tilde: files that symlinked to user Home ~/
* /windows: files specific to the windows installation instructions. Used in /mnt/c/Users/<username>/ folder on Bash on Windows.
* /zsh: the zsh $custom folder. Holds aliases etc for zsh

## ZSH on Unix Setup

**Tested on Ubuntu 16.04** (no MacOS testing performed)

* Install required applications: Git and Curl

```shell
sudo apt-get install git curl
```

* Install ZSH:

```shell
sudo apt-get update && sudo apt-get upgrade && sudo apt-get install zsh
```

* Make ZSH the default shell (**you must logout or restart for this to take effect**)

```shell
chsh -s $(which zsh)
```

* Install oh-my-zsh:

```shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

* Add Zgen for zsh plugin management:

```shell
git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"
```

* Add [z](https://github.com/rupa/z) for Terminal navigation. It's a supercharged `cd`! Video \#10 in [this series](https://commandlinepoweruser.com) by [Wes Bos](https://twitter.com/@wesbos) covers the power of `z` pretty well.

```shell
wget https://raw.githubusercontent.com/rupa/z/master/z.sh
```

* Backup existing .zshrc

```shell
mv ~/.zshrc ~/.zshrc.orig
```

* Clone this repo to `~/Projects/Personal/`

```shell
cd ~ && git clone https://github.com/jthegedus/dotfiles "Projects/Personal/dotfiles"
```

* Add symlink between `~/.zshrc` and `/tilde/.zshrc`:

```shell
ln -sv ~/Projects/Personal/dotfiles/tilde/.zshrc ~/.zshrc
```

* Close and re-open your Terminal app to initiate the ZSH plugins installation.

### Terminal App Styling

Now that our prompt is configured, let's style our Terminal application too!

* Create the Terminal profile with the Atom One-Dark theme from `/scripts/one-dark.sh`: run

```shell
bash ./Projects/Personal/dotfiles/scripts/one-dark.sh
```

* Open the Terminal app preferences through `Edit -> preferences` and navigate to the `Profiles` tab. From the `Profile used when launching a new terminal` drop-down, select the `One Dark` profile.
* Close and re-open your Terminal app to see the new theme!

## ZSH on Bash on Windows Setup

**Tested on Windows 10 Insider Preview Version 1703 - Build 15063.11**

**Warning - 01/04/2017** I've experienced issues with Bash on Windows when using [yarn](https://github.com/yarnpkg/yarn). The following instructions were tested on a _Slow Ring_ installation of the Windows Insider build as of this warning's date. The _Windows 10 Creators Update_ should have fixed these issues. The specific issue related to connecting to Webpack Development Servers in the system default browser when started in Bash on Windows.

* Open Bash on Windows (this guide assumes you have this installed, if not follow this [Microsoft guide](https://msdn.microsoft.com/en-au/commandline/wsl/install_guide))
* Install ZSH:

```shell
sudo apt-get update && sudo apt-get upgrade && sudo apt-get install zsh
```

* Add the following to the top of `.bashrc` to launch ZSH on start of the Bash on Windows app. Edit this using `nano .bashrc` in Bash on Windows.

```shell
# Switch to ZSH shell
if test -t 1; then
  exec zsh
fi
```

* Assuming the folder structure outlined [here](#your-repo-structure) is present in your Windows user folder, add a symlink for the Ubuntu user-space `Projects` directories and the Windows `Projects` directories

  **NB**: This creates the `Projects` folder in the Ubuntu user-space.

```shell
ln -sv /mnt/c/Users/<username>/Projects ~/Projects
```

Check the above with `ls -la`. Symlinks are render as the local folder/file name followed by `->` and then the linked directory/file path.

    Eg: ``Projects -> /mnt/c/Users/<username>/Projects``

* Install oh-my-zsh:

```shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

* Add Zgen for zsh plugin management:

```shell
git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"
```

* Add [z](https://github.com/rupa/z) for Terminal navigation. It's a supercharged `cd`! Video \#10 in [this series](https://commandlinepoweruser.com) by [Wes Bos](https://twitter.com/@wesbos) covers the power of `z` pretty well.

```shell
wget https://raw.githubusercontent.com/rupa/z/master/z.sh
```

* Backup existing .zshrc

```shell
mv ~/.zshrc ~/.zshrc.orig
```

* Clone this repo to `~/Projects/Personal/`

```shell
git clone https://github.com/jthegedus/dotfiles.git "~/Projects/Personal"
```

* Add symlink between `~/.zshrc` and `/home/<username>/Projects/Personal/dotfiles/tilde/.zshrc`:

```shell
ln -sv ~/Projects/Personal/dotfiles/tilde/.zshrc ~/.zshrc
```

Check this is a symlink with `ls -la`.

EG: `.zshrc -> /home/<username>/Projects/Personal/dotfiles/tilde/.zshrc`

* Apply new `.zshrc` and install plugins (as specified in `.zshrc`)

```shell
source ~/.zshrc
```

NB: Bash on Windows has trouble rendering some of the special characters used by this Zsh theme. Follow the instructions below to fix this and have additional Terminal superpowers!

### Styling your Terminal (Not prompt)

Zsh themes modify your **prompt**, but we would like to have a nice Terminal application theme. Since Bash on Windows does not have a very powerfull theme/preference manager we will have to use an alternative application to achieve complete terminal zen.

* Ditch the Bash on Windows Terminal application.
* Download and install [hyper](https://hyper.is) (The GitHub repo here: [Hyper Terminal](https://github.com/zeit/hyper)). Hyper is a cross platform Terminal application that can run any shell.
* Backup existing `.hyper.js` config file.

```shell
mv /mnt/c/Users/<username>/.hyper.js /mnt/c/Users/<username>/.hyper.js.orig
```

* Copy the new `.hyper.js` config file

```shell
cp ~/Projects/Personal/dotfiles/windows/.hyper.js /mnt/c/Users/<username>/.hyper.js
```

* Next, since Hyper is built on [Electron](https://electron.atom.io/) it requires [NodeJS](https://nodejs.org/) to be installed as the packages are managed by npm.
* Launch Hyper and all the plugins will be installed and loaded automatically (Windows notifications may go crazy for a while)

NB: To add plugins or modify the theme in Hyper Terminal modify the `.hyper.js` file plugins section. You can find the Awesome collection at <https://github.com/bnb/awesome-hyper>

## To do:

* [ ] create install script for automated setup
* [ ] create separate automated symlinking process
* [ ] add script to automatically run `nvm use`, `rvm use` etc on folder change to an repo
* [x] add Bash on Windows instructions
* [x] add support for Web Development tools
* [x] add ZSH plugins through zgen
