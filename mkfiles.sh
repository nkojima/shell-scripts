#!/bin/bash

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

for i in $( seq 1 $((COUNT)) ); do
  dd if=/dev/zero of=${FILE_SIZE}_${i}.txt bs=$FILE_SIZE count=1 2> /dev/null
  echo -n "."
done

echo -n -e "\n"