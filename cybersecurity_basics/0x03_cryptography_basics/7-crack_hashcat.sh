#!/bin/bash
hashcat -m 0 --show $1 | cut -d: -f2 | grep -v "^$"
