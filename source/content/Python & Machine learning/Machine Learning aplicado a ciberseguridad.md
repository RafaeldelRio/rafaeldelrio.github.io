---
draft: "true"
---

## I. Fundamentos de Machine Learning (ML)
Base de machine learning necesaria para poder aplicarlo

* **Conceptos Básicos:** ¿Qué es el ML? Diferencia entre IA, Big data, ML y Deep Learning.
* **Tipos de Aprendizaje:** Supervisado (Clasificación, Regresión), No Supervisado (Clustering, Reducción de Dimensionalidad), Semi-supervisado y por Refuerzo (menos común en ciberseguridad básica, pero útil para respuestas automatizadas).
* **Conceptos Clave:** Características (Features), Etiquetas (Labels), Conjuntos de Entrenamiento/Validación/Prueba, Sobreajuste (Overfitting) y Subajuste (Underfitting), Regularización.
* **Algoritmos Comunes:**
    * **Supervisados:** Regresión Logística, Máquinas de Vectores de Soporte (SVM), Árboles de Decisión, Random Forests, Gradient Boosting (XGBoost, LightGBM), K-Vecinos más Cercanos (KNN), Redes Neuronales Artificiales (ANN) básicas. Naive Bayes (especialmente para texto/spam).
    * **No Supervisados:** K-Means, DBSCAN, Modelos de Mezcla Gaussiana (GMM) para clustering/detección de anomalías. PCA (Principal Component Analysis) para reducción de dimensionalidad. Autoencoders (Deep Learning) para detección de anomalías.
    * **Deep Learning (si aplica):** Redes Neuronales Convolucionales (CNNs - p.ej., para análisis de imágenes de malware), Redes Neuronales Recurrentes (RNNs/LSTMs - p.ej., para análisis de secuencias de logs o texto).
* **Proceso de ML (Pipeline):**
    * Recolección y Comprensión de Datos.
    * Preprocesamiento de Datos: Limpieza, manejo de valores nulos, escalado (normalización/estandarización), codificación de variables categóricas (One-Hot Encoding, Label Encoding).
    * Ingeniería de Características (Feature Engineering): Creación de nuevas características relevantes a partir de los datos crudos (**¡CRUCIAL en ciberseguridad!**).
    * Selección de Características (Feature Selection): Elegir las características más informativas.
    * Selección y Entrenamiento del Modelo.
    * Evaluación del Modelo: Métricas clave (Accuracy, Precisión, Recall, F1-Score, Curva ROC/AUC, Matriz de Confusión). Entender por qué accuracy no siempre es la mejor métrica en ciberseguridad (por el desbalanceo de clases).
    * Ajuste de Hiperparámetros.
    * Despliegue y Monitorización (Conceptos básicos).
* **Herramientas y Librerías:**
    * **Lenguaje de Programación:** Python (es el estándar de facto).
    * **Librerías Esenciales:** Scikit-learn (para la mayoría de algoritmos de ML), Pandas (manipulación de datos), NumPy (cálculo numérico), Matplotlib/Seaborn (visualización).
    * **Librerías de Deep Learning (opcional, según profundidad):** TensorFlow/Keras o PyTorch.

## II. Fundamentos de Ciberseguridad
Conceptos básicos de ciberseguridad

* **Conceptos Básicos:** Triada CIA: Confidencialidad, Integridad, Disponibilidad.
* **Amenazas, Vulnerabilidades, Riesgos, Exploits, Vectores de Ataque.**
* **Tipos de Actores Maliciosos:** (Hackers, Insider Threats, Estados-Nación, etc.).
* **Áreas de Aplicación (Tipos de Ataques a Detectar):**
    * **Malware:** Virus, Gusanos, Troyanos, Ransomware, Spyware. Entender análisis estático (características del binario sin ejecutarlo) y dinámico (comportamiento en ejecución - sandbox).
    * **Phishing y Spam:** Detección en emails (análisis de cabeceras, cuerpo, URLs), sitios web falsos.
    * **Intrusiones en Red (IDS/IPS):** Detección de patrones anómalos en el tráfico de red (NetFlow, PCAP), escaneo de puertos, ataques DoS/DDoS.
    * **Detección de Anomalías:** En logs de sistema, logs de aplicaciones, comportamiento de usuarios (User Behavior Analytics - UBA) para detectar insiders o cuentas comprometidas.
    * **Fraude:** Detección de transacciones fraudulentas.
    * **Seguridad Web:** Detección de ataques como SQL Injection, Cross-Site Scripting (XSS) a través del análisis de logs o tráfico web (menos directo con ML clásico, pero posible).
