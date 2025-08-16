# Unix Mastery Course

A comprehensive, interactive Unix/Linux learning system that takes you from fundamentals to expert-level techniques.

## Quick Start

```bash
# Launch the main course (fundamentals to advanced)
./unix_mastery_course.sh

# Launch the expert's arsenal (really advanced stuff)
./unix_expert_arsenal.sh

# Quick launcher
./start_course.sh
```

## Course Structure

### 8 Progressive Modules

1. **Unix Fundamentals** (Beginner)
   - Unix history and philosophy
   - Basic commands and navigation
   - File system basics
   - Getting help (man pages)

2. **File System Mastery** (Beginner-Intermediate)
   - File permissions and ownership
   - Symbolic and hard links
   - Advanced file operations
   - Archives and compression

3. **Process Management** (Intermediate)
   - Process lifecycle and monitoring
   - Signals and job control
   - System resource management
   - Process priorities

4. **Shell Scripting** (Intermediate)
   - Bash scripting fundamentals
   - Variables, functions, and control flow
   - Error handling and debugging
   - Best practices

5. **Text Processing** (Intermediate-Advanced)
   - grep, sed, and awk mastery
   - Regular expressions
   - Data manipulation pipelines
   - Log file analysis

6. **System Administration** (Advanced)
   - User and group management
   - Service control (systemd)
   - Package management
   - System monitoring

7. **Networking** (Advanced)
   - Network configuration
   - SSH and remote access
   - Network troubleshooting
   - Security basics

8. **Advanced Topics** (Expert)
   - Performance tuning
   - Container technologies
   - Automation and CI/CD
   - Security hardening

## Features

### Interactive Learning
- **Hands-on tutorials** with real examples
- **Live exercises** in a sandboxed environment
- **Knowledge checks** and quizzes
- **Practical challenges** at every level

### Progress Tracking
- Automatic progress saving
- Module completion tracking
- Challenge achievements
- Visual progress bars

### Tools & Utilities
- **Permissions Calculator** - Convert between octal and symbolic notation
- **Regex Playground** - Test regular expressions with sample data
- **Process Monitor** - Live system monitoring
- **Signal Reference** - Complete signal guide
- **Script Templates** - Production-ready script templates
- **Debugging Workshop** - Learn debugging techniques

### Challenge System
- **Beginner Challenges** - File management, basic scripting
- **Intermediate Challenges** - Log analysis, automation
- **Advanced Challenges** - Security auditing, optimization
- **Real-World Projects** - Complete solutions like backup systems

## Learning Path

```
Beginner → Intermediate → Advanced → Expert
   ↓           ↓            ↓         ↓
Module 1-2  Module 3-5   Module 6-7  Module 8
   ↓           ↓            ↓         ↓
Exercises   Challenges   Projects   Mastery
```

## Practice Environment

The course automatically creates a sandbox directory at:
```
~/unix_course_sandbox/
```

This includes:
- Sample data files
- Log files for analysis
- Configuration files
- Practice scripts
- Project directories

## Key Learning Outcomes

By completing this course, you will:

- Master 100+ essential Unix commands
- Write professional shell scripts
- Automate system tasks efficiently
- Process and analyze data with text tools
- Manage processes and system resources
- Configure and troubleshoot networks
- Implement security best practices
- Build real-world Unix solutions

## Course Navigation

The course uses an intuitive menu system:
- Number keys (1-12) to select options
- Enter to confirm selections
- 0 to exit or go back

## Progress Persistence

Your progress is automatically saved to:
```
~/.unix_course_progress
```

You can resume anytime and continue where you left off.

## Tips for Success

1. **Practice Daily** - Consistency is key to mastery
2. **Try Everything** - Experiment with commands in the sandbox
3. **Read Man Pages** - Develop the habit of checking documentation
4. **Complete Challenges** - Apply knowledge through practical tasks
5. **Take Notes** - Document your learning journey

## System Requirements

- Any Unix-like system (Linux, macOS, BSD)
- Bash shell (version 3.0+)
- Basic command-line tools (standard on most systems)
- 50MB free disk space for sandbox environment

## Getting Help

Within the course:
- Each module has detailed explanations
- Interactive tutorials guide you step-by-step
- Reference materials are always accessible

## Start Your Unix Journey

Launch the course and begin your path to Unix mastery:

```bash
./unix_mastery_course.sh
```

Welcome to the world of Unix!

## Expert's Arsenal - The Really Advanced Stuff

For those who want to go beyond the main course, we've included `unix_expert_arsenal.sh` with truly advanced Unix techniques that most tutorials don't cover:

### Advanced Topics Include:

**1. Process & Memory Forensics**
- Direct memory dumps from running processes
- Advanced strace/ltrace filtering
- Process injection techniques
- Memory analysis with gcore and /proc

**2. Kernel-Level Operations**
- eBPF tracing and profiling
- Kernel module manipulation
- Direct hardware access via /dev/mem
- System call tracing

**3. File System Internals**
- debugfs for ext4 forensics
- Inode manipulation
- Data recovery from damaged filesystems
- FUSE filesystem creation

**4. Network Deep Dive**
- Advanced tcpdump filters for packet analysis
- Network namespace manipulation
- Traffic control with tc
- iptables/nftables advanced rules

**5. Performance Profiling**
- perf for CPU profiling
- Flame graph generation
- Valgrind suite for memory analysis
- System-wide tracing with SystemTap

**6. Advanced Text Processing**
- Complex AWK programming
- Multi-line sed operations
- Binary file manipulation
- Parallel text processing

**7. Security & Cryptography**
- SELinux/AppArmor management
- File integrity monitoring
- Advanced encryption with OpenSSL
- Audit system configuration

**8. System Recovery**
- Boot loader recovery
- chroot rescue operations
- File system repair
- Data recovery tools

**9. One-Liner Hall of Fame**
- The most powerful Unix one-liners
- Complex operations in single commands
- Real-world problem solvers

These are the commands and techniques that separate Unix experts from intermediate users - the kind of knowledge that takes years to accumulate through experience.