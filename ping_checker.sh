#!/bin/bash
​
#-------------------------------------------------------------------------------
# PINGによるサーバーの死活確認用スクリプト。
#-------------------------------------------------------------------------------

# 監視先サーバーのIPのリスト
IP_LIST=(172.17.12.143 172.17.11.130 172.17.15.81 172.17.15.82)

# アラートメールの送信先
MAILTO='your_address@sample.com'

# ログファイルの出力先
LOG_FILE=./ping.log
​
for ip in ${IP_LIST[@]}
do
  ping_result=$(ping -w 5 $ip | grep '100% packet loss')
  date_result=$(date)
#  echo $ping_result
​
  if [[ -n $ping_result ]]; then
    echo "[SEVERE] server inactive: $ip $date_result" >> $LOG_FILE
    echo $ip | mail -s "[ALERT] server down!! $date_result" $MAILTO
  else
    echo "[INFO] server active: $ip $date_result" >> $LOG_FILE
  fi
done