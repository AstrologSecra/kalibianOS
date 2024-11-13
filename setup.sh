#!/bin/bash

# Предупреждение
echo "Warning: This script will run script.sh."
echo "Make sure you understand the consequences of running these script."
read -p "Are you sure you want to continue? (y/n): " confirm

if [[ "$confirm" != "y" ]]; then
    echo "Отмена."
    exit 1
fi

# Установка прав на исполнение для script.sh и art.sh
echo "Preparring script.sh..."
chmod +x script.sh


# Запуск script.sh
echo "Start script.sh..."
./script.sh



echo "Completed."
