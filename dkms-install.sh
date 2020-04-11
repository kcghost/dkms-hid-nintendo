#!/bin/bash

sudo dkms remove -m nintendo -v 1.0 --all
sudo mkdir -p /usr/src/nintendo-1.0/
sudo cp -rf * /usr/src/nintendo-1.0/
sudo dkms add -m nintendo -v 1.0
sudo dkms install -m nintendo -v 1.0

# TODO: hid-generic seems to overtake half the time, how to fix?
echo "Unplug Pro Controller if you haven't already."
sudo modprobe -r hid-nintendo
sudo modprobe hid-nintendo
sudo modprobe -r hid-generic
echo "Plug in Pro controller quickly before hid-generic comes back!"
