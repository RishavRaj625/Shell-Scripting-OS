#!/bin/bash
DATA_FILE="personal.dat"

while true; do
    echo "Menu:"
    echo "1. Enter personal details"
    echo "2. Display personal details"
    echo "3. Exit"
    
    read -p "Enter your choice: " choice

    case $choice in
        1)
            read -p "Enter your name: " name
            read -p "Enter your age: " age
            read -p "Enter your email: " email
            read -s -p "Enter password: " password
            echo  # Move to new line
            
            echo "$name:$age:$email:$password" >> "$DATA_FILE"
            echo "Personal details saved successfully."
            ;;
        2)
            if [ ! -f "$DATA_FILE" ]; then
                echo "No data file found. Please enter details first."
                continue
            fi

            read -s -p "Enter password to view details: " input_password
            echo  # Move to new line

            # Check if password matches
            matched_entry=$(grep ":$input_password$" "$DATA_FILE")

            if [ -n "$matched_entry" ]; then
                echo "Personal Details:"
                echo "$matched_entry" | cut -d ":" -f 1-3
            else
                echo "Incorrect password."
            fi
            ;;
        3)
            echo "Exiting..."
            exit 0
            ;;
        *)
            echo "Invalid choice. Please try again."
            ;;
    esac
done

