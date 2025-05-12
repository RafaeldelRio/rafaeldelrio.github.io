# Boletín de Ejercicios Adicional: Diseño de Clases en Java

Aquí tienes una serie de ejercicios para seguir practicando el diseño de clases en Java.

## Ejercicio A1: Gestión de Libros en una Biblioteca

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

## Ejercicio A2: Mejoras en la Gestión de Biblioteca

Realizar algunas mejoras sobre el ejercicio A1:

-   Mejorar el método `Biblioteca.agregarLibro(...)`:
    -   Si se añade un libro con un ISBN que ya existe, en lugar de solo incrementar las copias, se debe actualizar el objeto `Libro` existente con la información del `nuevoLibro` (título, autor) y sumar las `numeroDeCopiasDisponibles`.
    -   La operación de redimensionar el array si está lleno debe extraerse a un método privado `redimensionarCatalogo()`.
-   Añadir a la clase `Biblioteca` un método `librosPorAutor(String autor)` que devuelva un `Libro[]` (o `ArrayList<Libro>`) con todos los libros de un autor específico.

## Ejercicio A3: Simulación de Cuenta Bancaria

Crea una clase `CuentaBancaria` para simular las operaciones básicas de una cuenta.

-   Atributos: `numeroCuenta` (String, único), `nombreTitular` (String), `saldo` (double), `tipoCuenta` (String, ej: "Ahorro", "Corriente").
-   Constructores:
    -   Uno que reciba `numeroCuenta`, `nombreTitular`, y `tipoCuenta`. El saldo inicial será 0.
    -   Otro que reciba todos los atributos, incluyendo el saldo inicial.
-   Métodos:
    -   `depositar(double cantidad)`: Incrementa el saldo. La cantidad debe ser positiva.
    -   `retirar(double cantidad)`: Decrementa el saldo.
        -   Si la cantidad es positiva y hay saldo suficiente, realiza la operación y devuelve `true`.
        -   Si la cantidad es negativa o no hay saldo suficiente, no hace nada y devuelve `false`, imprimiendo un mensaje adecuado por consola.
    -   `consultarSaldo()`: Devuelve el saldo actual.
    -   `getNumeroCuenta()`, `getNombreTitular()`, `getTipoCuenta()`.
    -   `transferir(CuentaBancaria cuentaDestino, double cantidad)`: Transfiere una `cantidad` desde la cuenta actual a `cuentaDestino`. Debe verificar que hay saldo suficiente en la cuenta origen y que la cantidad es positiva. Devuelve `true` si la transferencia fue exitosa, `false` en caso contrario.

Crea una clase `EjercicioA3Main` con un método `main` que demuestre el funcionamiento: crea dos cuentas, realiza depósitos, retiradas y una transferencia entre ellas. Muestra los saldos después de cada operación relevante.

## Ejercicio A4: Generador de Equipos Aleatorios

Se necesita una clase `GeneradorEquipos` para formar equipos de jugadores.

-   Clase interna (o separada) `Jugador`:
    -   Atributos: `nombre` (String), `nivelHabilidad` (int, 1-10).
    -   Constructor para inicializar `nombre` y `nivelHabilidad`.
    -   `getters` para sus atributos.
    -   `toString()` que devuelva "Nombre (Nivel: X)".

-   Clase `GeneradorEquipos`:
    -   Atributos: Un `ArrayList<Jugador>` llamado `listaJugadoresDisponibles`.
    -   Constructores:
        -   Uno vacío que inicialice la lista de jugadores.
    -   Métodos:
        -   `agregarJugador(Jugador jugador)`: Añade un jugador a la lista de disponibles.
        -   `eliminarJugador(String nombreJugador)`: Elimina un jugador de la lista.
        -   `generarEquipos(int numeroDeEquipos)`:
            -   Recibe el número de equipos a formar.
            -   Distribuye los jugadores disponibles de la forma más equitativa posible entre el `numeroDeEquipos` especificado. La equidad se puede basar primero en cantidad y luego intentar balancear por `nivelHabilidad` (opcional, para mayor desafío).
            -   Devuelve un `ArrayList<ArrayList<Jugador>>`, donde cada `ArrayList<Jugador>` interno representa un equipo.
            -   Si no hay suficientes jugadores para formar los equipos (ej. 1 jugador para 2 equipos), debe devolver una lista vacía o `null` y mostrar un mensaje.
        -   `mostrarEquipos(ArrayList<ArrayList<Jugador>> equipos)`: Método estático (o de instancia) que imprime la conformación de los equipos de forma clara.

Implementa también una clase `EjercicioA4Main` para probar la funcionalidad: añade varios jugadores y genera 2 o 3 equipos.

## Ejercicio A5: Sistema de Reservas de Vuelos Sencillo

Escribir una clase `Vuelo` y una clase `SistemaReservas`.

-   `Vuelo`:
    -   Atributos: `codigoVuelo` (String), `origen` (String), `destino` (String), `capacidad` (int), `asientosOcupados` (int).
    -   Constructor: Recibe `codigoVuelo`, `origen`, `destino`, `capacidad`. Inicializa `asientosOcupados` a 0.
    -   Métodos:
        -   `getters` para todos los atributos.
        -   `getAsientosDisponibles()`: Devuelve `capacidad - asientosOcupados`.
        -   `reservarAsiento()`: Si hay asientos disponibles, incrementa `asientosOcupados` en 1 y devuelve `true`. Si no, devuelve `false`.
        -   `cancelarReserva()`: Si hay asientos ocupados, decrementa `asientosOcupados` en 1 y devuelve `true`. Si no, devuelve `false`.
        -   `toString()`: Devuelve "Vuelo [CODIGO] de [ORIGEN] a [DESTINO] - Asientos disponibles: X/Y".

-   `SistemaReservas`:
    -   Atributos: Un `ArrayList<Vuelo>` para almacenar los vuelos disponibles.
    -   Constructor: Inicializa la lista de vuelos.
    -   Métodos:
        -   `agregarVuelo(Vuelo vuelo)`: Añade un nuevo vuelo al sistema.
        -   `buscarVuelo(String codigoVuelo)`: Devuelve el objeto `Vuelo` correspondiente al código, o `null` si no existe.
        -   `realizarReserva(String codigoVuelo)`: Busca el vuelo y, si existe y hay disponibilidad, llama a su método `reservarAsiento()`. Devuelve `true` si la reserva fue exitosa, `false` en caso contrario.
        -   `cancelarReservaVuelo(String codigoVuelo)`: Busca el vuelo y, si existe, llama a su método `cancelarReserva()`. Devuelve `true` si la cancelación fue posible, `false` en caso contrario.
        -   `mostrarEstadoVuelos()`: Itera sobre todos los vuelos e imprime su estado usando el método `toString()` de `Vuelo`.

Crea una clase principal para probar el sistema: añade vuelos, realiza y cancela reservas, y muestra el estado.