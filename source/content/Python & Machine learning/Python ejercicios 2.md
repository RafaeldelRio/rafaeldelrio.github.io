## Preparación: Importar Librerías

```python
# Importa las librerías necesarias
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
from io import StringIO # Para simular archivos CSV

# Configuraciones opcionales para mejor visualización
%matplotlib inline 
pd.set_option('display.max_rows', 100) # Mostrar más filas si es necesario
sns.set_style('whitegrid')
```

## Parte 1: NumPy Básico
**Ejercicio 1.1: Creación de Arrays**
* Crea un array de NumPy llamado `tiempos_respuesta` a partir de la siguiente lista de Python, que representa tiempos de respuesta de un servidor en milisegundos: `[120, 135, 128, 140, 150, 133, 122]`.
* Crea un array de NumPy llamado `vulnerabilidades` con 5 puntuaciones de criticidad (números flotantes) entre 0.0 y 10.0 (puedes inventarlos, ej: `[7.5, 3.2, 8.9, 5.0, 9.8]`).
* Imprime ambos arrays y sus tipos (`.dtype`).

**Ejercicio 1.2: Operaciones Vectorizadas**
* Convierte los `tiempos_respuesta` (del ejercicio 1.1) de milisegundos a segundos dividiendo el array por 1000. Guarda el resultado en `tiempos_respuesta_seg`.
* "Normaliza" las puntuaciones de `vulnerabilidades` dividiendo cada puntuación por 10.0 (para que estén entre 0 y 1). Guarda el resultado en `vulnerabilidades_norm`.
* Imprime los nuevos arrays.
```python
tiempos_respuesta = np.array([120, 135, 128, 140, 150, 133, 122])
vulnerabilidades = np.array([7.5, 3.2, 8.9, 5.0, 9.8])
```

**Ejercicio 1.3: Indexing y Slicing**
* Imprime el primer y el último tiempo de respuesta del array `tiempos_respuesta`.
* Imprime los tiempos de respuesta desde el segundo hasta el cuarto elemento (inclusive).
* Imprime todas las puntuaciones de `vulnerabilidades` que sean mayores o iguales a 7.0 (usa boolean indexing).

**Ejercicio 1.4: Funciones Matemáticas Básicas**
* Calcula e imprime el tiempo de respuesta medio, mínimo y máximo del array `tiempos_respuesta` usando funciones de NumPy (`np.mean()`, `np.min()`, `np.max()`).

## Parte 2: Pandas Series

**Ejercicio 2.1: Creación de Series**
* Crea una Serie de Pandas llamada `intentos_fallidos` a partir de la lista `[5, 10, 3, 1, 8]`, usando como índice los nombres de usuario `['admin', 'guest', 'root', 'user1', 'test']`.
* Imprime la Serie.

**Ejercicio 2.2: Acceso a Elementos**
* Usando la Serie `intentos_fallidos`:
    * Imprime el número de intentos fallidos del usuario 'admin'.
    * Imprime el número de intentos fallidos del segundo usuario (usando acceso posicional).
    * Imprime los intentos fallidos de 'guest' y 'test' al mismo tiempo.

```python
usuarios = ['admin', 'guest', 'root', 'user1', 'test']
datos_intentos = [5, 10, 3, 1, 8]
intentos_fallidos = pd.Series(datos_intentos, index=usuarios)
```

**Ejercicio 2.3: Operaciones y Filtrado**
* Usando la Serie `intentos_fallidos`:
    * Imprime los usuarios que tuvieron más de 4 intentos fallidos.
    * Incrementa en 1 el número de intentos fallidos para todos los usuarios e imprime la Serie resultante.

## Parte 3: Pandas DataFrames

**Ejercicio 3.1: Creación de DataFrame desde Diccionario**
* Crea un DataFrame de Pandas llamado `df_logs` a partir del siguiente diccionario, simulando logs de acceso.
* Imprime el DataFrame.

```python
data = {
    'timestamp': ['2025-04-15 20:00:01', '2025-04-15 20:01:15', '2025-04-15 20:01:30', '2025-04-15 20:02:05', '2025-04-15 20:03:10'],
    'usuario': ['user1', 'admin', 'user1', 'guest', 'admin'],
    'ip_origen': ['192.168.1.10', '10.0.0.5', '192.168.1.10', '203.0.113.1', '10.0.0.5'],
    'accion': ['login_success', 'login_success', 'file_access', 'login_failed', 'logout']
}

df_logs = pd.DataFrame(data)
print(df_logs)
```


