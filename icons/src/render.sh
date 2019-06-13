#!/bin/bash
p=../../../

# Theme Selection
clear
echo '  _____ _             _           _'
echo ' /  ___| |           | |         | |'
echo ' \ `--.| |_ __ _ _ __| |     __ _| |__  ___'
echo '  `--. \ __/ _` | '"'"'__| |    / _` | '"'"'_ \/ __|'
echo ' /\__/ / || (_| | |  | |___| (_| | |_) \__ \'
echo ' \____/ \__\__,_|_|  \_____/\__,_|_.__/|___/'
echo
echo '*************** Icon Renderer **************'
echo
echo "Which themes would you like to render?"
select theme in "All" "StarLabs" "StarLabs-Circle" "StarLabs-Squircle"
do
	if [[ $theme == "All" ]]; then
		theme="StarLabs StarLabs-Circle StarLabs-Squircle"
	fi
	echo $theme
	break
done

# Type Selection
clear
echo '  _____ _             _           _'
echo ' /  ___| |           | |         | |'
echo ' \ `--.| |_ __ _ _ __| |     __ _| |__  ___'
echo '  `--. \ __/ _` | '"'"'__| |    / _` | '"'"'_ \/ __|'
echo ' /\__/ / || (_| | |  | |___| (_| | |_) \__ \'
echo ' \____/ \__\__,_|_|  \_____/\__,_|_.__/|___/'
echo
echo '*************** Icon Renderer **************'
echo
echo "Which icon types would you like to render?"
select type in "All" "apps" "places" "mimetypes" "categories" "devices" "emblems" "status"
	do
		if [[ $type == "All" ]]; then
			type="apps places mimetypes categories devices emblems status"
		fi
		echo $type
	break
done



