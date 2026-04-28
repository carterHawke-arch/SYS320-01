#!/bin/bash

logfile=$1
iocfile=$2

> report.txt

while read -r ioc; do
    grep -F "$ioc" "$logfile" | awk '{print $1, $4, $7}' | tr -d '[' >> report.txt
done < "$iocfile"

cat report.txt
