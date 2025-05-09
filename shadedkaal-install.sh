#!/bin/bash

# ------------------------------------------------
# ShadedKaal - Installation Script
# Author: Claude
# Version: 1.0.0
# ------------------------------------------------

# ANSI color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;36m'
PURPLE='\033[0;35m'
NC='\033[0m' # No Color
BOLD='\033[1m'

# Print banner
echo -e "${RED}"
cat << "EOF"
███████╗██╗  ██╗ █████╗ ██████╗ ███████╗██████╗ ██╗  ██╗ █████╗  █████╗ ██╗     
██╔════╝██║  ██║██╔══██╗██╔══██╗██╔════╝██╔══██╗██║ ██╔╝██╔══██╗██╔══██╗██║     
███████╗███████║███████║██║  ██║█████╗  ██║  ██║█████╔╝ ███████║███████║██║     
╚════██║██╔══██║██╔══██║██║  ██║██╔══╝  ██║  ██║██╔═██╗ ██╔══██║██╔══██║██║     
███████║██║  ██║██║  ██║██████╔╝███████╗██████╔╝██║  ██╗██║  ██║██║  ██║███████╗
╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═════╝ ╚══════╝╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝
EOF
echo -e "${NC}"
echo -e "${YELLOW}${BOLD}  [ Installation Script ]${NC}"
echo -e "${BLUE}  [ Version 1.0.0 ]                         [ github.com/shadedkaal ]${NC}"
echo

# Check if running as root
if [ "$EUID" -ne 0 ]; then
    echo -e "${RED}[!] This script must be run as root${NC}"
    exit 1
fi

# Config directory
CONFIG_DIR="$HOME/.shadedkaal"
LOGS_DIR="$CONFIG_DIR/logs"
RESULTS_DIR="$CONFIG_DIR/results"

# Function to install required packages based on distribution
install_packages() {
    echo -e "${YELLOW}[*] Detecting operating system...${NC}"
    
    # Check if we're on Debian/Ubuntu or derivatives
    if [ -f /etc/debian_version ]; then
        echo -e "${GREEN}[+] Debian/Ubuntu-based system detected${NC}"
        echo -e "${YELLOW}[*] Updating package lists...${NC}"
        apt update -y -q
        
        echo -e "${YELLOW}[*] Installing required packages...${NC}"
        apt install -y nmap curl python3 python3-pip gobuster whatweb git libssl-dev libffi-dev libpcap-dev dnsutils whois
        
        # Install Python packages
        echo -e "${YELLOW}[*] Installing Python packages...${NC}"
        pip3 install requests colorama dnspython tqdm
        
    # Check if we're on RHEL/CentOS/Fedora
    elif [ -f /etc/redhat-release ]; then
        echo -e "${GREEN}[+] RHEL/CentOS/Fedora system detected${NC}"
        echo -e "${YELLOW}[*] Installing required packages...${NC}"
        
        # Install EPEL repository if not already installed
        dnf -y install epel-release
        
        # Install required packages
        dnf -y install nmap curl python3 python3-pip git openssl-devel libffi-devel libpcap-devel bind-utils whois
        
        # Install gobuster using go
        echo -e "${YELLOW}[*] Installing Go and gobuster...${NC}"
        dnf -y install golang
        go install github.com/OJ/gobuster/v3@latest
        
        # Install whatweb
        echo -e "${YELLOW}[*] Installing whatweb...${NC}"
        gem install whatweb
        
        # Install Python packages
        echo -e "${YELLOW}[*] Installing Python packages...${NC}"
        pip3 install requests colorama dnspython tqdm
        
    # Check if we're on Arch Linux
    elif [ -f /etc/arch-release ]; then
        echo -e "${GREEN}[+] Arch Linux system detected${NC}"
        echo -e "${YELLOW}[*] Installing required packages...${NC}"
        pacman -Sy --noconfirm nmap curl python python-pip gobuster whatweb git openssl libffi libpcap bind whois
        
        # Install Python packages
        echo -e "${YELLOW}[*] Installing Python packages...${NC}"
        pip3 install requests colorama dnspython tqdm
        
    # Check if we're on Kali Linux (which is Debian-based but may have specific packages)
    elif grep -q "Kali" /etc/os-release; then
        echo -e "${GREEN}[+] Kali Linux detected${NC}"
        echo -e "${YELLOW}[*] Updating package lists...${NC}"
        apt update -y -q
        
        echo -e "${YELLOW}[*] Installing required packages...${NC}"
        apt install -y nmap curl python3 python3-pip gobuster whatweb git libssl-dev libffi-dev libpcap-dev dnsutils whois
        
        # Install Python packages
        echo -e "${YELLOW}[*] Installing Python packages...${NC}"
        pip3 install requests colorama dnspython tqdm
        
    else
        echo -e "${RED}[!] Unsupported operating system${NC}"
        echo -e "${YELLOW}[*] Please install the following packages manually:${NC}"
        echo -e "  - nmap"
        echo -e "  - curl"
        echo -e "  - python3 & pip3"
        echo -e "  - gobuster"
        echo -e "  - whatweb"
        echo -e "  - git"
        echo -e "  - dnsutils/bind-utils"
        echo -e "  - whois"
        
        echo -e "${YELLOW}[*] And the following Python packages:${NC}"
        echo -e "  - requests"
        echo -e "  - colorama"
        echo -e "  - dnspython"
        echo -e "  - tqdm"
    fi
}

