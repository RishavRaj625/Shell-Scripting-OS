#!/bin/bash

while true; do
    echo "-------- MENU --------"
    echo "1. Sort records in reverse order of Roll number and store in Sorted.dat"
    echo "2. Convert lowercase to uppercase in Sorted.dat"
    echo "3. Find unique names in Sorted.dat and append to Students.dat"
    echo "4. Display only the 2nd and 3rd lines of Students.dat"
    echo "5. Exit"
    echo "----------------------"
    
    read -p "Enter your choice: " choice

    case $choice in
        1)
            # Sort in reverse order of Roll number (2nd field)
            sort -t '|' -k2,2nr Students.dat > Sorted.dat
            echo "Sorted records stored in Sorted.dat"
            ;;
        2)
            # Convert lowercase to uppercase in Sorted.dat
            tr '[:lower:]' '[:upper:]' < Sorted.dat > Temp.dat && mv Temp.dat Sorted.dat
            echo "Lowercase letters converted to uppercase in Sorted.dat"
            ;;
        3)
            # Find unique names and append to Students.dat
            cut -d '|' -f1 Sorted.dat | uniq -u > unique_names.txt
            grep -F -f unique_names.txt Sorted.dat >> Students.dat
            echo "Unique records appended to Students.dat"
            ;;
        4)
            # Display only the 2nd and 3rd lines from Students.dat
            sed -n '2,3p' Students.dat
            ;;
        5)
            echo "Exiting..."
            exit 0
            ;;
        *)
            echo "Invalid choice. Please try again."
            ;;
    esac
done

