# OSS Audit Project — FAIZ KHAN | 24BCE10703

## Open Source Software — VIT Bhopal University

---

## 👤 Student Details

| Field | Details |
|---|---|
| **Name** | FAIZ KHAN |
| **Registration Number** | 24BCE10703 |
| **Slot** | E22 |
| **Software Chosen** | Python (Programming Language) |
| **License** | Python Software Foundation (PSF) License |

---

## 📜 Project Overview

This project is a structured audit of **Python**, one of the most widely used open-source programming languages in the world. The audit examines Python's origin story, the freedoms its license grants, its ethical dimensions, how it lives on a Linux system, and how it compares with its closest proprietary alternative (MATLAB).

Alongside the written report, five shell scripts demonstrate practical Linux command-line skills — covering system inspection, package checking, disk auditing, log analysis, and interactive input.

📄 **Project Report (PDF):** https://drive.google.com/drive/folders/1Q1Q8WSHS8BOOqg2ZRPPKgMD0LyuigSSj

---

## 📂 Repository Structure

```
oss-audit-[yourregno]/
├── README.md                         ← This file
├── Project_Report/
│   ├── Project_Report.pdf            ← Full written report (12–16 pages)
│   └── Readme.md                     ← This file (also inside Project_Report)
└── scripts/
    ├── system_identity.sh            ← Script 1: System Identity Report
    ├── package_inspector.sh          ← Script 2: FOSS Package Inspector
    ├── disk_auditor.sh               ← Script 3: Disk and Permission Auditor
    ├── log_analyzer.sh               ← Script 4: Log File Analyzer
    ├── manifesto.sh                  ← Script 5: Open Source Manifesto Generator
    ├── sample.log                    ← Sample log file for testing Script 4
    └── manifesto_[yourname].txt      ← Sample output from Script 5
```

---

## 📝 Scripts Description

### 1. `system_identity.sh` — System Identity Report
**What it does:**
Displays a formatted welcome screen showing system information including kernel version, Linux distribution name, current logged-in user, home directory, system uptime, current date/time, and the GPL license note for the OS.

**Concepts used:**
- Shell variables
- Command substitution with `$()`
- `uname`, `whoami`, `uptime`, `date`, `lsb_release`
- Formatted output with `echo`

---

### 2. `package_inspector.sh` — FOSS Package Inspector
**What it does:**
Detects the package manager available on the current system (dpkg for Debian-based, rpm for RPM-based), checks whether `python3` is installed, prints version information, and uses a `case` statement to print a philosophy note about different FOSS packages.

**Concepts used:**
- `if-elif-else` branching
- `case` statement
- Package manager detection (`dpkg`, `rpm`)
- Piping with `grep`
- Command availability check with `command -v`

---

### 3. `disk_auditor.sh` — Disk and Permission Auditor
**What it does:**
Loops through a list of important system directories (`/etc`, `/var/log`, `/home`, `/usr/bin`, `/tmp`) and reports the permissions, owner, group, and disk usage of each. Also specifically checks for Python's system library directory and its details.

**Concepts used:**
- Bash arrays and `for` loops
- Directory existence check with `[ -d ]`
- `ls -ld` for permissions
- `awk` for field extraction
- `du -sh` for disk usage
- `2>/dev/null` error suppression

---

### 4. `log_analyzer.sh` — Log File Analyzer
**What it does:**
Reads a log file (passed as command-line argument `$1`) line-by-line, counts how many lines contain a keyword (default: `error`, or any keyword passed as `$2`), displays the total count, and prints the last 5 matching lines.

**Concepts used:**
- Command-line arguments (`$1`, `$2`)
- Default parameter values (`${var:-default}`)
- File existence check with `[ ! -f ]`
- `while IFS= read -r` loop for line-by-line reading
- Counter variable and arithmetic with `$(())`
- `grep -i` for case-insensitive matching
- `tail` to limit output to last N lines

