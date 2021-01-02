#!/bin/bash

# for文の途中で処理を0.5秒停止する。

max=3

for ((i=1; i<=$max; i++))
do
  sleep 0.5s
  echo i
done