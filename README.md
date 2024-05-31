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

