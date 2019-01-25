#!/bin/bash


# Standard Star Labs color scheme
blue1='#0068bf'
blue2='#2195f2'
blue3='#6ec5ff'

# Dark Star Labs color scheme
dark1='#322f30'
dark2='#4c4a4b'
dark3='#777575'

# Light Star Labs color scheme
light1='#b2b0b1'
light2='#dddbdb'
light3='#fffffe'

# Switch from standard to dark color scheme
cp cursors.svg cursors-dark.svg
sed -i "s/$blue1/$dark1/g" cursors-dark.svg
sed -i "s/$blue2/$dark2/g" cursors-dark.svg
sed -i "s/$blue3/$dark3/g" cursors-dark.svg

cp cursors.svg cursors-light.svg
sed -i "s/$blue1/$light1/g" cursors-light.svg
sed -i "s/$blue2/$light2/g" cursors-light.svg
sed -i "s/$blue3/$light3/g" cursors-light.svg
sed -i "s/#ffffff/#000000/g" cursors-light.svg
sed -i 's/pagecolor="#000000"/pagecolor="#ffffff"/g' cursors-light.svg
