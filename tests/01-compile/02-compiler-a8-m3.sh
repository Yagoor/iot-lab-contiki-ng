#!/bin/bash

CONTIKI=../../contiki-ng/
BASENAME=$(basename $0 .sh)

source $CONTIKI/tests/utils.sh

# Compile for the a8-m3 board
ARCH_PATH=../../../arch make -C $CONTIKI/examples/hello-world TARGET=iotlab BOARD=a8-m3 > make.log 2> make.err

cp make.log $BASENAME.testlog
if [ $? -eq 0 ] ; then
  printf "%-32s TEST OK\n" "$BASENAME" 
else
  echo "==== make.log ====" ; cat make.log;
  echo "==== make.err ====" ; cat make.err;
  printf "%-32s TEST FAIL\n" "$BASENAME" 
fi

rm -f make.log make.err 

# We do not want Make to stop -> Return 0
# The Makefile will check if a log contains FAIL at the end
exit 0