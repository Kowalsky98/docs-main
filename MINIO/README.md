
# MINIO

MINIO es un servicio de almacenamiento de objetos compatible con la api de amazon s3, este servicio es importante solo se use para motivos de desarrollo, se agradece usar instancias de S3 de amazon para producción.



## Requisitos

- Servidor con docker y portainer o algun otro orquestador instalado.
- Caddy configurado como proxy inverso
- Conexión a internet
- archivo .env con las variables de entorno

 ## Configuración del Stack en Portainer

1. Inicia sesión en Portainer.
2. Navega a la sección **Stacks**.
3. Haz clic en **Add Stack** para crear un nuevo stack.
4. Asigna un nombre al stack, por ejemplo, `minio`.
5. Configura las variables de entornos

## Despliegue del Stack

En la sección **Web editor** de Portainer, referencia el archivo `docker-compose.yml` ubicado en el mismo repositorio. El archivo debe contener la configuración de los servicios necesarios para desplegar MINIO El contenido del archivo `docker-compose.yml` se puede encontrar explorando en los archivo de este repositorio.

Haz clic en **Deploy the stack** para iniciar el despliegue.

