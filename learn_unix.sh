#!/bin/bash

echo "======================================"
echo "      WELCOME TO UNIX BASICS         "
echo "======================================"
echo ""

function pause() {
    echo ""
    read -p "Press Enter to continue..."
    clear
}

function section() {
    echo ""
    echo "----------------------------------------"
    echo "$1"
    echo "----------------------------------------"
    echo ""
}

clear

section "LESSON 1: NAVIGATION COMMANDS"

echo "pwd - Print Working Directory"
echo "Shows where you are in the file system"
echo ""
echo "Example:"
pwd
pause

echo "ls - List Directory Contents"
echo "Shows files and folders in current directory"
echo ""
echo "Basic usage:"
echo "  ls         # Simple list"
echo "  ls -l      # Long format with details"
echo "  ls -la     # Include hidden files"
echo "  ls -lh     # Human-readable file sizes"
echo ""
echo "Try it:"
ls -l
pause

echo "cd - Change Directory"
echo "Navigate through the file system"
echo ""
echo "Common uses:"
echo "  cd /path/to/directory  # Go to specific path"
echo "  cd ..                  # Go up one level"
echo "  cd ~                   # Go to home directory"
echo "  cd -                   # Go to previous directory"
pause

section "LESSON 2: FILE OPERATIONS"

echo "Creating test files for demonstration..."
mkdir -p demo_files
cd demo_files
echo "Hello World" > sample.txt
echo "Line 1" > data.txt
echo "Line 2" >> data.txt
echo "Line 3" >> data.txt

echo "cat - Display File Contents"
echo ""
echo "Example with sample.txt:"
cat sample.txt
echo ""
echo "Combine multiple files:"
echo "  cat file1 file2 > combined.txt"
pause

echo "head & tail - View Parts of Files"
echo ""
echo "head -n 2 data.txt  # First 2 lines"
head -n 2 data.txt
echo ""
echo "tail -n 2 data.txt  # Last 2 lines"
tail -n 2 data.txt
pause

echo "grep - Search Text in Files"
echo "Find patterns in files"
echo ""
echo "Example: grep 'Line' data.txt"
grep 'Line' data.txt
echo ""
echo "Useful options:"
echo "  grep -i 'pattern' file  # Case insensitive"
echo "  grep -n 'pattern' file  # Show line numbers"
echo "  grep -r 'pattern' .     # Recursive search"
pause

section "LESSON 3: FILE MANAGEMENT"

echo "cp - Copy Files/Directories"
echo ""
echo "Examples:"
echo "  cp source.txt dest.txt      # Copy file"
echo "  cp -r source_dir dest_dir   # Copy directory"
echo ""
echo "Demo: cp sample.txt backup.txt"
cp sample.txt backup.txt
ls -l
pause

echo "mv - Move/Rename Files"
echo ""
echo "Examples:"
echo "  mv oldname.txt newname.txt  # Rename"
echo "  mv file.txt /new/path/      # Move to directory"
echo ""
echo "Demo: mv backup.txt renamed.txt"
mv backup.txt renamed.txt
ls -l
pause

echo "rm - Remove Files/Directories"
echo ""
echo "Examples:"
echo "  rm file.txt          # Remove file"
echo "  rm -r directory      # Remove directory"
echo "  rm -rf directory     # Force remove (careful!)"
echo ""
echo "Demo: rm renamed.txt"
rm renamed.txt
ls -l
pause

echo "mkdir - Make Directories"
echo ""
echo "Examples:"
echo "  mkdir newdir           # Create directory"
echo "  mkdir -p path/to/dir   # Create nested directories"
echo ""
echo "Demo: mkdir test_folder"
mkdir test_folder
ls -l
pause

section "LESSON 4: FILE PERMISSIONS"

echo "chmod - Change File Permissions"
echo ""
echo "Permission format: rwx (read, write, execute)"
echo "For: owner, group, others"
echo ""
echo "Numeric notation:"
echo "  4 = read, 2 = write, 1 = execute"
echo "  chmod 755 file  # rwxr-xr-x"
echo "  chmod 644 file  # rw-r--r--"
echo ""
echo "Symbolic notation:"
echo "  chmod +x file   # Add execute permission"
echo "  chmod u+w file  # Add write for owner"
echo ""
echo "Current permissions:"
ls -l sample.txt
pause

section "LESSON 5: PROCESS MANAGEMENT"

echo "ps - Show Running Processes"
echo ""
echo "Common uses:"
echo "  ps          # Your processes"
echo "  ps aux      # All processes"
echo "  ps aux | grep name  # Find specific process"
echo ""
echo "Example:"
ps | head -5
pause

echo "top - Real-time Process Monitor"
echo "Shows CPU and memory usage"
echo ""
echo "Useful keys in top:"
echo "  q - quit"
echo "  k - kill process"
echo "  h - help"
echo ""
echo "(Not running top to avoid interruption)"
pause

echo "kill - Terminate Processes"
echo ""
echo "Examples:"
echo "  kill PID         # Normal termination"
echo "  kill -9 PID      # Force kill"
echo "  killall name     # Kill by process name"
pause

section "LESSON 6: TEXT PROCESSING"

echo "Creating sample data..."
echo -e "apple\nbanana\ncherry\napple\ndate" > fruits.txt

echo "sort - Sort Lines"
echo ""
echo "Original fruits.txt:"
cat fruits.txt
echo ""
echo "Sorted:"
sort fruits.txt
pause

