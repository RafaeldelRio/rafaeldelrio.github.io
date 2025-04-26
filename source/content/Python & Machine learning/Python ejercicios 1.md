## 1. Variables y Tipos de Datos

**Ejercicio 1.1 (Variables y Strings):**
* Crea una variable llamada `nombre_usuario` y asígnale tu nombre como un string.
* Crea otra variable `mensaje_bienvenida` que contenga el string "Bienvenido al sistema, ".
* Imprime por pantalla la concatenación del mensaje de bienvenida y el nombre de usuario.
*Concepto:* Variables, Strings, Concatenación, `print()`.


**Ejercicio 1.2 (Números y Booleanos):**
* Crea una variable `intentos_login` y asígnale el valor entero `3`.
* Crea una variable `max_intentos` y asígnale el valor `5`.
* Crea una variable booleana `sesion_activa` y asígnale `False`.
* Imprime el tipo de cada una de estas variables usando la función `type()`.
*Concepto:* Variables, Integers, Booleans, `type()`.


**Ejercicio 1.3 (Listas):**
* Crea una lista llamada `ips_permitidas` que contenga las siguientes direcciones IP (como strings): "192.168.1.1", "10.0.0.5", "8.8.8.8".
* Imprime la lista completa.
* Imprime el segundo elemento de la lista (recordar que el índice empieza en 0).
* Añade la IP "192.168.1.100" al final de la lista.
* Imprime la lista modificada.
*Concepto:* Listas (creación, acceso por índice, añadir elementos con `append()`).

**Ejercicio 1.4 (Diccionarios):**
* Crea un diccionario llamado `permisos_usuario` donde las claves sean nombres de usuario (strings) y los valores sean sus roles (strings). Ejemplo: `{"admin": "superuser", "invitado": "lectura", "auditor": "lectura_logs"}`.
* Imprime el diccionario completo.
* Imprime el rol del usuario "admin".
* Añade un nuevo usuario "desarrollador" con el rol "escritura".
* Imprime el diccionario actualizado.
*Concepto:* Diccionarios (creación, acceso por clave, añadir elementos).

## 2. Operadores

**Ejercicio 2.1 (Aritméticos y Comparación):**
* Usando las variables `intentos_login` y `max_intentos` del ejercicio 1.2, calcula cuántos intentos quedan (`intentos_restantes = max_intentos - intentos_login`). Imprime el resultado.
* Verifica si `intentos_login` es menor que `max_intentos`. Imprime el resultado (debería ser `True` o `False`).
* Verifica si el `nombre_usuario` (del ejercicio 1.1, asegúrate de que esté definido) es exactamente igual a "admin". Imprime el resultado.
*Concepto:* Operadores aritméticos (`-`), Operadores de comparación (`<`, `==`).

**Ejercicio 2.2 (Lógicos):**
* Crea dos variables booleanas: `usuario_valido = True` y `password_correcto = False`.
* Verifica si el usuario es válido **Y** la contraseña es correcta. Imprime el resultado.
* Verifica si el usuario es válido **O** la contraseña es correcta. Imprime el resultado.
* Verifica si el usuario **NO** es válido. Imprime el resultado.
*Concepto:* Operadores lógicos (`and`, `or`, `not`).

## 3. Estructuras de Control: Condicionales (`if`, `elif`, `else`)

**Ejercicio 3.1 (Comprobación Simple):**
* Pide al usuario que introduzca una contraseña usando `input("Introduce tu contraseña: ")`. Guarda la entrada en una variable `password_introducida`.
* Comprueba si la longitud (número de caracteres) de `password_introducida` es menor que 8.
* Si es menor que 8, imprime "Contraseña demasiado corta. Debe tener al menos 8 caracteres."
* Si no (es decir, si es 8 o más), imprime "Longitud de contraseña aceptable."
*Concepto:* `input()`, `len()`, `if...else`.

**Ejercicio 3.2 (Múltiples Condiciones):**
* Usando la `password_introducida` del ejercicio anterior (puedes pedirla de nuevo o reutilizar la variable si estás ejecutando secuencialmente):
    * Si la longitud es menor que 8, imprime "Contraseña DÉBIL".
    * Si la longitud está entre 8 y 12 (inclusive), imprime "Contraseña MEDIA".
    * Si la longitud es mayor que 12, imprime "Contraseña FUERTE".
*Concepto:* `if...elif...else`, operadores de comparación (`<`, `>=`, `<=`, `>`).

**Ejercicio 3.3 (Pertenencia):**
* Pide al usuario que introduzca su dirección IP usando `input()`.
* Usando la lista `ips_permitidas` del ejercicio 1.3 (asegúrate de que esté definida), comprueba si la IP introducida está en la lista.
* Si está en la lista, imprime "Acceso permitido."
* Si no está en la lista, imprime "Acceso denegado."
*Concepto:* `in` operator with lists, `if...else`.

```python
ips_permitidas = ["192.168.1.1", "10.0.0.5", "8.8.8.8", "192.168.1.100"]
```


## 4. Estructuras de Control: Bucles (`for`, `while`)

**Ejercicio 4.1 (`for` con Listas):**
* Itera sobre la lista `ips_permitidas` (asegúrate de que esté definida).
* Dentro del bucle, imprime cada dirección IP precedida por "Verificando IP: ".
*Concepto:* Bucle `for` para iterar sobre listas.

