
factorial() {
    local num=$1
    local fact=1

    for ((i = 1; i <= num; i++)); do
        fact=$((fact * i))
    done

    echo "Factorial of $num is: $fact"
}

read -p "Enter a number: " num


if [[ $num =~ ^[0-9]+$ ]]; then
    factorial $num
else
    echo "Invalid input! Please enter a non-negative integer."
fi
