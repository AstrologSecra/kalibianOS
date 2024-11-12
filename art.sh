#!/bin/bash

# Функция для вывода ASCII-арта с ANSI-цветами
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

# Функция для добавления или замены ASCII-арта в .bashrc
add_or_replace_kalibian_art() {
    local profile_file="$HOME/.bashrc"

    # Проверяем, есть ли уже функция в файле
    if grep -q "print_kalibian_art" "$profile_file"; then
        echo "Функция print_kalibian_art уже существует в $profile_file. Заменяем..."
        # Удаляем существующую функцию
        sed -i '/print_kalibian_art() {/,/}/d' "$profile_file"
    else
        echo "Функция print_kalibian_art не найдена в $profile_file. Добавляем..."
    fi

    # Добавляем новую функцию
    echo -e "\n# Функция для вывода ASCII-арта с ANSI-цветами" >> "$profile_file"
    echo -e "print_kalibian_art() {" >> "$profile_file"
    echo -e "    local art=\"\"\"" >> "$profile_file"
    echo -e "    $art" >> "$profile_file"
    echo -e "    \"\"\"" >> "$profile_file"
    echo -e "    echo -e \"\$art\"" >> "$profile_file"
    echo -e "}" >> "$profile_file"
    echo -e "\n# Вызов функции для вывода ASCII-арта" >> "$profile_file"
    echo -e "print_kalibian_art" >> "$profile_file"
    echo "Функция добавлена или заменена в $profile_file."
}

# Вызов функции для добавления или замены ASCII-арта
add_or_replace_kalibian_art

# Перезагрузка профиля для применения изменений
source "$HOME/.bashrc" 2>/dev/null
