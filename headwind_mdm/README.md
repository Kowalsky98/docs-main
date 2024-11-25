# Guía de Instalación para Headwind

## Paso 1: Preparar el Entorno

### Requisitos

- Servidor con debian o derivado.
- Docker y Docker Compose instalados.
- Portainer instalado y configurado.
- Caddy Server para manejo de proxy inverso (opcional, pero recomendado para HTTPS).

### Información Adicional

1. Instala Caddy Server siguiendo las instrucciones de la [documentación oficial](https://caddyserver.com/docs/install) o revisa el siguiente repositorio [Caddy Server]().
2. Instala Portainer siguiendo las instrucciones de la [documentación oficial](https://docs.portainer.io/) o revisa el siguiente repositorio [Portainer]().

## Paso 2: Instalación de Headwind

1. Inicia sesión en Portainer y dirígete a la sección de "Stacks". Haz clic en "+ Add stack" y configura el nombre del stack, por ejemplo, `headwind`.
2. En el editor, crea el archivo `docker-compose.yml` (para más referencia, busca el archivo docker-compose.yml alojado en este apartado).
3. Despliega el stack en Portainer:
    - Haz clic en "Deploy the stack".

## Paso 3: Verificación de la Instalación

1. Abre tu navegador y navega a `http://your_domain` para verificar que los servicios están corriendo correctamente.

## Nota

Headwind usa el puerto 31000 para enviar mensajes push recordar dejar abierto
