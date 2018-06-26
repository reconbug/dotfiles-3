# [VSCode](https://code.visualstudio.com/download) Development Setup

[My vscode user-settings can be found here](https://gist.github.com/jthegedus/543979bdd5026834c9cebbf2e0e2d25e#file-settings-json).

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

| Font                                            | Ligatures                     | Free                          | Installation                                               |
| ----------------------------------------------- | ----------------------------- | ----------------------------- | ---------------------------------------------------------- |
| [Roboto]()                                      | :negative_squared_cross_mark: | :ballot_box_with_check:       | <pre><code>sudo apt-get install fonts-roboto</code></pre>  |
| [Hack](https://github.com/source-foundry/Hack)  | :negative_squared_cross_mark: | :ballot_box_with_check:       | <pre><code>sudo apt install fonts-hack-ttf -y</code></pre> |
| [Fira Code](https://github.com/tonsky/FiraCode) | :ballot_box_with_check:       | :ballot_box_with_check:       | Download, extract, copy `ttf/` contents to `~/.fonts`.     |
| [Dank Mono](https://dank.sh/)                   | :ballot_box_with_check:       | :negative_squared_cross_mark: | Purchase, then same as above.                              |

4.  Update your font cache:

```shell
fc-cache -f -v
```

## Extensions

Must Have:

- [Settings Sync](https://marketplace.visualstudio.com/items?itemName=Shan.code-settings-sync) - Store your config in the cloud making multi-machine and reinstallations a breeze!
- [Prettier](https://marketplace.visualstudio.com/items?itemName=esbenp.prettier-vscode) - Let tools do the heavy style and format lifting.
- [ESLint](https://marketplace.visualstudio.com/items?itemName=dbaeumer.vscode-eslint) - Lint for bad patterns (use Prettier for styling or formatting).

Convenience:

- [gitignore](https://marketplace.visualstudio.com/items?itemName=codezombiech.gitignore) - .ignore file highlighting.

Javascript:

- [npm Intellisense](https://marketplace.visualstudio.com/items?itemName=christian-kohler.npm-intellisense) - Intellisense all the things!
- [Path Intellisense](https://marketplace.visualstudio.com/items?itemName=christian-kohler.path-intellisense) - Intellisense all the things!
- [Import Cost](https://marketplace.visualstudio.com/items?itemName=wix.vscode-import-cost) - Slimmer apps are faster, ensure you know what you're feeding your application.
- [Flow](https://marketplace.visualstudio.com/items?itemName=flowtype.flow-for-vscode) - Type your JS without Typescript.
- [Quokka.js](https://marketplace.visualstudio.com/items?itemName=WallabyJs.quokka-vscode) - [Run core in your editor as you type!](https://quokkajs.com/)

Other:

- [Reason](https://marketplace.visualstudio.com/items?itemName=freebroccolo.reasonml) - Everyone should try new things.
