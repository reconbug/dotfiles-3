# Dotfiles & ZSH Setup (for Ubuntu)

This is a collection of dotfiles and setup scripts I use for customizing my Unix Terminal :)

## But why? So many other dotfile setups exist!

I change my machines often and this was originally just for myself so I had less errors during setup on each machine. I decided to share it all after seeing many people asking people with similar setups on Twitter how to do so.

## Environment Management

I've also had problems with <any-lang> version managers. MacOS machines have consistent installation because of the relience on Homebrew. With Unix and Windows each version manager for a particular language is installed in a different way. For example, look at NodeJS: <https://github.com/nodenv/nodenv/wiki/alternatives> What a nightmare!

To simplify, I use:

* [Zsh](http://www.zsh.org/)
* [Oh-My-Zsh](https://github.com/robbyrussell/oh-my-zsh)
* [Zgen](https://github.com/tarjoilija/zgen) - plugin manager for Zsh
* [asdf](https://github.com/asdf-vm/asdf) - an extendable version manager. This saves all the mess of managing and installing multiple version manangers.
* [Yarn](https://yarnpkg.com/) - Package manager. [Multi-language support coming in the future](https://github.com/yarnpkg/yarn/issues/3644).

This README is intended for first time Zsh users and so is particularly verbose.

## Contents

* [Repo Structure](#repository-structure)
* [Zsh & Environment Setup](#zsh-&-environment-setup)
* [Terminal Theming](#terminal-theming)

## Repository Structure

This project uses symlinks to control your . files so you can update with a simple `git pull` in the repo folder. In doing so this assumes the following repository folder structure:

```
~/Projects
~/Projects/Forks
~/Projects/Job
~/Projects/Personal
~/Projects/Playground
```

Where this `dotfiles` repo is cloned to `~/Projects/Personal/`, resulting in `~/Projects/Personal/dotfiles/`. If you wish to use a different folder structure, do a **search and replace** on `/Projects/Personal`. Other Zsh install guides recommend putting the `/Dotfiles/` folder in your user Home folder `~/`

To create the folder structure run this command in Bash:

```shell
cd ~ && mkdir -p Projects/Forks Projects/Job Projects/Personal Projects/Playground
```

This setup also assumes you store your ssh keys in `~/.ssh`:

```shell
cd ~ && mkdir ~/.ssh
```

If you're a GitHub user follow [this guide to setup SSH access](https://help.github.com/articles/connecting-to-github-with-ssh/).

## Zsh & Environment Setup

### Prerequisites

The following are required for [Zsh](http://www.zsh.org/), [asdf](https://github.com/asdf-vm/asdf) and the asdf-python plugin dependency, [Python-build](https://github.com/pyenv/pyenv/tree/master/plugins/python-build#installing-as-a-standalone-program-advanced):

```shell
sudo apt-get install git curl automake autoconf libreadline-dev libncurses-dev libssl-dev libyaml-dev libxslt-dev libffi-dev libtool unixodbc-dev make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev xz-utils tk-dev -y
```

### Install Zsh

```shell
sudo apt-get update && sudo apt-get upgrade && sudo apt-get install zsh -y
```

Make ZSH the default shell (**you must logout or restart for this to take effect**)

```shell
chsh -s $(which zsh)
```

On reopening the Terminal you will be prompt by Zsh to create a configuration file. Select option (2).

Install oh-my-zsh:

```shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

Add Zgen for zsh plugin management:

```shell
git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"
```

Add [z](https://github.com/rupa/z) for Terminal navigation. It's a supercharged `cd`! Video \#10 in [this series](https://commandlinepoweruser.com) by [Wes Bos](https://twitter.com/@wesbos) covers the power of `z` pretty well.

```shell
wget https://raw.githubusercontent.com/rupa/z/master/z.sh
```

Backup existing .zshrc

```shell
mv ~/.zshrc ~/.zshrc.orig
```

Clone this repo to `~/Projects/Personal/`

```shell
cd ~ && git clone https://github.com/jthegedus/dotfiles "Projects/Personal/dotfiles"
```

Add symlink between `~/.zshrc` and `/tilde/.zshrc`:

```shell
ln -sv ~/Projects/Personal/dotfiles/tilde/.zshrc ~/.zshrc
```

Add symlink between `~/.asdfrc` and `/tilde/.asdfrc`:

```shell
ln -sv ~/Projects/Personal/dotfiles/tilde/.asdfrc ~/.asdfrc
```

Close and re-open your Terminal app to initiate the ZSH plugins installation.

### Install Development Tools

This setup uses asdf and Yarn:

```shell
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update && sudo apt-get install yarn -y
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.3.0
```

[Add & Install NodeJS](https://github.com/asdf-vm/asdf-nodejs#install):

```shell
asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git
bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring
asdf install nodejs 6.11.3
```

[Add & Install Python](https://github.com/tuvistavie/asdf-python#install). This requires standalone [Python-build](https://github.com/pyenv/pyenv/tree/master/plugins/python-build#installing-as-a-standalone-program-advanced) which may require `sudo` permissions for the install script:

```shell
git clone git://github.com/pyenv/pyenv.git
cd pyenv/plugins/python-build
./install.sh
asdf plugin-add python https://github.com/tuvistavie/asdf-python.git
asdf install python 2.7.13
asdf install python 3.6.0
```

Set the global versions (used when no local version specified in a project):

```shell
asdf global python 2.7.13
asdf global nodejs 6.11.3
```

[Install Pip](http://docs.aws.amazon.com/cli/latest/userguide/awscli-install-linux.html#awscli-install-linux-pip):

```shell
curl -O https://bootstrap.pypa.io/get-pip.py
python get-pip.py --user
pip --version
```

## Terminal Theming

Now that our prompt is configured, let's style our Terminal application too!

Create the Terminal profile with the Atom One-Dark theme from `/scripts/one-dark.sh`: run

```shell
bash ./Projects/Personal/dotfiles/scripts/one-dark.sh
```

Open the Terminal app preferences through `Edit -> preferences` and navigate to the `Profiles` tab. From the `Profile used when launching a new terminal` drop-down, select the `One Dark` profile.

Close and re-open your Terminal app to see the new theme!

## Credit / Prior Art

* It was this Zsh theme that inspired me to try Zsh <https://github.com/denysdovhan/spaceship-zsh-theme>
* Of course <https://github.com/robbyrussell/oh-my-zsh>
* The [Hyper terminal app](https://hyper.is) fixes many of the issues encountered with using Bash on Windows
* [Awesome Hyper](https://github.com/bnb/awesome-hyper)
* The power of [z](https://github.com/rupa/z/) makes you feel like a true terminal super user, thanks [Wes Bos](https://twitter.com/@wesbos)
* Some dotfiles resources:
  * <https://dotfiles.github.io>
  * <https://github.com/webpro/awesome-dotfiles>
  * <https://github.com/denysdovhan/dotfiles>
