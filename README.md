# Documentación e ideas

Proyecto de documentación de módulos profesionales, así como la generación de ideas y la resolución de CTFs y prácticas.

Desplegado a través de Github pages en: https://rafaeldelrio.github.io
Desplegado a través de Cloudflare pages en: https://web.cloudflare-nbkeq.workers.dev/
Desplegado a través de Gitlab pages en: https://web-dcb01e.gitlab.io/


## Cómo lanzar el proyecto en local

Prerrequisitos:
- Tener nodejs instalado, con versión moderna.
- Tener npm instalado, con versión moderna.
- Tener git instalado.

git clone https://github.com/RafaeldelRio/rafaeldelrio.github.io.git
cd rafaeldelrio.github.io/source
npm i
npx quartz build --serve


## Cómo desplegar el proyecto en Github pages

Se realiza un fork del proyecto con tu cuenta de Github. Posteriormente en el repositorio de Github acceder a 
Settings --> Pages y seleccionar "Deploy from a branch". La rama de despliegue es gh-pages.
Posteriormente acceder al apartado de Actions y permitir las "Github Actions".
Finalmente para añadir contenido y lanzar el primer despliegue, editar la carpeta /source/content, que es donde está el contenido de la documentación.

Si se desea modificar el despliegue en Github pages, a través de Github actions, se debe echar un vistazo al archivo .github/workflows/ci.yaml


## Cómo desplegar el proyecto en Gitlab pages

Se debe crear un repositorio configurando que el despliegue será a través de Gitlab pages. El archivo .gitlab-ci.yaml tiene toda la configuración necesaria para el despliegue del proyecto.

Se debe tener en cuenta que en Gitlab, cuando se despliega por primera vez, solo es visible para el creador la web. Esto es una configuración que se debe modificar para que sea visible para cualquiera.


## Cómo desplegar el proyecto en Cloudflare pages

Para desplegar en cloudflare pages escogeremos el despliegue a través de repositorio. El comando empleado para el build es `cd source && npm install && chmod +x ./quartz/bootstrap-cli.mjs && npx quartz build && cp -r raw_html/* public/` y el comando empleado para el deploy es `npx wrangler deploy --name web --assets=./source/public --compatibility-date 2025-03-30`.

Hay que tener en cuenta que donde pone `--name web` es el nombre del proyecto en Cloudflare pages.


## Añadir páginas HTML directamente

Existe la posibilidad de añadir páginas HTML directamente, además de los archivos .md de markdown que genera obsidian u otros editores.
Para el despliegue de archivos HTML se usa la carpeta [source/raw_html](./source/raw_html) que es copiada directamente en el proceso de CI.

Un ejemplo puede encontrarse en: https://rafaeldelrio.github.io/raw-html-test.html


## Para configuraciones del tema

La configuración del tema de Quartz puede ser realizada modificando los archivos quartz.config.ts.
También es posible modificar la distribución (layout) en quartz.layout.ts.

https://quartz.jzhao.xyz/configuration


## Otros

Recomiendo encarecidamente el uso de Obsidian para la edición de la documentación.

El proyecto quartz tiene su documentación en https://github.com/jackyzha0/quartz