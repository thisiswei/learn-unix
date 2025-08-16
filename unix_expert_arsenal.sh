#!/bin/bash

# Unix Expert's Arsenal - The Really Advanced Stuff
# Commands and techniques that separate experts from intermediate users

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
NC='\033[0m'
BOLD='\033[1m'

show_header() {
    clear
    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${BOLD}${WHITE}                    UNIX EXPERT'S ARSENAL${NC}"
    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo
}

main_menu() {
    show_header
    echo -e "${YELLOW}THE REALLY ADVANCED UNIX COMMANDS${NC}"
    echo
    echo "1. Advanced Process & Memory Forensics"
    echo "2. Kernel-Level Operations & System Calls"
    echo "3. Advanced File System Internals"
    echo "4. Network Deep Dive & Packet Analysis"
    echo "5. Performance Profiling & Optimization"
    echo "6. Advanced Text Processing Wizardry"
    echo "7. Shell Internals & Advanced Scripting"
    echo "8. Security & Cryptography Tools"
    echo "9. System Recovery & Debugging"
    echo "10. One-Liner Hall of Fame"
    echo "0. Exit"
    echo
    read -p "Select topic (0-10): " choice
    
    case $choice in
        1) process_forensics ;;
        2) kernel_operations ;;
        3) filesystem_internals ;;
        4) network_analysis ;;
        5) performance_profiling ;;
        6) text_wizardry ;;
        7) shell_internals ;;
        8) security_tools ;;
        9) system_recovery ;;
        10) oneliner_hall ;;
        0) exit 0 ;;
        *) main_menu ;;
    esac
}

process_forensics() {
    show_header
    echo -e "${YELLOW}ADVANCED PROCESS & MEMORY FORENSICS${NC}"
    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo
    
    echo -e "${BOLD}1. Process Memory Analysis${NC}"
    echo
    echo "${CYAN}# Dump process memory${NC}"
    echo "gcore -o dump PID                    # Create core dump of running process"
    echo "cat /proc/PID/maps                   # View memory mappings"
    echo "cat /proc/PID/smaps                  # Detailed memory usage"
    echo "pmap -XX PID                         # Extended memory map"
    echo
    echo "${CYAN}# Extract strings from process memory${NC}"
    echo "strings /proc/PID/mem                # Read process memory directly"
    echo "gdb -p PID -batch -ex 'dump memory mem.dump 0x400000 0x800000'"
    echo
    
    echo -e "${BOLD}2. Advanced Process Tracing${NC}"
    echo
    echo "${CYAN}# System call tracing with filters${NC}"
    echo "strace -e trace=network -p PID       # Trace only network calls"
    echo "strace -e trace=file -f cmd          # Trace file operations + children"
    echo "strace -c -p PID                     # Syscall statistics"
    echo "strace -T -tt -o trace.log cmd       # Timing info + timestamps"
    echo
    echo "${CYAN}# Library call tracing${NC}"
    echo "ltrace -c -p PID                     # Count library calls"
    echo "ltrace -e malloc+free -p PID         # Trace memory allocation"
    echo
    
    echo -e "${BOLD}3. Process Injection & Manipulation${NC}"
    echo
    echo "${CYAN}# Inject into running process${NC}"
    echo "gdb -p PID -batch -ex 'call system(\"command\")'"
    echo "echo 0 > /proc/sys/kernel/yama/ptrace_scope  # Enable ptrace attach"
    echo
    echo "${CYAN}# Change process properties${NC}"
    echo "renice -n -20 -p PID                 # Maximum priority"
    echo "ionice -c 1 -n 0 -p PID              # Real-time I/O priority"
    echo "chrt -f -p 99 PID                    # FIFO real-time scheduling"
    echo
    
    echo -e "${BOLD}4. Process Limits & Cgroups${NC}"
    echo
    echo "${CYAN}# Resource limits${NC}"
    echo "prlimit --pid PID                    # View all limits"
    echo "prlimit --pid PID --nofile=65536     # Change file descriptor limit"
    echo "prlimit --pid PID --as=unlimited     # Remove memory limit"
    echo
    echo "${CYAN}# Control groups${NC}"
    echo "systemd-cgls                         # View cgroup tree"
    echo "systemd-cgtop                        # Top-like cgroup view"
    echo "echo PID > /sys/fs/cgroup/memory/limited/cgroup.procs"
    echo
    
    echo -e "${BOLD}5. Memory Pressure & OOM${NC}"
    echo
    echo "${CYAN}# Memory analysis${NC}"
    echo "vmstat -s                            # Memory statistics"
    echo "slabtop                              # Kernel slab cache"
    echo "echo 3 > /proc/sys/vm/drop_caches   # Clear page cache"
    echo "echo f > /proc/sysrq-trigger         # Manual OOM trigger"
    echo
    
    read -p "Press Enter to return to menu..."
    main_menu
}

