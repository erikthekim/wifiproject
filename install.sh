#!/bin/bash
#  Install start code for wifi
# James Skon
# Copyright 2023
sudo mkdir -p startcloudwifi.sh /root/.scripts
sudo cp startcloudwifi.sh /root/.scripts
sudo cp cloudwifi.service /lib/systemd/system -v
sudo systemctl daemon-reload
sudo systemctl enable cloudwifi.service
