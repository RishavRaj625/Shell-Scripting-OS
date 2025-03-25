#!/bin/bash

while true; do
    echo "Menu:"
    echo "1. Show permissions of a file or directory"
    echo "2. Show the number of files and directories under current directory"
    echo "3. Show the last modification time of a file"
    echo "4. Exit"
    
    read -p "Enter your choice: " choice

    case $choice in
        1)
            read -p "Enter file/directory name: " name
            if [ -e "$name" ]; then
                ls -ld "$name"
            else
                echo "File or directory does not exist."
            fi
            ;;
        2)
            file_count=$(find . -maxdepth 1 -type f | wc -l)
            dir_count=$(find . -maxdepth 1 -type d | wc -l)
            echo "Files: $file_count"
            echo "Directories: $((dir_count - 1))"  # Subtracting 1 for current directory (.)
            ;;
        3)
            read -p "Enter file name: " filename
            if [ -f "$filename" ]; then
                stat -c %y "$filename"
            else
                echo "File does not exist."
            fi
            ;;
        4)
            echo "Exiting..."
            exit 0
            ;;
        *)
            echo "Invalid choice. Please try again."
            ;;
    esac
done

