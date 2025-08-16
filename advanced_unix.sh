#!/bin/bash

echo "======================================"
echo "    ADVANCED UNIX MASTERY COURSE     "
echo "======================================"
echo ""

function pause() {
    echo ""
    read -p "Press Enter to continue..."
    clear
}

function section() {
    echo ""
    echo "======================================="
    echo "$1"
    echo "======================================="
    echo ""
}

function demo_files() {
    mkdir -p advanced_demo
    cd advanced_demo
    
    cat > access.log << 'EOF'
192.168.1.1 - - [10/Oct/2024:13:55:36] "GET /index.html HTTP/1.1" 200 2326
192.168.1.2 - - [10/Oct/2024:13:56:12] "GET /about.html HTTP/1.1" 404 289
192.168.1.1 - - [10/Oct/2024:13:57:45] "POST /api/login HTTP/1.1" 200 43
192.168.1.3 - - [10/Oct/2024:13:58:02] "GET /index.html HTTP/1.1" 200 2326
192.168.1.2 - - [10/Oct/2024:13:59:21] "GET /contact.html HTTP/1.1" 200 1854
192.168.1.1 - - [10/Oct/2024:14:01:33] "GET /products.html HTTP/1.1" 200 5472
192.168.1.4 - - [10/Oct/2024:14:02:45] "GET /index.html HTTP/1.1" 200 2326
192.168.1.3 - - [10/Oct/2024:14:03:12] "POST /api/data HTTP/1.1" 500 0
192.168.1.2 - - [10/Oct/2024:14:04:55] "GET /index.html HTTP/1.1" 200 2326
192.168.1.5 - - [10/Oct/2024:14:05:22] "GET /admin HTTP/1.1" 403 231
EOF

    cat > data.csv << 'EOF'
name,age,department,salary
John Doe,32,Engineering,75000
Jane Smith,28,Marketing,62000
Bob Johnson,45,Sales,58000
Alice Brown,35,Engineering,82000
Charlie Wilson,29,Marketing,55000
Diana Lee,41,Sales,71000
Eve Martin,33,Engineering,79000
Frank Taylor,38,HR,64000
Grace Davis,31,Marketing,61000
Henry Moore,36,Sales,69000
EOF

    cat > servers.txt << 'EOF'
web01.example.com:80:active
web02.example.com:80:active
db01.example.com:3306:active
db02.example.com:3306:maintenance
cache01.example.com:6379:active
app01.example.com:8080:active
app02.example.com:8080:inactive
mail01.example.com:25:active
EOF

    cat > script.js << 'EOF'
function calculateTotal(items) {
    let total = 0;
    for (let item of items) {
        total += item.price * item.quantity;
    }
    return total;
}

const processOrder = (order) => {
    console.log("Processing order:", order.id);
    const total = calculateTotal(order.items);
    return { ...order, total: total, status: "processed" };
};

module.exports = { calculateTotal, processOrder };
EOF
}

clear
demo_files

section "LESSON 1: AWK - PATTERN SCANNING & PROCESSING"

echo "AWK is a powerful language for processing structured text"
echo ""
echo "Basic syntax: awk 'pattern { action }' file"
echo ""

echo "Example 1: Print specific columns from CSV"
echo "Command: awk -F',' '{print \$1, \$4}' data.csv"
echo ""
awk -F',' '{print $1, $4}' data.csv
pause

echo "Example 2: Calculate sum of salaries"
echo "Command: awk -F',' 'NR>1 {sum+=\$4} END {print \"Total:\", sum}' data.csv"
echo ""
awk -F',' 'NR>1 {sum+=$4} END {print "Total:", sum}' data.csv
echo ""

echo "Example 3: Filter and format"
echo "Command: awk -F',' '\$3==\"Engineering\" {printf \"%-15s $%d\\n\", \$1, \$4}' data.csv"
echo ""
awk -F',' '$3=="Engineering" {printf "%-15s $%d\n", $1, $4}' data.csv
pause

echo "Example 4: Analyze web logs - count status codes"
echo "Command: awk '{print \$9}' access.log | sort | uniq -c"
echo ""
awk '{print $9}' access.log | sort | uniq -c
echo ""

