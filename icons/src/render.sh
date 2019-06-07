#!/bin/bash
p=../../../

for v in StarLabs StarLabs-Circle StarLabs-Squircle
	rm -r ../$v/[0-9]*
	rm -r ../$v/scalable
	cp -r scalable ../$v
	rm -r ../$v/scalable-max-32
	cp -r scalable-max-32 ../$v
	cd fullcolor
	for d in apps places mimetypes categories devices emblems status; do
		cd $d
		for f in *.svg; do
			# Display relevant layer
			# Hide layers that match Circle or Squircle
			cat $f | grep -n inkscape:label | grep 'Circle\|Squircle' | cut -d \: -f1 | while read line; do
                                display=$(($line + 1))
                                display="$display"s
                        	sed -i "$display/display:inline/display:none/" $f
                        done
			# Show all Circle layers
			if [[ $v == StarLabs-Circle ]]; then
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
						inkscape -z $f -D -e $p$v/"$s"x"$s"/$d/${f%svg}png -w $s -h $s
						inkscape -z $f -D -e $p$v/"$s"x"$s"@2x/$d/${f%svg}png -w $(($s * 2)) -h $(($s * 2))
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
