#!/bin/bash

# Функция для вывода ASCII-арта
print_kalibian_art() {
    local art='''
     /$$   /$$  /$$$$$$  /$$       /$$$$$$ /$$$$$$$  /$$$$$$  /$$$$$$  /$$   /$$
    | $$  /$$/ /$$__  $$| $$      |_  $$_/| $$__  $$|_  $$_/ /$$__  $$| $$$ | $$
    | $$ /$$/ | $$  \ $$| $$        | $$  | $$  \ $$  | $$  | $$  \ $$| $$$$| $$
    | $$$$$/  | $$$$$$$$| $$        | $$  | $$$$$$$   | $$  | $$$$$$$$| $$ $$ $$
    | $$  $$  | $$__  $$| $$        | $$  | $$__  $$  | $$  | $$__  $$| $$  $$$$
    | $$\  $$ | $$  | $$| $$        | $$  | $$  \ $$  | $$  | $$  | $$| $$\  $$$
    | $$ \  $$| $$  | $$| $$$$$$$$ /$$$$$$| $$$$$$$/ /$$$$$$| $$  | $$| $$ \  $$
    |__/  \__/|__/  |__/|________/|______/|_______/ |______/|__/  |__/|__/  \__/
    '''

    echo " $(tput setaf 2)$art"# зеленинкий текст

}

# Функция для добавления ASCII-арта в .bashrc
add_kalibian_art() {
    local profile_file="$HOME/.bashrc"

    # Проверяем, есть ли уже функция в файле
    if ! grep -q "print_kalibian_art" "$profile_file"; then
        echo "Функция print_kalibian_art не найдена в $profile_file. Добавляем..."
        echo -e "\n# Функция для вывода ASCII-арта" >> "$profile_file"
        echo -e "print_kalibian_art() {" >> "$profile_file"
        echo -e "    local art='''" >> "$profile_file"
        echo -e "    $art" >> "$profile_file"
        echo -e "    '''" >> "$profile_file"
        echo -e "    echo \"\$art\"" >> "$profile_file"
        echo -e "}" >> "$profile_file"
        echo -e "\n# Вызов функции для вывода ASCII-арта" >> "$profile_file"
        echo -e "print_kalibian_art" >> "$profile_file"
        echo "Функция добавлена в $profile_file."
    else
        echo "Функция print_kalibian_art уже существует в $profile_file."
    fi
}

# Вызов функции для добавления ASCII-арта
add_kalibian_art

# Перезагрузка профиля для применения изменений
source "$HOME/.bashrc" 2>/dev/null