echo "Example 5: Calculate average response by status"
echo "Command: awk '{\$9~/^2/} {sum+=\$10; count++} END {if(count>0) print \"Avg 2xx size:\", sum/count}' access.log"
echo ""
awk '{if($9~/^2/) {sum+=$10; count++}} END {if(count>0) print "Avg 2xx size:", sum/count}' access.log
pause

section "LESSON 2: SED - STREAM EDITOR"

echo "SED performs text transformations on streams"
echo ""
echo "Basic syntax: sed 's/pattern/replacement/' file"
echo ""

echo "Example 1: Simple substitution"
echo "Command: sed 's/Engineering/Tech/g' data.csv"
echo ""
sed 's/Engineering/Tech/g' data.csv | head -5
pause

echo "Example 2: In-place editing with backup"
echo "Command: sed -i.bak 's/const/let/g' script.js"
echo ""
cp script.js script_backup.js
sed -i.bak 's/const/let/g' script.js
echo "Changed lines:"
diff script_backup.js script.js
mv script_backup.js script.js
pause

echo "Example 3: Delete lines matching pattern"
echo "Command: sed '/404/d' access.log"
echo ""
echo "Original line count: $(wc -l < access.log)"
echo "After removing 404s: $(sed '/404/d' access.log | wc -l)"
pause

echo "Example 4: Multiple operations"
echo "Command: sed -e 's/GET/get/g' -e 's/POST/post/g' access.log"
echo ""
sed -e 's/GET/get/g' -e 's/POST/post/g' access.log | head -3
pause

echo "Example 5: Address ranges"
echo "Command: sed '2,5s/^/# /' data.csv  (comment lines 2-5)"
echo ""
sed '2,5s/^/# /' data.csv | head -6
pause

section "LESSON 3: XARGS - BUILD AND EXECUTE COMMANDS"

echo "XARGS converts input into arguments for commands"
echo ""

echo "Example 1: Find and remove files"
echo "Command: find . -name '*.tmp' | xargs rm -f"
echo ""
touch file1.tmp file2.tmp file3.tmp
echo "Created temp files:"
ls *.tmp
find . -name '*.tmp' | xargs rm -f
echo "After removal:"
ls *.tmp 2>/dev/null || echo "All .tmp files removed"
pause

echo "Example 2: Parallel processing"
echo "Command: cat servers.txt | cut -d: -f1 | xargs -P 4 -I {} echo 'Pinging {}'"
echo ""
cat servers.txt | cut -d: -f1 | xargs -P 4 -I {} echo "Pinging {}"
pause

echo "Example 3: Batch operations with custom delimiter"
echo "Command: echo 'file1,file2,file3' | xargs -d',' -I {} echo 'Processing: {}'"
echo ""
echo 'file1,file2,file3' | tr ',' '\n' | xargs -I {} echo "Processing: {}"
pause

echo "Example 4: Handle spaces in filenames"
echo "Command: find . -type f -print0 | xargs -0 ls -l"
echo ""
touch "file with spaces.txt"
find . -type f -name "*.txt" -print0 | xargs -0 ls -l
rm "file with spaces.txt"
pause

section "LESSON 4: ADVANCED GREP & REGEX"

echo "Extended regex patterns and advanced grep usage"
echo ""

echo "Example 1: Perl-compatible regex (grep -P)"
echo "Command: grep -P '\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}' access.log"
echo ""
grep -oP '\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}' access.log | sort -u
pause

echo "Example 2: Lookahead/Lookbehind"
echo "Command: grep -P '(?<=salary)\\d+' data.csv"
echo ""
echo "Finding all salary values:"
grep -oP '(?<=,)\d+$' data.csv
pause

echo "Example 3: Multiple patterns with OR"
echo "Command: grep -E '(404|500)' access.log"
echo ""
grep -E '(404|500)' access.log
pause

echo "Example 4: Inverted match with context"
echo "Command: grep -v '200' -A1 -B1 access.log"
echo ""
grep -v '200' -A1 -B1 access.log
pause

section "LESSON 5: PROCESS SUBSTITUTION & REDIRECTION"

echo "Advanced I/O redirection techniques"
echo ""