# Create necessary directories
create_directories() {
    echo -e "${YELLOW}[*] Creating necessary directories...${NC}"
    
    mkdir -p "$CONFIG_DIR"
    mkdir -p "$LOGS_DIR"  
    mkdir -p "$RESULTS_DIR"
    
    echo -e "${GREEN}[+] Directories created${NC}"
}

# Make shadedkaal.sh executable
make_executable() {
    echo -e "${YELLOW}[*] Setting permissions...${NC}"
    
    chmod +x shadedkaal.sh
    
    echo -e "${GREEN}[+] Made shadedkaal.sh executable${NC}"
}

# Install additional tools
install_additional_tools() {
    echo -e "${YELLOW}[*] Installing additional offensive security tools...${NC}"
    
    # Create tools directory
    TOOLS_DIR="$CONFIG_DIR/tools"
    mkdir -p "$TOOLS_DIR"
    
    # Clone and install SubOver for subdomain takeover
    echo -e "${YELLOW}[*] Installing subdomain takeover detection tools...${NC}"
    cd "$TOOLS_DIR"
    git clone https://github.com/Ice3man543/SubOver
    cd SubOver
    go build
    cd ..
    
    # Download and install CVE search tool
    echo -e "${YELLOW}[*] Installing CVE search tools...${NC}"
    git clone https://github.com/vulnersCom/getsploit
    cd getsploit
    pip3 install -r requirements.txt
    python3 setup.py install
    cd ..
    
    echo -e "${GREEN}[+] Additional tools installed${NC}"
}

# Create symbolic link to make shadedkaal available system-wide
create_symlink() {
    echo -e "${YELLOW}[*] Creating system-wide command...${NC}"
    
    # Get the current directory
    CURRENT_DIR=$(pwd)
    
    # Create symlink in /usr/local/bin
    ln -sf "$CURRENT_DIR/shadedkaal.sh" /usr/local/bin/shadedkaal
    
    echo -e "${GREEN}[+] ShadedKaal is now available system-wide${NC}"
    echo -e "${BLUE}[i] You can run it by typing 'shadedkaal' from any directory${NC}"
}

# Main installation process
echo -e "${YELLOW}[*] Starting ShadedKaal installation...${NC}"
echo

# Install required packages
install_packages

# Create directories
create_directories

# Make script executable
make_executable

# Optional: Install additional tools
read -p $'\e[36m[>]\e[0m Install additional offensive security tools? (y/n): ' install_tools
if [[ $install_tools == "y" || $install_tools == "Y" ]]; then
    install_additional_tools
fi

# Create symbolic link
read -p $'\e[36m[>]\e[0m Make ShadedKaal available system-wide? (y/n): ' create_link
if [[ $create_link == "y" || $create_link == "Y" ]]; then
    create_symlink
fi

# Installation complete
echo
echo -e "${GREEN}[+] ShadedKaal installation completed!${NC}"
echo -e "${BLUE}[i] Run './shadedkaal.sh' to start the tool${NC}"
echo
