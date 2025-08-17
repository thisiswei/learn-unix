# 200 Most Used Bash Commands in Claude Code

## File & Directory Operations (1-30)
1. `ls` - List directory contents
2. `cd` - Change directory
3. `pwd` - Print working directory
4. `mkdir` - Create directories
5. `rm` - Remove files/directories
6. `cp` - Copy files/directories
7. `mv` - Move/rename files
8. `touch` - Create empty files or update timestamps
9. `cat` - Concatenate and display files
10. `less` - View file content page by page
11. `more` - View file content (simpler than less)
12. `head` - Display first lines of file
13. `tail` - Display last lines of file
14. `ln` - Create links between files
15. `find` - Search for files and directories
16. `locate` - Find files by name (using database)
17. `which` - Locate command binary
18. `whereis` - Locate binary, source, and man pages
19. `file` - Determine file type
20. `stat` - Display file statistics
21. `tree` - Display directory tree structure
22. `basename` - Strip directory from filename
23. `dirname` - Strip filename from path
24. `realpath` - Get absolute path
25. `readlink` - Read symbolic link target
26. `chmod` - Change file permissions
27. `chown` - Change file ownership
28. `chgrp` - Change group ownership
29. `umask` - Set default permissions
30. `du` - Display disk usage

## Text Processing (31-60)
31. `grep` - Search text patterns
32. `sed` - Stream editor for text manipulation
33. `awk` - Pattern scanning and processing
34. `cut` - Extract columns from text
35. `sort` - Sort lines of text
36. `uniq` - Report or omit repeated lines
37. `tr` - Translate or delete characters
38. `wc` - Word, line, character count
39. `split` - Split files into pieces
40. `join` - Join lines of two files
41. `paste` - Merge lines of files
42. `comm` - Compare sorted files
43. `diff` - Compare files line by line
44. `patch` - Apply diff patches
45. `col` - Filter reverse line feeds
46. `column` - Format text into columns
47. `expand` - Convert tabs to spaces
48. `unexpand` - Convert spaces to tabs
49. `fmt` - Format text paragraphs
50. `fold` - Wrap text to fit width
51. `nl` - Number lines of files
52. `pr` - Prepare files for printing
53. `tac` - Reverse lines of files
54. `rev` - Reverse characters in lines
55. `shuf` - Shuffle lines randomly
56. `tsort` - Topological sort
57. `hexdump` - Display file in hex/octal/ASCII
58. `xxd` - Create hex dump or reverse
59. `strings` - Extract printable strings
60. `od` - Dump files in octal/hex

## Process Management (61-80)
61. `ps` - Display running processes
62. `top` - Display running processes dynamically
63. `htop` - Interactive process viewer
64. `kill` - Terminate processes
65. `killall` - Kill processes by name
66. `pkill` - Kill processes by criteria
67. `pgrep` - Find process IDs by criteria
68. `jobs` - List active jobs
69. `bg` - Resume jobs in background
70. `fg` - Bring job to foreground
71. `nohup` - Run command immune to hangups
72. `nice` - Run with modified priority
73. `renice` - Change process priority
74. `pidof` - Find process ID by name
75. `pstree` - Display process tree
76. `fuser` - Identify processes using files
77. `lsof` - List open files
78. `strace` - Trace system calls
79. `ltrace` - Trace library calls
80. `time` - Time command execution

## System Information (81-100)
81. `uname` - System information
82. `hostname` - Display or set hostname
83. `uptime` - Show system uptime
84. `date` - Display or set date/time
85. `cal` - Display calendar
86. `whoami` - Current username
87. `id` - User and group IDs
88. `groups` - Show group memberships
89. `users` - Show logged in users
90. `who` - Show who is logged in
91. `w` - Show who is logged in and what they're doing
92. `last` - Show login history
93. `lastlog` - Show last login times
94. `df` - Display filesystem usage
95. `free` - Display memory usage
96. `vmstat` - Virtual memory statistics
97. `iostat` - I/O statistics
98. `mpstat` - Processor statistics
99. `sar` - System activity reporter
100. `dmesg` - Display kernel messages

## Network Commands (101-120)
101. `ping` - Test network connectivity
102. `traceroute` - Trace packet route
103. `netstat` - Network statistics
104. `ss` - Socket statistics
105. `ifconfig` - Configure network interface
106. `ip` - Show/manipulate routing, network devices
107. `route` - Show/manipulate IP routing table
108. `arp` - Display/modify ARP cache
109. `dig` - DNS lookup
110. `nslookup` - Query DNS servers
111. `host` - DNS lookup utility
112. `wget` - Download files from web
113. `curl` - Transfer data from/to servers
114. `scp` - Secure copy files over SSH
115. `sftp` - Secure FTP
116. `ssh` - Secure shell client
117. `telnet` - Telnet client
118. `nc` (netcat) - Network utility
119. `tcpdump` - Packet analyzer
120. `nmap` - Network exploration tool

