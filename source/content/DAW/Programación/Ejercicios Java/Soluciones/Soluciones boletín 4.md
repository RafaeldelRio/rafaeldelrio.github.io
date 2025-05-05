## Soluciones ejercicio 1

`Validable.java`
```java
package interfaces;


public sealed interface Validable permits Documento, Imagen, Video {
	boolean isValid();
}

```

`Documento.java`
```java
package interfaces;

public abstract non-sealed class Documento implements Validable {

	protected long size;
	

	public Documento(long size) {
		this.size = size;
	}

	public long getSize() {
		return size;
	}

	public void setSize(long size) {
		this.size = size;
	}

}

```

`Imagen.java`
```java
package interfaces;

public abstract non-sealed class Imagen implements Validable {
	
	protected long width;
	protected long height;

	public long getWidth() {
		return width;
	}

	public long getHeight() {
		return height;
	}

	public void setWidth(long width) {
		this.width = width;
	}

	public void setHeight(long height) {
		this.height = height;
	}

	public Imagen(long width, long height) {
		this.width = width;
		this.height = height;
	}

}

```

`Video.java`
```java
package interfaces;

public abstract non-sealed class Video implements Validable {
	
	protected int length;

	public Video(int length) {
		this.length = length;
	}

	public int getLength() {
		return length;
	}

	public void setLength(int length) {
		this.length = length;
	}

}

```

`DocumentoPDF.java`
```java
package interfaces;

public class DocumentoPDF extends Documento {

	public DocumentoPDF(long size) {
		super(size);
	}

	@Override
	public boolean isValid() {
		return size >= 0 && size <= 1024*1024;
	}

}

```

`ImagenJPG.java`
```java
package interfaces;

public class ImagenJPG extends Imagen {

	public ImagenJPG(long width, long height) {
		super(width, height);
		
	}

	// Imagen <= 5 Megapixels
	// 2,560×1,920 con aspect ratio 16:9
	
	@Override
	public boolean isValid() {
		return width*height <= 5_000_000;
	}

}

```

`VideoMp4.java`
```java
package interfaces;

public class VideoMp4 extends Video {

	public VideoMp4(int length) {
		super(length);
	}

	@Override
	public boolean isValid() {
		return length > 0 && length < 5*60;
	}
	

}

```

`ServicioValidacion.java`
```java
package interfaces;

public class ServicioValidacion {
	
	private Validable[] validables;
	private int cantidadValidables;
	
	public ServicioValidacion() {
		validables = new Validable[10];
		cantidadValidables = 0;
	}
	
	public ServicioValidacion(int length) {
		validables = new Validable[length];
		cantidadValidables = 0;
	}
	
	public ServicioValidacion(Validable[] array) {
		validables = array.clone();
		cantidadValidables = array.length;
	}

	public boolean validarTodos() {
		boolean resultado = true;
		for(int i = 0; i < cantidadValidables; i++) {
			resultado = resultado && validables[i].isValid();
		}
		return resultado;
	}
	
	public static boolean validar(Validable v) {
		return v.isValid();
	}
}

```

`App.java`
```java
package interfaces;

public class App {

	public static void main(String[] args) {

		Documento d1 = new DocumentoPDF(12345l);
		Documento d2 = new DocumentoPDF(12345678912343l);
		
		Imagen im = new ImagenJPG(2500, 1900);
		
		Video v = new VideoMp4(123);
		
		Validable[] arr = {d1, d2, im, v};
		
		ServicioValidacion servicioValidacion =
				new ServicioValidacion(arr);
		
		if (servicioValidacion.validarTodos())
			System.out.println("Todos los ficheros son válidos");
		else
			System.out.println("Hay algún fichero que no es válido");
		
	}

}

```


## Soluciones ejercicio 2


`Vendible.java`
```java
public interface Vendible {
	 double getPrecio();
}
```

`Producto.java`
```java

public class Producto implements Vendible {
	 private String nombre;
	 private String categoria;
	 private double precio;

	 public Producto(String nombre, String categoria, double precio) {
	     this.nombre = nombre;
	     this.categoria = categoria;
	     this.precio = precio;
	 }

	 @Override
	 public double getPrecio() {
	     return precio;
	 }

	public String getNombre() {
		return nombre;
	}

	public String getCategoria() {
		return categoria;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public void setCategoria(String categoria) {
		this.categoria = categoria;
	}

	public void setPrecio(double precio) {
		this.precio = precio;
	}
	 
	 
}

```

