#!/bin/bash


RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;36m'
PURPLE='\033[0;35m'
NC='\033[0m'
BOLD='\033[1m'

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


if [ "$EUID" -ne 0 ]; then
    echo -e "${RED}[!] This script must be run as root${NC}"
    exit 1
fi


CONFIG_DIR="$HOME/.shadedkaal"
LOGS_DIR="$CONFIG_DIR/logs"
RESULTS_DIR="$CONFIG_DIR/results"


install_packages() {
    echo -e "${YELLOW}[*] Detecting operating system...${NC}"
    
        if [ -f /etc/debian_version ]; then
        echo -e "${GREEN}[+] Debian/Ubuntu-based system detected${NC}"
        echo -e "${YELLOW}[*] Updating package lists...${NC}"
        apt update -y -q
        
        echo -e "${YELLOW}[*] Installing required packages...${NC}"
        apt install -y nmap curl python3 python3-pip gobuster whatweb git libssl-dev libffi-dev libpcap-dev dnsutils whois
        
        echo -e "${YELLOW}[*] Installing Python packages...${NC}"
        pip3 install requests colorama dnspython tqdm
        

    elif [ -f /etc/redhat-release ]; then
        echo -e "${GREEN}[+] RHEL/CentOS/Fedora system detected${NC}"
        echo -e "${YELLOW}[*] Installing required packages...${NC}"
        
        
        dnf -y install epel-release
        
        
        dnf -y install nmap curl python3 python3-pip git openssl-devel libffi-devel libpcap-devel bind-utils whois
        
        
        echo -e "${YELLOW}[*] Installing Go and gobuster...${NC}"
        dnf -y install golang
        go install github.com/OJ/gobuster/v3@latest
        
        
        echo -e "${YELLOW}[*] Installing whatweb...${NC}"
        gem install whatweb
        
        
        echo -e "${YELLOW}[*] Installing Python packages...${NC}"
        pip3 install requests colorama dnspython tqdm
        
    
    elif [ -f /etc/arch-release ]; then
        echo -e "${GREEN}[+] Arch Linux system detected${NC}"
        echo -e "${YELLOW}[*] Installing required packages...${NC}"
        pacman -Sy --noconfirm nmap curl python python-pip gobuster whatweb git openssl libffi libpcap bind whois
        
        
        echo -e "${YELLOW}[*] Installing Python packages...${NC}"
        pip3 install requests colorama dnspython tqdm
        
    
    elif grep -q "Kali" /etc/os-release; then
        echo -e "${GREEN}[+] Kali Linux detected${NC}"
        echo -e "${YELLOW}[*] Updating package lists...${NC}"
        apt update -y -q
        
        echo -e "${YELLOW}[*] Installing required packages...${NC}"
        apt install -y nmap curl python3 python3-pip gobuster whatweb git libssl-dev libffi-dev libpcap-dev dnsutils whois
        
        
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


create_directories() {
    echo -e "${YELLOW}[*] Creating necessary directories...${NC}"
    
    mkdir -p "$CONFIG_DIR"
    mkdir -p "$LOGS_DIR"  
    mkdir -p "$RESULTS_DIR"
    
    echo -e "${GREEN}[+] Directories created${NC}"
}


make_executable() {
    echo -e "${YELLOW}[*] Setting permissions...${NC}"
    
    chmod +x shadedkaal.sh
    
    echo -e "${GREEN}[+] Made shadedkaal.sh executable${NC}"
}


install_additional_tools() {
    echo -e "${YELLOW}[*] Installing additional offensive security tools...${NC}"
    
    
    TOOLS_DIR="$CONFIG_DIR/tools"
    mkdir -p "$TOOLS_DIR"
    
    
    echo -e "${YELLOW}[*] Installing subdomain takeover detection tools...${NC}"
    cd "$TOOLS_DIR"
    git clone https://github.com/Ice3man543/SubOver
    cd SubOver
    go build
    cd ..
    
    
    echo -e "${YELLOW}[*] Installing CVE search tools...${NC}"
    git clone https://github.com/vulnersCom/getsploit
    cd getsploit
    pip3 install -r requirements.txt
    python3 setup.py install
    cd ..
    
    echo -e "${GREEN}[+] Additional tools installed${NC}"
}


create_symlink() {
    echo -e "${YELLOW}[*] Creating system-wide command...${NC}"
    
    CURRENT_DIR=$(pwd)
    
    ln -sf "$CURRENT_DIR/shadedkaal.sh" /usr/local/bin/shadedkaal
    
    echo -e "${GREEN}[+] ShadedKaal is now available system-wide${NC}"
    echo -e "${BLUE}[i] You can run it by typing 'shadedkaal' from any directory${NC}"
}

echo -e "${YELLOW}[*] Starting ShadedKaal installation...${NC}"
echo

install_packages

create_directories

make_executable

read -p $'\e[36m[>]\e[0m Install additional offensive security tools? (y/n): ' install_tools
if [[ $install_tools == "y" || $install_tools == "Y" ]]; then
    install_additional_tools
fi

read -p $'\e[36m[>]\e[0m Make ShadedKaal available system-wide? (y/n): ' create_link
if [[ $create_link == "y" || $create_link == "Y" ]]; then
    create_symlink
fi

echo
echo -e "${GREEN}[+] ShadedKaal installation completed!${NC}"
echo -e "${BLUE}[i] Run './shadedkaal.sh' to start the tool${NC}"
echo
