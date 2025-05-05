
Estos ejercicios han sido cogidos del repositorio público de Github: https://github.com/OpenWebinarsNet/java-desde-cero-orientacion-objetos

## Ejercicio 1
Nos han solicitado una aplicación para gestionar algunos datos de una inmobiliaria. 

- Esta tiene una serie de inmuebles. De cada uno de ellos queremos saber: identificador inmobiliario (entero), dirección, precio de venta y los metros cuadrados. Esta clase será abstracta.
- Los inmuebles pueden ser de tipo Local u orientados a ser una vivienda.
- De cada Local queremos saber si tiene salida de humos o no la tiene (booleano).
- De cada inmueble orientado a ser una vivienda queremos saber el número de habitaciones y el número de baños, además de las habitaciones que tiene. Esta clase será abstracta.
- De cada Habitación queremos saber los metros cuadrados, el número de ventanas y el uso que se le va a dar (dormitorio, salón, despacho, vestidor, …)
- Los InmueblesVivienda pueden ser de dos tipos: Casa y Apartamento. De las casas queremos saber cuántos pisos (plantas en altura) tiene.
- De cada clase se necesita: constructores, getters/setters, equals, hashCode y toString.
- El modelo de herencia no debe ser extensible → clases selladas.

Implementar además un main con algunas viviendas de ejemplo.

![[Ejercicios Java 3 - UML.png]]


