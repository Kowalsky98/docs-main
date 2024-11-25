# Tactical RMM

Tactical RMM es un gestor de mantenimiento remoto de código abierto, altamente configurable y avanzado. Su versatilidad lo convierte en una excelente opción para la gestión remota de sistemas. Agradecemos la discreción en su uso.

## Problemas

Tactical RMM utiliza [uWSGI](https://uwsgi-docs.readthedocs.io/en/latest/) como servidor para aplicaciones Python. Sin embargo, esto genera problemas de compatibilidad con Caddy. Aunque existen módulos para extender Caddy y hacerlo compatible con uWSGI, estos no son compatibles con la versión de Caddy que usamos en otros servicios (aunque esto podría cambiar en el futuro).

Debido a esta limitación, hemos decidido seguir utilizando el contenedor Docker de Tactical NGINX para manejar este tráfico. Es importante destacar que no es necesario que NGINX maneje todo el tráfico después de que Caddy lo procese, como sugiere la documentación oficial. Por lo tanto, hemos modificado el archivo `docker-compose` para reflejar estos cambios, asegurando que NGINX gestione únicamente el tráfico del contenedor de la API y otros contenedores relacionados.

Tactical usa bastantes servicios es por ello que recomendamos un servidor con buenos recursos para esto.

## Guía de instalación

### Paso 1: Preparación de entorno

- Servidor con Ubuntu 22.04 LTS.
- Docker y Docker Compose instalados.
- Portainer instalado y configurado.
- Caddy Server para manejo de proxy inverso (opcional, pero recomendado para HTTPS).

#### Información Adicional

1. Instala Caddy Server siguiendo las instrucciones de la [documentación oficial](https://caddyserver.com/docs/install) o revisa el siguiente repositorio [Caddy Server](../Portainer%20+%20caddy/readme.md).
2. Instala Portainer siguiendo las instrucciones de la [documentación oficial](https://docs.portainer.io/) o revisa el siguiente repositorio [Portainer](../Portainer%20+%20caddy/readme.md).

## Paso 2: Configuración de servicios de DNS

Crea 3 registros CNAME nuevos que apunten a tu servidor configurado [aquí](../Portainer%20+%20caddy/readme.md)
son los que configuramos en nuestras variables de entorno

```bash
APP_HOST=rmm.example.com
API_HOST=api.example.com
MESH_HOST=mesh.example.com
```

## Paso 3: Instalación de Tactical

1. Inicia sesión en Portainer y dirígete a la sección de "Stacks". Haz clic en "+ Add stack" y configura el nombre del stack, por ejemplo, `tactical_rmm`.
2. En el editor, crea el archivo `docker-compose.yml` (para más referencia, busca el archivo docker-compose.yml alojado en este apartado).
3. Incluye las variables de entorno **NO OLVIDES MODIFICARLAS**
4. Despliega el stack en Portainer:
   - Haz clic en "Deploy the stack".

## Paso 4: Verifica

Ingresa a tu `FRONTEND_URL` y sigue tu proceso de login, y configura tu 2FA

## Paso 5: Configura

Sigue los pasos en el siguiente [tutorial](../Conect%20RustDesk%20-%20TRMM/readme.md)
