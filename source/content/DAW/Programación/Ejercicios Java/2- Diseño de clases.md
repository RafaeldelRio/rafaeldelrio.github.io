Estos ejercicios han sido cogidos del repositorio público de Github: https://github.com/OpenWebinarsNet/java-desde-cero-orientacion-objetos

## Ejercicio 1
Crea una aplicación de cálculos estadísticos en Java con 2 clases:
  
- `Muestra`: representará una muestra de números enteros. 
  - Como atributos tendrá el array de números enteros y una variable que indica cuántos valores hay realmente en el array (podemos tener un array de 10 posiciones, pero solamente haber introducido 3 datos).
  - Crea varios constructores:
    - Uno sin argumentos. Debe instanciar el array con 10 posiciones. El nº de posiciones por defecto debe estar almacenado en una constante llamada `DEFAULT_SIZE`.
    - Otro con un argumento entero, que será el tamaño del array.
    - Otro que reciba un array, del cual se hará una copia.
  - La clase tendrá además un método para agregar números a la muestra, y dos métodos getter, para obtener los números y la cantidad de ellos.
  
- `Estadistica`: permitirá realizar cálculos estadísticos sobre una instancia de `Muestra`. Los cálculos a realizar serán:
  - Media: el valor promedio de todos.
  - Moda: el valor que más se repite.
  
  Todos los métodos de esta clase se podrán utilizar sin crear una instancia de la misma  

