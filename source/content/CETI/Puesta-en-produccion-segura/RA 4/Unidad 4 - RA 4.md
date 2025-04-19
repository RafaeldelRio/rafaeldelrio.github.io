
## Resultado de Aprendizaje 4: Detección de problemas de seguridad en aplicaciones para dispositivos móviles

### Criterio 4.a: Comparar modelos de permisos de plataformas móviles
- **Conceptos**: Sistemas de permisos en Android e iOS; implicaciones de seguridad.
- **Prácticas**: Desarrollar apps que soliciten permisos; analizar manifests.
- **Herramientas**: [Android Studio](https://developer.android.com/studio), [Xcode](https://developer.apple.com/xcode/), [MobSF](https://github.com/MobSF/Mobile-Security-Framework-MobSF).
- **Adicional**: Evolución de modelos de permisos; gestión de permisos por usuarios.

### Criterio 4.b: Describir técnicas de almacenamiento seguro de datos
- **Conceptos**: Métodos de almacenamiento (preferencias, bases de datos); encriptación de datos.
- **Prácticas**: Implementar almacenamiento encriptado; inspeccionar datos de la app.
- **Herramientas**: Bibliotecas de encriptación, herramientas forenses (uso educativo).
- **Adicional**: Diferencias entre almacenamiento en Android e iOS; manejo seguro de datos en memoria.

### Criterio 4.c: Implementar validación de compras integradas con validación en servidor
- **Conceptos**: Mecánicas de compras in-app; riesgos de validación del lado del cliente.
- **Prácticas**: Configurar compras; implementar validación del servidor; probar spoofing.
- **Herramientas**: SDKs de plataforma ([Google Play Billing](https://developer.android.com/google/play/billing), [StoreKit](https://developer.apple.com/documentation/storekit)), frameworks del lado del servidor.
- **Adicional**: Técnicas de fraude; manejo de reembolsos y suscripciones.

### Criterio 4.d: Usar herramientas de monitorización de tráfico de red
- **Conceptos**: Protocolos seguros vs. inseguros; ataques MITM; pinning de certificados.
- **Prácticas**: Inspeccionar tráfico con herramientas; implementar pinning.
- **Herramientas**: [Wireshark](https://www.wireshark.org/), [Burp Suite](https://portswigger.net/burp), [Charles Proxy](https://www.charlesproxy.com/).
- **Adicional**: Manejo de claves API; impacto de VPNs en seguridad.

### Criterio 4.e: Inspeccionar binarios para buscar fugas de información
- **Conceptos**: Información en binarios (cadenas, claves); técnicas de ofuscación.
- **Prácticas**: Descompilar apps; buscar datos sensibles; aplicar ofuscación.
- **Herramientas**: [jadx](https://github.com/skylot/jadx), [apktool](https://ibotpeaches.github.io/Apktool/), [ProGuard](https://www.guardsquare.com/proguard).
- **Adicional**: Aspectos legales y éticos del reverse engineering; protección de propiedad intelectual.