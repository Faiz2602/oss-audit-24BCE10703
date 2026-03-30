#!/bin/bash
# ============================================================
# Script 3: Disk and Permission Auditor
# Author: FAIZ KHAN | Reg No: 24BCE10703
# Course: Open Source Software | VIT Bhopal University
# Description: Loops through important Linux directories and
#              reports disk usage, owner, and permissions for each.
#              Also checks for Python's config/install directory.
# ============================================================

# --- List of important system directories to audit ---
DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp")

echo "============================================"
echo " Directory & Permission Audit Report"
echo "============================================"
echo ""

# --- Loop through each directory in the list ---
for DIR in "${DIRS[@]}"; do
    if [ -d "$DIR" ]; then
        PERMS=$(ls -ld "$DIR" | awk '{print $1, $3, $4}')
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)
        echo "  $DIR"
        echo "    Permissions & Owner : $PERMS"
        echo "    Disk Usage          : $SIZE"
        echo ""
    else
        echo "  $DIR => does not exist on this system"
        echo ""
    fi
done

echo "--------------------------------------------"
echo " Python Config/Install Directory Check"
echo "--------------------------------------------"
echo ""

# --- Check for Python-related config directories ---
PYTHON_LIB_DIR=$(find /usr/lib -maxdepth 1 -name "python3*" -type d 2>/dev/null | head -1)

if [ -n "$PYTHON_LIB_DIR" ]; then
    PERMS=$(ls -ld "$PYTHON_LIB_DIR" | awk '{print $1, $3, $4}')
    SIZE=$(du -sh "$PYTHON_LIB_DIR" 2>/dev/null | cut -f1)
    echo "  Found Python library directory: $PYTHON_LIB_DIR"
    echo "    Permissions & Owner : $PERMS"
    echo "    Disk Usage          : $SIZE"
else
    echo "  No Python3 library directory found under /usr/lib"
fi

# Also check if the python3 binary exists in /usr/bin
if [ -f "/usr/bin/python3" ]; then
    echo ""
    echo "  Python binary found at /usr/bin/python3"
    ls -lh /usr/bin/python3
fi

echo ""
echo "============================================"

# Pause before exit
read -p "Press enter to exit..."