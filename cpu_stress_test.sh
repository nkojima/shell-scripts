#!/bin/bash

#-------------------------------------------------------------------------------
# CPUの論理コア数（スレッド数）を加味して、CPUのストレステストを実行する。
# https://i-think-it.net/linux-cpu-stress-how-to/
#-------------------------------------------------------------------------------
function usage {
    cat <<EOS
$(basename ${0}) is a cpu stress test tool for multi-core processor.

Usage:
    $(basename ${0}) [<options>]

Options:
    -n    using n cores in stress test. default is `grep processor /proc/cpuinfo | wc -l`.
EOS
}

# CPUの論理コア数を取得する。
CPU_THREADS=`grep processor /proc/cpuinfo | wc -l`

# パラメータに応じて処理を振り分ける。
while getopts n:h OPT
do
  case $OPT in
    "n" ) CPU_THREADS="$OPTARG"
          ;;
    "h" ) usage;
          exit 0
          ;;
  esac
done

# CPUのストレステストを実行する。
echo "using "$CPU_THREADS" cores in stress test."
openssl speed -multi $CPU_THREADS > /dev/null 2>&1