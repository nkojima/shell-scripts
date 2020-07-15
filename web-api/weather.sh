#!/bin/bash
# http://weather.livedoor.com/forecast/webservice/json/v1?
​
# 全国の地点定義表（RSS）から、入力された地名と合致する地点名とIDを抽出する。
# http://weather.livedoor.com/forecast/rss/primary_area.xml
cityname_id=$(curl -s http://weather.livedoor.com/forecast/rss/primary_area.xml \
    | sed "s/>/>\n/g" \
    | grep city \
    | sed "s/<city title=\"//g" \
    | sed "s/\" source.*>//g" \
    | sed "s/\" id=\"/,/g" \
    | grep $1) \
​
# 該当する地名が存在する時は、その都市の天気予報を取得する。
# 該当する都市が存在しない時は処理を終了する。
if [ -z "$cityname_id" ]; then
    echo 「$1」の天気予報は提供されていません。以下の都市から選択してください。
    echo ----------------------------------------
    echo $(curl -s http://weather.livedoor.com/forecast/rss/primary_area.xml \
        | sed "s/>/>\n/g" \
        | grep city \
        | sed "s/<city title=\"//g" \
        | sed "s/\" id.*>//g")
else
    # {地点名,ID}の文字列からIDだけ抜き出す。
    city_id=$(echo $cityname_id | sed "s/.*,//g")
    city_name=$(echo $cityname_id | sed "s/,.*//g")
​
    echo $city_nameの今日の天気： \
        $(curl -s http://weather.livedoor.com/forecast/webservice/json/v1?city=${city_id} \
            | jq '.forecasts[]' \
            | jq -r 'select(.dateLabel=="今日").telop')
fi