## Soluciones ejercicio 1

`Muestra.java`
```java
public class Muestra {
	
	public static final int DEAFULT_SIZE = 10;
	private int[] numeros;
	private int cantidadNumeros;
	
	public Muestra() {
		numeros = new int[DEAFULT_SIZE];
		cantidadNumeros = 0;
	}
	
	public Muestra(int tam) {
		numeros = new int[tam];
		cantidadNumeros = 0;
	}
	
	public Muestra(int[] array) {
		numeros = array.clone();
		cantidadNumeros = numeros.length;
	}
	
	public void agregarNumero(int n) {
		numeros[cantidadNumeros] = n;
		cantidadNumeros++;
	}

	public int[] getNumeros() {
		return numeros;
	}

	public int getCantidadNumeros() {
		return cantidadNumeros;
	}

}

```

`Estadistica.java`
```java
public class Estadistica {
	
	public static double media(Muestra m) {
		double suma = 0;
		for(int i = 0; i < m.getCantidadNumeros(); i++) {
			suma += m.getNumeros()[i];
		}
		return suma / m.getCantidadNumeros();
	}
	
	public static int moda(Muestra m) {
		int moda = 0;
        int maxFrecuencia = 0;
        int n = m.getCantidadNumeros();
        int[] numeros = m.getNumeros();
        
        for (int i = 0; i < n; i++) {
        	// Comparamos cada número del array con los demás
            int frecuencia = 0;
            for (int j = 0; j < n; j++) {
                if (numeros[j] == numeros[i]) {
                    frecuencia++;
                }
            }
            if (frecuencia > maxFrecuencia) {
                maxFrecuencia = frecuencia;
                moda = numeros[i];
            }
        }
        return moda;
	}

}

```

`Ejercicio01.java`
```java
public class Ejercicio01 {

	public static void main(String[] args) {
		Muestra m1 = new Muestra(new int[] { 1, 2, 2, 3, 4, 5, 6, 7, 8, 9 });

		double media = Estadistica.media(m1);
		System.out.println("La media es " + media);

		int moda = Estadistica.moda(m1);
		System.out.println("La moda es " + moda);

	}

}
```

## Soluciones ejercicio 2


`Muestra.java`
```java
public class Muestra {
	
	public static final int DEFAULT_SIZE = 10;
	private int[] numeros;
	private int cantidadNumeros;
	
	public Muestra() {
		numeros = new int[DEFAULT_SIZE];
		cantidadNumeros = 0;
	}
	
	public Muestra(int tam) {
		numeros = new int[tam];
		cantidadNumeros = 0;
	}
	
	public Muestra(int[] array) {
		numeros = array.clone();
		cantidadNumeros = numeros.length;
	}
	
	public void agregarNumero(int n) {
		if (cantidadNumeros == numeros.length) {
			agrandaArray();
		}
		numeros[cantidadNumeros] = n;
		cantidadNumeros++;
	}

	public int[] getNumeros() {
		return numeros;
	}

	public int getCantidadNumeros() {
		return cantidadNumeros;
	}
	
	private void agrandaArray() {
		int[] copiaNumeros = numeros.clone();
		numeros = Arrays.copyOf(copiaNumeros, copiaNumeros.length+DEFAULT_SIZE);
	}	

}

```

`Estadistica.java`
```java
public class Estadistica {
	
	public static double media(Muestra m) {
		return media(m.getNumeros(), m.getCantidadNumeros());
	}
	
	public static double media(int[] array) {
		return media(array, array.length);
	}
	
	private static double media(int[] array, int cantidad) {
		double suma = 0;
		for(int i = 0; i < cantidad; i++) {
			suma += array[i];
		}
		
		return suma / cantidad;
	}
	
	public static int moda(Muestra m) {
		int moda = 0;
        int maxFrecuencia = 0;
        int n = m.getCantidadNumeros();
        int[] numeros = m.getNumeros();
        
        for (int i = 0; i < n; i++) {
        	// Comparamos cada número del array con los demás
            int frecuencia = 0;
            for (int j = 0; j < n; j++) {
                if (numeros[j] == numeros[i]) {
                    frecuencia++;
                }
            }
            if (frecuencia > maxFrecuencia) {
                maxFrecuencia = frecuencia;
                moda = numeros[i];
            }
        }
        return moda;
	}

}

```

