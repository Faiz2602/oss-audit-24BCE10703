#!/bin/bash
# ============================================================
# Script 1: System Identity Report
# Author: FAIZ KHAN | Reg No: 24BCE10703
# Course: Open Source Software | VIT Bhopal University
# Description: Displays a welcome-style system identity report
#              showing kernel, user, distro, uptime, and license info.
# ============================================================

# --- Student and software details ---
STUDENT_NAME="FAIZ KHAN"     
REG_NO="24BCE10703"           
SOFTWARE_CHOICE="Python"         # The open-source software chosen for audit

# --- Gather system information using command substitution ---
KERNEL=$(uname -r)               # Get Linux kernel version
USER_NAME=$(whoami)              # Get current logged-in username
HOME_DIR=$HOME                   # Get home directory of current user

# --- Portable uptime extraction (works on Git Bash and Linux) ---
if command -v uptime &>/dev/null; then
    # Try to get uptime without -p (Git Bash doesn't support -p)
    UPTIME=$(uptime | sed -E 's/^.*up ([^,]*),.*$/\1/' | xargs)
    if [ -z "$UPTIME" ]; then
        UPTIME="unknown"
    fi
else
    UPTIME="unknown"
fi

CURRENT_DATE=$(date)             # Get current date and time

# --- Get Linux distro name (works on most Debian/RPM systems) ---
if command -v lsb_release &>/dev/null; then
    DISTRO=$(lsb_release -d | cut -f2)
else
    DISTRO="Unknown (lsb_release not found)"
fi

# --- Display the system identity report ---
echo "========================================================"
echo "   Open Source Software Audit — $STUDENT_NAME"
echo "   Registration Number : $REG_NO"
echo "========================================================"
echo ""
echo "  Software Under Audit : $SOFTWARE_CHOICE"
echo "  Kernel Version       : $KERNEL"
echo "  Linux Distribution   : $DISTRO"
echo "  Logged-in User       : $USER_NAME"
echo "  Home Directory       : $HOME_DIR"
echo "  System Uptime        : $UPTIME"
echo "  Current Date & Time  : $CURRENT_DATE"
echo ""
echo "  License Note: This Linux system runs under the"
echo "  GNU General Public License (GPL) v2, ensuring"
echo "  users have the freedom to run, study, share,"
echo "  and modify the software."
echo "========================================================"

# Pause so user can read the output before terminal closes
read -p "Press enter to exit..."