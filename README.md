
# 🔍 Get_Subdomains_Bash

![Bash](https://img.shields.io/badge/Language-Bash-4EAA25?style=for-the-badge&logo=gnu-bash&logoColor=white)
![Platform](https://img.shields.io/badge/Platform-Kali%20Linux%20%7C%20Termux-blue?style=for-the-badge)
![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)

A fast, lightweight, and efficient **Bash script** designed to collect and enumerate subdomains for target domains during reconnaissance and penetration testing phases.

---

## 📌 Features

- ⚡ **Lightweight & Fast:** Written in pure Bash with minimal dependencies.
- 📱 **Multi-Platform Support:** Works seamlessly on both **Kali Linux** and **Termux** (Android).
- 🛠️ **Easy Setup:** Simple installation and immediate execution.

---

## 🚀 Installation

### 💻 1. Kali Linux / Linux Distros

Run the following commands in your terminal:

```bash
# Clone the repository
git clone https://github.com/Dragon2029/Get_Subdomains_Bash.git

# Navigate to the tool directory
cd Get_Subdomains_Bash

# Grant execution permission
chmod +x Get_subdomains.sh

#📱 2. Termux (Android)
Follow these steps to set up the tool on Termux:
Step 1: Install Required Dependencies
pkg update && pkg upgrade -y
pkg install dnsutils -y

Step 2: Install Get_Subdomains
# Clone the repository
git clone https://github.com/Dragon2029/Get_Subdomains_Bash.git

# Navigate to the directory
cd Get_Subdomains_Bash

# Grant execution permission
chmod +x Get_subdomains.sh

💡 Usage
To run the script, pass the target domain as an argument:
# On Linux / Kali (with root privileges if required)
sudo ./Get_subdomains.sh example.com

# On Termux or standard bash shell
./Get_subdomains.sh example.com

📝 Example Output Command:
./Get_subdomains.sh target.com

📋 Requirements
 * bash
 * dnsutils (for DNS utilities like host / dig)
 * git

🤝 Contributing
Contributions, issues, and feature requests are welcome!
Feel free to check the issues page.

👤 Author
Dragon2029
 * GitHub: @Dragon2029
⭐ If you find this tool useful, don't forget to give it a star on GitHub!

