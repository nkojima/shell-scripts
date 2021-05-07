#!/bin/bash

#-------------------------------------------------------------------------------
# ファイルサイズとファイル数を指定して、高速にファイルを作成するスクリプト。
#-------------------------------------------------------------------------------
function usage {
    cat <<EOS
$(basename ${0}) is a file-creation tool for test.

Usage:
    $(basename ${0}) [<options>]

Options:
    -s    print file size in human readable format(e.g., 10K, 5M, 1G). default is 1K.
    -c    print file counts. default is 1.
EOS
}

# パラメーターの指定に従って、所望のサイズのファイルを指定した数だけ作成する。
# パラメーターの指定がなければ、1KBのファイルを1つ作成する。
FILE_SIZE="1K"
COUNT=1

while getopts s:c:h OPT
do
  case $OPT in
    "s" ) FILE_SIZE="$OPTARG"
          ;;
    "c" ) COUNT="$OPTARG"
          ;;
    "h" ) usage;
          exit 0
          ;;
  esac
done

# 処理高速化のため、ddコマンドを使わずにfallocateコマンドを使ってファイルを作成する。
for i in $( seq 1 $((COUNT)) ); do
  fallocate -l $FILE_SIZE ${FILE_SIZE}_${i}.txt
  echo -n "."
done

echo -n -e "\n"