**Ejercicio 3.2: Simulación de Lectura de CSV**
* Tenemos los siguientes datos simulados de un archivo CSV:
```csv_data
timestamp,source_ip,dest_ip,port,protocol,action
2025-04-15 21:00:00,192.168.1.50,10.0.0.80,80,TCP,ALLOW
2025-04-15 21:00:05,192.168.1.55,10.0.0.81,443,TCP,ALLOW
2025-04-15 21:00:10,192.168.1.50,10.0.0.80,123,UDP,DENY
2025-04-15 21:00:15,192.168.1.60,8.8.8.8,53,UDP,ALLOW
2025-04-15 21:00:20,192.168.1.55,10.0.0.81,443,TCP,ALLOW
```
* Usa `pd.read_csv()` junto con `StringIO()` (importado al principio) para leer estos datos en un DataFrame llamado `df_traffic`.
* Imprime el DataFrame.

```python
csv_data = """
timestamp,source_ip,dest_ip,port,protocol,action
2025-04-15 21:00:00,192.168.1.50,10.0.0.80,80,TCP,ALLOW
2025-04-15 21:00:05,192.168.1.55,10.0.0.81,443,TCP,ALLOW
2025-04-15 21:00:10,192.168.1.50,10.0.0.80,123,UDP,DENY
2025-04-15 21:00:15,192.168.1.60,8.8.8.8,53,UDP,ALLOW
2025-04-15 21:00:20,192.168.1.55,10.0.0.81,443,TCP,ALLOW
"""

# Lee los datos usando pd.read_csv y StringIO
df_traffic = pd.read_csv(StringIO(csv_data))
print(df_traffic)
```


**Ejercicio 3.3: Inspección Básica**
* Usando el DataFrame `df_traffic` del ejercicio anterior:
    * Muestra las primeras 3 filas (`.head()`).
    * Muestra las últimas 2 filas (`.tail()`).
    * Muestra información general del DataFrame (`.info()`). ¿Qué tipo de datos tiene cada columna?
    * Muestra un resumen estadístico (si aplica, `.describe()`).
    * Muestra los nombres de las columnas (`.columns`).
    * Muestra las dimensiones del DataFrame (`.shape`).

**Ejercicio 3.4: Selección de Columnas**
* Usando `df_traffic`:
    * Selecciona e imprime únicamente la columna 'source_ip'.
    * Selecciona e imprime las columnas 'timestamp', 'source_ip' y 'action'.

**Ejercicio 3.5: Selección de Filas (`.loc` y `.iloc`)**
* Usando `df_traffic`:
    * Selecciona e imprime la primera fila usando `.iloc`.
    * Selecciona e imprime las filas con índice 1 y 3 usando `.iloc`.
    * Selecciona e imprime la fila con índice 2 usando `.loc`.
    * Selecciona e imprime las filas con índice 0 a 2 (inclusive) usando `.loc`.

**Ejercicio 3.6: Filtrado de Filas (Boolean Indexing)**
* Usando `df_traffic`:
    * Selecciona e imprime todas las filas donde la acción ('action') sea 'DENY'.
    * Selecciona e imprime todas las filas donde el puerto ('port') sea 443.
    * Selecciona e imprime todas las filas donde la IP origen ('source_ip') sea '192.168.1.55'.
    * Selecciona e imprime todas las filas donde el protocolo sea 'TCP' **Y** la acción sea 'ALLOW'.

## Parte 4: Limpieza Básica de Datos

**Ejercicio 4.1: Manejo de Nulos (NaN)**
* Vamos a crear un DataFrame con algunos valores faltantes:
```python
data_vuls = {
    'cve_id': ['CVE-2025-001', 'CVE-2025-002', 'CVE-2025-003', 'CVE-2025-004', 'CVE-2025-005'],
    'producto': ['WebServer', 'Database', 'WebServer', 'OS', 'Database'],
    'puntuacion': [9.8, 7.5, np.nan, 5.0, 7.5],
    'vector': ['AV:N/AC:L/PR:N/UI:N/S:U/C:H/I:H/A:H', np.nan, 'AV:N/AC:L/PR:L/UI:N/S:U/C:H/I:N/A:N', 'AV:L/AC:H/PR:L/UI:R/S:C/C:L/I:L/A:N', np.nan]
}
df_vuls = pd.DataFrame(data_vuls)
```
* Imprime el DataFrame `df_vuls`.
* Cuenta cuántos valores nulos hay en cada columna (`.isnull().sum()`).
* Crea un nuevo DataFrame `df_vuls_filled` donde los NaN en la columna 'puntuacion' se reemplacen por la media de esa columna (`.fillna()`).
* Crea un nuevo DataFrame `df_vuls_dropped` donde se eliminen las filas que contengan cualquier valor NaN (`.dropna()`).
* Imprime `df_vuls_filled` y `df_vuls_dropped`.

