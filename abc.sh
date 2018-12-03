#!/bin/bash
#ABC 
#[A]lready [B]een [C]ompromised
#Checking Script modified from https://medium.com/@monliclican/bash-one-liner-to-check-your-password-s-via-pwnedpasswords-coms-api-using-the-k-anonymity-method-a5807a9a8056
#Have a list of passwords and you want to check them against a breach dump but you don't want to share the full password with the api?  This is your tool.
# cat your list of passwords into to this script.  'Don't for get to chmod the script =) '
# example passwords | ./abc.sh
while read var
do
    sha1=$(echo -n $var | tr -d '\n' | sha1sum); echo "Hash prefix: ${sha1:0:5}" >> password_check_data; echo "Hash suffix: ${sha1:5:35}">> password_check_data; result=$(curl https://api.pwnedpasswords.com/range/${sha1:0:5} 2>/dev/null | grep $(echo ${sha1:5:35} | tr '[:lower:]' '[:upper:]')); printf "Your password appeared %d times in the database.\\n" "${result#*:}" 2>/dev/null >> password_check_data
    count=$(( $count+1 ))
    if [ "$count" = "1" ]; then
        count=0
        echo 'Wait'
        sleep .2500
    fi
done
cat password_check_data | awk '{line=line " " $0} NR%3==0{print substr(line,2); line=""}' >checked_passwords_breach_count.txt