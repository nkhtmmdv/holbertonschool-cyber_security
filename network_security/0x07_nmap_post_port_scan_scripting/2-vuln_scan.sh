#!/bin/bash
nmap -p80,443 --script http-vuln-cve2017-5638 $1 | tee vuln_scan_results.txt
