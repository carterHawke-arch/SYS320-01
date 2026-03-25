ip addr | grep 'scope global' | awk '{print $2}' | sed 's/\/24//'
