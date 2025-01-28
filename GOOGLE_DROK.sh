#!/bin/bash

# Fungsi untuk menampilkan banner
show_banner() {
    echo -e "============================="
    echo -e "   Google Dorking Tool"
    echo -e "============================="
    echo -e ""
}

# Fungsi untuk melakukan pencarian dork
google_dork() {
    DORK_QUERY=$1
    ENCODED_QUERY=$(echo "$DORK_QUERY" | sed 's/ /+/g')
    echo -e "Mencari dengan Google Dork: $DORK_QUERY"
    echo -e "========================================"
    echo -e ""
    echo -e "Link pencarian Google:"
    echo -e "https://www.google.com/search?q=$ENCODED_QUERY"
    echo -e ""
}

# Menu utama
main_menu() {
    show_banner
    echo -e "Pilih dork yang ingin digunakan:"
    echo -e "1. File yang diekspos (.env files)"
    echo -e "2. Kamera yang dapat diakses publik"
    echo -e "3. File konfigurasi server"
    echo -e "4. Email dan password dalam file teks"
    echo -e "5. Custom dork"
    echo -e "6. Keluar"
    echo -e ""
    read -p "Pilih opsi (1-6): " choice

    case $choice in
        1)
            google_dork "ext:env DB_PASSWORD | DATABASE_URL"
            ;;
        2)
            google_dork "inurl:/view/view.shtml"
            ;;
        3)
            google_dork "intitle:index.of config"
            ;;
        4)
            google_dork "filetype:txt intext:'email' intext:'password'"
            ;;
        5)
            read -p "Masukkan custom dork: " custom_dork
            google_dork "$custom_dork"
            ;;
        6)
            echo "Keluar dari program. Terima kasih!"
            exit 0
            ;;
        *)
            echo "Opsi tidak valid. Coba lagi."
            main_menu
            ;;
    esac
}

# Menjalankan menu utama
main_menu
