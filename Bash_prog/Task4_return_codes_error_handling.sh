(kali㉿kali)-[~]
└─$ touch Task4_return_codes_error_handling.sh
                                                                                           
┌──(kali㉿kali)-[~]
└─$ nano Task4_return_codes_error_handling.sh
                                                                                           
┌──(kali㉿kali)-[~]
└─$ chmod +x Bash_prog/Task4_return_codes_error_handling.sh
./Bash_prog/Task4_return_codes_error_handling.sh
chmod: cannot access 'Bash_prog/Task4_return_codes_error_handling.sh': No such file or directory
zsh: no such file or directory: ./Bash_prog/Task4_return_codes_error_handling.sh
                                                                                           
┌──(kali㉿kali)-[~]
└─$ chmod +x Task4_return_codes_error-handling.sh          
chmod: cannot access 'Task4_return_codes_error-handling.sh': No such file or directory
                                                                                           
┌──(kali㉿kali)-[~]
└─$ chmod +x Task4_return_codes_error_handling.sh
                                                                                           
┌──(kali㉿kali)-[~]
└─$ cat Task4_return_codes_error_handlinh.sh     
cat: Task4_return_codes_erroe_handlinh.sh: No such file or directory
                                                                                           
┌──(kali㉿kali)-[~]
└─$ cat Task4_return_codes_error_handling.sh
#!/bin/bash
# Author: Manu Michelle Akyere Yeboah
# Index: 7359523
# Task 4 - Return Codes and Error Handling

# Create temp folder for cleanup demo
mkdir -p /tmp/mytemp
echo "Created temp dir /tmp/mytemp"

echo "=== System Health Check ==="

# 1. Host reachable check - exit 2 if fails
echo "1. Checking host 8.8.8.8..."
ping -c 1 8.8.8.8 > /dev/null 2>&1
if [ $? -eq 0 ]; then
  echo "PASS - Host reachable"
else
  echo "FAIL - Host not reachable"
  rm -rf /tmp/mytemp
  exit 2
fi

# 2. Disk space check - exit 3 if fails
echo "2. Checking disk space..."
df / | tail -1
if [ $? -eq 0 ]; then
  echo "PASS - Disk check ok"
else
  echo "FAIL - No disk space"
  rm -rf /tmp/mytemp
  exit 3
fi

# 3. File exists check - exit 4 if fails
echo "3. Checking README.md file..."
ls README.md > /dev/null 2>&1
if [ $? -eq 0 ]; then
  echo "PASS - README.md found"
else
  echo "FAIL - README.md not found"
  rm -rf /tmp/mytemp
  exit 4
fi

# 4. Command installed check - exit 5 if fails
echo "4. Checking git command..."
which git > /dev/null 2>&1
if [ $? -eq 0 ]; then
  echo "PASS - git installed"
else
  echo "FAIL - git not found"
  rm -rf /tmp/mytemp
  exit 5
fi

# Cleanup
rm -rf /tmp/mytemp
echo "Cleanup done"
echo "All checks passed!"
exit 0

─(kali㉿kali)-[~]
└─$ mkdir Bash_prog 
                                                                                        
┌──(kali㉿kali)-[~]
└─$ cp Task4_return_codes_error_handling.sh Bash_prog
                                                                                        
┌──(kali㉿kali)-[~]
└─$ cd Bash_prog                              
                                                                                        
┌──(kali㉿kali)-[~/Bash_prog]
└─$ ls      
Task4_return_codes_error_handling.sh



