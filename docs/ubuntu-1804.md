# Ubuntu Gnome Setup

Steps to setup a slick Ubuntu UI and UX.

## Ubuntu 18.04 on XPS15 9560

On login the OS may hang. [To fix this follow these instructions: Ubuntu 18.04 on XPS 15 9560](https://medium.com/@jthegedus/ubuntu-18-04-lts-on-a-dell-xps-db4dcee9a2f9).

## Required for Setup

```shell
sudo apt install git curl -y
```

## Programs

**Available on Ubuntu Software**

| App                                      | Description                                                                                       |
| ---------------------------------------- | ------------------------------------------------------------------------------------------------- |
| Brave                                    | Browse faster by blocking ads and trackers that violate your privacy and cost you time and money. |
| Discord                                  | All-in-one voice and text chat for gamers                                                         |
| GitKraken                                | Git GUI                                                                                           |
| [Gimp](https://www.gimp.org/downloads/)  | GNU Image Manipulation Program                                                                    |
| GNOME Tweaks                             | Gnome GUI Tweaks                                                                                  |
| [Mailspring](https://getmailspring.com/) | Free, cross-platform email client                                                                 |
| Signal                                   | Signal Private Messenger for Windows, Mac, and Linux                                              |
| Slack                                    | Team communication and collaboration                                                              |
| [Solaar](https://pwr.github.io/Solaar/)  | Browse faster by blocking ads and trackers that violate your privacy and cost you time and money. |
| Spotify                                  | Music                                                                                             |
| [Synergy](https://symless.com/synergy)   | Share one mouse and keyboard between multiple computers                                           |
| Sublime Text 3                           | Code Editor                                                                                       |
| VLC                                      | Media player                                                                                      |
| VSCode                                   | Code Editor                                                                                       |

**Other**

| App                                                                                    | Description                                                    |
| -------------------------------------------------------------------------------------- | -------------------------------------------------------------- |
| [Chrome](https://www.google.com.au/chrome/browser/desktop/index.html)                  | Google's web browser                                           |
| [Etcher](https://etcher.io)                                                            | Flash OS images to SD cards & USB drives, safely and easily.   |
| [Google Play Music](https://www.googleplaymusicdesktopplayer.com/)                     | Music                                                          |
| [Graphql Playground](https://github.com/graphcool/graphql-playground/releases)         | GraphQL IDE for better development workflows                   |
| [Headset](https://headsetapp.co/)                                                      | Crowd-sourced playlists from the world’s largest music library |
| [Postman](https://www.getpostman.com/apps)                                             | API IDE                                                        |
| [Private Internet Access](https://www.privateinternetaccess.com/pages/client-support/) | VPN                                                            |
| [Vivaldi](https://vivaldi.com/download/)                                               | Fast, customisable web browser                                 |

**Chrome Apps**

| App                                                                                                               | Description                                |
| ----------------------------------------------------------------------------------------------------------------- | ------------------------------------------ |
| [Authy](https://chrome.google.com/webstore/detail/authy/gaedmjdfmmahhbjefcbgaolhhanlaolb?hl=en)                   | Single 2FA app running on all your devices |
| [Kindle](https://chrome.google.com/webstore/detail/kindle-cloud-reader/icdipabjmbhpdkjaihfjoikhjjeneebd?hl=en-US) | Read your Kindle titles anywhere           |

## UI

**[La-Capitaine Icons](https://github.com/keeferrourke/la-capitaine-icon-theme#preview)**

```shell
mkdir ~/.icons && cd ~/.icons/
git clone https://github.com/keeferrourke/la-capitaine-icon-theme.git
```

Now open Gnome Tweak Tool :arrow_right: Appearance and set the Icons to La-capitaine-icon-theme

**[OSX Arc White/Darker](https://github.com/LinxGem33/OSX-Arc-Darker/releases/latest/)**

Download the `amd64.deb` file. After installing, open Gnome Tweak Tool :arrow_right: Appearance :arrow_right: Themes :arrow_right: click the Applications dropdown :arrow_right: OSX-Arc-\*

## Gnome Extensions

I use the [GNOME Shell integration](https://chrome.google.com/webstore/detail/gnome-shell-integration/gphhapmejobijbbhgpjhcjognlahblep?hl=en) to add Gnome shell extensions to my system. Add the extension and then run the command below:

```shell
sudo apt-get install chrome-gnome-shell
```

| Extension                                                                                                      | Description                         |
| -------------------------------------------------------------------------------------------------------------- | ----------------------------------- |
| [ShellTile](https://extensions.gnome.org/extension/657/shelltile/)                                             | Window manager with tiling          |
| [Impatience](https://extensions.gnome.org/extension/277/impatience/)                                           | Animation speed modifier            |
| [Alternate Tab](https://extensions.gnome.org/extension/15/alternatetab/)                                       | Better alt-tab                      |
| [Sound Input & Output Device Chooser](https://extensions.gnome.org/extension/906/sound-output-device-chooser/) | Select audio IO from media dropdown |

## Settings

### Gnome Tweak Tool

| Feature                    | Instructions                                                                                               |
| -------------------------- | ---------------------------------------------------------------------------------------------------------- |
| 0 gap in shelltile         | Extensions :arrow_right: ShellTile Settings :arrow_right: Size of the gaps between windows :arrow_right: 0 |
| Battery Percentage         | Top Bar :arrow_right: Battery Percentage :arrow_right: ON                                                  |
| Show date next to time     | Top Bar :arrow_right: Clock :arrow_right: Date :arrow_right: ON                                            |
| Window controls like macOS | Windows :arrow_right: Titlebar Buttons :arrow_right: Placement :arrow_right: Left                          |

### Ubuntu

#### Settings

| Feature            | Instructions                                                                    |
| ------------------ | ------------------------------------------------------------------------------- |
| Night Light (Flux) | Devices :arrow_right: Screen Display :arrow_right: Night Light :arrow_right: On |

#### exfat support

```shell
sudo apt-get install exfat-fuse exfat-utils
```

#### increase watchers

```shell
echo fs.inotify.max_user_watches=524288 | sudo tee -a \ /etc/sysctl.conf && sudo sysctl -p
sysctl --system
```
