#!/bin/bash

# Function to display help (man page)
display_help() {
    echo "NAME
       easymake.sh - Automates installation of development tools for various Linux distributions

SYNOPSIS
       ./easymake.sh [OPTIONS]

DESCRIPTION
       A script to simplify the process of installing essential development tools and libraries required for building
       software on various Linux distributions. It automatically detects the distribution and applies appropriate commands.

OPTIONS
       -h, --help
              Display this help message and exit.

USAGE
       Run the script without options, and follow the interactive menu to select your Linux distribution.

EXAMPLES
       1. Display help:
           ./easymake.sh -h

       2. Run the script to install tools interactively:
           ./easymake.sh

AUTHOR
       Written by [Your Name]. Contributions and feedback are welcome.

LICENSE
       Distributed under the MIT License. For details, see LICENSE.

REPORTING BUGS
       Report issues at https://github.com/your-repo/issues
"
}

# Parse arguments for -h or --help
if [[ $1 == "-h" || $1 == "--help" ]]; then
    display_help
    exit 0
fi

# CLI menu for selecting the Linux distribution
echo "Select your Linux distribution:"
echo "1) Ubuntu/Debian"
echo "2) Fedora/CentOS (dnf)"
echo "3) CentOS/RHEL (yum)"
echo "4) openSUSE"
echo "5) Arch Linux"
echo "6) Exit"

read -rp "Enter the number corresponding to your distribution: " distro_choice

case $distro_choice in
    1)
        echo "You selected Ubuntu/Debian."
        PKG_UPDATE="sudo apt update -y"
        PKG_INSTALL="sudo apt install -y"
        ;;
    2)
        echo "You selected Fedora/CentOS (dnf)."
        PKG_UPDATE="sudo dnf update -y"
        PKG_INSTALL="sudo dnf install -y"
        ;;
    3)
        echo "You selected CentOS/RHEL (yum)."
        PKG_UPDATE="sudo yum update -y"
        PKG_INSTALL="sudo yum install -y"
        ;;
    4)
        echo "You selected openSUSE."
        PKG_UPDATE="sudo zypper refresh"
        PKG_INSTALL="sudo zypper install -y"
        ;;
    5)
        echo "You selected Arch Linux."
        PKG_UPDATE="sudo pacman -Syu --noconfirm"
        PKG_INSTALL="sudo pacman -S --noconfirm"
        ;;
    6)
        echo "Exiting script."
        exit 0
        ;;
    *)
        echo "Invalid choice. Exiting."
        exit 1
        ;;
esac

# Update the system
echo "Updating system..."
eval "$PKG_UPDATE"

# Install essential development tools
echo "Installing essential development tools..."
if [[ $distro_choice -eq 1 ]]; then
    # Ubuntu/Debian-specific group install
    eval "$PKG_INSTALL build-essential"
elif [[ $distro_choice -eq 2 || $distro_choice -eq 3 ]]; then
    # Fedora/CentOS-specific group install
    eval "$PKG_INSTALL @development-tools"
fi

# Install common packages for all distributions
echo "Installing additional tools and libraries required for building software..."
eval "$PKG_INSTALL git make gcc g++ autoconf automake libtool pkg-config cmake ninja clang bison flex zlib1g-dev libssl-dev libcurl4-openssl-dev libffi-dev libxml2-dev sqlite3 libncurses-dev"

# Arch-specific package adjustments
if [[ $distro_choice -eq 5 ]]; then
    eval "$PKG_INSTALL zlib openssl libcurl libffi libxml2 sqlite ncurses"
fi

# Clean up
echo "Cleaning up package cache..."
if [[ $distro_choice -eq 1 ]]; then
    sudo apt clean
elif [[ $distro_choice -eq 2 || $distro_choice -eq 3 ]]; then
    sudo dnf clean all
elif [[ $distro_choice -eq 4 ]]; then
    sudo zypper clean
elif [[ $distro_choice -eq 5 ]]; then
    sudo pacman -Scc --noconfirm
fi

# Verify installations
echo "Verifying installations..."
make --version
git --version
gcc --version

echo "All tools installed successfully. You're ready to build from source!"
