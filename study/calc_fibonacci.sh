#!/bin/bash

# 再帰も配列も使わず、0～100までの間のフィボナッチ数を返す。
# http://www.aoni.waseda.jp/ichiji/2014/ruby-01/ruby-14-1.html

result=0              # フィボナッチ数の計算結果
p1_result=0           # 1つ前のフィボナッチ数の計算結果

for ((i=0; i<=100; i++))
do
  if [ $i -eq 0 ]; then
    echo 0
  elif [ $i -eq 1 ]; then
    result=1
    p1_result=1
    echo $result
  else
    p2_result=$p1_result  # 1つ前の計算結果を2つ前の計算結果に代入
    p1_result=$result     # 直前の計算結果を1つ前の計算結果に代入
    result=$(($p1_result+p2_result))
    echo $result
  fi
done