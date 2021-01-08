#!/bin/bash

# 「きよしのズンドコ節」の歌詞の一節を表示する。

zundoko=()
declare -a zundoko=("zun" "doko")
phrases=""

while :
do
  max=5
  for ((i=0; i < $max; i++)); do
      rnd=$(($RANDOM % 2))
      
      if [ -z $phrases ]; then
        phrases=${zundoko[$rnd]}
      else
        phrases+="-${zundoko[$rnd]}"
      fi
  done
  
  if [ $phrases = "zun-zun-zun-zun-doko" ]; then
    break
  else
    phrases=""
  fi
done

echo "${phrases}-Kiyoshi!"