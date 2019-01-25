#!/bin/bash
sudo rm -r build
meson build
ninja -C build
sudo ninja -C build install
