Para este apartado me baso en el github https://github.com/cylance/IntroductionToMachineLearningForSecurityPros, el cual contiene un libro (libre) muy bueno para aprender "Introduction to Artificial Intelligence for Security Professionals". En este caso lo he adaptado para profesionales con conocimientos limitados de programación.

---

## Conceptos a Impartir (De Básico a Avanzado)

El objetivo es llevar al alumnado desde cero (o casi cero) en programación hasta comprender y poder ejecutar (y eventualmente modificar) los ejemplos del libro.

### Módulo 1: Fundamentos de Programación con Python (Esencial)

* **Objetivo:** Dotar al alumnado de las herramientas básicas de programación necesarias para entender y escribir scripts simples.
* **Conceptos:**
    * Introducción a Python: ¿Qué es? ¿Por qué Python para IA/Seguridad?
    * Entorno de desarrollo: Instalación de Python, uso de un IDE (como VS Code con extensión Python) o Entornos Interactivos (Jupyter Notebooks / Google Colab ). Gestión básica de paquetes con `pip`. Entornos virtuales (`venv`).
    * Sintaxis básica: Variables, tipos de datos (números, strings, booleanos, listas, tuplas, diccionarios, sets).
    * Operadores: Aritméticos, de comparación, lógicos.
    * Estructuras de control: Condicionales (`if`, `elif`, `else`), bucles (`for`, `while`).
    * Funciones: Definición, argumentos, retorno de valores. Ámbito (scope) de variables.
    * Manejo de errores básicos: Bloques `try...except`.
    * Entrada/Salida básica: Leer y escribir en archivos de texto (`.txt`, `.csv`).
