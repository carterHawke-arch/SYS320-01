#!/bin/bash

url="http://10.0.17.6/Assignment.html"
page=$(curl -s "$url")


dates=$(xmlstarlet format --html --recover 2>/dev/null <<< "$page" | xmlstarlet sel -T -t \
	-m "(//table)[1]//tr[position()>1]" \
	-v "normalize-space(td[2])" -n)


temps=$(xmlstarlet format --html --recover 2>/dev/null <<< "$page" | xmlstarlet sel -T -t \
	-m "(//table)[1]//tr[position()>1]" \
	-v "normalize-space(td[1])" -n)


pressures=$(xmlstarlet format --html --recover 2>/dev/null <<< "$page" | xmlstarlet sel -T -t \
	-m "(//table)[2]//tr[position()>1]" \
	-v "normalize-space(td[1])" -n)


count=$(echo "$dates" | wc -l)

for (( i=1; i<count; i++ )); do
	date=$(echo "$dates" | head -n $i | tail -n 1)
	temp=$(echo "$temps" | head -n $i | tail -n 1)
	press=$(echo "$pressures" | head -n $i | tail -n 1)
	echo "$date $temp $press"
done

