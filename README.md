# Info

This is a docker image that has all three brave versions installed on a fedora distrobox container

This is powered by [gum](https://github.com/charmbracelet/gum)
 
## Usage

Create the distrobox container

```bash
distrobox create -i ghcr.io/dnkmmr69420/brave:latest -n brave -p
```

You can use a custom home directory if you wanted to

```bash
distrobox create -i ghcr.io/dnkmmr69420/brave:latest -n brave -H ~/path/to/directory -p
```

### Menu

To get the menu to show up again after exiting brave, type `startup` in the container

## brave opt compatability

When you install a web app with brave, it executes brave in /opt which doesn't exist on the host. This script adds some bash scripts in /opt/brave.com to redirect to brave in distrobox. It runs the exported binaries. Requires root access to run. DO NOT USE IT IF YOU INSTALLED BRAVE ON THE HOST (flatpak and snap versions do not count).

```bash
curl -s https://raw.githubusercontent.com/dnkmmr69420/brave-distrobox/main/opt-compatability | sudo bash
```

To revert

```bash
sudo rm -rf /opt/brave.com
```
