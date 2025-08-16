#!/bin/bash

# Unix Mastery Course - From Fundamentals to Expert Level
# A comprehensive interactive Unix/Linux learning system

# Colors for better UI
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
NC='\033[0m' # No Color
BOLD='\033[1m'

# Progress tracking
PROGRESS_FILE="$HOME/.unix_course_progress"
SANDBOX_DIR="$HOME/unix_course_sandbox"

# Initialize progress file if it doesn't exist
init_progress() {
    if [ ! -f "$PROGRESS_FILE" ]; then
        echo "# Unix Mastery Course Progress" > "$PROGRESS_FILE"
        echo "started=$(date +%s)" >> "$PROGRESS_FILE"
        echo "module1=0" >> "$PROGRESS_FILE"
        echo "module2=0" >> "$PROGRESS_FILE"
        echo "module3=0" >> "$PROGRESS_FILE"
        echo "module4=0" >> "$PROGRESS_FILE"
        echo "module5=0" >> "$PROGRESS_FILE"
        echo "module6=0" >> "$PROGRESS_FILE"
        echo "module7=0" >> "$PROGRESS_FILE"
        echo "module8=0" >> "$PROGRESS_FILE"
        echo "challenges_completed=0" >> "$PROGRESS_FILE"
    fi
}

# Create sandbox directory for practice
init_sandbox() {
    if [ ! -d "$SANDBOX_DIR" ]; then
        mkdir -p "$SANDBOX_DIR"
        echo -e "${GREEN}Created practice sandbox at: $SANDBOX_DIR${NC}"
    fi
}

# Update progress
update_progress() {
    local module=$1
    local value=$2
    sed -i.bak "s/^$module=.*/$module=$value/" "$PROGRESS_FILE"
}

# Get progress
get_progress() {
    local module=$1
    grep "^$module=" "$PROGRESS_FILE" | cut -d'=' -f2
}

# Display header
show_header() {
    clear
    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${BOLD}${WHITE}                      UNIX MASTERY COURSE${NC}"
    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo
}

# Display progress bar
show_progress_bar() {
    local current=$1
    local total=$2
    local width=50
    local percentage=$((current * 100 / total))
    local filled=$((current * width / total))
    
    echo -n "["
    for ((i=0; i<filled; i++)); do echo -n "█"; done
    for ((i=filled; i<width; i++)); do echo -n "░"; done
    echo -n "] $percentage%"
}

# Main menu
main_menu() {
    show_header
    echo -e "${YELLOW}COURSE MODULES${NC}"
    echo
    
    local total_progress=0
    for i in {1..8}; do
        local progress=$(get_progress "module$i")
        total_progress=$((total_progress + progress))
    done
    
    echo -e "${GREEN}Overall Progress: "
    show_progress_bar $total_progress 800
    echo -e "${NC}\n"
    
    echo -e "${BOLD}1.${NC} Module 1: Unix Fundamentals (Beginner)"
    echo -e "   └─ History, philosophy, basic commands, file system basics"
    echo
    echo -e "${BOLD}2.${NC} Module 2: File System Mastery (Beginner-Intermediate)"
    echo -e "   └─ Navigation, permissions, links, file operations"
    echo
    echo -e "${BOLD}3.${NC} Module 3: Process Management (Intermediate)"
    echo -e "   └─ Processes, signals, job control, system monitoring"
    echo
    echo -e "${BOLD}4.${NC} Module 4: Shell Scripting (Intermediate)"
    echo -e "   └─ Bash scripting, control structures, functions, best practices"
    echo
    echo -e "${BOLD}5.${NC} Module 5: Text Processing (Intermediate-Advanced)"
    echo -e "   └─ grep, sed, awk, regular expressions, data manipulation"
    echo
    echo -e "${BOLD}6.${NC} Module 6: System Administration (Advanced)"
    echo -e "   └─ User management, systemd, cron, package management"
    echo
    echo -e "${BOLD}7.${NC} Module 7: Networking (Advanced)"
    echo -e "   └─ Network tools, SSH, file transfer, troubleshooting"
    echo
    echo -e "${BOLD}8.${NC} Module 8: Advanced Topics (Expert)"
    echo -e "   └─ Performance tuning, security, containers, automation"
    echo
    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${BOLD}9.${NC} Challenges & Exercises"
    echo -e "${BOLD}10.${NC} View Progress Report"
    echo -e "${BOLD}11.${NC} Setup Practice Environment"
    echo -e "${BOLD}12.${NC} Course Resources & References"
    echo -e "${BOLD}0.${NC} Exit Course"
    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo
    read -p "Select an option (0-12): " choice
    
    case $choice in
        1) module1_fundamentals ;;
        2) module2_filesystem ;;
        3) module3_processes ;;
        4) module4_scripting ;;
        5) module5_text_processing ;;
        6) module6_sysadmin ;;
        7) module7_networking ;;
        8) module8_advanced ;;
        9) challenges_menu ;;
        10) show_progress_report ;;
        11) setup_practice_env ;;
        12) show_resources ;;
        0) exit_course ;;
        *) echo -e "${RED}Invalid option. Please try again.${NC}"; sleep 2; main_menu ;;
    esac
}

# Module 1: Unix Fundamentals
module1_fundamentals() {
    show_header
    echo -e "${YELLOW}MODULE 1: UNIX FUNDAMENTALS${NC}"
    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo
    
    echo -e "${BOLD}Learning Objectives:${NC}"
    echo "• Understand Unix history and philosophy"
    echo "• Master basic command structure and syntax"
    echo "• Navigate the file system efficiently"
    echo "• Use man pages and help systems"
    echo "• Understand standard input/output/error"
    echo
    
    echo -e "${BOLD}Topics:${NC}"
    echo "1. Unix History & Philosophy"
    echo "2. Command Line Basics"
    echo "3. Essential Commands (ls, cd, pwd, echo, cat)"
    echo "4. Getting Help (man, info, help, apropos)"
    echo "5. File System Hierarchy"
    echo "6. Shell Basics & Environment Variables"
    echo "7. Input/Output Redirection"
    echo "8. Pipes and Command Chaining"
    echo
    
    echo -e "${BOLD}Choose a lesson:${NC}"
    echo "1. Interactive Tutorial"
    echo "2. Practice Exercises"
    echo "3. Knowledge Check Quiz"
    echo "4. Return to Main Menu"
    echo
    read -p "Select (1-4): " lesson_choice
    
    case $lesson_choice in
        1) module1_tutorial ;;
        2) module1_exercises ;;
        3) module1_quiz ;;
        4) main_menu ;;
        *) module1_fundamentals ;;
    esac
}

# Module 1 Tutorial
module1_tutorial() {
    show_header
    echo -e "${YELLOW}UNIX FUNDAMENTALS - INTERACTIVE TUTORIAL${NC}"
    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo
    
    echo -e "${BOLD}Lesson 1: Unix Philosophy${NC}"
    echo
    echo "Unix follows several key principles:"
    echo "• ${GREEN}Do one thing well${NC} - Each tool should do one specific task excellently"
    echo "• ${GREEN}Everything is a file${NC} - Devices, processes, and data are all files"
    echo "• ${GREEN}Small is beautiful${NC} - Simple tools can be combined for complex tasks"
    echo "• ${GREEN}Plain text${NC} - Configuration and data in human-readable format"
    echo
    read -p "Press Enter to continue..."
    
    echo
    echo -e "${BOLD}Lesson 2: Basic Command Structure${NC}"
    echo
    echo "Unix commands follow this pattern:"
    echo -e "${CYAN}command [options] [arguments]${NC}"
    echo
    echo "Examples:"
    echo "  ls           # List files"
    echo "  ls -l        # List with details (option)"
    echo "  ls -la /home # List all files in /home with details"
    echo
    echo -e "${BOLD}Try it yourself:${NC}"
    echo "Type 'ls' and press Enter:"
    read -p "> " user_cmd
    if [ "$user_cmd" = "ls" ]; then
        ls
        echo -e "\n${GREEN}Great! You've run your first Unix command.${NC}"
        update_progress "module1" 10
    fi
    echo
    read -p "Press Enter to continue..."
    
    echo
    echo -e "${BOLD}Lesson 3: Navigation Commands${NC}"
    echo
    echo "Essential navigation commands:"
    echo "• ${CYAN}pwd${NC}  - Print Working Directory (where you are)"
    echo "• ${CYAN}cd${NC}   - Change Directory"
    echo "• ${CYAN}ls${NC}   - List directory contents"
    echo
    echo "Special directories:"
    echo "• ${CYAN}.${NC}    - Current directory"
    echo "• ${CYAN}..${NC}   - Parent directory"
    echo "• ${CYAN}~${NC}    - Home directory"
    echo "• ${CYAN}/${NC}    - Root directory"
    echo
    echo -e "${BOLD}Practice:${NC}"
    echo "Your current directory is:"
    pwd
    echo
    read -p "Press Enter to continue..."
    
    echo
    echo -e "${BOLD}Lesson 4: Getting Help${NC}"
    echo
    echo "Unix provides multiple help systems:"
    echo "• ${CYAN}man command${NC}     - Manual pages (most comprehensive)"
    echo "• ${CYAN}command --help${NC}  - Quick help"
    echo "• ${CYAN}info command${NC}    - GNU info pages"
    echo "• ${CYAN}apropos keyword${NC} - Search for commands"
    echo "• ${CYAN}which command${NC}   - Find command location"
    echo "• ${CYAN}type command${NC}    - Show command type"
    echo
    echo "Man page sections:"
    echo "1 - User commands"
    echo "2 - System calls"
    echo "3 - Library functions"
    echo "5 - File formats"
    echo "8 - System administration"
    echo
    read -p "Press Enter to continue..."
    
    echo
    echo -e "${BOLD}Lesson 5: Input/Output Redirection${NC}"
    echo
    echo "Three standard streams:"
    echo "• ${CYAN}stdin${NC}  (0) - Standard input"
    echo "• ${CYAN}stdout${NC} (1) - Standard output"
    echo "• ${CYAN}stderr${NC} (2) - Standard error"
    echo
    echo "Redirection operators:"
    echo "• ${CYAN}>${NC}   - Redirect output (overwrites)"
    echo "• ${CYAN}>>${NC}  - Append output"
    echo "• ${CYAN}<${NC}   - Redirect input"
    echo "• ${CYAN}2>${NC}  - Redirect errors"
    echo "• ${CYAN}&>${NC}  - Redirect all output"
    echo "• ${CYAN}|${NC}   - Pipe output to another command"
    echo
    echo "Examples:"
    echo "  ls > files.txt        # Save file list"
    echo "  cat < input.txt       # Read from file"
    echo "  ls | grep doc         # Filter output"
    echo "  find / 2>/dev/null    # Discard errors"
    echo
    
    update_progress "module1" 50
    read -p "Press Enter to return to module menu..."
    module1_fundamentals
}

