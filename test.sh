#!/bin/bash
ninja -C build/ reconfigure
ninja -C build
sudo ninja -C build uninstall
sudo ninja -C build install
