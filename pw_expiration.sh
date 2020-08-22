#!/bin/bash

#-------------------------------------------------------------------------------
# ログイン可能なユーザーを全て取得して、
# 各ユーザーのパスワード有効期限を一覧表示する。
# https://qiita.com/nkojima/items/502119f460017e9e7c1f
#-------------------------------------------------------------------------------
users=$(cat /etc/passwd | grep ':/bin/bash$' | sed s/:.*//)
​
for user in ${users[@]}; do
​
    expiration=$(chage -l $user | sed -n 2p | sed s/.*://)
    echo $user,$expiration
​
done