#!/bin/bash

for n in $(xinput list |grep "Microsoft Microsoft" |sed -e 's/^.*id=\([0-9]*.\).*$/\1/')
do
    echo "Found device: $n"

    xinput set-prop $n "libinput Natural Scrolling Enabled" 1
done

for n in $(xinput list |grep "Ultrathin Touch Mouse" |sed -e 's/^.*id=\([0-9]*.\).*$/\1/')
do
    echo "Found device: $n"

    xinput set-prop $n "libinput Natural Scrolling Enabled" 1
done

for n in $(xinput list |grep "Lenovo ThinkPad Compact USB Keyboard with TrackPoint"|sed -e 's/^.*id=\([0-9]*.\).*$/\1/')
do
    echo "Found device: $n"

    xinput set-prop $n "libinput Natural Scrolling Enabled" 1
done