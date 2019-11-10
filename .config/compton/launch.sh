#!/usr/bin/env bash

killall -q compton
compton --config $HOME/.config/compton/compton.conf &