for v in $theme; do
	clear
	echo '  _____ _             _           _'
	echo ' /  ___| |           | |         | |'
	echo ' \ `--.| |_ __ _ _ __| |     __ _| |__  ___'
	echo '  `--. \ __/ _` | '"'"'__| |    / _` | '"'"'_ \/ __|'
	echo ' /\__/ / || (_| | |  | |___| (_| | |_) \__ \'
	echo ' \____/ \__\__,_|_|  \_____/\__,_|_.__/|___/'
	echo
	echo '*************** Icon Renderer **************'
	echo
	echo "Rendering: $type"
	echo "Theme: $theme"
	echo
	rm -r ../"$v"/scalable
	rm -r ../"$v"/scalable-max-32
	cp index.theme ../"$v"
	cp -r scalable ../"$v"
	cp -r scalable-max-32 ../"$v"

	for d in $type; do
		rm -r ../"$theme"/*x*/"$type"
		cd fullcolor/$d
		for f in *.svg; do
			clear
			echo '  _____ _             _           _'
			echo ' /  ___| |           | |         | |'
			echo ' \ `--.| |_ __ _ _ __| |     __ _| |__  ___'
			echo '  `--. \ __/ _` | '"'"'__| |    / _` | '"'"'_ \/ __|'
			echo ' /\__/ / || (_| | |  | |___| (_| | |_) \__ \'
			echo ' \____/ \__\__,_|_|  \_____/\__,_|_.__/|___/'
			echo
			echo '*************** Icon Renderer **************'
			echo "Rendering: $type"
			echo "Theme: $theme"
			echo
			echo "Current Theme: $v"
			echo "Current Type: $d"
			echo "Current Icon: $f"
			echo
			# Display relevant layer
			# Show all Circle layers
			if [[ $v == StarLabs ]]; then
				cat $f | grep -n inkscape:label | grep 'Circle\|Squircle' | cut -d \: -f1 | while read line; do
					display=$(($line + 1))
					display="$display"s
					sed -i "$display/display:inline/display:none/" $f
				done
				cat $f | grep -n inkscape:label | grep 'Standard' | cut -d \: -f1 | while read line; do
					display=$(($line + 1))
					display="$display"s
					sed -i "$display/display:none/display:inline/" $f
				done
			# Show all Circle layers
			elif [[ $v == StarLabs-Circle ]]; then
				cat $f | grep -n inkscape:label | grep 'Squircle\|Standard' | cut -d \: -f1 | while read line; do
					display=$(($line + 1))
					display="$display"s
					sed -i "$display/display:inline/display:none/" $f
				done
				cat $f | grep -n inkscape:label | grep 'Circle' | cut -d \: -f1 | while read line; do
					display=$(($line + 1))
					display="$display"s
					sed -i "$display/display:none/display:inline/" $f
				done
			# Show all Squircle layers
			elif [[ $v == StarLabs-Squircle ]]; then
				cat $f | grep -n inkscape:label | grep 'Standard\|Circle' | cut -d \: -f1 | while read line; do
					display=$(($line + 1))
					display="$display"s
					sed -i "$display/display:inline/display:none/" $f
				done
				cat $f | grep -n inkscape:label | grep 'Squircle' | cut -d \: -f1 | while read line; do
					display=$(($line + 1))
					display="$display"s
					sed -i "$display/display:none/display:inline/" $f
				done
			fi

			for s in 256 48 32 24 16 8; do
				echo -ne "Rendering at $s....."
				mkdir -p $p$v/"$s"x"$s"
				mkdir -p $p$v/"$s"x"$s"@2x
				mkdir -p $p$v/"$s"x"$s"/$d
				mkdir -p $p$v/"$s"x"$s"@2x/$d
				if [[ $v == StarLabs ]]; then
					H=$(inkscape -H $f | cut -d . -f1)
					W=$(inkscape -W $f | cut -d . -f1)
					if [[ $H -gt $W ]]; then
						inkscape -z $f -D -e $p$v/"$s"x"$s"/$d/${f%svg}png -h $s > /dev/null 2>&1
						inkscape -z $f -D -e $p$v/"$s"x"$s"@2x/$d/${f%svg}png -h $(($s * 2)) > /dev/null 2>&1
					else
						inkscape -z $f -D -e $p$v/"$s"x"$s"/$d/${f%svg}png -w $s > /dev/null 2>&1
						inkscape -z $f -D -e $p$v/"$s"x"$s"@2x/$d/${f%svg}png -w $(($s * 2)) > /dev/null 2>&1
					fi

					P=$(echo "$f" | sed 's/.svg/.png/g')
					PH=$(identify -format "%h" $p$v/"$s"x"$s"/$d/$P)
					PW=$(identify -format "%w" $p$v/"$s"x"$s"/$d/$P)
					TP=$(echo "$P" | sed 's/.png/.tmp.png/g')
					if [[ $PH -gt $PW ]]; then
						mv $p$v/"$s"x"$s"/$d/$P $p$v/"$s"x"$s"/$d/${P%png}tmp.png
						convert $p$v/"$s"x"$s"/$d/$TP -background none -gravity center -extent "$PH" $p$v/"$s"x"$s"/$d/$P > /dev/null 2>&1
						rm $p$v/"$s"x"$s"/$d/$TP
					elif [[ $PH -lt $PW ]]; then
						mv $p$v/"$s"x"$s"/$d/$P $p$v/"$s"x"$s"/$d/${P%png}tmp.png
						convert $p$v/"$s"x"$s"/$d/$TP -background none -gravity center -extent x"$PW" $p$v/"$s"x"$s"/$d/$P > /dev/null 2>&1
						rm $p$v/"$s"x"$s"/$d/$TP
					fi

				else
					inkscape -z $f -e $p$v/"$s"x"$s"/$d/${f%svg}png -w $s -h $s > /dev/null 2>&1
					inkscape -z $f -e $p$v/"$s"x"$s"@2x/$d/${f%svg}png -w $(($s * 2)) -h $(($s * 2)) > /dev/null 2>&1
				fi
				echo "Done"
			done
		done
		cd ..
	done
	cd ..
	clear
	echo '  _____ _             _           _'
	echo ' /  ___| |           | |         | |'
	echo ' \ `--.| |_ __ _ _ __| |     __ _| |__  ___'
	echo '  `--. \ __/ _` | '"'"'__| |    / _` | '"'"'_ \/ __|'
	echo ' /\__/ / || (_| | |  | |___| (_| | |_) \__ \'
	echo ' \____/ \__\__,_|_|  \_____/\__,_|_.__/|___/'
	echo
	echo '*************** Icon Renderer **************'
	echo
	echo "Rendering: $type"
	echo "Theme: $theme"
	echo
	echo "Current Theme: $v"
	echo
	cd symlinks
		echo -ne "Generating symlinks....."
		./generate-symlinks.sh $v  > /dev/null 2>&1
		echo "Done"
	cd ..
	find -L ../$v/*x*/*/. -name . -o -type d -prune -o -type l -exec rm {} +
	echo -ne "Creating unique app grids....."
	if [[ $v == StarLabs-Circle ]]; then
		cp circle-view-app-grid-symbolic.svg ../StarLabs-Circle/scalable/actions/view-app-grid-symbolic.svg
	elif [[ $v == StarLabs-Squircle ]]; then
		cp squircle-view-app-grid-symbolic.svg ../StarLabs-Squircle/scalable/actions/view-app-grid-symbolic.svg
	fi
	echo "Done"
	echo
	echo "Which you like to upload the rendered icons to GitHub?"
	select upload in "Yes" "No"
	do
	        if [[ $upload == "Yes" ]]; then
	                git add ../StarLabs ../StarLabs-Circle ../StarLabs-Circle
			git commit -m "Rendered"
			git push
	        fi
	        break
	done
done