`Ejercicio02.java`
```java
public class Ejercicio02 {

	public static void main(String[] args) {
		Muestra m1 = new Muestra(new int[] { 1, 2, 2, 3, 4, 5, 6, 7, 8, 9 });
		m1.agregarNumero(123);
		double media = Estadistica.media(m1);
		System.out.println("La media es " + media);

		int moda = Estadistica.moda(m1);
		System.out.println("La moda es " + moda);
		
		var array = new int[] {1,22,333,4444,55555};
		double mediaArray = Estadistica.media(array);
		System.out.println("La media del array es " + mediaArray);
	
	}

}

```


## Soluciones ejercicio 3

```java
public class Cartera {
    private double saldo;

    public Cartera() {
        this.saldo = 0.0;
    }

    public Cartera(double saldoInicial) {
        this.saldo = saldoInicial;
    }

    public void sacarDinero(double cantidad) {
        if (saldo == 0) {
            System.out.println("NO TIENES SALDO DISPONIBLE.");
        } else if (cantidad <= saldo) {
            saldo -= cantidad;
        } else {
            System.out.println("TU SALDO SE HA QUEDADO A 0.");
            saldo = 0;
        }
    }

    public double consultarSaldo() {
        return saldo;
    }

    public void meterDinero(double cantidad) {
        saldo += cantidad;
    }
}
```

`Ejercicio03.java`
```java
public class Ejercicio03 {
    public static void main(String[] args) {
        Cartera miCartera = new Cartera(50.0);
        System.out.println("Mi saldo actual es: " + miCartera.consultarSaldo());
        miCartera.sacarDinero(20.0);
        System.out.println("Mi saldo actual es: " + miCartera.consultarSaldo());
        miCartera.meterDinero(10.0);
        System.out.println("Mi saldo actual es: " + miCartera.consultarSaldo());
        miCartera.sacarDinero(100.0);
        System.out.println("Mi saldo actual es: " + miCartera.consultarSaldo());
    }
}
```


## Soluciones ejercicio 4


`Password.java`
```java
import java.util.Random;

public class Password {
	
	private String password;
	
	public Password() {
		this.password = "";
	}
	
	public Password(String password) {
		this.password = password;
	}
	
	public int longitud() {
		return this.password.length();
	}
	
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	public boolean isStrong() {
		boolean tieneMayusculas = false;
		boolean tieneMinusculas = false;
		boolean tieneDigitos = false;
		boolean tieneCaracterRaro = false;
		boolean tieneLongitud = false;
				
		// Comprobamos si cumple la lontigud marcada
		
		if (password.length() >= 8 && password.length() <= 20)
			tieneLongitud = true;
		
		// Verificamos la contraseña caracter a caracter
		
		for(int i = 0; i < password.length(); i++) {
			char c = password.charAt(i);
			
			if (Character.isUpperCase(c))
				tieneMayusculas = true;
			
			if (Character.isLowerCase(c))
				tieneMinusculas = true;
			
			if (Character.isDigit(c))
				tieneDigitos = true;
			
			if (c == '$' || c == '%' || c == '_' || c == '*')
				tieneCaracterRaro = true;
			
		}
			
		
		return (tieneMayusculas && tieneMinusculas 
				&& tieneDigitos && tieneCaracterRaro
				&& tieneLongitud); 
	}

	public static Password generatePassword(int longitud) {
		
		// Posibles caracteres a usar
		char[] caracteres = {'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
                'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
                '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '$', ';', '.', '_', '-','*', '%'};		
		
		String resultado = "";
		// Para generar números aleatorios, podemos usar la clase Random.
		for(int i = 0; i < longitud; i++) {
			int aleatorio = new Random().nextInt(caracteres.length);
			resultado += caracteres[aleatorio];
		}
		
		return new Password(resultado);
		
	}

}
```

`Ejercicio04.java`
```java
public class Ejercicio04 {
	
	public static void main(String[] args) {
		Password nueva = Password.generatePassword(15);
		
		System.out.println(nueva.getPassword());
		
		System.out.println("¿La contraseña es fuerte? " + (nueva.isStrong() ? "SÍ": "NO"));
		
	}

}

```