kernel_operations() {
    show_header
    echo -e "${YELLOW}KERNEL-LEVEL OPERATIONS & SYSTEM CALLS${NC}"
    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo
    
    echo -e "${BOLD}1. Kernel Module Management${NC}"
    echo
    echo "${CYAN}# Module operations${NC}"
    echo "lsmod | awk '{print \$1,\$3}'         # List modules with usage"
    echo "modinfo module_name                  # Detailed module info"
    echo "modprobe -r --force module           # Force remove module"
    echo "insmod /path/to/module.ko param=value"
    echo "echo 'blacklist module' > /etc/modprobe.d/blacklist.conf"
    echo
    
    echo -e "${BOLD}2. Kernel Parameters & Sysctl${NC}"
    echo
    echo "${CYAN}# Runtime kernel tuning${NC}"
    echo "sysctl -a | grep -E 'net.ipv4|vm'    # Network and memory params"
    echo "sysctl -w kernel.panic=10            # Reboot on panic after 10s"
    echo "sysctl -w kernel.sysrq=1             # Enable magic SysRq"
    echo "echo 'net.core.somaxconn=65535' >> /etc/sysctl.conf"
    echo
    echo "${CYAN}# Kernel debugging${NC}"
    echo "echo '1' > /proc/sys/kernel/ftrace_enabled"
    echo "echo function > /sys/kernel/debug/tracing/current_tracer"
    echo "cat /sys/kernel/debug/tracing/trace"
    echo
    
    echo -e "${BOLD}3. Direct Hardware Access${NC}"
    echo
    echo "${CYAN}# Raw device access${NC}"
    echo "dd if=/dev/mem bs=1 skip=\$((0x000F0000)) count=65536 | strings"
    echo "hexdump -C /dev/port                 # I/O port access"
    echo "setpci -s 00:1f.0 0x40.b            # PCI configuration"
    echo
    
    echo -e "${BOLD}4. eBPF (Extended Berkeley Packet Filter)${NC}"
    echo
    echo "${CYAN}# BPF tracing (requires bpftrace)${NC}"
    echo "bpftrace -e 'tracepoint:syscalls:sys_enter_open { printf(\"%s\\n\", str(args->filename)); }'"
    echo "bpftrace -e 'kprobe:do_sys_open { printf(\"opening: %s\\n\", str(arg1)); }'"
    echo "bpftrace -e 'profile:hz:99 { @[kstack] = count(); }'"
    echo
    
    echo -e "${BOLD}5. Kernel Panic & Debugging${NC}"
    echo
    echo "${CYAN}# Trigger kernel operations${NC}"
    echo "echo c > /proc/sysrq-trigger         # Crash system (panic)"
    echo "echo w > /proc/sysrq-trigger         # Dump blocked tasks"
    echo "echo l > /proc/sysrq-trigger         # Show all CPU backtraces"
    echo "kdump-config show                    # Kernel dump configuration"
    echo
    
    read -p "Press Enter to return to menu..."
    main_menu
}

