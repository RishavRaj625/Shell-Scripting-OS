#!/bin/bash


sum_of_digits() {
    local num=$1
    local sum=0
    local digit

    while [[ $num -gt 0 ]]; do
        digit=$((num % 10))  # Extract last digit
        sum=$((sum + digit)) # Add to sum
        num=$((num / 10))    # Remove last digit
    done

    echo "Sum of digits: $sum"
}


read -p "Enter a number: " num


if [[ $num =~ ^[0-9]+$ ]]; then
    sum_of_digits $num
else
    echo "Invalid input! Please enter a valid positive integer."
fi

