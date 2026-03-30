#!/bin/bash
# ============================================================
# Script 4: Log File Analyzer
# Author: FAIZ KHAN | Reg No: 24BCE10703
# Course: Open Source Software | VIT Bhopal University
# Description: Reads a log file line-by-line, counts occurrences
#              of a keyword (default: "error"), prints a summary,
#              and shows the last 5 matching lines.
# Usage: ./log_analyzer.sh <log_file_path> [keyword]
# Example: ./log_analyzer.sh /var/log/syslog error
# ============================================================

# --- Read command-line arguments ---
LOGFILE=$1              # First argument: path to the log file
KEYWORD=${2:-"error"}   # Second argument: keyword to search (default: "error")
COUNT=0                 # Counter variable to track how many matches we find

# --- Check if a log file argument was provided ---
if [ -z "$LOGFILE" ]; then
    echo "Usage: ./log_analyzer.sh <logfile> [keyword]"
    echo "Example: ./log_analyzer.sh /var/log/syslog error"
    exit 1
fi

# --- Check if the file actually exists ---
if [ ! -f "$LOGFILE" ]; then
    echo "Error: Log file '$LOGFILE' not found."
    echo "Please provide a valid file path."
    exit 1
fi

# --- Check if the file is empty; if so, warn user ---
if [ ! -s "$LOGFILE" ]; then
    echo "Warning: The file '$LOGFILE' is empty. No lines to analyze."
    exit 0
fi

echo "============================================"
echo " Log File Analyzer"
echo "============================================"
echo "  File    : $LOGFILE"
echo "  Keyword : '$KEYWORD'"
echo "--------------------------------------------"
echo ""

# --- Read the log file line by line using a while-read loop ---
# IFS= prevents leading/trailing whitespace from being stripped
# -r flag prevents backslash interpretation
while IFS= read -r LINE; do
    # Check if this line contains the keyword (case-insensitive with -i flag)
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))   # Increment counter each time keyword is found
    fi
done < "$LOGFILE"   # Redirect the file into the while loop as input

# --- Display the summary count ---
echo "  Result: Keyword '$KEYWORD' was found $COUNT time(s)."
echo ""

# --- Show the last 5 lines that matched the keyword ---
echo "--------------------------------------------"
echo " Last 5 Matching Lines:"
echo "--------------------------------------------"
MATCHES=$(grep -i "$KEYWORD" "$LOGFILE")

if [ -z "$MATCHES" ]; then
    echo "  No matching lines found."
else
    # Use tail to show only the last 5 matching lines
    echo "$MATCHES" | tail -5
fi

echo ""
echo "============================================"

# Pause before exit
read -p "Press enter to exit..."