La solución del ejercicio está disponibles en: [[Soluciones boletín 2#Soluciones ejercicio 1]]


## Ejercicio 2
Realizar algunas mejoras sobre el ejercicio 1:

- Mejorar el método `Muestra.agregarNumero(...)` de tal forma  que si al agregar un número vamos a superar el tamaño del array, aumente la capacidad de este en 10 unidades. Esta operación de recolocación se realizará mediante un método privado.
- Mejorar el método Estadistica.media de tal forma que lo vamos a sobrecargar para que haya otra versión que acepte únicamente un array de enteros, y calcule el promedio de todos ellos. Para aprovechar el código, se debe crear un tercer método, privado, que haga realmente el cálculo de la media, y usarlo en los dos métodos públicos.

La solución del ejercicio está disponibles en: [[Soluciones boletín 2#Soluciones ejercicio 2]]


## Ejercicio 3
Crea una clase `Cartera`, que servirá para manejar el dinero que se lleva encima. Esta se podrá crear a través un constructor vacío o de un constructor con un argumento, que será el dinero inicial de la cartera. Como atributo, tendrá el saldo de dinero disponible. Se deben añadir los siguientes métodos:
   - `sacarDinero(double cantidad)`: debe seguir las siguientes reglas
     - Si hay disponible, sacará todo el dinero que se ha solicitado.
     - Si no hay saldo suficiente disponible, solamente sacará el dinero disponible, e imprimirá un mensaje por consola diciendo: TU SALDO SE HA QUEDADO A 0.
     - Si el saldo al inicio de la operación es 0, debe mostrar el mensaje NO TIENES SALDO DISPONIBLE.
   - `consultarSaldo()`: debe devolver un double con el saldo disponible.
   - `meterDinero(double cantidad)`: agregará una cuantía al saldo de la cartera.

Crea además un método main que muestre el funcionamiento de esta clase.


La solución del ejercicio está disponibles en: [[Soluciones boletín 2#Soluciones ejercicio 3]]


## Ejercicio 4

Se necesita crear una clase `Password` para manejar contraseñas. Esta clase debe incluir:

    - Un método público y estático que sea capaz de generar una contraseña aleatoria. Recibirá como argumento el número de caracteres de la contraseña aleatoria a generar.
    - Las instancias de la clase incluirán:
      - Un atributo de tipo cadena de caracteres con la contraseña.
      - Un constructor vacío y otro con un argumento de tipo String.
      - Los métodos getter/setter para la contraseña.
      - Un método que devolverá la longitud de la contraseña.
      - Un método, llamado `isStrong`, que devolverá un booleano determinando si la contraseña es fuerte. Para ello, se seguirán las reglas del ejercicio 2 del bloque 5 del curso Java desde cero: Introducción, cuyo código fuente está accesible [aquí](https://github.com/lmlopezmagana/java-desde-cero-introduccion/blob/main/ejemplos/5.05_Ejercicio2/src/cadenas/Ejercicio02.java).

Implementa también una clase llamada `Ejercicio04` que ilustre el funcionamiento de `Password`.


La solución del ejercicio está disponibles en: [[Soluciones boletín 2#Soluciones ejercicio 4]]


## Ejercicio 5
Escribir una clase `Reloj` que simule el comportamiento de un cronómetro digital:

- Como argumentos tendrá 3 valores enteros: hora, minutos y segundos.
- Debe incluir un constructor sin parámetros que dejará la hora a 00:00:00.
- Un método que devolverá la hora actual.
- Un método para incrementar la hora actual en 1 segundo. Se debe manejar correctamente que cuando los segundos lleguen a 60, pasen a ser 00 y se incremente un minuto, y así con los minutos y las horas. Cuando se tenga las 23:59:59, el siguiente incremento debería devolver 00:00:00.
- Un método que realizará al puesta a 0 del cronómetro.

## Ejercicio 6
Escribir una clase `Fecha` que simule el comportamiento de una fecha del calendario.

- Tendrá tres argumentos: día, mes y año.
- Debe incluir un constructor sin argumentos y otro con los 3 argumentos.
- En todo momento, las fechas deben ser válidas, y si los datos proporcionados no producen una fecha válida, se obtendrá como fecha el 01/01/2000.
- Un método que devolverá la fecha en formato dia/mes/año. Por ejemplo 18/09/2003.
- Un método `incrementar` que aceptará un número de días, y que incrementará la fecha en dicha cantidad. El estado de la fecha debe ser consistente.

> Recuerda que un año es bisiesto si es múltiplo de cuatro, no lo es de cien, o si lo es de 400.

> Recuerda que Enero, Marzo, Mayo, Julio, Agosto, Octubre y Diciembre tienen 31 días, y el resto de meses 30, salvo Febrero que tiene 28 (y en los años bisiestos 29).

## Ejercicio 7
Modificar la clase `Estadistica` del ejercicio 2 para añadir un una nueva sobrecarga del método `media` que acepte un _varargs_ de números enteros. Utiliza la implementación del método privado `media(array, int)` para realizar el cálculo.

## Ejercicio 8
Modifica la clase `Estadistica` para añadir las mismas sobrecargas del método `media` para el método `moda`.

## Ejercicio 9
Utilizando la clase `Producto` del ejercicio 3 de la sección 1, crea una clase para simular un carrito de la compra:

- Tendrá un array para poder agregar los productos que deseemos.
- Añade los constructores que estimes necesarios.
- Deberá tener un método que nos indique la cantidad de productos en el carrito.
- Tendrá un método que nos devuelva el precio total de los productos del carrito.
- Tendrá un método para añadir productos al carrito, y otro para sacar productos del carrito. Es posible que sea bueno que tengas algún método privado para reajustar el tamaño del array.

## Ejercicio 10
Utilizando como base la clase `Personaje` del ejercicio 4 de la sección 1, con las siguientes consignas:

- Modifica la clase `Personaje` para que incluya un atributo, `puntosFuerza`, que será un entero entre 1 y 10.

- Crea una clase que simule una `Batalla` entre personajes. Para ello:
   - Tendrá un método estático que recibirá dos personajes, que lucharán en la batalla.
   - Debe devolver el personaje que ha ganado, o `null` si finalmente no ha ganado ninguno.
   - Para la batalla, los  `Personaje`s se darán diferentes golpes, siguiendo estas reglas:
     - Se darán golpes hasta que uno (o los dos) se queden sin puntos de vida.
     - El golpe tendrá como puntuación un número aleatorio entre 1 y 3, multiplicado por los puntos de fuerza del `Personaje`.
     - Si uno de los `Personaje`s, durante la batalla, llega a menos de 30 puntos de vida, puede tomar alguna de sus pociones de BOTIQUIN.
     - Puedes inventarte algunas pociones más que pueda usar el personaje para incrementar la fuerza de los golpes.
    - Todas las iteraciones del bucle del método de la batalla deberían mostrar los pasos que suceden en la misma por la consola.

Crea una clase, llamada `Ejercicio10`, donde se instancien los personajes y se realice la batalla.