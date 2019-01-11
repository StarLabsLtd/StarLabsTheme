#!/bin/bash

cd upstream/yaru
git pull
cd ../..

# GNOME SHELL
cp -r upstream/yaru/gnome-shell/src/* src/gnome-shell
mv src/gnome-shell/*.svg src/gnome-shell/assets

# GTK
cp -r upstream/yaru/gtk/src/light/* src/

# Change Ubuntu Colors
sed -i 's/ubuntu-colors/starlabs-colors/g' src/gnome-shell/gnome-shell-sass/_colors.scss src/gtk-3.0/_colors.scss src/gtk-3.20/_colors.scss
sed -i 's/orange/blue0/g' src/gnome-shell/gnome-shell-sass/_colors.scss src/gtk-3.0/_colors.scss src/gtk-3.20/_colors.scss

sed -i 's/font-family: Ubuntu/font-family: Star Labs/g' src/gnome-shell/gnome-shell-sass/_common.scss
sed -i 's/#2C001E/#0d1f2d/g' src/gnome-shell/gnome-shell-sass/_common.scss
# EXPERIMENTAL
sed -i 's/#2e3436/#0d1f3d/g' src/gnome-shell/gnome-shell-sass/_common.scss
sed -i 's/#666666/#0d1f2d/g' src/gnome-shell/gnome-shell-sass/_common.scss
sed -i 's/#3D3D3D/#0d1f2d/g' src/gnome-shell/gnome-shell-sass/_common.scss
sed -i 's/#5D5D5D/#0d1f2d/g' src/gnome-shell/gnome-shell-sass/_common.scss
sed -i 's/#252525/#0d1f2d/g' src/gnome-shell/gnome-shell-sass/_colors.scss
sed -i 's/#2e3436/#0d1f2d/g' src/gnome-shell/gnome-shell-sass/_dock.scss
sed -i 's/#0f2435/#0d1f2d/g' src/gnome-shell/gnome-shell-sass/_common.scss
# Create CSS
sassc src/gnome-shell/gnome-shell.{scss,css}
sassc src/gtk-3.0/gtk.{scss,css}
sassc src/gtk-3.0/gtk-dark.{scss,css}

sassc src/gtk-3.20/gtk.{scss,css}
sassc src/gtk-3.20/gtk-dark.{scss,css}

glib-compile-resources src/gnome-shell/gnome-shell-theme.gresource.xml

