# Análisis de logs

Comandos interesantes:

* cut
* sort
* uniq
* nl
* wc
* grep
* base64

Pregunta 1

`cut -d ' ' -f2 access.log | sort | uniq -c | sort -n | nl`

Pregunta 2

`cut -d ' ' -f3 access.log | cut -d ':' -f1 |sort | uniq | sort -n | nl`

Pregunta 3

`cut -d ' ' -f3 access.log | cut -d ':' -f1 | sort | uniq -c | sort -nr`

`grep partnerservices.getmicrosoftkey.com access.log | cut -d ' ' -f6 | sort | uniq`

Pregunta 4

`cut -d ' ' -f3 access.log | cut -d ':' -f1 |sort | uniq -c | sort -n | nl | tail -n 5`

Pregunta 5

`grep frostlings.bigbadstash.thm access.log | grep 200 | cut -d ' ' -f2 | sort | uniq`

Pregunta 6

`grep frostlings.bigbadstash.thm access.log | cut -d ' ' -f5 | cut -d '=' -f2 | base64 -d`

`grep frostlings.bigbadstash.thm access.log | cut -d ' ' -f5 | cut -d '=' -f2 | base64 -d | grep -i THM{`

