<h1 align="center"><a href="https://code.visualstudio.com/download">VSCode</a> Development Setup</h1>

<p align="center">The extensions & fonts I use</p>

<p align="center">
    <em>
     <a href="#extensions">Extensions</a>
    · <a href="#fonts">Fonts</a>
    </em>
</p>

## Extensions

[My vscode sync-settings can be found here](https://gist.github.com/jthegedus/543979bdd5026834c9cebbf2e0e2d25e#file-settings-json).

Must Have:

- [Settings Sync](https://marketplace.visualstudio.com/items?itemName=Shan.code-settings-sync) - Store your config in the cloud making multi-machine and reinstallations a breeze!
- [Prettier](https://marketplace.visualstudio.com/items?itemName=esbenp.prettier-vscode) - Let tools do the heavy style and format lifting.

Themes:

- [One Dark Pro Monokai Darker](https://marketplace.visualstudio.com/items?itemName=eserozvataf.one-dark-pro-monokai-darker) - One Dark Pro x Monokai, made darker.
- [Material Icon Theme](https://marketplace.visualstudio.com/items?itemName=PKief.material-icon-theme) - Material Icons
  Convenience:

- [gitignore](https://marketplace.visualstudio.com/items?itemName=codezombiech.gitignore) - .ignore file highlighting.
- [.dotenv](https://marketplace.visualstudio.com/items?itemName=mikestead.dotenv) - .env file highlighting
- [Path Intellisense](https://marketplace.visualstudio.com/items?itemName=christian-kohler.path-intellisense) - Intellisense all the things!

ReasonML/OCaml:

- [Reason](https://github.com/reasonml-editor/vscode-reasonml) - Complete ReasonML/OCaml IDE experience.
- [or an alternative language server written in ReasonML](https://marketplace.visualstudio.com/items?itemName=jaredly.reason-vscode). - written from scratch in Reason for Reason.

Shellscripts:

- [shellcheck](https://marketplace.visualstudio.com/items?itemName=timonwong.shellcheck) - static analysis your `.sh` scripts. requires [shellcheck itself](https://github.com/koalaman/shellcheck#shellcheck---a-shell-script-static-analysis-tool).

Javascript:

- [npm Intellisense](https://marketplace.visualstudio.com/items?itemName=christian-kohler.npm-intellisense) - Intellisense all the things!
- [Import Cost](https://marketplace.visualstudio.com/items?itemName=wix.vscode-import-cost) - Slimmer apps are faster, ensure you know what you're feeding your application.
- [Flow](https://marketplace.visualstudio.com/items?itemName=flowtype.flow-for-vscode) - Type your JS without Typescript.
- [ESLint](https://marketplace.visualstudio.com/items?itemName=dbaeumer.vscode-eslint) - Lint for bad patterns (use Prettier for styling or formatting).

## Fonts

1.  Install font-manager:

```shell
sudo apt install font-manager -y
```

2.  Create fonts dir:

```shell
mkdir ~/.fonts
```

3.  Get fonts:

| Font                                               | Ligatures                     | Free                          | Installation                                               |
| -------------------------------------------------- | ----------------------------- | ----------------------------- | ---------------------------------------------------------- |
| [Roboto](https://fonts.google.com/specimen/Roboto) | :negative_squared_cross_mark: | :ballot_box_with_check:       | <pre><code>sudo apt-get install fonts-roboto -y</code></pre>  |
| [Hack](https://github.com/source-foundry/Hack)     | :negative_squared_cross_mark: | :ballot_box_with_check:       | <pre><code>sudo apt install fonts-hack-ttf -y</code></pre> |
| [Fira Code](https://github.com/tonsky/FiraCode)    | :ballot_box_with_check:       | :ballot_box_with_check:       | Download, extract, copy `ttf/` contents to `~/.fonts`.     |
| [Dank Mono](https://dank.sh/)                      | :ballot_box_with_check:       | :negative_squared_cross_mark: | Purchase, then same as above.                              |

4.  Update your font cache:

```shell
fc-cache -f -v
```