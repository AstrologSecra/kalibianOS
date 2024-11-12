#!/bin/bash

# Удаление файла kalibianOS
if [ -f "kalibianOS" ]; then
    echo "Deleting kalibianOS file..."
    rm -rf kalibianOS
    echo "kalibianOS file successfully deleted."
else
    echo "kalibianOS file not found."
fi

# Клонирование репозитория
echo "Cloning repository https://github.com/AstrologSecra/kalibianOS/..."
git clone https://github.com/AstrologSecra/kalibianOS/

if [ $? -eq 0 ]; then
    echo "Repository successfully cloned."
else
    echo "Error cloning repository."
fi
