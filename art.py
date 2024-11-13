import os

def print_kalibian_art():
    art = (
        "\033[38;5;56m/$$   /$$  /$$$$$$  /$$       /$$$$$$ /$$$$$$$  /$$$$$$  /$$$$$$  /$$   /$$\033[0m\n"
        "\033[38;5;57m| $$  /$$/ /$$__  $$| $$      |_  $$_/| $$__  $$|_  $$_/ /$$__  $$| $$$ | $$\033[0m\n"
        "\033[38;5;58m| $$ /$$/ | $$  \ $$| $$        | $$  | $$  \ $$  | $$  | $$  \ $$| $$$$| $$\033[0m\n"
        "\033[38;5;59m| $$$$$/  | $$$$$$$$| $$        | $$  | $$$$$$$   | $$  | $$$$$$$$| $$ $$ $$\033[0m\n"
        "\033[38;5;60m| $$  $$  | $$__  $$| $$        | $$  | $$__  $$  | $$  | $$__  $$| $$  $$$$\033[0m\n"
        "\033[38;5;61m| $$\  $$ | $$  | $$| $$        | $$  | $$  \ $$  | $$  | $$  | $$| $$\  $$$\033[0m\n"
        "\033[38;5;62m| $$ \  $$| $$  | $$| $$$$$$$$ /$$$$$$| $$$$$$$/ /$$$$$$| $$  | $$| $$ \  $$\033[0m\n"
        "\033[38;5;63m|__/  \__/|__/  |__/|________/|______/|_______/ |______/|__/  |__/|__/  \__/\033[0m\n"
    )
    print(art)

def add_or_replace_kalibian_art():
    profile_file = os.path.expanduser("~/.bashrc")

    # Check if the function already exists in the file
    with open(profile_file, 'r') as file:
        lines = file.readlines()

    function_exists = any("print_kalibian_art()" in line for line in lines)

    if function_exists:
        print("Function print_kalibian_art already exists in ~/.bashrc. Replacing...")
        # Remove the existing function
        with open(profile_file, 'w') as file:
            in_function = False
            for line in lines:
                if "print_kalibian_art() {" in line:
                    in_function = True
                elif in_function and "}" in line:
                    in_function = False
                elif not in_function:
                    file.write(line)
    else:
        print("Function print_kalibian_art not found in ~/.bashrc. Adding...")

    # Add the new function
    with open(profile_file, 'a') as file:
        file.write("\n# Function to print ASCII art with ANSI colors\n")
        file.write("print_kalibian_art() {\n")
        file.write('    local art="""\n')
        file.write(f'    {art}\n')
        file.write('    """\n')
        file.write('    echo -e "$art"\n')
        file.write("}\n")
        file.write("\n# Call the function to print ASCII art\n")
        file.write("print_kalibian_art\n")

    print("Function added or replaced in ~/.bashrc.")

# Call the function to add or replace ASCII art
add_or_replace_kalibian_art()

# Reload the profile to apply changes
os.system("source ~/.bashrc 2>/dev/null")
