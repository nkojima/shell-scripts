#!/bin/bash

# CatAPIを使って、ランダムに猫の画像を取得する。

json=$(curl -s https://api.thecatapi.com/v1/images/search?api_key={YOUR_API_KEY})

image_url=$(echo ${json} | jq '.[0].url')

echo $image_url | sed 's/\"//g'