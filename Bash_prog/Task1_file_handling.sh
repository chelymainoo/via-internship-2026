┌──(kali㉿kali)-[~]
└─$ #!/usr/bin/env bash
                                                                                                                   
┌──(kali㉿kali)-[~]
└─$ touvh kol              
Command 'touvh' not found, did you mean:
  command 'touch' from deb coreutils
Try: sudo apt install <deb name>
                                                                                                                   
┌──(kali㉿kali)-[~]
└─$ touch kol              
                                                                                                                   
┌──(kali㉿kali)-[~]
└─$ nano kol  
                                                                                                                   
┌──(kali㉿kali)-[~]
└─$ cat kol  
# -----------------------------------------------------------------
# @title        Task1_file_handling.sh
# @author       Manu Michelle Akyere Yeboah
# @index        7359523
# @school       Kwame Nkrumah University of Science and Technology (KNUST)
# @description  This script demonstrates basic file handling.
# @date         2026-09-14
# -----------------------------------------------------------------

                                                                                                                   
┌──(kali㉿kali)-[~]
└─$ nano kol
                                                                                                                   
┌──(kali㉿kali)-[~]
└─$ nano kol
                                                                                                                   
┌──(kali㉿kali)-[~]
└─$ chmod +x Task1_file_handling .sh
chmod: cannot access 'Task1_file_handling': No such file or directory
chmod: cannot access '.sh': No such file or directory
                                                                                                                   
┌──(kali㉿kali)-[~]
└─$ chmod +x kol                    
                                                                                                                   
┌──(kali㉿kali)-[~]
└─$ mv kol Task1_file_handling.sh
                                                                                                                   
┌──(kali㉿kali)-[~]
└─$ cat Task1_file_handling.sh
# -----------------------------------------------------------------
# @title        Task1_file_handling.sh
# @author       Manu Michelle Akyere Yeboah
# @index        7359523
# @school       Kwame Nkrumah University of Science and Technology (KNUST)
# @description  This script demonstrates basic file handling.
# @date         2026-09-14
# -----------------------------------------------------------------

                                                                                                                   
┌──(kali㉿kali)-[~]
└─$ mv Task1_file_handling.sh Bash_prog/Task1_file_handling.sh
mv: cannot move 'Task1_file_handling.sh' to 'Bash_prog/Task1_file_handling.sh': No such file or directory
                                                                                                                   
┌──(kali㉿kali)-[~]
└─$ nano Task1_file_handling.sh
                                                                                                                   
┌──(kali㉿kali)-[~]
└─$ cat Task1_file_handling.sh

# -----------------------------------------------------------------
# @title        Task1_file_handling.sh
# @author       Manu Michelle Akyere Yeboah
# @index        7359523
# @school       Kwame Nkrumah University of Science and Technology (KNUST)
# @description  This script demonstrates basic file handling.
# @date         2026-09-14
# -----------------------------------------------------------------


if [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
  echo "Usage: $0 <target-directory>"
  echo "Example: $0 /tmp/test"
  exit 0
fi

if [ -z "$1" ]; then
  echo "Error: you did not give directory name" >&2
  echo "Usage: $0 <target-directory>" >&2
  exit 1
fi

TARGET_DIR=$1
FILE_PATH=$TARGET_DIR/sample.txt
BACKUP_PATH=$TARGET_DIR/sample.txt.bak

if [ -d "$TARGET_DIR" ]; then
  echo "Directory $TARGET_DIR already exists"
else
  mkdir -p $TARGET_DIR
  if [ $? -ne 0 ]; then
    echo "Error: cannot create directory $TARGET_DIR" >&2
    exit 1
  fi
  echo "Directory $TARGET_DIR created"
fi

echo "This is my first file" > $FILE_PATH
if [ $? -ne 0 ]; then
  echo "Error: failed to create file" >&2
  exit 1
fi
echo "File created"

echo "This is second line added" >> $FILE_PATH
echo "Added on $(date)" >> $FILE_PATH
echo "Content appended"

echo "File content is:"
cat $FILE_PATH
if [ $? -ne 0 ]; then
  echo "Error: cannot read file" >&2
  exit 1
fi

cp $FILE_PATH $BACKUP_PATH
if [ $? -ne 0 ]; then
  echo "Error: backup failed" >&2
  exit 1
fi
echo "Backup created at $BACKUP_PATH"

if [ -f $FILE_PATH ]; then
  echo "Now deleting original file $FILE_PATH"
  rm $FILE_PATH
  echo "Original file deleted"
else
  echo "Error: file not found to delete" >&2
  exit 1
fi

ls -l $TARGET_DIR
─(kali㉿kali)-[~]
└─$ mkdir Bash_prog 
                                                                                        
┌──(kali㉿kali)-[~]
└─$ cp Task1_file_handling.sh Bash_prog
                                                                                        
┌──(kali㉿kali)-[~]
└─$ cd Bash_prog                              
                                                                                        
┌──(kali㉿kali)-[~/Bash_prog]
└─$ ls      
Task1_file_handling.sh
                                                                                        


