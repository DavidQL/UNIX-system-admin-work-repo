#!/bin/sh

percentage_utilized=$(df -h | sed -n 2p | cut -d' ' -f9 | cut -d% -f1)
email_body_string="Utilization is at $percentage_utilized%"
touch email_body_file.txt
echo $email_body_string > email_body_file.txt
if [ $percentage_utilized -gt 79 ] 
then 
	echo "Mailing admin"
	mail -s “Utilization is high” root < email_body_file.txt
else
	echo "Utilization acceptable"
fi
