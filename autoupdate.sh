#!/bin/bash

# sudo用のパスワードを入力から取得し、passwordという変数に格納する。

stty -echo
printf "password: "
read password
stty echo

# address.txtから接続先を取得し、whileで回す。

cat ./address.txt | while read line

# sshで接続先に接続後、sudoにpasswordを渡してアップデートを実行する。

do
ssh $line bash <<EOF
    cd chainpoint-node    # 移動先を自分の状況に合わせて変更してください。
    stty -echo
    echo "$password" | sudo -S make down; sudo git pull; sudo make up
    stty echo
    exit
EOF
done;

# 以上で<<EOF~EOF内のスクリプトが全ての接続先で実行される。
# EOF内を書き換えれば、書き換えた内容を全ての接続先で実行することが可能。
