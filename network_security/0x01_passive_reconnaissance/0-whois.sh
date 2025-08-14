#!/bin/bash
whois $1 | grep -E '^(Registrant|Admin|Tech)' | sed 's/^[ \t]*//; s/[ \t]*$//' | sed 's/:/,/' > $1.csv
