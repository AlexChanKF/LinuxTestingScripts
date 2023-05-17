#!/bin/bash

# Specify the Port of the receiving VM
RECEIVER_PORT=3000

# Specify the format (k, m, g for Kbits, Mbits, Gbits or K, M, G for KBytes, Mbytes, Gbytes)
FORMAT=M

echo "Using iperf3 as Server listening on $RECEIVER_PORT"
iperf3 -s -f $FORMAT -p $RECEIVER_PORT