filesystem_internals() {
    show_header
    echo -e "${YELLOW}ADVANCED FILE SYSTEM INTERNALS${NC}"
    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo
    
    echo -e "${BOLD}1. File System Forensics${NC}"
    echo
    echo "${CYAN}# Inode and block analysis${NC}"
    echo "debugfs /dev/sda1                    # Interactive filesystem debugger"
    echo "debugfs -R 'stat <12345>' /dev/sda1  # Examine specific inode"
    echo "dumpe2fs -h /dev/sda1                # Filesystem superblock info"
    echo "tune2fs -l /dev/sda1                 # Filesystem parameters"
    echo
    echo "${CYAN}# Data recovery${NC}"
    echo "extundelete /dev/sda1 --restore-all  # Recover deleted files"
    echo "debugfs -w /dev/sda1 -R 'undel <12345> recovered_file'"
    echo "ddrescue /dev/sda1 /dev/sdb1 rescue.log  # Clone dying disk"
    echo
    
    echo -e "${BOLD}2. Extended Attributes & ACLs${NC}"
    echo
    echo "${CYAN}# Extended attributes${NC}"
    echo "setfattr -n user.comment -v 'Important' file"
    echo "getfattr -d file                     # List all xattrs"
    echo "attr -l file                         # List attributes"
    echo "setcap cap_net_raw+ep binary        # Set capabilities"
    echo
    echo "${CYAN}# Advanced ACLs${NC}"
    echo "setfacl -R -m u:user:rwX directory  # Recursive ACL with X"
    echo "setfacl -m d:u:user:rwx directory   # Default ACL"
    echo "getfacl -R directory > acls.txt     # Backup ACLs"
    echo "setfacl --restore=acls.txt          # Restore ACLs"
    echo
    
    echo -e "${BOLD}3. File System Mounting Tricks${NC}"
    echo
    echo "${CYAN}# Advanced mount options${NC}"
    echo "mount -o loop disk.img /mnt         # Mount disk image"
    echo "mount --bind /source /target        # Bind mount"
    echo "mount -t tmpfs -o size=2G tmpfs /mnt # RAM disk"
    echo "mount -o remount,rw /                # Remount root as read-write"
    echo "mount -t overlay overlay -o lowerdir=/lower,upperdir=/upper,workdir=/work /merged"
    echo
    
    echo -e "${BOLD}4. FUSE (Filesystem in Userspace)${NC}"
    echo
    echo "${CYAN}# Custom filesystems${NC}"
    echo "sshfs user@host:/ /mnt              # Mount remote via SSH"
    echo "s3fs bucket /mnt -o passwd_file=~/.passwd-s3fs"
    echo "bindfs -p 0600 /source /target      # Change permissions virtually"
    echo
    
    echo -e "${BOLD}5. Block Device Operations${NC}"
    echo
    echo "${CYAN}# Direct block device manipulation${NC}"
    echo "blockdev --getbsz /dev/sda          # Get block size"
    echo "blockdev --setra 256 /dev/sda       # Set read-ahead"
    echo "hdparm -tT /dev/sda                 # Benchmark disk"
    echo "badblocks -svw /dev/sda             # Destructive bad block test"
    echo
    
    read -p "Press Enter to return to menu..."
    main_menu
}

network_analysis() {
    show_header
    echo -e "${YELLOW}NETWORK DEEP DIVE & PACKET ANALYSIS${NC}"
    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo
    
    echo -e "${BOLD}1. Advanced Packet Capture${NC}"
    echo
    echo "${CYAN}# tcpdump wizardry${NC}"
    echo "tcpdump -i any -w capture.pcap 'tcp[tcpflags] & (tcp-syn|tcp-fin) != 0'"
    echo "tcpdump -i eth0 'tcp[((tcp[12:1] & 0xf0) >> 2):4] = 0x47455420'  # GET requests"
    echo "tcpdump -XX -vvv -i eth0 'port 443 and (tcp[((tcp[12] & 0xf0) >> 2)] = 0x16)'"
    echo "tcpdump -i eth0 -A -s0 'tcp port 80 and (((ip[2:2] - ((ip[0]&0xf)<<2)) - ((tcp[12]&0xf0)>>2)) != 0)'"
    echo
    
    echo -e "${BOLD}2. Network Namespace Operations${NC}"
    echo
    echo "${CYAN}# Namespace manipulation${NC}"
    echo "ip netns add isolated                # Create network namespace"
    echo "ip netns exec isolated ip link set lo up"
    echo "ip link add veth0 type veth peer name veth1"
    echo "ip link set veth1 netns isolated"
    echo "nsenter --net=/var/run/netns/isolated bash"
    echo
    
    echo -e "${BOLD}3. iptables/nftables Advanced${NC}"
    echo
    echo "${CYAN}# Complex firewall rules${NC}"
    echo "iptables -t raw -A PREROUTING -p tcp --syn -j CT --notrack"
    echo "iptables -t mangle -A PREROUTING -p tcp --dport 80 -j MARK --set-mark 1"
    echo "iptables -m recent --name portscan --rcheck --seconds 86400 -j DROP"
    echo "iptables -A INPUT -p tcp -m conntrack --ctstate NEW -m limit --limit 60/s --limit-burst 20 -j ACCEPT"
    echo
    echo "${CYAN}# Connection tracking${NC}"
    echo "conntrack -L                         # List all connections"
    echo "conntrack -D -p tcp --dport 80      # Delete connections"
    echo "echo 1 > /proc/sys/net/netfilter/nf_conntrack_acct"
    echo
    
    echo -e "${BOLD}4. Traffic Control (tc)${NC}"
    echo
    echo "${CYAN}# Advanced traffic shaping${NC}"
    echo "tc qdisc add dev eth0 root handle 1: htb default 30"
    echo "tc class add dev eth0 parent 1: classid 1:1 htb rate 1000mbit"
    echo "tc qdisc add dev eth0 parent 1:1 netem delay 100ms 20ms loss 1%"
    echo "tc filter add dev eth0 protocol ip parent 1:0 u32 match ip dst 192.168.1.0/24 flowid 1:10"
    echo
    
    echo -e "${BOLD}5. Network Debugging${NC}"
    echo
    echo "${CYAN}# Advanced diagnostics${NC}"
    echo "ss -tupanl | awk '{print \$1,\$5,\$7}'  # Detailed socket info"
    echo "nstat -az                            # Network statistics"
    echo "ip -s -s link show                   # Detailed interface stats"
    echo "ethtool -S eth0                      # NIC statistics"
    echo "tshark -i eth0 -Y 'tcp.analysis.flags' -T fields -e tcp.analysis.flags"
    echo
    
    read -p "Press Enter to return to menu..."
    main_menu
}

