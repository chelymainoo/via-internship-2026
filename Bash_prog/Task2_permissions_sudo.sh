─(kali㉿kali)-[~]
└─$ nanno Bash_prog/Task2_permissions_sudo.sh
Command 'nanno' not found, did you mean:
  command 'nano' from deb nano
  command 'anno' from deb nmh
  command 'anno' from deb mailutils-mh
Try: sudo apt install <deb name>
                                                                                           
┌──(kali㉿kali)-[~]
└─$ touch Bash_prog/Task2_permissions_sudo.sh
touch: cannot touch 'Bash_prog/Task2_permissions_sudo.sh': No such file or directory
                                                                                           
┌──(kali㉿kali)-[~]
└─$ touch Task2_permissions_sudo.sh          
                                                                                           
┌──(kali㉿kali)-[~]
└─$ nano Task2_permissions_sudo.sh           
                                                                                           
┌──(kali㉿kali)-[~]
└─$ cat Task2_permissions_sudo.sh
#!/usr/bin/env bash
# -----------------------------------------------------------------------------
# @title       Task2_permissions_sudo.sh
# @author      Manu Michelle Akyere Yeboah
# @index       7359523
# @school      University of Ghana
# @description Inspects file permissions in symbolic and numeric formats, applies
#              chmod updates, and checks root privileges (id -u) for chown execution.
# @date        2026-09-14
# -----------------------------------------------------------------------------

usage() {
    echo "Usage: $0 <file-path>"
    echo "  <file-path>  Path to the target file whose permissions will be checked and modified."
    exit 1
}

if [[ "$1" == "-h" || "$1" == "--help" || -z "$1" ]]; then
    usage
fi

FILE_PATH="$1"

if [[ ! -f "$FILE_PATH" ]]; then
    echo "Error: File '$FILE_PATH' does not exist or is not a regular file." >&2
    exit 1
fi

display_permissions() {
    local target="$1"
    local symbolic
    local numeric
    local owner
    local group

    symbolic=$(stat -c "%A" "$target")
    numeric=$(stat -c "%a" "$target")
    owner=$(stat -c "%U" "$target")
    group=$(stat -c "%G" "$target")

    echo "  - Path: $target"
    echo "  - Symbolic Permissions: $symbolic"
    echo "  - Numeric Permissions: $numeric"
    echo "  - Owner: $owner"
    echo "  - Group: $group"
}

echo "[INFO] Initial File Permissions:"
display_permissions "$FILE_PATH"
echo "---------------------------------------------------"

echo "[INFO] Applying permission changes..."

if chmod 644 "$FILE_PATH"; then
    echo "[SUCCESS] Applied numeric permissions (chmod 644)."
else
    echo "Error: Failed to set numeric permissions (644)" >&2
    exit 1
fi

if chmod u+x "$FILE_PATH"; then
    echo "[SUCCESS] Applied symbolic permissions (chmod u+x)."
else
    echo "Error: Failed to set symbolic permissions (u+x)" >&2
    exit 1
fi

echo "---------------------------------------------------"
echo "[INFO] Checking user privileges for ownership modification..."
CURRENT_UID=$(id -u)

if [[ "$CURRENT_UID" -eq 0 ]]; then
    echo "[INFO] Running as root (UID 0). Attempting ownership change..."
    CURRENT_USER=$(id -un)
    if chown "$CURRENT_USER:$CURRENT_USER" "$FILE_PATH"; then
        echo "[SUCCESS] Successfully updated file ownership with chown."
    else
        echo "Error: chown operation failed." >&2
        exit 1
    fi
else
    echo "[NOTICE] Skipped chown step: Root/sudo privileges required (Current UID: $CURRENT_UID)."
fi

echo "---------------------------------------------------"
echo "[INFO] Final File Permissions (After Changes):"
display_permissions "$FILE_PATH"


                                                                                           
┌──(kali㉿kali)-[~]
└─$ chmod +x Task2_permissions_sudo.sh
                                                                                           
┌──(kali㉿kali)-[~]
└─$ touch test.txt                 

─(kali㉿kali)-[~]
└─$ mkdir Bash_prog 
                                                                                        
┌──(kali㉿kali)-[~]
└─$ cp Task2_permissions_sudo.sh Bash_prog
                                                                                        
┌──(kali㉿kali)-[~]
└─$ cd Bash_prog                              
                                                                                        
┌──(kali㉿kali)-[~/Bash_prog]
└─$ ls      
Task2_permissions_sudo.sh
                                                                                        
