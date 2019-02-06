#!/bin/bash
path=../../../StarLabs
rm -r ../StarLabs/[0-9]*
rm -r ../StarLabs/scalable
cd fullcolor
for d in apps; do
#categories devices emblems mimetypes places status
	cd $d
	for f in *.svg; do
		for s in 256 48 32 24 16 8; do
			mkdir -p $path/"$s"x"$s"
			mkdir -p $path/"$s"x"$s"@2x
			mkdir -p $path/"$s"x"$s"/$d
			mkdir -p $path/"$s"x"$s"@2x/$d

			inkscape -z $f -e $path/"$s"x"$s"/$d/${f%svg}png -w $s -h $s
			inkscape -z $f -e $path/"$s"x"$s"@2x/$d/${f%svg}png -w $(($s * 2)) -h $(($s * 2))
		done
	done
	cd ..
done
cd ..

cp scalable ../../StarLabs
cd symlinks
	./generate-symlinks.sh
cd ..

find -L ../StarLabs/*x*/*/. -name . -o -type d -prune -o -type l -exec rm {} +
