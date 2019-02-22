# Star Labs Theme ![alt text](https://cdn.shopify.com/s/files/1/2059/5897/files/Star_50x.png?v=1513954416 "Star Labs Systems")
Star Labs Theme

Inlcudes:
* GTK 3.0 Theme
* GTK 2.0 Theme
* GNOME shell Theme
* Plymouth Theme
* Sound Theme
* Icon Set
* Cursor Theme
* Grub Theme
* Desktop Wallpapers
* GNOME extensions
* Font

# Warning: This theme is currently in beta.

## How to install
### Ubuntu, Linux Mint, elementaryOS
##### Install
```
sudo add-apt-repository ppa:starlabs/beta
sudo apt update
sudo apt install starlabstheme
```
##### Uninstall
```
sudo apt remove starlabstheme
```


### Other distributions
##### Dependancies
You need to install:
```
git sassc
```
##### Install
```
git clone https://github.com/StarLabsLtd/StarLabsTheme.git
cd StarLabsTheme
meson build
ninja -C build
sudo ninja -C build install
```
##### Uninstall
```
sudo ninja -C build uninstall
```

#### Additional Features
Some parts aren't configured on install. If you would like to use them, use the below commands. Make sure to undo these commands before uninstalling.

This isn't required if installed from our PPA.
### GDM3 Theme
##### Install
```
sudo update-alternatives --install /usr/share/gnome-shell/theme/gdm3.css gdm3.css /usr/share/gnome-shell/theme/StarLabs/gnome-shell.css 47
```
##### Uninstall
```
sudo update-alternatives --remove gdm3.css /usr/share/gnome-shell/theme/StarLabs/gnome-shell.css
```
### Session
##### Install
```
sudo glib-compile-schemas /usr/share/glib-2.0/schemas
```
##### Uninstall
```
sudo glib-compile-schemas /usr/share/glib-2.0/schemas 
```

### Plymouth
##### Install
```
update-alternatives --install /usr/share/plymouth/themes/default.plymouth default.plymouth /usr/share/plymouth/themes/StarLabs/StarLabs.plymouth 150 --slave /usr/share/plymouth/themes/default.grub default.plymouth.grub /usr/share/plymouth/themes/StarLabs/StarLabs.grub
update-initramfs -u
```
##### Uninstall
```
update-alternatives --remove default.plymouth /usr/share/plymouth/themes/starlabs-logo/starlabs-logo.plymouth
update-initramfs -u
```


Any issues or questions, please contact us at [support@starlabs.systems](mailto:supportstarlabs.systems)

[© Star Labs® / All Rights Reserved.](https://starlabs.systems) # StarLabsTheme
Star Labs GNOME Shell and GTK Theme




Any issues or questions, please contact us at support@starlabs.systems

© Star Labs® / All Rights Reserved.
https://starlabs.systems
