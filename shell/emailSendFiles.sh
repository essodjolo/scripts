#!/bin/bash 

#Parameters
from="" 
to="" 
cc=""

smtp=A.B.C.D
subject="" 
message=""

#Directory container reporting files to be sent
source_dir='/my/dir/export'
pattern='*.xls'

already_sent_dir='/dir/alreadySent'


# sendEmail from https://github.com/mogaal/sendemail

sendViaMail(){
#$1 Email sender
#$2 Email receiver
#$3 Email cc 
#$4 SMTP server 
#$5 Subject 
#$6 Message 
#$7 Attachement
/usr/local/bin/sendEmail -f $1 -t $2 -cc $3 -s $4 -u $5 -m $6 -a $7
}

# Send the 
for i in `ls -t $source_dir/$pattern` 
do
	if [ -f "$i" ]
	then
	  sendViaMail $from $to $cc $smtp "$subject" "$message" "$i"
	  # $i = absolute path of the file to be moved
	  mv "$i" "$already_sent_dir"
	fi 
done

