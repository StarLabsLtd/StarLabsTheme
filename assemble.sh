#!/bin/bash
original1=$(head -n 1 colors.list | cut -d ',' -f2)
original2=$(head -n 1 colors.list | cut -d ',' -f3)
original3=$(head -n 1 colors.list | cut -d ',' -f4)

loop=1
loops=$(wc -l colors.list | sed 's/colors.list//g')

function newColor() {
	sed -i "s/$original1/$color1/g" $1
	sed -i "s/$original2/$color2/g" $1
	sed -i "s/$original3/$color3/g" $1
}

function oldColor() {
	sed -i "s/$color1/$original1/g" $1
	sed -i "s/$color2/$original2/g" $1
	sed -i "s/$color3/$original3/g" $1
}
function renderIcon() {
	for svg in icons/fullcolor/*/*.svg; do
		type=$(echo $svg | cut -d '/' -f3)
		icon=$(echo $svg | cut -d '/' -f4)
		for size in 8; do
#		for size in 8 16 24 32 48 256; do
			for scale in @1x @2x; do
				factor=${scale#"@"}
				factor=${factor%"x"}
				scale=${scale#"@1x"}
				path=output/icons/"$1"/"$size"x"$size""$scale"/"$type"/
				mkdir -p "$path"
				dpi=$(( $size * $factor ))
				height=$(inkscape -H $svg | cut -d . -f1)
				width=$(inkscape -W $svg | cut -d . -f1)
				if [[ $height -gt $width ]]; then
					inkscape -z "$svg" -D -e "$path/${icon%svg}png" -h "$dpi" > /dev/null 2>&1
				else
					inkscape -z "$svg" -D -e "$path/${icon%svg}png" -w "$dpi" > /dev/null 2>&1
				fi
				height=$(identify -format "%h" "$path/${icon%svg}png")
				width=$(identify -format "%w" "$path/${icon%svg}png")
				if [[ $height -gt $width ]]; then
					convert "$path/${icon%svg}png" -background none -gravity center -extent "$height" "$path/${icon%svg}png" > /dev/null 2>&1
				elif [[ $height -lt $width ]]; then
					convert "$path/${icon%svg}png" -background none -gravity center -extent x"$width" "$path/${icon%svg}png" > /dev/null 2>&1
				fi
			done
		done
	done
	echo "[Icon Theme]" > $path/cursor.theme
	echo "Name=$1" >> $path/cursor.theme
	sed -i "/subdir/a '$1'," output/icons/meson.build


}
function shapetastic() {
for svg in icons/fullcolor/*/*.svg; do
		one=$(echo "StandardCircleSquircle" | sed "s/$1//g" | sed -e 's/\([A-Z][a-z]*\)/ &/g' | cut -d ' ' -f2)
		two=$(echo "StandardCircleSquircle" | sed "s/$1//g" | sed -e 's/\([A-Z][a-z]*\)/ &/g' | cut -d ' ' -f3)
		hide=$(echo "$one\\|$two")
		cat "$svg" | grep -n inkscape:label | grep "$hide" | cut -d \: -f1 | while read line; do
			for i in -1 1 2 3; do
				display=$(("$line" + "$i"))
				display="$display"s
				sed -i "$display/display:inline/display:none/" "$svg"
			done
		done
		cat "$svg" | grep -n inkscape:label | grep "$1" | cut -d \: -f1 | while read line; do
			for i in -1 1 2 3; do
				display=$(("$line" + "$i"))
				display="$display"s
				sed -i "$display/display:none/display:inline/" "$svg"
			done
		done
	done
}

function exportwallpaper() {
	inkscape -z backgrounds/StarWallpaper0.svg -D -e backgrounds/StarWallpaper0"$name".png > /dev/null 2>&1
	printf "<wallpaper deleted="\"false\"">\n<name>Star Labs Systems - NAME</name>\n<filename>/usr/share/backgrounds/StarLabs/WALLPAPER</filename>\n<options>zoom</options>\n<shade_type>solid</shade_type>\n<pcolor>#000000</pcolor>\n<scolor>#000000</scolor>\n<artist>StarLabs</artist>\n</wallpaper>\n" | sed "s/WALLPAPER/StarWallpaper0$name.png/g" | sed "s/NAME/$name/g" >> backgrounds/StarLabs.xml
	sed -i "/backgrounds_sources = \[/a 'StarWallpaper0$name.png'," backgrounds/meson.build
}

function creategtk() {
	cp -r "gtk/Template" "output/gtk/$theme"
	cp -r "gtk/Template-Dark" "output/gtk/$theme-Dark"
	sed -i "s/@VariantThemeName@/$theme/g" "output/gtk/$theme"/index.theme "output/gtk/$theme"/gtk-3.0/meson.build "output/gtk/$theme"/meson.build "output/gtk/$theme"/*/meson.build
	sed -i "s/@VariantThemeName@/$theme-Dark/g" "output/gtk/$theme"-Dark/index.theme "output/gtk/$theme"-Dark/meson.build "output/gtk/$theme"-Dark/*/meson.build
	sed -i "s/@LightThemeName@/$theme/g" "output/gtk/$theme"-Dark/gtk-3.0/meson.build
	sed -i "s/@ThemeName@/StarLabs/g" "output/gtk/$theme"/index.theme "output/gtk/$theme"-Dark/index.theme
	echo "subdir('$theme')" >> "output/gtk/meson.build"
	echo "subdir('$theme-Dark')" >> "output/gtk/meson.build"
}

