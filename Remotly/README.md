# Guía de Instalación para Remotely

## Paso 1: Preparar el Entorno

### Requisitos

- Servidor con Ubuntu 22.04 LTS.
- Docker y Docker Compose instalados.
- Portainer instalado y configurado.
- Caddy Server para manejo de proxy inverso (opcional, pero recomendado para HTTPS).

### Información Adicional

1. Instala Caddy Server siguiendo las instrucciones de la [documentación oficial](https://caddyserver.com/docs/install) o revisa el siguiente repositorio [Caddy Server]().
2. Instala Portainer siguiendo las instrucciones de la [documentación oficial](https://docs.portainer.io/) o revisa el siguiente repositorio [Portainer]().

## Paso 2: Instalación de Remotely

1. Inicia sesión en Portainer y dirígete a la sección de "Stacks". Haz clic en "+ Add stack" y configura el nombre del stack, por ejemplo, `Remotely`.
2. En el editor, crea el archivo `docker-compose.yml` (para más referencia, busca el archivo docker-compose.yml alojado en este apartado).
3. Despliega el stack en Portainer:
    - Haz clic en "Deploy the stack".

## Paso 3: Verificación de la Instalación

1. Abre tu navegador y navega a `http://your_domain` para verificar que los servicios están corriendo correctamente.

## Paso 4: Configuración del Cliente 

1. Una vez explorado el portal de Remotely, para configurar el cliente, necesitamos el ID de la organización además de configurar el nombre de la misma si es necesario esto lo encontres en el apartado de `Organization` en el portal principal de remotely.
2. Todo esto lo veremos en el archivo llamado `InstalacionAgente.ps1`, donde reemplazaremos `$organizationID`, `$serverURL`, `$installScriptURL` por los datos de nuestro dominio y organización.
3. Ejecuta el `InstalacionAgente.ps1` en todos los equipos que pienses manejar (todo esto como administrador en PowerShell).
4. Vuelve al portal y verifica que el equipo se agregó correctamente.
5. ¡Disfruta!
