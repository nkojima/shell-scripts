#!/bin/bash

echo "[CPU Info]"
echo $(cat /proc/cpuinfo | grep "model name" | sort -u)
echo $(cat /proc/cpuinfo | grep "cpu cores" | sort -u)
echo "cpu threads : "$(cat /proc/cpuinfo | grep "processor" | wc -l)

echo "[Memory Info]"
echo $(cat /proc/meminfo | grep "MemTotal" | sort -u)

echo "[SCSI device]"
echo $(cat /proc/scsi/scsi)

echo "[PCI-E device(VGA)]"
echo "$(lspci | grep -i vga)"

echo "[PCI-E device(SSD)]"
echo "$(lspci | grep -iE "SSD|Non-Volatile memory")"

echo "[BIOS]"
echo "vendor : $(dmidecode -t bios | grep "Vendor" | sed 's/\sVendor:\s//g')"
echo "version : $(dmidecode -t bios | grep "Version" | sed 's/\sVersion:\s//g')"