#!/bin/bash

process_name="CANSender"

if pgrep -x "$process_name" > /dev/null
then
  pkill -x "$process_name"
  sleep 1
fi

ip link set can0 up type can bitrate 500000

ifconfig can0 txqueuelen 65536

cd ../build
./"$process_name" &