# Module 1 Exercises
module1_exercises() {
    show_header
    echo -e "${YELLOW}MODULE 1 - PRACTICE EXERCISES${NC}"
    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo
    
    cd "$SANDBOX_DIR" 2>/dev/null || cd "$HOME"
    
    echo -e "${BOLD}Exercise 1: Basic Navigation${NC}"
    echo "Tasks:"
    echo "1. Display your current directory"
    echo "2. List all files including hidden ones"
    echo "3. Create a directory called 'practice'"
    echo "4. Change into the 'practice' directory"
    echo
    echo -e "${GREEN}Solution commands:${NC}"
    echo "pwd"
    echo "ls -la"
    echo "mkdir practice"
    echo "cd practice"
    echo
    read -p "Try these commands, then press Enter to continue..."
    
    echo
    echo -e "${BOLD}Exercise 2: File Operations${NC}"
    echo "Tasks:"
    echo "1. Create an empty file called 'test.txt'"
    echo "2. Add 'Hello Unix' to the file"
    echo "3. Display the file contents"
    echo "4. Copy the file to 'backup.txt'"
    echo "5. Remove the original file"
    echo
    echo -e "${GREEN}Solution commands:${NC}"
    echo "touch test.txt"
    echo "echo 'Hello Unix' > test.txt"
    echo "cat test.txt"
    echo "cp test.txt backup.txt"
    echo "rm test.txt"
    echo
    read -p "Try these commands, then press Enter to continue..."
    
    echo
    echo -e "${BOLD}Exercise 3: Command Chaining${NC}"
    echo "Tasks:"
    echo "1. List files and count the lines"
    echo "2. Find all .txt files in your home directory"
    echo "3. Display current date and save to file"
    echo "4. Show first 5 lines of /etc/passwd"
    echo
    echo -e "${GREEN}Solution commands:${NC}"
    echo "ls | wc -l"
    echo "find ~ -name '*.txt' 2>/dev/null"
    echo "date > current_date.txt"
    echo "head -5 /etc/passwd"
    echo
    
    update_progress "module1" 75
    read -p "Press Enter to return to module menu..."
    module1_fundamentals
}

# Module 1 Quiz
module1_quiz() {
    show_header
    echo -e "${YELLOW}MODULE 1 - KNOWLEDGE CHECK QUIZ${NC}"
    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo
    
    local score=0
    local total=5
    
    echo -e "${BOLD}Question 1:${NC} What does 'pwd' stand for?"
    echo "a) Password"
    echo "b) Print Working Directory"
    echo "c) Power Down"
    echo "d) Previous Working Directory"
    read -p "Answer: " ans
    if [ "$ans" = "b" ]; then
        echo -e "${GREEN}Correct!${NC}"
        ((score++))
    else
        echo -e "${RED}✗ Incorrect. The answer is b) Print Working Directory${NC}"
    fi
    echo
    
    echo -e "${BOLD}Question 2:${NC} Which symbol represents the home directory?"
    echo "a) /"
    echo "b) ."
    echo "c) ~"
    echo "d) .."
    read -p "Answer: " ans
    if [ "$ans" = "c" ]; then
        echo -e "${GREEN}Correct!${NC}"
        ((score++))
    else
        echo -e "${RED}✗ Incorrect. The answer is c) ~${NC}"
    fi
    echo
    
    echo -e "${BOLD}Question 3:${NC} What operator is used to pipe output between commands?"
    echo "a) >"
    echo "b) |"
    echo "c) &"
    echo "d) <"
    read -p "Answer: " ans
    if [ "$ans" = "b" ]; then
        echo -e "${GREEN}Correct!${NC}"
        ((score++))
    else
        echo -e "${RED}✗ Incorrect. The answer is b) |${NC}"
    fi
    echo
    
    echo -e "${BOLD}Question 4:${NC} Which command shows manual pages?"
    echo "a) help"
    echo "b) info"
    echo "c) man"
    echo "d) doc"
    read -p "Answer: " ans
    if [ "$ans" = "c" ]; then
        echo -e "${GREEN}Correct!${NC}"
        ((score++))
    else
        echo -e "${RED}✗ Incorrect. The answer is c) man${NC}"
    fi
    echo
    
    echo -e "${BOLD}Question 5:${NC} What does '>' do in a command?"
    echo "a) Compares values"
    echo "b) Redirects output to a file (overwrites)"
    echo "c) Appends to a file"
    echo "d) Reads from a file"
    read -p "Answer: " ans
    if [ "$ans" = "b" ]; then
        echo -e "${GREEN}Correct!${NC}"
        ((score++))
    else
        echo -e "${RED}✗ Incorrect. The answer is b) Redirects output to a file${NC}"
    fi
    echo
    
    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${BOLD}Quiz Score: $score/$total${NC}"
    
    if [ $score -eq $total ]; then
        echo -e "${GREEN}Perfect score! You've mastered the fundamentals!${NC}"
        update_progress "module1" 100
    elif [ $score -ge 3 ]; then
        echo -e "${YELLOW}Good job! Review the topics you missed.${NC}"
        update_progress "module1" 85
    else
        echo -e "${RED}Keep practicing! Review the tutorial again.${NC}"
    fi
    
    echo
    read -p "Press Enter to return to module menu..."
    module1_fundamentals
}

# Module 2: File System Mastery
module2_filesystem() {
    show_header
    echo -e "${YELLOW}MODULE 2: FILE SYSTEM MASTERY${NC}"
    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo
    
    echo -e "${BOLD}Learning Objectives:${NC}"
    echo "• Master file and directory operations"
    echo "• Understand Unix permissions system"
    echo "• Work with symbolic and hard links"
    echo "• Use advanced file search techniques"
    echo "• Manage file attributes and metadata"
    echo
    
    echo -e "${BOLD}Topics:${NC}"
    echo "1. File Types and Attributes"
    echo "2. Permissions (chmod, chown, umask)"
    echo "3. Links (ln, symlinks vs hardlinks)"
    echo "4. File Search (find, locate, which)"
    echo "5. File Operations (cp, mv, rm, mkdir)"
    echo "6. Archives and Compression (tar, gzip, zip)"
    echo "7. File Comparison (diff, cmp, comm)"
    echo "8. Access Control Lists (ACLs)"
    echo
    
    echo -e "${BOLD}Choose a lesson:${NC}"
    echo "1. Interactive Tutorial"
    echo "2. Practice Exercises"
    echo "3. Permissions Calculator"
    echo "4. Return to Main Menu"
    echo
    read -p "Select (1-4): " lesson_choice
    
    case $lesson_choice in
        1) module2_tutorial ;;
        2) module2_exercises ;;
        3) permissions_calculator ;;
        4) main_menu ;;
        *) module2_filesystem ;;
    esac
}

# Module 2 Tutorial
module2_tutorial() {
    show_header
    echo -e "${YELLOW}FILE SYSTEM MASTERY - INTERACTIVE TUTORIAL${NC}"
    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo
    
    echo -e "${BOLD}Lesson 1: Unix File Types${NC}"
    echo
    echo "Unix has 7 file types (shown by ls -l first character):"
    echo "• ${CYAN}-${NC}  Regular file"
    echo "• ${CYAN}d${NC}  Directory"
    echo "• ${CYAN}l${NC}  Symbolic link"
    echo "• ${CYAN}c${NC}  Character device"
    echo "• ${CYAN}b${NC}  Block device"
    echo "• ${CYAN}p${NC}  Named pipe (FIFO)"
    echo "• ${CYAN}s${NC}  Socket"
    echo
    read -p "Press Enter to continue..."
    
    echo
    echo -e "${BOLD}Lesson 2: File Permissions${NC}"
    echo
    echo "Permission format: ${CYAN}rwxrwxrwx${NC}"
    echo "Three groups: ${GREEN}owner${NC} ${YELLOW}group${NC} ${MAGENTA}others${NC}"
    echo
    echo "Permission values:"
    echo "• ${CYAN}r${NC} (read)    = 4"
    echo "• ${CYAN}w${NC} (write)   = 2"
    echo "• ${CYAN}x${NC} (execute) = 1"
    echo
    echo "Common permissions:"
    echo "• 755 = rwxr-xr-x (typical for executables)"
    echo "• 644 = rw-r--r-- (typical for files)"
    echo "• 700 = rwx------ (private to owner)"
    echo
    echo "Commands:"
    echo "• ${CYAN}chmod 755 file${NC}      - Set permissions"
    echo "• ${CYAN}chmod u+x file${NC}      - Add execute for owner"
    echo "• ${CYAN}chmod go-w file${NC}     - Remove write for group/others"
    echo "• ${CYAN}chown user:group file${NC} - Change ownership"
    echo
    read -p "Press Enter to continue..."
    
    echo
    echo -e "${BOLD}Lesson 3: Links${NC}"
    echo
    echo -e "${GREEN}Hard Links:${NC}"
    echo "• Point directly to inode"
    echo "• Cannot span filesystems"
    echo "• Cannot link directories"
    echo "• Original and link are equal"
    echo "• ${CYAN}ln source hardlink${NC}"
    echo
    echo -e "${GREEN}Symbolic Links:${NC}"
    echo "• Point to pathname"
    echo "• Can span filesystems"
    echo "• Can link directories"
    echo "• Clearly shows target"
    echo "• ${CYAN}ln -s source symlink${NC}"
    echo
    read -p "Press Enter to continue..."
    
    echo
    echo -e "${BOLD}Lesson 4: Finding Files${NC}"
    echo
    echo -e "${GREEN}find command:${NC}"
    echo "• ${CYAN}find /path -name '*.txt'${NC}     - By name"
    echo "• ${CYAN}find . -type d${NC}               - Find directories"
    echo "• ${CYAN}find . -size +10M${NC}            - Files over 10MB"
    echo "• ${CYAN}find . -mtime -7${NC}             - Modified in last 7 days"
    echo "• ${CYAN}find . -user username${NC}        - By owner"
    echo "• ${CYAN}find . -perm 755${NC}             - By permissions"
    echo "• ${CYAN}find . -exec cmd {} \\;${NC}       - Execute command"
    echo
    echo -e "${GREEN}locate command:${NC}"
    echo "• ${CYAN}locate filename${NC}              - Fast database search"
    echo "• ${CYAN}updatedb${NC}                     - Update locate database"
    echo
    
    update_progress "module2" 50
    read -p "Press Enter to return to module menu..."
    module2_filesystem
}

