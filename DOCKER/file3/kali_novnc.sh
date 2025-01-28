#!/bin/bash

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

echo -e "${GREEN}Setting up Docker Kali Linux with Purple noVNC...${NC}"

# Step 1: Install Docker if not already installed
if ! command -v docker &> /dev/null; then
    echo -e "${RED}Docker not found! Installing...${NC}"
    curl -fsSL https://get.docker.com -o get-docker.sh
    sh get-docker.sh
    rm get-docker.sh
    echo -e "${GREEN}Docker installed!${NC}"
else
    echo -e "${GREEN}Docker is already installed.${NC}"
fi

# Step 2: Pull Kali Linux Docker image
echo -e "${GREEN}Pulling Kali Linux Docker image...${NC}"
docker pull kalilinux/kali-rolling

# Step 3: Run the Kali Linux container with noVNC
echo -e "${GREEN}Starting Kali Linux container with noVNC...${NC}"
docker run -d --name kali_novnc -p 8080:8080 kalilinux/kali-rolling /bin/bash -c "\
apt update && \
apt install -y novnc websockify && \
mkdir -p /root/.vnc && \
echo 'password' | vncpasswd -f > /root/.vnc/passwd && \
chmod 600 /root/.vnc/passwd && \
vncserver -geometry 1280x720 :1 && \
websockify --web=/usr/share/novnc/ 8080 localhost:5901"

echo -e "${GREEN}Kali Linux container is running with noVNC on port 8080.${NC}"

# Step 4: Install Ngrok if not already installed
if ! command -v ngrok &> /dev/null; then
    echo -e "${RED}Ngrok not found! Installing...${NC}"
    curl -s https://ngrok-agent.s3.amazonaws.com/ngrok.asc | sudo tee /etc/apt/trusted.gpg.d/ngrok.asc >/dev/null
    echo "deb https://ngrok-agent.s3.amazonaws.com buster main" | sudo tee /etc/apt/sources.list.d/ngrok.list >/dev/null
    sudo apt update && sudo apt install ngrok
    echo -e "${GREEN}Ngrok installed!${NC}"
else
    echo -e "${GREEN}Ngrok is already installed.${NC}"
fi

# Step 5: Start Ngrok with the Docker container's port
echo -e "${GREEN}Starting Ngrok on port 8080...${NC}"
read -p "Enter your Ngrok auth token: " NGROK_AUTH_TOKEN
ngrok config add-authtoken $NGROK_AUTH_TOKEN
ngrok http 8080 &

echo -e "${GREEN}Kali Linux with Purple noVNC is set up and accessible via Ngrok.${NC}"
echo -e "${GREEN}Use 'docker logs kali_novnc' to view logs and troubleshoot.${NC}"
