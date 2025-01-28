#!/bin/bash

# Script ini menginstal Xrdp dan Ngrok, kemudian mengekspos RDP ke IP publik dengan autentikasi menggunakan user dan password

# Update sistem
echo -e "Updating system..."
sudo apt update && sudo apt upgrade -y

# Install Xrdp (RDP server)
echo -e "Installing Xrdp..."
sudo apt install -y xrdp

# Install Ngrok
echo -e "Installing Ngrok..."
sudo apt install -y snapd
sudo snap install ngrok

# Start dan enable Xrdp untuk otomatis berjalan saat boot
echo -e "Starting and enabling Xrdp service..."
sudo systemctl start xrdp
sudo systemctl enable xrdp

# Membuka port RDP (3389)
echo -e "Allowing RDP port through firewall..."
sudo ufw allow 3389/tcp

# Set konfigurasi Xrdp agar menggunakan session default
echo -e "Setting Xrdp configuration..."
echo -e "startxfce4" > ~/.xsession

# Mengonfigurasi user untuk RDP
read -p "Masukkan username yang ingin digunakan untuk login RDP: " username
sudo adduser --disabled-password --gecos "" $username
sudo passwd $username

# Autentikasi Ngrok (gunakan token dari ngrok.com)
echo -e "Masukkan token autentikasi Ngrok Anda (dapatkan di https://ngrok.com/):"
read ngrok_token
ngrok authtoken $ngrok_token

# Menjalankan Ngrok untuk mengekspos RDP
echo -e "Starting Ngrok to expose RDP port (3389)..."
nohup ngrok tcp 3389 &

# Menampilkan informasi IP publik Ngrok
echo -e "Ngrok tunnel started. Akses RDP menggunakan alamat berikut:"
echo -e "tcp://$(curl -s localhost:4040/api/tunnels | jq -r .tunnels[0].public_url)"
