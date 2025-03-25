#!/bin/bash

read -p "Enter a positive integer: " num

# Compute square root
sqrt_value=$(echo "scale=2; sqrt($num)" | bc -l)
echo "Square root of $num: $sqrt_value"

# Convert to hexadecimal
hex_value=$(printf "%X\n" "$num")
echo "Hexadecimal representation: $hex_value"