performance_profiling() {
    show_header
    echo -e "${YELLOW}PERFORMANCE PROFILING & OPTIMIZATION${NC}"
    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo
    
    echo -e "${BOLD}1. CPU Profiling${NC}"
    echo
    echo "${CYAN}# perf - Linux profiling tool${NC}"
    echo "perf record -F 99 -a -g -- sleep 30  # System-wide profiling"
    echo "perf report --stdio                  # Generate report"
    echo "perf top -g                          # Real-time profiling"
    echo "perf stat -d command                 # Detailed statistics"
    echo "perf trace -s command                # Trace with summary"
    echo
    echo "${CYAN}# Flame graphs${NC}"
    echo "perf record -F 99 -a -g -- sleep 60"
    echo "perf script | stackcollapse-perf.pl | flamegraph.pl > flame.svg"
    echo
    
    echo -e "${BOLD}2. Memory Profiling${NC}"
    echo
    echo "${CYAN}# Valgrind suite${NC}"
    echo "valgrind --leak-check=full --show-leak-kinds=all ./program"
    echo "valgrind --tool=massif ./program    # Heap profiler"
    echo "valgrind --tool=cachegrind ./program # Cache profiler"
    echo
    echo "${CYAN}# System memory analysis${NC}"
    echo "smem -rs swap -p                    # Memory by process"
    echo "pmap -x PID | tail -1               # Process memory summary"
    echo
    
    echo -e "${BOLD}3. I/O Profiling${NC}"
    echo
    echo "${CYAN}# Block I/O tracing${NC}"
    echo "blktrace -d /dev/sda -o trace      # Trace block I/O"
    echo "blkparse trace.* | less             # Parse trace"
    echo "iotop -oPa                          # Accumulated I/O"
    echo "dstat -d --disk-util --disk-tps    # Disk statistics"
    echo
    echo "${CYAN}# File access patterns${NC}"
    echo "fatrace                             # File access trace"
    echo "inotifywait -mr /path               # Recursive file monitoring"
    echo
    
    echo -e "${BOLD}4. System-wide Analysis${NC}"
    echo
    echo "${CYAN}# Combined profiling${NC}"
    echo "dstat -cdngy --tcp --udp --proc-count --top-cpu --top-io --top-mem"
    echo "collectl -scdmn -P -f /var/log/collectl"
    echo "sar -A 1 60                         # All system activity"
    echo
    
    echo -e "${BOLD}5. Application Tracing${NC}"
    echo
    echo "${CYAN}# Dynamic tracing${NC}"
    echo "systemtap -e 'probe kernel.function(\"*@net/socket.c\") { println(probefunc()) }'"
    echo "dtrace -n 'syscall:::entry { @[execname] = count(); }'"
    echo "ftrace                              # Function tracer"
    echo
    
    read -p "Press Enter to return to menu..."
    main_menu
}

