#!/bin/bash

logpath="/home/carter/Desktop/SYS320-01/week15/fileaccesslog.txt"
emailform="/home/carter/Desktop/SYS320-01/week15/emailform.txt"

echo "File was accessed $(date)" >> "$logpath"

echo "To: carter.hawke@mymail.champlain.edu" > "$emailform"
echo "Subject: Access" >> "$emailform"
echo "" >> "$emailform"
echo >> "$emailform"
cat "$logpath" | awk '{gsub(/:/, "-", $5); print $4, $5, $6, $7, $8}' >> "$emailform"

cat "$emailform" | /usr/sbin/ssmtp carter.hawke@mymail.champlain.edu
