#!/bin/bash

sum=0

# Loop through each command-line argument
for num in "$@"; do
    sum=$((sum + num))
done

echo "Summation: $sum"