text_wizardry() {
    show_header
    echo -e "${YELLOW}ADVANCED TEXT PROCESSING WIZARDRY${NC}"
    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo
    
    echo -e "${BOLD}1. Advanced AWK Programming${NC}"
    echo
    echo "${CYAN}# Complex AWK scripts${NC}"
    echo "awk 'BEGIN{PROCINFO[\"sorted_in\"]=\"@val_num_desc\"} {a[\$1]+=\$2} END{for(i in a) print i,a[i]}'"
    echo "awk 'NR==FNR{a[\$1]=\$2;next} \$1 in a{\$2=a[\$1]}1' file1 file2  # Join files"
    echo "awk '/start/,/end/ {if (!/start|end/) print}' file  # Between patterns"
    echo "awk 'function factorial(n){return n<2?1:n*factorial(n-1)} {print factorial(\$1)}'"
    echo
    
    echo -e "${BOLD}2. Advanced sed Techniques${NC}"
    echo
    echo "${CYAN}# Multi-line and branching${NC}"
    echo "sed -n '1h;1!H;\${g;s/\\n/ /g;p}' file  # Join all lines"
    echo "sed ':a;N;\$!ba;s/\\n/,/g' file        # CSV from lines"
    echo "sed -n '/start/,/end/{/end/!p}' file  # Exclude end marker"
    echo "sed '0,/pattern/s//replacement/' file # Replace first occurrence only"
    echo
    
    echo -e "${BOLD}3. Advanced grep/ripgrep${NC}"
    echo
    echo "${CYAN}# PCRE and lookarounds${NC}"
    echo "grep -P '(?<=prefix).*(?=suffix)' file  # Positive lookaround"
    echo "grep -P '^(?!.*pattern).*\$' file       # Negative lookahead"
    echo "rg -U --multiline-dotall 'start.*?end'  # Non-greedy multiline"
    echo "rg --type-add 'config:*.{json,yaml,toml}' -tconfig 'pattern'"
    echo
    
    echo -e "${BOLD}4. Binary and Hex Manipulation${NC}"
    echo
    echo "${CYAN}# Binary file processing${NC}"
    echo "xxd -r -p hexfile > binary          # Hex to binary"
    echo "od -An -tx1 -v file | tr -d ' \\n'   # File to hex string"
    echo "hexdump -ve '1/1 \"%.2x\"' file       # Compact hex"
    echo "dd if=file bs=1 skip=100 count=50 2>/dev/null | xxd"
    echo
    
    echo -e "${BOLD}5. JSON/XML Processing${NC}"
    echo
    echo "${CYAN}# jq - JSON processor${NC}"
    echo "jq -r '.[] | select(.age > 30) | [.name, .email] | @csv' file.json"
    echo "jq -s 'reduce .[] as \$item ({}; . * \$item)' *.json  # Merge JSON files"
    echo "jq '.a = .b | del(.b)' file.json    # Rename field"
    echo
    echo "${CYAN}# xmlstarlet - XML processor${NC}"
    echo "xmlstarlet sel -t -v '//element/@attribute' file.xml"
    echo "xmlstarlet ed -u '//element' -v 'newvalue' file.xml"
    echo
    
    echo -e "${BOLD}6. Parallel Text Processing${NC}"
    echo
    echo "${CYAN}# GNU parallel${NC}"
    echo "parallel -j+0 'grep {} *.log' :::: patterns.txt"
    echo "find . -name '*.txt' | parallel -j 8 'wc -l {}' | awk '{s+=\$1} END{print s}'"
    echo "parallel --pipe --block 100M wc -l < bigfile"
    echo
    
    read -p "Press Enter to return to menu..."
    main_menu
}

