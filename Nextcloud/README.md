# Despliegue de Nextcloud con MariaDB como Stack en Portainer

## Índice
1. [Descripción General](#descripción-general)
2. [Requisitos Previos](#requisitos-previos)
3. [Configuración del Stack en Portainer](#configuración-del-stack-en-portainer)
4. [Variables de Entorno](#variables-de-entorno)
5. [Despliegue del Stack](#despliegue-del-stack)
6. [Verificación del Despliegue](#verificación-del-despliegue)
7. [Administración y Mantenimiento](#administración-y-mantenimiento)
8. [Referencias](#referencias)

## Descripción General

Este README detalla los pasos necesarios para desplegar Nextcloud con MariaDB utilizando un stack en Portainer. El entorno también se integra con Caddy como proxy inverso para gestionar el tráfico HTTP/HTTPS de manera segura.

## Requisitos Previos

Antes de comenzar, asegúrate de cumplir con los siguientes requisitos:

- Tener Docker y Portainer instalados en tu servidor.
- Caddy configurado como servidor proxy inverso.
- Conexión a internet para descargar las imágenes de Docker.
- Archivo `.env` configurado con las variables de entorno necesarias.

## Configuración del Stack en Portainer

1. Inicia sesión en Portainer.
2. Navega a la sección **Stacks**.
3. Haz clic en **Add Stack** para crear un nuevo stack.
4. Asigna un nombre al stack, por ejemplo, `nextcloud-stack`.

## Variables de Entorno

Crea un archivo `.env` en el mismo directorio que tu archivo `docker-compose.yml` y añade las siguientes variables:

env
MYSQL_ROOT_PASSWORD=your_root_password
MYSQL_PASSWORD=your_db_password
MYSQL_DATABASE=your_database_name
MYSQL_USER=your_database_user
FRONTEND_URL=your_nextcloud_domain_or_ip

# Despliegue del Stack

En la sección **Web editor** de Portainer, referencia el archivo `docker-compose.yml` ubicado en el mismo repositorio. El archivo debe contener la configuración de los servicios necesarios para desplegar Nextcloud y MariaDB. El contenido del archivo `docker-compose.yml` se puede encontrar explorando en los archivo de este repositorio.

Haz clic en **Deploy the stack** para iniciar el despliegue.

# Verificación del Despliegue

- **MariaDB**: Accede a tu servidor y verifica que el puerto `3306` esté abierto y que la base de datos esté funcionando correctamente.
- **Nextcloud**: Accede a la URL especificada en `FRONTEND_URL` para asegurarte de que Nextcloud esté disponible.

# Administración y Mantenimiento

-  Para la administracion y uso de nextcloud dependera estrictamente de las tareas que vayamos a implementar esto de definira al incio por primera vez en el portal web de nextcloud.

## Ver Logs

Puedes verificar los logs de los contenedores directamente desde Portainer para asegurarte de que todo funciona correctamente.

## Referencias
 
- Nextcloud: https://docs.nextcloud.com
- Caddy: https://github.com/lucaslorentz/caddy-docker-proxy 
- MariaDB: https://mariadb.com/kb/en/documentation/