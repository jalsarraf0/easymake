# easymake

A Bash script that installs essential development build tools across major Linux distributions.

## Features

- **Multi-distro support** — Ubuntu/Debian, Fedora/CentOS (dnf), CentOS/RHEL (yum), openSUSE, Arch Linux
- **Interactive menu** — prompts for your distribution; no flags or config required
- **Comprehensive toolset** — installs compilers, build systems, and common development libraries
- **Cache cleanup** — clears package manager cache after installation
- **Verification** — displays `make`, `git`, and `gcc` versions to confirm success

### Installed tools

Build tools: `make`, `gcc`, `g++`, `autoconf`, `automake`, `libtool`, `pkg-config`, `cmake`, `ninja`, `clang`, `bison`, `flex`

Libraries: `zlib`, `openssl`, `libcurl`, `libffi`, `libxml2`, `sqlite`, `ncurses`

## Usage

```bash
chmod +x easymake.sh
./easymake.sh
```

Running the script with no arguments opens an interactive menu. Select your distribution and the script handles the rest — system update, package installation, cache cleanup, and verification.

```bash
# Display help
./easymake.sh -h
```

## Requirements

- `sudo` privileges on the target system

## License

MIT License — Copyright (c) 2024 Jamal Al-Sarraf