## Archive & Compression (121-135)
121. `tar` - Archive files
122. `gzip` - Compress files
123. `gunzip` - Decompress gzip files
124. `zip` - Create ZIP archives
125. `unzip` - Extract ZIP archives
126. `bzip2` - Compress using Burrows-Wheeler
127. `bunzip2` - Decompress bzip2 files
128. `xz` - Compress using LZMA
129. `unxz` - Decompress xz files
130. `7z` - 7-Zip archiver
131. `rar` - RAR archiver
132. `unrar` - Extract RAR archives
133. `compress` - Unix compress
134. `uncompress` - Decompress .Z files
135. `zcat` - View compressed files

## Package Management (136-145)
136. `apt` - Debian/Ubuntu package manager
137. `apt-get` - Debian/Ubuntu package handling
138. `dpkg` - Debian package manager
139. `yum` - RedHat/CentOS package manager
140. `rpm` - RPM package manager
141. `dnf` - Fedora package manager
142. `pacman` - Arch Linux package manager
143. `snap` - Snap package manager
144. `flatpak` - Flatpak package manager
145. `brew` - Homebrew package manager (macOS)

## Shell & Scripting (146-165)
146. `echo` - Display text
147. `printf` - Format and print data
148. `read` - Read user input
149. `source` - Execute commands from file
150. `export` - Set environment variables
151. `unset` - Remove variables/functions
152. `alias` - Create command shortcuts
153. `unalias` - Remove aliases
154. `history` - Command history
155. `fc` - Fix command (edit history)
156. `type` - Display command type
157. `which` - Show command path
158. `whereis` - Locate command files
159. `hash` - Remember command locations
160. `eval` - Evaluate expressions
161. `exec` - Replace shell with command
162. `exit` - Exit shell
163. `return` - Return from function
164. `shift` - Shift positional parameters
165. `getopts` - Parse options

## File Permissions & Security (166-180)
166. `sudo` - Execute as superuser
167. `su` - Switch user
168. `passwd` - Change password
169. `chpasswd` - Update passwords in batch
170. `useradd` - Add user account
171. `userdel` - Delete user account
172. `usermod` - Modify user account
173. `groupadd` - Add group
174. `groupdel` - Delete group
175. `groupmod` - Modify group
176. `visudo` - Edit sudoers file
177. `gpg` - GNU Privacy Guard
178. `openssl` - OpenSSL toolkit
179. `ssh-keygen` - Generate SSH keys
180. `ssh-copy-id` - Copy SSH key to server

## Development Tools (181-200)
181. `git` - Version control system
182. `make` - Build automation tool
183. `gcc` - GNU C compiler
184. `g++` - GNU C++ compiler
185. `python` - Python interpreter
186. `pip` - Python package installer
187. `node` - Node.js runtime
188. `npm` - Node package manager
189. `docker` - Container platform
190. `docker-compose` - Multi-container Docker
191. `kubectl` - Kubernetes control
192. `terraform` - Infrastructure as code
193. `ansible` - Automation platform
194. `vagrant` - Virtual machine manager
195. `vim` - Vi improved editor
196. `nano` - Simple text editor
197. `emacs` - Extensible text editor
198. `code` - Visual Studio Code
199. `jq` - JSON processor
200. `yq` - YAML processor

## Bonus: Most Common Command Combinations in Claude Code

### File Operations
- `find . -type f -name "*.js"` - Find JavaScript files
- `grep -r "pattern" .` - Recursive search
- `tail -f /var/log/syslog` - Follow log file
- `cat file | grep pattern | sort | uniq` - Process pipeline
- `find . -type f -exec chmod 644 {} \;` - Bulk permission change

### Process Management
- `ps aux | grep process` - Find specific process
- `kill -9 $(pidof process)` - Force kill by name
- `top -u username` - Monitor user processes

### Network Diagnostics
- `netstat -tulpn` - Show listening ports
- `ss -tulpn` - Modern socket statistics
- `curl -I https://example.com` - Check HTTP headers
- `dig +short example.com` - Quick DNS lookup

### System Monitoring
- `df -h` - Human-readable disk usage
- `free -h` - Human-readable memory
- `du -sh *` - Directory sizes
- `watch -n 1 'command'` - Monitor command output

### Git Operations
- `git status` - Check repository status
- `git add .` - Stage all changes
- `git commit -m "message"` - Commit with message
- `git push origin main` - Push to remote
- `git pull --rebase` - Pull with rebase

### Docker Commands
- `docker ps -a` - List all containers
- `docker images` - List images
- `docker logs container` - View container logs
- `docker exec -it container bash` - Enter container

### Text Processing
- `awk '{print $1}'` - Print first column
- `sed 's/old/new/g'` - Global replace
- `sort -rn` - Reverse numeric sort
- `uniq -c` - Count occurrences

### File Transfer
- `scp file user@host:/path` - Secure copy
- `rsync -avz source/ dest/` - Sync directories
- `wget -r https://site.com` - Recursive download

### Permissions
- `chmod +x script.sh` - Make executable
- `chown -R user:group dir/` - Recursive ownership
- `find . -type d -exec chmod 755 {} \;` - Directory permissions
- `find . -type f -exec chmod 644 {} \;` - File permissions