# Ubuntu Gnome Setup

Steps to setup a slick Ubuntu UI and UX.

## Ubuntu 18.04 on Lenovo ThinkPad E485/E585

Ubuntu will hang on installation on a Lenovo ThinkPad E485/E585. [To solve this, follow these instructions: Ubuntu 18.04 LTS on Lenovo ThinkPad E485](https://medium.com/@jthegedus/ubuntu-18-04-lts-on-lenovo-thinkpad-e485-15e1d601473f)

## Ubuntu 18.04 on XPS15 9560

On login the OS may hang. [To fix this follow these instructions: Ubuntu 18.04 on XPS 15 9560](https://medium.com/@jthegedus/ubuntu-18-04-lts-on-a-dell-xps-db4dcee9a2f9).

## Required for Setup

```shell
sudo apt install git curl -y
```

## Programs

<details>
<summary><b>Available on Ubuntu Software</b></summary>

| App                                     | Description                                                                                                     |
| --------------------------------------- | --------------------------------------------------------------------------------------------------------------- |
| Discord                                 | All-in-one voice and text chat for gamers                                                                       |
| GitKraken                               | Git GUI. If downloaded from their website, run: `sudo apt install libgnome-keyring-common libgnome-keyring-dev` |
| [Gimp](https://www.gimp.org/)           | GNU Image Manipulation Program                                                                                  |
| GNOME Tweaks                            | Gnome GUI Tweaks                                                                                                |
| Signal                                  | Signal Private Messenger for Windows, Mac, and Linux                                                            |
| Slack                                   | Team communication and collaboration                                                                            |
| [Solaar](https://pwr.github.io/Solaar/) | Browse faster by blocking ads and trackers that violate your privacy and cost you time and money.               |
| [Synergy](https://symless.com/synergy)  | Share one mouse and keyboard between multiple computers                                                         |
| Sublime Text 3                          | Code Editor                                                                                                     |
| VLC                                     | Media player                                                                                                    |
| VSCode                                  | Code Editor                                                                                                     |

</details>

<details>
<summary><b>Other</b></summary>

| App                                                                                    | Description                                                  |
| -------------------------------------------------------------------------------------- | ------------------------------------------------------------ |
| [Chrome](https://www.google.com.au/chrome/browser/desktop/index.html)                  | Google's web browser                                         |
| [Etcher](https://etcher.io)                                                            | Flash OS images to SD cards & USB drives, safely and easily. |
| [Private Internet Access](https://www.privateinternetaccess.com/pages/client-support/) | VPN                                                          |
| [Vivaldi](https://vivaldi.com/download/)                                               | Fast, customisable web browser                               |

</details>

<details>
<summary><b>Chrome Apps</b></summary>

| App                                                                                                               | Description                                |
| ----------------------------------------------------------------------------------------------------------------- | ------------------------------------------ |
| [Authy](https://chrome.google.com/webstore/detail/authy/gaedmjdfmmahhbjefcbgaolhhanlaolb?hl=en)                   | Single 2FA app running on all your devices |
| [Kindle](https://chrome.google.com/webstore/detail/kindle-cloud-reader/icdipabjmbhpdkjaihfjoikhjjeneebd?hl=en-US) | Read your Kindle titles anywhere           |

</details>

## UI

**[La-Capitaine Icons](https://github.com/keeferrourke/la-capitaine-icon-theme#preview)**

```shell
mkdir ~/.icons && cd ~/.icons/
git clone https://github.com/keeferrourke/la-capitaine-icon-theme.git
```

Now open Gnome Tweak Tool :arrow_right: Appearance and set the Icons to La-capitaine-icon-theme

**[Communitheme](https://github.com/ubuntu/yaru#testing-yarucommunitheme-snap-on-ubuntu-1804-bionic-beaver)**

Install the snap:

```shell
snap install communitheme
```

Restart your machine. Click the gear next to the **Sign In** button and ensure the option **Ubuntu with commnuitheme snap** is selected.

If the theme is not set for the application windows, open **Gnome Tweak Tool** :arrow_right: Appearance :arrow_right: Themes :arrow_right: click the Applications dropdown :arrow_right: `Communitheme`.

## Gnome Extensions

I use the [GNOME Shell integration](https://chrome.google.com/webstore/detail/gnome-shell-integration/gphhapmejobijbbhgpjhcjognlahblep?hl=en) to add Gnome shell extensions to my system. Add the extension and then run the command below:

```shell
sudo apt-get install chrome-gnome-shell
```

| Extension                                                                                                      | Description                         |
| -------------------------------------------------------------------------------------------------------------- | ----------------------------------- |
| [Alternate Tab](https://extensions.gnome.org/extension/15/alternatetab/)                                       | Better alt-tab                      |
| [Sound Input & Output Device Chooser](https://extensions.gnome.org/extension/906/sound-output-device-chooser/) | Select audio IO from media dropdown |

## Settings

### Gnome Tweak Tool

| Feature                    | Instructions                                                                      |
| -------------------------- | --------------------------------------------------------------------------------- |
| Battery Percentage         | Top Bar :arrow_right: Battery Percentage :arrow_right: ON                         |
| Show date next to time     | Top Bar :arrow_right: Clock :arrow_right: Date :arrow_right: ON                   |
| Window controls like macOS | Windows :arrow_right: Titlebar Buttons :arrow_right: Placement :arrow_right: Left |

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
sudo nano /etc/sysctl.conf
```

paste `fs.inotify.max_user_watches=524288` at the bottom of the file. Then run:

```shell
sudo sysctl -p
sudo sysctl --system
```