`Servicio.java`
```java

public class Servicio implements Vendible {
	private String nombre;
	private String tipo;
	private int duracionMinutos;

	public Servicio(String nombre, String tipo, int duracionMinutos) {
		this.nombre = nombre;
		this.tipo = tipo;
		this.duracionMinutos = duracionMinutos;
	}

	@Override
	public double getPrecio() {
		double precioMinuto = switch (tipo) {
		case "PINTURA" -> 0.75;
		case "ELECTRICIDAD" -> 1.0;
		case "FONTANERÍA" -> 1.25;
		default -> 1.5;
		};
		return precioMinuto * duracionMinutos;
	}

	public String getNombre() {
		return nombre;
	}

	public String getTipo() {
		return tipo;
	}

	public int getDuracionMinutos() {
		return duracionMinutos;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	public void setDuracionMinutos(int duracionMinutos) {
		this.duracionMinutos = duracionMinutos;
	}
	
	

}

```

`Factura.java`
```java
package interfaces;

public class Factura {
	private String cliente;
	private Vendible[] elementos;

	public Factura(String cliente, Vendible[] elementos) {
		this.cliente = cliente;
		this.elementos = elementos;
	}

	public double calcularTotal() {
		double total = 0.0;
		for (Vendible vendible : elementos) {
			total += vendible.getPrecio();
		}
		return total;
	}

	public String getCliente() {
		return cliente;
	}

	public Vendible[] getElementos() {
		return elementos;
	}

	public void setCliente(String cliente) {
		this.cliente = cliente;
	}

	public void setElementos(Vendible[] elementos) {
		this.elementos = elementos;
	}

}

```

`App.java`
```java
package interfaces;

public class App {
	 public static void main(String[] args) {
	     Producto producto1 = new Producto("Tornillo", "Ferretería", 0.5);
	     Producto producto2 = new Producto("Martillo", "Herramienta", 10.0);
	     Servicio servicio1 = new Servicio("Pintura de paredes", "PINTURA", 120);
	     Servicio servicio2 = new Servicio("Reparación eléctrica", "ELECTRICIDAD", 60);

	     Vendible[] elementos = {producto1, producto2, servicio1, servicio2};

	     Factura factura = new Factura("Cliente Ejemplo", elementos);

	     double total = factura.calcularTotal();
	     System.out.println("Total de la factura: " + total + "€");
	 }

	
}


```



## Soluciones ejercicio 3


`Fichero.java`
```java
public interface Fichero {
	
	String getNombre();
	
	String getFormato();

}

```


`FicheroAbstracto.java`
```java
public abstract class FicheroAbstracto implements Fichero {

	protected String nombre;
	protected String formato;
	
	
	public FicheroAbstracto(String nombre, String formato) {
		this.nombre = nombre;
		this.formato = formato;
	}

	@Override
	public String getNombre() {
		return nombre;
	}

	@Override
	public String getFormato() {
		return formato;
	}

}

```


`Reproducible.java`
```java
public interface Reproducible extends Fichero {
	
	void reproducir();
	
	int getDuracion();
	

}

```


`FicheroPDF.java`
```java
public class FicheroPDF extends FicheroAbstracto {

	public FicheroPDF(String nombre) {
		super(nombre, "PDF");
	}

}
```


`ImagenJPG.java`
```java
public class ImagenJPG extends FicheroAbstracto implements Reproducible {

	public ImagenJPG(String nombre) {
		super(nombre, "JPG");
	}

	@Override
	public void reproducir() {
		System.out.println("Mostrando la imagen JPG durante 7 segundos");
	}

	@Override
	public int getDuracion() {
		return 7;
	}

}
```


`AudioMp3.java`
```java
public class AudioMp3 extends FicheroAbstracto implements Reproducible {

	private int duracion;
	
	public AudioMp3(String nombre, int duracion) {
		super(nombre, "MP3");
		this.duracion = duracion;
	}

	@Override
	public void reproducir() {
		System.out.println("Reproduciendo todo el contenido del fichero");
		
	}

	@Override
	public int getDuracion() {
		return duracion;
	}

}

```


