#!/bin/bash

# Fungsi untuk mengecek username di GitHub
check_github() {
    USERNAME=$1
    response=$(curl -s -o /dev/null -w "%{http_code}" https://github.com/$USERNAME)
    if [ "$response" -eq 200 ]; then
        echo -e "[GitHub] Username '$USERNAME' available."
    else
        echo -e "[GitHub] Username '$USERNAME' not available."
    fi
}

# Fungsi untuk mengecek username di Twitter
check_twitter() {
    USERNAME=$1
    response=$(curl -s -o /dev/null -w "%{http_code}" https://twitter.com/$USERNAME)
    if [ "$response" -eq 200 ]; then
        echo -e "[Twitter] Username '$USERNAME' available."
    else
        echo -e "[Twitter] Username '$USERNAME' not available."
    fi
}

# Fungsi untuk mengecek username di Instagram
check_instagram() {
    USERNAME=$1
    response=$(curl -s -o /dev/null -w "%{http_code}" https://www.instagram.com/$USERNAME)
    if [ "$response" -eq 200 ]; then
        echo -e "[Instagram] Username '$USERNAME' available."
    else
        echo -e "[Instagram] Username '$USERNAME' not available."
    fi
}

# Fungsi utama untuk menjalankan pemindaian
scan_username() {
    echo -e "Starting username scan..."

    read -p "Enter the username to scan: " username

    # Cek di berbagai platform
    check_github $username
    check_twitter $username
    check_instagram $username
}

# Menjalankan fungsi scan_username
scan_username
