## Pregunta 1. Orientación a objetos.

Desarrolla una clase `CuentaBancaria` que simule las operaciones básicas de una cuenta. La clase debe tener los siguientes atributos:
* `numeroCuenta` (String) - Formato libre, pero único.
* `nombreTitular` (String)
* `saldo` (double)
* `tipoCuenta` (String) - Por ejemplo: "Ahorro", "Corriente", "Inversión".

Se requieren los siguientes constructores:
* Un constructor sin argumentos (saldo inicial `0.0`).
* Un constructor que reciba `numeroCuenta` y `nombreTitular` (saldo inicial `0.0`).
* Un constructor que reciba todos los atributos.

Implementa lo siguiente:
* Métodos getters y setters. El `numeroCuenta` no debería ser modificable tras la creación del objeto. El `saldo` solo debe ser modificable a través de los métodos de ingreso y retiro.
* Los métodos `equals()` (dos cuentas son iguales si su `numeroCuenta` es el mismo), `hashCode()` y `toString()`.
* Un método `ingresarDinero(double cantidad)` que incremente el saldo. Debe validar que la cantidad a ingresar sea positiva. Devolverá `true` si la operación fue exitosa, `false` en caso contrario.
* Un método `retirarDinero(double cantidad)` que decremente el saldo. Debe validar que la cantidad a retirar sea positiva y que haya saldo suficiente. Devolverá `true` si la operación fue exitosa, `false` en caso contrario.
* Un método `consultarSaldo()` que devuelva el saldo actual.

Crea una clase principal con un método `main` para instanciar objetos `CuentaBancaria`, realizar algunas operaciones de ingreso y retiro, y mostrar el estado de las cuentas.

## Pregunta 2. Diseño de clases
Crea una aplicación para gestionar libros en una biblioteca con 2 clases:

-   `Libro`: Representará un libro con la siguiente información:
    -   Atributos: `titulo` (String), `autor` (String), `isbn` (String), `numeroDeCopiasDisponibles` (int).
    -   Constructores:
        -   Uno que reciba todos los atributos.
        -   Otro que reciba `titulo`, `autor`, `isbn` y establezca `numeroDeCopiasDisponibles` a 1 por defecto.
    -   Métodos:
        -   `getters` para todos los atributos.
        -   `setNumeroDeCopiasDisponibles(int numero)`
        -   `prestarLibro()`: Decrementa el número de copias disponibles en 1 si hay copias. Devuelve `true` si se pudo prestar, `false` en caso contrario.
        -   `devolverLibro()`: Incrementa el número de copias disponibles en 1.
        -   `toString()`: Devuelve una representación en cadena del libro (ej: "El Quijote por Miguel de Cervantes (ISBN: XXX) - Copias: Y").

-   `Biblioteca`: Gestionará una colección de objetos `Libro`.
    -   Atributos: Un array de `Libro` y una variable que indica cuántos libros distintos hay (no el total de copias). La capacidad inicial del array debe ser de 20 (`CAPACIDAD_INICIAL`).
    -   Constructores:
        -   Uno sin argumentos que inicialice el array con `CAPACIDAD_INICIAL`.
    -   Métodos:
        -   `agregarLibro(Libro nuevoLibro)`: Añade un libro a la biblioteca. Si el libro (mismo ISBN) ya existe, simplemente incrementa su `numeroDeCopiasDisponibles` con las del `nuevoLibro`. Si es un libro nuevo y no hay espacio, el array debe redimensionarse (aumentar su capacidad en 10).
        -   `buscarLibroPorIsbn(String isbn)`: Devuelve el `Libro` con ese ISBN, o `null` si no se encuentra.
        -   `listarLibrosDisponibles()`: Imprime por consola los detalles de todos los libros que tengan al menos una copia disponible.
        -   `totalLibrosDistintos()`: Devuelve la cantidad de títulos diferentes en la biblioteca.