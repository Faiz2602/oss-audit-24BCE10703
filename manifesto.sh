#!/bin/bash
# ============================================================
# Script 5: Open Source Manifesto Generator
# Author: FAIZ KHAN | Reg No: 24BCE10703
# Course: Open Source Software | VIT Bhopal University
# Description: Interactively asks the user three questions about
#              their open-source beliefs, then composes a personal
#              manifesto and saves it to a .txt file.
# ============================================================

# alias note: In production environments, developers often define
# aliases like: alias savemanifesto='./manifesto.sh'
# to make frequently-used scripts easier to call.

echo "============================================"
echo " Open Source Manifesto Generator"
echo "============================================"
echo ""
echo "Answer three questions to build your personal"
echo "open-source philosophy statement."
echo ""

# --- Collect user input using read ---
read -p "1. Name one open-source tool you use every day: " TOOL
read -p "2. In your own words, what does 'freedom' mean in software? " FREEDOM
read -p "3. What is one thing you would build and share freely? " BUILD

# --- Gather metadata for the manifesto ---
DATE=$(date '+%d %B %Y')            # Human-readable date (e.g., 29 March 2026)
AUTHOR=$(whoami)                    # Get the current username automatically
OUTPUT="manifesto_${AUTHOR}.txt"   # Output filename includes the username

# --- Compose the manifesto and write to file using > (overwrite) ---
echo "On $DATE, I commit to the principles of open-source software." > "$OUTPUT"

# Append additional lines using >> (append mode)
echo "" >> "$OUTPUT"
echo "I believe that freedom in software means: $FREEDOM." >> "$OUTPUT"
echo "Every day, I rely on $TOOL — a tool built openly and shared freely." >> "$OUTPUT"
echo "Inspired by this, I aim to build $BUILD and release it for anyone to use," >> "$OUTPUT"
echo "modify, and improve, because knowledge grows when it is shared." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "Open source is not just a license. It is a way of thinking —" >> "$OUTPUT"
echo "that collaboration beats competition, and transparency beats secrecy." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "Signed: $AUTHOR | $DATE" >> "$OUTPUT"

# --- Confirm save and display the manifesto ---
echo ""
echo "--------------------------------------------"
echo " Manifesto saved to: $OUTPUT"
echo "--------------------------------------------"
echo ""

# Display the saved file content using cat
cat "$OUTPUT"

echo ""
echo "============================================"

# Pause before exit
read -p "Press enter to exit..."
