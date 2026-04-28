#! /bin/bash

authfile="/var/log/auth.log"

function getLogins(){
 logline=$(cat "$authfile" | grep "pam_unix" | grep "session opened")
 dateAndUser=$(echo "$logline" | cut -d' ' -f1,2,3,11)
 echo "$dateAndUser" 
}

function getFailedLogins(){
# Todo - 1
# a) Make a little research and experimentation to complete the function
# b) Generate failed logins and test
	logs=$(cat "$authfile" | grep "fail")
	dateAndUser=$(echo "$logs" | cut -d' ' -f1,2,3,9,11)
	echo "$dateAndUser"
}

# Sending logins as email - Do not forget to change email address
# to your own email address
echo "To: carter.hawke@mymail.champlain.edu" > emailform.txt
echo "Subject: Logins" >> emailform.txt
echo "" >> emailform.txt
getLogins >> emailform.txt
cat emailform.txt | ssmtp carter.hawke@mymail.champlain.edu

# Todo - 2
# Send failed logins as email to yourself.
# Similar to sending logins as email 
echo "To: carter.hawke@mymail.champlain.edu" > emailform.txt
echo "Subject: Failed Logins" >> emailform.txt
echo >> emailform.txt
getFailedLogins >> emailform.txt
cat emailform.txt | ssmtp carter.hawke@mymail.champlain.edu