`VideoH264.java`
```java
public class VideoH264 extends FicheroAbstracto implements Reproducible {

	private int duracion;
	
	public VideoH264(String nombre, int duracion) {
		super(nombre, "H.264");
	}

	@Override
	public void reproducir() {
		System.out.println("Reproduciendo todo el contenido del vídeo");
		
	}

	@Override
	public int getDuracion() {
		return duracion;
	}
	
	

}
```


`Reproductor.java`
```java
public interface Reproductor {
	
	void cargar(Reproducible r);
	
	void reproducir();
	
	default void reproducir(Reproducible r) {
		r.reproducir();
	}
	
	void parar();
	
	

}
```


`ReproductorMultimedia.java`
```java
public class ReproductorMultimedia implements Reproductor{
	
	private Reproducible actual;
	private Reproducible[] lista;
	private int cantidadReproducibles;
	
	
	public ReproductorMultimedia() {
		cantidadReproducibles = 0;
	}
	
	public ReproductorMultimedia(Reproducible[] lista) {
		this.lista = lista;
		cantidadReproducibles = lista.length;
		actual = lista[0];
	}
	

	@Override
	public void cargar(Reproducible r) {
		actual = r;
		
	}

	@Override
	public void reproducir() {
		this.reproducir(actual);
		
	}

	@Override
	public void parar() {
		actual = null;	
	}

}

```


`App.java`
```java

public class App {

	public static void main(String[] args) {
		
		
		VideoH264 v = new VideoH264("Avengers Endgame", 182*60);
		AudioMp3 a = new AudioMp3("19 Días y 500 noches - Joaquín Sabina", 277);
		ImagenJPG i = new ImagenJPG("foto vacaciones");
		FicheroPDF f = new FicheroPDF("Nomina");
		
		Reproductor r = new ReproductorMultimedia();
		
		r.cargar(v);
		r.reproducir();
		
		r.cargar(a);
		r.reproducir();
		
		r.cargar(i);
		r.reproducir();
		
		//r.cargar(f); // Error

	}

}

```


## Soluciones ejercicio 4


`Valorable.java`
```java
public interface Valorable {
	
	double getPuntuacionMedia();

}
```

`Valoracion.java`
```java
public class Valoracion {
	
	private Usuario usuario;
	private Valorable valorable;
	private int puntuacion;
	
	
	public Valoracion(Usuario usuario, Valorable valorable, int puntuacion) {
		this.usuario = usuario;
		this.valorable = valorable;
		this.puntuacion = puntuacion;
	}


	public Usuario getUsuario() {
		return usuario;
	}


	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}


	public Valorable getValorable() {
		return valorable;
	}


	public void setValorable(Valorable valorable) {
		this.valorable = valorable;
	}


	public int getPuntuacion() {
		return puntuacion;
	}


	public void setPuntuacion(int puntuacion) {
		this.puntuacion = puntuacion;
	}	

}

```


`Usuario.java`
```java
public class Usuario {
	
	private String username;
	private String email;
	private Valoracion[] valoraciones;
	private int cantidadValoraciones;
	
	
	public Usuario(String username) {
		this.username = username;
		cantidadValoraciones = 0;
		valoraciones = new Valoracion[10];
	}
	
	public Usuario(String username, String email) {
		this(username);
		this.email = email;
	}
	
	public void agregarValoracion(Valoracion valoracion) {
        if (cantidadValoraciones < valoraciones.length) {
            valoraciones[cantidadValoraciones] = valoracion;
            cantidadValoraciones++;
        } else {
            System.out.println("No se pueden agregar más valoraciones");
        }
    }

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Valoracion[] getValoraciones() {
		return valoraciones.clone();
	}

	public int getCantidadValoraciones() {
		return cantidadValoraciones;
	}	

}

```


