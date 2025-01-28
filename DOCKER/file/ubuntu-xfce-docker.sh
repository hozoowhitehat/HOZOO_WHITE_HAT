#!/bin/bash

# Tools untuk membuat Docker Ubuntu dengan XFCE4 Desktop

set -e

# Fungsi untuk memastikan Docker terinstal
check_docker() {
    if ! [ -x "$(command -v docker)" ]; then
        echo -e "Docker tidak ditemukan. Memulai instalasi Docker..."
        sudo apt update
        sudo apt install -y docker.io
        sudo systemctl enable docker
        sudo systemctl start docker
    else
        echo -e "Docker sudah terinstal."
    fi
}

# Fungsi untuk membuat Docker image dengan Ubuntu + XFCE4 Desktop
create_docker_image() {
    echo -e "Membuat Dockerfile untuk Ubuntu + XFCE4 Desktop..."
    cat <<EOF > Dockerfile
FROM ubuntu:20.04

# Set environment untuk non-interaktif
ENV DEBIAN_FRONTEND=noninteractive

# Update & Install XFCE4 Desktop, VNC Server, dan dependencies
RUN apt update && apt install -y xfce4 xfce4-goodies tightvncserver wget sudo && \
    apt clean && rm -rf /var/lib/apt/lists/*

# Buat user non-root untuk login
RUN useradd -m -s /bin/bash ubuntu && echo "ubuntu:ubuntu" | chpasswd && adduser ubuntu sudo

# Set VNC password
RUN mkdir -p /home/ubuntu/.vnc && echo "vncpassword" | vncpasswd -f > /home/ubuntu/.vnc/passwd && \
    chmod 600 /home/ubuntu/.vnc/passwd && chown -R ubuntu:ubuntu /home/ubuntu/.vnc

# Salin script untuk menjalankan VNC
COPY start-vnc.sh /usr/local/bin/start-vnc.sh
RUN chmod +x /usr/local/bin/start-vnc.sh

# Set working directory
WORKDIR /home/ubuntu

# Expose port VNC
EXPOSE 5901

# Default command
CMD ["/usr/local/bin/start-vnc.sh"]
EOF

    # Script untuk memulai VNC Server
    echo "Membuat script start-vnc.sh..."
    cat <<EOF > start-vnc.sh
#!/bin/bash
vncserver :1 -geometry 1280x720 -depth 24
tail -f /dev/null
EOF

    # Build Docker image
    echo "Membangun Docker image..."
    docker build -t ubuntu-xfce4 .
}

# Fungsi untuk menjalankan container
run_container() {
    echo "Menjalankan container Ubuntu + XFCE4 Desktop..."
    docker run -it -d -p 5901:5901 --name ubuntu-xfce4 ubuntu-xfce4
    echo "Container telah berjalan. Akses desktop dengan VNC Viewer menggunakan IP lokal dan port 5901."
    echo "Username: ubuntu | Password: ubuntu | VNC Password: vncpassword"
}

# Menu utama
main() {
    check_docker
    create_docker_image
    run_container
}

main
