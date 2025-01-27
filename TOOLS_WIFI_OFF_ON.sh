#!/bin/bash

# Fungsi untuk mematikan Wi-Fi
turnOffWifi() {
    echo "Mematikan Wi-Fi..."
    nmcli radio wifi off
    echo "Wi-Fi berhasil dimatikan."
}

# Fungsi untuk menghidupkan Wi-Fi dan menghubungkan ke jaringan
turnOnWifi() {
    SSID=$1
    PASSWORD=$2
    if [ -z "$SSID" ] || [ -z "$PASSWORD" ]; then
        echo "SSID dan Password diperlukan untuk menghubungkan Wi-Fi."
        echo "Gunakan: ./wifi-control.sh on <SSID> <Password>"
        exit 1
    fi
    echo "Menghubungkan ke Wi-Fi $SSID..."
    nmcli dev wifi connect "$SSID" password "$PASSWORD"
    if [ $? -eq 0 ]; then
        echo "Terhubung ke Wi-Fi: $SSID"
    else
        echo "Gagal menghubungkan ke Wi-Fi: $SSID"
    fi
}

# Menampilkan menu
echo "Apa yang ingin Anda lakukan?"
echo "1. Matikan Wi-Fi"
echo "2. Hidupkan Wi-Fi"
read -p "Pilih nomor (1 atau 2): " pilihan

if [ "$pilihan" == "1" ]; then
    turnOffWifi
elif [ "$pilihan" == "2" ]; then
    read -p "Masukkan SSID Wi-Fi: " SSID
    read -sp "Masukkan Password Wi-Fi: " PASSWORD
    echo
    turnOnWifi "$SSID" "$PASSWORD"
else
    echo "Pilihan tidak valid. Gunakan 1 untuk mematikan Wi-Fi atau 2 untuk menghidupkan Wi-Fi."
fi
