# Documentación e ideas

Proyecto de documentación de módulos profesionales, así como la generación de ideas y la resolución de CTFs y prácticas.

Desplegado en https://rafaeldelrio.github.io


## Cómo lanzar el proyecto

Prerrequisitos:
- Tener nodejs instalado, con versión moderna.
- Tener npm instalado, con versión moderna.
- Tener git instalado.

git clone https://github.com/RafaeldelRio/rafaeldelrio.github.io.git
cd rafaeldelrio.github.io/source
npm i
npx quartz build --serve


## Cómo desplegar el proyecto en github actions

Básicamente se realiza un fork del proyecto con tu cuenta de Github. Posteriormente en el repositorio de Github acceder a 
Settings --> Pages y seleccionar "Github Actions.
Posteriormente acceder al apartado de Actions y permitir las "Github Actions".
Finalmente para añadir contenido y lanzar el primer despliegue, editar la carpeta /source/content, que es donde está el contenido de la documentación.

Recomiendo encarecidamente el uso de Obsidian para la edición de la documentación.


El proyecto quartz tiene su documentación en https://github.com/jackyzha0/quartz

El tutorial para el despliegue seguido está en:
 https://dev.to/defenderofbasic/host-your-obsidian-notebook-on-github-pages-for-free-8l1. 


## Añadir páginas HTML directamente

Existe la posibilidad de añadir páginas HTML directamente, además de los archivos .md de markdown que genera obsidian u otros editores.
Para el despliegue de archivos HTML se usa la carpeta [source/raw_html](./source/raw_html) que es copiada directamente en el proceso de CI.

Un ejemplo puede encontrarse en: https://rafaeldelrio.github.io/raw-html-test.html


## Para configuraciones del tema

La configuración del tema de Quartz puede ser realizada modificando los archivos quartz.config.ts.
También es posible modificar la distribución (layout) en quartz.layout.ts.

https://quartz.jzhao.xyz/configuration