```python
ips_permitidas = ["192.168.1.1", "10.0.0.5", "8.8.8.8", "192.168.1.100"] 
```

**Ejercicio 4.2 (`for` con `range`):**
* Usa un bucle `for` y la función `range()` para imprimir los números del 1 al 5 (inclusive).
*Concepto:* Bucle `for`, `range()`.

**Ejercicio 4.3 (`while`):**
* Simula un contador de intentos de acceso. Inicializa una variable `intentos` a 0.
* Usa un bucle `while` que se ejecute mientras `intentos` sea menor que 3.
* Dentro del bucle, imprime "Intento número X" (sustituyendo X por el número de intento actual, empezando desde 1).
* Incrementa la variable `intentos` en 1 en cada iteración.
* Al salir del bucle, imprime "Número máximo de intentos alcanzado."
*Concepto:* Bucle `while`, contadores, incremento.

## 5. Funciones

**Ejercicio 5.1 (Función Simple):**
* Define una función llamada `saludar_usuario` que tome un argumento `nombre`.
* Dentro de la función, debe imprimir "Hola, [nombre]! Bienvenido/a.".
* Llama a la función pasándole tu nombre.
*Concepto:* Definición de funciones (`def`), argumentos, llamadas a funciones.


**Ejercicio 5.2 (Función con Retorno):**
* Define una función llamada `es_longitud_segura` que tome un argumento `password`.
* La función debe devolver `True` si la longitud del `password` es 8 o más, y `False` en caso contrario.
* Llama a la función con diferentes contraseñas (ej. "12345", "claveSegura123") y guarda el resultado en una variable. Imprime esa variable para ver el resultado.

**Ejercicio 5.3 (Función con Bucle y Lista):**
* Define una función llamada `verificar_ip` que tome dos argumentos: `ip_a_verificar` (un string) y `lista_ips` (una lista).
* Dentro de la función, usa un bucle `for` para recorrer `lista_ips`.
* Si `ip_a_verificar` se encuentra en `lista_ips`, la función debe devolver `True` inmediatamente.
* Si el bucle termina sin encontrar la IP, la función debe devolver `False` (fuera del bucle).
* Llama a la función usando la lista `ips_permitidas` y prueba con una IP que esté en la lista ("10.0.0.5") y otra que no ("1.1.1.1"). Imprime los resultados.
*Concepto:* `return` statement, funciones que devuelven booleanos.

**Ejercicio 5.3 (Función con Bucle y Lista):**
* Define una función llamada `verificar_ip` que tome dos argumentos: `ip_a_verificar` (un string) y `lista_ips` (una lista).
* Dentro de la función, usa un bucle `for` para recorrer `lista_ips`.
* Si `ip_a_verificar` se encuentra en `lista_ips`, la función debe devolver `True` inmediatamente.
* Si el bucle termina sin encontrar la IP, la función debe devolver `False` (fuera del bucle).
* Llama a la función usando la lista `ips_permitidas` y prueba con una IP que esté en la lista ("10.0.0.5") y otra que no ("1.1.1.1"). Imprime los resultados.
*Concepto:* Combinar funciones, bucles, listas y `return`.

```python
ips_permitidas = ["192.168.1.1", "10.0.0.5", "8.8.8.8", "192.168.1.100"]
```


## 6. Manejo de Errores Básico (`try...except`)
**Ejercicio 6.1 (Entrada Numérica):**
* Pide al usuario que introduzca el número de días de validez de una contraseña (un entero) usando `input()`.
* Intenta convertir la entrada a un entero usando `int()`.
* Usa un bloque `try...except ValueError` para manejar el caso en que el usuario introduzca texto en lugar de un número.
* Si la conversión es exitosa, imprime "Número de días establecido: [número]".
* Si ocurre un `ValueError`, imprime "Error: Debes introducir un número entero."

*Concepto:* `try...except`, `ValueError`, `int()`.

## 7. Entrada/Salida Básica (Archivos)

**Ejercicio 7.1 (Escritura en Archivo):**
* Crea una lista de strings llamada `usuarios_bloqueados = ["user1", "test_user", "guest"]`.
* Abre un archivo llamado `bloqueados.txt` en modo escritura (`'w'`). Se recomienda usar `with`.
* Usa un bucle `for` para recorrer la lista `usuarios_bloqueados`.
* Dentro del bucle, escribe cada nombre de usuario en el archivo, seguido de un salto de línea (`\n`).

*Concepto:* Abrir archivos (`open()`), modo escritura (`'w'`), escribir líneas (`write()`), saltos de línea (`\n`), `with` statement.

**Ejercicio 7.2 (Lectura de Archivo):**
* Abre el archivo `bloqueados.txt` que creaste en el ejercicio anterior en modo lectura (`'r'`), usando `with`.
* Lee todas las líneas del archivo usando `readlines()` y guárdalas en una nueva lista llamada `leidos_desde_archivo`.
* Imprime la lista `leidos_desde_archivo`.
* *Opcional Avanzado:* Imprime la lista pero eliminando el `\n` de cada elemento usando un bucle `for` y el método `.strip()`.

*Concepto:* Modo lectura (`'r'`), leer líneas (`readlines()`), `with` statement, método `strip()` (opcional).