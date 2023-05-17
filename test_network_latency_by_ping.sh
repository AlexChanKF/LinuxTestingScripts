#!/bin/bash

# Specify the IP address of the receiving VM
RECEIVER_IP="192.168.56.101"

# Specify the number of pings to send
NUM_PACKETS=10

# Send the pings and measure the latency
echo "Testing network latency to $RECEIVER_IP..."
ping -c $NUM_PACKETS $RECEIVER_IP | tail -n2