---

### 5. `manifesto.sh` — Open Source Manifesto Generator
**What it does:**
Interactively asks the user three questions about their open-source philosophy, then composes a personalised manifesto paragraph and saves it to a `.txt` file named after the current system user. The file is then displayed using `cat`.

**Concepts used:**
- Interactive user input with `read -p`
- Date formatting with `date '+%d %B %Y'`
- Dynamic filename construction using `$(whoami)`
- File writing with `>` (overwrite) and `>>` (append)
- `cat` to display saved file

---

## ⚙️ How to Run the Scripts — Step-by-Step

### Step 1: Set up Linux
Use Ubuntu, Kali Linux, WSL (Windows Subsystem for Linux), or any Debian-based distro. Open a terminal.

### Step 2: Clone the repository
```bash
git clone https://github.com/[yourgithubusername]/oss-audit-[yourregno].git
cd oss-audit-[yourregno]
```

### Step 3: Give execute permissions to all scripts
```bash
chmod +x scripts/*.sh
```

### Step 4: Run each script

**▶ Script 1 — System Identity Report**
```bash
./scripts/system_identity.sh
```

**▶ Script 2 — FOSS Package Inspector**
```bash
./scripts/package_inspector.sh
```

**▶ Script 3 — Disk and Permission Auditor**
```bash
./scripts/disk_auditor.sh
```
> Note: Some directories like `/var/log` may require `sudo` for accurate size readings.
> Run as: `sudo ./scripts/disk_auditor.sh`

**▶ Script 4 — Log File Analyzer (requires a log file)**
```bash
# Using the included sample log file:
./scripts/log_analyzer.sh scripts/sample.log

# With a custom keyword:
./scripts/log_analyzer.sh scripts/sample.log warning

# Using a real system log:
./scripts/log_analyzer.sh /var/log/syslog error
```

**▶ Script 5 — Open Source Manifesto Generator**
```bash
./scripts/manifesto.sh
```
Follow the interactive prompts. A file named `manifesto_FAIZ_KHAN.txt` will be created in the current directory.

---

## 📦 Dependencies Required

| Dependency | Purpose | Install Command |
|---|---|---|
| Bash (≥ 4.0) | Shell interpreter | Pre-installed on Linux |
| `uname` | Kernel info | Pre-installed (coreutils) |
| `whoami` | Current user | Pre-installed (coreutils) |
| `uptime` | System uptime | Pre-installed (procps) |
| `lsb_release` | Distro name | `sudo apt install lsb-release` |
| `du` | Disk usage | Pre-installed (coreutils) |
| `grep` | Text search | Pre-installed |
| `awk` | Field extraction | Pre-installed (gawk) |
| `dpkg` or `rpm` | Package checking | Pre-installed on respective distros |
| `python3` | Software being audited | `sudo apt install python3` |

> **Tested on:** Ubuntu 22.04 LTS, Kali Linux 2024.1, Debian 12

---

## ⚠️ Notes

- Scripts must be run on a **real Linux system or VM** — not on Windows directly (unless using WSL)
- Script 3 (`disk_auditor.sh`) may show more accurate results when run with `sudo`
- Script 4 (`log_analyzer.sh`) needs a valid log file path as the first argument
- Script 5 will create a `manifesto_FAIZ_KHAN.txt` file in whatever directory you run it from
- All scripts include `read -p "Press enter to exit..."` at the end — press Enter when done

---

## 🚀 Conclusion

This project demonstrates how open-source software like Python integrates deeply with Linux systems and how shell scripting bridges the gap between philosophy and practice. Python's existence as free, open, and community-governed software is not accidental — it is the result of deliberate decisions that shaped how the entire modern software ecosystem developed. Understanding those decisions is part of understanding what it means to work in technology today.

---

*Submitted as part of the Open Source Software (OSS NGMC) evaluated course project — VIT Bhopal University, March 2026.*
