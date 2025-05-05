## Soluciones ejercicio 1
  
`Alumno.java`
```java
package orientacionobjetos;

import java.util.Objects;

public class Alumno {
	
	private String nombre;
	private String apellidos;
	private String email;
	private int edad;
	private String telefono;
	
	public Alumno() { }

	public Alumno(String nombre, String apellidos, String email, int edad, String telefono) {
		super();
		this.nombre = nombre;
		this.apellidos = apellidos;
		this.email = email;
		this.edad = edad;
		this.telefono = telefono;
	}

	public Alumno(String nombre, String apellidos, int edad) {
		this.nombre = nombre;
		this.apellidos = apellidos;
		this.edad = edad;
	}
	
	// También así
	/*public Alumno(String nombre, String apellidos, int edad) {
		this(nombre, apellidos, null, edad, null);
	}*/

	public String getNombre() {
		return nombre;
	}

	public String getApellidos() {
		return apellidos;
	}

	public String getEmail() {
		return email;
	}

	public int getEdad() {
		return edad;
	}

	public String getTelefono() {
		return telefono;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public void setApellidos(String apellidos) {
		this.apellidos = apellidos;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setEdad(int edad) {
		this.edad = edad;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}
	
	public boolean esMayorEdad() {
		return (edad >= 18);
	}

	@Override
	public int hashCode() {
		return Objects.hash(apellidos, edad, email, nombre, telefono);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Alumno other = (Alumno) obj;
		return Objects.equals(apellidos, other.apellidos) && edad == other.edad && Objects.equals(email, other.email)
				&& Objects.equals(nombre, other.nombre) && Objects.equals(telefono, other.telefono);
	}

	@Override
	public String toString() {
		return "Alumno [nombre=" + nombre + ", apellidos=" + apellidos + ", email=" + email + ", edad=" + edad
				+ ", telefono=" + telefono + "]";
	}
}
```

`App.java`
```java
package orientacionobjetos;

public class App {

	public static void main(String[] args) {
		
		Alumno a1 = new Alumno();
		a1.setNombre("Jose");
		a1.setApellidos("García López");
		a1.setEdad(14);
		a1.setEmail("jose.garcia@centroeducativo.com");
		
		System.out.println(a1);
		
		Alumno a2 = new Alumno("María", "Fernández Martín", 17);
		a2.setEmail("maria.fernandez@centroeducativo.com");
		a2.setTelefono("600123456");
		
		System.out.println(a2);
		
		System.out.println("La alumna %s %s %s mayor de edad"
				.formatted(
						a2.getNombre(), 
						a2.getApellidos(), 
						a2.esMayorEdad() ? "sí" : "no" ));

		if (a1.equals(a2))
			System.out.println("Son el mismo objeto");
		else
			System.out.println("No son el mismo objeto");
	}
}

```

## Soluciones ejercicio 2

  
```java
package orientacionobjetos;

public class App {

	public static void main(String[] args) {
		
		var alumnos = new Alumno[5];
		
		alumnos[0] = new Alumno("José", "García López", 14);
		alumnos[1] = new Alumno("María", "Fernández Martín", 17);
		alumnos[2] = new Alumno("Raúl", "Miraflores Redondo", 11);
		alumnos[3] = new Alumno("Lucía", "Muñoz Seco", 16);
		alumnos[4] = new Alumno("Antonio", "De la Cruz Serón", 19);
		
		// Por defecto, el alumno más joven será el primero de todos.
		int posicionMasJoven = 0;
		for(int i = 1; i < alumnos.length; i++) {
			// Versión más larga.
			
			//Alumno a1 = alumnos[posicionMasJoven];
			//Alumno a2 = alumnos[i];
			//if (a1.getEdad() > a2.getEdad())
			//	posicionMasJoven = i;
			
			// Versión reducida, aunque el efecto es el mismo.
			if (alumnos[posicionMasJoven].getEdad() > alumnos[i].getEdad()) 
				posicionMasJoven = i;
		}
		
		Alumno joven = alumnos[posicionMasJoven];
		System.out.println("El alumno más joven es %s %s con %d años"
				.formatted(joven.getNombre(), joven.getApellidos(), joven.getEdad()));
		
	}
}
```
## Soluciones ejercicio 3

  
`Producto.java`
```java
package orientacionobjetos;

import java.util.Objects;

public class Producto {
	
	private long codigo;
	private String nombre;
	private String descripcion;
	private double precio;
	
	
	public Producto() { }
	
	public Producto(long codigo, String nombre, String descripcion, double precio) {
		this.codigo = codigo;
		this.nombre = nombre;
		this.descripcion = descripcion;
		this.precio = precio;
	}

	public long getCodigo() {
		return codigo;
	}

	public void setCodigo(long codigo) {
		this.codigo = codigo;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public double getPrecio() {
		return precio;
	}

	public void setPrecio(double precio) {
		this.precio = precio;
	}
	
	public String precioLiteral() {
		String resultado;
		
		if (precio > 0 && precio < 1.0)
			resultado = "GANGA";
		else if (precio >= 1.0 && precio < 10)
			resultado = "NORMAL";
		else
			resultado = "LUJO";
		
		return resultado;
		
		
	}

	@Override
	public int hashCode() {
		return Objects.hash(codigo, descripcion, nombre, precio);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Producto other = (Producto) obj;
		return codigo == other.codigo && Objects.equals(descripcion, other.descripcion)
				&& Objects.equals(nombre, other.nombre)
				&& Double.doubleToLongBits(precio) == Double.doubleToLongBits(other.precio);
	}

	@Override
	public String toString() {
		return "Producto [codigo=" + codigo + ", nombre=" + nombre + ", descripcion=" + descripcion + ", precio="
				+ precio + "]";
	}	

}

```

