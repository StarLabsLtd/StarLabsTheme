#!/bin/bash
sassc gtk.{scss,css}
# sassc gnome-shell-dark.{scss,css}
sudo cp gtk.css /usr/share/themes/StarLabs/gtk-3.20/
gsettings set org.gnome.desktop.interface gtk-theme 'Plane-1.8'
gsettings set org.gnome.desktop.interface gtk-theme 'StarLabs'


# gsettings set org.gnome.shell.extensions.user-theme name 'Plane-1.8'
# gsettings set org.gnome.shell.extensions.user-theme name 'StarLabs'
