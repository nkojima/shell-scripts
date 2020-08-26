#!/bin/bash

#-------------------------------------------------------------------------------
# NHK番組表APIを利用して、現在放送中の番組を取得するスクリプト。
#
# ※jqパッケージのインストールが必要。
#-------------------------------------------------------------------------------
json=$(curl -s http://api.nhk.or.jp/v2/pg/now/130/g1.json?key={YOUR_API_KEY})

present_program=$(echo ${json} | jq '.nowonair_list.g1.present')

echo '[現在放送中の番組]'
echo 'チャンネル：'$(echo ${present_program} | jq '.service.name' | sed 's/\"//g')
echo '番組名：'$(echo ${present_program} | jq '.title' | sed 's/\"//g')
echo 'サブタイトル：'$(echo ${present_program} | jq '.subtitle' | sed 's/\"//g')
echo '開始時刻：'$(echo ${present_program} | jq '.start_time' | sed 's/\"//g')
echo '終了時刻：'$(echo ${present_program} | jq '.end_time' | sed 's/\"//g')