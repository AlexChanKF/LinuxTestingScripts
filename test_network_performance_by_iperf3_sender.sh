#!/bin/bash

# Specify the IP address of the receiving VM
RECEIVER_IP="192.168.56.101"

# Specify the Port of the receiving VM
RECEIVER_PORT=3000

# Specify the format (k, m, g for Kbits, Mbits, Gbits or K, M, G for KBytes, Mbytes, Gbytes)
FORMAT=M

# Measure the Network Performance From Local to Remote
echo "Testing network performance from LOCAL To $RECEIVER_IP..."
iperf3 -c $RECEIVER_IP -p $RECEIVER_PORT -f $FORMAT

# Measure the Network Performance From Remote to Local
echo "Testing network performance from $RECEIVER_IP To LOCAL..."
iperf3 -c $RECEIVER_IP -p $RECEIVER_PORT -f $FORMAT -R
