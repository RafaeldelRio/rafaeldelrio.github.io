---
description: John the ripper es una herramienta para crackear hashes
---

# John the ripper

Para ver el listado de hashes que es capaz de romper john the ripper. Aquí lo acompañamos de un grep para filtrar y mostrar solo el que buscamos.

`john --list=formats | grep -i Keccak-256`

Para crear reglas personalizadas para john the ripper, crearlas en un archivo /usr/share/john/john-local.conf. Las reglas que se pueden crear están en el enlace: [https://www.openwall.com/john/doc/RULES.shtml](https://www.openwall.com/john/doc/RULES.shtml). Un ejemplo de regla, para añadir dos números a las reglas por defecto es la siguiente:

```
// En el archivo /usr/share/john/john-local.conf
[List.Rules:11]
$[0-9]$[0-9]
// Para usar las palabras del revés
[List.Rules:12]
r
// Para usar repeticiones de palabras
[List.Rules:13]
d
dd
ddd
```

Si no se sabe dónde está la instalación de john the ripper, se puede usar el comando:

`locate john.conf`

Ahora podemos usar la regla creada. En este ejemplo usamos la nueva regla creada y además usamos las wordlists de la lista de seclists ([https://github.com/danielmiessler/SecLists](https://github.com/danielmiessler/SecLists))

`john hash.txt --format=raw-sha1 --wordlist=/usr/share/seclists/Passwords/Common-Credentials/10k-most-common.txt --rules=THM01`

### Máquinas para practicar

* [https://tryhackme.com/room/crackthehash](https://tryhackme.com/room/crackthehash)
* [https://tryhackme.com/room/crackthehashlevel2](https://tryhackme.com/room/crackthehashlevel2)
