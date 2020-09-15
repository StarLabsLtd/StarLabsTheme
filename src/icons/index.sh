#!/bin/bash
sizes=(24 48 96 16 32 64 128 256 512)
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
    if [[ "$dpi" -ne 24 ]] ||  [[ "$dpi" -ne 16 ]]; then
      scaled=$(expr $dpi / 2)
      echo "[$scaled/$dir]" >> index.theme.in
      echo "Context=$name" >> index.theme.in
      echo "Scale=2" >> index.theme.in
      echo "Size=$dpi" >> index.theme.in
      echo "" >> index.theme.in
    fi

  done
done

sed -i "s#Directories=#Directories=$index#" index.theme.in
