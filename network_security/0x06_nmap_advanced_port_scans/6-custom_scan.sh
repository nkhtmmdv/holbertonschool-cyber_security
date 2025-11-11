#!/bin/bash
sudo nmap -sS -p $2 --scanflags 255 $1 -oN custom_scan.txt >/dev/null 2>&1
