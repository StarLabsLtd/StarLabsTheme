#!/bin/bash
sassc gnome-shell.{scss,css}
glib-compile-resources gnome-shell-theme.gresource.xml
# sassc gnome-shell-dark.{scss,css}
sudo cp gnome-shell.css /usr/share/themes/StarLabs/gnome-shell/
sudo cp gnome-shell-theme.gresource /usr/share/themes/StarLabs/gnome-shell
sudo cp assets/* /usr/share/themes/StarLabs/gnome-shell/assets/
sudo update-alternatives --remove gdm3.css /usr/share/themes/StarLabs/gnome-shell/gnome-shell.css

sudo update-alternatives --install /usr/share/gnome-shell/theme/gdm3.css gdm3.css /usr/share/themes/StarLabs/gnome-shell/gnome-shell.css 20


gsettings set org.gnome.shell.extensions.user-theme name 'Default'
gsettings set org.gnome.shell.extensions.user-theme name 'StarLabs'
