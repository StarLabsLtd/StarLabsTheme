#!/bin/bash
sassc gnome-shell.{scss,css}
# sassc gnome-shell-dark.{scss,css}
sudo cp gnome-shell.css /usr/share/themes/StarLabs/gnome-shell/
gsettings set org.gnome.shell.extensions.user-theme name 'Plane-1.8'
gsettings set org.gnome.shell.extensions.user-theme name 'StarLabs'