shell_internals() {
    show_header
    echo -e "${YELLOW}SHELL INTERNALS & ADVANCED SCRIPTING${NC}"
    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo
    
    echo -e "${BOLD}1. Advanced Bash Features${NC}"
    echo
    echo "${CYAN}# Coprocesses${NC}"
    echo "coproc BC { bc; }"
    echo "echo '2^10' >&\${BC[1]}"
    echo "read result <&\${BC[0]}"
    echo
    echo "${CYAN}# Nameref variables${NC}"
    echo "declare -n ref=original_var"
    echo "ref=\"new value\"  # Changes original_var"
    echo
    echo "${CYAN}# Advanced parameter expansion${NC}"
    echo "\${var:offset:length}               # Substring"
    echo "\${var@Q}                           # Quote for re-input"
    echo "\${var@E}                           # Expand escape sequences"
    echo "\${!prefix*}                        # All vars starting with prefix"
    echo
    
    echo -e "${BOLD}2. Signal Handling & Job Control${NC}"
    echo
    echo "${CYAN}# Advanced signal handling${NC}"
    echo "trap 'echo \"Received signal \$?\"' ERR"
    echo "trap 'jobs -p | xargs kill 2>/dev/null' EXIT"
    echo "set -E  # Inherit ERR trap in functions"
    echo "shopt -s huponexit  # Send HUP to jobs on exit"
    echo
    
    echo -e "${BOLD}3. File Descriptors & Redirection${NC}"
    echo
    echo "${CYAN}# Advanced I/O redirection${NC}"
    echo "exec 3< input.txt 4> output.txt     # Open custom FDs"
    echo "read -u 3 line                      # Read from FD 3"
    echo "echo \"data\" >&4                     # Write to FD 4"
    echo "exec 3<&- 4>&-                      # Close FDs"
    echo
    echo "${CYAN}# Process substitution${NC}"
    echo "diff <(sort file1) <(sort file2)"
    echo "while read line; do echo \$line; done < <(command)"
    echo
    
    echo -e "${BOLD}4. Bash Internals${NC}"
    echo
    echo "${CYAN}# Debugging and profiling${NC}"
    echo "set -x  # Debug mode"
    echo "PS4='+\${BASH_SOURCE}:\${LINENO}:\${FUNCNAME[0]}: '"
    echo "TIMEFORMAT='Real: %3lR User: %3lU Sys: %3lS CPU: %P%%'"
    echo "times  # Show accumulated times"
    echo
    echo "${CYAN}# Shell options${NC}"
    echo "set -euo pipefail  # Strict mode"
    echo "shopt -s globstar nullglob dotglob"
    echo "set -o noclobber  # Prevent overwriting"
    echo
    
    echo -e "${BOLD}5. Loadable Builtins${NC}"
    echo
    echo "${CYAN}# Dynamic loading${NC}"
    echo "enable -f /usr/lib/bash/accept accept"
    echo "enable -f /usr/lib/bash/finfo finfo"
    echo "enable -n kill  # Disable builtin"
    echo
    
    read -p "Press Enter to return to menu..."
    main_menu
}

security_tools() {
    show_header
    echo -e "${YELLOW}SECURITY & CRYPTOGRAPHY TOOLS${NC}"
    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo
    
    echo -e "${BOLD}1. File Integrity & Hashing${NC}"
    echo
    echo "${CYAN}# Advanced hashing${NC}"
    echo "find /etc -type f -exec sha256sum {} \\; > baseline.txt"
    echo "sha256sum -c baseline.txt           # Verify integrity"
    echo "mtree -c -K sha256digest -p /etc > spec.mtree"
    echo "aide --init && aide --check         # Advanced intrusion detection"
    echo
    
    echo -e "${BOLD}2. Encryption & Decryption${NC}"
    echo
    echo "${CYAN}# OpenSSL operations${NC}"
    echo "openssl enc -aes-256-cbc -salt -in file -out file.enc"
    echo "openssl rsautl -encrypt -pubin -inkey key.pub -in file -out file.enc"
    echo "openssl dgst -sha256 -sign private.key -out sig file"
    echo "openssl dgst -sha256 -verify public.key -signature sig file"
    echo
    echo "${CYAN}# GPG operations${NC}"
    echo "gpg --cipher-algo AES256 --symmetric file"
    echo "gpg --detach-sign --armor file"
    echo "gpg --verify file.asc file"
    echo
    
    echo -e "${BOLD}3. SELinux/AppArmor${NC}"
    echo
    echo "${CYAN}# SELinux${NC}"
    echo "semanage fcontext -a -t httpd_sys_content_t '/custom(/.*)?'"
    echo "restorecon -Rv /custom"
    echo "ausearch -m AVC -ts recent          # Audit denials"
    echo "setsebool -P httpd_can_network_connect on"
    echo
    echo "${CYAN}# AppArmor${NC}"
    echo "aa-complain /usr/bin/program"
    echo "aa-genprof program"
    echo "aa-logprof"
    echo
    
    echo -e "${BOLD}4. Auditing & Monitoring${NC}"
    echo
    echo "${CYAN}# auditd rules${NC}"
    echo "auditctl -w /etc/passwd -p wa -k passwd_changes"
    echo "auditctl -a always,exit -F arch=b64 -S execve -k commands"
    echo "aureport -x --summary                # Execution report"
    echo "ausearch -k passwd_changes           # Search audit logs"
    echo
    
    echo -e "${BOLD}5. Container Security${NC}"
    echo
    echo "${CYAN}# Docker security${NC}"
    echo "docker run --security-opt no-new-privileges:true image"
    echo "docker run --cap-drop ALL --cap-add NET_BIND_SERVICE image"
    echo "docker run --read-only --tmpfs /tmp image"
    echo
    
    read -p "Press Enter to return to menu..."
    main_menu
}