# Module 2 Exercises
module2_exercises() {
    show_header
    echo -e "${YELLOW}MODULE 2 - FILE SYSTEM EXERCISES${NC}"
    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo
    
    cd "$SANDBOX_DIR" 2>/dev/null || cd "$HOME"
    
    echo -e "${BOLD}Exercise 1: Permissions Practice${NC}"
    echo "Create a script and set proper permissions:"
    echo
    echo "Tasks:"
    echo "1. Create script.sh with: echo 'Hello World'"
    echo "2. Make it executable for owner only"
    echo "3. Make it readable by everyone"
    echo "4. Check the permissions"
    echo
    echo -e "${GREEN}Commands to try:${NC}"
    echo "echo '#!/bin/bash' > script.sh"
    echo "echo 'echo Hello World' >> script.sh"
    echo "chmod 744 script.sh"
    echo "ls -l script.sh"
    echo "./script.sh"
    echo
    read -p "Press Enter after trying these commands..."
    
    echo
    echo -e "${BOLD}Exercise 2: Working with Links${NC}"
    echo "Create and test different types of links:"
    echo
    echo "Tasks:"
    echo "1. Create a file original.txt"
    echo "2. Create a hard link to it"
    echo "3. Create a symbolic link to it"
    echo "4. Compare inode numbers"
    echo "5. Delete original and test links"
    echo
    echo -e "${GREEN}Commands to try:${NC}"
    echo "echo 'Original content' > original.txt"
    echo "ln original.txt hardlink.txt"
    echo "ln -s original.txt symlink.txt"
    echo "ls -li *.txt"
    echo "rm original.txt"
    echo "cat hardlink.txt  # Still works"
    echo "cat symlink.txt   # Broken link"
    echo
    
    update_progress "module2" 75
    read -p "Press Enter to return to module menu..."
    module2_filesystem
}

# Permissions Calculator
permissions_calculator() {
    show_header
    echo -e "${YELLOW}INTERACTIVE PERMISSIONS CALCULATOR${NC}"
    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo
    
    echo -e "${BOLD}Convert between symbolic and octal notation:${NC}"
    echo
    echo "1. Symbolic to Octal (e.g., rwxr-xr-- to 754)"
    echo "2. Octal to Symbolic (e.g., 644 to rw-r--r--)"
    echo "3. Interactive Permission Builder"
    echo "4. Return to Module Menu"
    echo
    read -p "Select (1-4): " calc_choice
    
    case $calc_choice in
        1)
            echo
            echo "Enter symbolic notation (e.g., rwxr-xr--):"
            read -p "> " symbolic
            
            # Convert to octal
            octal=""
            for ((i=0; i<9; i+=3)); do
                val=0
                [[ "${symbolic:$i:1}" == "r" ]] && val=$((val+4))
                [[ "${symbolic:$((i+1)):1}" == "w" ]] && val=$((val+2))
                [[ "${symbolic:$((i+2)):1}" == "x" ]] && val=$((val+1))
                octal="${octal}${val}"
            done
            
            echo -e "\n${GREEN}Octal notation: $octal${NC}"
            echo
            read -p "Press Enter to continue..."
            permissions_calculator
            ;;
            
        2)
            echo
            echo "Enter octal notation (e.g., 755):"
            read -p "> " octal
            
            # Convert to symbolic
            symbolic=""
            for digit in $(echo $octal | grep -o .); do
                perms=""
                [[ $((digit & 4)) -ne 0 ]] && perms="${perms}r" || perms="${perms}-"
                [[ $((digit & 2)) -ne 0 ]] && perms="${perms}w" || perms="${perms}-"
                [[ $((digit & 1)) -ne 0 ]] && perms="${perms}x" || perms="${perms}-"
                symbolic="${symbolic}${perms}"
            done
            
            echo -e "\n${GREEN}Symbolic notation: $symbolic${NC}"
            echo
            read -p "Press Enter to continue..."
            permissions_calculator
            ;;
            
        3)
            echo
            echo -e "${BOLD}Interactive Permission Builder${NC}"
            echo
            
            # Owner permissions
            echo "Owner permissions:"
            read -p "Read (y/n)? " o_r
            read -p "Write (y/n)? " o_w
            read -p "Execute (y/n)? " o_x
            
            # Group permissions
            echo "Group permissions:"
            read -p "Read (y/n)? " g_r
            read -p "Write (y/n)? " g_w
            read -p "Execute (y/n)? " g_x
            
            # Others permissions
            echo "Others permissions:"
            read -p "Read (y/n)? " a_r
            read -p "Write (y/n)? " a_w
            read -p "Execute (y/n)? " a_x
            
            # Calculate
            o_val=0
            [[ "$o_r" == "y" ]] && o_val=$((o_val+4))
            [[ "$o_w" == "y" ]] && o_val=$((o_val+2))
            [[ "$o_x" == "y" ]] && o_val=$((o_val+1))
            
            g_val=0
            [[ "$g_r" == "y" ]] && g_val=$((g_val+4))
            [[ "$g_w" == "y" ]] && g_val=$((g_val+2))
            [[ "$g_x" == "y" ]] && g_val=$((g_val+1))
            
            a_val=0
            [[ "$a_r" == "y" ]] && a_val=$((a_val+4))
            [[ "$a_w" == "y" ]] && a_val=$((a_val+2))
            [[ "$a_x" == "y" ]] && a_val=$((a_val+1))
            
            echo
            echo -e "${GREEN}Octal: ${o_val}${g_val}${a_val}${NC}"
            echo -e "${GREEN}Command: chmod ${o_val}${g_val}${a_val} filename${NC}"
            echo
            read -p "Press Enter to continue..."
            permissions_calculator
            ;;
            
        4)
            module2_filesystem
            ;;
            
        *)
            permissions_calculator
            ;;
    esac
}

# Module 3: Process Management
module3_processes() {
    show_header
    echo -e "${YELLOW}MODULE 3: PROCESS MANAGEMENT${NC}"
    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo
    
    echo -e "${BOLD}Learning Objectives:${NC}"
    echo "• Understand process lifecycle and states"
    echo "• Master process monitoring tools"
    echo "• Control processes with signals"
    echo "• Manage background and foreground jobs"
    echo "• Monitor system resources"
    echo
    
    echo -e "${BOLD}Topics:${NC}"
    echo "1. Process Basics (PID, PPID, states)"
    echo "2. Process Monitoring (ps, top, htop)"
    echo "3. Signals and Process Control"
    echo "4. Job Control (bg, fg, jobs, nohup)"
    echo "5. Process Priority (nice, renice)"
    echo "6. System Monitoring (vmstat, iostat, sar)"
    echo "7. Process Trees and Relationships"
    echo "8. Resource Limits (ulimit)"
    echo
    
    echo -e "${BOLD}Choose an option:${NC}"
    echo "1. Interactive Tutorial"
    echo "2. Live Process Monitor"
    echo "3. Signal Reference Guide"
    echo "4. Return to Main Menu"
    echo
    read -p "Select (1-4): " lesson_choice
    
    case $lesson_choice in
        1) module3_tutorial ;;
        2) process_monitor ;;
        3) signal_reference ;;
        4) main_menu ;;
        *) module3_processes ;;
    esac
}