echo "Example 1: Process substitution"
echo "Command: diff <(sort file1) <(sort file2)"
echo ""
echo -e "banana\napple\ncherry" > file1.txt
echo -e "apple\ndate\nbanana" > file2.txt
echo "Comparing sorted files:"
diff <(sort file1.txt) <(sort file2.txt)
pause

echo "Example 2: Redirect stderr and stdout separately"
echo "Command: command 2>errors.log 1>output.log"
echo ""
ls -l /nonexistent script.js 2>errors.log 1>output.log
echo "Errors:"
cat errors.log
echo "Output:"
cat output.log
rm errors.log output.log
pause

echo "Example 3: Here documents"
echo "Creating multi-line content inline:"
cat << 'HEREDOC'
This is a here document.
Variables are $NOT expanded when quoted.
Multiple lines are preserved.
HEREDOC
pause

echo "Example 4: Tee - split output"
echo "Command: command | tee file.txt | grep pattern"
echo ""
echo "Saving and processing simultaneously:"
ls -l | tee full_list.txt | grep -c ".txt"
echo "Files saved to full_list.txt and count displayed"
pause

section "LESSON 6: JQ - JSON PROCESSOR"

echo "Processing JSON data with jq"
echo ""

cat > sample.json << 'EOF'
{
  "users": [
    {"id": 1, "name": "Alice", "age": 30, "active": true},
    {"id": 2, "name": "Bob", "age": 25, "active": false},
    {"id": 3, "name": "Charlie", "age": 35, "active": true}
  ],
  "metadata": {
    "version": "1.0",
    "timestamp": "2024-10-10T14:00:00Z"
  }
}
EOF

echo "Example 1: Extract specific field"
echo "Command: jq '.users[].name' sample.json"
echo ""
echo '{"users":[{"name":"Alice"},{"name":"Bob"},{"name":"Charlie"}]}' | python3 -c "import json,sys;d=json.load(sys.stdin);[print(u['name']) for u in d['users']]"
pause

echo "Example 2: Filter data"
echo "Command: jq '.users[] | select(.active==true)' sample.json"
echo ""
echo "Active users:"
python3 -c "
import json
data = json.load(open('sample.json'))
for u in data['users']:
    if u['active']:
        print(json.dumps(u))
"
pause

echo "Example 3: Transform structure"
echo "Command: jq '{names: [.users[].name], count: .users|length}' sample.json"
echo ""
python3 -c "
import json
data = json.load(open('sample.json'))
result = {
    'names': [u['name'] for u in data['users']],
    'count': len(data['users'])
}
print(json.dumps(result, indent=2))
"
pause

section "LESSON 7: ADVANCED FIND OPERATIONS"

echo "Complex file searching with find"
echo ""

echo "Example 1: Find files modified in last 24 hours"
echo "Command: find . -type f -mtime -1"
echo ""
find . -type f -mtime -1 | head -5
pause

echo "Example 2: Find and execute complex commands"
echo "Command: find . -type f -name '*.log' -exec grep -l 'ERROR' {} +"
echo ""
echo "ERROR: Database connection failed" >> error.log
find . -type f -name '*.log' -exec grep -l 'ERROR' {} + 2>/dev/null
pause

echo "Example 3: Find files by size"
echo "Command: find . -type f -size +100c -size -10000c"
echo ""
echo "Files between 100 bytes and 10KB:"
find . -type f -size +100c -size -10000c -exec ls -lh {} \;
pause

echo "Example 4: Complex conditions"
echo "Command: find . \\( -name '*.txt' -o -name '*.log' \\) -a -size +1c"
echo ""
find . \( -name '*.txt' -o -name '*.log' \) -a -size +1c
pause

section "LESSON 8: SHELL SCRIPTING TECHNIQUES"

echo "Advanced bash scripting patterns"
echo ""

