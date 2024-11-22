# Install Development Tools Script

## Overview
This Bash script, `install_dev_tools.sh`, is designed to simplify the setup process for essential development tools on various Linux distributions. It supports multiple distros by providing an interactive CLI menu for users to select their operating system, ensuring compatibility across Ubuntu/Debian, Fedora, CentOS, openSUSE, and Arch Linux.

The script installs a variety of tools and libraries required for compiling and building software from source.

---

## Features
- **Multi-Distro Support**: Supports Ubuntu/Debian, Fedora/CentOS (dnf and yum), openSUSE, and Arch Linux.
- **Interactive Menu**: A clean CLI menu allows users to select their Linux distribution easily.
- **Development Tool Installation**:
  - Build tools: `make`, `gcc`, `g++`, `autoconf`, `automake`, etc.
  - Dependency libraries: `zlib`, `openssl`, `libcurl`, `libffi`, `libxml2`, `sqlite`, `ncurses`.
  - Additional tools: `git`, `cmake`, `ninja`, `clang`, `bison`, `flex`.
- **Cache Management**: Cleans up package manager caches after installation to free disk space.
- **Verification**: Ensures that the installed tools are properly configured by displaying their versions.
- **Security Features**:
  - Runs package installations through the official package managers to ensure verified sources.
  - Reduces privilege risks by running the script as a regular user while using `sudo` for elevated commands.

---

## How It Works
1. **Interactive CLI Menu**:
   The script prompts the user to select their Linux distribution from a menu. This determines the appropriate package manager and installation commands.

2. **Package Installation**:
   Based on the selected distro, the script updates the system and installs the necessary development tools using the respective package manager:
   - Ubuntu/Debian: `apt`
   - Fedora/CentOS (dnf): `dnf`
   - CentOS/RHEL (yum): `yum`
   - openSUSE: `zypper`
   - Arch Linux: `pacman`

3. **Cache Cleanup**:
   After installation, the script clears cached package data using the distro-specific command.

4. **Verification**:
   The script verifies the installation of key tools (`make`, `git`, and `gcc`) by displaying their versions.

---

## Usage
### Prerequisites
- Ensure you have `sudo` privileges on your system.
- Make the script executable:
  ```bash
  chmod +x install_dev_tools.sh
