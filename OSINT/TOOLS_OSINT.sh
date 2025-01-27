#!/bin/bash

# Fungsi untuk memindai gambar JPG
scan_jpg() {
    read -p "Enter the path to the JPG file: " FILE
    exiftool "$FILE"
}

# Fungsi untuk memindai video MP4
scan_mp4() {
    read -p "Enter the path to the MP4 file: " FILE
    ffmpeg -i "$FILE" 2>&1 | grep 'Metadata'
}

# Fungsi untuk mencari lokasi berdasarkan IP
scan_ip() {
    read -p "Enter IP address to locate: " IP_ADDRESS
    curl -s "https://ipinfo.io/$IP_ADDRESS/json" | jq .
}

# Menu Pilihan
echo -e "Select an option:"
echo -e "1. Scan JPG file for metadata"
echo -e "2. Scan MP4 file for metadata"
echo -e "3. Scan IP address for geolocation"

read -p "Enter your choice: " choice

if [ "$choice" -eq 1 ]; then
    scan_jpg
elif [ "$choice" -eq 2 ]; then
    scan_mp4
elif [ "$choice" -eq 3 ]; then
    scan_ip
else
    echo -e "Invalid choice"
fi
