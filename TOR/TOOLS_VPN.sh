#!/bin/bash

# Fungsi untuk memeriksa status IP
check_ip() {
    echo -e "[INFO] Memeriksa IP saat ini..."
    current_ip=$(curl -s ifconfig.me)
    echo -e "IP Address Anda: $current_ip"

    if [[ "$current_ip" == *"YOUR_REAL_IP"* ]]; then
        echo -e "[WARNING] IP Anda tidak terlindungi!"
    else
        echo -e "[SUCCESS] IP Anda dilindungi oleh VPN."
    fi
}

# Fungsi untuk menjalankan VPN
start_vpn() {
    echo -e "[INFO] Menghubungkan ke VPN..."
    openvpn --config vpn-config.ovpn &
    sleep 5  # Tunggu koneksi VPN
    echo -e "[INFO] VPN terhubung."
}

# Fungsi untuk mematikan VPN
stop_vpn() {
    echo -e "[INFO] Mematikan koneksi VPN..."
    pkill openvpn
    echo -e "[INFO] VPN telah dimatikan."
}

# Fungsi untuk membuka situs web
access_website() {
    read -p "Masukkan URL situs web: " url
    echo -e "[INFO] Membuka $url melalui koneksi VPN..."
    curl -s $url | head -n 20
}

# Menu utama
while true; do
    clear
    echo -e "============================="
    echo -e "       VPN Protector         "
    echo -e "============================="
    echo -e "1. Jalankan VPN"
    echo -e "2. Periksa Status IP"
    echo -e "3. Buka Situs Web"
    echo -e "4. Matikan VPN"
    echo -e "5. Keluar"
    echo -e "============================="
    read -p "Pilih opsi (1-5): " choice

    case $choice in
        1)
            start_vpn
            ;;
        2)
            check_ip
            ;;
        3)
            access_website
            ;;
        4)
            stop_vpn
            ;;
        5)
            echo -e "[INFO] Keluar dari program."
            exit 0
            ;;
        *)
            echo -e "[ERROR] Pilihan tidak valid."
            ;;
    esac

    echo -e ""
    read -p "Tekan Enter untuk kembali ke menu..."
done
