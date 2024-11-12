#!/bin/bash

# Удаление файла kalibianOS
if [ -f "$HOME/kalibianOS" ]; then
    echo "Deleting kalibianOS file..."
    rm -rf "$HOME/kalibianOS"
    echo "kalibianOS file successfully deleted."
else
    echo "kalibianOS file not found."
fi

# Клонирование репозитория в домашнюю директорию
echo "Cloning repository https://github.com/AstrologSecra/kalibianOS/ to $HOME..."
git clone https://github.com/AstrologSecra/kalibianOS/ "$HOME/kalibianOS"

if [ $? -eq 0 ]; then
    echo "Repository successfully cloned."
else
    echo "Error cloning repository."
fi