* **Fuentes de Datos en Ciberseguridad:**
    * **Logs:** Logs de sistema (Windows Event Logs, Syslog), logs de firewall, logs de servidores web, logs de autenticación, logs de DNS.
    * **Tráfico de Red:** Datos de flujo (NetFlow, sFlow, IPFIX), capturas completas de paquetes (PCAP).
    * **Datos de Endpoints:** Información de EDR (Endpoint Detection and Response), procesos en ejecución, conexiones de red, archivos modificados.
    * **Archivos/Binarios:** Ejecutables de malware.
    * **Emails:** Cabeceras, cuerpo, adjuntos, URLs.
    * **Feeds de Inteligencia de Amenazas (Threat Intelligence).**
* **Herramientas y Conceptos de Seguridad:** Firewalls, IDS/IPS, SIEM (Security Information and Event Management), Antivirus/Anti-malware, Sandboxing, Honeypots.

## III. Aplicación de ML en Ciberseguridad 
Aquí es donde combinas ambos mundos.

* **Casos de Uso Específicos y Cómo Abordarlos:**
    * **Detección de Phishing:** Clasificación de texto/URLs. Features: longitud de URL, presencia de palabras clave, TLD, uso de HTTPS, análisis de contenido del email, etc. Algoritmos: SVM, Random Forest, Naive Bayes, LSTMs.
    * **Detección de Malware:** Clasificación de binarios/comportamientos. Features estáticas: strings, imports/exports de DLLs, opcodes, entropía. Features dinámicas: llamadas a API, conexiones de red, modificaciones de registro/ficheros. Algoritmos: Random Forest, Gradient Boosting, SVM, Redes Neuronales (incluyendo CNNs para visualizar binarios como imágenes).
    * **Detección de Intrusiones/Anomalías en Red:** Detección de anomalías en tráfico. Features: duración conexión, protocolo, puertos, bytes transferidos, flags TCP, estadísticas de flujo. Algoritmos: K-Means, DBSCAN, Isolation Forest, Autoencoders. Para ataques conocidos, usar algoritmos de clasificación supervisada.
    * **User Behavior Analytics (UBA):** Detección de anomalías en logs de usuario. Features: hora de login, ubicación, recursos accedidos, volumen de datos transferidos. Algoritmos: Clustering, Autoencoders, GMM.
* **Desafíos Específicos en Ciberseguridad:**
    * **Desbalanceo Extremo de Clases:** Los ataques son mucho menos frecuentes que el comportamiento normal. Técnicas: Oversampling (SMOTE), Undersampling, Cost-Sensitive Learning, usar métricas adecuadas (Precision, Recall, F1, AUC).
    * **Concept Drift:** Los ataques evolucionan constantemente. Los modelos se vuelven obsoletos y necesitan re-entrenamiento/adaptación continua.
    * **Ingeniería de Características Compleja:** Requiere conocimiento profundo del dominio de ciberseguridad para extraer features útiles de datos crudos (logs, tráfico, binarios).
    * **Adversarial Machine Learning:** Los atacantes intentan activamente evadir los modelos de ML (creando ejemplos adversarios). Necesitas conocer técnicas básicas de ataque (evasión, envenenamiento) y defensa (entrenamiento adversarial, robustez).
    * **Necesidad de Interpretabilidad/Explicabilidad (XAI):** Los analistas de seguridad necesitan entender por qué un modelo tomó una decisión. Técnicas como LIME o SHAP pueden ser importantes.
    * **Volumen y Velocidad de Datos:** Big Data y necesidad de procesamiento (casi) en tiempo real.
    * **Disponibilidad de Datos Etiquetados:** Conseguir datasets públicos y realistas para entrenamiento es un desafío.

## IV. Estructura y Contenido del Curso
* **Sesiones a impartir:**
    * Introducción (¿Qué es ML en Ciberseguridad? ¿Por qué es importante?)
    * Repaso Rápido de Fundamentos de ML (o módulo completo si la audiencia lo necesita).
    * Repaso Rápido de Fundamentos de Ciberseguridad (o módulo completo).
    * Fuentes de Datos y Preprocesamiento en Ciberseguridad.
    * Ingeniería de Características para Seguridad.
    * ML para Detección de Malware.
    * ML para Detección de Phishing y Spam.
    * ML para Detección de Intrusiones y Anomalías en Red.
    * ML para User Behavior Analytics.
    * Desafíos: Desbalanceo de Clases, Concept Drift, Adversarial ML.
    * Interpretabilidad (XAI) en Ciberseguridad.
    * Consideraciones Éticas y de Privacidad.
    * Herramientas y Plataformas.
    * Proyecto Final / Casos Prácticos Integradores.
* **Enfoque Práctico:**
    * **Imprescindible:** Incluir muchos laboratorios prácticos y ejemplos de código (Jupyter Notebooks son ideales).
    * Utilizar datasets públicos de ciberseguridad (ej. NSL-KDD, CICIDS2017, datasets de malware como EMBER, datasets de phishing).
    * Mostrar pipelines completos: desde datos crudos hasta la evaluación del modelo.
* **Recursos:** Prepara diapositivas, código de ejemplo, enlaces a datasets, artículos relevantes y lecturas recomendadas.