#!/bin/bash
sudo nmap --script vulners -p80,443 "$1"
