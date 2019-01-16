
#!/bin/bash



cp src/gtk-3.20/gtk.css /usr/share/themes/StarLabs/gtk-3.20
cp -r src/gtk-3.20/assets /usr/share/themes/StarLabs/gtk-3.20/assets
cp src/gtk-3.0/gtk.css /usr/share/themes/StarLabs/gtk-3.0
cp -r src/gtk-3.0/assets /usr/share/themes/StarLabs/gtk-3.0/assets
cp src/gtk-2.0/*rc /usr/share/themes/StarLabs/gtk-2.0
cp -r src/gtk-2.0/assets /usr/share/themes/StarLabs/gtk-2.0

cp src/gtk-3.20/gtk-dark.css /usr/share/themes/StarLabs-Dark/gtk-3.20/gtk.css
cp -r src/gtk-3.20/assets /usr/share/themes/StarLabs-Dark/gtk-3.20/assets
cp src/gtk-3.0/gtk-dark.css /usr/share/themes/StarLabs-Dark/gtk-3.0/gtk.css
cp -r src/gtk-3.0/assets /usr/share/themes/StarLabs-Dark/gtk-3.0/assets
cp src/gtk-2.0/*rc /usr/share/themes/StarLabs-Dark/gtk-2.0
cp -r src/gtk-2.0/assets /usr/share/themes/StarLabs-Dark/gtk-2.0


cp src/gnome-shell/gnome-shell-theme.gresource /usr/share/themes/StarLabs/gnome-shell/
cp src/gnome-shell/gnome-shell.css /usr/share/themes/StarLabs/gnome-shell/
cp -r src/gnome-shell/assets /usr/share/themes/StarLabs/gnome-shell/assets

