<h1 align="center">Development Tools - Manual Guide</h1>

<p align="center">Instructions to install the setup I use</p>

<p align="center">
    <em>
     <a href="#os-level-dependencies">OS Level Deps</a>
    · <a href="#terminal-mastery">Terminal Mastery</a>
    · <a href="#languagetool-level-dependencies">Language/Tool Deps</a>
    · <a href="#tools-depending-on-the-now-installed-languages">Lang Dependent Tools</a>
    </em>
</p>

## OS level dependencies

```shell
sudo apt install git curl automake autoconf libreadline-dev libncurses-dev \
libssl-dev libyaml-dev libxslt-dev libffi-dev libtool unixodbc-dev -y
```

[asdf](https://github.com/asdf-vm/asdf) for language management:

```markdown
# clone asdf

git clone https://github.com/asdf-vm/asdf.git ~/.asdf

cd ~/.asdf

# checkout latest branch

git checkout $(git describe --abbrev=0 --tags)
```

Close and reopen your terminal session to now use `asdf`.

<details>
<summary>git</summary>

```markdown
# git config --global user.name john

git config --global user.name <username>

# git config --global user.email john@gmail.com

git config --global user.email <email>

# git config --global core.editor code

git config --global core.editor <editor>
```

</details>

## Terminal mastery

<details>
<summary>z <a href="https://github.com/rupa/z">- docs</a> - terminal nav via fuzzy finding <a href="https://en.wikipedia.org/wiki/Frecency">frecency</a></summary>

```markdown
cd ~ && wget https://raw.githubusercontent.com/rupa/z/master/z.sh
```

ensure `source "$HOME/z.sh"` is in your `.bashrc` or `.zshrc`.

</details>

<details>
<summary>fzf <a href="https://github.com/junegunn/fzf#using-git">- docs</a> - terminal command fuzzy finder</summary>

```markdown
# download

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf

# install

# 🚨 WARNING!!! when prompt, do not update your shell configuration files.

~/.fzf/install
```

</details>

## Language/Tool level dependencies

<details>
<summary>Nodejs</summary>

```markdown
# plugin

asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git

# nodejs release keyring

bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring

# nodejs LTS & Current

asdf install nodejs 8.12.0
asdf install nodejs 10.11.0

# set as global default

asdf global nodejs 8.12.0
```

</details>

<details>
<summary>Yarn - <a href="https://yarnpkg.com/en/docs/install">docs</a></summary>

```markdown
# add sources

curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

# remove cmdtest (Ubuntu 18.04)

sudo apt remove cmdtest

# update sources

sudo apt-get update

# install yarn

sudo apt-get install yarn -y
yarn --version
```

<details>
<summary>If you are not using the provided <code>.bashrc</code> or <code>.zshrc</code>:</summary>

add the following to your `.*rc`

```shell
PATH="$PATH:/opt/yarn-[version]/bin"
PATH="$PATH:$(yarn global bin)"
export PATH
```

</details>

---

</details>

<details>
<summary>Shellcheck - <a href="https://github.com/koalaman/shellcheck#installing">docs</a></summary>

Ubuntu:

```shell
sudo apt install shellcheck -y
```

Windows:

Download the binary as [directed here](https://github.com/koalaman/shellcheck#installing) from <https://storage.googleapis.com/shellcheck/shellcheck-stable.zip>

</details>

<details>
<summary>Python</summary>

```markdown
# deps

sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev \
libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
xz-utils tk-dev -y

# plugin

asdf plugin-add python https://github.com/tuvistavie/asdf-python.git

# install python

asdf install python 3.6.0

# set as global default

asdf global python 3.6.0
```

Ensure `export PATH=~/.local/bin:$PATH` is in your `.bashrc` or `.zshrc`.

Reload your session: `source ~/.bashrc` or `.zshrc`

**pip with asdf**

```markdown
# required

asdf reshim python

# note the version and the path is within .asdf/installs/

pip --version

pip install --upgrade pip

# ensure the path is still under .asdf/installs/

pip --version
```

</details>

<details>
<summary>Java</summary>

```markdown
# plugin

asdf plugin-add java https://github.com/skotchpine/asdf-java

# latest java version

asdf install java oracle-10.0.2

# set as global default

asdf global java oracle-10.0.2
```

Note: Maven & Gradle installed separately.

</details>

<details>
<summary>Other langs</summary>

By now you surely get the idea for [setting up another lang or tool](https://github.com/asdf-vm/asdf-plugins) with [asdf](https://github.com/asdf-vm/asdf).

</details>

## Tools (depending on the now installed languages)

<details>
<summary>trash-cli - <a href="https://github.com/sindresorhus/trash-cli">docs</a></summary>

```shell
yarn global add trash-cli
```

<details>
<summary>If you are not using the provided <code>/common/.aliases</code> file:</summary>

ensure `alias rm=trash` is in your `.bashrc` or `.zshrc`.

</details>

---

</details>

<details>
<summary>aws cli - <a href="http://docs.aws.amazon.com/cli/latest/userguide/awscli-install-linux.html#awscli-install-linux-pip">docs</a></summary>

```markdown
# install

pip install awscli --upgrade --user
aws --version

# setup

aws configure

# upgrade

pip install awscli --upgrade --user
```

</details>

