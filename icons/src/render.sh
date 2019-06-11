#!/bin/bash
p=../../../

for v in StarLabs StarLabs-Circle StarLabs-Squircle; do

	rm -r ../"$v"/*x*
	rm -r ../"$v"/scalable
	rm -r ../"$v"/scalable-max-32
	cp index.theme ../"$v"
	cp -r scalable ../"$v"
	cp -r scalable-max-32 ../"$v"

	cd fullcolor
	for d in apps places mimetypes categories devices emblems status; do
		cd $d
		for f in *.svg; do
			# Display relevant layer
			# Show Standard Layers
                        cat $f | grep -n inkscape:label | grep 'Standard' | cut -d \: -f1 | while read line; do
                                display=$(($line + 1))
                                display="$display"s
                                sed -i "$display/display:none/display:inline/" $f
                        done
			# Hide layers that match Circle or Squircle
			cat $f | grep -n inkscape:label | grep 'Circle\|Squircle' | cut -d \: -f1 | while read line; do
				display=$(($line + 1))
				display="$display"s
				sed -i "$display/display:inline/display:none/" $f
			done
			# Show all Circle layers
			if [[ $v == StarLabs-Circle ]]; then
                                cat $f | grep -n inkscape:label | grep 'Standard' | cut -d \: -f1 | while read line; do
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
				cat $f | grep -n inkscape:label | grep 'Squircle' | cut -d \: -f1 | while read line; do
					display=$(($line + 1))
					display="$display"s
					sed -i "$display/display:none/display:inline/" $f
				done
			fi

			for s in 256 48 32 24 16 8; do
				mkdir -p $p$v/"$s"x"$s"
				mkdir -p $p$v/"$s"x"$s"@2x
				mkdir -p $p$v/"$s"x"$s"/$d
				mkdir -p $p$v/"$s"x"$s"@2x/$d
					if [[ $v == StarLabs ]]; then
						H=$(inkscape -H $f)
						W=$(inkscape -W $f)
						if [[ $h -ge $w ]]; then
							inkscape -z $f -D -e $p$v/"$s"x"$s"/$d/${f%svg}png -h $s
                                                        inkscape -z $f -D -e $p$v/"$s"x"$s"@2x/$d/${f%svg}png -h $(($s * 2))
						else
                                                        inkscape -z $f -D -e $p$v/"$s"x"$s"/$d/${f%svg}png -w $s
                                                        inkscape -z $f -D -e $p$v/"$s"x"$s"@2x/$d/${f%svg}png -w $(($s * 2))
						fi

						P=$(echo "$f" | sed 's/.svg/.png/g')
						PH=$(identify -format "%h" $p$v/"$s"x"$s"/$d/$P)
						PW=$(identify -format "%w" $p$v/"$s"x"$s"/$d/$P)
						TP=$(echo "$P" | sed 's/.png/.tmp.png/g')
						if [[ $PH -gt $PW ]]; then
							mv $p$v/"$s"x"$s"/$d/$P $p$v/"$s"x"$s"/$d/${P%png}tmp.png
							convert $p$v/"$s"x"$s"/$d/$TP -background none -gravity center -extent "$PH" $p$v/"$s"x"$s"/$d/$P
							rm $p$v/"$s"x"$s"/$d/$TP
						elif [[ $PH -lt $PW ]]; then
							mv $p$v/"$s"x"$s"/$d/$P $p$v/"$s"x"$s"/$d/${P%png}tmp.png
							convert $p$v/"$s"x"$s"/$d/$TP -background none -gravity center -extent x"$PW" $p$v/"$s"x"$s"/$d/$P
							rm $p$v/"$s"x"$s"/$d/$TP
						fi

					else
						inkscape -z $f -e $p$v/"$s"x"$s"/$d/${f%svg}png -w $s -h $s
						inkscape -z $f -e $p$v/"$s"x"$s"@2x/$d/${f%svg}png -w $(($s * 2)) -h $(($s * 2))
					fi
			done
		done
		cd ..
	done
	cd ..

	cd symlinks


		./generate-symlinks.sh $v





	cd ..


	find -L ../$v/*x*/*/. -name . -o -type d -prune -o -type l -exec rm {} +
done