```python
data_vuls = {
    'cve_id': ['CVE-2025-001', 'CVE-2025-002', 'CVE-2025-003', 'CVE-2025-004', 'CVE-2025-005'],
    'producto': ['WebServer', 'Database', 'WebServer', 'OS', 'Database'],
    'puntuacion': [9.8, 7.5, np.nan, 5.0, 7.5],
    'vector': ['AV:N/AC:L/PR:N/UI:N/S:U/C:H/I:H/A:H', np.nan, 'AV:N/AC:L/PR:L/UI:N/S:U/C:H/I:N/A:N', 'AV:L/AC:H/PR:L/UI:R/S:C/C:L/I:L/A:N', np.nan]
}
df_vuls = pd.DataFrame(data_vuls)

print("DataFrame Original:")
print(df_vuls)
print("\nValores Nulos por Columna:")
# Cuenta nulos aquí

# Rellena nulos en 'puntuacion' aquí
# df_vuls_filled = ...
# print("\nDataFrame con Nulos Rellenos:")
# print(df_vuls_filled)

# Elimina filas con nulos aquí
# df_vuls_dropped = ...
# print("\nDataFrame con Filas Nulas Eliminadas:")
# print(df_vuls_dropped)
```


**Ejercicio 4.2: Manejo de Duplicados**
* Considera el DataFrame `df_traffic` del ejercicio 3.2. Ya tenía una fila duplicada (índices 1 y 4).
* Encuentra las filas duplicadas en `df_traffic` usando `.duplicated()`. ¿Qué resultado te da?
* Crea un nuevo DataFrame `df_traffic_unique` eliminando las filas duplicadas de `df_traffic` usando `.drop_duplicates()`. Conserva la primera aparición.
* Imprime `df_traffic_unique` y verifica su tamaño (`.shape`).
```python
# Asegúrate de tener df_traffic definido

# Encuentra duplicados aquí

# Elimina duplicados aquí
# df_traffic_unique = ...

# Imprime el resultado

```

## Parte 5: Agrupación y Agregación (`.groupby()`)

**Ejercicio 5.1: Agrupar y Contar**
* Usando el DataFrame `df_logs` (del ejercicio 3.1):
    * Agrupa los logs por 'usuario' y cuenta cuántas acciones realizó cada uno (`.size()` o `.count()`).
    * Agrupa los logs por 'accion' y cuenta cuántas veces ocurrió cada acción.
    * Agrupa los logs por 'ip_origen' y cuenta cuántas acciones provinieron de cada IP.

```python
# Escribe tu código para el Ejercicio 5.1 aquí
# Asegúrate de tener df_logs definido
data = {
    'timestamp': ['2025-04-15 20:00:01', '2025-04-15 20:01:15', '2025-04-15 20:01:30', '2025-04-15 20:02:05', '2025-04-15 20:03:10'],
    'usuario': ['user1', 'admin', 'user1', 'guest', 'admin'],
    'ip_origen': ['192.168.1.10', '10.0.0.5', '192.168.1.10', '203.0.113.1', '10.0.0.5'],
    'accion': ['login_success', 'login_success', 'file_access', 'login_failed', 'logout']
}
df_logs = pd.DataFrame(data)

# Agrupa por usuario y cuenta

# Agrupa por acción y cuenta

# Agrupa por IP y cuenta

```

**Ejercicio 5.2: Agrupar con Múltiples Columnas**
* Usando el DataFrame `df_logs`:
    * Agrupa por 'usuario' y 'ip_origen' simultáneamente y cuenta las ocurrencias.

## Parte 6: Visualización Básica
**Ejercicio 6.1: Histograma**
* Usando el DataFrame `df_traffic` (el original o el `df_traffic_unique`):
    * Crea un histograma de la columna 'port' usando `.plot(kind='hist')` o `plt.hist()`.
    * Añade un título al gráfico.

```python
# Asegúrate de tener df_traffic o df_traffic_unique definido
plt.figure(figsize=(8, 4)) # Opcional: ajustar tamaño

# Crea el histograma aquí

plt.title('Distribución de Puertos Utilizados')
plt.xlabel('Puerto')
plt.ylabel('Frecuencia')
plt.show()

```


**Ejercicio 6.2: Gráfico de Barras**
* Usando el DataFrame `df_logs`:
    * Calcula la cuenta de cada 'accion' (puedes usar `.value_counts()` o `.groupby().size()`).
    * Crea un gráfico de barras de las cuentas de acciones usando `.plot(kind='bar')`.
    * Añade un título y etiquetas a los ejes.

```python
# Asegúrate de tener df_logs definido
plt.figure(figsize=(8, 5))

# Calcula las cuentas de acciones aquí
# action_counts = ...

# Crea el gráfico de barras aquí
# action_counts.plot(kind='bar', ...) 

plt.title('Número de Ocurrencias por Acción')
plt.xlabel('Acción')
plt.ylabel('Número de Ocurrencias')
plt.xticks(rotation=45) # Rotar etiquetas si son largas
plt.tight_layout() # Ajustar layout
plt.show()
```
