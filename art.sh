#!/bin/bash

# Function to print ASCII art with ANSI colors
print_kalibian_art() {
    local art="
    \e[38;5;56m/$$   /$$  /$$$$$$  /$$       /$$$$$$ /$$$$$$$  /$$$$$$  /$$$$$$  /$$   /$$\e[0m
    \e[38;5;57m| $$  /$$/ /$$__  $$| $$      |_  $$_/| $$__  $$|_  $$_/ /$$__  $$| $$$ | $$\e[0m
    \e[38;5;58m| $$ /$$/ | $$  \ $$| $$        | $$  | $$  \ $$  | $$  | $$  \ $$| $$$$| $$\e[0m
    \e[38;5;59m| $$$$$/  | $$$$$$$$| $$        | $$  | $$$$$$$   | $$  | $$$$$$$$| $$ $$ $$\e[0m
    \e[38;5;60m| $$  $$  | $$__  $$| $$        | $$  | $$__  $$  | $$  | $$__  $$| $$  $$$$\e[0m
    \e[38;5;61m| $$\  $$ | $$  | $$| $$        | $$  | $$  \ $$  | $$  | $$  | $$| $$\  $$$\e[0m
    \e[38;5;62m| $$ \  $$| $$  | $$| $$$$$$$$ /$$$$$$| $$$$$$$/ /$$$$$$| $$  | $$| $$ \  $$\e[0m
    \e[38;5;63m|__/  \__/|__/  |__/|________/|______/|_______/ |______/|__/  |__/|__/  \__/\e[0m
    "

    echo -e "$art"
}

# Function to add or replace ASCII art in .bashrc
add_or_replace_kalibian_art() {
    local profile_file="$HOME/.bashrc"

    # Check if the function already exists in the file
    if grep -q "print_kalibian_art" "$profile_file"; then
        echo "Function print_kalibian_art already exists in $profile_file. Replacing..."
        # Remove the existing function
        sed -i '/print_kalibian_art() {/,/}/d' "$profile_file"
    else
        echo "Function print_kalibian_art not found in $profile_file. Adding..."
    fi

    # Add the new function
    echo -e "\n# Function to print ASCII art with ANSI colors" >> "$profile_file"
    echo -e "print_kalibian_art() {" >> "$profile_file"
    echo -e "    local art=\"\"\"" >> "$profile_file"
    echo -e "    $art" >> "$profile_file"
    echo -e "    \"\"\"" >> "$profile_file"
    echo -e "    echo -e \"\$art\"" >> "$profile_file"
    echo -e "}" >> "$profile_file"
    echo -e "\n# Call the function to print ASCII art" >> "$profile_file"
    echo -e "print_kalibian_art" >> "$profile_file"
    echo "Function added or replaced in $profile_file."
}

# Call the function to add or replace ASCII art
add_or_replace_kalibian_art

# Reload the profile to apply changes
source "$HOME/.bashrc" 2>/dev/null