`ValorableAbstracto.java`
```java
public class ValorableAbstracto implements Valorable {
	
	private Valoracion[] valoraciones;
	private int cantidadValoraciones;
	
	public ValorableAbstracto() {
		valoraciones = new Valoracion[10];
		cantidadValoraciones = 0;
	}
	
	public void agregarValoracion(Valoracion valoracion) {
        if (cantidadValoraciones < valoraciones.length) {
            valoraciones[cantidadValoraciones] = valoracion;
            cantidadValoraciones++;
        } else {
            System.out.println("No se pueden agregar más valoraciones");
        }
    }
	

	@Override
	public double getPuntuacionMedia() {
		double puntuacion = 0.0;
		for(int i = 0; i < cantidadValoraciones; i++)
			puntuacion += valoraciones[i].getPuntuacion();
		
		return puntuacion/cantidadValoraciones;
	}

}

```


`ServicioValoracion.java`
```java
public class ServicioValoracion {
	
	public static void valorar(Usuario usuario, Valorable valorable, int puntuacion) {
        Valoracion valoracion = new Valoracion(usuario, valorable, puntuacion);
        usuario.agregarValoracion(valoracion);
        
        if (valorable instanceof ValorableAbstracto valorableAbstracto) {
            valorableAbstracto.agregarValoracion(valoracion);
        }
    }

}

```


`Producto.java`
```java
public class Producto extends ValorableAbstracto {
	
	private String nombre, categoria;
	private double precio;
	
	
	public Producto(String nombre, String categoria, double precio) {
		super();
		this.nombre = nombre;
		this.categoria = categoria;
		this.precio = precio;
	}


	public String getNombre() {
		return nombre;
	}


	public void setNombre(String nombre) {
		this.nombre = nombre;
	}


	public String getCategoria() {
		return categoria;
	}


	public void setCategoria(String categoria) {
		this.categoria = categoria;
	}


	public double getPrecio() {
		return precio;
	}


	public void setPrecio(double precio) {
		this.precio = precio;
	}
}

```


`Negocio.java`
```java
public class Negocio extends ValorableAbstracto {
	
	private String nombre, ciudad;

	public Negocio(String nombre, String ciudad) {
		super();
		this.nombre = nombre;
		this.ciudad = ciudad;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}


	public String getCiudad() {
		return ciudad;
	}

	public void setCiudad(String ciudad) {
		this.ciudad = ciudad;
	}

}

```


`Ciudad.java`
```java
public class Ciudad extends ValorableAbstracto {
	
	private String nombre, pais;

	public Ciudad(String nombre, String pais) {
		super();
		this.nombre = nombre;
		this.pais = pais;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getPais() {
		return pais;
	}

	public void setPais(String pais) {
		this.pais = pais;
	}
	
	

}

```


`App.java`
```java
public class App {

	public static void main(String[] args) {
        // Crear usuarios
        Usuario usuario1 = new Usuario("Usuario1");
        Usuario usuario2 = new Usuario("Usuario2");

        // Crear productos
        Producto producto1 = new Producto("Producto1", "Categoría1", 10.99);
        Producto producto2 = new Producto("Producto2", "Categoría2", 19.99);

        // Crear negocios
        Negocio negocio1 = new Negocio("Mi tienda", "Sevilla");
        Negocio negocio2 = new Negocio("El Gran Bazar", "Madrid");
       
        // Crear una ciudad
        Ciudad ciudad1 = new Ciudad("Sevilla", "España");
        
        // Valorar productos, negocios o ciudades
        ServicioValoracion.valorar(usuario1, producto1, 4);
        ServicioValoracion.valorar(usuario2, producto2, 3);

        ServicioValoracion.valorar(usuario1, negocio1, 3);
        ServicioValoracion.valorar(usuario2, negocio2, 4);
        
        ServicioValoracion.valorar(usuario1, ciudad1, 5);
        ServicioValoracion.valorar(usuario2, ciudad1, 4);
        
        
        // Imprimir la puntuación media de los productos, negocios y ciudades
        System.out.println("Puntuación media de " + producto1.getNombre() + ": " + producto1.getPuntuacionMedia());
        System.out.println("Puntuación media de " + producto2.getNombre() + ": " + producto2.getPuntuacionMedia());
        System.out.println("Puntuación media de " + negocio1.getNombre() + ": " + negocio1.getPuntuacionMedia());
        System.out.println("Puntuación media de " + negocio2.getNombre() + ": " + negocio2.getPuntuacionMedia());
        System.out.println("Puntuación media de " + ciudad1.getNombre() + ": " + ciudad1.getPuntuacionMedia());
    }

}

```
