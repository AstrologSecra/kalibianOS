#!/bin/bash

# Удаление файла kallbianDS
if [ -d "$HOME/kallbianDS" ]; then
    echo "Deleting kallbianDS directory..."
    rm -rf "$HOME/kallbianDS"
    echo "kallbianDS directory successfully deleted."
else
    echo "kallbianDS directory not found."
fi

# Клонирование репозитория в домашнюю директорию
echo "Cloning repository https://github.com/SetrologSecra/kallbianDS/ to $HOME..."
git clone https://github.com/SetrologSecra/kallbianDS/ "$HOME/kallbianDS"

if [ $? -eq 0 ]; then
    echo "Repository successfully cloned."
else
    echo "Error cloning repository."
fi