* **Ejercicios:** Para practicar estos conceptos, se debe emplear el archivo `ejercicios_modulo1.ipynb`.
	* Enlace: [ejercicios1.ipynb](https://raw.githubusercontent.com/RafaeldelRio/rafaeldelrio.github.io/refs/heads/main/source/content/Python%20%26%20Machine%20learning/ejercicios/ejercicios_modulo1.ipynb)


### Módulo 2: Manipulación de Datos con Python

* **Objetivo:** Aprender a cargar, explorar, limpiar y preparar datos, una tarea fundamental en cualquier proyecto de ML.
* **Conceptos:**
    * Introducción a **NumPy**: Arrays multidimensionales, operaciones vectorizadas eficientes, indexación y slicing.
    * Introducción a **Pandas**:
        * Series y DataFrames: Las estructuras de datos clave.
        * Lectura y escritura de datos (CSV, JSON, etc.).
        * Selección e indexación de datos (`loc`, `iloc`).
        * Limpieza de datos básicos: Manejo de valores nulos (`NaN`), eliminación de duplicados.
        * Agregación y agrupación de datos (`groupby`).
        * Visualización básica de datos con Pandas (integrado con Matplotlib).
    * Introducción a **Matplotlib/Seaborn**: Creación de gráficos básicos (histogramas, scatter plots, box plots) para explorar los datos.
* **Ejercicios:** Para practicar estos conceptos, se debe emplear el archivo `ejercicios_modulo2.ipynb`.
	* Enlace: [ejercicios2.ipynb](https://raw.githubusercontent.com/RafaeldelRio/rafaeldelrio.github.io/refs/heads/main/source/content/Python%20%26%20Machine%20learning/ejercicios/ejercicios_modulo2.ipynb)
	* Para practicar más con Numpy: [Extra_ejercicio_1_Numpy.ipynb](https://raw.githubusercontent.com/RafaeldelRio/rafaeldelrio.github.io/refs/heads/main/source/content/Python%20%26%20Machine%20learning/ejercicios/Extra_ejercicio_1_Numpy.ipynb)
	* Para practicar más con Pandas: [Extra_ejercicio_2_pandas.ipynb](https://raw.githubusercontent.com/RafaeldelRio/rafaeldelrio.github.io/refs/heads/main/source/content/Python%20%26%20Machine%20learning/ejercicios/Extra_ejercicio_2_pandas.ipynb)
	* Para practicar más con visualización: [Extra_ejercicio_3_visualizacion.ipynb](https://raw.githubusercontent.com/RafaeldelRio/rafaeldelrio.github.io/refs/heads/main/source/content/Python%20%26%20Machine%20learning/ejercicios/Extra_ejercicio_3_visualizacion.ipynb)
	* Para practicar más con Sklearn - KNN: [Extra_ejercicio_4_sklearn_knn.ipynb](https://raw.githubusercontent.com/RafaeldelRio/rafaeldelrio.github.io/refs/heads/main/source/content/Python%20%26%20Machine%20learning/ejercicios/Extra_ejercicio_4_sklearn_knn.ipynb)
	* Para practicar más con SKlearn - scaling: [Extra_ejercicio_5_sklearn_scanling.ipynb](https://raw.githubusercontent.com/RafaeldelRio/rafaeldelrio.github.io/refs/heads/main/source/content/Python%20%26%20Machine%20learning/ejercicios/Extra_ejercicio_5_sklearn_scanling.ipynb)
	* Para practicar más con keras mnist: [Extra_ejercicio_6_Keras_MNIST.ipynb](https://raw.githubusercontent.com/RafaeldelRio/rafaeldelrio.github.io/refs/heads/main/source/content/Python%20%26%20Machine%20learning/ejercicios/Extra_ejercicio_6_Keras_MNIST.ipynb)
	* Para practicar más con pytorch mnist: [Extra_ejercicio_7_PyTorch_MNIST.ipynb](https://raw.githubusercontent.com/RafaeldelRio/rafaeldelrio.github.io/refs/heads/main/source/content/Python%20%26%20Machine%20learning/ejercicios/Extra_ejercicio_7_PyTorch_MNIST.ipynb)

### Módulo 3: Fundamentos de Inteligencia Artificial y Machine Learning (Conceptual)

* **Objetivo:** Entender los conceptos teóricos clave detrás del ML antes de implementar algoritmos.
* **Conceptos:**
    * ¿Qué es la Inteligencia Artificial? ¿Qué es el Machine Learning? Diferencias.
    * Tipos de Aprendizaje:
        * Supervisado: Clasificación y Regresión (conceptos, ejemplos en seguridad: detección de malware vs. predicción de ataques).
        * No Supervisado: Clustering y Reducción de Dimensionalidad (conceptos, ejemplos en seguridad: detección de anomalías, agrupación de tráfico de red).
        * (Opcional/Breve) Aprendizaje por Refuerzo.
    * El Proceso de ML: Recolección de datos -> Preprocesamiento/Ingeniería de características -> Selección del modelo -> Entrenamiento -> Evaluación -> Despliegue.
    * Conceptos Clave: Características (Features), Etiquetas (Labels), Conjunto de Entrenamiento (Training Set), Conjunto de Prueba (Test Set), Conjunto de Validación (Validation Set).
    * Problemas Comunes: Sobreajuste (Overfitting) y Subajuste (Underfitting). Sesgo (Bias) y Varianza (Variance).
    * Métricas de Evaluación Básicas:
        * Para Clasificación: Accuracy, Precisión, Recall, F1-Score, Matriz de Confusión. Curva ROC y AUC (explicación conceptual).
        * Para Regresión: MSE, MAE (mencionar brevemente).
        * Para Clustering: Silhouette Score (mencionar brevemente).
* **Ejercicios:** Para practicar estos conceptos, se debe emplear el archivo `ejercicios_modulo3.ipynb`.
	* Enlace: [ejercicios3.ipynb](https://raw.githubusercontent.com/RafaeldelRio/rafaeldelrio.github.io/refs/heads/main/source/content/Python%20%26%20Machine%20learning/ejercicios/ejercicios_modulo3.ipynb)

### Módulo 4: Algoritmos de Machine Learning y Aplicaciones en Ciberseguridad (Práctico)

* **Objetivo:** Implementar algoritmos básicos de ML usando `scikit-learn` y conectarlos con problemas de seguridad, preparando el terreno para los ejemplos del libro.
* **Conceptos:**
    * Introducción a **Scikit-learn**: La librería estándar de ML en Python. API consistente (`fit`, `predict`, `transform`).
    * **Preprocesamiento de Datos con Scikit-learn**: Escalado de características (StandardScaler, MinMaxScaler), Codificación de variables categóricas (OneHotEncoder, LabelEncoder).
    * **Algoritmos de Clasificación (con ejemplos simples de seguridad):**
        * Regresión Logística: Detección simple de spam o phishing.
        * K-Nearest Neighbors (KNN): Clasificación simple basada en similitud.
        * Árboles de Decisión y Random Forests: Modelos más potentes, entender su interpretabilidad (árbol) y robustez (bosque). Ejemplo: clasificación básica de malware basada en características simples.
    * **Algoritmos de Clustering (con ejemplos simples de seguridad):**
        * K-Means: Agrupación de logs de red para detectar patrones o anomalías.
    * **Ingeniería de Características (Feature Engineering) Específica de Seguridad (Introducción):**
        * ¿Qué es? ¿Por qué es crucial en seguridad?
        * Ejemplos conceptuales (sin entrar aún en el código complejo del libro): extraer longitud de URL, número de caracteres especiales (phishing); extraer información de cabeceras de ejecutables PE (malware); contar tipos de peticiones en logs web (ataques).
* **Ejercicios:** Para practicar estos conceptos, se debe emplear el archivo `ejercicios_modulo4.ipynb`.
	* Enlace: [ejercicios4.ipynb](https://raw.githubusercontent.com/RafaeldelRio/rafaeldelrio.github.io/refs/heads/main/source/content/Python%20%26%20Machine%20learning/ejercicios/ejercicios_modulo4.ipynb)

### Módulo 5: Implementación con Ejemplos del Libro/Repositorio Cylance

* **Objetivo:** Analizar, ejecutar y entender el código del repositorio Cylance, aplicando todo lo aprendido.
* **Conceptos:**
    * **Análisis Guiado del Código:** Seleccionar 1-2 ejemplos clave del repositorio (empezar por los más sencillos, si los hay).
    * **Desglose del Código:**
        * Carga y preprocesamiento de datos *específicos* del ejemplo (e.g., datos de ficheros PE, logs de red). Explicar el *porqué* de cada paso de preprocesamiento.
        * Ingeniería de características *aplicada*: Ver cómo se extraen las features relevantes para ese problema de seguridad específico.
        * Entrenamiento del modelo: Ejecutar el entrenamiento, entender los parámetros utilizados.
        * Evaluación del modelo: Interpretar las métricas de rendimiento *en el contexto del problema de seguridad*. ¿Qué significa una alta precisión o un alto recall en detección de malware?
        * Visualización de resultados (si el ejemplo la incluye).
    * **Adaptación y Experimentación:** Animar a los alumnos a hacer pequeñas modificaciones (cambiar parámetros, probar otro modelo simple) para ver cómo afecta al resultado.


---

* **Herramientas Recomendadas:**
    * Python 3.x
    * Jupyter Notebook / JupyterLab / Google Colaboratory
    * Bibliotecas: `NumPy`, `Pandas`, `Matplotlib`, `Seaborn`, `Scikit-learn`
    * Git y GitHub (para compartir código y usar el repositorio de Cylance)
