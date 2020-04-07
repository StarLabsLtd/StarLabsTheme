#!/bin/bash
cp yaru/gtk/src/default/gtk-3.20/_apps.scss ../gtk/Master/gtk-3.0/_apps.scss
sed -i 's/ubuntu-colors/starlabs/g' ../gtk/Master/gtk-3.0/_apps.scss
cp yaru/gtk/src/default/gtk-3.20/_colors.scss ../gtk/Master/gtk-3.0/_colors.scss
sed -i 's/ubuntu-colors/starlabs/g' ../gtk/Master/gtk-3.0/_colors.scss

cp yaru/gnome-shell/src/gnome-shell-sass/_colors.scss ../gnome-shell/Master/gnome-shell-sass/_colors.scss
sed -i 's/ubuntu-colors/starlabs/g' ../gnome-shell/Master/gnome-shell-sass/_colors.scss