La solución del ejercicio está disponibles en: [[Soluciones boletín 3#Soluciones ejercicio 1]]

## Ejercicio 2

Partimos de la solución al ejercicio anterior. El gobierno aplica algunos impuestos al precio de venta de los inmuebles.

- En el caso de los Locales, el precio de venta se ve incrementado con un determinado porcentaje de plusvalía. El porcentaje depende de la localidad y se debe recibir en el constructor.
- Para los InmuebleVivienda, el impuesto que se paga es el IVA del 21%.

Implementa un método que nos indique el precio final de venta aplicando los impuestos.

Añade además un método estático a la clase `Main` que reciba un `Inmueble` y muestre su información. Su comportamiento será diferente en función del tipo de inmueble. Para todos se mostrará el precio final, y además:

* Para los locales, se mostrará nada más su dirección, los m2 y si tiene salida de humos.
* Para las casas, se mostrará su dirección, los m2, el nº de habitaciones y el nº de plantas o pisos.
* Para los apartamentos, se mostrará la dirección, los m2 y el nº de habitaciones.


La solución del ejercicio está disponibles en: [[Soluciones boletín 3#Soluciones ejercicio 2]]


## Ejercicio 3

Una tienda de móviles nos pide ayuda para gestionar sus productos:

- Todo lo que venden, que podemos llamar Producto, tiene un nombre y un precio de venta.
- Hay un tipo de producto que son los teléfonos móviles, que tienen un tamaño de pantalla, una cantidad de RAM y una cantidad de memoria de almacenamiento secundario.
- Otro tipo de productos son los Accesorios. De estos, tenemos a su vez, otros tipos como son las carcasas y los cargadores. Los accesorios tienen dentro un array de teléfonos móviles, que indican aquellos con los que son compatibles.

Implementa todas estas clases y un main de prueba.


La solución del ejercicio está disponibles en: [[Soluciones boletín 3#Soluciones ejercicio 3]]

## Ejercicio 4

Modifica el ejercicio anterior para añadir un método que imprima la información de un `Producto`. Puede usar _pattern matching_ para identificar el tipo de producto concreto.

La solución del ejercicio está disponibles en: [[Soluciones boletín 3#Soluciones ejercicio 4]]

## Ejercicio 5
Mejora el ejercicio 4 para unificar el código que muestra los teléfonos compatibles de un `Accesorio`. PISTA: Puedes usar un bloque if/else con `instanceof`, y en función de eso, establecer el valor de la cadena de caracteres que se muestra.

## Ejercicio 6
6. Implementa una aplicación para la gestión de los electrodomésticos de un bazar o tienda similar. Para ello, se necesitan las siguintes clases:

   - `Electrodomestico`: de ellos queremos saber el tipo (congelador, lavadora, ...), la marca y modelo, la potencia y el precio. Debe incluir un método que devuelva el consumo eléctrico en función del número de horas que haya funcionado (argumento del método como número decimal).
   - `Congelador`: es un tipo de Electrodomestico que añade como atributo `turbo`, que indica si está funcionando en este modo (booleano). Cuando un congelador está funcionando de este modo incrementa el consumo de forma que invierte un 25% más de potencia. Por tanto, hay que sobrescribir el método que calcula el consumo para incluir este comportamiento.
   - `Frigorífico`: es otro tipo de Electrodomestico que añade como atributo la temperatura a la cuál está funcionando. Es un número entero de 2 a 8 grados centígrados. El frigorífico consume un 3% más por cada grado adicional de diferencia sobre los 8º. Es decir, que a 8º consume su potencia, a 7º un 3% más, y así sucesivamente. Por tanto, también hay que sobrescribir el método que calcula el consumo para incluir este comportamiento.

   Implementa todas estas clases, incluyendo todos los elementos necesarios (constructores, getters/setters, equals, hashCode, toString, ...). Implementa también un main de ejemplo donde se creen varios electrodomésticos de diferentes tipos y se calcule el consumo de ellos para un número determinado de horas.

## Ejercicio 7
Modifica el ejercicio anterior para añadir un método que nos permita obtener el coste del consumo del electrodoméstico. Para simiplificar el cálculo, supondremos que todas las horas del día tienen el mismo coste. ¿En qué clase habría que implementar dicho método? ¿Es necesario sobrescribirlo en alguna otra clase?

## Ejercicio 8
Una biblioteca tiene un nombre y un array de libros. Se requiere que la biblioteca tenga un constructor que reciba como parámetros
el nombre de la biblioteca e inicialice la colección de libros. La biblioteca posee los siguientes métodos:

   - Añadir libro que permite agregar un libro a la colección de libros de la biblioteca.
   - Listar libros que muestra en pantalla los datos de todos los libros de la biblioteca invocando el método imprimir de los libros.

   Cada libro tiene los siguientes datos: título , autor (cadena de caracteres), año de publicación (número entero), editorial (cadena de caracteres), referencia bibliográfica (cadena de caracteres). El libro debe tener un constructor que inicialice sus atributos y un método imprimir que muestre los valores de sus atributos en pantalla. Se requiere implementar una clase Main de prueba que instancie una biblioteca denominada "Biblioteca Nacional" y añada a la biblioteca los siguientes libros de la siguiente tabla:

   | Título | Autor | Año | Editorial | Referencia |
   |--------|-------|-----|-----------|------------|
   | La piel del tambor | Arturo Pérez-Reverte | 1995 | Alfaguara | 9788420472065 |
   | El libro negro de las horas | Eva García Saenz de Urturi | 2022 | Planeta | 9788408269649 |
   | El código Da Vinci | Dan Brown | 2003 | Random House | 0385504209 |

## Ejercicio 9
En un chiringuito de playa se pueden alquilar sombrillas con capacidad para 2 personaso sombrillas especiales, más amplias, para 6 personas y servicio de camarero. En las especiales, también se pueden agregar hamacas extra abonando un coste adicional por unidad. El servicio de aparcamiento es opcional en ambos tipos de sombrillas.

    Se necesita implementar las siguientes clases:

    - `ReservaSombrilla`: que tendrá como atributos de clase (estáticos) las constantes `costeBase = 200` y `extras=100`; y como atributos de instancia el número (entero), los días (entero) y el servicio de aparcamiento (booleano). Como métodos, incluirá, además de los típicos (constructor, getters/setters, ...) el cálculo del coste de la reserva. Este se calcula como nº de días * coste base, salvo que se haya contratado el servicio de aparcamiento, que sería entonces `dias * (costeBase + extras)`.
    - `ReservaSombrillaEspecial`: que es una subclase de la anterior. Añade como atributo el número de hamacas que se reservan (como número entero). El coste se calcula como el 140% del coste de una sombrilla normal más 1/3 * extras por cada hamaca por día.
    - `ColeccionAlquiler`: incluirá un array de reservas, así como el número de reservas realizadas. Además de un constructor, que recibirá un entero con el tamaño con el que se quiere inicializar el array, se deben incluir los siguientes métodos:
    - `insertar`: añade la reserva de sombrilla que se pasa como argumento. Requiere controlar que hay hueco disponible para dicha reserva.
    - `eliminar`: recibe un número entero como argumento, y elimina la reserva que está en dicha posición del array. El array debe quedar compactado nuevamente.
    - `totalAlquiler`: no recibe ningún argumento, y devuelve el importe total de todas las reservas realizadas.

## Ejercicio 10
Una agencia rural de alquiler de vehículos dispone de alquiler de autobuses y tractores.

    La facturación del alquiler de los autobuses se realiza por kilómetros. Debido a esto, los datos de la clase son:
    - Precio por km.
    - Cantidad de km. que tiene el autobús cuando se recoge al alquilarlo.
    - Cantidad de km. que tiene el autobús cuando se devuelve al alquilarlo.

    En cambio, el alquiler de tractores se realiza por días. Los datos de la clase `Tractor` son:
    - Precio por día.
    - Nº de días alquilados.

    Cuando se alquile un vehículo, se debe obtener su matrícula, los datos correspondientes al tipo de vehículo, marcarlos como alquilado (asginando el valor de un atributo booleano a true) y mostrar sus datos en consola.

    Cuando se devuelve un vehículo, se elimina la marca de alquilado (valor booleano a false), se calcula el importe a pagar por el alquiler y se muestran los datos por consola.