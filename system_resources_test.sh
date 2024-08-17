#!/bin/bash

#checks for system resources (can be memory, cpu, disk, all of the above and/or more)

# Thresholds
MEMORY_THRESHOLD=80      # 80% memory usage
DISK_THRESHOLD=80        # 80% disk usage

# Function to check memory usage
check_memory() {
    echo "Checking memory usage..."
    # Get the memory usage percentage
    MEMORY_USED=$(free | awk '/^Mem/ {printf "%.0f", $3/$2 * 100.0}')
    
    if [ "$MEMORY_USED" -ge "$MEMORY_THRESHOLD" ]; then
        echo "Memory usage is too high: $MEMORY_USED% (Threshold: $MEMORY_THRESHOLD%)"
        return 1
    else
        echo "Memory usage is within limits: $MEMORY_USED%"
        return 0
    fi
}

# Function to check disk usage
check_disk() {
    echo "Checking disk usage..."
    # Get the disk usage percentage for root partition
    DISK_USED=$(df / | awk '$NF=="/"{printf "%d", $5}' | tr -d '%')

    if [ "$DISK_USED" -ge "$DISK_THRESHOLD" ]; then
        echo "Disk usage is too high: $DISK_USED% (Threshold: $DISK_THRESHOLD%)"
        return 1
    else
        echo "Disk usage is within limits: $DISK_USED%"
        return 0
    fi
}

# Main script
echo "System Resources Test..."

# Run checks and store the result of each
check_memory
MEMORY_STATUS=$?

check_disk
DISK_STATUS=$?

# If any check fails (status code 1), exit with code 1
if [ "$MEMORY_STATUS" -ne 0 ] || [ "$DISK_STATUS" -ne 0 ]; then
    echo "One or more system resources are above the threshold."
    exit 1
else
    echo "All system resources are within acceptable limits."
    exit 0
fi
