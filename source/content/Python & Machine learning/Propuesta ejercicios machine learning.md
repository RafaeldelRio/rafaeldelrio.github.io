
## Ejercicio 1
NSL-KDD: Realizar clasicación supervisada (uno o varios métodos) empleando el dataset NSL KDD de https://github.com/defcom17/NSL_KDD
En el fichero "Attack Types.csv" del repositorio pueden verse las diferentes etiquetas asociadas a tráfico malicioso. Se trata de clasificar ataques, identificando a cuál de las 5 categorías: Normal (no ataque), DoS, U2R, R2L o Probing, pertenece el ataque (o bien si es malicioso o normal), entrenando con los datos de los ficheros KDDTrain* y chequearlos con los datos de KDDTest*.
Hay documentación sobre el data-set NSL-KDD para entender qué información contiene y cómo está codicada en el artículo original sobre ese conjunto de datos en: https://www.researchgate.net/publication/48446353_A_detailed_analysis_of_the_KDD_CUP_99_data_set

## Ejercicio 2

KDDCup99: Los datos del dataset NSL KDD son una versión filtrada del conjunto de datos ya etiquetados del "KDD Cup 1999 Data" (ver en secrepo.com el apartado 3rd party network): http://kdd.ics.uci.edu/databases/kddcup99/kddcup99.html que también se podrían usar directamente con algún método de clasificación como tema del trabajo, aunque este conjunto de datos puede ser algo más
complicado de filtrar y adaptar que el anterior.
Los datos provienen de una competición sobre varios tipos de ataque. Ya están en formato CSV y solo hay que ver cómo codicarlos, separar un subconjunto del full dataset para test (los que proporcionan unlabeled eran para la competición, pero también puede haber tipos de ataque unknown en los datos de test, train y en listado). En la página web hay explicaciones sobre el origen y cómo se han obtenido los datos, etc.

## Ejercicio 3
CSE-CIC-IDS2018: Se trata de aplicar métodos de clasificación supervisados con el dataset "CSE-CIC-IDS2018" del CIC, que contiene datos etiquetados de diferentes tipos ataque, y que está extensamente descrito y explicado en la página: https://www.unb.ca/cic/datasets/ids-2018.html al final de la misma se encuentran las instrucciones para descargar el dataset, para lo cual se requiere instalar el software gratuito "AWS CLI".

## Ejercicio 4
Phishing-URL-Detection: Realizar los análisis como los explicados en Phishing URL Detection with Python and ML https://www.activestate.com/blog/phishing-url-detection-with-python-and-ml/ y también aplicar los modelos de regresión logística y de random forest (sugeridos dentro del mismo blog) , utilizando los datos de Phishing Websites Data Set en el repositorio de UCI: https://archive.ics.uci.edu/ml/datasets/Phishing+Websites
En el repositorio de datos hay un documento .docx que explica cómo se han calculado las features del dataset, que está en formato ARFF (Attribute-Relation File Format).
Nota: No es recomendable usar la plataforma activestate del blog (es innecesaria y da errores).

## Ejercicio 5
Malware-Domains: Aplicar los métodos de clasicación del ejemplo del capítulo 3 del libro, adaptando los scripts en el repositorio de la asignatura para sustituir los datos de SMS por los datos de DGA (Domain Generating Algorithm) malware domains "DDS legit and DGA labeled domains" (de secrepo.com) con datos disponibles en http://datadrivensecurity.info/blog/data/2014/10/legit-dga_domains.csv.zip

Atención: el chero legit-dga_domains.csv una vez descomprimido, tiene una errata (2 saltos de línea o new-line insertados en un registro) en las líneas 99694--99696 que pueden dar errores del formato.
Se trata de codicar la información de los nombres de dominio leídos de cheros CSV, en lugar del texto de SMS, con el método de transiciones de tipos de caracteres. Es recomendable cambiar las character_classes a: {digitos, vocales, consonantes_frecuentes, resto_consonantes, puntuación} para que se adapten mejor a las posibles transiciones de caracteres en nombres de dominio (solo letras, números y "-", no hay espacios, etc.).