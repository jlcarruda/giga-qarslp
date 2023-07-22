#!/usr/bin/env bash

xrandr --output $(xrandr | grep "connected primary" | awk '{print $1}') --mode 1920x1080 -r 60
