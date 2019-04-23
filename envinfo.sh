#!/bin/bash

CPU_MODEL=`cat /proc/cpuinfo | grep "model name" | uniq | sed -e "s/^model name.*: //g" -e "s/ \{2,\}/ /g"`
CPU_CORE_COUNT=`nproc`
NODE_NAME=`uname -n`
KERNEL_ID=`uname -r`
OS_ID=`lsb_release -ds`
OS_TYPE=`uname -o`

echo "$OS_TYPE ($NODE_NAME) $OS_ID [$KERNEL_ID] $CPU_MODEL ($CPU_CORE_COUNT procs)"