system_recovery() {
    show_header
    echo -e "${YELLOW}SYSTEM RECOVERY & DEBUGGING${NC}"
    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo
    
    echo -e "${BOLD}1. Boot Recovery${NC}"
    echo
    echo "${CYAN}# GRUB recovery${NC}"
    echo "grub-install --boot-directory=/mnt/boot /dev/sda"
    echo "grub-mkconfig -o /boot/grub/grub.cfg"
    echo "grub-reboot --boot-directory=/mnt/boot 'Ubuntu, with Linux 5.x.x'"
    echo
    echo "${CYAN}# initramfs operations${NC}"
    echo "dracut --force                      # Rebuild initramfs"
    echo "lsinitrd | less                     # Inspect initramfs"
    echo "dracut --add-drivers 'driver_name' --force"
    echo
    
    echo -e "${BOLD}2. File System Recovery${NC}"
    echo
    echo "${CYAN}# Emergency repairs${NC}"
    echo "fsck -y /dev/sda1                   # Auto repair"
    echo "e2fsck -f -y -v /dev/sda1           # Force check ext4"
    echo "xfs_repair -L /dev/sda1             # Clear XFS log"
    echo "btrfs check --repair /dev/sda1      # Repair btrfs"
    echo
    echo "${CYAN}# Recover from backup superblock${NC}"
    echo "dumpe2fs /dev/sda1 | grep -i superblock"
    echo "e2fsck -b 32768 /dev/sda1"
    echo
    
    echo -e "${BOLD}3. System Rescue${NC}"
    echo
    echo "${CYAN}# chroot recovery${NC}"
    echo "mount /dev/sda1 /mnt"
    echo "mount --bind /dev /mnt/dev"
    echo "mount --bind /proc /mnt/proc"
    echo "mount --bind /sys /mnt/sys"
    echo "chroot /mnt /bin/bash"
    echo
    echo "${CYAN}# Reset root password${NC}"
    echo "init=/bin/bash                      # Add to kernel line"
    echo "mount -o remount,rw /"
    echo "passwd root"
    echo
    
    echo -e "${BOLD}4. Network Recovery${NC}"
    echo
    echo "${CYAN}# Network debugging${NC}"
    echo "ip addr flush dev eth0"
    echo "ip link set eth0 down"
    echo "ip link set eth0 up"
    echo "dhclient -r && dhclient eth0"
    echo "systemctl restart NetworkManager"
    echo
    
    echo -e "${BOLD}5. Data Recovery${NC}"
    echo
    echo "${CYAN}# File recovery tools${NC}"
    echo "photorec /dev/sda1                  # Recover various file types"
    echo "testdisk /dev/sda                   # Partition recovery"
    echo "foremost -t all -i /dev/sda1 -o /recovery"
    echo "scalpel /dev/sda1 -o /recovery"
    echo
    
    read -p "Press Enter to return to menu..."
    main_menu
}