function creategnome() {
	cp -r "gnome-shell/Template" "output/gnome-shell/$theme"
	cp -r "gnome-shell/Template" "output/gnome-shell/$theme-Light"
	sed -i 's/Dark/Light/g' "output/gnome-shell/$theme-Light/gnome-shell.scss"
	sed -i "s/@VariantThemeName@/$theme/g" "output/gnome-shell/$theme/meson.build"
	sed -i "s/@VariantThemeName@/$theme-Light/g" "output/gnome-shell/$theme-Light/meson.build"
	sed -i "s/@LightThemeName@/$theme/g" "output/gnome-shell/$theme-Light/meson.build"
	echo "subdir('$theme')" >> "output/gnome-shell/meson.build"
	echo "subdir('$theme-Light')" >> "output/gnome-shell/meson.build"
}

function createSession() {
	themelower=$(echo $theme | tr '[:upper:]' '[:lower:]')

	cp output/background/THEMENAME.desktop "output/background/$theme.desktop"
	sed -i "/install_dir: gnomeshell_mode_dir,/p $theme.desktop" output/background/meson.build
}

# rm -r output
while read palette ; do

	name=$(echo "${palette^}" | cut -d ',' -f1)
	color1=$(echo "$palette" | cut -d ',' -f2)
	color2=$(echo "$palette" | cut -d ',' -f3)
	color3=$(echo "$palette" | cut -d ',' -f4)
	theme=$(echo "StarLabs"-"$name" | sed 's/-Blue//g')
	echo -ne "\033[0KGenerating $theme $loop / $loops\\r"

	# Start Icons
#	mkdir -p output/icons
#	if [[ "$loop" == 1 ]]; then
#		printf "icon_dir = join_paths(get_option('prefix'), 'share/icons')\ninstall_subdir{\n" > output/icons/meson.build
#		printf "install_dir: icon_dir,\nstrip_directory: false,\n}" >> output/icons/meson.build
#	fi
#	newColor "icons/fullcolor/*/*.svg"
#	for shape in Squircle; do
#	for shape in Standard Circle Squircle; do
#		dir=$( echo "$theme"-"$shape" | sed 's/-Standard//g')
#		shapetastic "$shape"
#		renderIcon "$dir"
#		echo -ne "\033[0KGenerating $theme $loop / $loops for variant $shape\\r"
#	done
#	oldColor "icons/fullcolor/*/*.svg"
	# End Icons
	# Start Backgrounds
#	mkdir -p backgrounds/
	if [[ "$loop" == 1 ]]; then
		printf "backgrounds_dir = join_paths(get_option('datadir'), 'backgrounds')\ninstall_dir =join_paths(backgrounds_dir, meson.project_name())\nbackgrounds_sources = [\n]\ninstall_data(backgrounds_sources,\ninstall_dir: install_dir)\nxml_dir = join_paths(get_option('datadir'), 'gnome-background-properties')\nxml_sources = [\n'StarLabs.xml',\n]\ninstall_data(xml_sources, install_dir: xml_dir)" > "backgrounds/meson.build"
		cat "backgrounds/master.xml" > "backgrounds/StarLabs.xml"
	fi
	newColor backgrounds/StarWallpaper0.svg
	exportwallpaper
	oldColor backgrounds/StarWallpaper0.svg
	if [[ "$loop" -eq "$loops" ]]; then
#		cp backgrounds/originalbackgrounds/* output/backgrounds/
		for i in 1 2 3 4 5 6 7 8 9 10 11 12; do
			sed -i "/backgrounds_sources = \[/a 'StarWallpaper$i.jpg'," backgrounds/meson.build
		done
		sed -i "/backgrounds_sources = \[/a 'StarWallpaper0.png'," backgrounds/meson.build
		echo "</wallpapers>" >> "backgrounds/StarLabs.xml"
	fi
	# End Backgrounds
	# Start GTK
#	mkdir -p output/gtk
#	if [[ "$loop" == 1 ]]; then
#		cp -r gtk/Master output/gtk/Master
#	fi
#	creategtk
#	newColor "output/gtk/$theme/gtk-3.0/gtk.scss"
#	newColor "output/gtk/$theme/gtk-3.0/gtk-dark.scss"
	# End GTK
	# Start Gnome
#	mkdir -p output/gnome-shell
#	if [[ "$loop" == 1 ]]; then
#		cp -r gnome-shell/Master output/gnome-shell/Master
#	fi
#	creategnome
#	newColor "output/gnome-shell/$theme/gnome-shell.scss"
	# End Gnome
	# Start Font
#	cp -r font/ output/font/
	# End Font
	# Start Sessions
#	cp -r sessions/ output/sessions/
	# End Sessions
	# Start Sounds
#	cp -r sounds/ output/sounds/
	# End Sounds
	# Start Extensions
#	cp -r extensions/ output/extensions/
	# End Extensions


	loop=$(( $loop + 1 ))
done < colors.list
