#!/bin/bash

# Specify the block size to use for the I/O operations (in bytes)
BLOCK_SIZE=4096

# Specify the number of I/O operations to perform
NUM_OPERATIONS=100000

# Specify the file to use for the I/O operations
TEST_FILE=/tmp/testfile

# Create the test file
dd if=/dev/zero of=$TEST_FILE bs=$BLOCK_SIZE count=100000

# Measure the write performance
echo "Testing write performance..."
sync
echo 3 > /proc/sys/vm/drop_caches
START=$(date +%s.%N)
dd if=/dev/zero of=$TEST_FILE bs=$BLOCK_SIZE count=$NUM_OPERATIONS
END=$(date +%s.%N)
echo "Write performance: $(echo "scale=2; $BLOCK_SIZE*$NUM_OPERATIONS/($END-$START)/1024/1024" | bc) MB/s"

# Measure the read performance
echo "Testing read performance..."
sync
echo 3 > /proc/sys/vm/drop_caches
START=$(date +%s.%N)
dd if=$TEST_FILE of=/dev/null bs=$BLOCK_SIZE count=$NUM_OPERATIONS
END=$(date +%s.%N)
echo "Read performance: $(echo "scale=2; $BLOCK_SIZE*$NUM_OPERATIONS/($END-$START)/1024/1024" | bc) MB/s"

# Clean up the test file
rm $TEST_FILE
