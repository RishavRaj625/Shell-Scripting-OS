#!/bin/bash

# Check if a number is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <number>"
    exit 1
fi

# Compute log base 10 and format to 2 decimal places
log_value=$(echo "scale=2; l($1)/l(10)" | bc -l)

echo "log10($1) = $log_value"

