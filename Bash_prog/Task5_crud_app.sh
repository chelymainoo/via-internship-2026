─(kali㉿kali)-[~]
└─$ touch Task5_automated_log_backup.sh         
                                                                                           
┌──(kali㉿kali)-[~]
└─$ nano Task5_automated_log_backup.sh          
                                                                                           
┌──(kali㉿kali)-[~]
└─$ cat Task5_automated_log_backup.sh  
#!/bin/bash
# Author: Manu Michelle Akyere Yeboah
# Index: 7359523
# Task 5 - Automated Log Backup (Cyber SOC Backup)

echo "=== CYBER LOG BACKUP ==="

# 1. Create source log folder like /var/log
mkdir -p ~/logs
echo "Test log entry $(date)" > ~/logs/syslog.log
echo "Auth log entry $(date)" > ~/logs/auth.log
echo "[*] [COLLECTION] Log collection created at ~/logs"

# 2. Create backup vault (like SOC vault)
mkdir -p ~/backup_vault
echo "[*] [VAULT] Backup vault ready: ~/backup_vault"

# 3. Create backup with timestamp - for incident response
DATE=$(date +%Y%m%d_%H%M%S)
BACKUP_FILE=~/backup_vault/logs_backup_$DATE.tar.gz

echo "[*] [ARCHIVING] Compressing logs for forensic preservation..."
tar -czf $BACKUP_FILE ~/logs

if [ $? -eq 0 ]; then
    echo "[+] PASS - Backup created: $BACKUP_FILE"
    ls -lh $BACKUP_FILE
else
    echo "[-] FAIL - Backup failed"
    exit 1
fi

# 4. Show backup size - check for exfiltration
echo ""
echo "[*] [VERIFICATION] Verifying backup integrity..."
ls -lh ~/backup_vault/
du -sh ~/backup_vault/

# 5. Log rotation - Keep only last 3 backups (SOC retention policy)
echo ""
echo "[*] [RETENTION] Applying 3-backup retention policy..."
cd ~/backup_vault
ls -t logs_backup_* | tail -n +4 | xargs rm -f 2>/dev/null
echo "[+] Retention applied. Current backups:"
ls -lh

# 6. Create backup log for audit trail
echo "$(date): Backup $BACKUP_FILE created" >> ~/backup_vault/backup_audit.log
echo "[*] [AUDIT] Audit trail updated"
cat ~/backup_vault/backup_audit.log

echo ""
echo "[+] All backups secured - Ready for IR team"
                                                                                           
┌──(kali㉿kali)-[~]
└─$ chmod +x Task5_automated_log_backup.sh  
                                                                                           
┌──(kali㉿kali)-[~]
└─$ .Task5_automated_log_backup.sh  
.Task5_automated_log_backup.sh: command not found
                                                                                        
┌──(kali㉿kali)-[~]
└─$ mkdir Bashprog 
                                                                                         
┌──(kali㉿kali)-[~]
└─$ cp Task5_automated_log_backup.sh Bashprog
                                                                                         
┌──(kali㉿kali)-[~]
└─$ cd Bashprog                              
                                                                                         
┌──(kali㉿kali)-[~/Bashprog]
└─$ ls      
Task5_automated_log_backup.sh


