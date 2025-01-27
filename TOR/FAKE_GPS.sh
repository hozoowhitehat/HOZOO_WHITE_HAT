#!/bin/bash

echo -e "==========================="
echo -e "      Fake GPS Tool        "
echo -e "==========================="

# Memeriksa ADB
echo -e "[INFO] Memeriksa ADB..."
if ! command -v adb &> /dev/null
then
    echo -e "[ERROR] ADB tidak ditemukan. Install dengan: pkg install android-tools"
    exit 1
fi

# Meminta input lokasi
echo -e "[INFO] Masukkan koordinat lokasi palsu:"
read -p "Latitude: " latitude
read -p "Longitude: " longitude

# Aktifkan mode mock location di perangkat
echo -e "[INFO] Mengaktifkan mock location..."
adb shell settings put secure mock_location 1

# Mengirim lokasi palsu
echo -e "[INFO] Mengirim koordinat ($latitude, $longitude)..."
adb shell am startservice -a com.android.location.mock -e lat $latitude -e lon $longitude

echo  -e "[INFO] Lokasi palsu berhasil diatur!"
