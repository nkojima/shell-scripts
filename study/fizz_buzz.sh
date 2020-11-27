#!/bin/bash

# 1～100までの数を使って、FizzBuzzを実行する。

max=100

for ((i=1; i<=$max; i++))
do
  if [ $((i % 3)) -eq 0 ] && [ $((i % 5)) -eq 0 ]; then
    echo "Fizz Buzz"
  elif [ $((i % 3)) -eq 0 ]; then
    echo "Fizz"
  elif [ $((i % 5)) -eq 0 ]; then
    echo "Buzz"
  else
    echo $i
  fi
done