# Module 3 Tutorial
module3_tutorial() {
    show_header
    echo -e "${YELLOW}PROCESS MANAGEMENT - INTERACTIVE TUTORIAL${NC}"
    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo
    
    echo -e "${BOLD}Lesson 1: Process Basics${NC}"
    echo
    echo "Every process has:"
    echo "• ${CYAN}PID${NC}   - Process ID (unique identifier)"
    echo "• ${CYAN}PPID${NC}  - Parent Process ID"
    echo "• ${CYAN}UID${NC}   - User ID of owner"
    echo "• ${CYAN}State${NC} - Running, Sleeping, Stopped, Zombie"
    echo
    echo "Process states:"
    echo "• ${GREEN}R${NC} - Running or runnable"
    echo "• ${YELLOW}S${NC} - Sleeping (waiting for event)"
    echo "• ${CYAN}D${NC} - Uninterruptible sleep"
    echo "• ${MAGENTA}T${NC} - Stopped (suspended)"
    echo "• ${RED}Z${NC} - Zombie (terminated but not reaped)"
    echo
    read -p "Press Enter to continue..."
    
    echo
    echo -e "${BOLD}Lesson 2: Viewing Processes${NC}"
    echo
    echo -e "${GREEN}ps command options:${NC}"
    echo "• ${CYAN}ps${NC}         - Your processes"
    echo "• ${CYAN}ps aux${NC}     - All processes (BSD style)"
    echo "• ${CYAN}ps -ef${NC}     - All processes (System V style)"
    echo "• ${CYAN}ps -ejH${NC}    - Process tree"
    echo "• ${CYAN}ps -eo pid,ppid,cmd,%mem,%cpu${NC} - Custom format"
    echo
    echo -e "${GREEN}Real-time monitoring:${NC}"
    echo "• ${CYAN}top${NC}        - Interactive process viewer"
    echo "• ${CYAN}htop${NC}       - Enhanced top (if installed)"
    echo "• ${CYAN}pstree${NC}     - Process tree visualization"
    echo
    read -p "Press Enter to continue..."
    
    echo
    echo -e "${BOLD}Lesson 3: Process Signals${NC}"
    echo
    echo "Common signals:"
    echo "• ${CYAN}SIGHUP${NC}  (1)  - Hangup, reload configuration"
    echo "• ${CYAN}SIGINT${NC}  (2)  - Interrupt (Ctrl+C)"
    echo "• ${CYAN}SIGQUIT${NC} (3)  - Quit (Ctrl+\\)"
    echo "• ${CYAN}SIGKILL${NC} (9)  - Force kill (cannot be caught)"
    echo "• ${CYAN}SIGTERM${NC} (15) - Terminate gracefully (default)"
    echo "• ${CYAN}SIGSTOP${NC} (19) - Stop process (Ctrl+Z)"
    echo "• ${CYAN}SIGCONT${NC} (18) - Continue stopped process"
    echo
    echo "Sending signals:"
    echo "• ${CYAN}kill PID${NC}         - Send SIGTERM"
    echo "• ${CYAN}kill -9 PID${NC}      - Force kill"
    echo "• ${CYAN}killall name${NC}     - Kill by name"
    echo "• ${CYAN}pkill pattern${NC}    - Kill by pattern"
    echo
    read -p "Press Enter to continue..."
    
    echo
    echo -e "${BOLD}Lesson 4: Job Control${NC}"
    echo
    echo "Background/Foreground:"
    echo "• ${CYAN}command &${NC}         - Run in background"
    echo "• ${CYAN}Ctrl+Z${NC}           - Suspend current job"
    echo "• ${CYAN}jobs${NC}             - List jobs"
    echo "• ${CYAN}bg %1${NC}            - Resume job 1 in background"
    echo "• ${CYAN}fg %1${NC}            - Bring job 1 to foreground"
    echo "• ${CYAN}disown %1${NC}        - Detach job from shell"
    echo "• ${CYAN}nohup command &${NC}  - Run immune to hangups"
    echo
    echo "Process priority:"
    echo "• ${CYAN}nice -n 10 command${NC}  - Start with lower priority"
    echo "• ${CYAN}renice 10 PID${NC}       - Change priority"
    echo "• Priority range: -20 (highest) to 19 (lowest)"
    echo
    
    update_progress "module3" 50
    read -p "Press Enter to return to module menu..."
    module3_processes
}

# Process Monitor
process_monitor() {
    show_header
    echo -e "${YELLOW}LIVE PROCESS MONITOR${NC}"
    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo
    
    echo -e "${BOLD}System Overview:${NC}"
    echo
    
    # Show system info
    echo -e "${GREEN}System Load:${NC}"
    uptime
    echo
    
    # Show memory usage
    echo -e "${GREEN}Memory Usage:${NC}"
    free -h 2>/dev/null || vm_stat 2>/dev/null | head -5
    echo
    
    # Show top processes
    echo -e "${GREEN}Top CPU Processes:${NC}"
    ps aux | head -1
    ps aux | sort -nrk 3,3 | head -6 | tail -5
    echo
    
    echo -e "${GREEN}Top Memory Processes:${NC}"
    ps aux | head -1
    ps aux | sort -nrk 4,4 | head -6 | tail -5
    echo
    
    # Count processes
    echo -e "${GREEN}Process Statistics:${NC}"
    echo "Total processes: $(ps aux | wc -l)"
    echo "Your processes: $(ps -u $USER | wc -l)"
    echo "Running processes: $(ps aux | grep -c ' R ')"
    echo "Sleeping processes: $(ps aux | grep -c ' S ')"
    echo
    
    read -p "Press Enter to return to module menu..."
    module3_processes
}

# Signal Reference
signal_reference() {
    show_header
    echo -e "${YELLOW}UNIX SIGNAL REFERENCE GUIDE${NC}"
    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo
    
    echo -e "${BOLD}Standard Signals:${NC}"
    echo
    printf "%-8s %-8s %-15s %s\n" "Signal" "Number" "Default Action" "Description"
    printf "%-8s %-8s %-15s %s\n" "------" "------" "--------------" "-----------"
    printf "%-8s %-8s %-15s %s\n" "SIGHUP" "1" "Terminate" "Hangup detected"
    printf "%-8s %-8s %-15s %s\n" "SIGINT" "2" "Terminate" "Interrupt from keyboard (Ctrl+C)"
    printf "%-8s %-8s %-15s %s\n" "SIGQUIT" "3" "Core dump" "Quit from keyboard (Ctrl+\\)"
    printf "%-8s %-8s %-15s %s\n" "SIGILL" "4" "Core dump" "Illegal instruction"
    printf "%-8s %-8s %-15s %s\n" "SIGTRAP" "5" "Core dump" "Trace/breakpoint trap"
    printf "%-8s %-8s %-15s %s\n" "SIGABRT" "6" "Core dump" "Abort signal"
    printf "%-8s %-8s %-15s %s\n" "SIGBUS" "7" "Core dump" "Bus error"
    printf "%-8s %-8s %-15s %s\n" "SIGFPE" "8" "Core dump" "Floating point exception"
    printf "%-8s %-8s %-15s %s\n" "SIGKILL" "9" "Terminate" "Kill (cannot be caught)"
    printf "%-8s %-8s %-15s %s\n" "SIGUSR1" "10" "Terminate" "User-defined signal 1"
    printf "%-8s %-8s %-15s %s\n" "SIGSEGV" "11" "Core dump" "Segmentation fault"
    printf "%-8s %-8s %-15s %s\n" "SIGUSR2" "12" "Terminate" "User-defined signal 2"
    printf "%-8s %-8s %-15s %s\n" "SIGPIPE" "13" "Terminate" "Broken pipe"
    printf "%-8s %-8s %-15s %s\n" "SIGALRM" "14" "Terminate" "Timer signal"
    printf "%-8s %-8s %-15s %s\n" "SIGTERM" "15" "Terminate" "Termination signal"
    printf "%-8s %-8s %-15s %s\n" "SIGCHLD" "17" "Ignore" "Child stopped or terminated"
    printf "%-8s %-8s %-15s %s\n" "SIGCONT" "18" "Continue" "Continue if stopped"
    printf "%-8s %-8s %-15s %s\n" "SIGSTOP" "19" "Stop" "Stop process (cannot be caught)"
    printf "%-8s %-8s %-15s %s\n" "SIGTSTP" "20" "Stop" "Stop from terminal (Ctrl+Z)"
    echo
    
    echo -e "${BOLD}Usage Examples:${NC}"
    echo -e "• ${CYAN}kill -l${NC}              - List all signals"
    echo -e "• ${CYAN}kill -HUP \$(pidof process)${NC} - Send SIGHUP"
    echo -e "• ${CYAN}trap 'echo Caught' SIGINT${NC}  - Catch signal in script"
    echo
    
    update_progress "module3" 75
    read -p "Press Enter to return to module menu..."
    module3_processes
}

# Module 4: Shell Scripting
module4_scripting() {
    show_header
    echo -e "${YELLOW}MODULE 4: SHELL SCRIPTING${NC}"
    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo
    
    echo -e "${BOLD}Learning Objectives:${NC}"
    echo "• Write effective shell scripts"
    echo "• Use variables and control structures"
    echo "• Handle input and arguments"
    echo "• Implement error handling"
    echo "• Create reusable functions"
    echo
    
    echo -e "${BOLD}Topics:${NC}"
    echo "1. Script Basics and Shebang"
    echo "2. Variables and Arrays"
    echo "3. Control Structures (if, for, while, case)"
    echo "4. Functions and Libraries"
    echo "5. Input/Output and Arguments"
    echo "6. Error Handling and Debugging"
    echo "7. Regular Expressions"
    echo "8. Best Practices"
    echo
    
    echo -e "${BOLD}Choose an option:${NC}"
    echo "1. Interactive Tutorial"
    echo "2. Script Templates"
    echo "3. Debugging Workshop"
    echo "4. Return to Main Menu"
    echo
    read -p "Select (1-4): " lesson_choice
    
    case $lesson_choice in
        1) module4_tutorial ;;
        2) script_templates ;;
        3) debugging_workshop ;;
        4) main_menu ;;
        *) module4_scripting ;;
    esac
}

# Module 4 Tutorial
module4_tutorial() {
    show_header
    echo -e "${YELLOW}SHELL SCRIPTING - INTERACTIVE TUTORIAL${NC}"
    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo
    
    echo -e "${BOLD}Lesson 1: Script Basics${NC}"
    echo
    echo "Every script should start with:"
    echo -e "${CYAN}#!/bin/bash${NC}  - Shebang line specifies interpreter"
    echo
    echo "Script structure:"
    cat << 'EOF'
#!/bin/bash
# Script description

# Variables
NAME="value"

# Functions
function_name() {
    echo "Function body"
}

# Main logic
echo "Script execution"
EOF
    echo
    read -p "Press Enter to continue..."
    
    echo
    echo -e "${BOLD}Lesson 2: Variables${NC}"
    echo
    echo "Variable types:"
    echo -e "• ${CYAN}VAR=value${NC}        - Regular variable"
    echo -e "• ${CYAN}readonly VAR${NC}     - Read-only variable"
    echo -e "• ${CYAN}export VAR${NC}       - Environment variable"
    echo -e "• ${CYAN}local VAR${NC}        - Local to function"
    echo
    echo "Special variables:"
    echo -e "• ${CYAN}\$0${NC}   - Script name"
    echo -e "• ${CYAN}\$1-9${NC} - Arguments 1-9"
    echo -e "• ${CYAN}\$#${NC}   - Number of arguments"
    echo -e "• ${CYAN}\$@${NC}   - All arguments"
    echo -e "• ${CYAN}\$?${NC}   - Exit status of last command"
    echo -e "• ${CYAN}\$\$${NC}   - Process ID"
    echo -e "• ${CYAN}\$!${NC}   - PID of last background process"
    echo
    read -p "Press Enter to continue..."
    
    echo
    echo -e "${BOLD}Lesson 3: Control Structures${NC}"
    echo
    echo -e "${GREEN}If statement:${NC}"
    cat << 'EOF'
if [ condition ]; then
    commands
elif [ condition ]; then
    commands
else
    commands
fi
EOF
    echo
    echo -e "${GREEN}For loop:${NC}"
    cat << 'EOF'
for item in list; do
    commands
done

for ((i=0; i<10; i++)); do
    commands
done
EOF
    echo
    echo -e "${GREEN}While loop:${NC}"
    cat << 'EOF'
while [ condition ]; do
    commands
done
EOF
    echo
    echo -e "${GREEN}Case statement:${NC}"
    cat << 'EOF'
case $variable in
    pattern1) commands ;;
    pattern2) commands ;;
    *) default commands ;;
