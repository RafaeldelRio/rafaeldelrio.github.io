¡Claro! Aquí tienes una nueva serie de ejercicios de programación orientada a objetos en Java, con un nivel de dificultad similar a los que me has pasado:

## Ejercicio 1: Gestión de Libros

Se necesita crear una clase `Libro` para gestionar la información de los libros en una biblioteca. De cada libro se requiere conocer:
* `titulo` (String)
* `autor` (String)
* `isbn` (String) - Identificador único del libro
* `editorial` (String)
* `numeroPaginas` (int)
* `precio` (double)

Se necesitan los siguientes constructores:
* Un constructor sin argumentos.
* Un constructor que inicialice `titulo`, `autor` e `isbn`.
* Un constructor que inicialice todos los atributos.

Además, se deben implementar:
* Métodos getters y setters para todos los atributos. El `isbn` no debería poder modificarse una vez establecido (solo getter o setter privado si se inicializa en constructor).
* Los métodos `equals()` (dos libros son iguales si su `isbn` es el mismo), `hashCode()` y `toString()` (que muestre la información del libro de forma legible).
* Un método `mostrarInformacionDetallada()` que imprima por consola todos los datos del libro de forma clara y formateada.
* Un método `actualizarPrecio(double nuevoPrecio)` que permita modificar el precio del libro. Asegúrate de que el precio no pueda ser negativo.

Implementa un método `main` donde se creen al menos dos objetos de tipo `Libro`, se muestre su información por consola utilizando `toString()` y `mostrarInformacionDetallada()`, y se pruebe el método `actualizarPrecio`.

## Ejercicio 2: Simulación de Cuenta Bancaria

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


## Ejercicio 3: Gestión de Playlist Musical

Diseña una clase `Cancion` con los atributos: `titulo` (String), `artista` (String), y `duracionSegundos` (int).
* Implementa un constructor que reciba todos los atributos.
* Implementa getters y setters.
* Implementa `equals()` (dos canciones son iguales si título y artista son iguales), `hashCode()` y `toString()`.

Luego, crea una clase `Playlist` que tendrá los siguientes atributos:
* `nombrePlaylist` (String)
* `canciones` (un array de objetos `Cancion`) - Capacidad máxima de 20 canciones.
* `numeroCancionesActual` (int) - Para controlar cuántas canciones hay en el array.

Para la clase `Playlist`:
* Implementa un constructor que reciba el `nombrePlaylist` e inicialice el array de canciones y `numeroCancionesActual` a `0`.
* Métodos getters para `nombrePlaylist` y `numeroCancionesActual`. No se necesitan setters directos para `canciones` o `numeroCancionesActual`.
* Implementa `equals()` (dos playlists son iguales si tienen el mismo nombre y las mismas canciones en el mismo orden), `hashCode()` y `toString()` (que muestre el nombre de la playlist y los detalles de cada canción).

Añade los siguientes métodos a la clase `Playlist`:
* `agregarCancion(Cancion cancion)`: Añade una canción al final de la playlist si hay espacio. Si la playlist está llena, mostrará un mensaje. Devolverá `true` si se añadió, `false` si no.
* `eliminarCancion(String tituloCancion)`: Busca una canción por su título y la elimina de la playlist (debes reorganizar el array para no dejar huecos). Devuelve `true` si la encontró y eliminó, `false` en caso contrario.
* `buscarCancionPorTitulo(String tituloCancion)`: Devuelve la `Cancion` si la encuentra, o `null` si no.
* `duracionTotalPlaylist()`: Devuelve la duración total de la playlist en segundos.
* `mostrarCanciones()`: Imprime por consola la lista de canciones de la playlist.

Crea un programa `main` para probar la funcionalidad: crea algunas canciones, crea una playlist, añade canciones, elimina alguna, busca una canción y muestra la duración total y todas las canciones de la playlist.


## Ejercicio 4: Inventario de Tienda

Se quiere gestionar el inventario de una pequeña tienda. Para ello, crea una clase `Articulo` con los siguientes atributos:
* `codigo` (String) - Identificador único del artículo.
* `nombre` (String)
* `descripcion` (String)
* `precioCompra` (double)
* `precioVenta` (double)
* `stock` (int)

Se necesitan:
* Un constructor que inicialice todos los atributos.
* Un constructor que inicialice `codigo`, `nombre` y `precioVenta` (stock inicial `0`, descripción vacía, `precioCompra` igual a `precioVenta` * `0.6`).
* Métodos getters y setters para todos los atributos. Valida que los precios y el stock no sean negativos.
* Los métodos `equals()` (dos artículos son iguales si su `codigo` es el mismo), `hashCode()` y `toString()`.
* Un método `incrementarStock(int cantidad)` que aumente el stock del artículo. La cantidad debe ser positiva.
* Un método `decrementarStock(int cantidad)` que disminuya el stock. La cantidad debe ser positiva y no se puede decrementar más allá del stock disponible. Devuelve `true` si la operación es exitosa, `false` si no.
* Un método `obtenerGananciaUnitaria()` que devuelva la diferencia entre `precioVenta` y `precioCompra`.
* Un método `esRentable()` que devuelva `true` si `precioVenta` es mayor que `precioCompra`, `false` en caso contrario.

Implementa una clase `GestionInventario` con un método `main`. En el `main`:
1.  Crea un array (o `ArrayList`) para almacenar objetos de tipo `Articulo`.
2.  Añade varios artículos al inventario.
3.  Implementa una función (puede ser un método estático en `GestionInventario` o directamente en `main`) que reciba el array de artículos y un código, y devuelva el artículo correspondiente o `null` si no se encuentra.
4.  Simula la venta de algunos artículos (decrementando su stock) y la llegada de nuevo stock (incrementando).
5.  Muestra por consola el estado final de varios artículos, su ganancia unitaria y si son rentables.
