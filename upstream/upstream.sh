#!/bin/bash
rm -r yaru-theme-*
apt-get source yaru-theme

gtk_src=yaru-theme-20.04.4/gtk/src/default/gtk-3.20
gnome_src=yaru-theme-20.04.4/gnome-shell/src/gnome-shell-sass

gtk_dest=../gtk/Master/gtk-3.0
gnome_dest=../gnome-shell/Master/gnome-shell-sass

declare -a gtk_files=("_colors-public.scss" "_common.scss" "_drawing.scss" "_headerbar.scss" "_tweaks.scss" "_colors.scss")

for f in "${gtk_files[@]}"; do
	rm "$gtk_dest"/"$f" && \
	cp "$gtk_src"/"$f" "$gtk_dest"/"$f" && \
	sed -i 's/ubuntu-colors/starlabs/g' "$gtk_dest"/"$f";
done



declare -a gnome_files=("_common.scss" "_dock.scss" "_drawing.scss" "_widgets.scss" "_colors.scss" "widgets")
for f in "${gnome_files[@]}"; do
        rm -r "$gnome_dest"/"$f"
        cp -r "$gnome_src"/"$f" "$gnome_dest"/"$f"
        sed -i 's/ubuntu-colors/starlabs/g' "$gnome_dest"/"$f"
done
