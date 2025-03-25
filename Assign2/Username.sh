#!/bin/bash

read -p "Enter username: " username

# Check if username starts with a letter and contains only alphanumeric characters
if [[ "$username" =~ ^[a-zA-Z][a-zA-Z0-9_]*$ ]]; then
    echo "Valid username"
else
    echo "Invalid username. A username should start with a letter and contain only alphanumeric characters or underscores."
fi