echo "uniq - Remove Duplicates"
echo "(Note: Input must be sorted first)"
echo ""
echo "Sort and remove duplicates:"
sort fruits.txt | uniq
echo ""
echo "Count occurrences:"
sort fruits.txt | uniq -c
pause

echo "wc - Word/Line/Character Count"
echo ""
echo "wc fruits.txt:"
wc fruits.txt
echo ""
echo "Options:"
echo "  wc -l file  # Line count only"
echo "  wc -w file  # Word count only"
echo "  wc -c file  # Character count only"
pause

section "LESSON 7: PIPES AND REDIRECTION"

echo "Pipes (|) - Chain Commands"
echo "Output of one command becomes input of another"
echo ""
echo "Examples:"
echo "  ls -l | grep txt"
echo "  cat file | sort | uniq"
echo "  ps aux | grep python | wc -l"
echo ""
echo "Demo: List txt files with details"
ls -l | grep txt
pause

echo "Redirection"
echo ""
echo "> Redirect output (overwrite):"
echo "  command > file.txt"
echo ""
echo ">> Append to file:"
echo "  command >> file.txt"
echo ""
echo "< Input from file:"
echo "  command < input.txt"
echo ""
echo "2> Redirect errors:"
echo "  command 2> errors.txt"
pause

section "LESSON 8: USEFUL UTILITIES"

echo "find - Search for Files"
echo ""
echo "Examples:"
echo "  find . -name '*.txt'        # Find by name"
echo "  find . -type f -size +1M    # Files over 1MB"
echo "  find . -mtime -7            # Modified in last 7 days"
echo ""
echo "Demo: Find all .txt files"
find . -name "*.txt"
pause

echo "which - Find Command Location"
echo ""
echo "Example: which ls"
which ls
echo ""
echo "Example: which bash"
which bash
pause

echo "man - Manual Pages"
echo "Get help for any command"
echo ""
echo "Examples:"
echo "  man ls"
echo "  man grep"
echo "  man bash"
echo ""
echo "Navigation in man:"
echo "  Space - next page"
echo "  b - previous page"
echo "  / - search"
echo "  q - quit"
pause

section "LESSON 9: ENVIRONMENT"

echo "echo - Display Text"
echo ""
echo "Examples:"
echo '  echo "Hello World"'
echo '  echo $PATH           # Show environment variable'
echo '  echo $HOME'
echo ""
echo "Your home directory: $HOME"
pause

echo "export - Set Environment Variables"
echo ""
echo "Examples:"
echo '  export VAR="value"'
echo '  export PATH=$PATH:/new/path'
echo ""
echo "View all environment variables:"
echo "  env or printenv"
pause

echo "alias - Create Command Shortcuts"
echo ""
echo "Examples:"
echo "  alias ll='ls -la'"
echo "  alias ..='cd ..'"
echo "  alias gs='git status'"
echo ""
echo "View current aliases:"
echo "  alias"
pause

section "LESSON 10: ADVANCED TIPS"

echo "Command History"
echo ""
echo "Navigate history:"
echo "  history        # Show command history"
echo "  !number        # Run command by number"
echo "  !!             # Run last command"
echo "  !grep          # Run last grep command"
echo "  Ctrl+R         # Search history"
pause

echo "Tab Completion"
echo "Press Tab to auto-complete:"
echo "  - File and directory names"
echo "  - Command names"
echo "  - Variable names"
echo ""
echo "Double Tab shows all possibilities"
pause

echo "Wildcards"
echo ""
echo "* - Match any characters:"
echo "  ls *.txt       # All .txt files"
echo "  rm temp*       # Remove files starting with temp"
echo ""
echo "? - Match single character:"
echo "  ls file?.txt   # file1.txt, file2.txt, etc."
echo ""
echo "[...] - Match character set:"
echo "  ls file[123].txt  # file1.txt, file2.txt, file3.txt"
pause

section "PRACTICE EXERCISES"

echo "Try these commands on your own:"
echo ""
echo "1. Navigate to your home directory"
echo "   Solution: cd ~"
echo ""
echo "2. List all files including hidden ones"
echo "   Solution: ls -la"
echo ""
echo "3. Create a directory called 'practice'"
echo "   Solution: mkdir practice"
echo ""
echo "4. Create a file with some text"
echo '   Solution: echo "text" > myfile.txt'
echo ""
echo "5. Search for a word in all .txt files"
echo '   Solution: grep "word" *.txt'
echo ""
echo "6. Count lines in all .txt files"
echo "   Solution: wc -l *.txt"
echo ""
echo "7. Find all files modified today"
echo "   Solution: find . -mtime 0"
echo ""

cd ..
rm -rf demo_files

echo ""
echo "======================================"
echo "     CONGRATULATIONS! 🎉"
echo "======================================"
echo ""
echo "You've completed the Unix basics tutorial!"
echo ""
echo "Quick Reference Commands:"
echo "  pwd, ls, cd           - Navigation"
echo "  cat, head, tail, grep - File viewing"
echo "  cp, mv, rm, mkdir     - File management"
echo "  chmod, chown          - Permissions"
echo "  ps, top, kill         - Processes"
echo "  sort, uniq, wc        - Text processing"
echo "  find, which           - Searching"
echo "  man, help             - Documentation"
echo ""
echo "Keep practicing and exploring!"
echo ""