#!/bin/bash


fibonacci() {
    local n=$1
    local a=0
    local b=1
    local temp

    echo -n "Fibonacci Series up to $n terms: "
 
    for (( i=0; i<n; i++ )); do
        echo -n "$a "
        temp=$((a + b))
        a=$b
        b=$temp
    done

    echo ""
}



read -p "Enter the number of terms (N): " num



fibonacci $num
