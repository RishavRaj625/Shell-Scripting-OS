#!/bin/bash

# Read command-line arguments as an array
arr=("$@")

# Bubble Sort Algorithm
n=${#arr[@]}
for ((i = 0; i < n - 1; i++)); do
    for ((j = 0; j < n - i - 1; j++)); do
        if [ "${arr[j]}" -gt "${arr[j+1]}" ]; then
            temp=${arr[j]}
            arr[j]=${arr[j+1]}
            arr[j+1]=$temp
        fi
    done
done

echo "Sorted Array: ${arr[@]}"