oneliner_hall() {
    show_header
    echo -e "${YELLOW}ONE-LINER HALL OF FAME${NC}"
    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo
    
    echo -e "${BOLD}System Information${NC}"
    echo
    echo "${CYAN}# Hardware info in one line${NC}"
    echo "echo \"CPU: \$(lscpu | grep 'Model name' | cut -d: -f2 | xargs) | RAM: \$(free -h | awk '/^Mem:/{print \$2}') | Disk: \$(df -h / | awk 'NR==2{print \$2}')\""
    echo
    echo "${CYAN}# All network connections grouped by state${NC}"
    echo "ss -tan | awk 'NR>1 {state[\$1]++} END {for(s in state) print s\": \"state[s]}'"
    echo
    
    echo -e "${BOLD}Process Management${NC}"
    echo
    echo "${CYAN}# Kill all processes of a user except current shell${NC}"
    echo "kill -9 \$(ps -u username -o pid= | grep -v \$\$)"
    echo
    echo "${CYAN}# Top 10 memory consuming processes with percentage${NC}"
    echo "ps aux | awk '{printf \"%-30s %s\\n\", \$11, \$4\"%\"}' | sort -k2 -rn | head -10"
    echo
    
    echo -e "${BOLD}File Operations${NC}"
    echo
    echo "${CYAN}# Find and remove files older than 30 days but keep directory structure${NC}"
    echo "find /path -type f -mtime +30 -delete -o -type d -empty -delete"
    echo
    echo "${CYAN}# Recursive search and replace in all files${NC}"
    echo "find . -type f -exec sed -i 's/old/new/g' {} +"
    echo
    echo "${CYAN}# Find duplicate files by MD5${NC}"
    echo "find . -type f -exec md5sum {} + | sort | uniq -w32 -d"
    echo
    
    echo -e "${BOLD}Network Magic${NC}"
    echo
    echo "${CYAN}# Serve current directory via HTTP on port 8000${NC}"
    echo "python3 -m http.server 8000 --bind 0.0.0.0"
    echo
    echo "${CYAN}# Monitor real-time network traffic by process${NC}"
    echo "nethogs -d 1"
    echo
    echo "${CYAN}# SSH tunnel for port forwarding${NC}"
    echo "ssh -L 8080:localhost:80 -N -f user@remotehost"
    echo
    
    echo -e "${BOLD}Log Analysis${NC}"
    echo
    echo "${CYAN}# Top 10 IP addresses in Apache/Nginx logs${NC}"
    echo "awk '{print \$1}' access.log | sort | uniq -c | sort -rn | head -10"
    echo
    echo "${CYAN}# Real-time log monitoring with highlighting${NC}"
    echo "tail -f /var/log/syslog | grep --line-buffered -E 'ERROR|WARNING' | sed 's/ERROR/\\o033[31m&\\o033[0m/g;s/WARNING/\\o033[33m&\\o033[0m/g'"
    echo
    
    echo -e "${BOLD}Data Processing${NC}"
    echo
    echo "${CYAN}# Convert CSV to JSON${NC}"
    echo "jq -Rs 'split(\"\\n\") | .[0] | split(\",\") as \$headers | .[1:] | map(split(\",\") | to_entries | map({key: \$headers[.key], value: .value}) | from_entries)' file.csv"
    echo
    echo "${CYAN}# Calculate directory size sorted by size${NC}"
    echo "du -sh * 2>/dev/null | sort -h"
    echo
    
    echo -e "${BOLD}System Monitoring${NC}"
    echo
    echo "${CYAN}# Watch system load with visual graph${NC}"
    echo "while true; do uptime | sed 's/.*load average: //' | spark; sleep 1; done"
    echo
    echo "${CYAN}# Monitor disk I/O for all devices${NC}"
    echo "iostat -x 1 | awk '/^[s|h]d[a-z]/ {printf \"%-10s read:%8.2f MB/s write:%8.2f MB/s\\n\", \$1, \$6/1024, \$7/1024}'"
    echo
    
    echo -e "${BOLD}Security${NC}"
    echo
    echo "${CYAN}# Find all SUID/SGID files${NC}"
    echo "find / -type f \\( -perm -4000 -o -perm -2000 \\) -exec ls -la {} \\; 2>/dev/null"
    echo
    echo "${CYAN}# Monitor failed SSH attempts${NC}"
    echo "journalctl -u sshd | grep 'Failed password' | awk '{print \$(NF-3)}' | sort | uniq -c | sort -rn"
    echo
    
    read -p "Press Enter to return to menu..."
    main_menu
}

# Start the program
main_menu