#!/bin/bash

sizes=(16 24 32 48 64 256)
folders=("apps_Applications" "categories_Categories" "emblems_Emblems" "mimetypes_Mimetypes" "places_Places" "status_Status")

cp index.theme.in.source index.theme.in

for dpi in "${sizes[@]}"; do
  for folder in "${folders[@]}"; do
    dir=$(echo $folder | cut -d '_' -f1)
    name=$(echo $folder | cut -d '_' -f2)
    index=$index$dpi/$dir","
    echo "[$dpi/$dir]" >> index.theme.in
    echo "Context=$name" >> index.theme.in
    echo "Size=$dpi" >> index.theme.in
    echo "Type=Fixed" >> index.theme.in
    echo "" >> index.theme.in
  done
done

sed -i "s#Directories=#Directories=$index#" index.theme.in
