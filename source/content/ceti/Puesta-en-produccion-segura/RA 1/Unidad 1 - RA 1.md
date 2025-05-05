## Resultado de Aprendizaje 1: Prueba de aplicaciones web y para dispositivos móviles

### Criterio 1.a: Comparar diferentes lenguajes de programación según sus características principales
- **Conceptos**: Características que afectan pruebas y seguridad, como gestión de memoria, seguridad de tipos y manejo de excepciones.
- **Prácticas**: Escribir y probar código en lenguajes como Python, Java y C++; usar herramientas de análisis estático para identificar problemas.
- **Herramientas**: IDEs ([PyCharm](https://www.jetbrains.com/pycharm/), [Eclipse](https://www.eclipse.org/)), análisis estático ([Pylint](https://pylint.org/), [FindBugs](http://findbugs.sourceforge.net/)), frameworks de prueba ([pytest](https://pytest.org/), [JUnit](https://junit.org/)).
- **Adicional**: Estudios de casos sobre cómo la elección del lenguaje impactó la seguridad, como el uso de C en sistemas críticos.

### Criterio 1.b: Describir diferentes modelos de ejecución de software
- **Conceptos**: Modelos como cliente-servidor, microservicios y monolíticos; implicaciones de seguridad en cada uno.
- **Prácticas**: Configurar aplicaciones simples en diferentes modelos; identificar riesgos de seguridad mediante análisis.
- **Herramientas**: Servidores web ([Apache](https://httpd.apache.org/), [Nginx](https://nginx.org/)), contenedores ([Docker](https://www.docker.com/)), pasarelas API.
- **Adicional**: Ejemplos de brechas de seguridad relacionadas con modelos de ejecución, como ataques a microservicios mal configurados.

### Criterio 1.c: Reconocer elementos básicos del código fuente, dándoles significado
- **Conceptos**: Constructos de programación (variables, funciones, clases); cómo pueden introducir vulnerabilidades si se usan incorrectamente.
- **Prácticas**: Revisar código para identificar problemas de seguridad; refactorizar código inseguro.
- **Herramientas**: Editores de código con linting ([Visual Studio Code](https://code.visualstudio.com/)), herramientas de análisis estático ([SonarQube](https://www.sonarqube.org/)).
- **Adicional**: Introducir estándares de codificación segura, como [CERT](https://wiki.sei.cmu.edu/confluence/display/seccode) y [OWASP](https://owasp.org/).

### Criterio 1.d: Ejecutar diferentes tipos de prueba de software
- **Conceptos**: Pruebas unitarias, de integración, de sistema; pruebas de seguridad como penetración y fuzzing.
- **Prácticas**: Escribir pruebas unitarias; realizar pruebas de penetración; usar herramientas de fuzzing.
- **Herramientas**: Frameworks de prueba ([JUnit](https://junit.org/), [pytest](https://pytest.org/)), herramientas de seguridad ([Burp Suite](https://portswigger.net/burp), [AFL](https://lcamtuf.coredump.cx/afl/)).
- **Adicional**: Discutir la importancia de las pruebas en el ciclo de vida del desarrollo de software (SDLC) y su integración con DevOps.

### Criterio 1.e: Evaluar lenguajes de programación según la infraestructura de seguridad que proporcionan
- **Conceptos**: Características de seguridad en lenguajes (e.g., seguridad de memoria en Rust); vulnerabilidades comunes por lenguaje.
- **Prácticas**: Comparar lenguajes mediante análisis de código; usar escáneres de seguridad específicos.
- **Herramientas**: Escáneres de seguridad ([Bandit](https://github.com/PyCQA/bandit) para Python, [FindSecBugs](https://find-sec-bugs.github.io/)), comprobadores de dependencias ([OWASP Dependency-Check](https://owasp.org/www-project-dependency-check/)).
- **Adicional**: Explorar por qué lenguajes como Ada o Rust son preferidos en aplicaciones críticas de seguridad.