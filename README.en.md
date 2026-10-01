# 🌧 RainFall
(42 São Paulo)

Available in: [🇧🇷 Português](README.md)

![42 São Paulo](https://img.shields.io/badge/42-São_Paulo-black)
![Security](https://img.shields.io/badge/Focus-Cybersecurity-red)
![Language](https://img.shields.io/badge/Language-C_/_ASM_x86--64-blue)
![Status](https://img.shields.io/badge/Status-In_Progress-yellow)

This project is a deep introduction to ELF (Executable and Linkable Format) binary exploitation in x86-64 architecture. In a local **CTF (Capture The Flag)** format, the goal is to exploit classic memory corruption vulnerabilities to escalate privileges, facing modern system protections.

## 📜 Table of Contents

- [Overview](#-overview)
- [Challenge Structure](#%EF%B8%8F-challenge-structure)
- [Tools Used](#%EF%B8%8F-tools-used)
- [Repository Structure](#-repository-structure)
- [Levels and Vulnerabilities (Mandatory)](#-levels-and-vulnerabilities-mandatory)
- [Usage](#-usage)
- [Disclaimer](#%EF%B8%8F-disclaimer)
- [Author](#-author)

---

## 📖 Overview

**RainFall** drops you into a deliberately vulnerable Ubuntu Virtual Machine. Each level is a small SUID program written in C that mishandles its inputs. The goal is to break the execution of these binaries, take control of the execution flow, and read the password (`.pass`) of the next level.

As you progress, real security mitigations (NX, Stack Canaries, ASLR, RELRO, PIE) are enabled, requiring increasingly sophisticated exploitation techniques.

### 🎯 Learning Objectives

The project aims to develop the reverse engineering and low-level security "mindset":

1. **Read**: Patiently disassemble the binary and understand the memory layout byte by byte.
2. **Exploit**: Bend the binary to execute arbitrary code (shellcode) or reuse existing code (ROP).
3. **Bypass**: Defeat modern compiler and operating system defenses.

The main skills developed include:

-  🕵️ **Reverse Engineering:** Fluent reading of x86-64 Assembly and use of decompilers.
-  🛡️ **Memory Corruption:** Stack Buffer Overflows, Off-by-one errors, Format String Attacks, Integer Overflows.
-  🧩 **Advanced Techniques:** Return-Oriented Programming (ROP), ret2libc, Stack Pivoting.
-  🧱 **OS Mitigations:** Practical understanding of ASLR, NX (DEP), Canaries, PIE, and RELRO.

---

## 🏗️ Challenge Structure

The project scales in complexity with each level.

🟢 **Mandatory Part**
- **Level 00 to 09**: Fundamentals of Buffer Overflow, shellcode injection, and string formatting in progressive scenarios.
- **Level 10 (Boss Fight)**: The final mandatory test. All mitigations (NX, Canary, ASLR) enabled simultaneously. Requires chaining multiple exploits (memory leaks + ROP chain).

🔴 **Bonus Part**
- **Bonus 01 to 05**: Significantly harder challenges, introducing new paradigms like Heap exploitation (Use-After-Free, Heap Corruption) and dynamic bypasses.

🚩 **The Flag**

The goal of each level is to exploit the binary to act as the user of the next level (`flagXX`). Upon getting a shell or executing commands with these privileges, you must read the password file:

  ```bash
  cat /home/flagXX/.pass
  ```
> This will return the token to log in via SSH to the next level.

---

## 🛠️ Tools Used

During the resolution of the challenges, you will need to master the internal tools of the VM:

- **GDB (GNU Debugger):** The core of dynamic analysis (reading registers, stack frames, and flow).
- **Objdump / Readelf:** For deep static analysis and base address extraction.
- **Ltrace / Strace:** To intercept library and system calls.
- **Checksec:** To check which protections (NX, Canary, etc.) are active in the binary.
- **ROPgadget:** To locate useful return instructions (gadgets) when building ROP Chains.

---

## 📂 Repository Structure
Following 42's rules, we do not version binaries. The repository contains the flags and the scripts/resources used for the exploitation.

```text
.
├── level00/
│   ├── flag            # The password for the next level
│   └── resources/      # Python scripts, payloads, and exploit notes
├── level01/
├── level02/
├── ...
└── README.md
```

---

## 🚩 Levels and Vulnerabilities (Mandatory)

| Level	| Vulnerability Type / Key Concept	| Status |
| :---: | :--- | :---: |
| **00** | _TBD / (Reconnaissance)_	| ⏳ |
| **01** | _TBD / (Buffer Overflow)_	| ⏳ |
| **02** | _TBD / (Shellcode / Return to Stack)_ |	⏳ |
| **03** | _TBD / (Format String)_	| ⏳ |
| **04** | _TBD_ | ⏳ |
| **05** | _TBD_ | ⏳ |
| **06** | _TBD_ | ⏳ |
| **07** | _TBD_ | ⏳ | 
| **08** | _TBD_ | ⏳ |
| **09** | _TBD_ | ⏳ |
| **10** | _TBD_ | ⏳ |

(Note: Table to be filled as progress is made in the project).

## 🚀 Usage
This project requires the RainFall ISO provided by 42.

### 1. Initial Connection
1.	Start the VM in VirtualBox.
2.	Identify the machine's IP on the boot screen.
3.	Connect via SSH on port 4242:
  ```bash
  ssh level00@<VM_IP> -p 4242
  ```
> The initial password for level00 is level00.

### 2. Resolution Flow
1.	Analyze the provided binary and its source code (if available).
2.	Use GDB to map the stack and find the attack vector.
3.	Write a script (or direct payload) that exploits the flaw to act as `flagXX`.
4.	Read the `/home/flagXX/.pass` file.
5.	Exit and connect to the next level via SSH using the new password.

---

## ⚠️ Disclaimer
All content in this repository was developed strictly for educational purposes as part of the 42 school curriculum. The techniques demonstrated here (binary exploitation, memory mitigation bypasses) are performed in a deliberately vulnerable and isolated environment. Using these techniques on real systems without explicit authorization is illegal and unethical.

---

## 👩🏻 Author

**Mayara Carvalho**
<br>
[:octocat: @MayaraMCarvalho](https://github.com/MayaraMCarvalho) | 42 Login: `macarval`

---




