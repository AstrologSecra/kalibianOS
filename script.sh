#!/bin/bash

# Warning
echo "Warning: This script will remove all graphical environments."
echo "This may lead to data loss and system malfunction."
read -p "Are you sure you want to continue? (y/n): " confirm

if [[ "$confirm" != "y" ]]; then
    echo "Отмена."
    exit 1
fi

# Removing graphical environments
echo "Removing graphical environments..."
sudo apt-get purge --auto-remove gnome* kde* xfce* lxde* cinnamon* mate*

# Removing packages related to graphics
echo "Removing packages related to graphics..."
sudo apt-get purge --auto-remove xserver* x11-common

# Cleaning the system
echo "Cleaning the system..."
sudo apt-get autoremove --purge
sudo apt-get clean

echo "Graphical environments removed."

# Ask the user which packages to install
echo "Enter the list of packages you want to install (separated by spaces):"
read -p "Packages: " packages

if [[ -n "$packages" ]]; then
    echo "Checking the availability of packages in repositories..."
    sudo apt-get update > /dev/null
    for package in $packages; do
        if sudo apt-cache show $package > /dev/null 2>&1; then
            echo "Package $package found. Installing..."
            sudo apt-get install -y $package
        else
            echo "Package $package not found in repositories."
        fi
    done
else
    echo "No packages specified. Skipping installation."
fi

# Ask the user if they want to add kalibian software
read -p "Do you want to add kalibian software? (y/n): " add_kalibian

if [[ "$add_kalibian" == "y" ]]; then
    # Define the repository URL and local directory
    repo_url="https://github.com/AstrologSecra/kalibiansoft.git"
    local_dir="$HOME/kalibiansoft"

    # Check if the directory already exists
    if [[ -d "$local_dir" ]]; then
        echo "Removing existing kalibiansoft directory..."
        rm -rf "$local_dir"
    fi

    # Clone the repository
    echo "Cloning kalibiansoft repository..."
    git clone "$repo_url" "$local_dir"

    if [[ $? -eq 0 ]]; then
        echo "kalibiansoft repository cloned successfully."
    else
        echo "Failed to clone kalibiansoft repository."
    fi
else
    echo "Skipping kalibian software installation."
fi

echo "Operation completed."
