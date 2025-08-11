#!/bin/bash
# 0-login.sh


if [ $EUID -ne 0]; then
	echo "Please run as root or with sudo."
 	 exit 1
fi

last -n 5
