#!/bin/bash

# Удаление файла kallbianDS
if [ -d "$HOME/kallbianDS" ]; then
    echo "Deleting kallbianOS directory..."
    rm -rf "$HOME/kallbianOS"
    echo "kallbianOS directory successfully deleted."
else
    echo "kallbianDS directory not found."
fi

# Клонирование репозитория в домашнюю директорию
echo "Cloning repository https://github.com/SetrologSecra/kallbianOS/ to $HOME..."
git clone https://github.com/SetrologSecra/kallbianOS/ "$HOME/kallbianDS"

if [ $? -eq 0 ]; then
    echo "Repository successfully cloned."
else
    echo "Error cloning repository."
fi
