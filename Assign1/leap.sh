is_leap_year() {
    local year=$1

    if (( year % 4 == 0 && year % 100 != 0 )) || (( year % 400 == 0 )); then
        echo "$year is a Leap Year."
    else
        echo "$year is NOT a Leap Year."
    fi
}


read -p "Enter a year: " year


if [[ $year =~ ^[0-9]+$ ]]; then
    is_leap_year $year
else
    echo "Invalid input! Please enter a valid positive integer for the year."
fi
