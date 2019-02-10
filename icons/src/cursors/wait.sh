#!/bin/bash
RAWSVG="src/cursors.svg"
DIR2X="build/x2"
OUTPUT="../../../plymouth/loading"
for i in 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24
do
	echo -ne "\033[0KGenerating animated cursor pixmaps... $i / 24 \\r"

#	if [ "$DIR2X/wait-$i.png" -ot $RAWSVG ] ; then
		inkscape -i wait-$i -d 360 -f $RAWSVG -e "$OUTPUT/loading-$i.png" > /dev/null
#	fi
done
echo -e "\033[0KGenerating animated cursor pixmaps... DONE"

