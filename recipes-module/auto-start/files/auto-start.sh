#!/bin/sh

echo "Setting for CAN"
ip link set can0 up type can bitrate 500000
echo "CAN setup complete"

echo "Start headunit"
cd /usr/bin/headunit/execute_files
./IPCManager > /dev/null 2>&1 &
echo "Headunit is running"
