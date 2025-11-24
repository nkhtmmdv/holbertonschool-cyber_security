#!/bin/bash
ATTACKER=$(awk '{print $1}' logs.txt | sort | uniq -c | sort -nr | head -1 | awk '{print $2}')
grep "^$ATTACKER " logs.txt | awk -F'"' '{print $6}' | head -1
