# Network Security Exploitation Report: Metasploitable2
**Target System:** Metasploitable2 (`10.10.10.6`)  
**Attacker System:** Kali Linux (`10.10.10.5`)  
**Framework Mapping:** Lockheed Martin Cyber Kill Chain  

---

## Executive Summary
This report details the systematic exploitation of ten (10) distinct vulnerability vectors on the Metasploitable2 vulnerable virtual machine. Each exploited service has been documented with its corresponding attack vector, technical execution details, root cause analysis, and remediation strategies aligned with the Cyber Kill Chain framework.

---

## 1. Reconnaissance & Weaponization

| Phase | Description |
| :--- | :--- |
| **Reconnaissance** | Active scanning via Nmap (`nmap -p- -sV -O 10.10.10.6`) identified open legacy ports including 21 (FTP), 22 (SSH), 23 (Telnet), 514 (RSH), 1524 (Ingreslock), 3306 (MySQL), 5432 (PostgreSQL), 6667 (UnrealIRCd), 8080 (HTTP/Tomcat), and 8180 (Apache Tomcat). |
| **Weaponization** | Standard exploit modules, auxiliary scanners, and legacy connection clients within Metasploit Framework and Kali Linux tools were staged against identified target services. |

---

## 2. Exploitation Summary Table

| Exploit # | Vulnerable Service | Protocol / Port | Exploitation Method | Evidence File |
| :---: | :--- | :--- | :--- | :--- |
| **1** | VSFTPD v2.3.4 | TCP / 21 | Backdoor Trigger via `:)` username | `evidence/exploit1.png` |
| **2** | UnrealIRCd 3.2.8.1 | TCP / 6667 | Backdoor Command Execution (`AB;`) | `evidence/exploit2.png` |
| **3** | Samba (`usermap_script`) | TCP / 139, 445 | Username Script Command Execution | `evidence/exploit3.png` |
| **4** | Bindshell Service | TCP / 1524 | Direct Shell Access via Netcat | `evidence/exploit4.png` |
| **5** | PostgreSQL Database | TCP / 5432 | Default Credentials (`postgres:postgres`) | `evidence/exploit5.png` |
| **6** | OpenSSH Legacy Auth | TCP / 22 | Key Exchange / Host Algorithm Overrides | `evidence/exploit6.png` |
| **7** | Telnet Service | TCP / 23 | Default Credentials Access (`msfadmin:msfadmin`) | `evidence/exploit7.png` |
| **8** | MySQL Database | TCP / 3306 | Unauthenticated / Default Access (`root`) | `evidence/exploit8.png` |
| **9** | PHP CGI (CVE-2012-1823) | TCP / 80 | Argument Injection Remote Code Execution | `evidence/exploit9.png` |
| **10** | RSH / Rlogin Service | TCP / 514 | Misconfigured Trust Relationship (`rsh -l root`) | `evidence/exploit10.png` |

---

## 3. Detailed Cyber Kill Chain Mapping & Analysis

### Exploit 1: VSFTPD v2.3.4 Backdoor
* **Kill Chain Phase:** Delivery & Exploitation
* **Technical Details:** The target hosts a compromised version of VSFTPD. Sending a username ending with `:)` triggers a listening root shell on TCP port 6200.
* **Remediation:** Upgrade VSFTPD to a clean build from verified sources and disable obsolete software repositories.

### Exploit 2: UnrealIRCd 3.2.8.1 Backdoor
* **Kill Chain Phase:** Delivery & Exploitation
* **Technical Details:** Triggered arbitrary command execution by passing the legacy backdoor sequence `AB;` over IRC port 6667 via `exploit/unix/irc/unreal_ircd_3281_backdoor`.
* **Remediation:** Replace UnrealIRCd 3.2.8.1 with a modern, verified release that includes cryptographic signature verification.

### Exploit 3: Samba `usermap_script` RCE
* **Kill Chain Phase:** Delivery & Exploitation
* **Technical Details:** Leveraged CVE-2007-2447 via `exploit/multi/samba/usermap_script`. Shell metacharacters in username strings execute root-level commands.
* **Remediation:** Upgrade Samba to a non-vulnerable release or set `username map = ""` in `/etc/samba/smb.conf`.

### Exploit 4: Direct Bindshell Access
* **Kill Chain Phase:** Exploitation & Installation
* **Technical Details:** Connected directly to port 1524 (`nc 10.10.10.6 1524`), yielding an unauthenticated root interactive shell.
* **Remediation:** Remove obsolete bindshell startup scripts (`/etc/init.d/` entries) and apply strict host firewall rules (`iptables`).

### Exploit 5: PostgreSQL Default Credentials
* **Kill Chain Phase:** Exploitation & Access
* **Technical Details:** Accessed PostgreSQL on port 5432 using default administrative credentials `postgres:postgres` via `auxiliary/scanner/postgres/postgres_login`.
* **Remediation:** Enforce strong authentication in `pg_hba.conf` and update default passwords immediately upon deployment.

### Exploit 6: OpenSSH Service Authentication
* **Kill Chain Phase:** Exploitation & Access
* **Technical Details:** Established remote SSH connection by passing explicit cryptographic algorithm overrides (`+ssh-rsa`, `+diffie-hellman-group1-sha1`) for legacy host keys.
* **Remediation:** Update OpenSSH daemon configuration to disable deprecated ciphers/key exchange methods and enforce key-based authentication.

### Exploit 7: Telnet Default User Access
* **Kill Chain Phase:** Exploitation & Access
* **Technical Details:** Connected via unencrypted Telnet on port 23 using default system account `msfadmin:msfadmin` to obtain shell access.
* **Remediation:** Disable Telnet completely; enforce SSH for all remote administrative access.

### Exploit 8: MySQL Unauthenticated Root Access
* **Kill Chain Phase:** Exploitation & Access
* **Technical Details:** Connected to MySQL service on port 3306 using default root account without a password.
* **Remediation:** Execute `mysql_secure_installation` to assign passwords to administrative accounts and bind MySQL strictly to `127.0.0.1`.

### Exploit 9: PHP CGI Argument Injection
* **Kill Chain Phase:** Delivery & Exploitation
* **Technical Details:** Exploited CVE-2012-1823 via `exploit/multi/http/php_cgi_arg_injection` to execute arbitrary PHP directives and establish a reverse session as `www-data`.
* **Remediation:** Upgrade PHP to a version that patches CGI parameter handling, or pass strict request filtering directives in Apache.

### Exploit 10: RSH Trust Misconfiguration
* **Kill Chain Phase:** Exploitation & Privilege Escalation
* **Technical Details:** Executed `rsh -l root 10.10.10.6` exploiting host-based trust (`/etc/hosts.equiv` and `.rhosts`), providing unauthenticated root shell access.
* **Remediation:** Disable `rsh` and `rlogin` services; remove `.rhosts` and `/etc/hosts.equiv` files across all hosts.

---

## 4. Conclusion & Hardening Roadmap
1. **Network Segmentation:** Implement internal firewalls to restrict unused ports (e.g., 514, 1524, 6667).
2. **Credential Management:** Replace all default credentials (`msfadmin`, `postgres`, `root`) with robust access management.
3. **Patch Management:** Migrate legacy operating systems and unpatchable service versions to modern maintained distributions.
