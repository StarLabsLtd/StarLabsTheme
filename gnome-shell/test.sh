#!/bin/bash
sassc gnome-shell.scss gnome-shell.css
glib-compile-resources gnome-shell-theme.gresource.xml
sudo cp gnome-shell.css /usr/share/themes/Laboratory/gnome-shell/gnome-shell.css
sudo cp gnome-shell-theme.gresource /usr/share/themes/Laboratory/gnome-shell/gnome-shell-theme.gresource
