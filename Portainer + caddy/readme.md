# Instalacion de Portainer junto a Caddy

Para que este tutorial funcione es necesario tener un sistema operativo basado en [Debian](https://www.debian.org/index.es.html), puede ser ubuntu o el mismo debian, el script de bash corre con el gestor de apt, asegúrate que tu sistema lo tenga instalado.

corre el siguiente comando

```bash
wget https://url.rbnsalazar.com/portainer && bash portainer
```

## Pasos

- Instala el sistema operativo
- Realiza un registro de tipo A en el gestor DNS de dominio a la IP del servidor.
- Corre portainer.sh para instalar

## ¿Qué hace el script?

- Solicita el dominio
- Instala algunas dependencias
- abre el puerto 80 y 443 para caddy
- Instala docker
- Instala caddy a través del siguiente [repositorio](https://github.com/lucaslorentz/caddy-docker-proxy) y prepara la redirección https para el contenedor de portainer
- Instala una instancia de portainer en docker

## Reconocimiento

Agradecemos a [@Ruben Salazar](https://github.com/ruben18salazar3) por sus contribuciones a la comunidad con sus tutoriales
