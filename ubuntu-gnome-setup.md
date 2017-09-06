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
*   [Extensions](https://extensions.gnome.org/extension/1036/extensions/)
*   [Dash to Dock](https://extensions.gnome.org/extension/307/dash-to-dock/)
*   [ShellTile](https://extensions.gnome.org/extension/657/shelltile/)
*   [BackSlide](https://extensions.gnome.org/extension/543/backslide/)
*   [Impatience](https://extensions.gnome.org/extension/277/impatience/)
*   [TopIcons Plus](https://extensions.gnome.org/extension/1031/topicons/)
*   [Alternate Tab](https://extensions.gnome.org/extension/15/alternatetab/)
*   [Removable Drive Menu](https://extensions.gnome.org/extension/7/removable-drive-menu/)
*   [Sound Input & Output Device Chooser](https://extensions.gnome.org/extension/906/sound-output-device-chooser/)

### Tweak Tool Settings
*   Extensions -> ShellTile Settings -> Size of the gaps between windows. Set this  to 0.
*   Extensions -> Dash to dock Settings -> Position and size. Check 'Panel mode: extend to the screen edge'.
*   Extensions -> Dash to dock Settings -> Appearance. Toggle 'Use built-in theme'. 
*   Extensions -> BackSlide Settings. Click the `+` and add a folder with some high-res images. Get some [here](https://www.producthunt.com/search/posts?q=stock). 
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
*   [Vivaldi](https://vivaldi.com/download/)
*   [VSCode](https://code.visualstudio.com/download)
*   [Atom](https://atom.io/)
*   [Slack](https://slack.com/downloads/linux)
*   [VLC](https://www.videolan.org/vlc/#download)
```shell
sudo apt install vlc browser-plugin-vlc -y
```

