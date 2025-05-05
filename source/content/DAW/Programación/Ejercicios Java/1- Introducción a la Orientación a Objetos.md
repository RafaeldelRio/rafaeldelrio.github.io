  
Estos ejercicios han sido cogidos del repositorio público de Github: https://github.com/OpenWebinarsNet/java-desde-cero-orientacion-objetos
## Ejercicio 1. 
Se necesita crear una clase que representará a un `Alumno` de un centro educativo. De cada alumno se quiere conocer el nombre, apellidos, email, edad y teléfono.

Se necesitan diferentes constructores.
- Sin argumentos.
- Nombre, apellidos y edad.
- Todos los atributos.

Además:
* Se deben implementar los métodos getters/setters.
* Se deben implementar los métodos `equals`, `hashcode` y `toString`.
* Se debe añadir un método que nos indique si el alumno es mayor de edad (>= 18 años).

Implementa un método main donde se creen un par de objetos de tipo `Alumno` y se muestren por consola.

La solución del ejercicio está disponibles en: [[Soluciones boletín 1#Soluciones ejercicio 1]]

## Ejercicio 2
Utilizando la clase Alumno del ejercicio 1, crea un programa en Java que tenga un array de objetos de esta clase y nos indique cuál es el alumno más joven de todos.

La solución del ejercicio está disponibles en: [[Soluciones boletín 1#Soluciones ejercicio 2]]


## Ejercicio 3. 
Se necesita implementar una clase llamada `Producto` que tenga los siguientes atributos: código, nombre, descripcion y precio. Se necesita un constructor sin argumentos y otro para todos los argumentos. Se deben implementar también los métodos getters/setters, `equals`, `hashCode` y `toString`. Se necesita además un método que devuelva una cadena de caracteres según el precio del producto, siguiendo las siguientes reglas:

- precio < 1.0€ -> GANGA
- 1.0€ <= precio < 10 -> NORMAL
- precio >= 10 -> LUJO

La solución del ejercicio está disponibles en: [[Soluciones boletín 1#Soluciones ejercicio 3]]

## Ejercicio 4
Para implementar un juego, necesitamos una clase `Personaje`, que tendrá los siguientes atributos: nombre, puntos de vida (un entero entre 0 y 100), puntos conseguidos (un valor entero mayor que 0) y una mochila, que será un array de String con los nombres de algunos elementos que se puede encontrar por el juego (pociones, herramientas, ...). Este array puede tener, como mucho, 10 elementos. Para manejar el array, también sería bueno tener una variable entera que nos indicara el número de pociones o herramientas que tenemos dentro del array.

Implementa un constructor sin argumentos, y otro que reciba como argumento el nombre. Ten en cuenta que cuando se instancia un `Personaje` siempre tendrá 100 puntos de vida disponibles, así como 0 puntos conseguidos.

Incluye los métodos equals, hashCode y toString. También los métodos getters, setters, salvo para los atributos de la mochila y su número de elementos, que solamente tendrán método getter.

Añade además los siguientes métodos:

- Uno que sirva para agregar una poción o herramienta al array. Si el array está completo, simplemente no la añadirá, pero mostrará un mensaje por consola, del tipo: "YA NO PUEDES CONSEGUIR MÁS ELEMENTOS PUES TU MOCHILA ESTÁ COMPLETA". Si todo va bien, devolverá el número de elementos que hay en la mochila.
- Otro método, que se llamará `recibirGolpe` que recibe un valor entero como argumento, con el número de puntos de vida que se deben restar al personaje. Debe devolver el número de puntos de vida que restan al personaje. Ten en cuenta que el valor resultante nunca debe ser menor que 0.
- Otro que sirva para buscar en el array la poción de tipo "BOTIQUIN" y usarla, y así incrementar en 10 unidades los puntos de vida. Ten en cuenta que los puntos de vida no pueden superar nunca el número 100.
Debe devolver el número de puntos de vida resultante. Si no tiene ninguna poción de tipo "BOTIQUIN", debe mostrar un mensaje como este por consola: "LO SIENTO, PERO NO TIENES NINGUNA POCIÓN DE BOTIQUÍN".

La solución del ejercicio está disponibles en: [[Soluciones boletín 1#Soluciones ejercicio 4]]

## Ejercicio 5. 
Modifica el ejercicio 2 para incluir en el alumno un atributo que incluya todas las notas del alumno en un array de `float` (`float[]`). Añade además un método, llamado `notaMedia()` que sea capaz de devolver como un valor numérico la nota media del alumno.

## Ejercicio 6
Completa el ejercicio anterior de modo que tenga un nuevo método, llamado `notaMediaLiteral()`, que siga las siguientes reglas.

Si la nota media es alguno de los siguientes valores, debe devolver el literal correspondiente:

- 0..4 Insuficiente
- 5 Suficiente
- 6 Bien
- 7,8 Notable
- 9,10 Sobresaliente.

## Ejercicio 7.
Completa los ejercicios anteriores para implementar un programa que sea capaz de mostrar los dos alumnos con la mayor nota media.
   
## Ejercicio 8
Modifica la clase `Producto` del ejercicio 3 para añadir:

- Un atributo llamado `descuento`, de tipo double, que indique el porcentaje de descuento del producto (valor entre 0 y 1; por ejemplo, 30% se almacena como 0.3).
- Un método, llamado `precioFinal`, que devuelva el precio aplicando el descuento, si es que lo tiene.