esac
EOF
    echo
    read -p "Press Enter to continue..."
    
    echo
    echo -e "${BOLD}Lesson 4: Test Conditions${NC}"
    echo
    echo "File tests:"
    echo "• ${CYAN}-e file${NC}   - File exists"
    echo "• ${CYAN}-f file${NC}   - Regular file"
    echo "• ${CYAN}-d file${NC}   - Directory"
    echo "• ${CYAN}-r file${NC}   - Readable"
    echo "• ${CYAN}-w file${NC}   - Writable"
    echo "• ${CYAN}-x file${NC}   - Executable"
    echo "• ${CYAN}-s file${NC}   - File not empty"
    echo
    echo "String tests:"
    echo "• ${CYAN}-z string${NC}      - String is empty"
    echo "• ${CYAN}-n string${NC}      - String is not empty"
    echo "• ${CYAN}str1 = str2${NC}   - Strings are equal"
    echo "• ${CYAN}str1 != str2${NC}  - Strings are not equal"
    echo
    echo "Numeric tests:"
    echo "• ${CYAN}-eq${NC}  - Equal"
    echo "• ${CYAN}-ne${NC}  - Not equal"
    echo "• ${CYAN}-gt${NC}  - Greater than"
    echo "• ${CYAN}-lt${NC}  - Less than"
    echo "• ${CYAN}-ge${NC}  - Greater or equal"
    echo "• ${CYAN}-le${NC}  - Less or equal"
    echo
    
    update_progress "module4" 50
    read -p "Press Enter to return to module menu..."
    module4_scripting
}

# Script Templates
script_templates() {
    show_header
    echo -e "${YELLOW}SHELL SCRIPT TEMPLATES${NC}"
    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo
    
    echo "Select a template to view:"
    echo "1. Basic Script Template"
    echo "2. Script with Arguments"
    echo "3. Menu-driven Script"
    echo "4. File Processing Script"
    echo "5. System Monitoring Script"
    echo "6. Return to Module Menu"
    echo
    read -p "Select (1-6): " template_choice
    
    case $template_choice in
        1)
            echo
            echo -e "${BOLD}Basic Script Template:${NC}"
            cat << 'EOF'
#!/bin/bash
#
# Script: script_name.sh
# Description: Brief description
# Author: Your name
# Date: $(date +%Y-%m-%d)
#

set -euo pipefail  # Exit on error, undefined vars, pipe failures

# Constants
readonly SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
readonly SCRIPT_NAME="$(basename "$0")"

# Functions
log() {
    echo "[$(date +'%Y-%m-%d %H:%M:%S')] $*"
}

error() {
    echo "[ERROR] $*" >&2
    exit 1
}

main() {
    log "Starting $SCRIPT_NAME"
    
    # Main logic here
    
    log "Completed successfully"
}

# Run main function
main "$@"
EOF
            ;;
            
        2)
            echo
            echo -e "${BOLD}Script with Arguments:${NC}"
            cat << 'EOF'
#!/bin/bash

usage() {
    cat << USAGE
Usage: $0 [OPTIONS] ARG1 ARG2

Description of what the script does

OPTIONS:
    -h, --help      Show this help message
    -v, --verbose   Enable verbose output
    -f, --file FILE Input file
    
ARGUMENTS:
    ARG1    Description of argument 1
    ARG2    Description of argument 2

EXAMPLES:
    $0 -v input.txt output.txt
    $0 --file data.csv process

USAGE
    exit 0
}

# Parse arguments
VERBOSE=false
FILE=""

while [[ $# -gt 0 ]]; do
    case $1 in
        -h|--help)
            usage
            ;;
        -v|--verbose)
            VERBOSE=true
            shift
            ;;
        -f|--file)
            FILE="$2"
            shift 2
            ;;
        -*)
            echo "Unknown option: $1"
            usage
            ;;
        *)
            break
            ;;
    esac
done

# Check required arguments
if [[ $# -lt 2 ]]; then
    echo "Error: Missing required arguments"
    usage
fi

ARG1="$1"
ARG2="$2"

# Main logic
[[ "$VERBOSE" == true ]] && echo "Processing with verbose mode"
echo "Working with: $ARG1 and $ARG2"
[[ -n "$FILE" ]] && echo "Using file: $FILE"
EOF
            ;;
            
        3)
            echo
            echo -e "${BOLD}Menu-driven Script:${NC}"
            cat << 'EOF'
#!/bin/bash

show_menu() {
    clear
    echo "================================"
    echo "         MAIN MENU"
    echo "================================"
    echo "1. Option One"
    echo "2. Option Two"
    echo "3. Option Three"
    echo "4. Settings"
    echo "5. Help"
    echo "0. Exit"
    echo "================================"
}

option_one() {
    echo "Executing Option One..."
    # Add logic here
    read -p "Press Enter to continue..."
}

option_two() {
    echo "Executing Option Two..."
    # Add logic here
    read -p "Press Enter to continue..."
}

# Main loop
while true; do
    show_menu
    read -p "Enter choice [0-5]: " choice
    
    case $choice in
        1) option_one ;;
        2) option_two ;;
        3) echo "Option Three selected" ;;
        4) echo "Settings" ;;
        5) echo "Help" ;;
        0) echo "Goodbye!"; exit 0 ;;
        *) echo "Invalid option"; sleep 2 ;;
    esac
done
EOF
            ;;
            
        4)
            echo
            echo -e "${BOLD}File Processing Script:${NC}"
            cat << 'EOF'
#!/bin/bash

# Check if file is provided
if [[ $# -eq 0 ]]; then
    echo "Usage: $0 <filename>"
    exit 1
fi

INPUT_FILE="$1"

# Check if file exists
if [[ ! -f "$INPUT_FILE" ]]; then
    echo "Error: File '$INPUT_FILE' not found"
    exit 1
fi

# Process file line by line
line_count=0
word_count=0

while IFS= read -r line; do
    ((line_count++))
    
    # Count words in line
    words=$(echo "$line" | wc -w)
    word_count=$((word_count + words))
    
    # Process each line (example: convert to uppercase)
    processed=$(echo "$line" | tr '[:lower:]' '[:upper:]')
    echo "Line $line_count: $processed"
    
done < "$INPUT_FILE"

echo "Summary:"
echo "Total lines: $line_count"
echo "Total words: $word_count"
EOF
            ;;
            
        5)
            echo
            echo -e "${BOLD}System Monitoring Script:${NC}"
            cat << 'EOF'
#!/bin/bash

# System monitoring script
LOG_FILE="/tmp/system_monitor.log"

log_message() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" | tee -a "$LOG_FILE"
}

check_disk_usage() {
    log_message "Checking disk usage..."
    df -h | grep -vE '^Filesystem|tmpfs|cdrom' | awk '{print $5 " " $1}' | while read output; do
        usage=$(echo $output | awk '{print $1}' | sed 's/%//')
        partition=$(echo $output | awk '{print $2}')
        if [ $usage -ge 80 ]; then
            log_message "WARNING: Partition $partition is ${usage}% full"
        fi
    done
}

check_memory() {
    log_message "Checking memory usage..."
    free -m | awk 'NR==2{printf "Memory Usage: %.2f%%\n", $3*100/$2}'
}

check_cpu() {
    log_message "Checking CPU usage..."
    top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print "CPU Usage: " 100 - $1"%"}'
}

check_processes() {
    log_message "Top 5 CPU consuming processes:"
    ps aux | sort -nrk 3,3 | head -5
}

# Main monitoring loop
log_message "Starting system monitoring"

check_disk_usage
check_memory
check_cpu
check_processes

log_message "Monitoring complete"
EOF
            ;;
            
        6)
            module4_scripting
            ;;
            
        *)
            script_templates
            ;;
    esac
    
    echo
    read -p "Press Enter to continue..."
    script_templates
}

# Debugging Workshop
debugging_workshop() {
    show_header
    echo -e "${YELLOW}SHELL SCRIPT DEBUGGING WORKSHOP${NC}"
    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo
    
    echo -e "${BOLD}Debugging Techniques:${NC}"
    echo
    echo "1. ${GREEN}Debug modes:${NC}"
    echo "   • ${CYAN}bash -x script.sh${NC}     - Print commands as executed"
    echo "   • ${CYAN}bash -v script.sh${NC}     - Print script lines as read"
    echo "   • ${CYAN}bash -n script.sh${NC}     - Check syntax only"
    echo
    echo "2. ${GREEN}In-script debugging:${NC}"
    echo "   • ${CYAN}set -x${NC}               - Enable debug mode"
    echo "   • ${CYAN}set +x${NC}               - Disable debug mode"
    echo "   • ${CYAN}set -e${NC}               - Exit on error"
    echo "   • ${CYAN}set -u${NC}               - Exit on undefined variable"
    echo "   • ${CYAN}set -o pipefail${NC}      - Exit on pipe failure"
    echo
    echo "3. ${GREEN}Debug output:${NC}"
    echo "   • ${CYAN}echo \"Debug: \$variable\"${NC}"
    echo "   • ${CYAN}echo \"Debug\" >&2${NC}      - Output to stderr"
    echo "   • ${CYAN}PS4='+ Line \$LINENO: '${NC} - Customize debug prompt"
    echo
    echo "4. ${GREEN}Trap errors:${NC}"
    cat << 'EOF'
trap 'echo "Error on line $LINENO"' ERR

debug() {
    [ "$DEBUG" = true ] && echo "DEBUG: $*" >&2
}

# Usage: DEBUG=true ./script.sh
EOF
    echo
    echo "5. ${GREEN}Common issues:${NC}"
    echo "   • Spaces in variables - use quotes: \"\$var\""
    echo "   • Undefined variables - use \${var:-default}"
    echo "   • Command substitution - use \$(command) not backticks"
    echo "   • Test conditions - use [[ ]] instead of [ ]"
    echo
    
    update_progress "module4" 75
    read -p "Press Enter to return to module menu..."
    module4_scripting
}

