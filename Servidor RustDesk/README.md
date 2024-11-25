# Instalación del Servidor RustDesk en Portainer

Este archivo `README.md` proporciona una guía paso a paso para la instalación y configuración de un servidor RustDesk en Portainer utilizando Docker Compose.

## Requisitos Previos

- Servidor con Ubuntu 22.04 LTS.
- Docker y Docker Compose instalados.
- Portainer instalado y configurado.
- Caddy Server para manejo de proxy inverso (opcional, pero recomendado para HTTPS).

## Información Adicional

1. Instala Caddy Server siguiendo las instrucciones de la [documentación oficial](https://caddyserver.com/docs/install) o revisa el siguiente repositorio [Caddy Server]().
2. Instala Portainer siguiendo las instrucciones de la [documentación oficial](https://docs.portainer.io/) o revisa el siguiente repositorio [Portainer]().

## Paso 1: Configuración del Docker Compose

1. Inicia sesión en Portainer y dirígete a la sección de "Stacks". Haz clic en "+ Add stack" y configura el nombre del stack, por ejemplo, `rustdesk-server`.

2. En el editor, crea el archivo `docker-compose.yml` (para mas refencia busca el archivo docker-compose.yml alojado en este apartado)

3. Despliega el stack en Portainer:
    - Haz clic en "Deploy the stack".


## Paso 2: Verificación de la Instalación

1. Abre tu navegador y navega a `http://your_domain/hbbs` y `http://your_domain/hbbr` para verificar que los servicios están corriendo correctamente.

2. Puedes utilizar el cliente RustDesk y configurar la dirección del servidor en las opciones de red para conectarte a tu servidor RustDesk auto-hospedado.

## Nota

Para ver el portal web de rustdesk es necesario instalar la version PRO de lo contrario este apartado no se mostrara

## IMPORTANTE

Es importante aclarar que los puertos deben estar abiertos en el router desde el 21114 hasta el puerto 21119. Estos puertos se reparten entre hbbs y hbbr. Para más información sobre cómo abrir los puertos en el router, consulta la siguiente documentación [DCHP_server](https://github.com/ganaloterias/docs/blob/main/DCHP_server/README.md).

## Paso 3: Configuracion dentro de RustDesk
1. Ingresamos a RustDesk y vamos al apartado de Ajustes

2. Una vez en Ajustes vamos a red y configuramos el Servidor ID/Relay para mas referencia de como se deberia ver adjunto una captura de pantalla
   
 ![alt text](<Captura de pantalla 2024-08-31 110626.png>)

3. Realizado esto pueba la conexion entres dos equipos o con una maquina virtual que tengan esta misma configuracion

4. Disfruta :)

## Conclusión

Siguiendo estos pasos, deberías tener un servidor RustDesk corriendo en Portainer con Caddy Server manejando el proxy inverso. Para más detalles y opciones de configuración, consulta la [documentación oficial de RustDesk](https://rustdesk.com/docs/en/self-host/).
