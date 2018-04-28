# Ubuntu Gnome Setup
Steps to setup a slick Ubuntu UI and UX.

## Installing Ubuntu Gnome on XPS15 9560
*   Erase Disk and Install Ubuntu Gnome from a USB
*   on first login to user the login screen will hang. To fix this, before typing the password and logging in, select the settings cog next to the sign-in button and change to "Gnome on Wayland". This will then login as you would expect.

## Required for Setup
**Install git**

```shell
sudo apt install git -y
```

## UI
**[La-Capitaine Icons](https://github.com/keeferrourke/la-capitaine-icon-theme#preview)**

```shell
cd ~/.icons/
git clone https://github.com/keeferrourke/la-capitaine-icon-theme.git
```
Now open Gnome Tweak Tool -> Appearance and set the Icons to La-capitaine-icon-theme

**[OSX Arc Darker](https://github.com/LinxGem33/OSX-Arc-Darker/releases/latest/)**

Download the amd64.deb file.
Double-click the file to install
Now open Gnome Tweak Tool -> Appearance and set the Theme to 

## Gnome Extensions
*   [ShellTile](https://extensions.gnome.org/extension/657/shelltile/)
*   [Impatience](https://extensions.gnome.org/extension/277/impatience/)
*   [Alternate Tab](https://extensions.gnome.org/extension/15/alternatetab/)
*   [Sound Input & Output Device Chooser](https://extensions.gnome.org/extension/906/sound-output-device-chooser/)

### Tweak Tool Settings
*   Extensions -> ShellTile Settings -> Size of the gaps between windows. Set this  to 0.
*   Windows -> Titlebar Buttons -> Maximize
*   Windows -> Titlebar Buttons -> Minimize

If you like using your desktop for files etc: Desktop -> Icons on Desktop.

## Settings
**Tap to Click**

Go to "Mouse and Touchpad" settings and turn on "Tap to Click".

**Battery % Indicator**
```shell
gsettings set org.gnome.desktop.interface show-battery-percentage true
```
Change the setting to `false` to reverse the above effect.

## Programs
*   [Chrome](https://www.google.com.au/chrome/browser/desktop/index.html)
*   [Brave](https://brave.com/download/)
*   [Vivaldi](https://vivaldi.com/download/)
*   [Discord](https://discordapp.com/download)
*   [Slack](https://slack.com/downloads/linux)
*   [Signal](https://signal.org/download/)
*   [Mailspring](https://getmailspring.com/)
*   [Gimp](https://www.gimp.org/downloads/)
*   [Google Play Music](https://www.googleplaymusicdesktopplayer.com/)
*   [Spotify](https://www.spotify.com/au/download/linux/)
*   [Headset](https://headsetapp.co/)

### Programming
*   [VSCode](https://code.visualstudio.com/download)
*   [GitKraken](https://www.gitkraken.com/)
*   [Sublime Text 3](https://www.sublimetext.com/docs/3/linux_repositories.html)
*   [Postman](https://www.getpostman.com/apps)
*   [Graphql Playground](https://github.com/graphcool/graphql-playground/releases)

### Utils
*   [Etcher](https://etcher.io)
*   [Private Internet Access](https://www.privateinternetaccess.com/pages/client-support/)
*   [Solaar](https://pwr.github.io/Solaar/)
*   [Synergy](https://symless.com/synergy)

### Chrome apps
*   [Authy](https://chrome.google.com/webstore/detail/authy/gaedmjdfmmahhbjefcbgaolhhanlaolb?hl=en)
*   [Kindle](https://chrome.google.com/webstore/detail/kindle-cloud-reader/icdipabjmbhpdkjaihfjoikhjjeneebd?hl=en-US)

```shell
sudo apt install vlc browser-plugin-vlc -y
```

## Fonts
*   [Fira Code](https://github.com/tonsky/FiraCode)
*   [Hack](https://github.com/source-foundry/Hack)
*   [Dank Mono](https://dank.sh/)

