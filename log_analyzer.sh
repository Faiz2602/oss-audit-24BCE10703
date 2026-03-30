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

LOGFILE=$1
KEYWORD=${2:-"error"}
COUNT=0

if [ -z "$LOGFILE" ]; then
    echo "Usage: ./log_analyzer.sh <logfile> [keyword]"
    echo "Example: ./log_analyzer.sh /var/log/syslog error"
    exit 1
fi

if [ ! -f "$LOGFILE" ]; then
    echo "Error: Log file '$LOGFILE' not found."
    echo "Please provide a valid file path."
    exit 1
fi

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

while IFS= read -r LINE; do
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))
    fi
done < "$LOGFILE"

echo "  Result: Keyword '$KEYWORD' was found $COUNT time(s)."
echo ""

echo "--------------------------------------------"
echo " Last 5 Matching Lines:"
echo "--------------------------------------------"
MATCHES=$(grep -i "$KEYWORD" "$LOGFILE")

if [ -z "$MATCHES" ]; then
    echo "  No matching lines found."
else
    echo "$MATCHES" | tail -5
fi

echo ""
echo "============================================"

read -p "Press enter to exit..."