# Module 5: Text Processing
module5_text_processing() {
    show_header
    echo -e "${YELLOW}MODULE 5: TEXT PROCESSING${NC}"
    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo
    
    echo -e "${BOLD}Learning Objectives:${NC}"
    echo "• Master grep for pattern matching"
    echo "• Transform text with sed"
    echo "• Process data with awk"
    echo "• Use regular expressions effectively"
    echo "• Combine tools for complex processing"
    echo
    
    echo -e "${BOLD}Topics:${NC}"
    echo "1. grep - Pattern Searching"
    echo "2. sed - Stream Editor"
    echo "3. awk - Pattern Processing"
    echo "4. Regular Expressions"
    echo "5. cut, sort, uniq, tr"
    echo "6. Text Processing Pipelines"
    echo
    
    echo -e "${BOLD}Choose an option:${NC}"
    echo "1. Interactive Tutorial"
    echo "2. Regex Playground"
    echo "3. Text Processing Challenges"
    echo "4. Return to Main Menu"
    echo
    read -p "Select (1-4): " lesson_choice
    
    case $lesson_choice in
        1) module5_tutorial ;;
        2) regex_playground ;;
        3) text_challenges ;;
        4) main_menu ;;
        *) module5_text_processing ;;
    esac
}

# Module 5 Tutorial
module5_tutorial() {
    show_header
    echo -e "${YELLOW}TEXT PROCESSING - INTERACTIVE TUTORIAL${NC}"
    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo
    
    echo -e "${BOLD}Tool 1: grep (Global Regular Expression Print)${NC}"
    echo
    echo "Basic usage:"
    echo "• ${CYAN}grep pattern file${NC}         - Search for pattern"
    echo "• ${CYAN}grep -i pattern${NC}           - Case insensitive"
    echo "• ${CYAN}grep -v pattern${NC}           - Invert match"
    echo "• ${CYAN}grep -n pattern${NC}           - Show line numbers"
    echo "• ${CYAN}grep -c pattern${NC}           - Count matches"
    echo "• ${CYAN}grep -r pattern dir${NC}       - Recursive search"
    echo "• ${CYAN}grep -E 'regex'${NC}           - Extended regex"
    echo "• ${CYAN}grep -A2 -B2 pattern${NC}      - Show context"
    echo
    read -p "Press Enter to continue..."
    
    echo
    echo -e "${BOLD}Tool 2: sed (Stream Editor)${NC}"
    echo
    echo "Common operations:"
    echo "• ${CYAN}sed 's/old/new/'${NC}          - Replace first occurrence"
    echo "• ${CYAN}sed 's/old/new/g'${NC}         - Replace all occurrences"
    echo "• ${CYAN}sed '3d'${NC}                  - Delete line 3"
    echo "• ${CYAN}sed '1,5d'${NC}                - Delete lines 1-5"
    echo "• ${CYAN}sed '/pattern/d'${NC}          - Delete matching lines"
    echo "• ${CYAN}sed -n '5,10p'${NC}            - Print lines 5-10"
    echo "• ${CYAN}sed 's/^/prefix/'${NC}         - Add prefix to lines"
    echo "• ${CYAN}sed -i.bak 's/a/b/'${NC}       - Edit file in-place"
    echo
    read -p "Press Enter to continue..."
    
    echo
    echo -e "${BOLD}Tool 3: awk (Pattern Processing)${NC}"
    echo
    echo "Structure: ${CYAN}awk 'pattern { action }'${NC}"
    echo
    echo "Examples:"
    echo "• ${CYAN}awk '{print \$1}'${NC}          - Print first field"
    echo "• ${CYAN}awk '{print \$NF}'${NC}         - Print last field"
    echo "• ${CYAN}awk 'NR==5'${NC}               - Print line 5"
    echo "• ${CYAN}awk '\$3 > 100'${NC}            - Lines where field 3 > 100"
    echo "• ${CYAN}awk '{sum+=\$1} END {print sum}'${NC} - Sum column"
    echo "• ${CYAN}awk -F: '{print \$1}'${NC}      - Set field separator"
    echo "• ${CYAN}awk 'BEGIN{OFS=\",\"} {print \$1,\$2}'${NC} - Output separator"
    echo
    echo "Built-in variables:"
    echo "• ${GREEN}NF${NC}  - Number of fields"
    echo "• ${GREEN}NR${NC}  - Record number"
    echo "• ${GREEN}FS${NC}  - Field separator"
    echo "• ${GREEN}OFS${NC} - Output field separator"
    echo
    read -p "Press Enter to continue..."
    
    echo
    echo -e "${BOLD}Regular Expressions Basics${NC}"
    echo
    echo "Anchors:"
    echo "• ${CYAN}^${NC}   - Start of line"
    echo "• ${CYAN}\$${NC}   - End of line"
    echo "• ${CYAN}\\b${NC}  - Word boundary"
    echo
    echo "Character classes:"
    echo "• ${CYAN}.${NC}   - Any character"
    echo "• ${CYAN}[abc]${NC} - Any of a, b, or c"
    echo "• ${CYAN}[^abc]${NC} - Not a, b, or c"
    echo "• ${CYAN}[a-z]${NC} - Range a to z"
    echo "• ${CYAN}\\d${NC}  - Digit [0-9]"
    echo "• ${CYAN}\\w${NC}  - Word character [a-zA-Z0-9_]"
    echo "• ${CYAN}\\s${NC}  - Whitespace"
    echo
    echo "Quantifiers:"
    echo "• ${CYAN}*${NC}   - 0 or more"
    echo "• ${CYAN}+${NC}   - 1 or more"
    echo "• ${CYAN}?${NC}   - 0 or 1"
    echo "• ${CYAN}{3}${NC} - Exactly 3"
    echo "• ${CYAN}{3,5}${NC} - Between 3 and 5"
    echo
    
    update_progress "module5" 50
    read -p "Press Enter to return to module menu..."
    module5_text_processing
}

# Regex Playground
regex_playground() {
    show_header
    echo -e "${YELLOW}REGULAR EXPRESSION PLAYGROUND${NC}"
    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo
    
    # Create test file
    cat > /tmp/regex_test.txt << 'EOF'
john.doe@email.com
jane_smith@company.org
invalid-email
Phone: 555-123-4567
Phone: (555) 987-6543
Date: 2024-03-15
Date: 15/03/2024
IP: 192.168.1.1
IP: 256.300.1.1
URL: https://www.example.com
URL: http://subdomain.site.org/path
Credit Card: 4532-1234-5678-9012
SSN: 123-45-6789
EOF
    
    echo "Test file created with sample data"
    echo
    echo -e "${BOLD}Common Regex Patterns:${NC}"
    echo
    echo "1. Email addresses"
    echo "2. Phone numbers"
    echo "3. Dates"
    echo "4. IP addresses"
    echo "5. URLs"
    echo "6. Credit card numbers"
    echo "7. Custom pattern"
    echo "8. View test file"
    echo "9. Return to module"
    echo
    read -p "Select pattern to test (1-9): " pattern_choice
    
    case $pattern_choice in
        1)
            echo
            echo "Pattern: ${CYAN}[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}${NC}"
            echo "Matches:"
            grep -E '[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}' /tmp/regex_test.txt
            ;;
        2)
            echo
            echo "Pattern: ${CYAN}\\(?[0-9]{3}\\)?[-. ]?[0-9]{3}[-. ]?[0-9]{4}${NC}"
            echo "Matches:"
            grep -E '\(?[0-9]{3}\)?[-. ]?[0-9]{3}[-. ]?[0-9]{4}' /tmp/regex_test.txt
            ;;
        3)
            echo
            echo "Pattern: ${CYAN}[0-9]{4}-[0-9]{2}-[0-9]{2}|[0-9]{2}/[0-9]{2}/[0-9]{4}${NC}"
            echo "Matches:"
            grep -E '[0-9]{4}-[0-9]{2}-[0-9]{2}|[0-9]{2}/[0-9]{2}/[0-9]{4}' /tmp/regex_test.txt
            ;;
        4)
            echo
            echo "Pattern: ${CYAN}([0-9]{1,3}\\.){3}[0-9]{1,3}${NC}"
            echo "Matches:"
            grep -E '([0-9]{1,3}\.){3}[0-9]{1,3}' /tmp/regex_test.txt
            echo
            echo "Valid IPs only: ${CYAN}((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)${NC}"
            ;;
        5)
            echo
            echo "Pattern: ${CYAN}https?://[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}(/[^[:space:]]*)?${NC}"
            echo "Matches:"
            grep -E 'https?://[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}(/[^[:space:]]*)?' /tmp/regex_test.txt
            ;;
        6)
            echo
            echo "Pattern: ${CYAN}[0-9]{4}[- ]?[0-9]{4}[- ]?[0-9]{4}[- ]?[0-9]{4}${NC}"
            echo "Matches:"
            grep -E '[0-9]{4}[- ]?[0-9]{4}[- ]?[0-9]{4}[- ]?[0-9]{4}' /tmp/regex_test.txt
            ;;
        7)
            echo
            echo "Enter your regex pattern:"
            read -p "> " custom_pattern
            echo
            echo "Matches:"
            grep -E "$custom_pattern" /tmp/regex_test.txt 2>/dev/null || echo "No matches or invalid pattern"
            ;;
        8)
            echo
            cat /tmp/regex_test.txt
            ;;
        9)
            module5_text_processing
            return
            ;;
    esac
    
    echo
    read -p "Press Enter to continue..."
    regex_playground
}

