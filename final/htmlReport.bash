#!/bin/bash

report="report.txt"
output="/var/www/html/report.html"

cat << EOF > "$output"
<html><body>
<h2>Access logs with IOC indicators:</h2>
<table border='1'>
<tr><th>IP</th><th>Date/Time</th><th>Page</th></tr>
EOF

while read -r ip datetime page; do
    printf "<tr><td>%s</td><td>%s</td><td>%s</td></tr>\n" "$ip" "$datetime" "$page" >> "$output"
done < "$report"

printf "</table></body></html>\n" >> "$output"

echo "Report available at http://localhost/report.html"
