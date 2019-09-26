#!/bin/bash
mkdir -p boot
for i in 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24; do
	inkscape -i wait-"$i" -d 180 -f cursors.svg -e "boot/animation-00$i.png"
done