echo "Example 1: Parameter expansion"
cat << 'EOF'
file="/path/to/file.txt"
echo ${file##*/}  # Basename: file.txt
echo ${file%/*}   # Directory: /path/to
echo ${file%.txt} # Remove extension: /path/to/file
echo ${file/txt/log} # Replace: /path/to/file.log
EOF
echo ""
file="/path/to/file.txt"
echo "Basename: ${file##*/}"
echo "Directory: ${file%/*}"
pause

echo "Example 2: Arrays and loops"
cat << 'EOF'
declare -a servers=("web01" "web02" "db01")
for server in "${servers[@]}"; do
    echo "Checking $server..."
done
EOF
echo ""
declare -a servers=("web01" "web02" "db01")
for server in "${servers[@]}"; do
    echo "Checking $server..."
done
pause

echo "Example 3: Functions with return values"
cat << 'EOF'
check_service() {
    local service=$1
    if pgrep -x "$service" > /dev/null; then
        return 0
    else
        return 1
    fi
}

if check_service "bash"; then
    echo "Bash is running"
fi
EOF
pause

echo "Example 4: Trap signals"
cat << 'EOF'
cleanup() {
    echo "Cleaning up temporary files..."
    rm -f /tmp/tempfile.*
}
trap cleanup EXIT INT TERM

# Script continues...
EOF
pause

section "LESSON 9: NETWORK TOOLS"

echo "Network debugging and monitoring"
echo ""

echo "Example 1: netstat/ss - Network connections"
echo "Command: ss -tunlp"
echo ""
echo "Sample output:"
cat << 'EOF'
State    Recv-Q Send-Q Local Address:Port   Peer Address:Port
LISTEN   0      128    0.0.0.0:22           0.0.0.0:*
LISTEN   0      128    0.0.0.0:80           0.0.0.0:*
ESTAB    0      0      192.168.1.10:22      192.168.1.5:54321
EOF
pause

echo "Example 2: tcpdump - Packet capture"
echo "Command: sudo tcpdump -i any -n port 80"
echo ""
echo "Would capture HTTP traffic (requires sudo)"
pause

echo "Example 3: curl advanced usage"
echo "Command: curl -X POST -H 'Content-Type: application/json' -d '{\"key\":\"value\"}' api.example.com"
echo ""
echo "Testing API endpoints with headers and data"
pause

echo "Example 4: nc (netcat) - Network Swiss Army knife"
echo "Command: nc -zv hostname 22-80"
echo ""
echo "Port scanning range 22-80"
pause

section "LESSON 10: PERFORMANCE & MONITORING"

echo "System performance analysis tools"
echo ""

echo "Example 1: iostat - I/O statistics"
echo "Command: iostat -x 1"
echo ""
echo "Sample output:"
cat << 'EOF'
Device    r/s   w/s   rkB/s   wkB/s  %util
sda      12.5  45.2   204.8   892.3   45.2
sdb       8.1  22.4   128.4   445.6   28.7
EOF
pause

echo "Example 2: vmstat - Virtual memory stats"
echo "Command: vmstat 1 5"
echo ""
echo "Memory and CPU usage over 5 seconds"
pause

echo "Example 3: strace - System call tracing"
echo "Command: strace -c ls"
echo ""
echo "Traces system calls made by a program"
pause

echo "Example 4: lsof - List open files"
echo "Command: lsof -i :80"
echo ""
echo "Shows what's using port 80"
pause

section "LESSON 11: TEXT MANIPULATION MASTERCLASS"

echo "Combining tools for complex text processing"
echo ""

echo "Real-world example: Log analysis pipeline"
echo ""
echo "Extract top 5 IP addresses by request count:"
echo "Command: awk '{print \$1}' access.log | sort | uniq -c | sort -rn | head -5"
echo ""
awk '{print $1}' access.log | sort | uniq -c | sort -rn | head -5
pause

echo "Extract failed requests with timestamps:"
echo "Command: awk '\$9!=\"200\" {print \$4, \$7, \$9}' access.log"
echo ""
awk '$9!="200" {print $4, $7, $9}' access.log
pause

echo "Calculate bandwidth by status code:"
cat << 'EOF'
awk '{
    status=$9
    size=$10
    if(size ~ /^[0-9]+$/) {
        bytes[status] += size
        count[status]++
    }
} END {
    for (s in bytes) {
        printf "Status %s: %.2f KB (%d requests)\n", 
               s, bytes[s]/1024, count[s]
    }
}' access.log
EOF
echo ""
awk '{
    status=$9
    size=$10
    if(size ~ /^[0-9]+$/) {
        bytes[status] += size
        count[status]++
    }
} END {
    for (s in bytes) {
        printf "Status %s: %.2f KB (%d requests)\n", 
               s, bytes[s]/1024, count[s]
    }
}' access.log
pause

