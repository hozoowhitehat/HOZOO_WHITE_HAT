#!/bin/bash

# Tools untuk membuat Docker container Debian XFCE4 + noVNC
set -e

# Fungsi untuk memastikan Docker terinstal
check_docker() {
    if ! [ -x "$(command -v docker)" ]; then
        echo -e "Docker tidak ditemukan. Menginstal Docker..."
        sudo apt update
        sudo apt install -y docker.io
        sudo systemctl enable docker
        sudo systemctl start docker
    else
        echo -e "Docker sudah terinstal."
    fi
}

# Fungsi untuk membuat Docker image dengan Debian + XFCE4 Desktop + noVNC
create_docker_image() {
    echo -e "Membuat Dockerfile untuk Debian XFCE4 + noVNC..."
    cat <<EOF > Dockerfile
FROM debian:bullseye

# Set environment non-interaktif
ENV DEBIAN_FRONTEND=noninteractive

# Update dan Install XFCE4 Desktop, VNC Server, noVNC, dan dependencies
RUN apt update && apt install -y \
    xfce4 xfce4-goodies tightvncserver novnc websockify curl sudo wget && \
    apt clean && rm -rf /var/lib/apt/lists/*

# Buat user non-root
RUN useradd -m -s /bin/bash debianuser && echo "debianuser:password123" | chpasswd && adduser debianuser sudo

# Atur password untuk VNC
RUN mkdir -p /home/debianuser/.vnc && echo "vncpassword" | vncpasswd -f > /home/debianuser/.vnc/passwd && \
    chmod 600 /home/debianuser/.vnc/passwd && chown -R debianuser:debianuser /home/debianuser/.vnc

# Install noVNC web client
RUN mkdir -p /opt/novnc && \
    wget -qO- https://github.com/novnc/noVNC/archive/refs/tags/v1.4.0.tar.gz | tar xz --strip-components=1 -C /opt/novnc

# Salin script untuk menjalankan VNC dan noVNC
COPY start-vnc.sh /usr/local/bin/start-vnc.sh
COPY start-novnc.sh /usr/local/bin/start-novnc.sh
RUN chmod +x /usr/local/bin/start-vnc.sh /usr/local/bin/start-novnc.sh

# Port untuk VNC dan noVNC
EXPOSE 5901 6080

# Jalankan kedua server
CMD ["/bin/bash", "-c", "/usr/local/bin/start-vnc.sh && /usr/local/bin/start-novnc.sh"]
EOF

    echo -e "Membuat script untuk memulai VNC Server..."
    cat <<EOF > start-vnc.sh
#!/bin/bash
vncserver :1 -geometry 1280x720 -depth 24
EOF

    echo -e "Membuat script untuk memulai noVNC Server..."
    cat <<EOF > start-novnc.sh
#!/bin/bash
/opt/novnc/utils/novnc_proxy --vnc localhost:5901 --listen 6080
EOF

    echo -e "Membangun Docker image..."
    docker build -t debian-xfce4-novnc .
}

# Fungsi untuk menjalankan container
run_container() {
    echo -e "Menjalankan container Debian XFCE4 + noVNC..."
    docker run -d --name debian-xfce4-novnc -p 5901:5901 -p 6080:6080 debian-xfce4-novnc
    echo  -ev"Akses noVNC di: http://localhost:6080"
}

# Memulai proses
check_docker
create_docker_image
run_container
