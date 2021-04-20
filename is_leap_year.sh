#!/bin/bash

function usage {
    cat <<EOS
'$(basename ${0})' is a program to check whether the input year is a leap year or not.
Usage:
    $(basename ${0}) [year]
    'year' is represented as 'YYYY'.
EOS
}

while getopts h OPT
do
  case $OPT in
    "h" ) usage;
          exit 0
          ;;
  esac
done

YEAR=${1}
RESULT=0

if [ $(( YEAR % 4 )) -eq 0 ] && [ $(( YEAR % 100 )) -ne 0 ]; then
  RESULT=1
elif [ $(( YEAR % 400)) -eq 0 ]; then
  RESULT=1
fi

echo $RESULT