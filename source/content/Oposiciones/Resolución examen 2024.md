---
draft: "true"
---
**1. ¿Qué debe escribir en EJ1 para obtener el resultado anterior?**

Para obtener la información completa de la distribución (ID del distribuidor, Descripción, Versión, Codename), se debe usar la opción `-a` o `--all`. Asumiendo que el comando es `lsb_release` (el comando estándar para esta información y cuyas opciones coinciden con las mostradas ), la respuesta es:

- **EJ1**: `lsb_release -a` (o `lsb_release --all`)

Otros comandos interesantes que revisar:
- uname [-a, -r, -v]

**2. ¿Qué debe escribir en EJ2.1, EJ2.2, EJ2.3 y EJ2.4 para que el script md5.sh funcione según la salida?**

El script verifica argumentos y compara hashes MD5.

- **EJ2.1**: `$# -ne 2` (Comprueba si el número de argumentos (`$#`) no es igual (`-ne`) a 2).
- **EJ2.2**: `-f $1` (Comprueba si el primer argumento (`$1`) es un fichero regular (`-f`)). La negación `!` hace que el `if` se active si _no_ es un fichero.
- **EJ2.3**: `md5sum $1` (Calcula el hash MD5 del primer argumento/fichero).
- **EJ4.4**: `$1` (Extrae con `awk` el primer campo (`$1`) de la salida de `md5sum`, que es el hash).

**3. ¿Para qué se utiliza el primer argumento "-4"? ¿Qué significan las siglas "ss" de este comando?**

Basado en el comando `ss -l -n -t -p` (aunque en la imagen aparece `ss -4 -l -n -t` ) y el contexto de redes:

- **-4**: Muestra únicamente sockets IPv4. (Respuesta: "Muestra sólo sockets IPv4")
- **ss**: Significa "socket statistics" (estadísticas de socket). (Respuesta: "Socket statistics")

**4. ¿Qué debe escribir en EJ4.1, EJ4.2, EJ4.3 y EJ4.4?**

Para permitir el login SSH como root y reiniciar el servicio:

- **EJ4.1**: `PermitRootLogin yes` (Directiva para permitir el login de root).
- **EJ4.2**: `/etc/ssh/sshd_config` (Fichero de configuración del servidor SSH donde se añade la directiva).
- **EJ4.3**: `restart` (Acción para reiniciar el servicio systemd).
- **EJ4.4**: `ssh` (o `sshd`, el nombre del servicio SSH en systemd).

**5. Complete el comando "iptables" y utilidad de "-c 1".**

Para rechazar (`REJECT`) paquetes ICMP de tipo `echo-request` (ping) salientes (`OUTPUT`):

- **EJ5.1**: `OUTPUT` (Cadena para tráfico saliente).
- **EJ5.2**: `icmp` (Protocolo ICMP).
- **EJ5.3**: `echo-request` (Tipo de ICMP para solicitud de ping, también se podría usar `8`).
- **EJ5.4**: `j REJECT` (Acción a realizar: rechazar el paquete).
- **Significado "-c 1"**: Limita el comando `ping` a enviar sólo un paquete. (Respuesta: "Enviar sólo un paquete ping")

**6. Configuración OpenLDAP y LDIF.**

Configuración de hostname, instalación y creación de OU:

- **EJ6.1**: `set-hostname ldap.iesmm.local` (Establece el nombre de host completo).
- **EJ6.2**: `slapd ldap-utils` (Paquetes para el servidor OpenLDAP y utilidades).
- **EJ6.3**: `cn=admin,dc=iesmm,dc=local` (DN del administrador para la operación `ldapadd`).
- **EJ6.4**: `Departamentos` (Nombre de la Unidad Organizativa).
- **EJ6.5**: `iesmm` (Primer componente del dominio).
- **EJ6.6**: `local` (Segundo componente del dominio).
- **EJ6.7**: `organizationalUnit` (Clase de objeto para una OU).

**7. Resultado del código C (EJ7).**

El código tiene errores:

1. `valor = (arreglo);`: Intenta asignar un puntero (la dirección base del array) a una variable `int`. Esto es incorrecto sintácticamente o, si compila con advertencias, es una conversión peligrosa.
2. `printf("%d, %d %d\n", valor, apuntador1, *apuntador2);`: Usa `%d` para imprimir `apuntador1`, que es un puntero (`int *`). Debería usarse `%p`. Imprimir un puntero como un entero (`%d`) provoca comportamiento indefinido o incorrecto. Debido a estos problemas, el resultado más probable y esperado en un contexto de examen es un error.

- **EJ7**: `ERROR`

**8. Resultado del código C (EJ8).**

El código analiza el tamaño de un puntero:

- `array` se pasa a `f1` por valor. Dentro de `f1`, la variable local `arr` recibe la dirección de la memoria asignada por `malloc`, pero `array` en `main` sigue siendo `NULL`.
- `sizeof(array)` devuelve el tamaño del _puntero_ `array` (tipo `int *`), no de la memoria asignada (que además no es accesible a través de `array` en `main`).
- En un sistema de 64 bits, `sizeof(int *)` es 8 bytes. `sizeof(int)` suele ser 4 bytes.
- El cálculo es `8 / 4 = 2`.
- **EJ8**: `2`

**9. TEST Código C (EJ9).**

Se busca imprimir el valor `12`, que está en `vector[7]`.

- A. `&(vector + 7)`: Dirección de una dirección (incorrecto/error).
- B. `*(vector + 7)`: Valor en la dirección `vector + 7`, que es `vector[7]`. Correcto.
- C. `&vector[7]`: Dirección del elemento en el índice 7. Incorrecto.
- **EJ9**: `B`

**10. TEST Código C++ (EJ10).**

Polimorfismo con clases Base y Derivada.

- `Base* obj = new Derived();`: Puntero base apunta a objeto derivado.
- `obj->display();`: Llama al método `display`. Como es `virtual` en Base y `override` en Derived, se llama a `Derived::display()`.
- Imprime "Derived".
- **EJ10**: `B`

**11. TEST Código C++ (EJ11).**

Función recursiva `funcion1`. El seguimiento detallado muestra:

1. Llamadas recursivas imprimen: `3,` `2,` `1,`
2. Caso base (`num == 0`): imprime `Fin,` `0,`
3. Al volver de la recursión, se imprime el valor de `num` en cada nivel: `1,` `2,` `3,`
4. Salida completa: `3,2,1,Fin,0,1,2,3,`

- **EJ11**: `B` (La opción B coincide con la salida `3,2,1,Fin,0,1,2,3,`)

**12. Sentencia SQL (EJ12).**

Obtener nombre y total de pedidos para usuarios con al menos dos pedidos. Se necesita agrupar por usuario y filtrar con `HAVING`.

- **EJ12**: `SELECT u.Nombre, COUNT(p.PedidoID) FROM Usuarios u JOIN Pedidos p ON u.UserID = p.UserID GROUP BY u.UserID HAVING COUNT(p.PedidoID) >= 2;`

**13. Sentencia SQL (EJ13).**

Eliminar usuarios sin pedidos. Se puede usar `LEFT JOIN` y comprobar si hay pedidos asociados (`IS NULL`).

- **EJ13**: `DELETE u FROM Usuarios u LEFT JOIN Pedidos p ON u.UserID = p.UserID WHERE p.PedidoID IS NULL;` (Otra opción válida: `DELETE FROM Usuarios WHERE UserID NOT IN (SELECT DISTINCT UserID FROM Pedidos);`)