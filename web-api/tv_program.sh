#!/bin/bash

#-------------------------------------------------------------------------------
# NHK番組表APIを利用して、現在放送中の番組を取得するスクリプト。
#-------------------------------------------------------------------------------
json=$(curl -s http://api.nhk.or.jp/v2/pg/now/130/g1.json?key={YOUR_API_KEY})

echo '[現在放送中の番組]'
echo 'チャンネル：'$(echo ${json} | jq '.nowonair_list.g1.present.service.name' | sed 's/\"//g')
echo '番組名：'$(echo ${json} | jq '.nowonair_list.g1.present.title' | sed 's/\"//g')
echo 'サブタイトル：'$(echo ${json} | jq '.nowonair_list.g1.present.subtitle' | sed 's/\"//g')