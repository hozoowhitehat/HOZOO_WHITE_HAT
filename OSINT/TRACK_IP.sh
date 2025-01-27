#!/bin/bash

# Meminta input alamat IP dari pengguna
read -p "Enter IP address to track: " IP_ADDRESS

# Pilihan layanan API untuk pelacakan IP
echo -e "Choose the API service:"
echo -e "1. ipinfo.io (No API Key required)"
echo -e "2. ipstack (Requires API Key)"
echo "3. ip-api (Free but limited)"
read -p "Enter your choice (1, 2, or 3): " choice

# API Key untuk ipstack (jika memilih ipstack)
API_KEY="your_ipstack_api_key"  # Gantilah dengan API Key Anda

# Fungsi untuk melacak IP menggunakan ipinfo.io
track_ip_ipinfo() {
    echo -e "Tracking IP using ipinfo.io..."
    curl -s "https://ipinfo.io/$IP_ADDRESS/json" | jq .
}

# Fungsi untuk melacak IP menggunakan ipstack
track_ip_ipstack() {
    echo -e "Tracking IP using ipstack..."
    curl -s "http://api.ipstack.com/$IP_ADDRESS?access_key=$API_KEY" | jq .
}

# Fungsi untuk melacak IP menggunakan ip-api
track_ip_ipapi() {
    echo -e "Tracking IP using ip-api..."
    curl -s "http://ip-api.com/json/$IP_ADDRESS" | jq .
}

# Pilihan layanan pelacakan berdasarkan input pengguna
case $choice in
    1)
        track_ip_ipinfo
        ;;
    2)
        track_ip_ipstack
        ;;
    3)
        track_ip_ipapi
        ;;
    *)
        echo -e "Invalid choice. Please select a valid option."
        ;;
esac
