#!/bin/bash

# Specify the IP address of the receiving VM
RECEIVER_IP="192.168.56.101"

# Specify the number of packets to send
NUM_PACKETS=10

# Run MTR and output the results
echo "Testing network latency to $RECEIVER_IP..."
mtr -rw -c $NUM_PACKETS $RECEIVER_IP
