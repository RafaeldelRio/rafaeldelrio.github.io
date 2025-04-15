
## Qué es Wazuh
Un EDR (Endpoint Detection and Response)


## Cómo instalar Wazuh
En AWS con Amazon Linux 2:

```bash
# Para instalar docker
sudo dnf install docker -y
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker $USER

# Para docker-compose: https://gist.github.com/npearce/6f3c7826c7499587f00957fee62f8ee9
sudo curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Probar que todo va bien
docker --version
docker-compose --version

# Siguiendo la guía de Wazuh: 
# https://documentation.wazuh.com/current/deployment-options/docker/wazuh-container.html
sudo dnf install git -y
git clone https://github.com/wazuh/wazuh-docker.git -b v4.11.2
cd wazuh-docker/single-node
docker-compose -f generate-indexer-certs.yml run --rm generator
docker-compose up -d

# Se habrán generado 3 contenedores. 
# Para que los contenedores se enciendan automáticamente al encender la instancia
docker update --restart=always <nombre-contenedor | ID>
```

Después de un tiempo ya podremos acceder a `https://IP` con el usuario ==admin== y la contraseña ==SecretPassword==. 
Después de esto hay que tener en cuenta los puertos que usa Wazuh y que habrá que abrirlos en el Security Group (firewall) de la instancia EC2. Más info en: https://documentation.wazuh.com/current/getting-started/architecture.html#required-ports


## ¿Cómo se gestionan las reglas en Wazuh?
Debemos acceder a la carpeta `/var/ossec`. Recordemos que ossec es una herramienta HIDS que usa Wazuh dentro de su arquitectura.

- Las reglas por defecto se encuentran en `/var/ossec/ruleset/rules/`. **No debes modificar directamente estos archivos**, ya que se sobrescribirían en las actualizaciones.
- Las personalizaciones, como la creación de nuevas reglas o la modificación del comportamiento de las existentes (por ejemplo, cambiar su nivel o desactivarlas), se hacen principalmente en `/var/ossec/etc/rules/local_rules.xml`.
- Las reglas tienen un `level` (nivel). Por defecto, Wazuh suele generar alertas para reglas con nivel 3 o superior (esto se configura en `ossec.conf`).
- Las reglas están organizadas lógicamente en archivos según su propósito (por ejemplo, `0015-ossec_rules.xml`, `0210-pci_rules.xml`, `0370-auditd_rules.xml`, `0575-win_security_rules.xml`, etc.). Wazuh carga las reglas incluidas en la configuración.

```
  <rule id="100100" level="12">
    <decoded_as>execve</decoded_as>
    <command>whoami</command>
    <description>Command 'whoami' executed</description>
  ​</rule>
```


## Instalación de un agente
Es muy sencillo, simplemente ir desde la web a crear un nuevo agente y seguir los pasos. En mi caso:

```bash
curl -o wazuh-agent-4.11.2-1.x86_64.rpm https://packages.wazuh.com/4.x/yum/wazuh-agent-4.11.2-1.x86_64.rpm

sudo WAZUH_MANAGER='IP' WAZUH_AGENT_GROUP='GRUPO' WAZUH_AGENT_NAME='NOMBRE' rpm -ihv wazuh-agent-4.11.2-1.x86_64.rpm

sudo systemctl daemon-reload
sudo systemctl enable wazuh-agent
sudo systemctl start wazuh-agent
```