section "LESSON 12: AUTOMATION & SCHEDULING"

echo "Automating tasks with cron and systemd"
echo ""

echo "Example 1: Crontab syntax"
cat << 'EOF'
# m h dom mon dow command
*/5 * * * * /path/to/script.sh      # Every 5 minutes
0 2 * * * /backup/daily.sh           # Daily at 2 AM
0 */6 * * * /monitor/check.sh        # Every 6 hours
@reboot /startup/init.sh             # On system boot
EOF
pause

echo "Example 2: at - One-time scheduling"
echo "Command: echo 'backup.sh' | at 2:30 AM tomorrow"
echo ""
echo "Schedules a one-time task"
pause

echo "Example 3: systemd timers"
cat << 'EOF'
[Unit]
Description=Daily backup

[Timer]
OnCalendar=daily
Persistent=true

[Install]
WantedBy=timers.target
EOF
pause

section "PRACTICAL EXERCISES"

echo "Challenge 1: Log Analysis"
echo "Task: Find all unique IP addresses that received 404 errors,"
echo "      count them, and show the top 3"
echo ""
echo "Solution:"
echo "awk '\$9==\"404\" {print \$1}' access.log | sort -u | wc -l"
echo "awk '\$9==\"404\" {print \$1}' access.log | sort | uniq -c | sort -rn | head -3"
echo ""
awk '$9=="404" {print $1}' access.log | sort | uniq -c | sort -rn | head -3
pause

echo "Challenge 2: Bulk File Processing"
echo "Task: Find all .txt files, convert them to uppercase names"
echo ""
echo "Solution:"
echo "find . -name '*.txt' | while read f; do mv \"\$f\" \"\${f^^}\"; done"
pause

echo "Challenge 3: System Monitoring Script"
echo "Task: Create a script that checks disk usage and alerts if > 80%"
echo ""
cat << 'EOF'
#!/bin/bash
df -h | awk 'NR>1 {
    usage = $5
    gsub(/%/, "", usage)
    if (usage > 80) {
        printf "ALERT: %s is %s%% full\n", $6, usage
    }
}'
EOF
pause

echo "Challenge 4: Data Processing Pipeline"
echo "Task: Process CSV to find department with highest average salary"
echo ""
echo "Solution:"
awk -F',' 'NR>1 {
    sum[$3] += $4
    count[$3]++
} END {
    max = 0
    dept = ""
    for (d in sum) {
        avg = sum[d]/count[d]
        if (avg > max) {
            max = avg
            dept = d
        }
    }
    printf "%s: $%.2f average\n", dept, max
}' data.csv
pause

cd ..
rm -rf advanced_demo

echo ""
echo "======================================"
echo "    ADVANCED COURSE COMPLETED! 🚀"
echo "======================================"
echo ""
echo "Key Advanced Commands Covered:"
echo ""
echo "Text Processing:"
echo "  awk         - Pattern scanning and processing"
echo "  sed         - Stream editing"
echo "  jq          - JSON processing"
echo ""
echo "Command Building:"
echo "  xargs       - Build and execute commands"
echo "  find -exec  - Execute on found files"
echo ""
echo "System Analysis:"
echo "  strace      - System call tracing"
echo "  lsof        - List open files"
echo "  ss/netstat  - Network connections"
echo ""
echo "Performance:"
echo "  iostat      - I/O statistics"
echo "  vmstat      - Virtual memory stats"
echo "  tcpdump     - Packet capture"
echo ""
echo "Scripting:"
echo "  Arrays      - Bash arrays"
echo "  Functions   - Reusable code"
echo "  Traps       - Signal handling"
echo ""
echo "Remember: The power of Unix comes from combining"
echo "simple tools into complex pipelines!"
echo ""
echo "Practice these patterns and you'll become"
echo "a Unix command line expert!"
echo ""