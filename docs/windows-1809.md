<h1 align="center"> Windows 10 (1809) with Windows Subsystem for Linux (WSL)</h1>

<p align="center">Steps to setup Windows 10 1809 with WSL and integrate it with my <a href="./dev-tools-manual.md">dev-tools</a></p>

<p align="center">
    <em>
     <a href="#install-ubuntu-from-windows-store">Ubuntu on Windows</a>
    · <a href="#setup-filesystem-syncing">Setup filesystem syncing</a>
    · <a href="#yarn-node-other-dev-tools--caveat-emptor">dev tools & Caveat Emptor</a>
    · <a href="#wsl-within-vscode">Bash & VSCode</a>
    </em>
</p>


## Enable WSL

1. press `windows key`
2. type `developer settings` & press `enter`
3. select `developer mode`
4. press `windows key`
5. type `turn windows features on or off` & press `enter`
6. check `Windows Subsystem for Linux` & then press `ok`
7. reboot

## Install Ubuntu from Windows Store

[16.04 LTS](https://www.microsoft.com/store/productId/9PJN388HP8C9) or [18.04 LTS](https://www.microsoft.com/store/productId/9N9TNGVNDL3Q).

Boot the app and follow any instructions.

Update Ubuntu deps: `sudo apt-get update && sudo apt-get upgrade`

## Setup filesystem syncing

The filesystem used by the Linux shell is hidden deep in your user's AppData folder. To make developing more convenient we will setup a symlink between our `projects` folder across the two environments.

1. create a `projects` folder in your Windows user space. I like to use `C:\Users\james\projects`
2. open Ubuntu
3. create a symlink by linking your new projects folder from Windows to our Ubuntu user space.
  ```shell
    ln -sv /mnt/c/Users/<windows username>/projects ~/projects
  ```
4. validate the symlink with `ls -la` and creating and editing a file from each user space to see that the changes are reflected correctly.

## Yarn, Node, other dev tools & Caveat Emptor

Now that you have a Ubuntu and Bash environment setup, you should be able to follow the [dev-tools instructions](./dev-tools-manual.md) for setting up asdf, Yarn, Node etc.

🚨 There may be issues with running some Ubuntu tools within WSL as not all Ubuntu system calls are supported by WSL. Use at your own risk.

## WSL within VSCode

The App Store exe for Ubuntu 18.04 seems to be inaccessible to the user via the filesystem, however there is a `bash.exe` app accessible via `C:\Windows\System32\bash.exe` which appears to be the identical environment.

Add this to your VSCode settings:

```json
"terminal.integrated.shell.windows": "C:\\Windows\\System32\\bash.exe"
"terminal.external.windowsExec": "C:\\Windows\\System32\\bash.exe"
```

Now open your terminal and you should see that the path is the windows mounted volume is the ubuntu user space. Eg: `jt@ac:/mnt/c/Users/james/projects/<your repo>$`.

If you setup the symlink as directed above you should be able to nav to `cd ~/projects/<your repo>/` and see the same reflected files reflected.