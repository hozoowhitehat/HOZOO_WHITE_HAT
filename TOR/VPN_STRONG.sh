#!/bin/bash

echo -e "============================"
echo -e "  VPN IP Protector - Bash   "
echo -e "============================"

# Periksa dan update Termux
echo -e "[INFO] Memeriksa pembaruan paket..."
pkg update && pkg upgrade -y

# Periksa OpenVPN
echo -e "[INFO] Memeriksa OpenVPN..."
if ! command -v openvpn &> /dev/null; then
    echo "[ERROR] OpenVPN tidak ditemukan. Menginstall..."
    pkg install openvpn -y
fi

# Pilih file konfigurasi
echo -e "[INFO] Menyiapkan koneksi VPN..."
CONFIG_FILE="vpn-config.ovpn"
if [ ! -f "$CONFIG_FILE" ]; then
    echo "[ERROR] File konfigurasi $CONFIG_FILE tidak ditemukan!"
    echo "Unduh file konfigurasi VPN (.ovpn) terlebih dahulu."
    exit 1
fi

# Jalankan OpenVPN
echo -e "[INFO] Menghubungkan ke server VPN..."
openvpn --config "$CONFIG_FILE" &

# Tunggu beberapa detik untuk koneksi VPN
sleep 5
clear
# Cek IP Publik
echo -e "[INFO] Memeriksa IP Address..."
PROTECTED_IP=$(curl -s ifconfig.me)
echo -e "[SUCCESS] IP Address Anda sekarang dilindungi: $PROTECTED_IP"
