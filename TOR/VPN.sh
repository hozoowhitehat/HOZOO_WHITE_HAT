#!/bin/bash

echo -e "==========================="
echo -e "    VPN Japan Proxy Tool   "
echo -e "==========================="
sleep 2
clear
# Perbarui dan install paket
echo -e "[INFO] Mengupdate paket..."
pkg update && pkg upgrade -y
sleep 2
clear
# Pastikan OpenVPN terpasang
echo -e "[INFO] Memeriksa OpenVPN..."
pkg install openvpn -y
sleep 1 
clear
# Jalankan OpenVPN dengan konfigurasi
echo -e "[INFO] Menjalankan OpenVPN dengan server Jepang..."
openvpn --config japan.ovpn
sleep 3 
clear
echo "[INFO] Koneksi VPN telah selesai!"