# Text Processing Challenges
text_challenges() {
    show_header
    echo -e "${YELLOW}TEXT PROCESSING CHALLENGES${NC}"
    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo
    
    # Create sample data
    cat > /tmp/data.csv << 'EOF'
Name,Department,Salary,Years
John Smith,Engineering,85000,5
Jane Doe,Marketing,72000,3
Bob Johnson,Engineering,95000,8
Alice Brown,Sales,68000,2
Charlie Wilson,Engineering,78000,4
Eve Davis,Marketing,82000,6
EOF
    
    echo -e "${BOLD}Challenge Data: Employee Records (data.csv)${NC}"
    echo
    cat /tmp/data.csv
    echo
    echo -e "${BOLD}Challenges:${NC}"
    echo
    echo "1. Extract all Engineering employees"
    echo "2. Calculate total salary bill"
    echo "3. Find highest paid employee"
    echo "4. Sort by years of experience"
    echo "5. Count employees per department"
    echo "6. Format as HTML table"
    echo "7. Return to module"
    echo
    read -p "Select challenge (1-7): " challenge_choice
    
    case $challenge_choice in
        1)
            echo
            echo -e "${GREEN}Solution:${NC}"
            echo "grep Engineering /tmp/data.csv"
            echo
            echo -e "${CYAN}Result:${NC}"
            grep Engineering /tmp/data.csv
            ;;
        2)
            echo
            echo -e "${GREEN}Solution:${NC}"
            echo "awk -F, 'NR>1 {sum+=\$3} END {print \"Total: \$\" sum}' /tmp/data.csv"
            echo
            echo -e "${CYAN}Result:${NC}"
            awk -F, 'NR>1 {sum+=$3} END {print "Total: $" sum}' /tmp/data.csv
            ;;
        3)
            echo
            echo -e "${GREEN}Solution:${NC}"
            echo "awk -F, 'NR>1 {if(\$3>max){max=\$3; name=\$1}} END {print name \" - \$\" max}' /tmp/data.csv"
            echo
            echo -e "${CYAN}Result:${NC}"
            awk -F, 'NR>1 {if($3>max){max=$3; name=$1}} END {print name " - $" max}' /tmp/data.csv
            ;;
        4)
            echo
            echo -e "${GREEN}Solution:${NC}"
            echo "sort -t, -k4 -n /tmp/data.csv"
            echo
            echo -e "${CYAN}Result:${NC}"
            head -1 /tmp/data.csv
            tail -n +2 /tmp/data.csv | sort -t, -k4 -n
            ;;
        5)
            echo
            echo -e "${GREEN}Solution:${NC}"
            echo "awk -F, 'NR>1 {dept[\$2]++} END {for(d in dept) print d \": \" dept[d]}' /tmp/data.csv"
            echo
            echo -e "${CYAN}Result:${NC}"
            awk -F, 'NR>1 {dept[$2]++} END {for(d in dept) print d ": " dept[d]}' /tmp/data.csv
            ;;
        6)
            echo
            echo -e "${GREEN}Solution:${NC}"
            echo "Convert CSV to HTML table"
            echo
            echo -e "${CYAN}Result:${NC}"
            echo "<table border='1'>"
            awk -F, 'NR==1 {print "<tr>"; for(i=1;i<=NF;i++) print "<th>" $i "</th>"; print "</tr>"}
                     NR>1  {print "<tr>"; for(i=1;i<=NF;i++) print "<td>" $i "</td>"; print "</tr>"}' /tmp/data.csv
            echo "</table>"
            ;;
        7)
            module5_text_processing
            return
            ;;
    esac
    
    echo
    update_progress "module5" 75
    read -p "Press Enter to continue..."
    text_challenges
}

# Simplified versions of remaining modules (6-8)
# These would be expanded similarly to modules 1-5

module6_sysadmin() {
    show_header
    echo -e "${YELLOW}MODULE 6: SYSTEM ADMINISTRATION${NC}"
    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo
    
    echo -e "${BOLD}Topics Covered:${NC}"
    echo "• User and group management"
    echo "• System services (systemd/init)"
    echo "• Package management"
    echo "• System logs and journaling"
    echo "• Disk management and quotas"
    echo "• Backup strategies"
    echo "• Security basics"
    echo "• Performance monitoring"
    echo
    
    echo -e "${BOLD}Key Commands:${NC}"
    echo "• ${CYAN}useradd, usermod, passwd${NC} - User management"
    echo "• ${CYAN}systemctl, service${NC} - Service control"
    echo "• ${CYAN}apt, yum, dnf${NC} - Package managers"
    echo "• ${CYAN}journalctl, dmesg${NC} - System logs"
    echo "• ${CYAN}fdisk, mount, df, du${NC} - Disk management"
    echo "• ${CYAN}tar, rsync${NC} - Backup tools"
    echo "• ${CYAN}iptables, ufw${NC} - Firewall"
    echo
    
    update_progress "module6" 25
    read -p "Press Enter to return to main menu..."
    main_menu
}

module7_networking() {
    show_header
    echo -e "${YELLOW}MODULE 7: NETWORKING${NC}"
    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo
    
    echo -e "${BOLD}Topics Covered:${NC}"
    echo "• Network configuration"
    echo "• SSH and remote access"
    echo "• File transfer (scp, rsync, sftp)"
    echo "• Network troubleshooting"
    echo "• Port management"
    echo "• DNS and routing"
    echo "• Network security"
    echo
    
    echo -e "${BOLD}Essential Commands:${NC}"
    echo "• ${CYAN}ifconfig, ip${NC} - Network interface configuration"
    echo "• ${CYAN}ping, traceroute${NC} - Connectivity testing"
    echo "• ${CYAN}netstat, ss${NC} - Network statistics"
    echo "• ${CYAN}nslookup, dig${NC} - DNS queries"
    echo "• ${CYAN}ssh, scp, sftp${NC} - Secure connections"
    echo "• ${CYAN}curl, wget${NC} - HTTP/HTTPS tools"
    echo "• ${CYAN}tcpdump, wireshark${NC} - Packet analysis"
    echo
    
    update_progress "module7" 25
    read -p "Press Enter to return to main menu..."
    main_menu
}

module8_advanced() {
    show_header
    echo -e "${YELLOW}MODULE 8: ADVANCED TOPICS${NC}"
    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo
    
    echo -e "${BOLD}Expert-Level Topics:${NC}"
    echo "• Kernel tuning and parameters"
    echo "• Advanced shell features (arrays, coprocesses)"
    echo "• System calls and strace"
    echo "• Container technologies (Docker, Podman)"
    echo "• Configuration management (Ansible, Puppet)"
    echo "• Performance profiling"
    echo "• Advanced security (SELinux, AppArmor)"
    echo "• Automation and CI/CD"
    echo
    
    echo -e "${BOLD}Advanced Tools:${NC}"
    echo "• ${CYAN}strace, ltrace${NC} - System call tracing"
    echo "• ${CYAN}perf, oprofile${NC} - Performance analysis"
    echo "• ${CYAN}docker, kubectl${NC} - Container management"
    echo "• ${CYAN}ansible-playbook${NC} - Automation"
    echo "• ${CYAN}git${NC} - Version control"
    echo "• ${CYAN}tmux, screen${NC} - Terminal multiplexers"
    echo
    
    update_progress "module8" 25
    read -p "Press Enter to return to main menu..."
    main_menu
}

# Challenges Menu
challenges_menu() {
    show_header
    echo -e "${YELLOW}CHALLENGES & EXERCISES${NC}"
    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo
    
    echo -e "${BOLD}Practice Challenges:${NC}"
    echo
    echo "1. Beginner Challenges"
    echo "   - File management tasks"
    echo "   - Basic command practice"
    echo "   - Simple scripts"
    echo
    echo "2. Intermediate Challenges"
    echo "   - Log file analysis"
    echo "   - Data processing"
    echo "   - System monitoring scripts"
    echo
    echo "3. Advanced Challenges"
    echo "   - Complex automation"
    echo "   - Performance optimization"
    echo "   - Security auditing"
    echo
    echo "4. Real-World Projects"
    echo "   - Build a backup system"
    echo "   - Create monitoring dashboard"
    echo "   - Develop deployment pipeline"
    echo
    echo "5. Return to Main Menu"
    echo
    read -p "Select challenge level (1-5): " challenge_level
    
    case $challenge_level in
        1) beginner_challenges ;;
        2) intermediate_challenges ;;
        3) advanced_challenges ;;
        4) real_world_projects ;;
        5) main_menu ;;
        *) challenges_menu ;;
    esac
}

# Beginner Challenges
beginner_challenges() {
    show_header
    echo -e "${YELLOW}BEGINNER CHALLENGES${NC}"
    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo
    
    echo -e "${BOLD}Challenge 1: Directory Explorer${NC}"
    echo "Create a script that:"
    echo "• Lists all directories in current path"
    echo "• Shows size of each directory"
    echo "• Highlights directories over 100MB"
    echo
    
    echo -e "${BOLD}Challenge 2: File Organizer${NC}"
    echo "Write a script that:"
    echo "• Organizes files by extension"
    echo "• Creates folders for each file type"
    echo "• Moves files to appropriate folders"
    echo
    
    echo -e "${BOLD}Challenge 3: System Info Reporter${NC}"
    echo "Create a script displaying:"
    echo "• Current user and hostname"
    echo "• System uptime"
    echo "• Memory and disk usage"
    echo "• Number of running processes"
    echo
    
    local completed=$(get_progress "challenges_completed")
    update_progress "challenges_completed" $((completed + 1))
    
    read -p "Press Enter to return to challenges menu..."
    challenges_menu
}

