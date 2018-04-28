# Ubuntu 17.10+ installation guide

**[Shellcheck](https://github.com/koalaman/shellcheck#installing)**

```shell
sudo apt-get install shellcheck
```

**add [trash-cli](https://github.com/sindresorhus/trash-cli)**

```shell
yarn global add trash-cli
```

add

```markdown
# Trash CLI

alias rm=trash
```

to .bashrc

**[fzf](https://github.com/junegunn/fzf#using-git)**

```shell
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```

**pip on python3**

assuming python 3 is installed and currently selected:

```
curl -O https://bootstrap.pypa.io/get-pip.py
python3 get-pip.py --user
```

**applications**

* VSCode
* GitKraken
* Slack
* Spotify
* Signal
* Sublime Text 3
* Chrome

**theme**
osx-arc-collection
**font**
firacode

**increase watchers**
echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p
sysctl --system
