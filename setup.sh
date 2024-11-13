#!/bin/bash

# Предупреждение
echo "Warning: This script will run script.sh и reloader.sh."
echo "Make sure you understand the consequences of running these scripts."
read -p "Are you sure you want to continue? (y/n): " confirm

if [[ "$confirm" != "y" ]]; then
    echo "Отмена."
    exit 1
fi

# Установка прав на исполнение для script.sh и art.sh
echo "Preparring script.sh и reloader.sh..."
chmod +x script.sh
chmod +x reloader.sh

# Запуск script.sh
echo "Start script.sh..."
./script.sh

# Запуск art.sh
echo "Start reloader.sh..."
./reloader.sh

echo "Completed."
