## Resultado de Aprendizaje 3: Detección y corrección de vulnerabilidades de aplicaciones web

### Criterio 3.a: Validar las entradas de los usuarios
- **Conceptos**: Técnicas de validación de entrada (sintáctica, semántica); vulnerabilidades como XSS y SQLi.
- **Prácticas**: Implementar validación en código; probar debilidades con herramientas.
- **Herramientas**: WAFs, análisis estático, herramientas de pruebas de penetración ([Burp Suite](https://portswigger.net/burp)).
- **Adicional**: Principio de no confiar en la entrada del usuario; validación en múltiples capas.

### Criterio 3.b: Detectar riesgos de inyección en servidor y cliente
- **Conceptos**: Tipos de inyección (SQL, OS, código); prevención mediante consultas parametrizadas.
- **Prácticas**: Identificar puntos de inyección; implementar correcciones en código.
- **Herramientas**: [SQLMap](https://sqlmap.org/), análisis estático, escáneres de vulnerabilidades ([Acunetix](https://www.acunetix.com/)).
- **Adicional**: Analizar ataques de inyección famosos; uso de frameworks ORM para prevención.

### Criterio 3.c: Gestionar correctamente la sesión del usuario
- **Conceptos**: Vulnerabilidades de gestión de sesiones (fijación, secuestro); mejores prácticas como cookies seguras.
- **Prácticas**: Implementar gestión de sesiones segura; probar vulnerabilidades.
- **Herramientas**: Herramientas de desarrollo del navegador, [Burp Suite](https://portswigger.net/burp), bibliotecas de sesiones seguras.
- **Adicional**: Comparar autenticación basada en tokens (JWT) con sesiones tradicionales.

### Criterio 3.d: Usar roles para el control de acceso
- **Conceptos**: Principios de control de acceso (menor privilegio); implementación de RBAC.
- **Prácticas**: Diseñar e implementar RBAC; probar controles de acceso.
- **Herramientas**: Frameworks de autenticación ([Spring Security](https://spring.io/projects/spring-security)), herramientas de pruebas de penetración.
- **Adicional**: Errores comunes como referencias directas a objetos; auditoría de decisiones de acceso.

### Criterio 3.e: Usar algoritmos criptográficos seguros para contraseñas
- **Conceptos**: Hashing de contraseñas; algoritmos recomendados (bcrypt, Argon2).
- **Prácticas**: Implementar hashing; verificar almacenamiento; intentar cracking éticamente.
- **Herramientas**: Bibliotecas de hashing ([bcrypt](https://github.com/pyca/bcrypt)), herramientas de cracking ([Hashcat](https://hashcat.net/hashcat/)).
- **Adicional**: Políticas de contraseñas; autenticación multifactor.

### Criterio 3.f: Configurar servidores web para reducir riesgos
- **Conceptos**: Endurecimiento de servidores; cabeceras de seguridad (HSTS, CSP).
- **Prácticas**: Configurar servidores con mejores prácticas; escanear configuraciones erróneas.
- **Herramientas**: Guías de configuración ([Mozilla Observatory](https://observatory.mozilla.org/)), escáneres ([Nikto](https://cirt.net/Nikto2)).
- **Adicional**: Configuración de HTTPS; análisis de logs para detección de ataques.

### Criterio 3.g: Incorporar medidas contra ataques automatizados
- **Conceptos**: Ataques automatizados (brute force, spam); CAPTCHAs, limitación de tasas.
- **Prácticas**: Implementar CAPTCHAs; configurar limitación de tasas; simular ataques.
- **Herramientas**: [reCAPTCHA](https://www.google.com/recaptcha), WAFs con detección de bots, herramientas de monitorización.
- **Adicional**: Equilibrio entre seguridad y experiencia del usuario; detección de bots basada en ML.