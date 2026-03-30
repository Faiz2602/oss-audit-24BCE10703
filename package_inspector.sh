#!/bin/bash
# ============================================================
# Script 2: FOSS Package Inspector
# Author: FAIZ KHAN | Reg No: 24BCE10703
# Course: Open Source Software | VIT Bhopal University
# Description: Detects the package manager available on the system,
#              checks if Python is installed, shows version and license info,
#              and uses a case statement to print philosophy notes.
# ============================================================

# --- Define the package to inspect ---
PACKAGE="python3"   # Our audited software is Python

# --- Detect which package manager is available and check installation ---
echo "============================================"
echo " FOSS Package Inspector"
echo "============================================"
echo ""

# Check for Debian-based systems (Ubuntu, Kali, etc.)
if command -v dpkg &>/dev/null; then
    if dpkg -l | grep -qw "$PACKAGE"; then
        echo "[OK] $PACKAGE is installed (Debian-based system)."
        PYVERSION=$(python3 --version 2>&1)
        echo "     Version : $PYVERSION"
    else
        echo "[!!] $PACKAGE is NOT installed on this system."
    fi

# Check for RPM-based systems (Fedora, CentOS, RHEL)
elif command -v rpm &>/dev/null; then
    if rpm -q "$PACKAGE" &>/dev/null; then
        echo "[OK] $PACKAGE is installed (RPM-based system)."
        rpm -qi "$PACKAGE" | grep -E 'Version|License|Summary'
    else
        echo "[!!] $PACKAGE is NOT installed on this system."
    fi

# Fallback: check if python3 or python command exists (Windows/Git Bash/others)
else
    if command -v python3 &>/dev/null; then
        echo "[OK] $PACKAGE is available on this system."
        python3 --version
    elif command -v python &>/dev/null; then
        echo "[OK] python (as 'python') is available."
        python --version
    else
        echo "[!!] $PACKAGE is NOT installed or not found in PATH."
    fi
fi

echo ""
echo "--------------------------------------------"
echo " FOSS Philosophy Notes"
echo "--------------------------------------------"

# --- Case statement to print philosophy note based on package name ---
case $PACKAGE in
    python3|python)
        echo "Python: born from a community, shaped by one guiding principle —"
        echo "        code should be readable by humans, not just machines."
        echo "        License: Python Software Foundation (PSF) License — open and permissive."
        ;;
    git)
        echo "Git: Linus Torvalds built it in two weeks because proprietary tools"
        echo "     failed the Linux kernel project. Freedom from vendor lock-in."
        ;;
    apache2|httpd)
        echo "Apache HTTP Server: the open web server that proved open source"
        echo "could power the internet better than any proprietary alternative."
        ;;
    mysql|mariadb)
        echo "MySQL/MariaDB: a dual-license story — showing open source can"
        echo "coexist with commercial models, for better or worse."
        ;;
    firefox)
        echo "Firefox: a nonprofit browser fighting to keep the web open,"
        echo "standing against browser monopolies since 2004."
        ;;
    vlc)
        echo "VLC: built by students in Paris who just wanted to watch video"
        echo "over a university network. Community-built, plays everything."
        ;;
    *)
        echo "$PACKAGE: an open-source tool contributing to the free software ecosystem."
        ;;
esac

echo "============================================"

# Pause before exit
read -p "Press enter to exit..."