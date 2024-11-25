
# Pocket base

PocketBase es un backend de código abierto que consta de una base de datos integrada (SQLite) con suscripciones en tiempo real, administración de autenticación incorporada, una interfaz de usuario conveniente y una API REST simple.

## Indice

- [Descripción general](#Descripción%general)
- [Requisitos previos](#Requisitos%previos)
- [Construcción de la imagen](#Construcción%de%la%imagen)



## Descripción general

Pocket base es muy sencillo de usar es un backend extendible escrito en go, lo cual lo hace muy ligero. su consumo en recursos es minimo, permite conexiones en tiempo real, y manejo de politicas de uso, para información revisar la [Documentación](https://pocketbase.io/docs/).

## Requisitos previos

Antes de comenzar, asegúrate de cumplir con los siguientes requisitos:

- Tener Docker y Portainer instalados en tu servidor.
- Caddy configurado como servidor proxy inverso.
- Conexión a internet para descargar las imágenes de Docker.
- Archivo `.env` configurado con las variables de entorno necesarias.

## Construcción de la imagen

Pocket base al ser tan ligero no tiene repositorio docker propio, trabaja bajo cualquier sistema en un par de click

Se usará la construcción con Dockerfile, para esto ingresamos a:

1. Inicia sesión en Portainer.
2. Navega a la sección **Images**.
3. Haz clic en **Build a new image** para crear un nueva imagen.
4. Copia el contenido del DockerFile de esta carpeta.
5. Asigna un nombre a la imagen, por ejemplo, `PocketBase`.

## Nota

En su estado mas simple `PocketBase` no necesita variables de entorno a menos que lo hayas configurado para esto con extensiones
