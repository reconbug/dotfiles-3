<h1 align="center">Ubuntu Setup</h1>

<p align="center">Instructions to setup the apps I use and Gnome how I like it</p>

<p align="center">
    <em>
     <a href="#programs">Programs</a>
    · <a href="#gnome-extensions">Gnome Extensions</a>
    · <a href="#settings">Settings</a>
    · <a href="#ui">UI</a>
    </em>
</p>

## Mobile Hardware Compat Guides

### Ubuntu 18.04/18.10 on Lenovo ThinkPad E485/E585

Ubuntu will hang on installation on a Lenovo ThinkPad E485/E585. [To solve this, follow these instructions: Ubuntu 18.04 LTS on Lenovo ThinkPad E485](https://medium.com/@jthegedus/ubuntu-18-04-lts-on-lenovo-thinkpad-e485-15e1d601473f)

### Ubuntu 18.04/18.10 on XPS15 9560

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
| GNOME Tweaks                            | Gnome GUI Tweaks (ships with 18.10)                                                                             |
| Signal                                  | Signal Private Messenger for Windows, Mac, and Linux                                                            |
| Slack                                   | Team communication and collaboration                                                                            |
| [Solaar](https://pwr.github.io/Solaar/) | Browse faster by blocking ads and trackers that violate your privacy and cost you time and money.               |
| [Synergy](https://symless.com/synergy)  | Share one mouse and keyboard between multiple computers                                                         |
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

## Gnome Extensions

To install Gnome extensions from <https://extensions.gnome.org/> first add:

```shell
# automatically installed by my dotfiles/scripts/install.sh script
sudo apt-get install chrome-gnome-shell -y
```

You also need a browser integration:

- [Firefox](https://addons.mozilla.org/en-US/firefox/addon/gnome-shell-integration/)
- [Chrome](https://chrome.google.com/webstore/detail/gnome-shell-integration/gphhapmejobijbbhgpjhcjognlahblep)

| Gnome Extension                                                                                                | Description                         |
| -------------------------------------------------------------------------------------------------------------- | ----------------------------------- |
| [Alternate Tab](https://extensions.gnome.org/extension/15/alternatetab/)                                       | Better alt-tab                      |
| [Sound Input & Output Device Chooser](https://extensions.gnome.org/extension/906/sound-output-device-chooser/) | Select audio IO from media dropdown |

## Settings

### Gnome Tweak Tool

| Feature                    | Instructions                                     |
| -------------------------- | ------------------------------------------------ |
| Battery Percentage         | Top Bar ➡️ Battery Percentage ➡️ ON              |
| Show date next to time     | Top Bar ➡️ Clock ➡️ Date ➡️ ON                   |
| Window controls like macOS | Windows ➡️ Titlebar Buttons ➡️ Placement ➡️ Left |

### Ubuntu

#### Settings

| Feature            | Instructions                                   |
| ------------------ | ---------------------------------------------- |
| Night Light (Flux) | Devices ➡️ Screen Display ➡️ Night Light ➡️ On |

Arbitrary system settings set via the terminal (automatically set by my `dotfiles/scripts/install.sh` script):

```markdown
# exfat support

sudo apt-get install exfat-fuse exfat-utils

# increase watchers

echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf
sudo sysctl -p
```

## UI

These settings are for people using 18.04 LTS. 18.10 already comes with the Yuru theme 💯

⚠️ Because I no longer use these settings they may become out of date.

**[La-Capitaine Icons](https://github.com/keeferrourke/la-capitaine-icon-theme#preview)**

```shell
mkdir ~/.icons && cd ~/.icons/
git clone https://github.com/keeferrourke/la-capitaine-icon-theme.git
```

Now open Gnome Tweak Tool ➡️ Appearance and set the Icons to La-capitaine-icon-theme

**[Yuru](https://github.com/ubuntu/yaru#testing-yarucommunitheme-snap-on-ubuntu-1804-bionic-beaver)**

Install the snap:

```shell
snap install communitheme
```

Restart your machine. Click the gear next to the **Sign In** button and ensure the option **Ubuntu with commnuitheme snap** is selected.

If the theme is not set for the application windows, open **Gnome Tweak Tool** ➡️ Appearance ➡️ Themes ➡️ click the Applications dropdown ➡️ `Communitheme`.
