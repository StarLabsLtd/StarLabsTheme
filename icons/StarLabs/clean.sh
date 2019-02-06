#!/bin/bash
find -L */*/. -name . -o -type d -prune -o -type l -exec rm {} +

