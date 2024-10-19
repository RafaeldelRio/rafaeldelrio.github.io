---
description: Hashcat es una herramienta para crackear hashes
---

# Hashcat

Ejemplo de uso de hashcat:

`hashcat '48bb6e862e54f2a795ffc4e541caed4d' -m 0 /usr/share/wordlists/rockyou.txt.gz`

Donde:

* '48bb6e862e54f2a795ffc4e541caed4d' es el hash que quiero descifrar
* \-m indica el tipo de encriptado que tiene el hash a desencriptar. Si no se conoce el tipo de encriptado se puede dejar en blanco y hashcat sugerirá los tipos más probables que puede tener.
* /usr/share/wordlist/rockyou.txt.gz aquí se indica la wordlist que se desea emplear para romper el cifrado

Si no se indica el parámetro "-a" se asume que "-a 0" por lo que intentará un ataque con una wordlist.

Otros ejemplos empleados:

* `hashcat '$2y$12$Dwt1BZj6pcyc3Dy1FWZ5ieeUznr71EeNkJkUlypTsgbX1H68wsRom' /usr/share/wordlists/rockyou.txt.gz -m 3200`
* `hashcat '$6$aReallyHardSalt$6WKUTqzq.UQQmrm0p/T7MPpMbGNnzXPMAXi4bJMl9be.cfi3/qxIf.hsGpS41BqMhSrHVXgMpdjS6xeKZAs02.' /usr/share/wordlist/rockyou.gz.txt`

Hay que tener en cuenta de este último ejemplo que "aReallyHardSalt" es la salt del encriptado. Se incluye dentro del cifrado.

* `hashcat '$2y$12$Dwt1BZj6pcyc3Dy1FWZ5ieeUznr71EeNkJkUlypTsgbX1H68wsRom' -a 3 -m 3200 -i --increment-min=4 -1?l ?1?1?1?1`

En este último caso se ha realizado un ataque de fuerza bruta (-a 3) teniendo en cuenta que se comenzara a generar palabras a partir de 4 letras, teniendo en cuenta que el patrón fuera solo de alfabético en minúsculas (`1?l`).

* ?l = abcdefghijklmnopqrstuvwxyz
* ?u = ABCDEFGHIJKLMNOPQRSTUVWXYZ
* ?d = 0123456789
* ?h = 0123456789abcdef
* ?H = 0123456789ABCDEF
* ?s = «space»!"#$%&'()\*+,-./:;<=>?@\[\\]^\_\`{|}\~
* ?a = ?l?u?d?s
* ?b = 0x00 - 0xff

Si quiero solo minúsculas y números será: `-1?l?d`

Para crackear un sha-1 con salt, hay que añadir la salt tras la contraseña separado de : (en el siguiente ejemplo la salt es “tryhackme”)

`hashcat 'e5d8870e5bdd26602cab8dbe07a942c8669e56d6:tryhackme' /usr/share/wordlists/rockyou.txt.gz -m 160`

A no tenemos claro cuál es el -m que debemos emplear pero sí tenemos el tipo de encriptado. Para buscarlo rápidamente podemos emplear:

`hashcat -h | grep -i -e sha1 -e sha-1 | grep salt`&#x20;

Donde `-i` permite buscar independientemente de minúsculas o mayúsculas. `-e` permite realizar una `or` con `grep`. Luego el resultado lo filtramos de nuevo para buscar por `salt`.

A veces, cuando rompemos el hash queremos comprobar si el resultado se corresponde con la entrada. Para encriptar un texto rápidamente desde consola podemos emplear:

`echo -n easy | md5sum`

El -n es fundamental para no añadir un salto de línea en el echo y que el resultado cambie.

Por otro lado, es posible que rockyou se nos haga una wordlist demasiado amplia. Si conocemos la longitud exacta de caracteres que va a tener la palabra original, podemos aplicar un patrón regex a rockyou para filtrar por las palabras que tengan ese número de caracteres exacto. Por ejemplo, para generar una nueva wordlist que tenga todas las palabras de rockyou de 6 caracteres:

`grep '^......$' /usr/share/wordlists/rockyou.txt > rockyou-6.txt`

Antes de terminar quería advertir sobre el uso de -f o --force con hashcat. Esa flag debe usarse con cuidado y solo si se tiene claro qué se está haciendo.

### Máquinas para practicar

* [https://tryhackme.com/room/crackthehash](https://tryhackme.com/room/crackthehash)
* [https://tryhackme.com/room/crackthehashlevel2](https://tryhackme.com/room/crackthehashlevel2)
