#!/bin/bash

stty -echo
printf "password: "
read password
stty echo

cat ./address.txt | while read line

do
ssh -t -t $line <<EOF
    cd chainpoint-node
    stty -echo
    echo "$password" | sudo -S make down; sudo git pull; sudo make up
    stty echo
    exit
EOF
done;
