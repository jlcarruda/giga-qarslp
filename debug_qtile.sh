#!/usr/bin/env bash

cat ./dotfiles/.xinitrc > /tmp/.start_qtile; xinit /tmp/.start_qtile -- :2