`App.java`
```java
package orientacionobjetos;

public class App {

	public static void main(String[] args) {

		Producto p1 = new Producto(1234l, "Ordenador portátil", "Magnífico ordenador portátil para programar", 599.99);
		Producto p2 = new Producto(2345l, "Monitor 24", "Estupendo monitor para programar", 199.99);
		
		System.out.println(p1.precioLiteral());
		System.out.println(p2.precioLiteral());
		
		
	}

}

```

## Soluciones ejercicio 4

`Personaje.java`
```java
package orientacionobjetos;

import java.util.Arrays;
import java.util.Objects;

public class Personaje {
	
	private String nombre;
	private int puntosVida;
	private long puntos;
	private String[] mochila;
	private int elementosEnMochila;
	
	public Personaje() {
		this.puntos = 0;
		this.puntosVida = 100;
		this.mochila = new String[10];
		this.elementosEnMochila = 0;
	}
	
	public Personaje(String nombre) {
		this();
		this.nombre = nombre;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public int getPuntosVida() {
		return puntosVida;
	}

	public void setPuntosVida(int puntosVida) {
		this.puntosVida = puntosVida;
	}

	public long getPuntos() {
		return puntos;
	}

	public void setPuntos(long puntos) {
		this.puntos = puntos;
	}

	public String[] getMochila() {
		return mochila;
	}
	
	public int getElementosEnMochila() {
		return elementosEnMochila;
	}
	
	public int addElementoToMochila(String elemento) {
		if (elementosEnMochila == 10)
			System.out.println("YA NO PUEDES CONSEGUIR MÁS ELEMENTOS PUES TU MOCHILA ESTÁ COMPLETA");
		else 
			mochila[elementosEnMochila] = elemento;
		
		return ++elementosEnMochila;
		
	}
	
	public int recibirGolpe(int puntosGolpe) {
		this.puntosVida -= puntosGolpe;
		if (this.puntosVida < 0)
			this.puntosVida = 0;
		
		return this.puntosVida;
	}
	
	// Falta reasignar el array y decrementar elementosEnMochila
	
	public int usarBotiquin() {
		boolean tieneBotiquin = false;
		if (elementosEnMochila > 0) {
			
			for(int i = 0; i < elementosEnMochila && !tieneBotiquin; i++) {
				if (mochila[i] == "BOTIQUIN") {
					tieneBotiquin = true;
					this.puntosVida += 10;
					if (this.puntosVida > 100)
						this.puntosVida = 100;
					
					// Reasignar resto de elementos del array
					mochila[i] = null;
					for(int x = i+1; x < elementosEnMochila; x++) {
						mochila[x-1] = mochila[x];
					}
					elementosEnMochila--;
					mochila[elementosEnMochila] = null;
					
				}
			}
		}
		
		if (tieneBotiquin == false)
			System.out.println("LO SIENTO, PERO NO TIENES NINGUNA POCIÓN DE BOTIQUÍN");
		
		return this.puntosVida;
	}
	

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + Arrays.hashCode(mochila);
		result = prime * result + Objects.hash(elementosEnMochila, nombre, puntos, puntosVida);
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Personaje other = (Personaje) obj;
		return elementosEnMochila == other.elementosEnMochila && Arrays.equals(mochila, other.mochila)
				&& Objects.equals(nombre, other.nombre) && puntos == other.puntos && puntosVida == other.puntosVida;
	}

	@Override
	public String toString() {
		return "Personaje [nombre=" + nombre + ", puntosVida=" + puntosVida + ", puntos=" + puntos + ", mochila="
				+ Arrays.toString(mochila) + ", elementosEnMochila=" + elementosEnMochila + "]";
	}
}

```

`App.java`
```java
package orientacionobjetos;

public class App {

	public static void main(String[] args) {
		
		Personaje p1 = new Personaje("Harry Potter");
		
		p1.recibirGolpe(15);
		
		System.out.println(p1);

		p1.usarBotiquin();

		p1.addElementoToMochila("VARITA");
		p1.addElementoToMochila("BOTIQUIN");
		p1.addElementoToMochila("EXPECTO PATRONUM");

		p1.usarBotiquin();
		System.out.println(p1);

	}

}

```