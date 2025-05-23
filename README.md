# 🔥 ShadedKaal 🔥

<div align="center">
  <img src="https://img.shields.io/badge/OFFENSIVE-SECURITY-red?style=for-the-badge"/>
  <img src="https://img.shields.io/badge/LANGUAGE-BASH-brightgreen?style=for-the-badge"/>
  <img src="https://img.shields.io/badge/VERSION-0.5.3-blue?style=for-the-badge"/>
  <img src="https://img.shields.io/badge/LICENSE-GPL--3.0-orange?style=for-the-badge"/>
  <br><br>
</div>

```
███████╗██╗  ██╗ █████╗ ██████╗ ███████╗██████╗ ██╗  ██╗ █████╗  █████╗ ██╗     
██╔════╝██║  ██║██╔══██╗██╔══██╗██╔════╝██╔══██╗██║ ██╔╝██╔══██╗██╔══██╗██║     
███████╗███████║███████║██║  ██║█████╗  ██║  ██║█████╔╝ ███████║███████║██║     
╚════██║██╔══██║██╔══██║██║  ██║██╔══╝  ██║  ██║██╔═██╗ ██╔══██║██╔══██║██║     
███████║██║  ██║██║  ██║██████╔╝███████╗██████╔╝██║  ██╗██║  ██║██║  ██║███████╗
╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═════╝ ╚══════╝╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝
                                                                       v0.5.3
```

> **A powerful, lightweight offensive security framework for red team operations**

`ShadedKaal` is a minimalist yet potent terminal-based offensive security tool designed for security professionals, pentesters, and ethical hackers. With its sleek ASCII interface and powerful modular design, it provides multiple offensive capabilities within a single framework.

## ⚡ Features

- **Advanced Reconnaissance**
- **Subdomain Takeover Detection**
- **CVE Exploitation Framework**
- **Modular Architecture**
- **Stealth Mode**
- **Seamless Workflow**

## 📸 Screenshots

<div align="center">
  <table>
    <tr>
      <td><img src="https://github.com/Kaal-Misconfig/ShadedKaal/blob/main/Screenshot%202025-05-09%20180250.png?raw=true" alt="ShadedKaal Main Menu"/></td>
      <td><img src="https://github.com/Kaal-Misconfig/ShadedKaal/blob/main/Screenshot%202025-05-09%20180310.png?raw=true" alt="Network Recon Module"/></td>
    </tr>
    <tr>
      <td><em>Main Interface</em></td>
      <td><em>Network Recon Module</em></td>
    </tr>
  </table>
</div>

## 🛠️ Installation

```bash
git clone https://github.com/kaal-misconfig/shadedkaal.git
cd ShadedKaal
sudo bash shadedkaal-install.sh
sudo bash shadedkaal-tool-fixed.sh
```

The installer automatically sets up all required dependencies including `nmap`, `curl`, `python3`, and other necessary tools.

## 🚀 Usage

### Main Menu
Launch ShadedKaal to access the main menu:

```
sudo bash shadedkaal-tool-fixed.sh
```

### Network Reconnaissance Module
Discover hosts, open ports, and services with advanced fingerprinting:

```bash
# From main menu
> Select option 1
```

### Subdomain Takeover Scanner
Identify vulnerable subdomains susceptible to takeover:

```bash
# From main menu
> Select option 2
```

### CVE Exploitation Framework
Test systems for known vulnerabilities with built-in proof-of-concept exploits:

```bash
# From main menu
> Select option 3
```

## 🔧 Advanced Configuration

ShadedKaal allows deep customization through its configuration file:

```bash
# Edit the configuration file
cd ShadedKaal
nano shadedkaal-tool-fixed.sh
```

Key configuration options:
- `scan_intensity`: Customize scan aggressiveness
- `threads`: Control parallel execution
- `output_format`: Select between JSON, XML, or plain text outputs
- `proxy_settings`: Configure proxy for stealth operations
- `custom_nmap_args`: Pass custom arguments to underlying Nmap scans

## 📝 Module Development

ShadedKaal is designed to be easily extendable. Create your own offensive modules:

1. Create a module file in the `modules/` directory
2. Implement the required functions: `init()`, `run()`, and `cleanup()`
3. Add module metadata for integration with the main menu

Example module template:
```bash
function init() {
    # Setup code
    echo "[+] Initializing custom scan module"
}

function run() {
    # Main functionality
    echo "[+] Running custom scan against $1"
}

function cleanup() {
    # Cleanup resources
    echo "[+] Cleaning up resources"
}

```

## ⚠️ Legal Disclaimer

ShadedKaal is provided for educational and professional security assessment purposes ONLY. Usage of ShadedKaal for attacking targets without prior mutual consent is illegal. It is the end user's responsibility to obey all applicable local, state, and federal laws. Developers assume no liability and are not responsible for any misuse or damage caused by this program.

## 📊 Upcoming Features

- [ ] Wireless attack module
- [ ] API endpoint fuzzing capabilities
- [ ] Social engineering toolkit integration
- [ ] Credential harvesting module
- [ ] C2 server interface

## 🤝 Contributing

Contributions are what make the open-source community an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

## 🌟 Author

Created with ☕ and 💻 by Kaal-Misconfig

[![Twitter](https://img.shields.io/badge/-Twitter-1DA1F2?style=flat-square&logo=twitter&logoColor=white)](https://x.com/kaalmisconfig)
[![GitHub](https://img.shields.io/badge/-GitHub-181717?style=flat-square&logo=github&logoColor=white)](https://github.com/kaal-misconfig)
