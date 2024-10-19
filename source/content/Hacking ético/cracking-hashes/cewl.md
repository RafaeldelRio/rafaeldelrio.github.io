---
description: Generador de wordlist a partir de web scrapping
---

# CEWL

A veces no tenemos una wordlist clara, pero intuimos que en la página web puede haber palabras relevantes (keywords). En ese caso podemos usar CEWL ([https://github.com/digininja/CeWL](https://github.com/digininja/CeWL)) para ello. Además podemos indicar con "-d" si queremos que se usen subpáginas para generar la wordlist.

`cewl -d 2 -w $(pwd)/wordlist.txt http://URL/index.html`
