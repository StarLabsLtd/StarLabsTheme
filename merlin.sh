#!/bin/bash
theme=StarLabs
echo $1
for list in icons/src/lists/*/*;do
	while read ALIAS ; do
		variant=$(echo "$list" | cut -d '/' -f4)
		type=$(echo "$list" | cut -d '/' -f5| cut -d '.' -f1)
		FROM=${ALIAS% *}
		TO=${ALIAS#* }
		if [ -e "icons/$1/$path/$sub/$FROM" ]; then
			continue
		fi
		if [[ "$variant" == 'fullcolor' ]]; then
			for size in 8 16 24 32 48 256; do
				for scale in @1x @2x; do
					scale=${scale#"@1x"}
					path=icons/"$1"/"$size"x"$size""$scale"/"$type"
					ln -s "$TO" "$path/$FROM"
				done
			done
		elif [[ "$path" == 'scalable' ]]; then
			ln -s "$TO" "icons/$1/scalable/$FROM"
		fi
	done < "$list"
done

