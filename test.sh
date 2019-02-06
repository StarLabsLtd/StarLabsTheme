#!/bin/bash
ninja -C build/ reconfigure
ninja -C build
# sudo rm -r /usr/share/icons/StarLabs
sudo ninja -C build install
