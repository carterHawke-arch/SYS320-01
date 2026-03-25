#!/bin/bash

file="/var/log/apache2/access.log"

function countCurl() {
	curl=$(cat $file | grep curl | cut -d" " -f1,12- | sort | uniq -c)
}

countCurl

echo "$curl"