# Intermediate Challenges
intermediate_challenges() {
    show_header
    echo -e "${YELLOW}INTERMEDIATE CHALLENGES${NC}"
    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo
    
    echo -e "${BOLD}Challenge 1: Log Analyzer${NC}"
    echo "Build a script that:"
    echo "• Parses web server logs"
    echo "• Identifies top IP addresses"
    echo "• Finds most requested pages"
    echo "• Detects potential attacks"
    echo
    
    echo -e "${BOLD}Challenge 2: Automated Backup${NC}"
    echo "Create a backup system that:"
    echo "• Performs incremental backups"
    echo "• Compresses old backups"
    echo "• Rotates backups (keep last 7 days)"
    echo "• Sends email notifications"
    echo
    
    echo -e "${BOLD}Challenge 3: Process Monitor${NC}"
    echo "Write a monitoring script that:"
    echo "• Tracks CPU-intensive processes"
    echo "• Alerts on high memory usage"
    echo "• Logs resource usage over time"
    echo "• Generates daily reports"
    echo
    
    read -p "Press Enter to return to challenges menu..."
    challenges_menu
}

# Advanced Challenges
advanced_challenges() {
    show_header
    echo -e "${YELLOW}ADVANCED CHALLENGES${NC}"
    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo
    
    echo -e "${BOLD}Challenge 1: Security Auditor${NC}"
    echo "Develop a security audit script that:"
    echo "• Checks for weak passwords"
    echo "• Identifies suspicious processes"
    echo "• Scans for open ports"
    echo "• Reviews file permissions"
    echo "• Generates security report"
    echo
    
    echo -e "${BOLD}Challenge 2: Performance Optimizer${NC}"
    echo "Create optimization toolkit that:"
    echo "• Profiles system bottlenecks"
    echo "• Optimizes database queries"
    echo "• Tunes kernel parameters"
    echo "• Implements caching strategies"
    echo
    
    echo -e "${BOLD}Challenge 3: Container Orchestrator${NC}"
    echo "Build a container management system:"
    echo "• Deploy multi-container apps"
    echo "• Implement health checks"
    echo "• Auto-scale based on load"
    echo "• Handle rolling updates"
    echo
    
    read -p "Press Enter to return to challenges menu..."
    challenges_menu
}

# Real World Projects
real_world_projects() {
    show_header
    echo -e "${YELLOW}REAL-WORLD PROJECTS${NC}"
    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo
    
    echo -e "${BOLD}Project 1: Complete Backup Solution${NC}"
    echo "Requirements:"
    echo "• Automated daily/weekly/monthly backups"
    echo "• Multiple destination support (local, remote, cloud)"
    echo "• Encryption and compression"
    echo "• Web interface for restoration"
    echo "• Monitoring and alerting"
    echo
    
    echo -e "${BOLD}Project 2: System Monitoring Dashboard${NC}"
    echo "Features:"
    echo "• Real-time metrics collection"
    echo "• Historical data storage"
    echo "• Web-based visualization"
    echo "• Alert management"
    echo "• Custom metric support"
    echo
    
    echo -e "${BOLD}Project 3: CI/CD Pipeline${NC}"
    echo "Components:"
    echo "• Git integration"
    echo "• Automated testing"
    echo "• Build automation"
    echo "• Deployment strategies"
    echo "• Rollback capabilities"
    echo
    
    read -p "Press Enter to return to challenges menu..."
    challenges_menu
}

# Progress Report
show_progress_report() {
    show_header
    echo -e "${YELLOW}PROGRESS REPORT${NC}"
    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo
    
    echo -e "${BOLD}Module Progress:${NC}"
    echo
    
    for i in {1..8}; do
        local progress=$(get_progress "module$i")
        printf "Module %d: " "$i"
        show_progress_bar $progress 100
        echo " ($progress%)"
    done
    
    echo
    echo -e "${BOLD}Statistics:${NC}"
    local challenges=$(get_progress "challenges_completed")
    echo "• Challenges Completed: $challenges"
    
    local started=$(grep "^started=" "$PROGRESS_FILE" | cut -d'=' -f2)
    local days=$(( ($(date +%s) - started) / 86400 ))
    echo "• Days Since Started: $days"
    
    local total_progress=0
    for i in {1..8}; do
        local progress=$(get_progress "module$i")
        total_progress=$((total_progress + progress))
    done
    local overall=$((total_progress / 8))
    
    echo
    echo -e "${BOLD}Overall Completion: $overall%${NC}"
    
    if [ $overall -eq 100 ]; then
        echo
        echo -e "${GREEN}Congratulations! You've completed the Unix Mastery Course!${NC}"
        echo -e "${GREEN}You are now a Unix expert!${NC}"
    elif [ $overall -ge 75 ]; then
        echo
        echo -e "${YELLOW}Great progress! You're almost there!${NC}"
    elif [ $overall -ge 50 ]; then
        echo
        echo -e "${CYAN}Good job! Keep up the momentum!${NC}"
    else
        echo
        echo -e "${WHITE}Keep learning and practicing!${NC}"
    fi
    
    echo
    read -p "Press Enter to return to main menu..."
    main_menu
}

# Setup Practice Environment
setup_practice_env() {
    show_header
    echo -e "${YELLOW}SETTING UP PRACTICE ENVIRONMENT${NC}"
    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo
    
    echo "Creating practice environment at: $SANDBOX_DIR"
    echo
    
    # Create directory structure
    mkdir -p "$SANDBOX_DIR"/{projects,scripts,data,logs,backups}
    
    # Create sample files
    echo "Creating sample files..."
    
    # Sample log file
    cat > "$SANDBOX_DIR/logs/access.log" << 'EOF'
192.168.1.1 - - [01/Jan/2024:10:00:00] "GET /index.html HTTP/1.1" 200 1234
192.168.1.2 - - [01/Jan/2024:10:00:01] "GET /about.html HTTP/1.1" 200 5678
192.168.1.1 - - [01/Jan/2024:10:00:02] "POST /login HTTP/1.1" 302 0
192.168.1.3 - - [01/Jan/2024:10:00:03] "GET /products HTTP/1.1" 200 9012
192.168.1.4 - - [01/Jan/2024:10:00:04] "GET /contact HTTP/1.1" 404 0
EOF
    
    # Sample data file
    cat > "$SANDBOX_DIR/data/employees.csv" << 'EOF'
ID,Name,Department,Salary,Start_Date
001,Alice Johnson,Engineering,85000,2020-03-15
002,Bob Smith,Marketing,72000,2019-07-22
003,Carol White,Sales,68000,2021-01-10
004,David Brown,Engineering,92000,2018-11-30
005,Eve Davis,HR,65000,2020-09-05
EOF
    
    # Sample configuration file
    cat > "$SANDBOX_DIR/config.conf" << 'EOF'
# Application Configuration
app_name=MyApp
version=1.0.0
debug=false
port=8080
database_host=localhost
database_port=5432
max_connections=100
timeout=30
EOF
    
    # Create practice script
    cat > "$SANDBOX_DIR/scripts/hello.sh" << 'EOF'
#!/bin/bash
echo "Hello from practice environment!"
echo "Current date: $(date)"
echo "Your username: $USER"
EOF
    chmod +x "$SANDBOX_DIR/scripts/hello.sh"
    
    echo -e "${GREEN}Practice environment created successfully!${NC}"
    echo
    echo -e "${BOLD}Environment Contents:${NC}"
    tree -L 2 "$SANDBOX_DIR" 2>/dev/null || ls -la "$SANDBOX_DIR"
    echo
    echo -e "${BOLD}Next Steps:${NC}"
    echo "1. Navigate to: cd $SANDBOX_DIR"
    echo "2. Explore the sample files"
    echo "3. Practice commands and scripts"
    echo "4. Create your own projects"
    echo
    
    read -p "Press Enter to return to main menu..."
    main_menu
}

# Resources
show_resources() {
    show_header
    echo -e "${YELLOW}COURSE RESOURCES & REFERENCES${NC}"
    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo
    
    echo -e "${BOLD}Essential Man Pages:${NC}"
    echo "• man bash      - Bash manual"
    echo "• man regex     - Regular expressions"
    echo "• man hier      - File system hierarchy"
    echo "• man signal    - Signal overview"
    echo "• man ascii     - ASCII character set"
    echo
    
    echo -e "${BOLD}Quick Reference Sheets:${NC}"
    echo "• Bash shortcuts: Ctrl+A (start), Ctrl+E (end), Ctrl+R (search)"
    echo "• Vi commands: i (insert), :wq (save & quit), dd (delete line)"
    echo "• Permission calc: 4=r, 2=w, 1=x"
    echo
    
    echo -e "${BOLD}Online Resources:${NC}"
    echo "• GNU Coreutils Documentation"
    echo "• Advanced Bash Scripting Guide"
    echo "• The Linux Documentation Project"
    echo "• Unix Stack Exchange"
    echo
    
    echo -e "${BOLD}Recommended Books:${NC}"
    echo "• \"The Unix Programming Environment\" - Kernighan & Pike"
    echo "• \"Advanced Programming in the Unix Environment\" - Stevens"
    echo "• \"The Linux Command Line\" - Shotts"
    echo "• \"Unix Power Tools\" - Powers, Peek, O'Reilly"
    echo
    
    echo -e "${BOLD}Practice Platforms:${NC}"
    echo "• Local VM with Linux distribution"
    echo "• Docker containers"
    echo "• Cloud instances (AWS, GCP, Azure)"
    echo "• Online terminals (repl.it, JSLinux)"
    echo
    
    read -p "Press Enter to return to main menu..."
    main_menu
}

# Exit course
exit_course() {
    show_header
    echo -e "${GREEN}Thank you for using the Unix Mastery Course!${NC}"
    echo
    
    # Show final progress
    local total_progress=0
    for i in {1..8}; do
        local progress=$(get_progress "module$i")
        total_progress=$((total_progress + progress))
    done
    local overall=$((total_progress / 8))
    
    echo "Your overall progress: $overall%"
    echo
    echo "Remember:"
    echo "• Practice makes perfect"
    echo "• Read man pages regularly"
    echo "• Experiment in safe environments"
    echo "• Join Unix/Linux communities"
    echo
    echo -e "${CYAN}Happy Unix mastering!${NC}"
    echo
    exit 0
}

# Main execution
init_progress
init_sandbox
main_menu