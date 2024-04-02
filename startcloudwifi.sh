#!/usr/bin/env bash

if [ ${EUID} -ne 0 ]
then
	exit 1 # this is meant to be run as root
fi

cd /home/kenyon/wificlient 

ruby wifi_state_machine.rb &
