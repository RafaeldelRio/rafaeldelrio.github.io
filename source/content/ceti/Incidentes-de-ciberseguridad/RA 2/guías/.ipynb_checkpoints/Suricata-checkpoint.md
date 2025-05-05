# Suricata

Instalación de software previo

```
apt update
apt install software-properties-common iproute-2 nano curl -y
apt install suricata -y
```

Ver la interfaz de red a usar y anotarla:

```
ip a
nano /etc/suricata/suricata.yaml
```

Dentro del archivo, cambiar las siguientes 4 cosas:

```
...

  community-id: true
  
...

af-packet:
  - interface: <la-anotada-tras-ip-a>
  
... 

default-rule-path: /var/lib/suricata/rules

rule-files:
  - suricata.rules
  
...

# Al final del archivo, incluir:
detect-engine:
  -  rule-reload: true
```

Tras esto, guardar el archivo y ejecutar los siguientes comandos:

```
suricata-update
suricata-update list-sources
suricata-update enable-source et/open
suricata -T -c /etc/suricata/suricata.yaml -v
```

Si nos da ok, todo está bien, habilitamos suricata cambiando el siguiente archivo:

```
nano /etc/default/suricata
```

Dentro del archivo modificar "RUN=yes"

Finalmente reiniciamos suricata:

```
pidof suricata
kill <pid-anterior>
systemctl restart suricata
systemctl enable suricata
```

Probamos suricata

```
curl http://testmynids.org/uid/index.html
grep 2100498 /var/log/suricata/fast.log
jq 'select(.alert .signature_id==2100498)' /var/log/suricata/eve.json
```
