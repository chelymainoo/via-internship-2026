(kali㉿kali)-[~]
└─$ rm Task3_pipes_redirection.sh
rm: cannot remove 'Task3_pipes_redirection.sh': No such file or directory
                                                                                           
┌──(kali㉿kali)-[~]
└─$ touch Task3_pipes_redirection.sh
                                                                                           
┌──(kali㉿kali)-[~]
└─$ nano Task3_pipes_redirection.sh
                                                                                           
┌──(kali㉿kali)-[~]
└─$ cat Task3_pipes_redirection.sh
#!/bin/bash
# Author: Manu Michelle Akyere Yeboah
# Index: 7359523
# Task 3 - Pipes and Redirection

# Step 1: Create log file
cat > mylog.log << EOF
INFO User login
ERROR Connection failed
INFO Download ok
WARN Disk full
ERROR DB error
INFO Logout
WARN Memory high
ERROR Timeout
INFO Login again
WARN CPU high
EOF

echo "Log file created"

# Step 2: Total lines
echo "Total lines in log:"
wc -l mylog.log

# Step 3: Count each type
echo "Number of INFO:"
grep -c INFO mylog.log

echo "Number of ERROR:"
grep -c ERROR mylog.log

echo "Number of WARN:"
grep -c WARN mylog.log

# Step 4: Show only errors - save to file
echo "Saving errors to errors.txt"
grep ERROR mylog.log > errors.txt
cat errors.txt

# Step 5: Sort log
echo "Sorted log:"
sort mylog.log

echo "Task 3 Done"
                                                                                           
┌──(kali㉿kali)-[~]
└─$ chmod +x Task3_pipes_redirection.sh
                                                                                           
┌──(kali㉿kali)-[~]
└─$ .Task3_pipes_redirection.sh
.Task3_pipes_redirection.sh: command not found 

